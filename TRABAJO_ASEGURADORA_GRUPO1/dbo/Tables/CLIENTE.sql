﻿CREATE TABLE [dbo].[CLIENTE] (
    [IdCliente] INT          NOT NULL,
    [cif]       VARCHAR (15) NULL,
    [Nombre]    VARCHAR (30) NOT NULL,
    [contacto]  VARCHAR (30) NULL,
    [telefono]  VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([IdCliente] ASC)
);

