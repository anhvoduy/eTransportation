USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[GL_BalanceSheet]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'GL_BalanceSheet'))
BEGIN
	DROP TABLE [dbo].[GL_BalanceSheet]
END
GO

BEGIN
	CREATE TABLE [dbo].[GL_BalanceSheet](
		[BalanceSheetId] int IDENTITY(1,1) NOT NULL,
		[BalanceSheetKey] nvarchar(50) NOT NULL,
		[Description] nvarchar(250) NULL,
		[Description_EN] nvarchar(250) NULL,
		[IdCode] nvarchar(10) NULL,
		[IdGroup] nvarchar(10) NULL,
		[IsBold] [int] DEFAULT 0,
		[IsUsed] [int] DEFAULT 1,		
		[Be_Balance] decimal(18,2) DEFAULT 0,
		[Total_Debit] decimal(18,2) DEFAULT 0,
		[Total_Credit] decimal(18,2) DEFAULT 0,
		[En_Balance] decimal(18,2) DEFAULT 0,
		[Note] nvarchar(250) DEFAULT NULL,
		[Author] nvarchar(50) DEFAULT NULL,
		[Created] datetime DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) DEFAULT NULL,
		[Updated] datetime DEFAULT CURRENT_TIMESTAMP,
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_BalanceSheetId] PRIMARY KEY CLUSTERED 
	(
		[BalanceSheetId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceSheetKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'A- TÀI SẢN NGẮN HẠN (100=110+120+130+140+150)', N'A -  CURRENT ASSETS', 1, 100, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');
