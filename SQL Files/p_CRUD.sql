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
    PROCEDURE eliminar_cliente( v_idcliente number );
    PROCEDURE eliminar_venta( v_idventa number );
    PROCEDURE eliminar_provedor( v_idprovedor number );
    PROCEDURE eliminar_producto_venta( v_id_prod_venta number );
    PROCEDURE eliminar_producto( v_idproducto number );
    PROCEDURE eliminar_empleado( v_idempleado number );
    PROCEDURE eliminar_historial_compra( v_id_hist_compra number );
    PROCEDURE eliminar_bitacora_salario( v_id_bit_salar number );
    PROCEDURE eliminar_bitacora_producto( v_id_bit_prod number );
    PROCEDURE mostrar_info_productos (t_result OUT SYS_REFCURSOR);
    PROCEDURE mostrar_info_productos_cambios (t_result OUT SYS_REFCURSOR);
    PROCEDURE mostrar_info_clientes_compras (t_result OUT SYS_REFCURSOR);
    PROCEDURE mostrar_info_empleados_ventas (t_result OUT SYS_REFCURSOR);
    PROCEDURE mostrar_info_empleados_cambios_salarios (t_result OUT SYS_REFCURSOR);
    PROCEDURE mostrar_info_empleados_aumentos (t_result OUT SYS_REFCURSOR);
END package_CRUD;
/

CREATE OR REPLACE PACKAGE BODY package_CRUD
AS

	PROCEDURE agregar_venta (v_fecha date, v_monto NUMBER, v_EmpleadoID NUMBER, v_clienteID number) as
	BEGIN
		INSERT INTO Venta(fecha, monto_total, empleado, cliente) VALUES (v_fecha, v_monto, v_EmpleadoID, v_clienteID);
        COMMIT;
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
		COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
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
        COMMIT;
	END;
    
    -- proceimientos para borrar los registros
    -- eliminar cliente
    PROCEDURE eliminar_cliente( v_idcliente number )
    IS
    BEGIN
        DELETE FROM Cliente
            WHERE id = v_idcliente;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Cliente eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el cliente');
    END;
    -- eliminar bitacora producto
    PROCEDURE eliminar_bitacora_producto( v_id_bit_prod number )
    IS
    BEGIN
        DELETE FROM bitacora_producto
            WHERE id = v_id_bit_prod;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Registro de la bitacora de producto ha sido eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el registro de la bitacora de producto');
    END;
    -- eliminar bitacora salarios
    PROCEDURE eliminar_bitacora_salario( v_id_bit_salar number )
    IS
    BEGIN
        DELETE FROM bitacora_salarios
            WHERE id = v_id_bit_salar;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Registro de la bitacora de salarios eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el registro de la bitacora de salarios');
    END;
    -- eliminar empleado
    PROCEDURE eliminar_empleado( v_idempleado number )
    IS
    BEGIN
        DELETE FROM empleado
            WHERE id = v_idempleado;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Empleado eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el empleado');
    END;
    -- eliminar historial compra
    PROCEDURE eliminar_historial_compra( v_id_hist_compra number )
    IS
    BEGIN
        DELETE FROM historial_compra
            WHERE id = v_id_hist_compra;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Registro del historial de compra eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el registro del historial de compra');
    END;
    -- eliminar producto
    PROCEDURE eliminar_producto( v_idproducto number )
    IS
    BEGIN
        DELETE FROM producto
            WHERE id = v_idproducto;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Producto eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el producto');
    END;
    -- eliminar producto venta
    PROCEDURE eliminar_producto_venta( v_id_prod_venta number )
    IS
    BEGIN
        DELETE FROM producto_venta
            WHERE id_registro = v_id_prod_venta;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Registro de producto venta eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el registro de producto venta');
    END;
    -- eliminar provedor
    PROCEDURE eliminar_provedor( v_idprovedor number )
    IS
    BEGIN
        DELETE FROM provedor
            WHERE id = v_idprovedor;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Provedor eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el provedor');
    END;
    -- eliminar venta
    PROCEDURE eliminar_venta( v_idventa number )
    IS
    BEGIN
        DELETE FROM venta
            WHERE id = v_idventa;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Venta eliminado exitosamente');
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;        
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el venta');
    END;
    
    -- muestra algunas tablas
    
    PROCEDURE mostrar_info_productos (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT pr.nombre as "PRODUCTO", pr.precio as "PRECIO", SUM(hc.costo) as "COSTOS", SUM(hc.cantidad) as "CANTIDAD", pv.nombre as "FROM"
        FROM historial_compra hc
        INNER JOIN producto pr ON hc.id = pr.id
        INNER JOIN provedor pv ON hc.provedor = pv.id
        GROUP BY pr.nombre, pr.precio, pv.nombre
        ORDER BY pr.nombre, pr.precio, pv.nombre;
    END;
    
    PROCEDURE mostrar_info_productos_cambios (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT pr.nombre as "PRODUCTO", bp.precio_viejo as "PRECIO VIEJO", bp.precio_nuevo as "PRECIO NUEVO",
            (( bp.precio_nuevo - bp.precio_viejo ) / bp.precio_viejo * 100) as "INCREMENTO",
            bp.fecha_cambio as "FECHA CAMBIO"
        FROM bitacora_producto bp
        INNER JOIN producto pr ON bp.id_producto = pr.id
        ORDER BY pr.nombre;
    END;
    
    PROCEDURE mostrar_info_clientes_compras (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT cl.nombre as "CLIENTE", vt.id as "VENTA", vt.monto_total as "TOTAL", pr.nombre as "PRODUCTO",
            pv.precio as "PRECIO", pv.cantidad as "CANTIDAD"
        FROM cliente cl
        INNER JOIN venta vt ON vt.cliente = cl.id
        INNER JOIN producto_venta pv ON pv.id_venta = vt.id
        INNER JOIN producto pr ON pv.id_producto = pr.id
        ORDER BY cl.nombre;
    END;
    
    PROCEDURE mostrar_info_empleados_ventas (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT emp.nombre as "EMPLEADO", emp.apellido1 as "APELLIDO", SUM(pv.precio * pv.cantidad) as "TOTAL", 
            EXTRACT( YEAR FROM vt.fecha ) as "YEAR", EXTRACT( MONTH FROM vt.fecha ) "MONTH", EXTRACT( DAY FROM vt.fecha ) "DAY"
        FROM empleado emp
        INNER JOIN venta vt ON vt.empleado = emp.id
        INNER JOIN producto_venta pv ON vt.id = pv.id_venta
        GROUP BY emp.nombre, emp.apellido1, vt.fecha
        ORDER BY emp.nombre, emp.apellido1, vt.fecha; 
    END;
    
    PROCEDURE mostrar_info_empleados_cambios_salarios (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT emp.nombre as "EMPLEADO", emp.apellido1 as "APELLIDO 1", emp.apellido2 as "APELLIDO 2", emp.salario as "SALARIO ACTUAL",
            emp.correo as "CORREO", emp.contacto as "CONTACTO", EXTRACT( YEAR FROM bs.fecha_cambio ) as "YEAR", EXTRACT( MONTH FROM bs.fecha_cambio ) "MONTH", 
            EXTRACT( DAY FROM bs.fecha_cambio ) "DAY"
        FROM bitacora_salarios bs
        INNER JOIN empleado emp ON bs.empleado = emp.id
        GROUP BY emp.nombre, emp.apellido1, emp.apellido2, bs.fecha_cambio, emp.salario, emp.correo, emp.contacto
        ORDER BY emp.nombre, emp.apellido1, emp.apellido2, bs.fecha_cambio, emp.salario, emp.correo, emp.contacto;
    END;
    
    PROCEDURE mostrar_info_empleados_aumentos (t_result OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN t_result FOR
        SELECT emp.nombre as "EMPLEADO", EXTRACT( YEAR FROM bs.fecha_cambio ) as "YEAR", EXTRACT( MONTH FROM bs.fecha_cambio ) "MONTH", EXTRACT( DAY FROM bs.fecha_cambio ) "DAY",
            SUM(bs.salario_nuevo) / COUNT(bs.salario_nuevo) as "PROMEDIO SALARIO"
        FROM bitacora_salarios bs
        INNER JOIN empleado emp ON bs.empleado = emp.id
        GROUP BY emp.nombre, bs.fecha_cambio, bs.salario_nuevo, bs.salario_anterior
        ORDER BY emp.nombre, bs.fecha_cambio, bs.salario_nuevo, bs.salario_anterior;
    END;
	
END package_CRUD;
/
