CREATE TABLE [dbo].[PERITO] (
    [IdPerito]  INT          NOT NULL,
    [DNI]       VARCHAR (15) NULL,
    [Nombre]    VARCHAR (30) NOT NULL,
    [contacto]  VARCHAR (30) NULL,
    [telefono]  VARCHAR (15) NULL,
    [num_casos] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPerito] ASC)
);

