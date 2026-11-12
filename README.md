# Venta de Dispositivos Electrónicos 🛒💻

Proyecto académico de desarrollo web y base de datos para una tienda de electrónica.

## 🛠️ Tecnologías utilizadas
* **Base de Datos:** MySQL
* **Frontend:** HTML, Bootstrap 5, JavaScript
* **Backend (Próximamente):** Python (Flask)

## 📂 Estructura del Repositorio
* `índice.html`: Interfaz visual y lógica del carrito de compras.
* `Diseño de la Base de Datos...sql`: Script con la creación de tablas, relaciones y datos de prueba.

## 🗄️ Modelo Entidad-Relación (Base de Datos - 13 Tablas)

El esquema está normalizado en Tercera Forma Normal (3FN) y alojado en **TiDB Cloud (MySQL Compatible)**[cite: 2]:

```mermaid
erDiagram
    categorias ||--o{ productos : "clasifica"
    proveedores ||--o{ productos : "abastece"
    productos ||--o{ garantias : "cubre"
    productos ||--o{ detalle_combos : "integra"
    combos ||--o{ detalle_combos : "contiene"
    clientes ||--o{ ventas : "realiza"
    canales ||--o{ ventas : "origina"
    campanias_marketing ||--o{ ventas : "impulsa"
    ventas ||--o{ detalle_ventas : "desglosa"
    productos ||--o{ detalle_ventas : "incluye"
    ventas ||--o{ pagos : "registra"
    ventas ||--o{ envios : "genera"

    categorias {
        int id_categoria PK
        varchar nombre
    }
    proveedores {
        int id_proveedor PK
        varchar nombre
    }
    productos {
        int id_producto PK
        int id_categoria FK
        int id_proveedor FK
        varchar nombre
        decimal precio
        int stock
    }
    combos {
        int id_combo PK
        varchar nombre
        decimal precio_combo
    }
    detalle_combos {
        int id_detalle_combo PK
        int id_combo FK
        int id_producto FK
        int cantidad
    }
    clientes {
        int id_cliente PK
        varchar nombre
        varchar email
    }
    ventas {
        int id_venta PK
        int id_cliente FK
        int id_canal FK
        int id_campania FK
        datetime fecha
        decimal total
    }
    detalle_ventas {
        int id_detalle PK
        int id_venta FK
        int id_producto FK
        int cantidad
        decimal subtotal
    }
    pagos {
        int id_pago PK
        int id_venta FK
        varchar metodo_pago
        decimal monto
    }
    envios {
        int id_envio PK
        int id_venta FK
        varchar codigo_seguimiento
        varchar estado
    }
    garantias {
        int id_garantia PK
        int id_producto FK
        int meses_duracion
    }
    canales {
        int id_canal PK
        varchar nombre
    }
    campanias_marketing {
        int id_campania PK
        varchar nombre
    }
```
