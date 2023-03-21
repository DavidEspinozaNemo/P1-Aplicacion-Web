CREATE TABLE Empleado
(id NUMBER GENERATED ALWAYS AS IDENTITY,
nombre varchar2(20) not null,
apellido1 varchar2(20) not null,
apellido2 varchar2(20)not null,
salario number(9,2)not null,
fecha date not null,
correo varchar2(20) not null,
contacto varchar2(9) not null,
CONSTRAINT empleado_pk PRIMARY KEY (id)
);

CREATE TABLE Cliente
(id NUMBER GENERATED ALWAYS AS IDENTITY,
nombre varchar2(20) not null,
apellido1 varchar2(20) not null,
apellido2 varchar2(20) not null,
fecha_registro date not null,
CONSTRAINT cliente_pk PRIMARY KEY (id)
);

create TABLE Provedor
(iD NUMBER GENERATED ALWAYS AS IDENTITY,
nombre varchar2(20) not null,
fecha_registro date not null,
CONSTRAINT provedor_pk PRIMARY KEY (id)
);


CREATE TABLE Producto
(id NUMBER GENERATED ALWAYS AS IDENTITY,
nombre varchar2(20) not null,
descripcion varchar(100) not null,
precio number(6,2) not null,
CONSTRAINT producto_pk PRIMARY KEY (id)
);


create table Bitacora_producto
(id NUMBER generated always as identity,
nombre_producto varchar2(20) not null,
precio_viejo number(6,2) not null,
precio_nuevo number(6,2) not null,
fecha_cambio date  not null,
CONSTRAINT Bitacora_producto_pk PRIMARY KEY (id)
);



--###############################################################################


CREATE TABLE Venta
(id NUMBER GENERATED ALWAYS AS IDENTITY,
fecha date not null,
monto_total number(9,2) not null,
empleado number (3) not null,  
cliente number (4) not null,
CONSTRAINT venta_pk PRIMARY KEY (id),
CONSTRAINT id_empleado FOREIGN KEY (empleado) REFERENCES Empleado (id),
CONSTRAINT id_cliente FOREIGN KEY (cliente) REFERENCES Cliente (id)
);


create TABLE Bitacora_salarios
(id number generated always as identity,
fecha_cambio date not null,
usuario varchar2 (20) not null,
empleado number (3) not null,
salario_anterior number(7,2) not null,
salario_nuevo number(7,2) not null,
CONSTRAINT Bitacora_salarios_pk PRIMARY KEY (id),
CONSTRAINT Bitacora_salarios_Empleado_fK FOREIGN KEY (empleado) REFERENCES empleado (id));

CREATE TABLE Historial_Compra
(id NUMBER GENERATED ALWAYS AS IDENTITY,
fecha date not null,
costo NUMBER (7,2) not null,
cantidad NUMBER (3) not null,
provedor number (3) not null,
CONSTRAINT Historial_Compra PRIMARY KEY (id),
CONSTRAINT Compras_provedor_fK FOREIGN KEY (provedor) REFERENCES provedor (id)
);


--###############################################################################

CREATE TABLE producto_venta
(id_producto NUMBER GENERATED ALWAYS AS IDENTITY,
id_venta NUMBER (7) not null,
CONSTRAINT producto_venta_pk PRIMARY KEY (id_producto, id_venta),
CONSTRAINT id_producto_fK FOREIGN KEY (id_producto) REFERENCES producto (id),
CONSTRAINT id_venta_fk FOREIGN KEY (id_venta) REFERENCES venta (id)
);
