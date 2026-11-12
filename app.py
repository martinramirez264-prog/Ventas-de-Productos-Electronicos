import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from flask import Flask, render_template, jsonify, request

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATES_DIR = os.path.join(BASE_DIR, 'templates')

app = Flask(__name__, template_folder=TEMPLATES_DIR, static_folder=BASE_DIR)

DB_CONFIG = {
    'host': os.getenv('MYSQL_HOST', 'localhost'),
    'user': os.getenv('MYSQL_USER', 'root'),
    'password': os.getenv('MYSQL_PASSWORD', ''),
    'database': os.getenv('MYSQL_DATABASE', 'test'),
    'port': int(os.getenv('MYSQL_PORT', 4000)),
    'connect_timeout': 10,
    'ssl_disabled': False
}

def get_db_connection():
    try:
        import mysql.connector
        return mysql.connector.connect(**DB_CONFIG)
    except Exception as e:
        print(f"[DB ERROR] No se pudo conectar a MySQL: {e}")
        return None

def safe_close(conn, cursor=None):
    if cursor:
        try: cursor.close()
        except Exception: pass
    if conn:
        try:
            if conn.is_connected():
                conn.close()
        except Exception: pass

def enviar_comprobante_email(destinatario, nombre_completo, id_venta, nro_seguimiento, total, items_resumen, metodo_pago, direccion_envio):
    remitente = (os.getenv('SMTP_EMAIL') or '').strip()
    password = (os.getenv('SMTP_PASSWORD') or '').replace(' ', '').strip()

    if not remitente or not password or not destinatario:
        print(f"[SMTP ERROR] Faltan datos -> remitente: {bool(remitente)}, pass: {bool(password)}, dest: '{destinatario}'")
        return False

    filas_html = ""
    for item in items_resumen:
        filas_html += f"""
        <tr>
            <td style="padding: 12px 10px; border-bottom: 1px solid #1e293b; color: #e2e8f0; font-size: 14px;">
                {item['nombre']} <span style="color: #94a3b8;">(x{item['cantidad']})</span>
            </td>
            <td style="padding: 12px 10px; border-bottom: 1px solid #1e293b; color: #38bdf8; text-align: right; font-weight: bold; font-size: 14px;">
                ${item['subtotal']:,.2f}
            </td>
        </tr>
        """

    html_cuerpo = f"""
    <div style="font-family: 'Segoe UI', Arial, sans-serif; max-width: 600px; margin: 20px auto; background-color: #0f172a; color: #f8fafc; border-radius: 14px; overflow: hidden; border: 1px solid #1e293b;">
        <div style="background: linear-gradient(135deg, #0284c7, #1d4ed8); padding: 28px 24px; text-align: center;">
            <h1 style="margin: 0; font-size: 26px; letter-spacing: 1.5px; color: #ffffff;">⚡ ELECTROTECH</h1>
            <p style="margin: 8px 0 0; font-size: 15px; color: #e0f2fe; font-weight: 500;">¡Tu compra fue procesada con éxito!</p>
        </div>
        
        <div style="padding: 28px 24px;">
            <p style="font-size: 16px; margin-top: 0; color: #f8fafc;">Hola <strong>{nombre_completo}</strong>,</p>
            <p style="color: #cbd5e1; line-height: 1.6; font-size: 14px;">
                Confirmamos la recepción de tu pago. Ya estamos preparando tu pedido en nuestro centro logístico para despacharlo a la brevedad.
            </p>
            
            <div style="background-color: #1e293b; border-radius: 10px; padding: 16px 20px; margin: 22px 0; border-left: 4px solid #38bdf8;">
                <p style="margin: 5px 0; font-size: 14px; color: #e2e8f0;"><strong>Orden de Compra:</strong> #{id_venta}</p>
                <p style="margin: 5px 0; font-size: 14px; color: #e2e8f0;"><strong>Código de Seguimiento:</strong> <span style="color: #38bdf8; font-family: monospace; font-size: 15px; background: #0f172a; padding: 2px 6px; border-radius: 4px;">{nro_seguimiento}</span></p>
                <p style="margin: 5px 0; font-size: 14px; color: #e2e8f0;"><strong>Método de Pago:</strong> {metodo_pago} (<span style="color: #4ade80;">Aprobado</span>)</p>
                <p style="margin: 5px 0; font-size: 14px; color: #e2e8f0;"><strong>Dirección de Entrega:</strong> {direccion_envio or 'Retiro / A coordinar'}</p>
            </div>

            <table style="width: 100%; border-collapse: collapse; margin-top: 18px;">
                <thead>
                    <tr>
                        <th style="text-align: left; padding: 10px; border-bottom: 2px solid #334155; color: #94a3b8; font-size: 12px; letter-spacing: 0.5px;">PRODUCTO / COMBO</th>
                        <th style="text-align: right; padding: 10px; border-bottom: 2px solid #334155; color: #94a3b8; font-size: 12px; letter-spacing: 0.5px;">SUBTOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    {filas_html}
                </tbody>
            </table>

            <div style="text-align: right; margin-top: 20px; padding-top: 14px; border-top: 1px solid #334155; font-size: 18px; color: #f8fafc;">
                <strong>Total Pagado: <span style="color: #4ade80;">${float(total):,.2f}</span></strong>
            </div>
        </div>

        <div style="background-color: #020617; padding: 18px; text-align: center; font-size: 12px; color: #64748b; line-height: 1.5;">
            Gracias por elegir <strong>ElectroTech</strong>.<br>
            Comprobante electrónico generado automáticamente • Buenos Aires, Argentina.
        </div>
    </div>
    """

    msg = MIMEMultipart("alternative")
    msg["Subject"] = f"✅ ¡Compra #{id_venta} confirmada! - ElectroTech"
    msg["From"] = f"ElectroTech Store <{remitente}>"
    msg["To"] = destinatario
    msg.attach(MIMEText(html_cuerpo, "html"))

    try:
        with smtplib.SMTP_SSL("smtp.gmail.com", 465, timeout=10) as server:
            server.login(remitente, password)
            server.sendmail(remitente, destinatario, msg.as_string())
        print(f"[SMTP OK] Correo enviado correctamente a {destinatario}")
        return True
    except Exception as e:
        print(f"[SMTP ERROR] Fallo al enviar a {destinatario}: {e}")
        return False

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/categorias', methods=['GET'])
def get_categorias():
    conn = get_db_connection()
    if not conn:
        return jsonify([]), 200
    cursor = None
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT id_categoria AS id, nombre FROM categorias")
        categorias = cursor.fetchall()
        safe_close(conn, cursor)
        return jsonify(categorias)
    except Exception:
        safe_close(conn, cursor)
        return jsonify([]), 200

@app.route('/api/productos', methods=['GET'])
def get_productos():
    conn = get_db_connection()
    if not conn:
        return jsonify([]), 200
    cursor = None
    try:
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
        safe_close(conn, cursor)
        return jsonify(productos)
    except Exception:
        safe_close(conn, cursor)
        return jsonify([]), 200

@app.route('/api/combos', methods=['GET'])
def get_combos():
    conn = get_db_connection()
    if not conn:
        return jsonify([]), 200
    cursor = None
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT id_combo AS id, nombre, descripcion, precio FROM combos")
        combos = cursor.fetchall()
        for c in combos:
            c['precio'] = float(c['precio'])
            c_cursor = conn.cursor(dictionary=True)
            c_cursor.execute("""
                SELECT id_producto AS p, cantidad AS c 
                FROM detalle_combos 
                WHERE id_combo = %s
            """, (c['id'],))
            c['items'] = c_cursor.fetchall()
            try: c_cursor.close()
            except Exception: pass
        safe_close(conn, cursor)
        return jsonify(combos)
    except Exception:
        safe_close(conn, cursor)
        return jsonify([]), 200

@app.route('/api/ventas', methods=['POST'])
def registrar_venta():
    data = request.get_json() or {}
    cliente = data.get('cliente', {})
    total = float(data.get('total', 0))
    detalles = data.get('detalle', [])
    pago = data.get('pago', {})
    envio = data.get('envio', {})

    nombre_cliente = f"{cliente.get('nombre', '')} {cliente.get('apellido', '')}".strip() or "Cliente"
    email_cliente = (cliente.get('email') or '').strip()
    metodo_pago = pago.get('metodo', 'Mercado Pago')
    direccion_envio = envio.get('direccion_envio', '')

    if not detalles:
        return jsonify({'success': False, 'error': 'El carrito está vacío'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'success': False, 'error': 'No se pudo conectar a la base de datos TiDB Cloud'}), 503

    cursor = None
    try:
        conn.start_transaction()
        cursor = conn.cursor(dictionary=True)

        # 1. Buscar o crear cliente
        cursor.execute("SELECT id_cliente FROM clientes WHERE email = %s", (email_cliente,))
        cliente_existente = cursor.fetchone()

        if cliente_existente:
            id_cliente = cliente_existente['id_cliente']
            cursor.execute("""
                UPDATE clientes SET nombre = %s, apellido = %s, direccion = %s
                WHERE id_cliente = %s
            """, (cliente.get('nombre'), cliente.get('apellido'), direccion_envio, id_cliente))
        else:
            cursor.execute("""
                INSERT INTO clientes (nombre, apellido, email, tipo_cliente, direccion)
                VALUES (%s, %s, %s, 'Usuario Final', %s)
            """, (cliente.get('nombre'), cliente.get('apellido'), email_cliente, direccion_envio))
            id_cliente = cursor.lastrowid

        # 2. Insertar cabecera de venta
        cursor.execute("""
            INSERT INTO ventas (id_cliente, estado, total)
            VALUES (%s, 'Pagada', %s)
        """, (id_cliente, total))
        id_venta = cursor.lastrowid

        items_resumen = []

        # 3. Insertar detalle completo (productos individuales y desglose de combos)
        for item in detalles:
            cant = int(item.get('cantidad', 1))
            precio_u = float(item.get('precio_unitario', 0))

            if item.get('tipo') == 'p':
                cursor.execute("SELECT nombre, stock FROM productos WHERE id_producto = %s", (item['id'],))
                prod_row = cursor.fetchone()
                if not prod_row:
                    raise ValueError(f"Producto ID {item['id']} no encontrado")

                cursor.execute("""
                    INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario)
                    VALUES (%s, %s, %s, %s)
                """, (id_venta, item['id'], cant, precio_u))

                cursor.execute("""
                    UPDATE productos SET stock = GREATEST(0, stock - %s) WHERE id_producto = %s
                """, (cant, item['id']))

                items_resumen.append({
                    'nombre': prod_row['nombre'],
                    'cantidad': cant,
                    'subtotal': precio_u * cant
                })

            elif item.get('tipo') == 'c':
                cursor.execute("SELECT nombre, precio FROM combos WHERE id_combo = %s", (item['id'],))
                combo_row = cursor.fetchone()
                nombre_combo = combo_row['nombre'] if combo_row else item.get('nombre', f"Combo #{item['id']}")

                cursor.execute("""
                    SELECT dc.id_producto, dc.cantidad, p.nombre, p.precio
                    FROM detalle_combos dc
                    JOIN productos p ON dc.id_producto = p.id_producto
                    WHERE dc.id_combo = %s
                """, (item['id'],))
                productos_combo = cursor.fetchall()

                suma_individual = sum(float(pc['precio']) * int(pc['cantidad']) for pc in productos_combo) or 1
                factor_descuento = precio_u / suma_individual

                nombres_incluidos = []
                for pc in productos_combo:
                    cant_total = int(pc['cantidad']) * cant
                    precio_unitario_prorrateado = round(float(pc['precio']) * factor_descuento, 2)

                    cursor.execute("""
                        INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario)
                        VALUES (%s, %s, %s, %s)
                    """, (id_venta, pc['id_producto'], cant_total, precio_unitario_prorrateado))

                    cursor.execute("""
                        UPDATE productos SET stock = GREATEST(0, stock - %s) WHERE id_producto = %s
                    """, (cant_total, pc['id_producto']))

                    nombres_incluidos.append(f"{pc['cantidad']}x {pc['nombre']}")

                detalle_texto = f"{nombre_combo} ({', '.join(nombres_incluidos)})"
                items_resumen.append({
                    'nombre': detalle_texto,
                    'cantidad': cant,
                    'subtotal': precio_u * cant
                })

        # 4. Registrar pago
        cursor.execute("""
            INSERT INTO pagos (id_venta, metodo, monto, estado)
            VALUES (%s, %s, %s, 'Aprobado')
        """, (id_venta, metodo_pago, total))

        # 5. Registrar envío
        nro_seguimiento = f"AR{id_venta:08d}"
        cursor.execute("""
            INSERT INTO envios (id_venta, empresa_logistica, numero_seguimiento, direccion_envio, estado)
            VALUES (%s, 'Logística Express', %s, %s, 'Preparando')
        """, (id_venta, nro_seguimiento, direccion_envio))

        conn.commit()
        safe_close(conn, cursor)

        email_enviado = enviar_comprobante_email(
            destinatario=email_cliente,
            nombre_completo=nombre_cliente,
            id_venta=id_venta,
            nro_seguimiento=nro_seguimiento,
            total=total,
            items_resumen=items_resumen,
            metodo_pago=metodo_pago,
            direccion_envio=direccion_envio
        )

        return jsonify({
            'success': True,
            'id_venta': id_venta,
            'numero_seguimiento': nro_seguimiento,
            'email_enviado': email_enviado,
            'detalle': items_resumen
        }), 201

    except Exception as e:
        if conn:
            try: conn.rollback()
            except Exception: pass
        print(f"[VENTAS ERROR] Excepcion en transaccion SQL: {e}")
        safe_close(conn, cursor)
        return jsonify({'success': False, 'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)