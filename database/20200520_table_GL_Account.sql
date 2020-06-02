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
		[Description] nvarchar(250) DEFAULT NULL,
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

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '000',N'Tài khoản trung gian', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '001',N'Tài sản cho thuê ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '002',N'Vật tư, hàng hóa nhận giữ hộ, nhận gia công', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '003',N'Hàng hóa bán hộ, nhận ký gởi', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '004',N'Nợ khó đòi đã xử lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '007',N'Ngoại tệ các loại', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '005',N'Nguồn vốn khấu hao cơ bản', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '111',N'Tiền mặt', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '111',N'Tiền mặt', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1111',N'Tiền mặt Việt Nam', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11111',N'Tiền mặt Việt Nam tại quỹ HCM', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11112',N'Tiền mặt Việt Nam tại quỹ Phú Mỹ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11113',N'Tiền mặt Việt Nam tại quỹ Cần Thơ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1112',N'Tiền mặt ngoại tệ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11121',N'Tiền mặt ngoại tệ tại quỹ HCM', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11122',N'Tiền mặt ngoại tệ tại quỹ Phú Mỹ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '11123',N'Tiền mặt ngoại tệ tại quỹ Cần Thơ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1113',N'Vàng bạc, kim khí quý, đá quý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '112',N'Tiền gửi ngân hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1121',N'Tiền gửi Việt Nam đồng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1122',N'Tiền gửi ngoại tệ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1123',N'Vàng bạc, kim khí quý, đá quý gửi ngân hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '113',N'Tiền đang chuyển', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1131',N'Tiền đang chuyển Việt Nam đồng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1132',N'Tiền đang chuyển ngoại tệ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '131',N'Phải thu của khách hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1311',N'Phải thu của khách hàng mua hàng chính phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1312',N'Phải thu của khách hàng mua hàng thứ phẩm, phế liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '133',N'Thuế giá trị gia tăng được khấu trừ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1331',N'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1332',N'Thuế GTGT được khấu trừ của TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1333',N'Thuế GTGT hàng hoá nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '136',N'Phải thu nội bộ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1361',N'Vốn kinh doanh ở các đơn vị trực thuộc', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1368',N'Vốn kinh doanh ở các đơn vị khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '138',N'Phải thu khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1381',N'Tài sản thiếu chờ xử lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1385',N'Phải thu về cổ phần hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1388',N'Các khoản phải thu khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '13881',N'Thuế GTGT đầu vào chưa có hóa đơn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '13888',N'Các khoản khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '139',N'Dự phòng phải thu khó đòi', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '141',N'Tạm ứng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '142',N'Chi phí trả trước ngắn hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1421',N'Chi phí trả trước ngắn hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14211',N'Trả trước tiền thuê văn phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14212',N'Trả trước tiền mua bảo hiểm nhà máy, ngừng sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14213',N'Trả trước tiền mua bảo hiểm xe cộ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm tai nạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm phẫu thuật', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '14218',N'Chi phí trả trước khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1422',N'Chi phí chờ kết chuyển', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '144',N'Thế chấp, ký cược, ký quỹ ngắn hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '151',N'Hàng mua đang đi trên đường', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '152',N'Nguyên liệu, vật liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1521',N'Nguyên vật liệu chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1522',N'Nguyên vật liệu phụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1528',N'Phụ tùng nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '15281',N'Dầu Diesel', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '15282',N'Dầu HO', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '15283',N'Dầu bôi trơn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '15284',N'Trục cán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '15285',N'Phụ tùng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '153',N'Công cụ, dụng cụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1531',N'Công cụ, dụng cụ chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1532',N'Bao bì luân chuyển', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1533',N'Đồ dùng cho thuê', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '154',N'Chi phí sản xuất kinh doanh dở dang', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '155',N'Thành phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '156',N'Hàng hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '157',N'Hàng gửi đi bán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '158',N'Hàng hoá kho bảo thuế', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '159',N'Dự phòng giảm giá hàng tồn kho', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '161',N'Chi sự nghiệp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1611',N'Chi sự nghiệp năm trước', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '1612',N'Chi sự nghiệp năm nay', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '211',N'Tài sản cố định hữu hình', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2111',N'Nhà cửa, vật kiến trúc', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2112',N'Máy móc, thiết bị', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2113',N'Phương tiện vận tải, vật truyền dẫn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2114',N'Thiết bị, dụng cụ quản lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2115',N'Cây lâu năm, súc vật làm việc và cho sản phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2117',N'Đồ đạc', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2118',N'TSCĐ khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '212',N'TSCĐ thuê tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '213',N'TSCĐ vô hình', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2131',N'Quyền sử dụng đất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2132',N'Quyền phát hành', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2133',N'Bản quyền, Bằng sáng chế', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2134',N'Nhãn hiệu hàng hoá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2135',N'Phần mềm máy vi tính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2136',N'Giấy phép và giấy phép nhượng quyền', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2138',N'TSCĐ vô hình khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '214',N'Hao mòn TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2141',N'Hao mòn TSCĐ hữu hình', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2142',N'Hao mòn TSCĐ thuê tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2143',N'Hao mòn TSCĐ vô hình', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2147',N'Hao mòn Bất động sản đầu tư', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '217',N'Bất động sản đầu tư', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '221',N'Đầu tư vào Công ty con', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2211',N'Đầu tư cổ phiếu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2212',N'Đầu tư khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '222',N'Vốn góp liên doanh', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '223',N'Đầu tư vào công ty liên kết', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '228',N'Đầu tư dài hạn khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2281',N'Cổ phiếu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2282',N'Trái phiếu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2282',N'Đầu tư dài hạn khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '229',N'Dự phòng giảm giá đầu tư dài hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '241',N'XDCB dở dang', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2411',N'Mua sắm TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2412',N'Xây dựng cơ bản', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '2413',N'Sửa chữa lớn TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '242',N'Chi phí trả trước dài hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '243',N'Tài sản thuế thu nhập hoãn lại', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '244',N'Ký quỹ ký cược dài hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '311',N'Vay ngắn hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '315',N'Nợ dài hạn đến hạn trả', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '331',N'Phải trả cho người bán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3311',N'Phải trả cho người bán trong nước', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3312',N'Phải trả cho người bán nước ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '333',N'Thuế và các khoản phải nộp nhà nước', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3331',N'Thuế giá trị gia tăng phải nộp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33311',N'Thuế giá trị gia tăng đầu ra', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33312',N'Thuế giá trị gia tăng hàng nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3332',N'Thuế tiêu thụ đặc biệt', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3333',N'Thuế xuất nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33331',N'Thuế xuất khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33332',N'Thuế nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3334',N'Thuế thu nhập doanh nghiệp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3335',N'Thuế thu nhập cá nhân', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3336',N'Thuế tài nguyên', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3337',N'Thuế nhà đất, tiền thuê đất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33371',N'Thuế nhà đất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33372',N'Tiền thuê đất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3338',N'Các loại thuế khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33381',N'Thuế môn bài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33382',N'Các loại thuế khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3339',N'Phí, lệ phí và các khoản phải nộp khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33391',N'Các khoản phụ thu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33392',N'Các khoản phí, lệ phí', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33393',N'Các khoản khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '334',N'Phải trả công nhân viên', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3341',N'Lương phải trả', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3342',N'Trích thưởng cuối năm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3348',N'Phải trả người lao động khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '335',N'Chi phí phải trả', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3351',N'Phải trả lãi vay ngân hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3352',N'Chi phí phải trả', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33521',N'Phải trả tiền điện, nước', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33522',N'Phải trả chi phí điện thọai, thông tin liên lạc', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33523',N'Phải trả chi phí vận chuyển', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33524',N'Phải trả chi phí trợ giá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33525',N'Phải trả chi phí quảng cáo', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '33528',N'Chi phí phải trả khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3353',N'Quỹ dự phòng trợ cấp mất việc làm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '336',N'Phải trả nội bộ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '337',N'Thanh toán theo tiến độ kế hoạch hợp đồng xây dựng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '338',N'Phải trả, phải nộp khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3381',N'Tài sản thừa chờ giải quyết', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3382',N'Kinh phí công đoàn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3383',N'Bảo hiểm xã hội', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3384',N'Bảo hiểm y tế', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3385',N'Phải trả về cổ phần hoá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3386',N'Nhận ký cược, ký quỹ ngắn hạn', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3387',N'Doanh thu chưa thực hiện', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3388',N'Phải trả, phải nộp khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '3389',N'Bảo hiểm thất nghiệp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '413',N'Chênh lệch tỷ giá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '4131',N'Chênh lệch tỷ giá đánh giá lại cuối năm tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '4133',N'Chênh lệch tỷ giá hối đoái chuyển đổi từ báo cáo tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '417',N'Quỹ hỗ trợ sắp xếp và cổ phần hoá doanh nghiệp nhà nước', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '451',N'Quỹ quản lý của cấp trên', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '511',N'Doanh thu bán hàng và cung cấp dịch vụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5111',N'Doanh thu bán hàng hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5112',N'Doanh thu bán thành phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '51121',N'Doanh thu bán hàng chính phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '51122',N'Doanh thu bán thứ phẩm, phế phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5113',N'Doanh thu cung cấp dịch vụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5114',N'Doanh thu trợ cấp, trợ giá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5117',N'Doanh thu kinh doanh bất động sản đầu tư', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '512',N'Doanh thu nội bộ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5121',N'Doanh thu bán hàng hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5122',N'Doanh thu bán thành phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5123',N'Doanh thu cung cấp dịch vụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '515',N'Doanh thu hoạt động tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5151',N'Thu lãi tiền gửi', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5152',N'Thu nhập từ trái phiếu, cổ phiếu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5153',N'Thu nhập từ Công ty liên kết', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5159',N'Chênh lệch tỷ giá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '51591',N'Chênh lệch tỷ giá do thanh tóan', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '51592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '521',N'Chiết khấu hàng hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5211',N'Chiết khấu hàng hóa thương mại', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5212',N'Chiết khấu thành phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '5213',N'Chiết khấu dịch vụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '531',N'Hàng bán bị trả lại', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '532',N'Giảm giá hàng bán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '611',N'Mua hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6111',N'Mua nguyên vật liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6112',N'Mua hàng hóa', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '621',N'Chi phí nguyên, vật liệu trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6211',N'Chi phí nguyên vật liệu chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6212',N'Chi phínguyên vât liệu phụ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '622',N'Chi phí nhân công trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6221',N'Chi phí lương công nhận trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6222',N'Chi phí BHXH công nhân trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6223',N'Chi phí BHYT công nhân trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6224',N'Chi phí thưởng công nhân trực tiếp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6228',N'Chi phí khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '623',N'Chi phí máy thi công', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6231',N'Chi phí máy thi công - nhân viên', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6232',N'Chi phí máy thi công - vật liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6233',N'Chi phí máy thi công - dụng cụ sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6234',N'Chi phí máy thi công - khấu hao', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6237',N'Chi phí máy thi công - dịch vụ mua ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6238',N'Chi phí máy thi công - bằng tiền khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '627',N'Chi phí sản xuất chung', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6271',N'Chi phí nhân viên phân xưởng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '62711',N'Chi phí lương bộ phận quản lý sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '62712',N'Chi phí BHXH bộ phận quản lý sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '62713',N'Chi phí BHYT bộ phận quản lý sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '62714',N'Chi phí thưởng bộ phận quản lý sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '62718',N'Chi phí khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6272',N'Chi phí vật liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6273',N'Chi phí dụng cụ sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6274',N'Chi phí khấu hao TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6277',N'Chi phí dịch vụ mua ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6278',N'Chi phí bằng tiền khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '631',N'Giá thành sản xuất', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '632',N'Giá vốn hàng bán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6321',N'Giá vốn hàng bán', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6329',N'Dự phòng giảm giá hàng tồn kho', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '635',N'Chi phí tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6351',N'Chi phí lãi tiền vay', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6352',N'Chi phí tài chính cho Cổ phiếu trái phiếu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6353',N'Chi phí tài chính', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6359',N'Chênh lệch tỷ giá', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '63591',N'Chênh lệch tỷ giá do thanh tóan', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '63592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '641',N'Chi phí bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6411',N'Chi phí nhân viên', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64111',N'Chi phí lương bộ phận bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64112',N'Chi phí BHXH bộ phận bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64113',N'Chi phí BHYT bộ phận bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64114',N'Chi phí thưởng bộ phận bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64118',N'Chi phí khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6412',N'Chi phí vật liệu bao bì', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6413',N'Chi phí dụng cụ, đồ dùng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6414',N'Chi phí khấu hao TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6415',N'Chi phí bảo hành', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6417',N'Chi phí dịch vụ mua ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6418',N'Chi phí bằng tiền khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6419',N'Chi phí trợ giá, thúc đẩy bán hàng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '642',N'Chi phí quản lý doanh nghiệp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6421',N'Chi phí nhân viên quản lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64211',N'Lương Ban giám đốc', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64212',N'Lương nhân viên quản lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64213',N'Chi phí BHXH bộ phận văn phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64214',N'Chi phí BHYT bộ phận văn phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64215',N'Chi phí thưởng bộ phận văn phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '64218',N'Chi phí khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6422',N'Chi phí vật liệu dùng cho quản lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6423',N'Chi phí đồ dùng văn phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6424',N'Chi phí khấu hao TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6425',N'Thuế, phí, lệ phí', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6426',N'Chi phí dự phòng', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6427',N'Chi phí dịch vụ mua ngoài', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '6428',N'Chi phí bằng tiền khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '711',N'Thu nhập khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '7111',N'Thu thanh lý tài sản', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '71111',N'Thu thanh lý TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '71112',N'Thu thanh lý phế liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '71118',N'Thu khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '7112',N'Thu giảm thuế, hòan thuế, miễn thuế', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '7118',N'Thu nhập khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '7119',N'Thu bồi thường', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '71191',N'Thu bồi thường billet', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '71198',N'Thu bồi thường khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '811',N'Chi phí thanh lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8111',N'Chi phí thanh lý', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '81111',N'Chi phí thanh lý TSCĐ', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '81112',N'Chi phí thanh lý phế liệu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '81113',N'Chi phí thanh lý khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8112',N'Chi phí giảm thuế, hòan thuế, miễn thuế', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8118',N'Chi phí khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8119',N'Chi phí bồi thường', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '81191',N'Chi phí bồi thường sản phẩm', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '81198',N'Chi phí bồi thường khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '821',N'Chi phí thuế thu nhập doanh nghiệp', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8211',N'Chi phí thuế thu nhập doanh nghiệp hiện hành', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '8212',N'Chi phí thuế thu nhập doanh nghiệp hõan lại', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '911',N'Xác định kết quả sản xuất kinh doanh', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '9111',N'Xác định kết quả HĐKD', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '9112',N'Xác định kết quả HĐTC', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), '9113',N'Xác định kết quả HĐ Khác', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), 'DTNK',N'Doanh thu hàng nhập khẩu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), 'GTGT01',N'Điều chỉnh tăng (giảm) thuế GTGT', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[GL_Account] (AccountKey, AccountNo, AccountName, Created, Author, Updated, Editor)
VALUES (NEWID(), 'GTGT02',N'Điều chỉnh tăng (giảm) doanh thu', GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

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
