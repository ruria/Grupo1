-- TRABAJO ASEGURADORAS GRUPO 1
-- COMPONENTES:
-- Joaquín González Sordo
-- Pablo Ruiz
-- Marcela Rojas

IF DATABASE PERITAJEGRUPO1 EXISTS DROP PERITAJEGRUPO1
CREATE DATABASE PERITAJEGRUPO1;

-- Creamos tabla de Empresa aseguradoras

IF TABLE ASEGURADORA EXISTS DROP ASEGURADORA
CREATE TABLE ASEGURADORA(
        IDaseguradora int not null,
		cif varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		PRIMARY KEY (IDaseguradora)
);



