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
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'GL_Account'))
BEGIN
	DROP TABLE [dbo].[Account]
END
GO

BEGIN
	CREATE TABLE [dbo].[GL_Account](
		[AccountId] [int] IDENTITY(1,1) NOT NULL,
		[AccountKey] [nvarchar](50) NOT NULL,
		[AccountNo] [nvarchar](20) NOT NULL,
		[AccountName] [nvarchar](250) NULL,
		[AccountName_EN] [nvarchar](250) NULL,	
		[Description] [nvarchar](250) DEFAULT NULL,
		[DebitOrCredit] [nvarchar](2) DEFAULT NULL, -- TO DO: update DR || CR		
		[HasChildren] [int] DEFAULT 0,
		[Status] [int] DEFAULT 1,
		[Created] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Updated] [datetime] DEFAULT CURRENT_TIMESTAMP,
		[Author] [nvarchar](50) DEFAULT NULL,
		[Editor] [nvarchar](50) DEFAULT NULL,
		[Deleted] [int] DEFAULT 0
	CONSTRAINT [PK_AccountId] PRIMARY KEY CLUSTERED 
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

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '212',N'TSCĐ thuê tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '213',N'TSCĐ vô hình','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2131',N'Quyền sử dụng đất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2132',N'Quyền phát hành','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2133',N'Bản quyền, Bằng sáng chế','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2134',N'Nhãn hiệu hàng hoá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2135',N'Phần mềm máy vi tính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2136',N'Giấy phép và giấy phép nhượng quyền','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2138',N'TSCĐ vô hình khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '214',N'Hao mòn TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2141',N'Hao mòn TSCĐ hữu hình','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2142',N'Hao mòn TSCĐ thuê tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2143',N'Hao mòn TSCĐ vô hình','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2147',N'Hao mòn Bất động sản đầu tư','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '217',N'Bất động sản đầu tư','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '221',N'Đầu tư vào Công ty con','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2211',N'Đầu tư cổ phiếu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2212',N'Đầu tư khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '222',N'Vốn góp liên doanh','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '223',N'Đầu tư vào công ty liên kết','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '228',N'Đầu tư dài hạn khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2281',N'Cổ phiếu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2282',N'Trái phiếu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2282',N'Đầu tư dài hạn khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '229',N'Dự phòng giảm giá đầu tư dài hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '241',N'XDCB dở dang','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2411',N'Mua sắm TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2412',N'Xây dựng cơ bản','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '2413',N'Sửa chữa lớn TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '242',N'Chi phí trả trước dài hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '243',N'Tài sản thuế thu nhập hoãn lại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '244',N'Ký quỹ ký cược dài hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '311',N'Vay ngắn hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '315',N'Nợ dài hạn đến hạn trả','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '331',N'Phải trả cho người bán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3311',N'Phải trả cho người bán trong nước','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3312',N'Phải trả cho người bán nước ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '333',N'Thuế và các khoản phải nộp nhà nước','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3331',N'Thuế giá trị gia tăng phải nộp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33311',N'Thuế giá trị gia tăng đầu ra','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33312',N'Thuế giá trị gia tăng hàng nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3332',N'Thuế tiêu thụ đặc biệt','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3333',N'Thuế xuất nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33331',N'Thuế xuất khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33332',N'Thuế nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3334',N'Thuế thu nhập doanh nghiệp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3335',N'Thuế thu nhập cá nhân','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3336',N'Thuế tài nguyên','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3337',N'Thuế nhà đất, tiền thuê đất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33371',N'Thuế nhà đất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33372',N'Tiền thuê đất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3338',N'Các loại thuế khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33381',N'Thuế môn bài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33382',N'Các loại thuế khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3339',N'Phí, lệ phí và các khoản phải nộp khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33391',N'Các khoản phụ thu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33392',N'Các khoản phí, lệ phí','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33393',N'Các khoản khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '334',N'Phải trả công nhân viên','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3341',N'Lương phải trả','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3342',N'Trích thưởng cuối năm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3348',N'Phải trả người lao động khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '335',N'Chi phí phải trả','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3351',N'Phải trả lãi vay ngân hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3352',N'Chi phí phải trả','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33521',N'Phải trả tiền điện, nước','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33522',N'Phải trả chi phí điện thọai, thông tin liên lạc','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33523',N'Phải trả chi phí vận chuyển','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33524',N'Phải trả chi phí trợ giá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33525',N'Phải trả chi phí quảng cáo','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '33528',N'Chi phí phải trả khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3353',N'Quỹ dự phòng trợ cấp mất việc làm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '336',N'Phải trả nội bộ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '337',N'Thanh toán theo tiến độ kế hoạch hợp đồng xây dựng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '338',N'Phải trả, phải nộp khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3381',N'Tài sản thừa chờ giải quyết','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3382',N'Kinh phí công đoàn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3383',N'Bảo hiểm xã hội','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3384',N'Bảo hiểm y tế','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3385',N'Phải trả về cổ phần hoá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3386',N'Nhận ký cược, ký quỹ ngắn hạn','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3387',N'Doanh thu chưa thực hiện','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3388',N'Phải trả, phải nộp khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '3389',N'Bảo hiểm thất nghiệp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '413',N'Chênh lệch tỷ giá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '4131',N'Chênh lệch tỷ giá đánh giá lại cuối năm tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '4133',N'Chênh lệch tỷ giá hối đoái chuyển đổi từ báo cáo tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '417',N'Quỹ hỗ trợ sắp xếp và cổ phần hoá doanh nghiệp nhà nước','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '451',N'Quỹ quản lý của cấp trên','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '511',N'Doanh thu bán hàng và cung cấp dịch vụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5111',N'Doanh thu bán hàng hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5112',N'Doanh thu bán thành phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '51121',N'Doanh thu bán hàng chính phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '51122',N'Doanh thu bán thứ phẩm, phế phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5113',N'Doanh thu cung cấp dịch vụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5114',N'Doanh thu trợ cấp, trợ giá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5117',N'Doanh thu kinh doanh bất động sản đầu tư','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '512',N'Doanh thu nội bộ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5121',N'Doanh thu bán hàng hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5122',N'Doanh thu bán thành phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5123',N'Doanh thu cung cấp dịch vụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '515',N'Doanh thu hoạt động tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5151',N'Thu lãi tiền gửi','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5152',N'Thu nhập từ trái phiếu, cổ phiếu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5153',N'Thu nhập từ Công ty liên kết','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5159',N'Chênh lệch tỷ giá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '51591',N'Chênh lệch tỷ giá do thanh tóan','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '51592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '521',N'Chiết khấu hàng hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5211',N'Chiết khấu hàng hóa thương mại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5212',N'Chiết khấu thành phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '5213',N'Chiết khấu dịch vụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '531',N'Hàng bán bị trả lại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '532',N'Giảm giá hàng bán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '611',N'Mua hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6111',N'Mua nguyên vật liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6112',N'Mua hàng hóa','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '621',N'Chi phí nguyên, vật liệu trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6211',N'Chi phí nguyên vật liệu chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6212',N'Chi phínguyên vât liệu phụ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '622',N'Chi phí nhân công trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6221',N'Chi phí lương công nhận trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6222',N'Chi phí BHXH công nhân trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6223',N'Chi phí BHYT công nhân trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6224',N'Chi phí thưởng công nhân trực tiếp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6228',N'Chi phí khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '623',N'Chi phí máy thi công','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6231',N'Chi phí máy thi công - nhân viên','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6232',N'Chi phí máy thi công - vật liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6233',N'Chi phí máy thi công - dụng cụ sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6234',N'Chi phí máy thi công - khấu hao','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6237',N'Chi phí máy thi công - dịch vụ mua ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6238',N'Chi phí máy thi công - bằng tiền khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '627',N'Chi phí sản xuất chung','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6271',N'Chi phí nhân viên phân xưởng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '62711',N'Chi phí lương bộ phận quản lý sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '62712',N'Chi phí BHXH bộ phận quản lý sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '62713',N'Chi phí BHYT bộ phận quản lý sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '62714',N'Chi phí thưởng bộ phận quản lý sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '62718',N'Chi phí khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6272',N'Chi phí vật liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6273',N'Chi phí dụng cụ sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6274',N'Chi phí khấu hao TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6277',N'Chi phí dịch vụ mua ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6278',N'Chi phí bằng tiền khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '631',N'Giá thành sản xuất','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '632',N'Giá vốn hàng bán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6321',N'Giá vốn hàng bán','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6329',N'Dự phòng giảm giá hàng tồn kho','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '635',N'Chi phí tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6351',N'Chi phí lãi tiền vay','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6352',N'Chi phí tài chính cho Cổ phiếu trái phiếu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6353',N'Chi phí tài chính','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6359',N'Chênh lệch tỷ giá','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '63591',N'Chênh lệch tỷ giá do thanh tóan','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '63592',N'Chênh lệch tỷ giá do đánh giá số dư cuối kỳ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '641',N'Chi phí bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6411',N'Chi phí nhân viên','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64111',N'Chi phí lương bộ phận bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64112',N'Chi phí BHXH bộ phận bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64113',N'Chi phí BHYT bộ phận bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64114',N'Chi phí thưởng bộ phận bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64118',N'Chi phí khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6412',N'Chi phí vật liệu bao bì','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6413',N'Chi phí dụng cụ, đồ dùng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6414',N'Chi phí khấu hao TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6415',N'Chi phí bảo hành','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6417',N'Chi phí dịch vụ mua ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6418',N'Chi phí bằng tiền khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6419',N'Chi phí trợ giá, thúc đẩy bán hàng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '642',N'Chi phí quản lý doanh nghiệp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6421',N'Chi phí nhân viên quản lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64211',N'Lương Ban giám đốc','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64212',N'Lương nhân viên quản lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64213',N'Chi phí BHXH bộ phận văn phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64214',N'Chi phí BHYT bộ phận văn phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64215',N'Chi phí thưởng bộ phận văn phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '64218',N'Chi phí khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6422',N'Chi phí vật liệu dùng cho quản lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6423',N'Chi phí đồ dùng văn phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6424',N'Chi phí khấu hao TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6425',N'Thuế, phí, lệ phí','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6426',N'Chi phí dự phòng','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6427',N'Chi phí dịch vụ mua ngoài','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '6428',N'Chi phí bằng tiền khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '711',N'Thu nhập khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '7111',N'Thu thanh lý tài sản','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '71111',N'Thu thanh lý TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '71112',N'Thu thanh lý phế liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '71118',N'Thu khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '7112',N'Thu giảm thuế, hòan thuế, miễn thuế','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '7118',N'Thu nhập khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '7119',N'Thu bồi thường','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '71191',N'Thu bồi thường billet','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '71198',N'Thu bồi thường khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '811',N'Chi phí thanh lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8111',N'Chi phí thanh lý','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '81111',N'Chi phí thanh lý TSCĐ','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '81112',N'Chi phí thanh lý phế liệu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '81113',N'Chi phí thanh lý khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8112',N'Chi phí giảm thuế, hòan thuế, miễn thuế','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8118',N'Chi phí khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8119',N'Chi phí bồi thường','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '81191',N'Chi phí bồi thường sản phẩm','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '81198',N'Chi phí bồi thường khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '821',N'Chi phí thuế thu nhập doanh nghiệp','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8211',N'Chi phí thuế thu nhập doanh nghiệp hiện hành','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '8212',N'Chi phí thuế thu nhập doanh nghiệp hõan lại','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '911',N'Xác định kết quả sản xuất kinh doanh','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '9111',N'Xác định kết quả HĐKD','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '9112',N'Xác định kết quả HĐTC','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), '9113',N'Xác định kết quả HĐ Khác','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), 'DTNK',N'Doanh thu hàng nhập khẩu','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), 'GTGT01',N'Điều chỉnh tăng (giảm) thuế GTGT','SYSTEM','SYSTEM');

INSERT INTO [dbo].[Account] (AccountKey, AccountNo, AccountName, Author, Editor)
VALUES (NEWID(), 'GTGT02',N'Điều chỉnh tăng (giảm) doanh thu','SYSTEM','SYSTEM');
