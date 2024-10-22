DROP DATABASE IF EXISTS Restaurante;
CREATE DATABASE Restaurante;
USE Restaurante;

-- Tabla: Clientes
CREATE TABLE Clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- Tabla: Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Tabla: Productos
CREATE TABLE Productos (
    id_productos INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Tabla: Stock
CREATE TABLE Stock (
    id_producto INT,
    id_proveedor INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_productos),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Tabla: Pedidos
CREATE TABLE Pedidos (
    id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    id_cliente INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_clientes)
);

-- Tabla: Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedidos),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_productos)
);
