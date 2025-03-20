CREATE DATABASE CYBERSHOP; 
USE CYBERSHOP;

CREATE TABLE Productos ( 
ID_Producto INT PRIMARY KEY, 
Nombre_Producto VARCHAR(70) NOT NULL, 
Proveedor VARCHAR(50) NOT NULL, 
PrecioVenta NUMERIC(15,2) NOT NULL, 
PrecioProveedor NUMERIC(15,2) DEFAULT NULL, 
Stock SMALLINT NOT NULL, 
Gama VARCHAR(40) NOT NULL,
Descripcion text NULL 
);

INSERT INTO Productos VALUES (1001, 'MSI Cyborg 15', 'Esprinet', 1100.00, 950.00, 30, 'Portatil', '' );
INSERT INTO Productos VALUES (1002, 'HP 15', 'PcComponentes', 550.00, 470.00, 35, 'Portatil', 'Sistema Operativo Windows 11' );
INSERT INTO Productos VALUES (1003, 'Lenovo IdeaPad Slim 3', 'Infortisa', 670.00, 600.00, 33, 'Portatil', 'Sistema Operativo Windows 11 Home' );
INSERT INTO Productos VALUES (1004, 'Apple MacBook Air', 'Infortisa', 1480.00, 1250.00, 20, 'Portatil', 'Pantalla retroiluminada por LED de 13,6 pulgadas' );
INSERT INTO Productos VALUES (1005, 'PcCom Ready', 'PcComponentes', 1030.00, 850.00, 20, 'PC', 'Procesador: Intel Core i5-12400F 2.5 GHz' );
INSERT INTO Productos VALUES (1006, 'PcCom Imperial', 'PcComponentes', 2500.00, 2200.00, 15, 'PC', 'Procesador: AMD Ryzen 7 7800X3D 4.2 GHz/5 GHz' );
INSERT INTO Productos VALUES (1007, 'PcCom Lite', 'PcComponentes', 860.00, 740.00, 40, 'PC', 'Procesador: AMD Ryzen 5 5500 3.6GHz ' );
INSERT INTO Productos VALUES (1008, 'Logitech G G203', 'MediaMarkt', 35.00, 25.00, 250, 'Raton', ' Transmision por cable ' );
INSERT INTO Productos VALUES (1009, 'Logitech G Pro', 'MediaMarkt', 165.00, 135.00, 150, 'Raton', ' Transmision Inalambrica ' );
INSERT INTO Productos VALUES (1010, 'Trust GXT 110', 'MediaMarkt', 20.00, 12.00, 320, 'Raton', ' Transmision Inalambrica ' );
INSERT INTO Productos VALUES (1011, 'Logitech G413 SE', 'Amazon', 95.00, 55.00, 210, 'Teclado', ' Color menta ' );
INSERT INTO Productos VALUES (1012, 'Logitech G413 TKL', 'Amazon', 85.00, 50.00, 240, 'Teclado', ' Color negro ' );
INSERT INTO Productos VALUES (1013, 'Logitech MX', 'Amazon', 137.00, 90.00, 160, 'Teclado', ' Color grafito ' );
INSERT INTO Productos VALUES (1014, 'Logitech Pebble', 'Amazon', 59.00, 30.00, 180, 'Teclado', ' Color blanco ' );
INSERT INTO Productos VALUES (1015, 'PcCom Elysium Go', 'PcComponentes', 132.00, 99.00, 190, 'Monitor', ' 165hz ' );
INSERT INTO Productos VALUES (1016, 'Alurin 24', 'PcComponentes', 124.00, 85.00, 215, 'Monitor', ' 100hz ' );
INSERT INTO Productos VALUES (1017, 'Samsung Odyssey G3', 'PcComponentes', 138.00, 95.00, 160, 'Monitor', ' 180hz ' );

CREATE TABLE Usuarios ( 
ID_Usuario INT PRIMARY KEY, 
Nombre VARCHAR(30) NOT NULL, 
Apellidos VARCHAR(50) NOT NULL, 
Contraseña VARCHAR(20) NOT NULL, 
Correo VARCHAR(40) NOT NULL, 
Telefono VARCHAR(9) NOT NULL
);

INSERT INTO Usuarios VALUES (101, 'Lazaro',	'Martin de la Cruz', 'Cmadrid21', 'lazaromartin2005@gmail.com',	'653782244');
INSERT INTO Usuarios VALUES (102, 'Alejandro', 'Cuenca Prieto',	'Cmadrid21', 'acuenca.prieto@gmail.com', '609227542');
INSERT INTO Usuarios VALUES (103, 'Adrian',	'Fernandez Martin',	'Cmadrid21', 'adrianpopeter123@gmail.com', '662445232');

 CREATE TABLE Pedidos ( 
 ID_Pedido INT NOT NULL, 
 Fecha_Pedido DATE NOT NULL, 
 Estado VARCHAR(15) NOT NULL, 
 ID_Usuario INT NOT NULL, 
 PRIMARY KEY (ID_Pedido), 
 CONSTRAINT Pedidos_Usuarios FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (Id_Usuario) 
 );

INSERT INTO Pedidos VALUES (2001, '2025-03-02' , 'Pendiente', 101);
INSERT INTO Pedidos VALUES (2002, '2025-02-24' , 'Entregado', 102);
INSERT INTO Pedidos VALUES (2003, '2025-02-22' , 'Rechazado', 102);
INSERT INTO Pedidos VALUES (2004, '2025-02-16' , 'Entregado', 103);
INSERT INTO Pedidos VALUES (2005, '2025-03-08' , 'Pendiente', 102);
INSERT INTO Pedidos VALUES (2006, '2025-02-02' , 'Entregado', 103);
INSERT INTO Pedidos VALUES (2007, '2025-02-10' , 'Rechazado', 101);
INSERT INTO Pedidos VALUES (2008, '2025-01-19' , 'Entregado', 102);
INSERT INTO Pedidos VALUES (2009, '2025-01-30' , 'Rechazado', 103);
INSERT INTO Pedidos VALUES (2010, '2025-01-09' , 'Entregado', 101);
INSERT INTO Pedidos VALUES (2011, '2025-03-10' , 'Pendiente', 102);
 
  CREATE TABLE InfoPedidos ( 
  ID_Pedido INT NOT NULL, 
  ID_Producto INT NOT NULL, 
  Cantidad INT NOT NULL, 
  PrecioUnidad NUMERIC(15,2) NOT NULL, 
  PRIMARY KEY (ID_Pedido, ID_Producto), 
  CONSTRAINT InfoPedidos_Pedidos FOREIGN KEY (ID_Pedido) REFERENCES Pedidos (Id_Pedido), 
  CONSTRAINT InfoPedidos_Productos FOREIGN KEY (ID_Producto) REFERENCES Productos (Id_Producto) 
  );
  
  INSERT INTO InfoPedidos VALUES (2001, 1002, 2, 550.00);
  INSERT INTO InfoPedidos VALUES (2002, 1008, 10, 35.00);
  INSERT INTO InfoPedidos VALUES (2003, 1012, 7, 85.00);
  INSERT INTO InfoPedidos VALUES (2004, 1001, 1, 1100.00);
  INSERT INTO InfoPedidos VALUES (2005, 1004, 2, 1480.00);
  INSERT INTO InfoPedidos VALUES (2006, 1015, 3, 132.00);
  INSERT INTO InfoPedidos VALUES (2007, 1017, 5, 138.00);
  INSERT INTO InfoPedidos VALUES (2008, 1009, 4, 165.00);
  INSERT INTO InfoPedidos VALUES (2009, 1003, 1, 670.00);
  INSERT INTO InfoPedidos VALUES (2010, 1006, 1, 2500.00);
  INSERT INTO InfoPedidos VALUES (2011, 1005, 2, 1030.00);
  
  CREATE TABLE Ventas (
  ID_Usuario INT NOT NULL, 
  Metodo_Pago VARCHAR(40) NOT NULL, 
  ID_Transaccion VARCHAR(50) NOT NULL, 
  FechaPago DATE NOT NULL, 
  Cantidad_V NUMERIC(15,2) NOT NULL, 
  PRIMARY KEY (ID_Usuario, ID_Transaccion), 
  CONSTRAINT Pagos_Usuarios FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (Id_Usuario) 
  );
  
  INSERT INTO Ventas VALUES (101, 'Tarjeta de Credito', 'V1', '2025-03-02', 1100.00);
  INSERT INTO Ventas VALUES (102, 'Paypal', 'V2', '2025-02-24', 350.00);
  INSERT INTO Ventas VALUES (103, 'Tarjeta de Credito', 'V3', '2025-02-16', 1100.00);
  INSERT INTO Ventas VALUES (102, 'Tarjeta de Debito', 'V4', '2025-03-08', 2960.00);
  INSERT INTO Ventas VALUES (103, 'Tarjeta de Credito', 'V5', '2025-02-02', 396.00);
  INSERT INTO Ventas VALUES (102, 'Paypal', 'V6', '2025-01-19', 660.00);
  INSERT INTO Ventas VALUES (101, 'Paypal', 'V7', '2025-01-09', 2500.00);
  INSERT INTO Ventas VALUES (102, 'Tarjeta de Credito', 'V8', '2025-03-10', 2060.00);

  
