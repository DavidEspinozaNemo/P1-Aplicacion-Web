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


--###############################################################################

-- En este paquete van las operaciones CRUD
CREATE OR REPLACE PACKAGE package_CRUD
IS
	CREATE OR REPLACE PROCEDURE agregar_venta (v_id, v_fecha date, v_monto NUMBER, v_EmpleadoID NUMBER, v_clienteID number) as
	BEGIN
		INSERT INTO Venta VALUES (v_id, v_fecha, v_monto, v_EmpleadoID, v_clienteID);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar la venta');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_empleado (v_id number,v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_salario number, v_fecha date) as
	BEGIN
		INSERT INTO Empleado VALUES (v_id, v_nombre, v_apellido1, v_apellido2, v_salario, v_fecha);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al empleado');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_cliente (v_id number,v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_fecha date) as
	BEGIN
		INSERT INTO Cliente VALUES (v_id, v_nombre, v_apellido1, v_apellido2, v_fecha);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al cliente');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_provedor (v_id number,v_nombre varchar2,v_fecha date) as
	BEGIN
		INSERT INTO Provedor VALUES (v_id, v_nombre, v_fecha);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al provedor');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_producto (v_id number,v_nombre varchar2,v_descripcion varchar2, v_precio number) as
	BEGIN
		INSERT INTO Poducto VALUES (v_id, v_nombre, v_descripcion, v_precio);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar el producto');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_hcompra (v_id number,v_fecha date,v_costo number, v_cantidad number, v_provedorID number) as
	BEGIN
		INSERT INTO Poducto VALUES (v_id, v_fecha, v_costo, v_cantidad, v_provedorID);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar la bitacora');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	CREATE OR REPLACE PROCEDURE agregar_productoV (v_productoID number,v_ventaID number) as
	BEGIN
		INSERT INTO producto_venta VALUES (v_productoID, v_ventaID);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar el producto a la venta');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;
	
	-- procedimiento para modificar
	
	CREATE OR REPLACE PROCEDURE modificar_proveedor(v_id NUMBER, v_nombre VARCHAR2, v_fecha DATE) AS
	DECLARE
		nombre_original VARCHAR2(20);
		fecha_original DATE;
	BEGIN
		SELECT nombre INTO nombre_original FROM Provedor
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT fecha_registro INTO fecha_original FROM Provedor
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		UPDATE Provedor
		SET
			nombre = NULLIF(v_nombre, nombre_original),
			fecha_registro = NULLIF(v_fecha, fecha_original),
		WHERE
			id = v_id AND
			v_id IS NOT NULL;
	END;
	
	CREATE OR REPLACE PROCEDURE modificar_producto(v_id NUMBER, v_nombre VARCHAR2, v_precio NUMBER, v_descp VARCHAR2) AS
	DECLARE
		nombre_original VARCHAR2(20);
		descripcion_original VARCHAR2(100);
		precio_original NUMBER(6,2);
	BEGIN
		SELECT nombre INTO nombre_original FROM Producto
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT descripcion INTO descripcion_original FROM Producto
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT precio INTO precio_original FROM Producto
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		UPDATE Producto
		SET
			nombre = NULLIF(v_nombre, nombre_original),
			descripcion = NULLIF(v_descp, descripcion_original),
			precio_original = NULLIF(v_precio, precio_original),
		WHERE
			id = v_id AND
			v_id IS NOT NULL;
	END;
	
	CREATE OR REPLACE PROCEDURE modificar_cliente(v_id NUMBER, v_nombre VARCHAR2, v_apellido1 VARCHAR2,  v_apellido2 VARCHAR2) AS
	DECLARE
		nombre_original VARCHAR2(20);
		apellido1_original VARCHAR2(20);
		apellido2_original VARCHAR2(20);
	BEGIN
		SELECT nombre INTO nombre_original FROM Cliente
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT apellido1 INTO apellido1_original FROM Cliente
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT apellido2 INTO apellido2_original FROM Cliente
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		UPDATE Cliente
		SET
			nombre = NULLIF(v_nombre, nombre_original),
			apellido1 = NULLIF(v_apellido1, apellido1_original),
			apellido2 = NULLIF(v_apellido2, apellido2_original),
		WHERE
			id = v_id AND
			v_id IS NOT NULL;
	END;
	
	CREATE OR REPLACE PROCEDURE modificar_empleado(v_id NUMBER, v_nombre VARCHAR2, v_apellido1 VARCHAR2,
		v_apellido2 VARCHAR2, v_salario NUMBER, v_correo VARCHAR2, v_contacto VARCHAR2) AS
	DECLARE
		nombre_original VARCHAR2(20);
		apellido1_original VARCHAR2(20);
		apellido2_original VARCHAR2(20);
		salario_original NUMBER(9,2);
		correo_original VARCHAR2(20);
		contacto_original VARCHAR2(9);
	BEGIN
		SELECT nombre INTO nombre_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT apellido1 INTO apellido1_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT apellido2 INTO apellido2_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT salario INTO salario_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT correo INTO correo_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		SELECT contacto INTO contacto_original FROM Empleado
		WHERE id = v_id AND	v_id IS NOT NULL;
		
		UPDATE Empleado
		SET
			nombre = NULLIF(v_nombre, nombre_original),
			apellido1 = NULLIF(v_apellido1, apellido1_original),
			apellido2 = NULLIF(v_apellido2, apellido2_original),
			salario = NULLIF(v_salario, salario_original),
			correo = NULLIF(v_correo, correo_original),
			contacto = NULLIF(v_contacto, contacto_original),
		WHERE
			id = v_id AND
			v_id IS NOT NULL;
	END;
	
END package_CRUD;