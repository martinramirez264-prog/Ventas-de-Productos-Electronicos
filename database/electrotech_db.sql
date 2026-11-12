USE test;

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(30),
    email VARCHAR(150),
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30),
    tipo_cliente VARCHAR(50) NOT NULL,
    direccion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    marca VARCHAR(100),
    precio DECIMAL(12,2) NOT NULL,
    stock INT DEFAULT 0,
    garantia_meses INT DEFAULT 0,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    total DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

CREATE TABLE IF NOT EXISTS envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    empresa_logistica VARCHAR(150),
    numero_seguimiento VARCHAR(100),
    direccion_envio VARCHAR(250),
    fecha_envio DATETIME,
    fecha_entrega DATETIME,
    estado VARCHAR(50) DEFAULT 'Preparando',
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

CREATE TABLE IF NOT EXISTS garantias (
    id_garantia INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_reclamo DATE,
    motivo TEXT,
    estado VARCHAR(50) DEFAULT 'Solicitada',
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS canales (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS campanias_marketing (
    id_campania INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    plataforma VARCHAR(100),
    presupuesto DECIMAL(12,2),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE IF NOT EXISTS combos (
    id_combo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(12,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS detalle_combos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_combo INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_combo) REFERENCES combos(id_combo),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO categorias (nombre, descripcion) VALUES
('Notebooks', 'Computadoras portátiles'),
('Celulares', 'Teléfonos celulares'),
('Periféricos', 'Mouse, teclados y accesorios'),
('Monitores', 'Monitores profesionales y gaming'),
('Accesorios', 'Fundas, cables y otros accesorios');

INSERT INTO proveedores (nombre_empresa, contacto, telefono, email, tipo) VALUES
('Distribuidora Tech Argentina', 'Juan Pérez', '1111111111', 'ventas@tech.com', 'Distribuidor'),
('Mayorista Electrónica', 'Carlos Gómez', '2222222222', 'contacto@mayorista.com', 'Mayorista'),
('Servicio Técnico Oficial', 'María López', '3333333333', 'soporte@serviciotecnico.com', 'Servicio Técnico'),
('Logística Express', 'Pedro García', '4444444444', 'envios@logistica.com', 'Logística');

INSERT INTO productos (nombre, descripcion, marca, precio, stock, garantia_meses, id_categoria, id_proveedor) VALUES
('Notebook Gamer', 'Notebook de alto rendimiento para trabajo y gaming', 'Lenovo', 1500000.00, 10, 12, 1, 1),
('Notebook HP 15', 'Laptop ultraligera Intel Core i5 16GB RAM SSD 512GB', 'HP', 1150000.00, 12, 12, 1, 1),
('MacBook Air M2', 'Laptop Apple Chip M2 pantalla Retina 13.6 pulgadas', 'Apple', 2100000.00, 6, 12, 1, 1),
('Celular Redmi A3', 'Smartphone libre con pantalla fluida de 90Hz', 'Xiaomi', 900000.00, 15, 12, 2, 1),
('Samsung Galaxy A55', 'Smartphone 5G pantalla Super AMOLED 120Hz 128GB', 'Samsung', 750000.00, 12, 12, 2, 1),
('Motorola Moto G84', 'Celular libre pantalla OLED 256GB RAM 8GB', 'Motorola', 520000.00, 15, 12, 2, 1),
('iPhone 15 128GB', 'Pantalla Super Retina XDR Chip A16 Bionic cámara 48MP', 'Apple', 1850000.00, 5, 12, 2, 1),
('Monitor Profesional', 'Monitor IPS 24 pulgadas Full HD', 'LG', 500000.00, 8, 12, 3, 2),
('Monitor Gaming 144Hz', 'Monitor curvo 27 pulgadas Full HD 1ms Freesync', 'Samsung', 680000.00, 10, 12, 3, 2),
('Monitor UltraWide 34"', 'Monitor panorámico 2K para productividad y edición', 'LG', 920000.00, 5, 12, 3, 2),
('Auriculares Inalámbricos TWS', 'Auriculares Bluetooth 5.3 con estuche de carga', 'Xiaomi', 45000.00, 35, 12, 4, 2),
('Auriculares de Casco (Vincha)', 'Auriculares Bluetooth con almohadillas acolchadas', 'Logitech', 75000.00, 20, 12, 4, 2),
('Mouse Gamer RGB', 'Mouse óptico de alta precisión con cable', 'Logitech', 80000.00, 30, 12, 4, 2),
('Mouse Bluetooth Ergonómico', 'Mouse inalámbrico silencioso para laptop', 'Logitech', 38000.00, 45, 12, 4, 2),
('Cargador Carga Rápida 33W', 'Cargador de pared de alta velocidad Tipo-C', 'Xiaomi', 35000.00, 40, 6, 5, 2),
('Funda Protectora Antigolpes', 'Funda de silicona reinforced en esquinas', 'Genérica', 25000.00, 50, 6, 5, 2),
('Vidrio Templado 9D', 'Protector de pantalla ultra resistente anti-rayaduras', 'Genérica', 8000.00, 100, 3, 5, 2),
('Tarjeta MicroSD 128GB', 'Almacenamiento de alta velocidad Clase 10 Ultra', 'SanDisk', 22000.00, 60, 12, 5, 2),
('Bateria externa de 10000 mAh', 'Bateria portátil de carga rápida doble USB', 'Redmi', 42000.00, 30, 6, 5, 2);

INSERT INTO combos (nombre, descripcion, precio) VALUES
('Kit Redmi A3 Full Pack', '¡Experiencia completa! Incluye Celular Redmi A3 + Cargador Rápido 33W + Funda + Vidrio Templado + MicroSD 128GB + Bateria externa de 10000 mAh.', 980000.00),
('Kit Notebook Gamer Completo', 'Notebook Gamer + Cargador + Auriculares de Casco + Mouse Bluetooth inalámbrico con descuento.', 1580000.00);

INSERT INTO detalle_combos (id_combo, id_producto, cantidad) VALUES
(1, 4, 1), (1, 15, 1), (1, 16, 1), (1, 17, 1), (1, 18, 1), (1, 19, 1),
(2, 1, 1), (2, 15, 1), (2, 12, 1), (2, 14, 1);