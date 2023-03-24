CREATE OR REPLACE PACKAGE package_assistant AS
    PROCEDURE get_best_seller (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_less_sold (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_greater_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_customers_more_shopping (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_employees_more_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_total_sales_per_month (t_result OUT SYS_REFCURSOR);
    FUNCTION ventas_mes(v_fecha IN VARCHAR2) RETURN NUMBER;
    PROCEDURE obtener_empleados;
    PROCEDURE obtener_BitacoraP;
    PROCEDURE obtener_BitacoraS;
    PROCEDURE obtener_clientes;
    PROCEDURE obtener_HistorialCompra;
    PROCEDURE obtener_Productos;
    PROCEDURE obtener_ProductosVentas;
    PROCEDURE obtener_Provedor;
    PROCEDURE obtener_Ventas;
END package_assistant;
/

CREATE OR REPLACE PACKAGE BODY package_assistant
AS
    --Productos mas vendidos 
    PROCEDURE get_best_seller (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select PRODUCTO.NOMBRE, COUNT(*) as vendidos
        from producto_venta 
        JOIN producto on producto_venta.ID_PRODUCTO = producto.ID
        GROUP BY PRODUCTO.NOMBRE
        order by vendidos desc
        FETCH NEXT 10 ROWS ONLY;
    END;
    
    --Productos menos vendidos 
    PROCEDURE get_less_sold (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select PRODUCTO.NOMBRE, COUNT(*) as vendidos
        from producto_venta 
        JOIN producto on producto_venta.ID_PRODUCTO = producto.ID 
        GROUP BY PRODUCTO.NOMBRE
        order by vendidos ASC
        FETCH next 10 ROWS ONLY;
    END;
    
    --Mayores ventas
    PROCEDURE get_greater_sales (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select e.nombre , c.nombre, v.monto_total, v.fecha
        from venta v
        join empleado e on v.empleado = e.id
        join cliente c on v.cliente = c.id
        order by monto_total desc;
    END;

    --Clientes que mas compran
    PROCEDURE get_customers_more_shopping (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select c.id, c.nombre , count(*) as compras
        from venta v
        join cliente c on v.cliente = c.id
        group by c.id, c.nombre
        order by compras desc;
    END;
    
    --Empleados con mas ventas
    PROCEDURE get_employees_more_sales (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select e.id, e.nombre , count(*) as ventas
        from venta v
        join empleado e on v.cliente = e.id
        group by e.id, e.nombre
        order by ventas desc;
    END;


    --Ventas totales por mes
    PROCEDURE get_total_sales_per_month (t_result OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN t_result FOR
        select EXTRACT(MONTH FROM  fecha) AS mes, sum(monto_total) as ventas
        from venta
        group by EXTRACT(MONTH FROM  fecha)
        order by ventas desc;
    END;
    
    -- Funcion que resive una fecha en VARCHAR2 y devuelve el total de ventas por el mes indicado
    FUNCTION ventas_mes(v_fecha IN VARCHAR2)
    RETURN NUMBER
    IS
      v_mes DATE;
      v_total NUMBER;
    BEGIN
      -- Convertir el mes en formato de fecha
      v_mes := TO_DATE( v_fecha, 'DD-MON-YYYY');
      
      -- Calcular el total de ventas del mes
      SELECT SUM(v.monto_total)
      INTO v_total
      FROM Venta v
      INNER JOIN producto_venta pv ON pv.id_venta = v.id
      WHERE TO_CHAR(v.fecha, 'MM-YYYY') = TO_CHAR(v_mes, 'MM-YYYY');
      
      -- Devolver el total de ventas
      RETURN v_total;
      
    END ventas_mes;
    
    PROCEDURE obtener_empleados AS
    BEGIN  
        FOR empleados IN (SELECT * FROM EMPLEADO)
        LOOP    -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores
            DBMS_OUTPUT.PUT_LINE(empleados.ID || '-' || empleados.nombre || '-' ||empleados.apellido1 || '-' || empleados.apellido2 || '-' || empleados.salario|| '-' || empleados.fecha || '-' || empleados.correo || '-' || empleados.contacto); 
        END LOOP;
    END;
    
    PROCEDURE obtener_BitacoraP IS
    BEGIN
      FOR BP IN (SELECT * FROM bitacora_producto)  LOOP
        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
        DBMS_OUTPUT.PUT_LINE(BP.ID || '-' || BP.ID_PRODUCTO  || '-' || BP.PRECIO_VIEJO || '-' ||  BP.NOMBRE_PRODUCTO  || '-' ||  BP.PRECIO_NUEVO  || '-' ||BP.FECHA_CAMBIO);
      END LOOP;
    END;
    
    PROCEDURE obtener_BitacoraS IS
    BEGIN
      FOR BP IN (SELECT * FROM bitacora_salarios)  LOOP
        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
        DBMS_OUTPUT.PUT_LINE(BP.ID || '-' || BP.fecha_cambio  || '-' || BP.usuario|| '-' ||  BP.empleado || '-' || BP.salario_anterior  || '-' ||  BP.Salario_nuevo);
      END LOOP;
    END;
    
    PROCEDURE obtener_clientes IS
    BEGIN
      FOR c IN (SELECT * FROM Cliente)  LOOP
        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
        DBMS_OUTPUT.PUT_LINE(c.ID || '-' ||  c.nombre || '-' ||  c.apellido1 || '-' ||  c.apellido2 || '-' ||  c.fecha_registro);
      END LOOP;
    END;
    
    PROCEDURE obtener_HistorialCompra IS
    BEGIN
      FOR hc IN (SELECT * FROM historial_compra)  LOOP
        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
        DBMS_OUTPUT.PUT_LINE(hc.ID  || '-' || hc.fecha  || '-' || hc.costo || '-' || hc.cantidad|| '-' ||  hc.provedor || '-' ||  hc.producto);
      END LOOP;
    END;
    
    PROCEDURE obtener_Productos IS
    BEGIN
      FOR P IN (SELECT * FROM Producto)  LOOP
        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
        DBMS_OUTPUT.PUT_LINE(P.ID  || '-' || P.nombre  || '-' ||  P.descripcion  || '-' ||  P.precio);
      END LOOP;
    END;
	
    PROCEDURE obtener_ProductosVentas IS
    BEGIN
        FOR PV IN (SELECT * FROM producto_venta)
        LOOP    -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores
            DBMS_OUTPUT.PUT_LINE(PV.ID_REGISTRO  || '-' ||  PV.ID_PRODUCTO  || '-' ||PV.ID_VENTA|| '-' ||  PV.PRECIO || '-' || PV.CANTIDAD);  
        END LOOP;
    END;
    
    PROCEDURE obtener_Provedor IS
    BEGIN
        FOR PV IN (SELECT * FROM provedor)  
        LOOP        -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
            DBMS_OUTPUT.PUT_LINE(PV.ID || '-' ||  PV.NOMBRE || '-' || PV.FECHA_REGISTRO);
        END LOOP;
    END;
    
    PROCEDURE obtener_Ventas IS
    BEGIN
        FOR V IN (SELECT * FROM VENTA)  
        LOOP
            -- Realiza la acción que desees con cada registro, por ejemplo imprimir sus valores    
            DBMS_OUTPUT.PUT_LINE(V.ID || '-' || V.FECHA || '-' || V.MONTO_TOTAL || '-' ||V.EMPLEADO || '-' || V.CLIENTE);
        END LOOP;
    END;
    
END package_assistant;
/

-- como ejecutar estos procedimientos
-- set serveroutput on;
-- variable rc refcursor;
-- EXEC package_assistant.get_best_seller( :rc );
-- print rc;

-- Para llamar a la función
-- SELECT ventas_mes('7 marzo 2002') AS ventas_marzo FROM DUAL;
