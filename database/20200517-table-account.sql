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
VALUES (NEWID(), '000',N'Tài khoản trung gian','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '001',N'Tài sản cho thuê ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '002',N'Vật tư, hàng hóa nhận giữ hộ, nhận gia công','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '003',N'Hàng hóa bán hộ, nhận ký gởi','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '004',N'Nợ khó đòi đã xử lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '007',N'Ngoại tệ các loại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '005',N'Nguồn vốn khấu hao cơ bản','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '111',N'Tiền mặt','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '111',N'Tiền mặt','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1111',N'Tiền mặt Việt Nam','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11111',N'Tiền mặt Việt Nam tại quỹ HCM','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11112',N'Tiền mặt Việt Nam tại quỹ Phú Mỹ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11113',N'Tiền mặt Việt Nam tại quỹ Cần Thơ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1112',N'Tiền mặt ngoại tệ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11121',N'Tiền mặt ngoại tệ tại quỹ HCM','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11122',N'Tiền mặt ngoại tệ tại quỹ Phú Mỹ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '11123',N'Tiền mặt ngoại tệ tại quỹ Cần Thơ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1113',N'Vàng bạc, kim khí quý, đá quý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '112',N'Tiền gửi ngân hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1121',N'Tiền gửi Việt Nam đồng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1122',N'Tiền gửi ngoại tệ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1123',N'Vàng bạc, kim khí quý, đá quý gửi ngân hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '113',N'Tiền đang chuyển','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1131',N'Tiền đang chuyển Việt Nam đồng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1132',N'Tiền đang chuyển ngoại tệ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '131',N'Phải thu của khách hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1311',N'Phải thu của khách hàng mua hàng chính phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1312',N'Phải thu của khách hàng mua hàng thứ phẩm, phế liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '133',N'Thuế giá trị gia tăng được khấu trừ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1331',N'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1332',N'Thuế GTGT được khấu trừ của TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1333',N'Thuế GTGT hàng hoá nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '136',N'Phải thu nội bộ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1361',N'Vốn kinh doanh ở các đơn vị trực thuộc','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1368',N'Vốn kinh doanh ở các đơn vị khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '138',N'Phải thu khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1381',N'Tài sản thiếu chờ xử lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1385',N'Phải thu về cổ phần hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1388',N'Các khoản phải thu khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '13881',N'Thuế GTGT đầu vào chưa có hóa đơn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '13888',N'Các khoản khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '139',N'Dự phòng phải thu khó đòi','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '141',N'Tạm ứng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '142',N'Chi phí trả trước ngắn hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1421',N'Chi phí trả trước ngắn hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14211',N'Trả trước tiền thuê văn phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14212',N'Trả trước tiền mua bảo hiểm nhà máy, ngừng sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14213',N'Trả trước tiền mua bảo hiểm xe cộ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm tai nạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14214',N'Trả trước tiền mua bảo hiểm phẫu thuật','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '14218',N'Chi phí trả trước khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1422',N'Chi phí chờ kết chuyển','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '144',N'Thế chấp, ký cược, ký quỹ ngắn hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '151',N'Hàng mua đang đi trên đường','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '152',N'Nguyên liệu, vật liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1521',N'Nguyên vật liệu chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1522',N'Nguyên vật liệu phụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1528',N'Phụ tùng nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '15281',N'Dầu Diesel','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '15282',N'Dầu HO','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '15283',N'Dầu bôi trơn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '15284',N'Trục cán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '15285',N'Phụ tùng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '153',N'Công cụ, dụng cụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1531',N'Công cụ, dụng cụ chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1532',N'Bao bì luân chuyển','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1533',N'Đồ dùng cho thuê','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '154',N'Chi phí sản xuất kinh doanh dở dang','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '155',N'Thành phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '156',N'Hàng hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '157',N'Hàng gửi đi bán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '158',N'Hàng hoá kho bảo thuế','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '159',N'Dự phòng giảm giá hàng tồn kho','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '161',N'Chi sự nghiệp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1611',N'Chi sự nghiệp năm trước','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '1612',N'Chi sự nghiệp năm nay','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '211',N'Tài sản cố định hữu hình','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2111',N'Nhà cửa, vật kiến trúc','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2112',N'Máy móc, thiết bị','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2113',N'Phương tiện vận tải, vật truyền dẫn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2114',N'Thiết bị, dụng cụ quản lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2115',N'Cây lâu năm, súc vật làm việc và cho sản phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2117',N'Đồ đạc','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2118',N'TSCĐ khác','SYSTEM','SYSTEM');










