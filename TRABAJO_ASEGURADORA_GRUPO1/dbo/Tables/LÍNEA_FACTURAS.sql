CREATE TABLE [dbo].[LÍNEA_FACTURAS] (
    [IdLínea_Factura] INT             NOT NULL,
    [IdFactura]       INT             NOT NULL,
    [cantidad]        DECIMAL (10, 2) NULL,
    [descripción]     VARCHAR (30)    NULL,
    [precio]          DECIMAL (10, 2) NULL,
    [importe]         DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([IdLínea_Factura] ASC),
    CONSTRAINT [FK_IdFactura] FOREIGN KEY ([IdFactura]) REFERENCES [dbo].[FACTURAS] ([IdFactura]) ON UPDATE CASCADE
);

