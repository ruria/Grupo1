CREATE TABLE [dbo].[SINIESTRO_COBERTURA] (
    [IdSinCob]    INT NOT NULL,
    [IdSiniestro] INT NOT NULL,
    [IdCobertura] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSinCob] ASC),
    CONSTRAINT [FK_IdCobertura] FOREIGN KEY ([IdCobertura]) REFERENCES [dbo].[COBERTURA] ([IdCobertura]) ON UPDATE CASCADE,
    CONSTRAINT [FK_IdSiniestro] FOREIGN KEY ([IdSiniestro]) REFERENCES [dbo].[SINIESTRO] ([IdSiniestro]) ON UPDATE CASCADE
);

