CREATE TABLE Empleado
(id NUMBER (3) NOT NULL,
nombre varchar2(20) NOT NULL,
apellido1 varchar2(20) NOT NULL,
apellido2 varchar2(20) NOT NULL,
salario number(9,2) NOT NULL,
fecha date NOT NULL,
correo varchar2(20) NOT NULL,
contacto varchar2(9) NOT NULL,
CONSTRAINT empleado_pk PRIMARY KEY (id)
);

CREATE TABLE Cliente
(id NUMBER (4) NOT NULL,
nombre varchar2(20) NOT NULL,
apellido1 varchar2(20) NOT NULL,
apellido2 varchar2(20) NOT NULL,
fecha_registro date NOT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (id)
);

CREATE TABLE Provedor
(id NUMBER (3) NOT NULL,
nombre varchar2(20) NOT NULL,
fecha_registro date NOT NULL,
CONSTRAINT provedor_pk PRIMARY KEY (id)
);

CREATE TABLE Producto
(id NUMBER (3) NOT NULL,
nombre varchar2(20) NOT NULL,
descripcion varchar(100) NOT NULL,
precio number(6,2) NOT NULL,
CONSTRAINT producto_pk PRIMARY KEY (id)
);





--###############################################################################


CREATE TABLE Venta
(id NUMBER (7) NOT NULL,
fecha date NOT NULL,
monto_total number(9,2) NOT NULL,
empleado number (3) NOT NULL, 
cliente number (4) NOT NULL,
CONSTRAINT venta_pk PRIMARY KEY (id),
CONSTRAINT id_empleado FOREIGN KEY (empleado) REFERENCES Empleado (id),
CONSTRAINT id_cliente FOREIGN KEY (cliente) REFERENCES Cliente (id)
);


CREATE TABLE Bitacora_salarios
(id number(3) NOT NULL,
fecha_cambio date NOT NULL,
usuario varchar2 (20) NOT NULL,
empleado number (3) NOT NULL,
CONSTRAINT Bitacora_salarios_pk PRIMARY KEY (id),
CONSTRAINT Bitacora_salarios_Empleado_fK FOREIGN KEY (empleado) REFERENCES empleado (id));

CREATE TABLE Historial_Compra
(id number(7) NOT NULL,
fecha date NOT NULL,
costo NUMBER (7,2) NOT NULL,
cantidad NUMBER (3) NOT NULL,
provedor number (3) NOT NULL,
CONSTRAINT Historial_Compra PRIMARY KEY (id),
CONSTRAINT Compras_provedor_fK FOREIGN KEY (provedor) REFERENCES provedor (id)
);


--###############################################################################

CREATE TABLE producto_venta
(id_producto NUMBER (3) NOT NULL,
id_venta NUMBER (7) NOT NULL,
CONSTRAINT producto_venta_pk PRIMARY KEY (id_producto, id_venta),
CONSTRAINT id_producto_fK FOREIGN KEY (id_producto) REFERENCES producto (id),
CONSTRAINT id_venta_fk FOREIGN KEY (id_venta) REFERENCES venta (id)
);
