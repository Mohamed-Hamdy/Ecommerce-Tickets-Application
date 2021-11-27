USE [ecommerce-app-Database]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27/11/2021 04:55:53 م ******/
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
/****** Object:  Table [dbo].[Actors]    Script Date: 27/11/2021 04:55:54 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilepictureURL] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors_Movies]    Script Date: 27/11/2021 04:55:54 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors_Movies](
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_Actors_Movies] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 27/11/2021 04:55:54 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Discription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 27/11/2021 04:55:54 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discription] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[MovieCategory] [int] NOT NULL,
	[CinemaId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 27/11/2021 04:55:54 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilepictureURL] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211125182543_Initial', N'5.0.5')
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (1, N'http://dotnethow.net/images/actors/actor-5.jpeg', N'Actor 5', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (2, N'http://dotnethow.net/images/actors/actor-4.jpeg', N'Actor 4', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (3, N'http://dotnethow.net/images/actors/actor-3.jpeg', N'Actor 3', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (4, N'http://dotnethow.net/images/actors/actor-2.jpeg', N'Actor 2', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (5, N'http://dotnethow.net/images/actors/actor-1.jpeg', N'Actor 1', N'This is the Bio of the first actor')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (2, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (2, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 5)
GO
SET IDENTITY_INSERT [dbo].[Cinemas] ON 

INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Discription]) VALUES (1, N'http://dotnethow.net/images/cinemas/cinema-1.jpeg', N'Cinema 1', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Discription]) VALUES (2, N'http://dotnethow.net/images/cinemas/cinema-2.jpeg', N'Cinema 2', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Discription]) VALUES (3, N'http://dotnethow.net/images/cinemas/cinema-3.jpeg', N'Cinema 3', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Discription]) VALUES (4, N'http://dotnethow.net/images/cinemas/cinema-4.jpeg', N'Cinema 4', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Discription]) VALUES (5, N'http://dotnethow.net/images/cinemas/cinema-5.jpeg', N'Cinema 5', N'This is the description of the first cinema')
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (1, N'Scoob', N'This is the Scoob movie description', 39.5, N'http://dotnethow.net/images/movies/movie-7.jpeg', CAST(N'2021-11-15T20:54:41.7312723' AS DateTime2), CAST(N'2021-11-23T20:54:41.7312725' AS DateTime2), 5, 1, 3)
INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (2, N'Race', N'This is the Race movie description', 39.5, N'http://dotnethow.net/images/movies/movie-6.jpeg', CAST(N'2021-11-15T20:54:41.7312719' AS DateTime2), CAST(N'2021-11-20T20:54:41.7312721' AS DateTime2), 4, 1, 2)
INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (3, N'Ghost', N'This is the Ghost movie description', 39.5, N'http://dotnethow.net/images/movies/movie-4.jpeg', CAST(N'2021-11-25T20:54:41.7312715' AS DateTime2), CAST(N'2021-12-02T20:54:41.7312717' AS DateTime2), 6, 4, 4)
INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (4, N'The Shawshank Redemption', N'This is the Shawshank Redemption description', 29.5, N'http://dotnethow.net/images/movies/movie-1.jpeg', CAST(N'2021-11-25T20:54:41.7312703' AS DateTime2), CAST(N'2021-11-28T20:54:41.7312711' AS DateTime2), 1, 1, 1)
INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (5, N'Life', N'This is the Life movie description', 39.5, N'http://dotnethow.net/images/movies/movie-3.jpeg', CAST(N'2021-11-15T20:54:41.6968511' AS DateTime2), CAST(N'2021-12-05T20:54:41.7310654' AS DateTime2), 4, 3, 3)
INSERT [dbo].[Movies] ([Id], [Name], [Discription], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (6, N'Cold Soles', N'This is the Cold Soles movie description', 39.5, N'http://dotnethow.net/images/movies/movie-8.jpeg', CAST(N'2021-11-28T20:54:41.7312733' AS DateTime2), CAST(N'2021-12-15T20:54:41.7312735' AS DateTime2), 3, 1, 5)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (1, N'http://dotnethow.net/images/producers/producer-5.jpeg', N'Producer 5', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (2, N'http://dotnethow.net/images/producers/producer-4.jpeg', N'Producer 4', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (3, N'http://dotnethow.net/images/producers/producer-3.jpeg', N'Producer 3', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (4, N'http://dotnethow.net/images/producers/producer-2.jpeg', N'Producer 2', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilepictureURL], [FullName], [Bio]) VALUES (5, N'http://dotnethow.net/images/producers/producer-1.jpeg', N'Producer 1', N'This is the Bio of the first actor')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
ALTER TABLE [dbo].[Actors_Movies]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Movies_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actors_Movies] CHECK CONSTRAINT [FK_Actors_Movies_Actors_ActorId]
GO
ALTER TABLE [dbo].[Actors_Movies]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Movies_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actors_Movies] CHECK CONSTRAINT [FK_Actors_Movies_Movies_MovieId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Cinemas_CinemaId] FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Cinemas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Cinemas_CinemaId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Producers_ProducerId] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Producers_ProducerId]
GO
