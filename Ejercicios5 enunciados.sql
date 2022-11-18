--Tema 5

-- Ex 1: Calcula el número de pedidos para cada cliente español

select c.custid, count(*) NumPed
from sales.Orders as o
join Sales.Customers as c on c.custid = o.custid
where c.country = 'spain'
group by c.custid




--	Añade el nombre de la ciudad al resultado

select c.custid, city, count(*) NumPed
from sales.Orders as o
join Sales.Customers as c on c.custid = o.custid
where c.country = 'Spain'
group by c.custid, city



--- Ex 2: Añade el total (gran total) de pedidos como una fila más (Recuerda las funciones multi-grupo)
select c.custid, city, count(*) NumPed, sum(o.freight) GranTotal
from sales.Orders as o
join Sales.Customers as c on c.custid = o.custid
where c.country = 'Spain'
group by c.custid, c.city, c.country



select c.custid, city, count(*) NumPed, sum(o.freight) GranTotal
from sales.Orders as o
join Sales.Customers as c on c.custid = o.custid
where c.country = 'Spain'
group by grouping sets(c.custid, c.city)



select c.custid, city, count(*) NumPed, sum(o.freight) GranTotal
from sales.Orders as o
join Sales.Customers as c on c.custid = o.custid
where c.country = 'Spain'
group by grouping sets ((c.custid, c.city), ())

______________


-- Ex 1: Escribe una query que retorne para cada año y código de transportista,
-- el último envío realizado (utiliza la tabla sales.orders)

select year(o.shippeddate), o.shipperid, max(o.shippeddate)
from Sales.Orders o
group by year(o.shippeddate), o.shipperid


--	Pivota la tabla, de manera que tenga una fila para cada año y una columna para 
-- cada transportista, mostrando el último envío como dato

select year(o.shippeddate) año, o.shipperid, max(o.shippeddate) UltimaFecha
from Sales.Orders o
where o.shippeddate is not null
group by year(o.shippeddate), o.shipperid;



WITH PivotData AS
(
select year(o.shippeddate) año, o.shipperid, max(o.shippeddate) UltimaFecha
from Sales.Orders o
where o.shippeddate is not null
group by  o.shipperid, year(o.shippeddate)
)

SELECT Año, [1], [2], [3]
FROM PivotData
  PIVOT (max(UltimaFecha) FOR shipperid IN ([1],[2],[3]) ) AS P;




select * 
from sales.Orders

--o--
with c as 
(
Select shippeddate, year(orderdate) orderyear, shipperid 
from Sales.Orders
)
Select orderyear as orderyear, [1], [2], [3]
from c 
pivot (max(shippeddate) for shipperid in ([1], [2], [3])) as P;



-- Ex 2: Escribe una query que tenga código de cliente en las filas,
-- código de transportista en las columnas, y el número de pedidos como dato 
-- (Ojo!! Pivot no soporta COUNT(*), trata de crear una columna ficticia con '1's)

select custid, shipperid, orderid
from sales.Orders



with PivotData AS
(
select custid, count(shipperid), count(orderid) as NumPedidos
from sales.Orders
group by custid, NumPedidos
)

SELECT custid, [1], [2], [3]
FROM PivotData
  PIVOT (max(UltimaFecha) FOR shipperid IN ([1],[2],[3]) ) AS P;
select custid, shipperid, orderid
from sales.Orders



--respuesta
WITH PivotData AS
(
  SELECT
    custid   ,  -- grouping column
    shipperid,  -- spreading column
    1 AS aggcol -- aggregation column
  FROM Sales.Orders
)
SELECT custid, [1], [2], [3]
FROM PivotData
  PIVOT( COUNT(aggcol) FOR shipperid IN ([1],[2],[3]) ) AS P;


whit pivotdata as
(
select
custid,
shipperid,
1 as cuenta
from sales.orders
)
select custid, [1], [2], [3]
from pivotdata
pivot (sum(cuenta)

______________

--- Ex 1: Revisa la consulta sales.orderValues
	
--	Escribe una consulta que para cada cliente y pedido, calcule la media movil 
--  de los tres últimos pedidos (recuerda la función avg para calcular medias)


--respuesta

select custid, orderid, orderdate, val,
	avg (val) over (partition by custid
				order by orderdate, orderid
				rows between 2 preceding
						and current row) as movingavg
from sales.ordervalues;





-- Ex 2: Muestras los tres pedidos con mayor volumen de carga (freight) 
-- para cada transportista ( usa row_number )

select custid
from Sales.OrderValues




--	Para cada pedido, calcula la diferente con el pedido anterior y posterior de dicho cliente