USE [localization]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/15/2020 11:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] NOT NULL,
	[Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 10/15/2020 11:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] NOT NULL,
	[Code] [varchar](2) NULL,
PRIMARY KEY CLUSTERED
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localization]    Script Date: 10/15/2020 11:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizations](
	[LocalizationId] [int] NOT NULL,
	[BookId] [int] NULL,
	[LanguageId] [int] NULL,
	[Value] [varchar](30) NULL,
PRIMARY KEY CLUSTERED
(
	[LocalizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([BookId], [Name]) VALUES (2, N'It')
INSERT [dbo].[Books] ([BookId], [Name]) VALUES (4, N'Joyland')
INSERT [dbo].[Books] ([BookId], [Name]) VALUES (3, N'War and Peace')
INSERT [dbo].[Books] ([BookId], [Name]) VALUES (1, N'Winnie-the-Pooh')
INSERT [dbo].[Languages] ([LanguageId], [Code]) VALUES (1, N'BY')
INSERT [dbo].[Languages] ([LanguageId], [Code]) VALUES (2, N'PL')
INSERT [dbo].[Languages] ([LanguageId], [Code]) VALUES (3, N'RU')
INSERT [dbo].[Localizations] ([LocalizationId], [BookId], [LanguageId], [Value]) VALUES (1, 1, 1, N'Віні-Пух')
INSERT [dbo].[Localizations] ([LocalizationId], [BookId], [LanguageId], [Value]) VALUES (2, 1, 2, N'Kubus Puchatek')
INSERT [dbo].[Localizations] ([LocalizationId], [BookId], [LanguageId], [Value]) VALUES (3, 1, 3, N'Винни-Пух')
INSERT [dbo].[Localizations] ([LocalizationId], [BookId], [LanguageId], [Value]) VALUES (4, 2, 3, N'Оно')
INSERT [dbo].[Localizations] ([LocalizationId], [BookId], [LanguageId], [Value]) VALUES (5, 3, 2, N'Wojna i pokoj')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Book__737584F6B75123DC]    Script Date: 10/15/2020 11:23:42 AM ******/
ALTER TABLE [dbo].[Book] ADD UNIQUE NONCLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Language__A25C5AA7267C54E3]    Script Date: 10/15/2020 11:23:42 AM ******/
ALTER TABLE [dbo].[Languages] ADD UNIQUE NONCLUSTERED
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Localizations]  WITH CHECK ADD FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[Localizations]  WITH CHECK ADD FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
