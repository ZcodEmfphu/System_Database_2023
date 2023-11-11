create database th3;
go
use th3;
ALTER DATABASE th3 MODIFY NAME = TH3;

create table HOCVIEN(
	MAHV varchar(10) PRIMARY KEY,
	HO varchar(100),
	TEN varchar(50),
	NGSINH date,
	GIOITINH varchar(3),
	NOISINH varchar(15),
	MALOP varchar(10)
)

create table LOP(
	MALOP varchar(10) PRIMARY KEY,
	TENLOP varchar(50),
	TRGLOP varchar(10),
	SISO int,
	MAGVCN varchar(10)
)

create table KHOA(
	MAKHOA varchar(20) PRIMARY KEY,
	TENKHOA varchar(50),
	NGTLAP date,
	TRGKHOA varchar(10)
)

create table MONHOC(
	MAMH varchar(20) PRIMARY KEY,
	TENMH varchar(50),
	TCLT int,
	TCTH int,
	MAKHOA varchar(20)
)

create table DIEUKIEN(
	MAMH varchar(20),
	MAMH_TRUOC varchar(20)
	CONSTRAINT FK_DKMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
	CONSTRAINT FK_DKMHT FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH),
	CONSTRAINT PK_DK PRIMARY KEY(MAMH, MAMH_TRUOC)
)

create table GIAOVIEN(
	MAGV varchar(10) PRIMARY KEY,
	HOTEN varchar(255),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH date,
	NGVL date,
	HESO decimal(2),
	MUCLUONG money,
	MAKHOA varchar(20)
)

create table GIANGDAY(
	MALOP varchar(10),
	MAMH varchar(20),
	MAGV varchar(10),
	HOCKY int,
	NAM int,
	TUNGAY date,
	DENNGAY date,
	CONSTRAINT FK_GDL FOREIGN KEY(MALOP) REFERENCES LOP(MALOP),
	CONSTRAINT FK_GDMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
	CONSTRAINT FK_GDGV FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV),
	CONSTRAINT PK_GD PRIMARY KEY(MALOP, MAMH)
)

create table KETQUATHI(
	MAHV varchar(10),
	MAMH varchar(20),
	LANTHI int,
	NGTHI date,
	DIEM decimal(2),
	KQUA varchar(10),
	CONSTRAINT FK_KQHV FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV),
	CONSTRAINT FK_KQMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
	CONSTRAINT PK_KQ PRIMARY KEY(MAHV, MAMH, LANTHI)
)
ALTER TABLE KETQUATHI 
ALTER COLUMN DIEM decimal(5,2)

--DELETE KETQUATHI

ALTER TABLE HOCVIEN ADD FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
ALTER TABLE LOP ADD FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE KHOA ADD FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE MONHOC ADD FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE GIAOVIEN ADD FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)

INSERT INTO KHOA VALUES ('KHMT','Khoa hoc may tinh','2005-06-07',NULL)
INSERT INTO KHOA VALUES ('HTTT','He thong thong tin','2005-06-07',NULL)
INSERT INTO KHOA VALUES ('CNPM','Cong nghe phan mem','2005-05-07',NULL)
INSERT INTO KHOA VALUES ('MTT','Mang va truyen thong','2005-10-20',NULL)
INSERT INTO KHOA VALUES ('KTMT','Ky thuat may tinh','2005-12-20',NULL)

INSERT INTO GIAOVIEN VALUES ('GV01','Ho Thanh Son','PTS','GS','Nam','1950-05-02','2004-01-11','5.00','2250000','KHMT')
INSERT INTO GIAOVIEN VALUES ('GV02','Tran Tam Thanh','TS','PGS','Nam','1965-12-17','2004-04-20','4.50','2025000','HTTT')
INSERT INTO GIAOVIEN VALUES ('GV03','Do Nghiem Phung','TS','GS','Nu','1950-08-01','2004-09-23','4.00','1800000','CNPM')
INSERT INTO GIAOVIEN VALUES ('GV04','Tran Nam Son','TS','PGS','Nam','1961-02-22','2005-01-12','4.50','2025000','KTMT')
INSERT INTO GIAOVIEN VALUES ('GV05','Mai Thanh Danh','Ths','GV','Nam','1958-03-12','2005-01-12','3.00','1350000','HTTT')
INSERT INTO GIAOVIEN VALUES ('GV06','Tran Doan Hung','TS','GV','Nam','1953-03-11','2005-01-12','4.50','2025000','KHMT')
INSERT INTO GIAOVIEN VALUES ('GV07','Nguyen Minh Tien','Ths','GV','Nam','1971-11-23','2005-03-01','4.00','1800000','KHMT')
INSERT INTO GIAOVIEN VALUES ('GV08','Le Thi Tran','KS',NULL,'Nu','1974-03-26','2005-03-01','1.69','760500','KHMT')
INSERT INTO GIAOVIEN VALUES ('GV09','Nguyen To Lan','Ths','GV','Nu','1966-12-31','2005-03-01','4.00','1800000','HTTT')
INSERT INTO GIAOVIEN VALUES ('GV10','Le Tran Anh Loan','KS',NULL,'Nu','1972-07-17','2005-03-01','1.86','837000','CNPM')
INSERT INTO GIAOVIEN VALUES ('GV11','Ho Thanh Tung','CN','GV','Nam','1980-01-12','2005-05-15','2.67','1201500','MTT')
INSERT INTO GIAOVIEN VALUES ('GV12','Tran Van Anh','CN',NULL,'Nu','1981-03-29','2005-05-15','1.69','760500','CNPM')
INSERT INTO GIAOVIEN VALUES ('GV13','Nguyen Linh Dan','CN',NULL,'Nu','1980-05-23','2005-05-15','1.69','760500','KTMT')
INSERT INTO GIAOVIEN VALUES ('GV14','Nguyen Minh Chau','Ths','GV','Nu','1976-11-30','2005-05-15','3.00','1350000','MTT')
INSERT INTO GIAOVIEN VALUES ('GV15','Le Ha Thanh','Ths','GV','Nam','1978-05-04','2005-05-15','3.00','1350000','KHMT')

UPDATE KHOA SET TRGKHOA = 'GV01' WHERE MAKHOA = 'KHMT'
UPDATE KHOA SET TRGKHOA = 'GV02' WHERE MAKHOA = 'HTTT'
UPDATE KHOA SET TRGKHOA = 'GV04' WHERE MAKHOA = 'CNPM'
UPDATE KHOA SET TRGKHOA = 'GV03' WHERE MAKHOA = 'MTT'

INSERT INTO MONHOC VALUES ('THDC','Tin hoc dai cuong',4,1,'KHMT'),
							('CTRR','Cau truc roi rac',5,0,'KHMT'),
							('CDSL','Cos so du lieu',3,1,'HTTT'),
							('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT'),
							('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT'),
							('DHMT','Do hoa may tinh',3,1,'KHMT'),
							('KTMT','Kien truc may tinh',3,0,'KHMT'),
							('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT'),
							('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT'),
							('HDH','He dieu hanh',4,0,'KHMT'),
							('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM'),
							('LTCFW','Lap trinh C for win',3,1,'CNPM'),
							('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
UPDATE MONHOC SET MAMH = 'CSDL', TENMH = 'Co so du lieu' WHERE MAMH = 'CDSL'

INSERT INTO DIEUKIEN VALUES ('CSDL','CTRR'),
							('CSDL','CTDLGT'),
							('CTDLGT','THDC'),
							('PTTKTT','THDC'),
							('PTTKTT','CTDLGT'),
							('DHMT','THDC'),
							('LTHDT','THDC'),
							('PTTKHTTT','CSDL')
							
INSERT INTO LOP VALUES ('K11','Lop 1 khoa 1',NULL,11,'GV07'),
						('K12','Lop 2 khoa 1',NULL,12,'GV09'),
						('K13','Lop 3 khoa 1',NULL,12,'GV14')

INSERT INTO HOCVIEN VALUES ('K1101','Nguyen Van','A','1986-01-27','Nam','TpHCM','K11'),
							('K1102','Tran Ngoc','Han','1986-03-14','Nu','Kien Giang','K11'),
							('K1103','Ha Duy','Lap','1986-03-14','Nam','Nghe An','K11'),
							('K1104','Tran Ngoc','Linh','1986-04-18','Nu','Tay Ninh','K11'),
							('K1105','Le Nhat','Minh','1986-03-30','Nam','TpHCM','K11'),
							('K1106','Nguyen Nhu','Nhut','1986-02-27','Nam','TpHCM','K11'),
							('K1107','Nguyen Manh','Tam','1986-01-24','Nam','Ha Noi','K11'),
							('K1108','Phan Thi Thanh','Tam','1986-02-27','Nam','Kien Giang','K11'),
							('K1109','Le Hoai','Thuong','1986-01-27','Nu','Vinh Long','K11'),
							('K1110','Le Ha','Vinh','1986-02-05','Nu','Can Tho','K11'),
							('K1111','Nguyen Van','B','1986-12-25','Nam','Vinh Long','K11'),
							('K1201','Nguyen Thi Kim','Duyen','1986-02-12','Nam','TpHCM','K12'),
							('K1202','Tran Thi Kim','Duyen','1986-01-18','Nu','TpHCM','K12'),
							('K1203','Truong My','Hanh','1986-09-17','Nu','TpHCM','K12'),
							('K1204','Nguyen Thanh','Nam','1986-05-19','Nu','Dong Nai','K12'),
							('K1205','Tran Minh','Long','1986-04-17','Nam','TpHCM','K12'),
							('K1206','Nguyen Thi Truc','Thanh','1986-03-04','Nu','Kien Giang','K12'),
							('K1207','Tran Thi Bich','Thuy','1986-02-08','Nu','Nghe An','K12'),
							('K1208','Huynh Thi Kim','Trieu','1986-04-08','Nu','Tay Ninh','K12'),
							('K1209','Phan Thanh','Trieu','1986-02-23','Nam','TpHCM','K12'),
							('K1210','Ngo Thanh','Tuan','1986-02-14','Nam','TpHCM','K12'),
							('K1211','Do Thi','Xuan','1986-03-09','Nu','Ha Noi','K12'),
							('K1212','Le Thi Phi','Yen','1986-03-12','Nu','TpHCM','K12'),
							('K1301','Nguyen Thi Kim','Cuc','1986-06-09','Nu','Kien Giang','K13'),
							('K1302','Truong Thi My','Hien','1986-03-18','Nu','Nghe An','K13'),
							('K1303','Le Duc','Hien','1986-03-21','Nam','Tay Ninh','K13'),
							('K1304','Le Quang','Hien','1986-04-18','Nam','TpHCM','K13'),
							('K1305','Le Thi','Huong','1986-03-27','Nu','TpHCM','K13'),
							('K1306','Nguyen Thai','Huu','1986-03-30','Nam','Ha Noi','K13'),
							('K1307','Tran Minh','Man','1986-05-28','Nam','TpHCM','K13'),
							('K1308','Tran Hieu','Nghia','1986-04-08','Nam','Kien Giang','K13'),
							('K1309','Nguyen Trung','Nghia','1987-01-18','Nam','Nghe An','K13'),
							('K1310','Tran Thi Hong','Tham','1986-04-22','Nu','Tay Ninh','K13'),
							('K1311','Tran Minh','Thuc','1986-04-04','Nam','TpHCM','K13'),
							('K1312','Nguyen Thi Kim','Yen','1986-09-07','Nu','TpHCM','K13')
DELETE HOCVIEN

UPDATE LOP SET TRGLOP = 'K1108' WHERE MALOP = 'K11'
UPDATE LOP SET TRGLOP = 'K1205' WHERE MALOP = 'K12'
UPDATE LOP SET TRGLOP = 'K1305' WHERE MALOP = 'K13'

INSERT INTO GIANGDAY VALUES ('K11','THDC','GV07',1,2006,'2006-01-02','2006-05-12'),
							('K12','THDC','GV06',1,2006,'2006-01-02','2006-05-12'),
							('K13','THDC','GV15',1,2006,'2006-01-02','2006-05-12'),
							('K11','CTRR','GV02',1,2006,'2006-01-09','2006-05-17'),
							('K12','CTRR','GV02',1,2006,'2006-01-09','2006-05-17'),
							('K13','CTRR','GV08',1,2006,'2006-01-09','2006-05-17'),
							('K11','CSDL','GV05',2,2006,'2006-06-01','2006-07-15'),
							('K12','CSDL','GV09',2,2006,'2006-06-01','2006-07-15'),
							('K13','CTDLGT','GV15',2,2006,'2006-06-01','2006-07-15'),
							('K13','CSDL','GV05',3,2006,'2006-08-01','2006-12-15'),
							('K13','DHMT','GV07',3,2006,'2006-08-01','2006-12-15'),
							('K11','CTDLGT','GV15',3,2006,'2006-08-01','2006-12-15'),
							('K12','CTDLGT','GV15',3,2006,'2006-08-01','2006-12-15'),
							('K11','HDH','GV04',1,2007,'2007-01-02','2007-02-18'),
							('K12','HDH','GV04',1,2007,'2007-01-02','2007-03-20'),
							('K11','DHMT','GV07',1,2007,'2007-02-18','2007-03-20')

INSERT INTO KETQUATHI VALUES ('K1101','CSDL',1,'2006-07-20','10.00','Dat'),
							('K1101','CTDLGT',1,'2006-12-28','9.00','Dat'),
							('K1101','THDC',1,'2006-05-20','9.00','Dat'),
							('K1101','CTRR',1,'2006-05-13','9.50','Dat'),
							('K1102','CSDL',1,'2006-07-20','4.00','Khong Dat'),
							('K1102','CSDL',2,'2006-07-27','4.25','Khong Dat'),
							('K1102','CSDL',3,'2006-10-08','4.50','Khong Dat'),
							('K1102','CTDLGT',1,'2006-12-28','4.50','Khong Dat'),
							('K1102','CTDLGT',2,'2007-12-28','4.00','Khong Dat'),
							('K1102','CTDLGT',3,'2007-01-15','6.00','Dat'),
							('K1102','THDC',1,'2006-05-20','5.00','Dat'),
							('K1102','CTRR',1,'2006-05-13','7.00','Dat'),
							('K1103','CSDL',1,'2006-07-20','3.50','Khong Dat'),
							('K1103','CSDL',2,'2006-07-27','8.25','Dat'),
							('K1103','CTDLGT',1,'2006-12-28','7.00','Dat'),
							('K1103','THDC',1,'2006-05-20','8.00','Dat'),
							('K1103','CTRR',1,'2006-05-13','6.50','Dat'),
							('K1104','CSDL',1,'2006-07-20','3.75','Khong Dat'),
							('K1104','CTDLGT',1,'2006-12-28','4.00','Khong Dat'),
							('K1104','THDC',1,'2006-05-20','4.00','Khong Dat'),
							('K1104','CTRR',1,'2006-05-13','4.00','Khong Dat'),
							('K1104','CTRR',2,'2006-05-20','3.50','Khong Dat'),
							('K1104','CTRR',3,'2006-06-30','4.00','Khong Dat'),
							('K1201','CTRR',1,'2006-05-13','9.00','Dat'),
							('K1201','CSDL',1,'2006-07-20','6.00','Dat'),
							('K1201','CTDLGT',1,'2006-12-28','5.00','Dat'),
							('K1201','THDC',1,'2006-05-20','8.50','Dat'),
							('K1202','CSDL',1,'2006-07-20','8.00','Dat'),
							('K1202','CTDLGT',1,'2006-12-28','4.00','Khong Dat'),
							('K1202','CTDLGT',2,'2007-01-05','5.00','Dat'),
							('K1202','THDC',1,'2006-05-20','4.00','Khong Dat'),
							('K1202','THDC',2,'2006-05-27','4.00','Khong Dat'),
							('K1202','CTRR',1,'2006-05-13','3.00','Khong Dat'),
							('K1202','CTRR',2,'2006-05-20','4.00','Khong Dat'),
							('K1202','CTRR',3,'2006-06-30','6.25','Dat'),
							('K1203','CSDL',1,'2006-07-20','9.25','Dat'),
							('K1203','CTDLGT',1,'2006-12-28','9.50','Dat'),
							('K1203','THDC',1,'2006-05-20','10.00','Dat'),
							('K1203','CTRR',1,'2006-05-13','10.00','Dat'),
							('K1204','CSDL',1,'2006-07-20','8.50','Dat'),
							('K1204','CTDLGT',1,'2006-12-28','6.75','Dat'),
							('K1204','THDC',1,'2006-05-20','4.00','Khong Dat'),
							('K1204','CTRR',1,'2006-05-13','6.00','Dat'),
							('K1301','CSDL',1,'2006-12-20','4.25','Khong Dat'),
							('K1301','CTDLGT',1,'2006-07-25','8.00','Dat'),
							('K1301','THDC',1,'2006-05-20','7.75','Dat'),
							('K1301','CTRR',1,'2006-05-13','8.00','Dat'),
							('K1302','CSDL',1,'2006-12-20','6.75','Dat'),
							('K1302','CTDLGT',1,'2006-07-25','5.00','Dat'),
							('K1302','THDC',1,'2006-05-20','8.00','Dat'),
							('K1302','CTRR',1,'2006-05-13','8.50','Dat'),
							('K1303','CSDL',1,'2006-12-20','4.00','Khong Dat'),
							('K1303','CTDLGT',1,'2006-07-25','4.50','Khong Dat'),
							('K1303','CTDLGT',2,'2006-08-07','4.00','Khong Dat'),
							('K1303','CTDLGT',3,'2006-08-15','4.25','Khong Dat'),
							('K1303','THDC',1,'2006-05-20','4.50','Khong Dat'),
							('K1303','CTRR',1,'2006-05-13','3.25','Khong Dat'),
							('K1303','CTRR',2,'2006-05-20','5.00','Dat'),
							('K1304','CSDL',1,'2006-12-20','7.75','Dat'),
							('K1304','CTDLGT',1,'2006-07-25','9.75','Dat'),
							('K1304','THDC',1,'2006-05-20','5.50','Dat'),
							('K1304','CTRR',1,'2006-05-13','5.00','Dat'),
							('K1305','CSDL',1,'2006-12-20','9.25','Dat'),
							('K1305','CTDLGT',1,'2006-07-25','10.00','Dat'),
							('K1305','THDC',1,'2006-05-20','8.00','Dat'),
							('K1305','CTRR',1,'2006-05-13','10.00','Dat')

UPDATE GIAOVIEN SET HOCHAM = ' ' WHERE HOCHAM IS NULL

							-- Bai 4 & trigger
-- Batchs:
-- 1. Sử dụng kiểu dữ liệu cursor, viết đoạn chương trình in danh sách giáo viên của từng khoa như sau:
----------- DANH SACH GIAO VIEN KHOA: <TENKHOA>
--			<STT> <HOTEN> <HOCVI> <HOCHAM> 

DECLARE @MAKHOA varchar(20), @TENKHOA varchar(50), @message char(1800), @STT int = 0, @MAGV varchar(10), @HOTEN varchar(255), @HOCVI varchar(10), @HOCHAM varchar(10)
DECLARE khoa_cursor CURSOR 
FOR SELECT MAKHOA, TENKHOA
FROM KHOA

OPEN khoa_cursor
FETCH NEXT FROM khoa_cursor INTO @MAKHOA, @TENKHOA
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message = '--- DANH SACH GIAO VIEN KHOA: ' + @TENKHOA
	PRINT @message

	DECLARE giaovien_cursor CURSOR
	FOR SELECT gv.MAGV, gv.HOTEN, gv.HOCVI, gv.HOCHAM, gv.MAKHOA
	FROM GIAOVIEN gv
	WHERE gv.MAKHOA = @MAKHOA

	OPEN giaovien_cursor
	FETCH NEXT FROM giaovien_cursor INTO @MAGV, @HOTEN, @HOCVI, @HOCHAM, @MAKHOA
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @STT = @STT + 1
		SELECT @message = CAST(@STT AS nvarchar) + '		' + @HOTEN + '		' + @HOCVI + '		' + @HOCHAM
		PRINT @message
		FETCH NEXT FROM giaovien_cursor INTO @MAGV, @HOTEN, @HOCVI, @HOCHAM, @MAKHOA
	END
	CLOSE giaovien_cursor
	DEALLOCATE giaovien_cursor
	-- get the next depart ment
	FETCH NEXT FROM khoa_cursor INTO @MAKHOA, @TENKHOA
END
CLOSE khoa_cursor
DEALLOCATE khoa_cursor

-- 2. Sử dụng cấu trúc vòng lập While, sử dụng sequence để tạo MAMH, TENMH, nhập 10 mẫu tin vào bảng MONHOC với nội dung:
-- MALOP có giá trị là ‘M1’,M2,....,’M10’
-- TENMH có giá trị là ‘Mon 1’, Mon 2’,......, ‘Mon 10’
-- Các thuộc tính còn lại có giá trị NULL

DECLARE @i AS int = 0
WHILE @i < 10
	BEGIN
		SET @i = @i + 1;
		INSERT MONHOC (MAMH, TENMH) VALUES ('M' + CAST(@i AS nvarchar),'Mon' + CAST(@i AS nvarchar))
		PRINT @i
	END

SELECT * FROM MONHOC
GO


-- Functions:
-- 1. Tạo hàm F_DTB cho biết điểm trung bình các môn thi của học viên. Mỗi môn thi, chỉ lấy điểm của lần thi sau cùng 
-- (mã học viên là tham số của hàm).

CREATE VIEW V_RankerScores AS 
	SELECT MAHV, MAMH, DIEM, ROW_NUMBER() OVER (PARTITION BY MAHV, MAMH ORDER BY LANTHI DESC) AS RowNum
	FROM KETQUATHI
GO

CREATE VIEW V_Scores AS 
	SELECT MAHV, MAMH, DIEM
	FROM V_RankerScores
	WHERE RowNum = 1
GO

SELECT * FROM V_Scores
GO

CREATE FUNCTION F_DTB
(
	@MAHV varchar(10)
)
RETURNS decimal(5,2)
AS
	BEGIN
		DECLARE @result decimal(5,2)
		SET @result = (SELECT AVG(DIEM)
						FROM V_Scores
						WHERE MAHV = @MAHV
						)
		RETURN @result
	END
GO

SELECT dbo.F_DTB('K1101') AS DTB
GO

-- 2. Tạo hàm F_XL có mã học viên là tham số, cho biết kết quả xếp loại của học viên như sau:
-- Nếu DIEMTB ≥ 9 thì XEPLOAI =”XS”
-- Nếu 8 ≤ DIEMTB < 9 thì XEPLOAI = “G”
-- Nếu 6.5 ≤ DIEMTB < 8 thì XEPLOAI = “K”
-- Nếu 5 ≤ DIEMTB < 6.5 thì XEPLOAI = “TB”
-- Nếu DIEMTB < 5 thì XEPLOAI = ”Y” .
CREATE FUNCTION F_XL
(
	@MAHV varchar(10)
)
RETURNS varchar(5)
AS
	BEGIN
		DECLARE @result varchar(5), @dtb decimal(5,2)
		SET @dtb = dbo.F_DTB(@MAHV)
		IF @dtb >= 9
			SET @result = 'XS'
		ELSE IF @dtb >= 8
			SET @result = 'G'
		ELSE IF @dtb >= 6.5
			SET @result = 'K'
		ELSE IF @dtb >= 5
			SET @result = 'TB'
		ELSE SET @result = 'Y'
		RETURN @result
	END
GO

SELECT dbo.F_XL('K1102') AS XEPLOAI
GO

-- 3. Tạo hàm F_DSMON cho biết danh sách điểm các môn học mà học viên có kết quả ‘đạt’.
-- Danh sách gồm: MAMH, TENMH, ĐIỂM
-- Mã học viên là tham số của hàm
CREATE FUNCTION F_DSMON 
(
	@MAHV varchar(10)
)
RETURNS TABLE
AS
	RETURN ( SELECT kq.MAMH, mh.TENMH, DIEM
			FROM KETQUATHI kq, MONHOC mh
			WHERE kq.KQUA = 'Dat' AND MAHV = @MAHV AND kq.MAMH = mh.MAMH
			GROUP BY kq.MAMH, TENMH, DIEM
	)
GO

SELECT * FROM F_DSMON('K1102')
GO

-- 4. Tạo hàm F_DSGV cho biết danh sách giáo viên đã dạy hết các môn mà khoa phụ trách. Hàm có tham số là mã khoa
CREATE FUNCTION F_DSGV
(
	@MAKHOA varchar(20)
)
RETURNS TABLE
AS
	RETURN (
		SELECT DISTINCT g.MAGV, g.HOTEN
		FROM GIAOVIEN g
		WHERE EXISTS ( SELECT m.MAMH
						FROM MONHOC m, GIANGDAY gd
						WHERE m.MAKHOA = @MAKHOA AND gd.MAGV = g.MAGV
					)
	)
GO

SELECT * FROM F_DSGV('KHMT')
GO

-- 5. Tạo hàm trả về danh sách học viên và kết quả xếp loại từng học viên của lớp.
-- Thông tin gồm: MAHV, Họ & tên HV, Điểm trung bình, xếp loại.
-- Mã lớp là tham số của hàm
CREATE FUNCTION F_DSHV
(
	@MALOP varchar(10)
)
RETURNS TABLE
AS
	RETURN (
			SELECT MAHV, HO, TEN, dbo.F_DTB(MAHV) AS DTB, dbo.F_XL(MAHV) AS XL
			FROM HOCVIEN hv, LOP l
			WHERE hv.MALOP = @MALOP AND hv.MALOP = l.MALOP
			)
GO

SELECT * FROM F_DSHV('K11')
GO


-- Procedures:
-- 1. Tạo thủ tục P_KQMH, cho biết bảng điểm của học viên (p_mahv).
-- Thông tin gồm: Mã học viên, tên học viên, mã môn học, tên môn học, điểm (chỉ lấy điểm của lần thi cuối cùng), kết quả
-- Thủ tục nhận tham số đầu vào là mã học viên (p_mahv)

CREATE PROCEDURE P_KQMH 
	@p_mahv varchar(10)
AS 
BEGIN
	SELECT v.MAHV, hv.HO, hv.TEN, v.MAMH, mh.TENMH, v.DIEM
	FROM HOCVIEN hv, MONHOC mh, V_Scores v
	WHERE hv.MAHV = v.MAHV AND mh.MAMH = v.MAMH AND hv.MAHV = @p_mahv
END
GO

EXECUTE P_KQMH @p_mahv = 'K1102'
GO

-- 2. Tạo thủ tục P_GVMH, cho biết danh sách sinh viên học môn (p_mamh) do giáo viên (p_mgv) phụ trách trong học kỳ (p_hocky), năm học (p_nam).
-- Thông tin gồm: Mã GV, mã môn học, mahv, ho&ten hoc vien
-- Thủ tục nhận các tham số đầu vào là mã môn học (p_mamh), mã giáo viên (p_mgv), học kỳ (p_hocky), năm học (p_nam).

CREATE PROCEDURE P_GVMH
	@p_mgv varchar(10),
	@p_mamh varchar(20), 
	@p_hocky int,
	@p_nam int
AS 
BEGIN
	SELECT  gd.MAGV, gd.MAMH, hv.MAHV, hv.HO, hv.TEN
	FROM HOCVIEN hv, GIANGDAY gd
	WHERE gd.MAGV = @p_mgv AND gd.MAMH = @p_mamh AND gd.HOCKY = @p_hocky AND gd.NAM = @p_nam AND gd.MALOP = hv.MALOP
END
GO

EXECUTE P_GVMH @p_mamh = 'HDH', @p_mgv = 'GV04', @p_hocky = 1, @p_nam = 2007
GO

-- 3. Tạo thủ tục P_LOP cho biết danh sách học viên của lớp (p_malop).
-- Thông tin gồm: mã lớp, mgvcn, tên gv chủ nhiệm, tên trưởng lớp, mahv, ho&ten học viên.
-- Thủ tục nhận 1 tham số đầu vào là mã lớp (p_malop).

CREATE PROCEDURE P_LOP 
	@p_malop varchar(10)
AS 
BEGIN
	SELECT l.MALOP, l.MAGVCN, l.TRGLOP, hv.MAHV, hv.HO, hv.TEN
	FROM HOCVIEN hv, LOP l
	WHERE hv.MALOP = l.MALOP
END
GO

EXECUTE P_LOP @p_malop = 'K11'
GO

-- 4. Tạo thủ tục P_TOPN liệt kê danh sách n môn học có số lượng học đăng ký học nhiều nhất.
-- Thông tin gồm: Mã môn học, tên môn học, số lượng học viên
-- Thủ tục nhận 1 tham số đầu vào là n.

CREATE PROCEDURE P_TOPN 
	@n int
AS 
BEGIN
	SELECT TOP(@n) gd.MAMH, mh.TENMH, sum(l.SISO) AS SISO
	FROM LOP l, GIANGDAY gd, MONHOC mh
	WHERE gd.MAMH = mh.MAMH AND l.MALOP = gd.MALOP
	GROUP BY gd.MAMH, mh.TENMH
	ORDER BY SISO desc
END
GO

EXECUTE P_TOPN @n = 6
GO

-- 5. Tạo thủ tục P_TK, thống kê số lượng học viên của từng môn học mà giáo viên (p_magv) đã phụ trách giảng dạy.
-- Thông tin gồm: MAGV, tên gv, mamh, tenmh, số lượng học viên
-- Thủ tục nhận 1 tham số đầu vào là mã giáo viên (p_magv).

CREATE PROCEDURE P_TK 
	@p_mgv varchar(10)
AS 
BEGIN
	SELECT gd.MAGV, gv.HOTEN, gd.MAMH, mh.TENMH, sum(l.SISO) AS SISO
	FROM GIANGDAY gd, LOP l, MONHOC mh, GIAOVIEN gv
	WHERE gd.MAGV = gv.MAGV AND gd.MAMH = mh.MAMH AND gd.MALOP = l.MALOP AND gd.MAGV = @p_mgv
	GROUP BY gd.MAGV, gv.HOTEN, gd.MAMH, mh.TENMH
END
GO

EXECUTE P_TK @p_mgv = 'GV07'
GO

-- Triggers:
-- 1. Học viên thi một môn tối đa 3 lần.
CREATE TRIGGER c1
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT 1
		FROM inserted
		WHERE LANTHI <= 3
		)
	BEGIN 
		PRINT('Học viên thi một môn tối đa 3 lần')
		ROLLBACK
	END
END
GO

-- 2. Học kỳ chỉ có giá trị từ 1 đến 3.
CREATE TRIGGER hocky
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT 1
		FROM inserted
		WHERE HOCKY BETWEEN 1 AND 3
		)
	BEGIN 
		PRINT('GIA TRI CUA COT HOCKY PHAI NAM TRONG KHOANG 1 DEN 3')
		ROLLBACK
	END
END
GO

-- 3. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
CREATE TRIGGER c3
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT 1
					FROM inserted
					WHERE HOCVI IN ('CN','KS','ThS','TS', 'PTS')
					)
	BEGIN
		PRINT('Học vị của giáo viên chỉ có thể là “CN”, “KS”, ThS”, ”TS”, ”PTS”')
		ROLLBACK
	END
END
GO

-- 4. Học viên ít nhất là 18 tuổi.
CREATE TRIGGER c4
ON HOCVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT NGSINH
					FROM inserted
					WHERE YEAR(GETDATE()) - YEAR(NGSINH) >= 18 
					)
	BEGIN
		PRINT('Học viên ít nhất là 18 tuổi')
		ROLLBACK
	END
END
GO

-- 5. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
CREATE TRIGGER c5
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT MALOP, MAMH
					FROM inserted
					WHERE TUNGAY < DENNGAY
					)
	BEGIN
		PRINT('Ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY)')
		ROLLBACK
	END
END
GO

-- 6. Giáo viên khi vào làm ít nhất là 22 tuổi.
CREATE TRIGGER c6
ON GIAOVIEN
AFTER INSERT
AS
BEGIN
	IF NOT EXISTS (	SELECT 1
					FROM INSERTED 
					WHERE YEAR(NGVL) - YEAR(NGSINH) >= 22
					)
	BEGIN
		PRINT('Giáo viên khi vào làm ít nhất là 22 tuổi.')
		ROLLBACK
	END
END
GO

-- 7. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
CREATE TRIGGER c7
ON MONHOC
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT 1
					FROM INSERTED 
					WHERE ABS(TCLT - TCTH) <= 3
					)
	BEGIN
		PRINT('số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3')
		ROLLBACK
	END
END
GO

-- 8. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
CREATE TRIGGER c8
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS ( SELECT MALOP, HOCKY, NAM, COUNT(MALOP)
				FROM GIANGDAY
				GROUP BY MALOP, HOCKY, NAM
				HAVING COUNT(MALOP) > 3
				)
	BEGIN
		PRINT('Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.')
		ROLLBACK
	END
END
GO

-- 9. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
CREATE TRIGGER c9
ON LOP
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS (	SELECT 1
					FROM INSERTED i
					WHERE SISO = ( SELECT COUNT(MAHV)
									FROM HOCVIEN hv
									WHERE i.MALOP = hv.MALOP)
					)
	BEGIN
		PRINT('Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.')
		ROLLBACK
	END
END
GO

-- 10. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong
-- cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ
-- (“A”,”B”) và (“B”,”A”).
CREATE TRIGGER c10
ON DIEUKIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE EXISTS (	SELECT 1
								FROM DIEUKIEN d
								WHERE i.MAMH = i.MAMH_TRUOC 
								OR (d.MAMH = i.MAMH AND d.MAMH_TRUOC = i.MAMH AND d.MAMH != d.MAMH_TRUOC)
								OR (d.MAMH = i.MAMH_TRUOC AND d.MAMH_TRUOC = i.MAMH))
				)
	BEGIN
		PRINT('Dieu kien khong thoa man')
		ROLLBACK
	END
END
GO

-- 11. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
CREATE TRIGGER c11
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE i.HOCVI = 'PTS' AND i.HOCHAM = 'GS' AND i.HESO = '5.00')
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '2250000'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE (i.HOCVI = 'TS' AND i.HOCHAM = 'GS' AND i.HESO = '4.00')
					OR (i.HOCVI = 'ThS' AND i.HOCHAM = 'GV' AND i.HESO = '4.00')
				)
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '1800000'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE (i.HOCVI = 'TS' AND i.HOCHAM = 'PGS' AND i.HESO = '4.50')
					OR (i.HOCVI = 'TS' AND i.HOCHAM = 'GV' AND i.HESO = '4.50')
				)
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '2025000'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE i.HOCVI = 'ThS' AND i.HOCHAM = 'GV' AND i.HESO = '3.00')
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '1350000'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE (i.HOCVI = 'KS' AND i.HESO = '1.69')
					OR (i.HOCVI = 'CN' AND i.HESO = '1.69')
				)
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '760500'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE i.HOCVI = 'KS' AND i.HESO = '1.86'
				)
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '837000'
	END

	IF EXISTS (	SELECT 1
				FROM INSERTED i
				WHERE i.HOCVI = 'CN' AND i.HOCHAM = 'GV' AND i.HESO = '2.67'
				)
	BEGIN
		UPDATE GIAOVIEN
		SET MUCLUONG = '1201500'
	END

	ELSE
	BEGIN
		PRINT('Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau')
		ROLLBACK
	END
END
GO
-- 12. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
CREATE TRIGGER c12
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS ( SELECT 1
				FROM INSERTED i
				JOIN KETQUATHI k ON i.MAHV = k.MAHV AND i.MAMH = k.MAMH
				WHERE i.NGTHI = k.NGTHI
					AND i.LANTHI <> k.LANTHI
					AND k.DIEM >= 5.00
				)
	BEGIN
		PRINT('Học viên chỉ được thi lại khi điểm của lần thi trước đó dưới 5.')
		ROLLBACK
	END
END
GO

-- 13. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
CREATE TRIGGER c13
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT 1
				FROM INSERTED i
				JOIN KETQUATHI k ON i.MAHV = k.MAHV AND i.MAMH = k.MAMH
				WHERE i.NGTHI > k.NGTHI
					AND i.LANTHI <> k.LANTHI
					AND k.DIEM < 5.00
				)
	BEGIN
		PRINT('Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước.')
		ROLLBACK
	END
END
GO

-- 14. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
CREATE TRIGGER c14
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS ( SELECT 1
				FROM INSERTED i
				WHERE EXISTs ( SELECT 1
								FROM MONHOC m, GIANGDAY gd, GIAOVIEN gv
								WHERE i.MAMH = m.MAMH 
								AND m.MAKHOA = gv.MAKHOA
								AND i.MAGV = gv.MAGV
							)
				)
	BEGIN
		PRINT('Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.')
		ROLLBACK
	END
END
GO