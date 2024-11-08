CREATE DATABASE db_store_socket;

use db_store_socket;

CREATE TABLE productos
(
	idproducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre		VARCHAR(80) NOT NULL,
    tipo		VARCHAR(80) NOT NULL,
    precio		DECIMAL(7,2) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT NOW()
)
ENGINE = INNODB;

INSERT INTO productos (nombre, tipo, precio) VALUES
('Laptop Dell XPS 13', 'Computadora', 999.99),
('Smartphone Samsung Galaxy S23', 'Electrónica', 799.50),
('Auriculares Sony WH-1000XM5', 'Audio', 350.00),
('Televisor Samsung 55" 4K', 'Electrodoméstico', 750.00),
('Cafetera Nespresso Essenza Mini', 'Electrodoméstico', 129.99),
('Monitor LG UltraWide 34"', 'Computadora', 379.00),
('Tableta Apple iPad Air', 'Electrónica', 499.99),
('Reloj inteligente Garmin Venu 2', 'Accesorios', 249.99),
('Bicicleta de montaña Trek Marlin 7', 'Deportes', 650.00),
('Cámara Canon EOS 90D', 'Fotografía', 1199.99);

select*from productos;

DELIMITER $$
CREATE PROCEDURE sp_list_products
(
)
BEGIN
	SELECT*FROM productos;
END $$

DELIMITER $$
CREATE PROCEDURE sp_add_prod
(
    IN _nombre VARCHAR(80),
    IN _tipo VARCHAR(80),
    IN _precio DECIMAL(7,2)
)
BEGIN
	INSERT INTO productos (nombre, tipo, precio) VALUES
    (_nombre, _tipo, _precio);
END $$

