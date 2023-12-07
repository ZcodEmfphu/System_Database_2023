Create database QuanLyKhachSan;
go
use QuanlyKhachSan;

--Create database and constraints

create table TaiKhoan(
	TenTK nvarchar(50),
	MatKhau nvarchar(50),
	LoaiTK nvarchar(50),
	CONSTRAINT PK_TK PRIMARY KEY (TenTK)
);

create table NhanVien(
	MaNV nvarchar(5),
	Ho nvarchar(50),
	TenLot nvarchar(50),
	TenNV nvarchar(50),
	NgaySinh date,
	Sdt varchar(50),
	ChucVu nvarchar(50),
	CONSTRAINT PK_NV PRIMARY KEY (MaNV)
);

create table Phong(
	Stt int,
	MaPhong char(5),
	LoaiPhong nvarchar(20),
	CapDo nvarchar(50),
	GiaPhong money,
	TinhTrang char(1),
	CONSTRAINT PK_Phong PRIMARY KEY (MaPhong)
);

create table KhachHang(
	MaKH int,
	Ho nvarchar(50),
	TenLot nvarchar(50),
	TenKH nvarchar(50),
	Sdt varchar(50),
	NgaySinh date,
	LoaiKH nvarchar(20),
	NguoiCapNhat nvarchar(5),
	CONSTRAINT PK_KH PRIMARY KEY (MaKH),
	CONSTRAINT FK_KH_NV foreign key (NguoiCapNhat) references NhanVien(MaNV),
);

create table Thue(
	MaThue int,
	MaPhong char(5),
	MaKH int,
	NgayThue datetime,
	NgayTra datetime,
	TongTien money,
	NguoiCapNhat nvarchar(5),
	constraint PK_MT PRIMARY KEY (MaThue),
	constraint FK_Thue_Phong foreign key (MaPhong) references Phong(MaPhong),
	constraint FK_Thue_Khachhang foreign key (MaKH) references KhachHang(MaKH),
	constraint FK_Thue_NV foreign key (NguoiCapNhat) references NhanVien(MaNV)
);

--Insert database

Insert into TaiKhoan (TenTK, MatKhau, LoaiTK) values ('Root', 'khongcomatkhau', 'Admin');
Insert into TaiKhoan (TenTK, MatKhau, LoaiTK) values ('Manager', 'Pass456', 'Manager');
Insert into TaiKhoan (TenTK, MatKhau, LoaiTK) values ('User1', 'Pass123', 'User');
Insert into TaiKhoan (TenTK, MatKhau, LoaiTK) values ('Đỗ Minh Phú', '123', 'User');

Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N01', 'Nguyen', 'Van', 'A', '1990-01-01', '123456789', 'Quan Ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N02', 'Pham', 'Van', 'D', '1992-12-12', '9995678', 'Quan ly');

Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N03', 'Trinh', 'Ngoc', 'F', '1993-07-20', '4445566', 'Le Tan');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N04', 'Nguyen', 'Thi', 'I', '1987-09-05', '5556677', 'Le Tan');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N05', 'Le', 'Minh', 'L', '1986-06-20', '1122334', 'Le Tan');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N06', 'Tran', 'Thi', 'B', '1995-05-05', '987654321', 'Le Tan');

Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N07', 'Le', 'Hoang', 'C', '1988-08-08', '5551234', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N08', 'Ho', 'Quang', 'E', '1985-03-15', '1112233', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N09', 'Vo', 'Thi', 'G', '1980-11-25', '7778899', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N10', 'Do', 'Minh', 'H', '1991-04-30', '2223344', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N11', 'Tran', 'Van', 'K', '1994-02-10', '8889900', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N12', 'Nguyen', 'Thi', 'M', '1996-09-15', '4455667', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N13', 'Ho', 'Van', 'N', '1982-01-25', '7788990', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N14', 'Trinh', 'Thi', 'P', '1990-04-10', '2233445','Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N15', 'Vo', 'Van', 'Q', '1989-08-30', '5566778', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N16', 'Do', 'Minh', 'R', '1993-12-05', '8899001', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N17', 'Nguyen', 'Thi', 'S', '1984-03-01', '1122334', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N18', 'Tran', 'Van', 'T', '1995-06-15', '4455667', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N19', 'Le', 'Thi', 'U', '1981-09-25', '7788990', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values ('N20', 'Pham', 'Van', 'V', '1992-01-10', '2233445', 'Nhan vien');

INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (1, 'P101', 'Standard', 'Normal', 100, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (2, 'P102', 'Standard', 'Normal', 100, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (7, 'P401', 'Standard', 'Normal', 100, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (8, 'P402', 'Standard', 'Normal', 100, 'F');

INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (3, 'P201', 'Deluxe', 'High', 200, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (4, 'P202', 'Deluxe', 'High', 200, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (9, 'P501', 'Deluxe', 'High', 200, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (10, 'P502', 'Deluxe', 'High', 200, 'F');

INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (5, 'P301', 'Suite', 'VIP', 300, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (6, 'P302', 'Suite', 'VIP', 300, 'T');

INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (1, 'Nguyen', 'Van', 'A', '5551234', '1988-08-08', 'Vip', 'N03');
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (2, 'Tran', 'Thi', 'B', '9995678', '1992-12-12', 'Regular', 'N03');
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (3, 'Le', 'Van', 'C', '1112233', '1985-03-15', 'Vip', 'N04');
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (4, 'Pham', 'Thi', 'D', '4445566', '1993-07-20', 'Regular', 'N04');
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (5, 'Ho', 'Quang', 'E', '7778899', '1980-11-25', 'Vip', 'N05');

INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (1, 'P101', 1, '2023-01-01', '2023-01-05', 500, 'N01');
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (2, 'P201', 2, '2023-02-01', '2023-02-10', 800, 'N01');
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (3, 'P301', 3, '2023-03-01', '2023-03-08', 700, 'N02');
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (4, 'P102', 4, '2023-04-01', '2023-04-15', 1000, 'N02');
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (5, 'P202', 5, '2023-05-01', '2023-05-20', 1200, 'N01');
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (6, 'P302', 1, '2023-06-01', '2023-06-10', 800, 'N01');

--Build stored procedures

--a. View(10)


--b.Procedures(10)

--1. Procedure xem thông tin cá nhân 
go
CREATE PROCEDURE XemThongTinCaNhan
    @MaNhanVien NVARCHAR(5)
AS
BEGIN
    SELECT 
        Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu
    FROM 
        NhanVien
    WHERE 
        MaNV = @MaNhanVien;
END;
--Xem thông tin cá nhân của nhân viên có mã là N01
EXEC XemThongTinCaNhan @MaNhanVien = 'N01';

--2. Procedure load danh sách nhân viên và tìm kiếm theo họ hoặc tên lót hoặc chức vụ
go
CREATE PROCEDURE LoadDanhSachNhanVien
    @TuKhoa NVARCHAR(50) = NULL
AS
BEGIN
    SELECT 
        MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu
    FROM 
        NhanVien
    WHERE 
        Ho LIKE '%' + ISNULL(@TuKhoa, '') + '%'
        OR TenLot LIKE '%' + ISNULL(@TuKhoa, '') + '%'
        OR ChucVu LIKE '%' + ISNULL(@TuKhoa, '') + '%';
END;

-- Lấy tất cả nhân viên
EXEC LoadDanhSachNhanVien;

-- Tìm kiếm nhân viên theo từ khóa
EXEC LoadDanhSachNhanVien @TuKhoa = 'Nguyen';

--3. Procedure Sửa thông tin nhân viên theo mã nhân viên
go
CREATE PROCEDURE SuaThongTinNhanVien
    @MaNhanVien NVARCHAR(5),
    @Ho NVARCHAR(50),
    @TenLot NVARCHAR(50),
    @TenNhanVien NVARCHAR(50),
    @NgaySinh DATE,
    @Sdt VARCHAR(50),
    @ChucVu NVARCHAR(50)
AS
BEGIN
    -- Kiểm tra xem nhân viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNhanVien)
    BEGIN
        PRINT 'Nhân viên không tồn tại.';
        RETURN;
    END;
    -- Cập nhật thông tin nhân viên
    UPDATE NhanVien
    SET
        Ho = @Ho,
        TenLot = @TenLot,
        TenNV = @TenNhanVien,
        NgaySinh = @NgaySinh,
        Sdt = @Sdt,
        ChucVu = @ChucVu
    WHERE
        MaNV = @MaNhanVien;
    PRINT 'Thông tin nhân viên đã được cập nhật thành công.';
END;

-- Sửa thông tin nhân viên có mã là 'N01'
EXEC SuaThongTinNhanVien
    @MaNhanVien = 'N01',
    @Ho = 'Nguyen',
    @TenLot = 'Van',
    @TenNhanVien = 'B',
    @NgaySinh = '1990-01-01',
    @Sdt = '123456789',
    @ChucVu = 'Quan ly';

--4. Procedure Thêm nhân viên theo mã nhân viên
go
CREATE PROCEDURE ThemNhanVien
    @MaNhanVien NVARCHAR(5),
    @Ho NVARCHAR(50),
    @TenLot NVARCHAR(50),
    @TenNhanVien NVARCHAR(50),
    @NgaySinh DATE,
    @Sdt VARCHAR(50),
    @ChucVu NVARCHAR(50)
AS
BEGIN
    -- Kiểm tra xem nhân viên đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNhanVien)
    BEGIN
        PRINT 'Nhân viên đã tồn tại.';
        RETURN;
    END;
    -- Thêm nhân viên mới
    INSERT INTO NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu)
    VALUES (@MaNhanVien, @Ho, @TenLot, @TenNhanVien, @NgaySinh, @Sdt, @ChucVu);
    PRINT 'Nhân viên đã được thêm thành công.';
END;

-- Thêm nhân viên mới có mã là 'MNV002'
EXEC ThemNhanVien
    @MaNhanVien = 'N21',
    @Ho = 'Tran',
    @TenLot = 'Van',
    @TenNhanVien = 'B',
    @NgaySinh = '1995-02-15',
    @Sdt = '987654321',
    @ChucVu = 'Nhan vien';

--5. Procedure Xóa nhân viên gồm thông tin nhân viên và tài khoản
go
CREATE PROCEDURE XoaNhanVien
    @MaNhanVien NVARCHAR(5)
AS
BEGIN
    -- Kiểm tra xem nhân viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNhanVien)
    BEGIN
        PRINT 'Nhân viên không tồn tại.';
        RETURN;
    END;
    -- Xóa thông tin nhân viên
    DELETE FROM NhanVien WHERE MaNV = @MaNhanVien;
    -- Xóa tài khoản liên kết với nhân viên
    DELETE FROM TaiKhoan WHERE TenTK = @MaNhanVien;
    PRINT 'Nhân viên và tài khoản đã được xóa thành công.';
END;

-- Xóa nhân viên có mã là 'N21'
EXEC XoaNhanVien @MaNhanVien = 'N21';

--6. Procedure Danh sách chức vụ của nhân viên
go
CREATE PROCEDURE DanhSachChucVuNhanVien
AS
BEGIN
    SELECT DISTINCT ChucVu
    FROM NhanVien;
END;

-- Lấy danh sách chức vụ của nhân viên
EXEC DanhSachChucVuNhanVien;

--7. Procedure Chọn nhân viên theo mã nhân viên
go
CREATE PROCEDURE ChonNhanVienTheoMa
    @MaNhanVien NVARCHAR(5)
AS
BEGIN
    SELECT *
    FROM NhanVien
    WHERE MaNV = @MaNhanVien;
END;

-- Chọn nhân viên có mã là 'N01'
EXEC ChonNhanVienTheoMa @MaNhanVien = 'N01';

--8. Procedure Xem danh sách khách hàng
go
CREATE PROCEDURE XemDanhSachKhachHang
AS
BEGIN
    SELECT *
    FROM KhachHang;
END;

-- Xem danh sách khách hàng
EXEC XemDanhSachKhachHang;

--9. Procedure Xóa khách hàng
go
CREATE PROCEDURE XoaKhachHang
    @MaKhachHang INT
AS
BEGIN
    -- Kiểm tra xem khách hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKH = @MaKhachHang)
    BEGIN
        PRINT 'Khách hàng không tồn tại.';
        RETURN;
    END;
    -- Xóa các bản ghi từ bảng Thue liên quan đến khách hàng
    DELETE FROM Thue WHERE MaKH = @MaKhachHang;
    -- Xóa khách hàng
    DELETE FROM KhachHang WHERE MaKH = @MaKhachHang;
    PRINT 'Khách hàng và các liên kết đã được xóa thành công.';
END;

-- Xóa khách hàng có mã là 1
EXEC XoaKhachHang @MaKhachHang = 1;

--10. Procedure Thêm khách hàng
go
CREATE PROCEDURE ThemKhachHang
	@MaKH int,
    @Ho NVARCHAR(50),
    @TenLot NVARCHAR(50),
    @TenKH NVARCHAR(50),
    @Sdt VARCHAR(50),
    @NgaySinh DATE,
    @LoaiKH NVARCHAR(20),
    @NguoiCapNhat NVARCHAR(5)
AS
BEGIN
    -- Thêm khách hàng mới
    INSERT INTO KhachHang (MaKh, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat)
    VALUES (@MaKH, @Ho, @TenLot, @TenKH, @Sdt, @NgaySinh, @LoaiKH, @NguoiCapNhat);
    PRINT 'Khách hàng đã được thêm thành công.';
END;
-- Thêm khách hàng mới
EXEC ThemKhachHang
	@MaKH = 5,
    @Ho = 'Do',
    @TenLot = 'Minh',
    @TenKH = 'Phu',
    @Sdt = '123456789',
    @NgaySinh = '1990-01-01',
    @LoaiKH = 'VIP',
    @NguoiCapNhat = 'N03';

--11. Procedure Sửa thông tin Khách hàng theo mã Khách hàng
go
CREATE PROCEDURE SuaThongTinKhachHang
    @MaKhachHang INT,
    @Ho NVARCHAR(50),
    @TenLot NVARCHAR(50),
    @TenKH NVARCHAR(50),
    @Sdt VARCHAR(50),
    @NgaySinh DATE,
    @LoaiKH NVARCHAR(20),
    @NguoiCapNhat NVARCHAR(5)
AS
BEGIN
    -- Kiểm tra xem khách hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKH = @MaKhachHang)
    BEGIN
        PRINT 'Khách hàng không tồn tại.';
        RETURN;
    END;
    -- Cập nhật thông tin khách hàng
    UPDATE KhachHang
    SET
        Ho = @Ho,
        TenLot = @TenLot,
        TenKH = @TenKH,
        Sdt = @Sdt,
        NgaySinh = @NgaySinh,
        LoaiKH = @LoaiKH,
        NguoiCapNhat = @NguoiCapNhat
    WHERE
        MaKH = @MaKhachHang;

    PRINT 'Thông tin khách hàng đã được cập nhật thành công.';
END;
-- Sửa thông tin khách hàng có mã là 1
EXEC SuaThongTinKhachHang
    @MaKhachHang = 1,
    @Ho = 'Nguyen',
    @TenLot = 'Van',
    @TenKH = 'A',
    @Sdt = '123456789',
    @NgaySinh = '1990-01-01',
    @LoaiKH = 'VIP',
    @NguoiCapNhat = 'N01';

--12. Procedure Chọn Khách hàng theo mã Khách hàng
go
CREATE PROCEDURE ChonKhachHangTheoMa
    @MaKhachHang INT
AS
BEGIN
    SELECT *
    FROM KhachHang
    WHERE MaKH = @MaKhachHang;
END;
-- Chọn khách hàng có mã là 1
EXEC ChonKhachHangTheoMa @MaKhachHang = 2;

--13. Procedure Danh sách loại Khách hàng
go
CREATE PROCEDURE DanhSachLoaiKhachHang
AS
BEGIN
    SELECT DISTINCT LoaiKH
    FROM KhachHang;
END;
-- Lấy danh sách loại khách hàng
EXEC DanhSachLoaiKhachHang;

--14. Procedure Xem danh sách thuê phòng
go
CREATE PROCEDURE XemDanhSachThuePhong
AS
BEGIN
    SELECT *
    FROM Thue;
END;
-- Xem danh sách thuê phòng
EXEC XemDanhSachThuePhong;

--15. Procedure Thêm thuê phòng
go
CREATE PROCEDURE ThemThuePhong
    @MaPhong CHAR(5),
    @MaKhachHang INT,
    @NgayThue DATETIME,
    @NgayTra DATETIME,
    @TongTien MONEY,
    @NguoiCapNhat NVARCHAR(5)
AS
BEGIN
    -- Kiểm tra xem phòng và khách hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Phong WHERE MaPhong = @MaPhong) OR
       NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKH = @MaKhachHang)
    BEGIN
        PRINT 'Phòng hoặc khách hàng không tồn tại.';
        RETURN;
    END;
    -- Thêm thông tin thuê phòng mới
    INSERT INTO Thue (MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat)
    VALUES (@MaPhong, @MaKhachHang, @NgayThue, @NgayTra, @TongTien, @NguoiCapNhat);
    PRINT 'Thông tin thuê phòng đã được thêm thành công.';
END;
-- Thêm thông tin thuê phòng mới
EXEC ThemThuePhong
    @MaPhong = 'P001',
    @MaKhachHang = 1,
    @NgayThue = '2023-01-01 12:00:00',
    @NgayTra = '2023-01-05 10:00:00',
    @TongTien = 500,
    @NguoiCapNhat = 'N01';

--16. Procedure Xem danh sách phòng
go
CREATE PROCEDURE XemDanhSachPhong
AS
BEGIN
    SELECT *
    FROM Phong;
END;
-- Xem danh sách phòng
EXEC XemDanhSachPhong;

--17. Procedure Thêm phòng mới
go
CREATE PROCEDURE ThemPhongMoi
    @MaPhong CHAR(5),
    @LoaiPhong NVARCHAR(20),
    @CapDo NVARCHAR(50),
    @GiaPhong MONEY,
    @TinhTrang CHAR(1)
AS
BEGIN
    -- Kiểm tra xem phòng có tồn tại không
    IF EXISTS (SELECT 1 FROM Phong WHERE MaPhong = @MaPhong)
    BEGIN
        PRINT 'Phòng đã tồn tại.';
        RETURN;
    END;
    -- Thêm thông tin phòng mới
    INSERT INTO Phong (MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang)
    VALUES (@MaPhong, @LoaiPhong, @CapDo, @GiaPhong, @TinhTrang);
    PRINT 'Thông tin phòng đã được thêm thành công.';
END;
-- Thêm thông tin phòng mới
EXEC ThemPhongMoi
    @MaPhong = 'P002',
    @LoaiPhong = 'Deluxe',
    @CapDo = 'Cao cấp',
    @GiaPhong = 800,
    @TinhTrang = 'T';

--18. Procedure Xóa phòng theo mã phòng
go
CREATE PROCEDURE XoaPhongTheoMa
    @MaPhong CHAR(5)
AS
BEGIN
    -- Kiểm tra xem phòng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Phong WHERE MaPhong = @MaPhong)
    BEGIN
        PRINT 'Phòng không tồn tại.';
        RETURN;
    END;
    -- Xóa phòng
    DELETE FROM Phong WHERE MaPhong = @MaPhong;
    PRINT 'Phòng đã được xóa thành công.';
END;
-- Xóa phòng có mã là 'P002'
EXEC XoaPhongTheoMa @MaPhong = 'P002';

--19. Procedure Sửa phòng theo mã phòng
go
CREATE PROCEDURE SuaThongTinPhong
    @MaPhong CHAR(5),
    @LoaiPhong NVARCHAR(20),
    @CapDo NVARCHAR(50),
    @GiaPhong MONEY,
    @TinhTrang CHAR(1)
AS
BEGIN
    -- Kiểm tra xem phòng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Phong WHERE MaPhong = @MaPhong)
    BEGIN
        PRINT 'Phòng không tồn tại.';
        RETURN;
    END;
    -- Cập nhật thông tin phòng
    UPDATE Phong
    SET
        LoaiPhong = @LoaiPhong,
        CapDo = @CapDo,
        GiaPhong = @GiaPhong,
        TinhTrang = @TinhTrang
    WHERE
        MaPhong = @MaPhong;
    PRINT 'Thông tin phòng đã được cập nhật thành công.';
END;
-- Sửa thông tin phòng có mã là 'P001'
EXEC SuaThongTinPhong
    @MaPhong = 'P01',
    @LoaiPhong = 'Standard',
    @CapDo = 'Bình thường',
    @GiaPhong = 600,
    @TinhTrang = 'T';

--20. Procedure Chọn phòng theo mã phòng
go
CREATE PROCEDURE ChonPhongTheoMa
    @MaPhong CHAR(5)
AS
BEGIN
    SELECT *
    FROM Phong
    WHERE MaPhong = @MaPhong;
END;
-- Chọn phòng có mã là 'P001'
EXEC ChonPhongTheoMa @MaPhong = 'P01';

--21. Procedure Trả phòng
go
CREATE PROCEDURE TraPhong
    @MaThue INT,
    @NgayTra DATETIME,
    @TongTien MONEY,
    @NguoiCapNhat NVARCHAR(5)
AS
BEGIN
    -- Kiểm tra xem phiếu thuê có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Thue WHERE MaThue = @MaThue)
    BEGIN
        PRINT 'Phiếu thuê không tồn tại.';
        RETURN;
    END;
    -- Cập nhật thông tin khi trả phòng
    UPDATE Thue
    SET
        NgayTra = @NgayTra,
        TongTien = @TongTien,
        NguoiCapNhat = @NguoiCapNhat
    WHERE
        MaThue = @MaThue;
    PRINT 'Thông tin trả phòng đã được cập nhật thành công.';
END;
-- Trả phòng có mã là 1 vào lúc '2023-01-05 12:00:00' với tổng tiền là 600 và được cập nhật bởi 'N01'
EXEC TraPhong
    @MaThue = 1,
    @NgayTra = '2023-01-05 12:00:00',
    @TongTien = 600,
    @NguoiCapNhat = 'N01';
