--Tema 4

-- Ex 1: Devolver los cliente y sus pedidos ( no es necesario mostrar clients sin pedidos )

-- Ex 2: Incluir en la consulta anterior los cliente sin pedidos

--	Mostrar únicamente los clientes que no han comprado nada

--	Mostrar todos los clientes, y sus pedidos, siempre y cuando los mismos sean de Febrero de 2008

________________

-- Ex 1: Una query que devuelva el precio más bajo de cada categoría

select c.categoryname, min(p.unitprice) as PrecioMinimo
from Production.Products as P
	join Production.Categories as C on P.categoryid = C.categoryid
group by c.categoryname


--	Usando la query anterior como CTE, devolver los productos con dicho precio más bajo

use TSQL2012

with CatMinimas as
(
select c.categoryname, min(p.unitprice) as PrecioMinimo
from Production.Products as P
	join Production.Categories as C on P.categoryid = C.categoryid
group by c.categoryname
)
select *
from CatMinimas




-- Ex 2: Una función que recibe el identificador de proveedor ( @supplierid ) 
--y un número ( @n ) y devuleve los n productos más baratos de dicho proveedor 

if OBJECT_ID (N'MasBaratos', N'IF')
is not null 
drop function MasBaratos;
go

create function Production.MasBaratos (@supplierid int, @unitprice int)
returns table 
as
return (

	select top 5 s.supplierid, min(unitprice) as MasBaratos
	from Production.Suppliers as S
	join Production.Products as P on s.supplierid = p.supplierid
	where unitprice = @unitprice

order by unitprice
)
go

--para probar la funcion
select * from Production.MasBaratos




--Respuesta

if OBJECT_ID (N'Production.GetTopProducts', N'IF')
is not null 
drop function Production.GetTopProducts;
go

create function GetTopProducts (@supplierid int, @n int) returns table 
as
return 
	select productid, productname,unitprice
	from Production.Products
	where supplierid = @supplierid
	order by unitprice
	offset 0 rows fetch first @n rows only;
go


select * from GetTopProducts(4, 2);


--	Pruébala con los 2 productos del proveedor 1


--	Utilizando la función anterior, una query que devuelva de cada proveedor 
--de Japan, los dos productos más baratos ( CROSS APPLY )

if OBJECT_ID (N'GetTopProducts', N'IF')
is not null 
drop function GetTopProducts;
go

create function GetTopProducts (@supplierid int, @n int) returns table 
as
return 
	select productid, productname,unitprice
	from Production.Products
	where supplierid = @supplierid
	order by unitprice
	offset 0 rows fetch first @n rows only;
go


select * 
from Production.Suppliers as S
	join Production.Products as P on P.supplierid = s.supplierid
where s.country = 'Japan'


select * from GetTopProducts (4,2)


select * 
from Production.Suppliers as S
	cross apply GetTopProducts (s.supplierid,2) as P
where s.country = 'Japan'



--	Igual que el paso anterior per mostrando todos los proveedores de Japan

select * 
from Production.Suppliers as S
	outer apply GetTopProducts (s.supplierid,2) as P
where s.country = 'Japan'



select * from Production.Suppliers
insert into Production.Suppliers (companyname, contactname, contacttitle, [address], city,country, phone) 
	values ('ACME', 'JISU Fernandez','Jefe de ventas', 'Avda. Las Flores', 'Nakao', 'Japan', '+34 65 27 13');




select * from GetTopProducts (35, 2)
_________________

-- Ex 1: Listar los empleados que han recogidos pedidos para el cliente 1 y ninguno para el 2


select custid, * from Sales.Orders;
select custid, empid, * from Sales.Orders;

--muestra todos
select empid
from Sales.Orders
where custid = 1
union all
select empid
from Sales.Orders
where custid = 2

--muestra solo los del cliente 1 que no le vendio al 2 
select empid
from Sales.Orders
where custid = 1
except
select empid
from Sales.Orders
where custid = 2




--	Listar los empleados que han recogidos algún pedido para el cliente 1 y algún pedido para el cliente 2
select empid
from Sales.Orders
where custid = 1
intersect
select empid
from Sales.Orders
where custid = 2




--	Empleados que han recogido pedidos para cliente 1 y cliente 2, en ese orden ( el pedido del cliente 1 
--es anterior al del cliente 2)


select distinct c2.empid 
from 
(select empid, custid, orderdate
from Sales.Orders 
where custid = 1) as c1
	join (select empid, custid, orderdate 
	from Sales.Orders 
	where custid = 2) as c2
	on c1.empid = c2.empid
where c1.orderdate < c2.orderdate
