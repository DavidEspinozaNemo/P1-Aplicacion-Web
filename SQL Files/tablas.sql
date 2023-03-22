-- DROP TABLE EMPLEADO;

CREATE TABLE Empleado(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre varchar2(20) not null,
    apellido1 varchar2(20) not null,
    apellido2 varchar2(20)not null,
    salario number(9,2)not null,
    fecha date not null,
    correo varchar2(50) not null,
    contacto varchar2(9) not null,
    CONSTRAINT empleado_pk PRIMARY KEY (id)
);

-- DROP TABLE CLIENTE;

CREATE TABLE Cliente(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre varchar2(20) not null,
    apellido1 varchar2(20) not null,
    apellido2 varchar2(20) not null,
    fecha_registro date not null,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

-- DROP TABLE PROVEDOR;

create TABLE Provedor(
    iD NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre varchar2(20) not null,
    fecha_registro date not null,
    CONSTRAINT provedor_pk PRIMARY KEY (id)
);

-- DROP TABLE PRODUCTO;

CREATE TABLE Producto(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre varchar2(20) not null,
    descripcion varchar(100) not null,
    precio number(6,2) not null,
    CONSTRAINT producto_pk PRIMARY KEY (id)
);

-- DROP TABLE BITACORA_PRODUCTO;

create table Bitacora_producto(
    id NUMBER generated always as identity,
    id_producto NUMBER(4) not null,
    precio_viejo number(7,2) not null,
    fecha_cambio date  not null,
    CONSTRAINT Bitacora_producto_pk PRIMARY KEY (id),
    CONSTRAINT Bitacora_producto_fk FOREIGN KEY (id_producto) REFERENCES Producto (id)
);

-- DROP TABLE VENTA;

CREATE TABLE Venta(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    fecha date not null,
    monto_total number(9,2) not null,
    empleado number (3) not null,  
    cliente number (4) not null,
    CONSTRAINT venta_pk PRIMARY KEY (id),
    CONSTRAINT id_empleado FOREIGN KEY (empleado) REFERENCES Empleado (id),
    CONSTRAINT id_cliente FOREIGN KEY (cliente) REFERENCES Cliente (id)
);

-- DROP TABLE BITACORA_SALARIOS;

create TABLE Bitacora_salarios(
    id number generated always as identity,
    fecha_cambio date not null,
    usuario varchar2 (20) not null,
    empleado number (3) not null,
    salario_anterior number(9,2) not null,
    salario_nuevo number(9,2) not null,
    CONSTRAINT Bitacora_salarios_pk PRIMARY KEY (id),
    CONSTRAINT Bitacora_salarios_Empleado_fK FOREIGN KEY (empleado) REFERENCES Empleado (id)
);

-- DROP TABLE HISTORIAL_COMPRA;

CREATE TABLE Historial_Compra(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    fecha date not null,
    costo NUMBER (7,2) not null,
    cantidad NUMBER (3) not null,
    provedor number (3) not null,
    producto number (4) not null,
    CONSTRAINT Historial_Compra PRIMARY KEY (id),
    CONSTRAINT Compras_provedor_fK FOREIGN KEY (provedor) REFERENCES provedor (id),
    CONSTRAINT Compras_producto_fK FOREIGN KEY (producto) REFERENCES producto (id)
);

-- DROP TABLE PRODUCTO_VENTA;

CREATE TABLE producto_venta( 
    id_registro NUMBER GENERATED ALWAYS AS IDENTITY,
    id_producto NUMBER (4) not null,
    id_venta NUMBER (7) not null,
    precio    NUMBER(6) not null,
    cantidad  NUMBER(3) not null,
    CONSTRAINT producto_venta_pk PRIMARY KEY (id_registro),
    CONSTRAINT id_producto_fK FOREIGN KEY (id_producto) REFERENCES producto (id),
    CONSTRAINT id_venta_fk FOREIGN KEY (id_venta) REFERENCES venta (id)
);

-- Datos de Prueba
-- INSERT INTO table() VALUES();
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 01', 'APEL A1', 'APEL B1', 120000.00, '31-12-2000', 'coreo1@gmail.com', '1234-5678');
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 02', 'APEL A2', 'APEL B2', 120000.00, '31-12-2000', 'coreo2@gmail.com', '9012-3456');
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 03', 'APEL A3', 'APEL B3', 120000.00, '31-12-2000', 'coreo3@gmail.com', '7890-1234');
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 04', 'APEL A4', 'APEL B4', 120000.00, '31-12-2000', 'coreo4@gmail.com', '5678-9012');
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 05', 'APEL A5', 'APEL B5', 120000.00, '10-1-2001', 'coreo5@gmail.com', '3456-7890');
INSERT INTO EMPLEADO (nombre, apellido1, apellido2, salario, fecha, correo, contacto)
VALUES('EMP 06', 'APEL A6', 'APEL B6', 120000.00, '10-1-2001', 'coreo6@gmail.com', '0987-6543');

-- SELECT * FROM EMPLEADO;

INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 1', 'APEL C1', 'APEL D2', '1-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 2', 'APEL C2', 'APEL D1', '1-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 3', 'APEL C3', 'APEL D3', '3-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 4', 'APEL C4', 'APEL D4', '4-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 5', 'APEL C5', 'APEL D5', '5-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 6', 'APEL C6', 'APEL D6', '6-1-2001' );
INSERT INTO CLIENTE (nombre, apellido1, apellido2, fecha_registro)
VALUES ('CLI 7', 'APEL C7', 'APEL D7', '10-1-2001' );

-- SELECT * FROM CLIENTE;

INSERT INTO PROVEDOR(nombre, fecha_registro) 
VALUES('GENDANSHO', '20-10-2000');
INSERT INTO PROVEDOR(nombre, fecha_registro) 
VALUES('GERVARO', '20-10-2000');
INSERT INTO PROVEDOR(nombre, fecha_registro) 
VALUES('NOVA VISION', '20-10-2000');
INSERT INTO PROVEDOR(nombre, fecha_registro) 
VALUES('CUTIS FASHION', '20-10-2000');

-- SELECT * FROM PROVEDOR;

INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Jabon 01', 'Un Jabon para la piel muy a la moda', 1200);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Jabon 02', 'Un Jabon para la piel muy a la moda', 1400);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Jabon 03', 'Un Jabon para la piel muy a la moda', 1600);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Shampu 01', 'Un shampu para el cabello muy a la moda', 1200);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Shampu 02', 'Un shampu para el cabello muy a la moda', 1700);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Shampu 03', 'Un shampu para el cabello muy a la moda', 1900);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Manicura 01', 'Un combo para el tratamiento de manos y pies', 5200);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Manicura 02', 'Un combo para el tratamiento de manos y pies', 5600);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Manicura 03', 'Un combo para el tratamiento de manos y pies', 5900);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Corte de Pelo 01', 'Un combo para el corte de pelo', 4400);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Corte de Pelo 02', 'Un combo para el corte de pelo', 4500);
INSERT INTO PRODUCTO(nombre, descripcion, precio) 
VALUES('Corte de Pelo 03', 'Un combo para el corte de pelo', 5200);

-- SELECT * FROM PRODUCTO;

INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(3, 1200, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(4, 1400, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(5, 1600, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(6, 1200, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(7, 1700, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(8, 1900, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(9, 5200, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(10, 5600, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(11, 5900, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(12, 4400, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(13, 4500, '25-10-2000');
INSERT INTO BITACORA_PRODUCTO(id_producto, precio_viejo, fecha_cambio)
VALUES(14, 5200, '25-10-2000');

-- SELECT * FROM BITACORA_PRODUCTO;

INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(3, 5, '15-2-2001', 70000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(4, 3, '15-2-2001', 75000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(3, 6, '15-2-2001', 58000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(2, 7, '15-2-2001', 90300);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(1, 4, '15-5-2002', 34000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(2, 5, '15-4-2002', 15000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(3, 6, '15-2-2002', 28000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(4, 7, '15-4-2002', 48300);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(5, 6, '15-3-2002', 53000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(6, 5, '15-2-2002', 91000);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(1, 4, '15-3-2002', 5800);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(2, 3, '15-4-2002', 90335);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(3, 2, '15-6-2001', 70530);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(4, 1, '15-5-2001', 74200);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(5, 2, '15-5-2001', 56700);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(6, 3, '15-3-2001', 91200);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(5, 4, '15-3-2001', 77800);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(4, 5, '15-3-2001', 75400);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(3, 6, '13-3-2002', 53300);
INSERT INTO VENTA(empleado, cliente, fecha, monto_total) 
VALUES(2, 7, '16-3-2002', 95500);

-- SELECT * FROM VENTA;

INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 1, 0, 120000, '31-12-2000');
INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 2, 0, 120000, '31-12-2000');
INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 3, 0, 120000, '31-12-2000');
INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 4, 0, 120000, '31-12-2000');
INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 5, 0, 120000, '10-1-2001');
INSERT INTO BITACORA_SALARIOS(usuario, empleado, salario_anterior, salario_nuevo, fecha_cambio) 
VALUES('SYSTEM', 6, 0, 120000, '10-1-2001');

-- SELECT * FROM BITACORA_SALARIOS;

INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(1,3,25, 780, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(1,4,56, 345, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(2,5,43, 789, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(2,6,12, 54, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(3,7,86, 123, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(3,8,34, 453, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(4,7,23, 322, '21-10-2000');
INSERT INTO HISTORIAL_COMPRA(provedor, producto, cantidad, costo, fecha ) 
VALUES(4,4,12, 500, '21-10-2000');

-- SELECT * FROM HISTORIAL_COMPRA;

INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(3,21,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(4,22,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(5,23,1200,2);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(6,24,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(7,25,1200,1);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(8,26,1200,7);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(9,27,1200,5);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(10,28,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(11,29,1200,2);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(12,30,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(13,31,1200,9);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(14,32,1200,8);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(13,33,1200,7);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(12,34,1200,5);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(11,35,1200,24);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(10,36,1200,14);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(9,37,1200,14);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(8,38,1200,6);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(7,39,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(6,40,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(5,21,1200,22);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(4,22,1200,5);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(3,23,1200,2);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(5,24,1200,1);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(6,25,1200,2);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(7,26,1200,9);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(3,27,1200,8);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(4,28,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(5,29,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(6,30,1200,2);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(7,31,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(8,32,1200,7);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(9,33,1200,9);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(10,34,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(11,35,1200,6);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(12,36,1200,3);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(13,37,1200,4);
INSERT INTO PRODUCTO_VENTA(id_producto, id_venta, precio, cantidad )
VALUES(14,38,1200,7);

-- SELECT * FROM PRODUCTO_VENTA;
