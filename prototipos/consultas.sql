
--Consultas

--Productos mas vendidos 
select PRODUCTO.NOMBRE, COUNT(*) as vendidos
from producto_venta 
JOIN producto on producto_venta.ID_PRODUCTO = producto.ID
GROUP BY PRODUCTO.NOMBRE
order by vendidos desc
FETCH NEXT 10 ROWS ONLY;

--Productos menos vendidos 
select PRODUCTO.NOMBRE, COUNT(*) as vendidos
from producto_venta 
JOIN producto on producto_venta.ID_PRODUCTO = producto.ID 
GROUP BY PRODUCTO.NOMBRE
order by vendidos ASC
FETCH next 10 ROWS ONLY;

--Mayores ventas

select e.nombre , c.nombre, v.monto_total, v.fecha
from venta v
join empleado e on v.empleado = e.id
join cliente c on v.cliente = c.id
order by monto_total desc;

--Clientes que mas compran
select c.id, c.nombre , count(*) as compras
from venta v
join cliente c on v.cliente = c.id
group by c.id, c.nombre
order by compras desc;


--Empleados con mas ventas
select e.id, e.nombre , count(*) as ventas
from venta v
join empleado e on v.cliente = e.id
group by e.id, e.nombre
order by ventas desc;


--Ventas totales por mes
select EXTRACT(MONTH FROM  fecha) AS mes, sum(monto_total) as ventas
from venta
group by EXTRACT(MONTH FROM  fecha)
order by ventas desc;