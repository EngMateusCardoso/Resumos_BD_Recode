USE [BdRecodifiqueViagensProjeto]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/12/2021 21:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agendamentos]    Script Date: 20/12/2021 21:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agendamentos](
	[Id_Agendamento] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](max) NULL,
	[destino] [nvarchar](max) NULL,
	[telefone] [nvarchar](max) NULL,
	[formaPagamento] [nvarchar](max) NULL,
 CONSTRAINT [PK_agendamentos] PRIMARY KEY CLUSTERED 
(
	[Id_Agendamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mensagens]    Script Date: 20/12/2021 21:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mensagens](
	[Id_Msg] [int] IDENTITY(1,1) NOT NULL,
	[nomeDeContato] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[msg] [nvarchar](max) NULL,
	[aceitaReceberNot] [bit] NOT NULL,
 CONSTRAINT [PK_mensagens] PRIMARY KEY CLUSTERED 
(
	[Id_Msg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211220180406_Inicial', N'5.0.12')
GO
SET IDENTITY_INSERT [dbo].[agendamentos] ON 

INSERT [dbo].[agendamentos] ([Id_Agendamento], [nome], [destino], [telefone], [formaPagamento]) VALUES (1, N'Faraó', N'Egito', N'555 8956 5555', N'Cartão de Crédito')
INSERT [dbo].[agendamentos] ([Id_Agendamento], [nome], [destino], [telefone], [formaPagamento]) VALUES (2, N'Vladimir Putin', N'Moscow', N'859-845-326', N'Depósito')
INSERT [dbo].[agendamentos] ([Id_Agendamento], [nome], [destino], [telefone], [formaPagamento]) VALUES (3, N'Mickey', N'Orlando', N'555-565-656', N'PIX')
SET IDENTITY_INSERT [dbo].[agendamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[mensagens] ON 

INSERT [dbo].[mensagens] ([Id_Msg], [nomeDeContato], [email], [msg], [aceitaReceberNot]) VALUES (1, N'Zeca pagodinho', N'zeca@gmail', N'Vai ter cerveja?', 1)
INSERT [dbo].[mensagens] ([Id_Msg], [nomeDeContato], [email], [msg], [aceitaReceberNot]) VALUES (2, N'Rick', N'Rick@gmail', N'Wab wab lub dub dub"!', 0)
SET IDENTITY_INSERT [dbo].[mensagens] OFF
GO
