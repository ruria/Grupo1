-- TRABAJO ASEGURADORAS GRUPO 1
-- COMPONENTES:
-- Joaqu�n Gonz�lez Sordo
-- Pablo Ruiz
-- Marcela Rojas
-- Rafa Martinez

DROP DATABASE IF exists PERITAJEGRUPO1
CREATE DATABASE PERITAJEGRUPO1;

-- Creamos tabla de Empresa aseguradoras

drop table if exists ASEGURADORA
CREATE TABLE ASEGURADORA(
        IDaseguradora int not null,
		cif varchar(15),
		Nombre varchar(30) not null,
		contacto varchar(30),
		telefono varchar(15),
		PRIMARY KEY (IDaseguradora)
);



