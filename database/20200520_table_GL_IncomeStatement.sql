USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[GL_IncomeStatement]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'GL_IncomeStatement'))
BEGIN
	DROP TABLE [dbo].[GL_IncomeStatement]
END
GO

BEGIN
	CREATE TABLE [dbo].[GL_IncomeStatement](
		[IncomeId] int IDENTITY(1,1) NOT NULL,
		[IncomeKey] nvarchar(50) NOT NULL,
		[Description] nvarchar(250) NULL,
		[Description_EN] nvarchar(250) NULL,
		
		[IdCode] nvarchar(10) NULL,
		[IdGroup] nvarchar(10) NULL,		
		[Current_Balance] decimal(18,4) DEFAULT 0,
		[Previous_Balance] decimal(18,4) DEFAULT 0,
		[Progressive] decimal(18,4) DEFAULT 0,
		[Formular_Account] nvarchar(250) DEFAULT NULL,
		
		[Note] nvarchar(250) DEFAULT NULL,
		[Author] nvarchar(50) DEFAULT NULL,
		[Created] datetime DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) DEFAULT NULL,
		[Updated] datetime DEFAULT CURRENT_TIMESTAMP,
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_IncomeId] PRIMARY KEY CLUSTERED 
	(
		[IncomeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'Doanh thu bán hàng và cung cấp dịch vụ', N'Total Revenues (Goods and Services)', 1, '01', '511', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'Các khoản giảm trừ doanh thu (03 = 04 + 05 + 06 + 07)', N'Deductions (03 = 04 + 05 + 06 + 07)', 1, '03', '5211,5212,5213,531,532', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Doanh thu thuần về bán hàng và cung cấp dịch vụ (10 = 01 - 02)', N'1. Net Revenues (Goods and Services)', 3, '10', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Giá vốn hàng bán', N'2. Cost of Goods Sold ', 4, '11', '632', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Lợi nhuận gộp về bán hàng và cung cấp dịch vụ (20 = 10 - 11)', N'3. Gross Profit (20 = 10 - 11)', 5, '20', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Doanh thu hoạt động tài chính', N'4. Finance Income', 6, '21', '515', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Lãi tiền gửi ngân hàng', N' - Interest Received', 7, '22', '5151,5152,5153', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Lãi do đánh giá tỷ giá cuối kỳ', N' - Gain on FX revaluation', 8, '23', '51591,51592', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Chi phí tài chính', N'5. Finanacial Expenses', 9, '24', '635', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Chi phí lãi vay', N'  - Interest Expenses', 10, '25', '6351,6352,6353', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Lỗ do đánh giá tỷ giá cuối kỳ', N'  - Loss on FX revaluation', 11, '26', '63591,63592', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'6. Chi phí bán hàng', N'6. Selling Expenses ', 12, '27', '641', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Chiết khấu bán hàng', N'  - Sales discounts ', 13, '28', '6419', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'7. Chi phí quản lý doanh nghiệp', N'7. Operating Expenses', 14, '29', '642', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'8. Lợi nhuận thuần từ hoạt động kinh doanh (30=20+21-24-27-29)', N'8. Operating Income (30=20+21-24-27-29)', 15, '30', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'9. Thu nhập khác', N'9. Extraordinary Incomes', 16, '31', '711', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'10. Chi phí khác', N'10. Extraordinary Expenses', 17, '32', '811', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'11. Lợi nhuận khác (40 = 31 - 32)', N'11. Extraordinary Gain/Loss (40 = 31 - 32)', 18, '40', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'12. Tổng lợi nhuận kế toán trước thuế (50 = 30 + 40)', N'12. Profit before Tax (50 = 30 + 40)', 19, '50', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'13. Chi phí thuế TNDN hiện hành ', N'13. Income Tax', 20, '51', '8211', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'14. Chi phí thuế TNDN hoãn lại', N'14. Deferred income tax', 21, '52', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'15. Lợi nhuận sau thuế TNDN (60 = 50 - 51 - 52)', N'15. Profit after Tax (60 = 50 - 51)', 22, '60', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_IncomeStatement] (IncomeKey, Description, Description_EN, IdCode, IdGroup, Formular_Account, Created, Author, Updated, Editor)
VALUES (NEWID(), N'16. Lãi cơ bản trên cổ phiếu (*)', N'15. Profit per stock (*)', 23, '70', '', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');
