CREATE TABLE [dbo].[SINIESTRO] (
    [IdSiniestro]         INT           NOT NULL,
    [IdCliente]           INT           NOT NULL,
    [IdAseguradora]       INT           NOT NULL,
    [IdEstado]            INT           NOT NULL,
    [IdAsegurado]         INT           NOT NULL,
    [IdRamo]              INT           NOT NULL,
    [descripcion]         VARCHAR (300) NULL,
    [Fecha_siniestro]     DATETIME      NULL,
    [Fecha_apertura]      DATETIME      NULL,
    [Fecha_cierre]        DATETIME      NULL,
    [IdPerito]            INT           NULL,
    [CodPoliza]           VARCHAR (70)  NULL,
    [nombre_contacto]     VARCHAR (70)  NULL,
    [telefono_contacto]   VARCHAR (15)  NULL,
    [direccion_siniestro] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([IdSiniestro] ASC),
    CONSTRAINT [FK_IdAsegurado] FOREIGN KEY ([IdAsegurado]) REFERENCES [dbo].[ASEGURADO] ([IdAsegurado]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdAseguradora] FOREIGN KEY ([IdAseguradora]) REFERENCES [dbo].[ASEGURADORA] ([IdAseguradora]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdCliente] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[CLIENTE] ([IdCliente]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdEstado] FOREIGN KEY ([IdEstado]) REFERENCES [dbo].[ESTADO] ([IdEstado]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdPerito] FOREIGN KEY ([IdPerito]) REFERENCES [dbo].[PERITO] ([IdPerito]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdRamo] FOREIGN KEY ([IdRamo]) REFERENCES [dbo].[RAMO] ([IdRamo]) ON UPDATE CASCADE
);






GO

create trigger dbo.sumcasper
    on dbo.SINIESTRO
after UPDATE

as 
begin

   IF (select IdEstado from inserted) = 3 
     begin
	   declare @perito as int;
	   set @perito = (select IdPerito from inserted i);
	   update perito 
	     set num_casos = num_casos + 1 
		 where idPerito = @perito;
     end
end;
GO

create trigger dbo.rescasper
    on dbo.SINIESTRO
after UPDATE

as 
begin

   IF (select IdEstado from inserted) = 6 
     begin
	   declare @perito as int;
	   set @perito = (select IdPerito from inserted i);
	   update perito 
	     set num_casos = num_casos - 1 
		 where idPerito = @perito;
     end
end;