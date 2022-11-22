CREATE TABLE [dbo].[CLIENTE] (
    [IdCliente] INT          NOT NULL,
    [cif]       VARCHAR (15) NULL,
    [Nombre]    VARCHAR (30) NOT NULL,
    [contacto]  VARCHAR (30) NULL,
    [telefono]  VARCHAR (15) NULL,
    [dirección] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCliente] ASC),
    UNIQUE NONCLUSTERED ([cif] ASC)
);



