CREATE TABLE [dbo].[SINIESTRO] (
    [IdSiniestro]     INT           NOT NULL,
    [IdCliente]       INT           NOT NULL,
    [IdAseguradora]   INT           NOT NULL,
    [IdEstado]        INT           NOT NULL,
    [IdRamo]          INT           NOT NULL,
    [descripcion]     VARCHAR (300) NULL,
    [Fecha_siniestro] DATETIME      NULL,
    [Fecha_apertura]  DATETIME      NULL,
    [Fecha_cierre]    DATETIME      NULL,
    [IdPerito]        INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSiniestro] ASC)
);

