-- TRABAJO ASEGURADORAS GRUPO 1
-- COMPONENTES:
-- Joaqu�n Gonz�lez Sordo
-- Pablo Ruiz
-- Marcela Rojas
-- Rafa Martinez

DROP DATABASE IF exists PERITAJEGRUPO1
CREATE DATABASE PERITAJEGRUPO1;

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


drop table if exists SINIESTRO;
CREATE TABLE SINIESTRO(
        IdSiniestro int not null,
		IdCliente int not null,
		IdAseguradora int not null,
		-- IdPoliza int not null,
		IdEstado int not null,
		IdRamo int not null,
		descripcion varchar(300),
		Fecha_siniestro datetime,
		Fecha_apertura datetime,
		Fecha_cierre datetime,
		IdPerito int not null,
		PRIMARY KEY (IdSiniestro)




