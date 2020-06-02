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
		[BalanceId] int IDENTITY(1,1) NOT NULL,
		[BalanceKey] nvarchar(50) NOT NULL,
		[Description] nvarchar(250) NULL,
		[Description_EN] nvarchar(250) NULL,
		
		[IdCode] nvarchar(10) NULL,
		[IdGroup] nvarchar(10) NULL,
		[IsBold] int DEFAULT 0,
		[IsUsed] int DEFAULT 1,
		
		[Current_Balance] decimal(18,4) DEFAULT 0,
		[Previous_Balance] decimal(18,4) DEFAULT 0,
		[Debit_Account] nvarchar(250) DEFAULT NULL,
		[Credit_Account] nvarchar(250) DEFAULT NULL,
		
		[Note] nvarchar(250) DEFAULT NULL,
		[Author] nvarchar(50) DEFAULT NULL,
		[Created] datetime DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) DEFAULT NULL,
		[Updated] datetime DEFAULT CURRENT_TIMESTAMP,
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_BalanceId] PRIMARY KEY CLUSTERED 
	(
		[BalanceId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'A- TÀI SẢN NGẮN HẠN (100=110+120+130+140+150)', N'A -  CURRENT ASSETS', 1, 100, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'I. Tiền và các khoản tương đương tiền', N'I. Cash and cash equivalents', 2, 110, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Tiền', N'1. Cash', 3, 111, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Các khoản tương đương tiền', N'2. Cash equivalents', 4, 112, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'II. Các khoản đầu tư tài chính ngắn hạn', N'II. Short-term investments', 5, 120, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Đầu tư ngắn hạn', N'1. Short-term investments', 6, 121, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Dự phòng giảm giá đầu tư ngắn hạn (*)', N'2. Provisions for devaluation of short-term investments', 7, 129, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'III. Các khoản phải thu ngắn hạn', N'III. Account receivable', 8, 130, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Phải thu của khách hàng', N'1. Receivable from customers', 9, 131, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Trả trước cho người bán', N'2. Prepayments to suppliers', 10, 132, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Phải thu nội bộ ngắn hạn', N'3. Short-term inter-company receivable', 11, 133, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Phải thu theo tiến độ kế hoạch hợp đồng xây dựng', N'4. Receivable according to the progress of construction contracts', 12, 134, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Các khoản phải thu khác', N'5. Other receivable', 13, 135, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'6. Dự phòng phải thu ngắn hạn khó đòi (*)', N'6. Provision for doubtful debts', 14, 139, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'IV. Hàng tồn kho', N'IV. Inventories', 15, 140, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Hàng tồn kho', N'1. Inventories', 16, 141, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Dự phòng giảm giá hàng tồn kho (*)', N'2. Provision for devaluation of inventories', 17, 149, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'V. Tài sản ngắn hạn khác', N'V. Other current assets', 18, 150, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Chi phí trả trước ngắn hạn', N'1. Short-term prepaid expenses', 19, 151, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Thuế GTGT được khấu trừ', N'2. VAT to be deducted', 20, 152, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Thuế và các khoản khác phải thu Nhà nước', N'3. Taxes and other accounts receivable from the State', 21, 154, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Tài sản ngắn hạn khác', N'4. Other current assets', 22, 158, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'B- TÀI SẢN DÀI HẠN (200= 210 + 220 + 230 + 240 + 250)', N'B- LONG-TERM ASSETS', 23, 200, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'I. Các khoản phải thu dài hạn', N'I. Long-term accounts receivable', 24, 210, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Phải thu dài hạn của khách hàng', N'1. Long-term accounts receivable from customers', 25, 211, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Vốn kinh doanh ở đơn vị trực thuộc', N'2. Working capital at affiliates', 26, 212, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Phải thu dài hạn nội bộ', N'3. Long-term inter-company receivable', 27, 213, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Phải thu dài hạn khác', N'4. Other long-term receivable', 28, 218, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Dự phòng phải thu dài hạn khó đòi', N'5. Provisions for bad long-debts', 29, 219, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'II. Tài sản cố định', N'II. Fixed assets', 30, 220, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Tài sản cố định hữu hình', N'1. Tangible assets', 31, 221, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Nguyên giá', N'  -  Historical costs', 32, 222, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Giá trị hao mòn lũy kế', N'  -  Accumulated depreciation', 33, 223, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Tài sản cố định thuê tài chính', N'2. Financial leasehold assets', 34, 224, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Nguyên giá', N'  -  Historical costs', 35, 225, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Giá trị hao mòn lũy kế (*)', N'  -  Accumulated depreciation', 36, 226, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Tài sản cố định vô hình', N'3. Intangible assets', 37, 227, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Nguyên giá', N'  -  Initial costs', 38, 228, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Giá trị hao mòn lũy kế (*)', N'  -  Accumulated amortization', 39, 229, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Chi phí xây dựng cơ bản dở dang', N'4. Construction-in-progress', 40, 230, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'III. Bất động sản đầu tư', N'III. Investment property', 41, 240, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Nguyên giá', N'  -  Historical costs', 42, 241, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'  -  Giá trị hao mòn lũy kế (*)', N'  -  Accumulated depreciation', 43, 242, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'IV. Các khoản đầu tư tài chính dài hạn', N'IV. Long-term investments', 44, 250, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Đầu tư vào công ty con', N'1. Investments in affiliates', 45, 251, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Đầu tư vào công ty liên kết, liên doanh', N'2. Investments in business concern and joint ventures', 46, 252, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Đầu tư dài hạn khác', N'3. Other long-term investments', 47, 258, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Dự phòng giảm giá đầu tư tài chính dài hạn (*)', N'4. Provisions for devaluation of long-term investments', 48, 259, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'V. Tài sản dài hạn khác', N'V. Other long-term assets', 49, 260, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Chi phí trả trước dài hạn', N'1. Long-term prepaid expenses', 50, 261, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Tài sản thuế thu nhập hoãn lại', N'2. Deferred income tax assets', 51, 262, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Tài sản dài hạn khác', N'3. Other long-term assets', 52, 263, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'TỔNG CỘNG TÀI SẢN', N'TOTAL ASSETS', 53, 270, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'A- NỢ PHẢI TRẢ (300 = 310 + 330)', N'A- LIABILITIES', 54, 300, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'I. Nợ ngắn hạn', N'I Current liabilities', 55, 310, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Vay và nợ ngắn hạn', N'1. Short-term debts and loans', 56, 311, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Phải trả người bán', N'2. Payable to suppliers', 57, 312, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Người mua trả tiền trước', N'3. Advances from customers', 58, 313, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Thuế và các khoản phải nộp nhà nước', N'4. Taxes and other obligations to the State Budget', 59, 314, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Phải trả người lao động', N'5. Payable to employees', 60, 315, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'6. Chi phí phải trả', N'6. Accrued expenses', 61, 316, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'7. Phải trả nội bộ', N'7. Inter-company payable', 62, 317, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'8. Phải trả theo tiến độ kế hoạch hợp đồng xây dựng', N'8. Payable according to the progress of construction contracts', 63, 318, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'9. Các khoản phải trả, phải nộp ngắn hạn khác', N'9. Other payable', 64, 319, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'10. Dự phòng phải trả ngắn hạn', N'10. Provision for short-term account payable', 65, 320, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'II. Nợ dài hạn', N'II. Long-term liabilities', 66, 330, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Phải trả dài hạn người bán', N'1. Long-term accounts payable to suppliers', 67, 331, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Phải trả dài hạn nội bộ', N'2. Long-term inter-company payable', 68, 332, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Phải trả dài hạn khác', N'3. Other long-term payable', 69, 333, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Vay và nợ dài hạn', N'4. Long-term debts and loans', 70, 334, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Thuế thu nhập hoãn lại phải trả', N'5. Deferred income-tax payable', 71, 335, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'6. Dự phòng trợ cấp mất việc làm', N'6. Provision for unemployment allowances', 72, 336, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'7. Dự phòng phải trả dài hạn', N'7. Provision for long-term accounts payable', 73, 337, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'B- VỐN CHỦ SỞ HỮU (400 = 410 + 430)', N'B- OWNERS EQUITY', 74, 400, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'I. Vốn chủ sở hữu', N'I. Owners equity', 75, 410, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Vốn đầu tư của chủ sở hữu', N'1. Capital', 76, 411, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Thặng dư vốn cổ phần', N'2. Share premiums', 77, 412, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Vốn khác của chủ sở hữu', N'3. Other sources of capital', 78, 413, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'4. Cổ phiếu quỹ (*)', N'4. Treasury stocks', 79, 414, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'5. Chênh lệch đánh giá lại tài sản', N'5. Differences on asset revaluation', 80, 415, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'6. Chênh lệch tỷ giá hối đoái', N'6. Foreign exchange differences', 81, 416, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'7. Quỹ đầu tư phát triển', N'7. Business promotion fund', 82, 417, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'8. Quỹ dự phòng tài chính', N'8. Financial reserved fund', 83, 418, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'9. Quỹ khác thuộc vốn chủ sở hữu', N'9. Other funds', 84, 419, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'10. Lợi nhuận sau thuế chưa phân phối', N'10. Retained earnings', 85, 420, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Lợi nhuận năm trước', N' - Retained earnings - Previous Year', 86, '420A', 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N' - Lợi nhuận năm nay', N' - Retained earnings - Current Year', 87, '420B', 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'11. Nguồn vốn đầu tư xây dựng cơ bản', N'11. Construction investment fund', 88, 421, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'II. Nguồn kinh phí và quỹ phúc lợi khác', N'II. Other sources and funds', 89, 430, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'1. Quỹ khen thưởng phúc lợi', N'1. Bonus and welfare funds', 90, 431, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'2. Nguồn kinh phí', N'2. Sources of expenditure', 91, 432, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'3. Nguồn kinh phí đã hình thành TSCĐ', N'3. Fund to form fixed assets', 92, 433, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_BalanceSheet] (BalanceKey, Description, Description_EN, IdCode, IdGroup, IsBold, IsUsed, Created, Author, Updated, Editor)
VALUES (NEWID(), N'TỔNG CỘNG NGUỒN VỐN (440 = 300 + 400)', N'TOTAL LIABILITIES AND OWNERS EQUITY', 93, 440, 0, 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');
