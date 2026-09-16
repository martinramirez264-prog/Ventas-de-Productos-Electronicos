-- =====================================================
-- BASE DE DATOS: VENTA DE PRODUCTOS ELECTRÓNICOS
-- =====================================================

DROP DATABASE IF EXISTS venta_productos_electronicos;

CREATE DATABASE venta_productos_electronicos;

USE venta_productos_electronicos;


-- =====================================================
-- 1. CATEGORÍAS
-- =====================================================

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);


-- =====================================================
-- 2. PROVEEDORES
-- =====================================================

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(30),
    email VARCHAR(150),
    tipo VARCHAR(50) NOT NULL
);


-- =====================================================
-- 3. CLIENTES
-- =====================================================

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30),
    tipo_cliente VARCHAR(50) NOT NULL,
    direccion VARCHAR(200)
);


-- =====================================================
-- 4. PRODUCTOS
-- =====================================================

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    marca VARCHAR(100),
    precio DECIMAL(12,2) NOT NULL,
    stock INT DEFAULT 0,
    garantia_meses INT DEFAULT 0,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,

    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria),

    FOREIGN KEY (id_proveedor)
        REFERENCES proveedores(id_proveedor)
);


-- =====================================================
-- 5. VENTAS
-- =====================================================

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    total DECIMAL(12,2) DEFAULT 0,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);


-- =====================================================
-- 6. DETALLE DE VENTAS
-- =====================================================

CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- =====================================================
-- 7. PAGOS
-- =====================================================

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',

    FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
);


-- =====================================================
-- 8. ENVÍOS
-- =====================================================

CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    empresa_logistica VARCHAR(150),
    numero_seguimiento VARCHAR(100),
    direccion_envio VARCHAR(250),
    fecha_envio DATETIME,
    fecha_entrega DATETIME,
    estado VARCHAR(50) DEFAULT 'Preparando',

    FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
);


-- =====================================================
-- 9. GARANTÍAS
-- =====================================================

CREATE TABLE garantias (
    id_garantia INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_reclamo DATE,
    motivo TEXT,
    estado VARCHAR(50) DEFAULT 'Solicitada',

    FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- =====================================================
-- 10. CANALES
-- =====================================================

CREATE TABLE canales (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);


-- =====================================================
-- 11. CAMPAÑAS DE MARKETING
-- =====================================================

CREATE TABLE campanias_marketing (
    id_campania INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    plataforma VARCHAR(100),
    presupuesto DECIMAL(12,2),
    fecha_inicio DATE,
    fecha_fin DATE
);


-- =====================================================
-- 12. COMBOS
-- =====================================================

CREATE TABLE combos (
    id_combo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(12,2) NOT NULL
);


-- =====================================================
-- 13. DETALLE DE COMBOS
-- =====================================================

CREATE TABLE detalle_combos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_combo INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,

    FOREIGN KEY (id_combo)
        REFERENCES combos(id_combo),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- =====================================================
-- INSERTAR CATEGORÍAS
-- =====================================================

INSERT INTO categorias (nombre, descripcion)
VALUES
('Notebooks', 'Computadoras portátiles'),
('Celulares', 'Teléfonos celulares'),
('Periféricos', 'Mouse, teclados y accesorios'),
('Monitores', 'Monitores profesionales y gaming'),
('Accesorios', 'Fundas, cables y otros accesorios');


-- =====================================================
-- INSERTAR PROVEEDORES
-- =====================================================

INSERT INTO proveedores
(nombre_empresa, contacto, telefono, email, tipo)
VALUES
('Distribuidora Tech Argentina', 'Juan Pérez', '1111111111',
 'ventas@tech.com', 'Distribuidor'),

('Mayorista Electrónica', 'Carlos Gómez', '2222222222',
 'contacto@mayorista.com', 'Mayorista'),

('Servicio Técnico Oficial', 'María López', '3333333333',
 'soporte@serviciotecnico.com', 'Servicio Técnico'),

('Logística Express', 'Pedro García', '4444444444',
 'envios@logistica.com', 'Logística');


-- =====================================================
-- INSERTAR CLIENTES
-- =====================================================

INSERT INTO clientes
(nombre, apellido, email, telefono, tipo_cliente, direccion)
VALUES
('Martín', 'Ramírez', 'martin@email.com', '1111111111',
 'Usuario Final', 'Buenos Aires'),

('Juan', 'Gómez', 'juan@email.com', '2222222222',
 'Profesional/Creador', 'Buenos Aires'),

('Empresa', 'Tecnológica', 'empresa@email.com', '3333333333',
 'Empresa B2B', 'Buenos Aires');


-- =====================================================
-- INSERTAR PRODUCTOS
-- =====================================================

INSERT INTO productos
(nombre, descripcion, marca, precio, stock, garantia_meses,
 id_categoria, id_proveedor)
VALUES
('Notebook Gamer',
 'Notebook de alto rendimiento',
 'Lenovo', 1500000.00, 10, 12, 1, 1),

('Celular Pro',
 'Celular de alta gama',
 'Samsung', 900000.00, 15, 12, 2, 1),

('Mouse Gamer',
 'Mouse para gaming',
 'Logitech', 80000.00, 30, 12, 3, 2),

('Monitor Profesional',
 'Monitor de alto rendimiento',
 'LG', 500000.00, 8, 12, 4, 2),

('Funda para celular',
 'Funda protectora',
 'Genérica', 25000.00, 50, 6, 5, 2);


-- =====================================================
-- INSERTAR VENTA DE EJEMPLO
-- =====================================================

INSERT INTO ventas
(id_cliente, estado, total)
VALUES
(1, 'Pagada', 1580000.00);


-- =====================================================
-- DETALLE DE LA VENTA
-- =====================================================

INSERT INTO detalle_ventas
(id_venta, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 1, 1500000.00),
(1, 3, 1, 80000.00);


-- =====================================================
-- PAGO
-- =====================================================

INSERT INTO pagos
(id_venta, metodo, monto, estado)
VALUES
(1, 'Mercado Pago', 1580000.00, 'Aprobado');


-- =====================================================
-- ENVÍO
-- =====================================================

INSERT INTO envios
(id_venta,
 empresa_logistica,
 numero_seguimiento,
 direccion_envio,
 estado)
VALUES
(1,
 'Logística Express',
 'AR123456789',
 'Buenos Aires',
 'En tránsito');


-- =====================================================
-- GARANTÍA DE EJEMPLO
-- =====================================================

INSERT INTO garantias
(id_venta, id_producto, fecha_reclamo, motivo, estado)
VALUES
(1, 1, '2026-09-09',
 'Problema con el equipo',
 'Solicitada');


-- =====================================================
-- CANALES
-- =====================================================

INSERT INTO canales
(nombre, tipo, descripcion)
VALUES
('Tienda Online', 'E-commerce',
 'Tienda online propia'),

('Instagram', 'Red Social',
 'Publicación y demostración de productos'),

('TikTok', 'Red Social',
 'Videos y demostraciones'),

('Google Ads', 'Publicidad',
 'Publicidad digital'),

('WhatsApp', 'Atención al Cliente',
 'Soporte directo en tiempo real');


-- =====================================================
-- CAMPAÑA DE MARKETING
-- =====================================================

INSERT INTO campanias_marketing
(nombre, plataforma, presupuesto, fecha_inicio, fecha_fin)
VALUES
('Promoción Electrónica 2026',
 'Google Ads',
 150000.00,
 '2026-09-01',
 '2026-09-30');


-- =====================================================
-- COMBO
-- =====================================================

INSERT INTO combos
(nombre, descripcion, precio)
VALUES
('Kit Notebook Completo',
 'Notebook + Mouse + Funda',
 1605000.00);


-- =====================================================
-- PRODUCTOS DEL COMBO
-- =====================================================

INSERT INTO detalle_combos
(id_combo, id_producto, cantidad)
VALUES
(1, 1, 1),
(1, 3, 1),
(1, 5, 1);


-- =====================================================
-- CONSULTAS PARA COMPROBAR QUE FUNCIONA
-- =====================================================

SELECT * FROM categorias;

SELECT * FROM proveedores;

SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM ventas;

SELECT * FROM detalle_ventas;

SELECT * FROM pagos;

SELECT * FROM envios;

SELECT * FROM garantias;

SELECT * FROM canales;

SELECT * FROM campanias_marketing;

SELECT * FROM combos;

SELECT * FROM detalle_combos;