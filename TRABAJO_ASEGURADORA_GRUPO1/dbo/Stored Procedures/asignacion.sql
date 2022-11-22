CREATE PROC DBO.asignacion
AS
begin
 declare @perito as int;
	   

 declare @num as int;
 set @num = (SELECT count(IdEstado)
              FROM SINIESTRO 
		      where IdEstado = 2);
 declare @IdSiniestro as int;

print @perito;
print @num;
print @IdSiniestro

  WHILE ( @num > 0 )
   BEGIN
          set @perito = (select top(1) IdPerito
							from perito 
							order by num_casos asc);
		  set @IdSiniestro = (SELECT top(1) IdSiniestro
                      FROM SINIESTRO 
		               where IdEstado = 2 );
           update SINIESTRO 
	          set IdEstado = 3,
		          IdPerito=@perito
		      where IdSiniestro = @IdSiniestro;
		  
	     set @num = @num-1
   END
print @num

 RETURN;
END;