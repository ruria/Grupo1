CREATE TABLE [dbo].[FACTURAS] (
    [IdFactura]      INT             NOT NULL,
    [IdSiniestro]    INT             NOT NULL,
    [IdCliente]      INT             NOT NULL,
    [cif]            VARCHAR (15)    NULL,
    [Nombre]         VARCHAR (30)    NOT NULL,
    [dirección]      VARCHAR (30)    NOT NULL,
    [base_imponible] DECIMAL (10, 2) NULL,
    [iva]            DECIMAL (10, 2) NULL,
    [monto_total]    DECIMAL (10, 2) NULL,
    [fecha_emisión]  DATETIME        NULL,
    [fecha_pago]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([IdFactura] ASC),
    CONSTRAINT [FK_Factura_IdCliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[CLIENTE] ([IdCliente]),
    CONSTRAINT [FK_Factura_IdSiniestro] FOREIGN KEY ([IdSiniestro]) REFERENCES [dbo].[SINIESTRO] ([IdSiniestro]) ON UPDATE CASCADE,
    UNIQUE NONCLUSTERED ([cif] ASC)
);

