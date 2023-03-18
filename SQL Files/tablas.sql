CREATE TABLE Empleado
(id NUMBER (3),
nombre varchar2(20),
apellido1 varchar2(20),
apellido2 varchar2(20),
salario number(9,2),
fecha date,
correo varchar2(20),
contacto varchar2(9),
CONSTRAINT empleado_pk PRIMARY KEY (id)
);

CREATE TABLE Cliente
(id NUMBER (4),
nombre varchar2(20),
apellido1 varchar2(20),
apellido2 varchar2(20),
fecha_registro date,
CONSTRAINT cliente_pk PRIMARY KEY (id)
);

CREATE TABLE Provedor
(id NUMBER (3),
nombre varchar2(20),
fecha_registro date,
CONSTRAINT provedor_pk PRIMARY KEY (id)
);

CREATE TABLE Producto
(id NUMBER (3),
nombre varchar2(20),
descripcion varchar(100),
precio number(6,2),
CONSTRAINT producto_pk PRIMARY KEY (id)
);





--###############################################################################


CREATE TABLE Venta
(id NUMBER (7),
fecha date,
monto_total number(9,2),
empleado number (3), 
cliente number (4),
CONSTRAINT venta_pk PRIMARY KEY (id),
CONSTRAINT id_empleado FOREIGN KEY (empleado) REFERENCES Empleado (id),
CONSTRAINT id_cliente FOREIGN KEY (cliente) REFERENCES Cliente (id)
);


CREATE TABLE Bitacora_salarios
(id number(3),
fecha_cambio date,
usuario varchar2 (20),
empleado number (3),
CONSTRAINT Bitacora_salarios_pk PRIMARY KEY (id),
CONSTRAINT Bitacora_salarios_Empleado_fK FOREIGN KEY (empleado) REFERENCES empleado (id));

CREATE TABLE Historial_Compra
(id number(7),
fecha date,
costo NUMBER (7,2),
cantidad NUMBER (3),
provedor number (3),
CONSTRAINT Historial_Compra PRIMARY KEY (id),
CONSTRAINT Compras_provedor_fK FOREIGN KEY (provedor) REFERENCES provedor (id)
);


--###############################################################################

CREATE TABLE producto_venta
(id_producto NUMBER (3),
id_venta NUMBER (7),
CONSTRAINT producto_venta_pk PRIMARY KEY (id_producto, id_venta),
CONSTRAINT id_producto_fK FOREIGN KEY (id_producto) REFERENCES producto (id),
CONSTRAINT id_venta_fk FOREIGN KEY (id_venta) REFERENCES venta (id)
);
