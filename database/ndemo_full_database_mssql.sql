-- USE master;
-- DROP DATABASE "ndemo";
-- CREATE DATABASE "ndemo";

USE [ndemo]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 7/7/2017 6:18:30 PM ******/
DROP TABLE [dbo].[Customer]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Customer] ([CustomerName] ,[Address] ,[Phone])
VALUES ('Eric Cantona', 'Manchester United', '1234567890')

INSERT INTO [dbo].[Customer] ([CustomerName] ,[Address] ,[Phone])
VALUES ('David Beckham', 'Manchester United', '9876543210')

INSERT INTO [dbo].[Customer] ([CustomerName] ,[Address] ,[Phone])
VALUES ('Cris Ronaldo', 'Real Madrid', '1234567890')

INSERT INTO [dbo].[Customer] ([CustomerName] ,[Address] ,[Phone])
VALUES ('Michael Owen', 'Liverpool', '1234567890')

GO