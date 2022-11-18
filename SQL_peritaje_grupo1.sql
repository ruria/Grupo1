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

select * FROM ASEGURADO

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

select * FROM ESTADO
