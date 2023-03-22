CREATE OR REPLACE PACKAGE package_CRUD AS
    PROCEDURE agregar_venta (v_fecha date, v_monto NUMBER, v_EmpleadoID NUMBER, v_clienteID number);
    PROCEDURE agregar_empleado (v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_salario number, v_fecha date, v_correo varchar2, v_contacto varchar2);
    PROCEDURE agregar_cliente (v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_fecha date);
    PROCEDURE agregar_provedor (v_nombre varchar2,v_fecha date);
    PROCEDURE agregar_producto (v_nombre varchar2,v_descripcion varchar2, v_precio number);
    PROCEDURE agregar_hcompra (v_fecha date,v_costo number, v_cantidad number, v_provedorID number);
    PROCEDURE agregar_productoV (v_productoID number,v_ventaID number, v_precio number, v_cantidad number);
    PROCEDURE modificar_proveedor(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_fecha DATE DEFAULT SYSDATE);
    PROCEDURE modificar_producto(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_precio NUMBER DEFAULT 0, v_descp VARCHAR2 DEFAULT 'NULL');
    PROCEDURE modificar_cliente(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_apellido1 VARCHAR2 DEFAULT 'NULL',  v_apellido2 VARCHAR2 DEFAULT 'NULL');
    PROCEDURE modificar_empleado(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_apellido1 VARCHAR2 DEFAULT 'NULL', v_apellido2 VARCHAR2 DEFAULT 'NULL', v_salario NUMBER DEFAULT 0, v_correo VARCHAR2 DEFAULT 'NULL', v_contacto VARCHAR2 DEFAULT 'NULL');
END package_CRUD;
/

CREATE OR REPLACE PACKAGE BODY package_CRUD
AS

	PROCEDURE agregar_venta (v_fecha date, v_monto NUMBER, v_EmpleadoID NUMBER, v_clienteID number) as
	BEGIN
		INSERT INTO Venta(fecha, monto_total, empleado, cliente) VALUES (v_fecha, v_monto, v_EmpleadoID, v_clienteID);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar la venta');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_empleado (v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_salario number, v_fecha date, v_correo varchar2, v_contacto varchar2) as
	BEGIN
		INSERT INTO Empleado(nombre, apellido1, apellido2, salario, fecha, correo, contacto) VALUES (v_nombre, v_apellido1, v_apellido2, v_salario, v_fecha, v_correo, v_contacto);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al empleado');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_cliente (v_nombre varchar2, v_apellido1 varchar2, v_apellido2 varchar2, v_fecha date) as
	BEGIN
		INSERT INTO Cliente(nombre, apellido1, apellido2, fecha_registro) VALUES (v_nombre, v_apellido1, v_apellido2, v_fecha);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al cliente');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_provedor (v_nombre varchar2,v_fecha date) as
	BEGIN
		INSERT INTO Provedor(nombre, fecha_registro) VALUES (v_nombre, v_fecha);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar al provedor');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_producto (v_nombre varchar2,v_descripcion varchar2, v_precio number) as
	BEGIN
		INSERT INTO Producto(nombre, descripcion, precio) VALUES (v_nombre, v_descripcion, v_precio);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar el producto');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_hcompra (v_fecha date,v_costo number, v_cantidad number, v_provedorID number) as
	BEGIN
		INSERT INTO Historial_Compra(fecha, costo, cantidad, provedor) VALUES (v_fecha, v_costo, v_cantidad, v_provedorID);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar la bitacora');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;

	PROCEDURE agregar_productoV (v_productoID number,v_ventaID number, v_precio number, v_cantidad number) as
	BEGIN
		INSERT INTO producto_venta(id_producto, id_venta, precio, cantidad ) VALUES (v_productoID, v_ventaID, v_precio, v_cantidad);
		EXCEPTION WHEN OTHERS THEN
		IF SQLCODE=-1 THEN
			DBMS_OUTPUT.put_line ('Ha ocurrido un error al registrar el producto a la venta');
		ELSE
			DBMS_OUTPUT.put_line (SQLERRM);
		END IF;
	END;
	
	-- procedimiento para modificar
	
	PROCEDURE modificar_proveedor(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_fecha DATE DEFAULT SYSDATE) AS
		nombre_original VARCHAR2(20);
	BEGIN
        IF v_nombre = 'NULL' THEN
            SELECT Provedor.nombre INTO nombre_original FROM Provedor
            WHERE Provedor.id = v_id;
        ELSE
            nombre_original := v_nombre;
        END IF;
		
		UPDATE Provedor
		SET
			nombre = nombre_original,
			fecha_registro = v_fecha
		WHERE
			Provedor.id = v_id;
	END;
	
	PROCEDURE modificar_producto(v_id NUMBER, v_nombre VARCHAR2 DEFAULT 'NULL', v_precio NUMBER DEFAULT 0, v_descp VARCHAR2 DEFAULT 'NULL') AS
		nombre_original VARCHAR2(20);
		descripcion_original VARCHAR2(100);
		precio_original NUMBER(6,2);
	BEGIN
        IF v_nombre = 'NULL' THEN
            SELECT Producto.nombre INTO nombre_original FROM Producto
            WHERE Producto.id = v_id;
        ELSE
            nombre_original := v_nombre;
        END IF;
        
		IF v_descp = 'NULL' THEN
            SELECT Producto.descripcion INTO descripcion_original FROM Producto
            WHERE Producto.id = v_id;
        ELSE
            descripcion_original := v_descp;
        END IF;
		
		IF v_precio = 0 THEN
            SELECT Producto.precio INTO precio_original FROM Producto
            WHERE Producto.id = v_id;
        ELSE
            precio_original := v_precio;
        END IF;
		
		UPDATE Producto
		SET
			nombre =  nombre_original,
			descripcion = descripcion_original,
			precio = precio_original
		WHERE
			Producto.id = v_id;
	END;
	
	PROCEDURE modificar_cliente(v_id NUMBER, 
        v_nombre VARCHAR2 DEFAULT 'NULL', 
        v_apellido1 VARCHAR2 DEFAULT 'NULL',
        v_apellido2 VARCHAR2 DEFAULT 'NULL') 
    AS
		nombre_original VARCHAR2(20);
		apellido1_original VARCHAR2(20);
		apellido2_original VARCHAR2(20);
	BEGIN
		
        IF v_nombre = 'NULL' THEN
            SELECT nombre INTO nombre_original FROM Cliente
            WHERE id = v_id;
        ELSE
            nombre_original := v_nombre;
        END IF;
        
        IF v_apellido1 = 'NULL' THEN
            SELECT apellido1 INTO apellido1_original FROM Cliente
            WHERE id = v_id;
        ELSE
            apellido1_original := v_apellido1;
        END IF;
        
        IF v_apellido2 = 'NULL' THEN
            SELECT apellido2 INTO apellido2_original FROM Cliente
            WHERE id = v_id;
        ELSE
            apellido2_original := v_apellido2;
        END IF;
		
		UPDATE Cliente
		SET
			nombre = nombre_original,
			apellido1 = apellido1_original,
			apellido2 = apellido2_original
		WHERE
			id = v_id;
	END;
	
	PROCEDURE modificar_empleado(v_id NUMBER, 
        v_nombre VARCHAR2 DEFAULT 'NULL', 
        v_apellido1 VARCHAR2 DEFAULT 'NULL', 
        v_apellido2 VARCHAR2 DEFAULT 'NULL', 
        v_salario NUMBER DEFAULT 0, 
        v_correo VARCHAR2 DEFAULT 'NULL', 
        v_contacto VARCHAR2 DEFAULT 'NULL') 
    AS
		nombre_original VARCHAR2(20);
		apellido1_original VARCHAR2(20);
		apellido2_original VARCHAR2(20);
		salario_original NUMBER(9,2);
		correo_original VARCHAR2(20);
		contacto_original VARCHAR2(9);
	BEGIN
        IF v_nombre = 'NULL' THEN
            SELECT nombre INTO nombre_original FROM Empleado
            WHERE id = v_id;
        ELSE
            nombre_original := v_nombre;
        END IF;
        
        IF v_apellido1 = 'NULL' THEN
            SELECT apellido1 INTO apellido1_original FROM Empleado
            WHERE id = v_id;
        ELSE
            apellido1_original := v_apellido1;
        END IF;
        
        IF v_apellido2 = 'NULL' THEN
            SELECT apellido2 INTO apellido2_original FROM Empleado
            WHERE id = v_id;
        ELSE
            apellido2_original := v_apellido2;
        END IF;
		
		IF v_salario = 0 THEN
            SELECT salario INTO salario_original FROM Empleado
            WHERE id = v_id;
        ELSE
            salario_original := v_salario;
        END IF;
		
		IF v_correo = 'NULL' THEN
            SELECT correo INTO correo_original FROM Empleado
            WHERE id = v_id;
        ELSE
            correo_original := v_correo;
        END IF;
		
		IF v_contacto = 'NULL' THEN
            SELECT contacto INTO contacto_original FROM Empleado
            WHERE id = v_id;
        ELSE
            contacto_original := v_contacto;
        END IF;
		
		UPDATE Empleado
		SET
			nombre = nombre_original,
			apellido1 = apellido1_original,
			apellido2 = apellido2_original,
			salario = salario_original,
			correo = correo_original,
			contacto = contacto_original
		WHERE
			id = v_id;
	END;
	
END package_CRUD;
/
