-- TRABAJO ASEGURADORAS GRUPO 1
-- COMPONENTES:
-- Joaqu�n Gonz�lez Sordo
-- Pablo Ruiz
-- Marcela Rojas
-- Rafa Martinez

DROP DATABASE IF exists PERITAJEGRUPO1;
CREATE DATABASE PERITAJEGRUPO1;

USE PERITAJEGRUPO1;
GO
-- Creamos tabla de Empresa aseguradoras

drop table if exists ASEGURADORA;
CREATE TABLE ASEGURADORA(
        IdAseguradora int not null,
		cif varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		PRIMARY KEY (IdAseguradora)
);

drop table if exists CLIENTE;
CREATE TABLE CLIENTE(
        IdCliente int not null,
		cif varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		PRIMARY KEY (IdCliente)
);

drop table if exists ASEGURADO;
CREATE TABLE ASEGURADO(
        IdAsegurado int not null,
		dni varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		PRIMARY KEY (IdAsegurado)
);

drop table if exists PERITO;
CREATE TABLE PERITO(
        IdPerito int not null,
		DNI varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		num_casos int not null,
		PRIMARY KEY (IdPerito)
);

drop table if exists COBERTURA;
CREATE TABLE COBERTURA(
        IdCobertura int not null,
		Tipo varchar(30),
		Monto decimal(10,2),
		PRIMARY KEY (IdCobertura)
);


drop table if exists RAMO;
CREATE TABLE RAMO(
        IdRamo int not null,
		Tipo varchar(15),

        PRIMARY KEY (IdRamo)
);


drop table if exists ESTADO;
CREATE TABLE ESTADO(
        IdEstado int not null,
		Tipo varchar(15),
		Fecha datetime,

        PRIMARY KEY (IdEstado)
);




drop table if exists SINIESTRO;
CREATE TABLE SINIESTRO(
        IdSiniestro int not null,
		IdCliente int not null,
		IdAseguradora int not null,
		-- IdPoliza int not null,
		IdEstado int not null,
		IdAsegurado int not null,
		IdRamo int not null,
		descripcion varchar(300),
		Fecha_siniestro datetime,
		Fecha_apertura datetime,
		Fecha_cierre datetime,
		IdPerito int not null,
		CodPoliza varchar(70),
		nombre_contacto varchar(70),
		telefono_contacto varchar (15),
		direccion_siniestro varchar(100),
		PRIMARY KEY (IdSiniestro),
		CONSTRAINT FK_IdCliente FOREIGN KEY (IdCliente)
			REFERENCES CLIENTE (IdCliente)
			on update cascade,
	    CONSTRAINT FK_IdAseguradora FOREIGN KEY (IdAseguradora)
			REFERENCES ASEGURADORA (IdAseguradora)
			on update cascade,
		CONSTRAINT FK_IdEstado FOREIGN KEY (IdEstado)
			REFERENCES ESTADO (IdEstado)
			on update cascade,
		CONSTRAINT FK_IdRamo FOREIGN KEY (IdRamo)
			REFERENCES RAMO (IdRamo)
			on update cascade,
		CONSTRAINT FK_IdPerito FOREIGN KEY (IdPerito)
			REFERENCES PERITO (IdPerito)
			on update cascade,
		CONSTRAINT FK_IdAsegurado FOREIGN KEY (IdAsegurado)
			REFERENCES ASEGURADO (IdAsegurado)
			on update cascade
);

drop table if exists SINIESTRO_COBERTURA;
CREATE TABLE SINIESTRO_COBERTURA(
        IdSinCob int not null,
		IdSiniestro int not null,
		IdCobertura int not null,
        PRIMARY KEY (IdSinCob),
		CONSTRAINT FK_IdSiniestro FOREIGN KEY (IdSiniestro)
			REFERENCES SINIESTRO (IdSiniestro)
			on update cascade,
	    CONSTRAINT FK_IdCobertura FOREIGN KEY (IdCobertura)
			REFERENCES COBERTURA (IdCobertura)
			on update cascade
);

select*from  SINIESTRO_COBERTURA

-- TabLAS YA CREADAS
--------------------------------
-- INTRODUCIMOS VALORES

--INSERTO DATOS DE LOS ASEGURADOS:
INSERT INTO ASEGURADO
VALUES ('1','11111111A','Rafael Nadal','Calle Tenis 5','651248795');
INSERT INTO ASEGURADO
VALUES ('2','11111112A','Cristino Ronaldo','Calle Humilde 23','612345677');
INSERT INTO ASEGURADO
VALUES ('3','11111113A','Manolete','Calle Sol 6','612547985');
INSERT INTO ASEGURADO
VALUES ('4','11111114A','Elon Musk','Calle Luna 4','632541872');
INSERT INTO ASEGURADO
VALUES ('5','11111115A','José Luis Torrente','Calle El Español 10','612547897');
INSERT INTO ASEGURADO
VALUES ('6','11111116A','Cañita Brava','Calle Negro 10','645789875');
INSERT INTO ASEGURADO
VALUES ('7','11111117A','Amancio Ortega','Calle blanco 11','612345678');
INSERT INTO ASEGURADO
VALUES ('8','11111118A','LeBron James','Calle Abajo 12','652541787');
INSERT INTO ASEGURADO
VALUES ('9','11111119A','Michael Jordan','Calle Principio 13','656478542');
INSERT INTO ASEGURADO
VALUES ('10','11111110A','El Cigala','Calle Final 14','645785421');
INSERT INTO ASEGURADO
VALUES ('11','12111111A','Tom Jones','Calle Rojo 15','656987452');
INSERT INTO ASEGURADO
VALUES ('12','13111111A','James Bond','Calle Azul 16','612355645');
INSERT INTO ASEGURADO
VALUES ('13','14111111A','Jack Bauer','Calle Madrid 17','622258745');
INSERT INTO ASEGURADO
VALUES ('14','15111111A','Jason Bourne','Calle Barcelona 18','611544854');
INSERT INTO ASEGURADO
VALUES ('15','16111111A','Ken Follet','Calle Florentino 19','655878548');
INSERT INTO ASEGURADO
VALUES ('16','17111111A','Joseph Conrad','Calle Laporta 20','655487545');
INSERT INTO ASEGURADO
VALUES ('17','18111111A','Arturo Pérez-Reverte','Calle Lakers 21','652654875');
INSERT INTO ASEGURADO
VALUES ('18','19111111A','Rosalía','Calle Bulls 22','651248795');
INSERT INTO ASEGURADO
VALUES ('19','20111111A','Carmen de Mairena','Calle Antena 23','651248795');
INSERT INTO ASEGURADO
VALUES ('20','21111111A','Margarita Flores Rosales','Calle Telecinco 24','651248795');
INSERT INTO ASEGURADO
VALUES ('21','22111111A','Marisol','Calle Montaña 25','651248795');
INSERT INTO ASEGURADO
VALUES ('22','23111111A','Corinna Larsen','Calle Mar 26','651248795');
INSERT INTO ASEGURADO
VALUES ('23','24111111A','Juan Carlos I','Calle Emérito 22','651248795');
INSERT INTO ASEGURADO
VALUES ('24','25111111A','Nikita ni Pongo','Calle la luz 36','651248795');
INSERT INTO ASEGURADO
VALUES ('25','26111111A','Angelina Jolie','Calle Racing 30','651248795');




--INSERTO DATOS DE LOS ESTADOS:
INSERT INTO ESTADO
VALUES ('1','Recibido','20080101');
INSERT INTO ESTADO
VALUES ('2','Revisado','20080102');
INSERT INTO ESTADO
VALUES ('3','Asignado','20080103');
INSERT INTO ESTADO
VALUES ('4','Visitado','20080104');
INSERT INTO ESTADO
VALUES ('5','Cerrado','20080105');
INSERT INTO ESTADO
VALUES ('6','Facturado','20080106');


insert into ASEGURADORA 
    values('1','23456687AB','MAPFRE','Pedro Gonzalez','987654321');
insert into ASEGURADORA 
    values('2','23457787AB','OCASO','Maria Perez','956444321');
insert into ASEGURADORA 
    values('3','27856687AB','AXA','Carlos Lopez','987611321');
insert into ASEGURADORA 
    values('4','2345327AB','ALLIANZ','Pedro Perez','958844321');
insert into ASEGURADORA 
    values('5','2345007AB','REALE','Elena Jimenez','978844321');
insert into ASEGURADORA 
    values('6','67856687AB','MUTUA MADRILEÑA','Juan Lopez','987811321');
insert into ASEGURADORA 
    values('7','7345327AB','CATALANA OCCIDENTE','Luis Gonzalez','959844321');
insert into ASEGURADORA 
    values('8','8345007AB','LIBERTY','Javier Jimenez','978804321');
insert into ASEGURADORA 
    values('9','9345327AB','RACC','Miguel Casero','919844321');
insert into ASEGURADORA 
    values('10','1345007AB','ZURICH','Rocío Galvez','928804321');


insert into CLIENTE 
    values('11','6345007AB','PERITOS PEREZ','Juan Valcarcel','903804321');
insert into CLIENTE 
    values('12','1345007CB','PERITOS LOPEZ','Sonia Fernandez','983804321');
insert into CLIENTE 
    values('13','785007AB','PERITOS GOMEZ','Begoña Hernandez','913804321');
insert into CLIENTE 
    values('14','4945007CB','PERITOS HERNANDEZ','Luis De la Torre','923804321');


insert into COBERTURA 
    values('1','Cristales','3000');
insert into COBERTURA 
    values('2','Carroceria','2000');
insert into COBERTURA 
    values('3','Neumaticos','1000');
insert into COBERTURA 
    values('4','Tapiceria','500');
insert into COBERTURA 
    values('5','Motor','2500');
insert into COBERTURA 
    values('6','Iluminacion','500');
insert into COBERTURA 
    values('7','Freno','400');
insert into COBERTURA 
    values('8','Robo vehiculo','10000');
insert into COBERTURA 
    values('9','Herido leve acc','800');
insert into COBERTURA 
    values('10','Herido grave acc','4000');
insert into COBERTURA 
    values('10','Fallecido acc','14000');
insert into COBERTURA 
    values('11','Inundacion','5000');
insert into COBERTURA 
    values('12','Incendio','5000');
insert into COBERTURA 
    values('13','Robo en hogar','6000');
insert into COBERTURA 
    values('14','Okupacion','10000');
insert into COBERTURA 
    values('15','Fallecimiento','20000');
insert into COBERTURA 
    values('16','Invalidez permanente','10000');
insert into COBERTURA 
    values('17','Invalidez transitoria','5000');
insert into COBERTURA 
    values('18','Asistencia medica','5000');


select * from ASEGURADORA;
select * from CLIENTE;
select * from Cobertura;

INSERT [dbo].[RAMO] ([IdRamo], [Tipo]) 
VALUES (1, N'Vida')
INSERT [dbo].[RAMO] ([IdRamo], [Tipo]) 
VALUES (2, N'Hogar')
INSERT [dbo].[RAMO] ([IdRamo], [Tipo]) 
VALUES (3, N'Coche')
;


INSERT [dbo].[PERITO] ([IdPerito], [DNI], [Nombre], [Contacto], [telefono], [num_casos]) 
VALUES (1, N'Y6254479P', 'Rafa Martinez', 'Davila 15', '732745168', '') 
INSERT [dbo].[PERITO] ([IdPerito], [DNI], [Nombre], [Contacto], [telefono], [num_casos]) 
VALUES (2, N'O5229934I', 'Joaquin Gonzalez', 'Los Castros 8', '677122364', '')
INSERT [dbo].[PERITO] ([IdPerito], [DNI], [Nombre], [Contacto], [telefono], [num_casos]) 
VALUES (3, N'Y5743219T', 'Pablo Ruiz', 'Guevara 18', '645228340', '')
INSERT [dbo].[PERITO] ([IdPerito], [DNI], [Nombre], [Contacto], [telefono], [num_casos]) 
VALUES (4, N'N9426741X', 'Marcela Rojas', 'Jose de Escandon 14', '622744124', '')
;


--INSERTO DATOS DE LOS ESTADOS:

INSERT INTO SINIESTRO
VALUES ('1','11','1','1','1','2','Incencio de cocina','20220901','20221001','','1');
INSERT INTO SINIESTRO
VALUES ('2','12','2','1','2','1','Infección respiratoria','20220902','20221002','','2');
INSERT INTO SINIESTRO
VALUES ('3','13','3','1','3','2','Derrumbe de salón','20220903','20221003','','3');
INSERT INTO SINIESTRO
VALUES ('4','14','4','1','4','3','Pinchazo de ruedas','20220904','20221004','','4');
INSERT INTO SINIESTRO
VALUES ('5','11','5','1','5','1','Rotura de cadera','20220905','20221005','','1');
INSERT INTO SINIESTRO
VALUES ('6','12','6','1','5','2','Inundación de baño','20220906','20221006','','1');
INSERT INTO SINIESTRO
VALUES ('7','13','7','1','7','3','Rotura de parabrisas','20220907','20221007','','1');
INSERT INTO SINIESTRO
VALUES ('8','14','8','1','8','1','Rotura de tibia','20220908','20221008','','3');
INSERT INTO SINIESTRO
VALUES ('9','11','9','1','9','2','Incendio de dormitorio','20220909','20221009','','2');
INSERT INTO SINIESTRO
VALUES ('10','12','10','1','10','3','Incendio del motor','20220910','20221010','','1');


insert into SINIESTRO
  values('11','12','8','1','3','2','Inundacion del piso de arriba','20220210','20221010','','1');
insert into SINIESTRO
  values('12','14','5','1','1','1','Inflamacion del higado','20220510','20221012','','2');
insert into SINIESTRO
  values('13','13','2','1','6','3','Atropello a peaton','20220810','20221013','','3');
insert into SINIESTRO
  values('14','11','7','1','2','2','Incencio en cocina','20220910','20221113','','1');
insert into SINIESTRO
  values('15','12','6','1','1','1','Parálisis en pierna','20220710','20221110','','4');
 insert into SINIESTRO
  values('16','14','5','1','8','3','Choque frontal cruce','20220610','20221109','','1');
 insert into SINIESTRO
  values('17','12','8','1','20','2','Robo de joyas en casa','20220811','20221108','','2');
insert into SINIESTRO
  values('18','13','1','1','18','1','Gripe prolongada','20220911','20221106','','1');
 insert into SINIESTRO
  values('19','14','4','1','12','2','Incendio en dormitorio','20220721','20221103','','3');
insert into SINIESTRO
  values('20','13','1','1','15','1','Infarto corazon','20220911','20221106','','4');





--inserto datos tabla Siniestro del 21 al 30 perito 4

INSERT into SINIESTRO
VALUES ('21', '12', '2', '1', '25', '2', 'Incendio', '20220305', '20220307', '', '4');
INSERT into SINIESTRO
VALUES ('22', '11', '1', '2', '1', '1', 'Accidente de coche', '20220905', '20220908', '', '4');
INSERT into SINIESTRO
VALUES ('23', '13', '6', '1', '11', '2', 'Choque', '20221105', '20221109', '', '4');
INSERT into SINIESTRO
VALUES ('24', '13', '2', '3', '13', '3', 'Incendio', '20220605', '20220612', '', '4');
INSERT into SINIESTRO
VALUES ('25', '14', '4', '1', '5', '2', 'Rotura cañerias', '20220404', '20220407', '', '4');
INSERT into SINIESTRO
VALUES ('26', '11', '10', '1', '3', '3', 'Incendio', '20220101', '20220107', '', '4');
INSERT into SINIESTRO
VALUES ('27', '11', '9', '3', '6', '1', 'Incendio', '20220705', '20220711', '', '4');
INSERT into SINIESTRO
VALUES ('28', '12', '9', '1', '22', '2', 'Rotura de tejado', '20221001', '20221007', '', '4');
INSERT into SINIESTRO
VALUES ('29', '12', '1', '2', '13', '2', 'Incendio', '20220620', '20220625', '', '4');
INSERT into SINIESTRO
VALUES ('30', '14', '3', '1', '7', '3', 'Rotura de tejado', '20221115', '20221117', '', '4');



--inserto datos tabla Siniestro_Cobertura:

INSERT INTO SINIESTRO_COBERTURA
VALUES ('1','1','6');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('2','1','12');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('3','11','2');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('4','11','15');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('5','28','9');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('6','28','10');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('7','13','9');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('8','13','10');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('9','13','15');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('10','13','16');

INSERT INTO SINIESTRO_COBERTURA
VALUES ('31','17','13');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('32','17','18');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('33','18','18');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('34','8','18');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('35','8','17');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('36','10','5');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('37','14','11');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('38','7','1');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('39','4','3');
INSERT INTO SINIESTRO_COBERTURA
VALUES ('40','2','18');

insert into SINIESTRO_COBERTURA
   values('11','11','11');
   
insert into SINIESTRO_COBERTURA
   values('12','12','9');

 insert into SINIESTRO_COBERTURA
   values('13','13','10');

 insert into SINIESTRO_COBERTURA
   values('14','14','12');
   
insert into SINIESTRO_COBERTURA
   values('15','14','9');

 insert into SINIESTRO_COBERTURA
   values('16','16','2');

    insert into SINIESTRO_COBERTURA
   values('17','16','10');

 insert into SINIESTRO_COBERTURA
   values('18','17','13');

 insert into SINIESTRO_COBERTURA
   values('19','19','12');

    insert into SINIESTRO_COBERTURA
   values('20','20','15');

select*from SINIESTRO_COBERTURA


insert into SINIESTRO_COBERTURA
   values('21','26','12');
insert into SINIESTRO_COBERTURA
   values('22','30','10');
   insert into SINIESTRO_COBERTURA
   values('23','21','12');
   insert into SINIESTRO_COBERTURA
   values('24','24','12');
   insert into SINIESTRO_COBERTURA
   values('25','29','12');
   insert into SINIESTRO_COBERTURA
   values('26','27','12');
   insert into SINIESTRO_COBERTURA
   values('27','23','7');
   insert into SINIESTRO_COBERTURA
   values('28','22','12');
   insert into SINIESTRO_COBERTURA
   values('29','26','12');
   insert into SINIESTRO_COBERTURA
   values('30','25','11');

