USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[GL_Account]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'GL_Account'))
BEGIN
	DROP TABLE [dbo].[GL_Account]
END
GO

BEGIN
	CREATE TABLE [dbo].[GL_Account](
		[AccountId] int IDENTITY(1,1) NOT NULL,
		[AccountKey] nvarchar(50) NOT NULL,
		[AccountNo] nvarchar(20) NOT NULL,
		[AccountName] nvarchar(250) NULL,
		[AccountName_EN] nvarchar(250) NULL,
		
		[DebitOrCredit] nvarchar(2) DEFAULT NULL, -- TO DO: update D or C (debit or credit)
		[HasChildren] int DEFAULT 0,
		[Status] int DEFAULT 1,
		
		[Be_Balance] decimal(18,4) DEFAULT 0,
		[Total_Debit] decimal(18,4) DEFAULT 0,
		[Total_Credit] decimal(18,4) DEFAULT 0,
		[En_Balance] decimal(18,4) DEFAULT 0,
		
		[Note] nvarchar(250) DEFAULT NULL,
		[Author] nvarchar(50) DEFAULT NULL,
		[Created] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) DEFAULT NULL,
		[Updated] [datetime] DEFAULT CURRENT_TIMESTAMP,		
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_AccountId] PRIMARY KEY CLUSTERED 
	(
		[AccountId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '000',N'Tài khoản trung gian', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '001',N'Tài sản cho thuê ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '002',N'Vật tư, hàng hóa nhận giữ hộ, nhận gia công', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '003',N'Hàng hóa bán hộ, nhận ký gởi', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '004',N'Nợ khó đòi đã xử lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '005',N'Nguồn vốn khấu hao cơ bản', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '007',N'Ngoại tệ các loại', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '111',N'Tiền mặt', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1111',N'Tiền mặt Việt Nam', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11111',N'Tiền mặt Việt Nam tại quỹ HCM', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11112',N'Tiền mặt Việt Nam tại quỹ Phú Mỹ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11113',N'Tiền mặt Việt Nam tại quỹ Cần Thơ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1112',N'Tiền mặt ngoại tệ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11121',N'Tiền mặt ngoại tệ tại quỹ HCM', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11122',N'Tiền mặt ngoại tệ tại quỹ Phú Mỹ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '11123',N'Tiền mặt ngoại tệ tại quỹ Cần Thơ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1113',N'Vàng bạc, kim khí quý, đá quý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '112',N'Tiền gửi ngân hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1121',N'Tiền gửi Việt Nam đồng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1122',N'Tiền gửi ngoại tệ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1123',N'Vàng bạc, kim khí quý, đá quý gửi ngân hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '113',N'Tiền đang chuyển', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1131',N'Tiền đang chuyển Việt Nam đồng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1132',N'Tiền đang chuyển ngoại tệ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '131',N'Phải thu của khách hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1311',N'Phải thu của khách hàng mua hàng chính phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1312',N'Phải thu của khách hàng mua hàng thứ phẩm, phế liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '133',N'Thuế giá trị gia tăng được khấu trừ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1331',N'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1332',N'Thuế GTGT được khấu trừ của TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1333',N'Thuế GTGT hàng hoá nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '136',N'Phải thu nội bộ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1361',N'Vốn kinh doanh ở các đơn vị trực thuộc', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1368',N'Vốn kinh doanh ở các đơn vị khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '138',N'Phải thu khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1381',N'Tài sản thiếu chờ xử lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1385',N'Phải thu về cổ phần hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1388',N'Các khoản phải thu khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '13881',N'Thuế GTGT đầu vào chưa có hóa đơn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '13888',N'Các khoản khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '139',N'Dự phòng phải thu khó đòi', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '141',N'Tạm ứng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '142',N'Chi phí trả trước ngắn hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1421',N'Chi phí trả trước ngắn hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14211',N'Trả trước tiền thuê văn phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14212',N'Trả trước tiền mua bảo hiểm nhà máy, ngừng sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14213',N'Trả trước tiền mua bảo hiểm xe cộ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm tai nạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm phẫu thuật', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '14218',N'Chi phí trả trước khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1422',N'Chi phí chờ kết chuyển', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '144',N'Thế chấp, ký cược, ký quỹ ngắn hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '151',N'Hàng mua đang đi trên đường', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '152',N'Nguyên liệu, vật liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1521',N'Nguyên vật liệu chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1522',N'Nguyên vật liệu phụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1528',N'Phụ tùng nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '15281',N'Dầu Diesel', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '15282',N'Dầu HO', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '15283',N'Dầu bôi trơn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '15284',N'Trục cán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '15285',N'Phụ tùng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '153',N'Công cụ, dụng cụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1531',N'Công cụ, dụng cụ chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1532',N'Bao bì luân chuyển', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1533',N'Đồ dùng cho thuê', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '154',N'Chi phí sản xuất kinh doanh dở dang', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '155',N'Thành phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '156',N'Hàng hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '157',N'Hàng gửi đi bán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '158',N'Hàng hoá kho bảo thuế', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '159',N'Dự phòng giảm giá hàng tồn kho', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '161',N'Chi sự nghiệp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1611',N'Chi sự nghiệp năm trước', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '1612',N'Chi sự nghiệp năm nay', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '211',N'Tài sản cố định hữu hình', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2111',N'Nhà cửa, vật kiến trúc', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2112',N'Máy móc, thiết bị', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2113',N'Phương tiện vận tải, vật truyền dẫn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2114',N'Thiết bị, dụng cụ quản lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2115',N'Cây lâu năm, súc vật làm việc và cho sản phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2117',N'Đồ đạc', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2118',N'TSCĐ khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '212',N'TSCĐ thuê tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '213',N'TSCĐ vô hình', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2131',N'Quyền sử dụng đất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2132',N'Quyền phát hành', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2133',N'Bản quyền, Bằng sáng chế', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2134',N'Nhãn hiệu hàng hoá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2135',N'Phần mềm máy vi tính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2136',N'Giấy phép và giấy phép nhượng quyền', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2138',N'TSCĐ vô hình khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '214',N'Hao mòn TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2141',N'Hao mòn TSCĐ hữu hình', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2142',N'Hao mòn TSCĐ thuê tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2143',N'Hao mòn TSCĐ vô hình', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2147',N'Hao mòn Bất động sản đầu tư', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '217',N'Bất động sản đầu tư', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '221',N'Đầu tư vào Công ty con', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2211',N'Đầu tư cổ phiếu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2212',N'Đầu tư khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '222',N'Vốn góp liên doanh', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '223',N'Đầu tư vào công ty liên kết', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '228',N'Đầu tư dài hạn khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2281',N'Cổ phiếu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2282',N'Trái phiếu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2282',N'Đầu tư dài hạn khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '229',N'Dự phòng giảm giá đầu tư dài hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '241',N'XDCB dở dang', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2411',N'Mua sắm TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2412',N'Xây dựng cơ bản', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '2413',N'Sửa chữa lớn TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '242',N'Chi phí trả trước dài hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '243',N'Tài sản thuế thu nhập hoãn lại', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '244',N'Ký quỹ ký cược dài hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '311',N'Vay ngắn hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '315',N'Nợ dài hạn đến hạn trả', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '331',N'Phải trả cho người bán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3311',N'Phải trả cho người bán trong nước', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3312',N'Phải trả cho người bán nước ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '333',N'Thuế và các khoản phải nộp nhà nước', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3331',N'Thuế giá trị gia tăng phải nộp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33311',N'Thuế giá trị gia tăng đầu ra', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33312',N'Thuế giá trị gia tăng hàng nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3332',N'Thuế tiêu thụ đặc biệt', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3333',N'Thuế xuất nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33331',N'Thuế xuất khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33332',N'Thuế nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3334',N'Thuế thu nhập doanh nghiệp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3335',N'Thuế thu nhập cá nhân', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3336',N'Thuế tài nguyên', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3337',N'Thuế nhà đất, tiền thuê đất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33371',N'Thuế nhà đất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33372',N'Tiền thuê đất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3338',N'Các loại thuế khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33381',N'Thuế môn bài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33382',N'Các loại thuế khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3339',N'Phí, lệ phí và các khoản phải nộp khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33391',N'Các khoản phụ thu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33392',N'Các khoản phí, lệ phí', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33393',N'Các khoản khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '334',N'Phải trả công nhân viên', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3341',N'Lương phải trả', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3342',N'Trích thưởng cuối năm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3348',N'Phải trả người lao động khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '335',N'Chi phí phải trả', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3351',N'Phải trả lãi vay ngân hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3352',N'Chi phí phải trả', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33521',N'Phải trả tiền điện, nước', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33522',N'Phải trả chi phí điện thọai, thông tin liên lạc', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33523',N'Phải trả chi phí vận chuyển', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33524',N'Phải trả chi phí trợ giá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33525',N'Phải trả chi phí quảng cáo', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '33528',N'Chi phí phải trả khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3353',N'Quỹ dự phòng trợ cấp mất việc làm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '336',N'Phải trả nội bộ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '337',N'Thanh toán theo tiến độ kế hoạch hợp đồng xây dựng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '338',N'Phải trả, phải nộp khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3381',N'Tài sản thừa chờ giải quyết', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3382',N'Kinh phí công đoàn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3383',N'Bảo hiểm xã hội', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3384',N'Bảo hiểm y tế', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3385',N'Phải trả về cổ phần hoá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3386',N'Nhận ký cược, ký quỹ ngắn hạn', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3387',N'Doanh thu chưa thực hiện', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3388',N'Phải trả, phải nộp khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '3389',N'Bảo hiểm thất nghiệp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '413',N'Chênh lệch tỷ giá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '4131',N'Chênh lệch tỷ giá đánh giá lại cuối năm tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '4133',N'Chênh lệch tỷ giá hối đoái chuyển đổi từ báo cáo tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '417',N'Quỹ hỗ trợ sắp xếp và cổ phần hoá doanh nghiệp nhà nước', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '451',N'Quỹ quản lý của cấp trên', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '511',N'Doanh thu bán hàng và cung cấp dịch vụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5111',N'Doanh thu bán hàng hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5112',N'Doanh thu bán thành phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '51121',N'Doanh thu bán hàng chính phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '51122',N'Doanh thu bán thứ phẩm, phế phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5113',N'Doanh thu cung cấp dịch vụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5114',N'Doanh thu trợ cấp, trợ giá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5117',N'Doanh thu kinh doanh bất động sản đầu tư', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '512',N'Doanh thu nội bộ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5121',N'Doanh thu bán hàng hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5122',N'Doanh thu bán thành phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5123',N'Doanh thu cung cấp dịch vụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '515',N'Doanh thu hoạt động tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5151',N'Thu lãi tiền gửi', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5152',N'Thu nhập từ trái phiếu, cổ phiếu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5153',N'Thu nhập từ Công ty liên kết', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5159',N'Chênh lệch tỷ giá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '51591',N'Chênh lệch tỷ giá do thanh tóan', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '51592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '521',N'Chiết khấu hàng hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5211',N'Chiết khấu hàng hóa thương mại', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5212',N'Chiết khấu thành phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '5213',N'Chiết khấu dịch vụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '531',N'Hàng bán bị trả lại', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '532',N'Giảm giá hàng bán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '611',N'Mua hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6111',N'Mua nguyên vật liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6112',N'Mua hàng hóa', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '621',N'Chi phí nguyên, vật liệu trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6211',N'Chi phí nguyên vật liệu chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6212',N'Chi phínguyên vât liệu phụ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '622',N'Chi phí nhân công trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6221',N'Chi phí lương công nhận trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6222',N'Chi phí BHXH công nhân trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6223',N'Chi phí BHYT công nhân trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6224',N'Chi phí thưởng công nhân trực tiếp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6228',N'Chi phí khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '623',N'Chi phí máy thi công', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6231',N'Chi phí máy thi công - nhân viên', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6232',N'Chi phí máy thi công - vật liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6233',N'Chi phí máy thi công - dụng cụ sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6234',N'Chi phí máy thi công - khấu hao', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6237',N'Chi phí máy thi công - dịch vụ mua ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6238',N'Chi phí máy thi công - bằng tiền khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '627',N'Chi phí sản xuất chung', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6271',N'Chi phí nhân viên phân xưởng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '62711',N'Chi phí lương bộ phận quản lý sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '62712',N'Chi phí BHXH bộ phận quản lý sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '62713',N'Chi phí BHYT bộ phận quản lý sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '62714',N'Chi phí thưởng bộ phận quản lý sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '62718',N'Chi phí khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6272',N'Chi phí vật liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6273',N'Chi phí dụng cụ sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6274',N'Chi phí khấu hao TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6277',N'Chi phí dịch vụ mua ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6278',N'Chi phí bằng tiền khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '631',N'Giá thành sản xuất', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '632',N'Giá vốn hàng bán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6321',N'Giá vốn hàng bán', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6329',N'Dự phòng giảm giá hàng tồn kho', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '635',N'Chi phí tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6351',N'Chi phí lãi tiền vay', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6352',N'Chi phí tài chính cho Cổ phiếu trái phiếu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6353',N'Chi phí tài chính', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6359',N'Chênh lệch tỷ giá', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '63591',N'Chênh lệch tỷ giá do thanh tóan', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '63592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '641',N'Chi phí bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6411',N'Chi phí nhân viên', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64111',N'Chi phí lương bộ phận bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64112',N'Chi phí BHXH bộ phận bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64113',N'Chi phí BHYT bộ phận bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64114',N'Chi phí thưởng bộ phận bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64118',N'Chi phí khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6412',N'Chi phí vật liệu bao bì', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6413',N'Chi phí dụng cụ, đồ dùng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6414',N'Chi phí khấu hao TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6415',N'Chi phí bảo hành', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6417',N'Chi phí dịch vụ mua ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6418',N'Chi phí bằng tiền khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6419',N'Chi phí trợ giá, thúc đẩy bán hàng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '642',N'Chi phí quản lý doanh nghiệp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6421',N'Chi phí nhân viên quản lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64211',N'Lương Ban giám đốc', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64212',N'Lương nhân viên quản lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64213',N'Chi phí BHXH bộ phận văn phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64214',N'Chi phí BHYT bộ phận văn phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64215',N'Chi phí thưởng bộ phận văn phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '64218',N'Chi phí khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6422',N'Chi phí vật liệu dùng cho quản lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6423',N'Chi phí đồ dùng văn phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6424',N'Chi phí khấu hao TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6425',N'Thuế, phí, lệ phí', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6426',N'Chi phí dự phòng', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6427',N'Chi phí dịch vụ mua ngoài', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '6428',N'Chi phí bằng tiền khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '711',N'Thu nhập khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '7111',N'Thu thanh lý tài sản', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '71111',N'Thu thanh lý TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '71112',N'Thu thanh lý phế liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '71118',N'Thu khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '7112',N'Thu giảm thuế, hòan thuế, miễn thuế', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '7118',N'Thu nhập khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '7119',N'Thu bồi thường', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '71191',N'Thu bồi thường billet', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '71198',N'Thu bồi thường khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '811',N'Chi phí thanh lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8111',N'Chi phí thanh lý', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '81111',N'Chi phí thanh lý TSCĐ', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '81112',N'Chi phí thanh lý phế liệu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '81113',N'Chi phí thanh lý khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8112',N'Chi phí giảm thuế, hòan thuế, miễn thuế', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8118',N'Chi phí khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8119',N'Chi phí bồi thường', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '81191',N'Chi phí bồi thường sản phẩm', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '81198',N'Chi phí bồi thường khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '821',N'Chi phí thuế thu nhập doanh nghiệp', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8211',N'Chi phí thuế thu nhập doanh nghiệp hiện hành', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '8212',N'Chi phí thuế thu nhập doanh nghiệp hõan lại', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '911',N'Xác định kết quả sản xuất kinh doanh', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '9111',N'Xác định kết quả HĐKD', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '9112',N'Xác định kết quả HĐTC', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), '9113',N'Xác định kết quả HĐ Khác', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), 'DTNK',N'Doanh thu hàng nhập khẩu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), 'GTGT01',N'Điều chỉnh tăng (giảm) thuế GTGT', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, HasChildren, Created, Author, Updated, Editor)
VALUES (NEWID(), 'GTGT02',N'Điều chỉnh tăng (giảm) doanh thu', 0, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

-- TO DO: make translation English
UPDATE [dbo].[GL_Account] SET AccountName_EN = AccountName WHERE AccountName_EN IS NULL

-- TO DO: make account is debit or credit
-- Tai san
UPDATE [dbo].[GL_Account] SET DebitOrCredit = 'D' WHERE SUBSTRING(AccountNo,1,1) IN ('1', '2')

-- Nguon von
UPDATE [dbo].[GL_Account] SET DebitOrCredit = 'C' WHERE SUBSTRING(AccountNo,1,1) IN ('3', '4')

-- Doanh thu
UPDATE [dbo].[GL_Account] SET DebitOrCredit = 'D' WHERE SUBSTRING(AccountNo,1,1) IN ('5', '7')

-- Chi phi
UPDATE [dbo].[GL_Account] SET DebitOrCredit = 'C' WHERE SUBSTRING(AccountNo,1,1) IN ('6', '8')

-- Ket qua hoat dong kinh doanh
UPDATE [dbo].[GL_Account] SET DebitOrCredit = 'D' WHERE SUBSTRING(AccountNo,1,1) IN ('9')

-- Tai khoan luong tinh
UPDATE [dbo].[GL_Account] SET DebitOrCredit = '' WHERE DebitOrCredit IS NULL
