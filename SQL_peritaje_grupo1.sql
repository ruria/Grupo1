-- TRABAJO ASEGURADORAS GRUPO 1
-- COMPONENTES:
-- Joaqu�n Gonz�lez Sordo
-- Pablo Ruiz
-- Marcela Rojas
-- Rafa Martinez

DROP DATABASE IF exists PERITAJEGRUPO1
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
		Tipo varchar(15),
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

-- TabLAS YA CREADAS
--------------------------------
-- INTRODUCIMOS VALORES


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



