USE [DbAmorNaPele]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/03/2022 14:09:44 ******/
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
/****** Object:  Table [dbo].[CadastroContato]    Script Date: 14/03/2022 14:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CadastroContato](
	[ID_Contato] [int] IDENTITY(1,1) NOT NULL,
	[nomeContato] [nvarchar](max) NULL,
	[emailContato] [nvarchar](max) NULL,
	[msg] [nvarchar](max) NULL,
 CONSTRAINT [PK_CadastroContato] PRIMARY KEY CLUSTERED 
(
	[ID_Contato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CadastroEmpresa]    Script Date: 14/03/2022 14:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CadastroEmpresa](
	[ID_Empresa] [int] IDENTITY(1,1) NOT NULL,
	[nomeParaContatoEmpresa] [nvarchar](max) NULL,
	[Cnpj] [nvarchar](max) NULL,
	[RazaoSocial] [nvarchar](max) NULL,
	[NumeroTelefoneEmpresa] [nvarchar](max) NULL,
	[emailEmpresa] [nvarchar](max) NULL,
	[estado] [nvarchar](max) NULL,
	[cidade] [nvarchar](max) NULL,
	[endereco] [nvarchar](max) NULL,
	[descricaoNegocio] [nvarchar](max) NULL,
 CONSTRAINT [PK_CadastroEmpresa] PRIMARY KEY CLUSTERED 
(
	[ID_Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CadastroMulher]    Script Date: 14/03/2022 14:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CadastroMulher](
	[ID_Mulher] [int] IDENTITY(1,1) NOT NULL,
	[nomeMulher] [nvarchar](max) NULL,
	[dataNascimento] [datetime2](7) NOT NULL,
	[numeroTelefoneMulher] [nvarchar](max) NULL,
	[emailMulher] [nvarchar](max) NULL,
 CONSTRAINT [PK_CadastroMulher] PRIMARY KEY CLUSTERED 
(
	[ID_Mulher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CadastroNewsletter]    Script Date: 14/03/2022 14:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CadastroNewsletter](
	[ID_Newsletter] [int] IDENTITY(1,1) NOT NULL,
	[emailNewsletter] [nvarchar](max) NULL,
 CONSTRAINT [PK_CadastroNewsletter] PRIMARY KEY CLUSTERED 
(
	[ID_Newsletter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109084910_Inicial', N'5.0.13')
GO
SET IDENTITY_INSERT [dbo].[CadastroContato] ON 

INSERT [dbo].[CadastroContato] ([ID_Contato], [nomeContato], [emailContato], [msg]) VALUES (5, N'Alex', N'alex@espia.com', N'Oiii pode me enviar um e-mail pfvr')
INSERT [dbo].[CadastroContato] ([ID_Contato], [nomeContato], [emailContato], [msg]) VALUES (6, N'Clover', N'clover@espia.com', N'Qual a sede da empresa?')
INSERT [dbo].[CadastroContato] ([ID_Contato], [nomeContato], [emailContato], [msg]) VALUES (7, N'Sam', N'sam@espia.com', N'Como podemos encontra-las?')
SET IDENTITY_INSERT [dbo].[CadastroContato] OFF
GO
SET IDENTITY_INSERT [dbo].[CadastroEmpresa] ON 

INSERT [dbo].[CadastroEmpresa] ([ID_Empresa], [nomeParaContatoEmpresa], [Cnpj], [RazaoSocial], [NumeroTelefoneEmpresa], [emailEmpresa], [estado], [cidade], [endereco], [descricaoNegocio]) VALUES (14, N'Norman Osborn', N'1626364656', N'Oscorp', N'555-555', N'oscorp@oscorp.com', N'NY', N'NY', N'Oscrop Street', N'Deter homem aranha')
INSERT [dbo].[CadastroEmpresa] ([ID_Empresa], [nomeParaContatoEmpresa], [Cnpj], [RazaoSocial], [NumeroTelefoneEmpresa], [emailEmpresa], [estado], [cidade], [endereco], [descricaoNegocio]) VALUES (15, N'Bruce Wayne', N'13131313', N'Empresas Wayne', N'555-555', N'bruce@wayne.com', N'Gothan', N'Gothan', N'Gothan Street', N'Caridade em Gothan')
SET IDENTITY_INSERT [dbo].[CadastroEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[CadastroMulher] ON 

INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (1, N'Rachel', CAST(N'1970-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'rachel@grene')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (2, N'Monica', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'monica@geller')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (3, N'phoebe', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'febe@ph')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (4, N'Janice', CAST(N'1970-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'janice@bing')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (5, N'Robin', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'robin@shwalbsk')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (6, N'lilly', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'lilly@Aldrin')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (7, N'Claire', CAST(N'1975-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'claire@dunphy')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (8, N'Wanda', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'wanda@maximov')
INSERT [dbo].[CadastroMulher] ([ID_Mulher], [nomeMulher], [dataNascimento], [numeroTelefoneMulher], [emailMulher]) VALUES (9, N'marta', CAST(N'1950-01-01T00:00:00.0000000' AS DateTime2), N'555 555', N'martha@wayne')
SET IDENTITY_INSERT [dbo].[CadastroMulher] OFF
GO
SET IDENTITY_INSERT [dbo].[CadastroNewsletter] ON 

INSERT [dbo].[CadastroNewsletter] ([ID_Newsletter], [emailNewsletter]) VALUES (11, N'susan@susan')
SET IDENTITY_INSERT [dbo].[CadastroNewsletter] OFF
GO
