CREATE TABLE [dbo].[ASEGURADO] (
    [IdAsegurado] INT          NOT NULL,
    [dni]         VARCHAR (15) NULL,
    [Nombre]      VARCHAR (30) NOT NULL,
    [contacto]    VARCHAR (30) NULL,
    [telefono]    VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([IdAsegurado] ASC),
    UNIQUE NONCLUSTERED ([dni] ASC)
);

