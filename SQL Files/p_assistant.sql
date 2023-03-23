CREATE OR REPLACE PACKAGE package_assistant AS
    PROCEDURE get_best_seller (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_less_sold (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_greater_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_customers_more_shopping (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_employees_more_sales (t_result OUT SYS_REFCURSOR);
    PROCEDURE get_total_sales_per_month (t_result OUT SYS_REFCURSOR);
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
	
END package_assistant;
/

-- como ejecutar estos procedimientos
-- set serveroutput on;
-- variable rc refcursor;
-- EXEC package_assistant.get_more_sell( :rc );
-- print rc;
