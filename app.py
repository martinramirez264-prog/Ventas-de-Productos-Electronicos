import os
from flask import Flask, render_template, jsonify, request
import mysql.connector

# Obtener la ruta absoluta de la carpeta donde está app.py
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATES_DIR = os.path.join(BASE_DIR, 'templates')

app = Flask(__name__, template_folder=TEMPLATES_DIR)

DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',          # Modificá por tu usuario de MySQL
    'password': '',          # Modificá por tu contraseña de MySQL
    'database': 'venta_productos_electronicos'
}

def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/categorias', methods=['GET'])
def get_categorias():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id_categoria AS id, nombre FROM categorias")
    categorias = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(categorias)

@app.route('/api/productos', methods=['GET'])
def get_productos():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
        SELECT 
            id_producto AS id, 
            nombre, 
            descripcion, 
            marca, 
            precio, 
            stock, 
            garantia_meses AS garantia, 
            id_categoria AS cat 
        FROM productos
    """
    cursor.execute(query)
    productos = cursor.fetchall()
    for p in productos:
        p['precio'] = float(p['precio'])
    cursor.close()
    conn.close()
    return jsonify(productos)

@app.route('/api/combos', methods=['GET'])
def get_combos():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id_combo AS id, nombre, descripcion, precio FROM combos")
    combos = cursor.fetchall()
    for c in combos:
        c['precio'] = float(c['precio'])
        cursor.execute("""
            SELECT id_producto AS p, cantidad AS c 
            FROM detalle_combos 
            WHERE id_combo = %s
        """, (c['id'],))
        c['items'] = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(combos)

@app.route('/api/ventas', methods=['POST'])
def registrar_venta():
    data = request.get_json()
    cliente = data.get('cliente', {})
    total = data.get('total', 0)
    detalles = data.get('detalle', [])
    pago = data.get('pago', {})
    envio = data.get('envio', {})

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute("SELECT id_cliente FROM clientes WHERE email = %s", (cliente['email'],))
        cliente_existente = cursor.fetchone()

        if cliente_existente:
            id_cliente = cliente_existente['id_cliente']
        else:
            cursor.execute("""
                INSERT INTO clientes (nombre, apellido, email, tipo_cliente, direccion)
                VALUES (%s, %s, %s, 'Usuario Final', %s)
            """, (cliente['nombre'], cliente['apellido'], cliente['email'], envio.get('direccion_envio', '')))
            id_cliente = cursor.lastrowid

        cursor.execute("""
            INSERT INTO ventas (id_cliente, estado, total)
            VALUES (%s, 'Pagada', %s)
        """, (id_cliente, total))
        id_venta = cursor.lastrowid

        for item in detalles:
            if item['tipo'] == 'p':
                cursor.execute("""
                    INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario)
                    VALUES (%s, %s, %s, %s)
                """, (id_venta, item['id'], item['cantidad'], item['precio_unitario']))
                cursor.execute("""
                    UPDATE productos SET stock = stock - %s WHERE id_producto = %s
                """, (item['cantidad'], item['id']))
            elif item['tipo'] == 'c':
                cursor.execute("""
                    SELECT id_producto, cantidad FROM detalle_combos WHERE id_combo = %s
                """, (item['id'],))
                productos_combo = cursor.fetchall()
                for pc in productos_combo:
                    cant_total = pc['cantidad'] * item['cantidad']
                    cursor.execute("""
                        UPDATE productos SET stock = stock - %s WHERE id_producto = %s
                    """, (cant_total, pc['id_producto']))

        cursor.execute("""
            INSERT INTO pagos (id_venta, metodo, monto, estado)
            VALUES (%s, %s, %s, 'Aprobado')
        """, (id_venta, pago.get('metodo', 'Mercado Pago'), total))

        nro_seguimiento = f"AR{id_venta:08d}"
        cursor.execute("""
            INSERT INTO envios (id_venta, empresa_logistica, numero_seguimiento, direccion_envio, estado)
            VALUES (%s, 'Logística Express', %s, %s, 'Preparando')
        """, (id_venta, nro_seguimiento, envio.get('direccion_envio', '')))

        conn.commit()
        return jsonify({'success': True, 'id_venta': id_venta, 'numero_seguimiento': nro_seguimiento}), 201

    except Exception as e:
        conn.rollback()
        return jsonify({'success': False, 'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True)