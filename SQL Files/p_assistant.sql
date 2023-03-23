CREATE OR REPLACE PACKAGE package_assistant AS
    PROCEDURE get_best_seller (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_less_sold (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_greater_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_customers_more_shopping (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_employees_more_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_total_sales_per_month (t_result OUT SYS_REFCURSOR);
    FUNCTION ventas_mes(v_fecha IN VARCHAR2) RETURN NUMBER;
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
	
END package_assistant;
/

-- como ejecutar estos procedimientos
-- set serveroutput on;
-- variable rc refcursor;
-- EXEC package_assistant.get_more_sell( :rc );
-- print rc;

-- Para llamar a la función
-- SELECT ventas_mes('7 marzo 2002') AS ventas_marzo FROM DUAL;
