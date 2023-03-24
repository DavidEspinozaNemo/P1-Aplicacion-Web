CREATE TABLE Empleado(
    id NUMBER default secuenciaEmpleado.nextval,
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
    id NUMBER default secuenciaCliente.nextval,
    nombre varchar2(20) not null,
    apellido1 varchar2(20) not null,
    apellido2 varchar2(20) not null,
    fecha_registro date not null,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

-- DROP TABLE PROVEDOR;

create TABLE Provedor(
    id NUMBER default secuenciaProvedor.nextval,
    nombre varchar2(20) not null,
    fecha_registro date not null,
    CONSTRAINT provedor_pk PRIMARY KEY (id)
);

-- DROP TABLE PRODUCTO;

CREATE TABLE Producto(
    id NUMBER default secuenciaProducto.nextval,
    nombre varchar2(20) not null,
    descripcion varchar(100) not null,
    precio number(6,2) not null,
    CONSTRAINT producto_pk PRIMARY KEY (id)
);

-- DROP TABLE BITACORA_PRODUCTO;

create table Bitacora_producto(
    id NUMBER default secuencia_BP.nextval,
    id_producto NUMBER(4) not null,
    precio_viejo number(7,2) not null,
    nombre_producto varchar2(20) not null,
    precio_nuevo number(7,2) not null,
    fecha_cambio date  not null,
    CONSTRAINT Bitacora_producto_pk PRIMARY KEY (id),
    CONSTRAINT Bitacora_producto_fk FOREIGN KEY (id_producto) REFERENCES Producto (id)
);

-- DROP TABLE VENTA;

CREATE TABLE Venta(
    id NUMBER default secuenciVenta.nextval,
    fecha date not null,
    monto_total number(9,2) not null,
    empleado number (3) not null,  
    cliente number (4) not null,
    CONSTRAINT venta_pk PRIMARY KEY (id),
    CONSTRAINT id_empleado FOREIGN KEY (empleado) REFERENCES Empleado (id),
    CONSTRAINT id_cliente FOREIGN KEY (cliente) REFERENCES Cliente (id)
);

-- DROP TABLE HISTORIAL_COMPRA;

CREATE TABLE Historial_Compra(
    id NUMBER default secuenciaHC.nextval,
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
    id_registro NUMBER default secuenciaPV.nextval,
    id_producto NUMBER (4) not null,
    id_venta NUMBER (7) not null,
    precio    NUMBER(6) not null,
    cantidad  NUMBER(3) not null,
    CONSTRAINT producto_venta_pk PRIMARY KEY (id_registro),
    CONSTRAINT id_producto_fK FOREIGN KEY (id_producto) REFERENCES producto (id),
    CONSTRAINT id_venta_fk FOREIGN KEY (id_venta) REFERENCES venta (id)
);

create TABLE Bitacora_salarios(
    id NUMBER default secuencia_BS.nextval,
    fecha_cambio date not null,
    usuario varchar2 (20) not null,
    empleado number (3) not null,
    salario_anterior number(9,2) not null,
    salario_nuevo number(9,2) not null,
    CONSTRAINT Bitacora_salarios_pk PRIMARY KEY (id),
    CONSTRAINT Bitacora_salarios_Empleado_fK FOREIGN KEY (empleado) REFERENCES Empleado (id)
);