USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[Account]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Account'))
BEGIN
	DROP TABLE [dbo].[Account]
END
GO

BEGIN
	CREATE TABLE [dbo].[Account](
		[AccountId] [int] IDENTITY(1,1) NOT NULL,
		[AccountKey] [nvarchar](50) NOT NULL,
		[AccountNo] [nvarchar](20) NOT NULL,
		[AccountName] [nvarchar](100) NULL,
		[AccountName_EN] [nvarchar](100) NULL,	
		[Description] [nvarchar](250) DEFAULT NULL,
		[DebitOrCredit] [nvarchar](2) DEFAULT NULL, -- TO DO: update DR || CR
		[Status] [int] DEFAULT 1,
		[hasChildren] [int] DEFAULT 0,
		[Created] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Updated] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Author] [nvarchar](50) DEFAULT NULL,
		[Editor] [nvarchar](50) DEFAULT NULL,
		[Deleted] [int] DEFAULT 0
	CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
	(
		[AccountId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '000','Tài khoản trung gian','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '001','Tài sản cho thuê ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '002','Vật tư, hàng hóa nhận giữ hộ, nhận gia công','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '003','Hàng hóa bán hộ, nhận ký gởi','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '004','Nợ khó đòi đã xử lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '007','Ngoại tệ các loại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '005','Nguồn vốn khấu hao cơ bản','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '111','Tiền mặt','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '111','Tiền mặt','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1111','Tiền mặt Việt Nam','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11111','Tiền mặt Việt Nam tại quỹ HCM','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11112','Tiền mặt Việt Nam tại quỹ Phú Mỹ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11113','Tiền mặt Việt Nam tại quỹ Cần Thơ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1112','Tiền mặt ngoại tệ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11121','Tiền mặt ngoại tệ tại quỹ HCM','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11122','Tiền mặt ngoại tệ tại quỹ Phú Mỹ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11123','Tiền mặt ngoại tệ tại quỹ Cần Thơ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1113','Vàng bạc, kim khí quý, đá quý','SYSTEM','SYSTEM');





INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '112','Cash in bank','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '113','Cash transfer','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '156','Goods','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '131','Account Receivable','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '331','Account Payment','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '511','Revenue','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '632','Cost of Goods Sold','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '642','Selling Cost','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '711','711','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '811','811','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor) 
VALUES (NEWID(), '911','911','SYSTEM','SYSTEM');
