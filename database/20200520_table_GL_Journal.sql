USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[GL_Journal]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'GL_Journal'))
BEGIN
	DROP TABLE [dbo].[GL_Journal]
END
GO

BEGIN
	CREATE TABLE [dbo].[GL_Journal](
		[JournalId] bigint IDENTITY(1,1) NOT NULL,
		[RefNbr] nvarchar(20) NOT NULL,
		[RefDate] datetime DEFAULT NULL,		
		[RefType] nvarchar(10) NOT NULL, -- PC, PT, PXK, PNK, HTNB
		[PerPost] nvarchar(10) NOT NULL,
		[DrAcct] nvarchar(10) DEFAULT NULL,
		[CrAcct] nvarchar(10) DEFAULT NULL,		
		[CurrencyCode] nvarchar(3) DEFAULT 'VND',
		[CurrencyExchange] decimal(18,4) DEFAULT 0,
		
		[Amount] decimal(18,4) DEFAULT 0,
		[CurrencyAmount] decimal(18,4) DEFAULT 0,
		[Vat] nvarchar(10) DEFAULT NULL,
		[TaxRate] decimal(18,4) DEFAULT 0,
		[Note] nvarchar(250) DEFAULT NULL,
		
		[ExpenseCode] nvarchar(10) DEFAULT NULL, -- Khoan muc chi phi
		[RefOriginalNbr] nvarchar(50) DEFAULT NULL,
		[RefOriginalDate] datetime DEFAULT NULL,		
		[SerialNbr] nvarchar(20) DEFAULT NULL,
		[InvNbr] nvarchar(20) DEFAULT NULL,
		[InvDate] datetime DEFAULT NULL,
		[InvDesc] nvarchar(50) DEFAULT NULL,
		
		[CustomerCode] nvarchar(20) DEFAULT NULL,
		[CustomerName] nvarchar(100) DEFAULT NULL,
		[CustomerPhone] nvarchar(50) DEFAULT NULL,
		[CustomerAddress] nvarchar(250) DEFAULT NULL,		
		[CustomerBankAccount] nvarchar(50) DEFAULT NULL,
		[CustomerTaxCode] nvarchar(50) DEFAULT NULL,
		[Description] nvarchar(250) DEFAULT NULL,
		
		[Author] nvarchar(50) DEFAULT NULL,
		[Created] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) DEFAULT NULL,
		[Updated] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_JournalId] PRIMARY KEY CLUSTERED 
	(
		[JournalId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[GL_Journal] (RefNbr, RefDate, RefType, PerPost, DrAcct, CrAcct, CurrencyCode, CurrencyExchange, Amount, CurrencyAmount, 
	Vat, TaxRate, Note, ExpenseCode, RefOriginalNbr, RefOriginalDate, SerialNbr, InvNbr, InvDate, InvDesc,
	CustomerCode, CustomerName, CustomerPhone, CustomerAddress, CustomerBankAccount, CustomerTaxCode, Description,
	Created, Author, Updated, Editor)
VALUES ('PC20200601-000005', '2020-06-02 00:00:00', 'PC', '202006', '6428', '1111', 'VND', 0, 112589.00, 0, 
	'', 0, N'CÔNG TÁC PHÍ HÀ NỘI-(09-10/11/2010) [HĐ: 043018; 0039842; 0042213; 0020264]', '', NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
	GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Journal] (RefNbr, RefDate, RefType, PerPost, DrAcct, CrAcct, CurrencyCode, CurrencyExchange, Amount, CurrencyAmount, 
	Vat, TaxRate, Note, ExpenseCode, RefOriginalNbr, RefOriginalDate, SerialNbr, InvNbr, InvDate, InvDesc,
	CustomerCode, CustomerName, CustomerPhone, CustomerAddress, CustomerBankAccount, CustomerTaxCode, Description,
	Created, Author, Updated, Editor)
VALUES ('BN20200603-000005', '2020-06-02 00:00:00', 'BN', '202006', '6427', '1121', 'VND', 0, 4600.0000, 0, 
	'', 0, N'Guard service at Can Tho (Inv. 177891)', '', NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
	GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');
