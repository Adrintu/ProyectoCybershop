USE CYBERSHOP;

-- Creamos un trigger que nos actualice el stock de nuestros productos
DELIMITER $$
CREATE TRIGGER Actualiza_stock 
AFTER INSERT ON infopedidos
FOR EACH ROW 
BEGIN
	UPDATE productos
    SET Stock = Stock - NEW.Cantidad
    WHERE ID_Producto = NEW.ID_Producto;
END $$
DELIMITER ;

-- Creamos una función para conocer las ganancias que obtenemos de cada producto
DELIMITER $$
CREATE FUNCTION GananciaObtenida(par_ID_Producto INT) RETURNS NUMERIC(15,2)
DETERMINISTIC
BEGIN
	DECLARE ganancia NUMERIC(15,2);
    SELECT PrecioVenta - PrecioProveedor INTO ganancia
    FROM Productos
    WHERE ID_Producto = par_ID_Producto;
    RETURN ganancia;
END $$
DELIMITER ;

-- Creamos una funcion para calcular el stock total de una gama determinada
DELIMITER $$
CREATE FUNCTION StockGama(par_Gama VARCHAR(40)) RETURNS SMALLINT
DETERMINISTIC
BEGIN
	DECLARE Stock_total INT;
    SELECT SUM(Stock) INTO Stock_total
    FROM Productos
    WHERE Gama = par_Gama;
	RETURN Stock_total;
END $$
DELIMITER ;

-- Creamos un procedimiento para subir o bajar los precios de todos los productos de una gama
DELIMITER $$
CREATE PROCEDURE ActualizarPrecios(par_Gama VARCHAR(40), par_Porcentaje FLOAT)
BEGIN
    UPDATE Productos
    SET PrecioVenta = PrecioVenta * (1 + par_Porcentaje / 100)
    WHERE Gama = par_Gama;
END $$
DELIMITER ;
