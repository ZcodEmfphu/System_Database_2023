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
	MaNV int,
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
	NguoiCapNhat int,
	CONSTRAINT PK_KH PRIMARY KEY (MaKH),
	constraint FK_KH_NV foreign key (NguoiCapNhat) references NhanVien(MaNV),
);

create table Thue(
	MaThue int,
	MaPhong char(5),
	MaKH int,
	NgayThue datetime,
	NgayTra datetime,
	TongTien money,
	NguoiCapNhat int,
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

Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (1, 'Nguyen', 'Van', 'A', '1990-01-01', '123456789', 'Quan ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (2, 'Tran', 'Thi', 'B', '1995-05-05', '987654321', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (3, 'Le', 'Hoang', 'C', '1988-08-08', '5551234', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (4, 'Pham', 'Van', 'D', '1992-12-12', '9995678', 'Quan ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (5, 'Ho', 'Quang', 'E', '1985-03-15', '1112233', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (6, 'Trinh', 'Ngoc', 'F', '1993-07-20', '4445566', 'Quan ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (7, 'Vo', 'Thi', 'G', '1980-11-25', '7778899', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (8, 'Do', 'Minh', 'H', '1991-04-30', '2223344', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (9, 'Nguyen', 'Thi', 'I', '1987-09-05', '5556677', 'Quan ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (10, 'Tran', 'Van', 'K', '1994-02-10', '8889900', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (11, 'Le', 'Minh', 'L', '1986-06-20', '1122334', 'Quan ly');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (12, 'Nguyen', 'Thi', 'M', '1996-09-15', '4455667', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (13, 'Ho', 'Van', 'N', '1982-01-25', '7788990', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (14, 'Trinh', 'Thi', 'P', '1990-04-10', '2233445','Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (15, 'Vo', 'Van', 'Q', '1989-08-30', '5566778', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (16, 'Do', 'Minh', 'R', '1993-12-05', '8899001', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (17, 'Nguyen', 'Thi', 'S', '1984-03-01', '1122334', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (18, 'Tran', 'Van', 'T', '1995-06-15', '4455667', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (19, 'Le', 'Thi', 'U', '1981-09-25', '7788990', 'Nhan vien');
Insert into NhanVien (MaNV, Ho, TenLot, TenNV, NgaySinh, Sdt, ChucVu) values (20, 'Pham', 'Van', 'V', '1992-01-10', '2233445', 'Nhan vien');

INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (1, 'P101', 'Standard', 'Normal', 100, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (2, 'P102', 'Standard', 'Normal', 100, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (3, 'P201', 'Deluxe', 'High', 200, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (4, 'P202', 'Deluxe', 'High', 200, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (5, 'P301', 'Suite', 'VIP', 300, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (6, 'P302', 'Suite', 'VIP', 300, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (7, 'P401', 'Standard', 'Normal', 100, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (8, 'P402', 'Standard', 'Normal', 100, 'F');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (9, 'P501', 'Deluxe', 'High', 200, 'T');
INSERT INTO Phong (Stt, MaPhong, LoaiPhong, CapDo, GiaPhong, TinhTrang) VALUES (10, 'P502', 'Deluxe', 'High', 200, 'F');

INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (1, 'Nguyen', 'Van', 'A', '5551234', '1988-08-08', 'Vip', 1);
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (2, 'Tran', 'Thi', 'B', '9995678', '1992-12-12', 'Regular', 2);
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (3, 'Le', 'Van', 'C', '1112233', '1985-03-15', 'Vip', 1);
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (4, 'Pham', 'Thi', 'D', '4445566', '1993-07-20', 'Regular', 2);
INSERT INTO KhachHang (MaKH, Ho, TenLot, TenKH, Sdt, NgaySinh, LoaiKH, NguoiCapNhat) VALUES (5, 'Ho', 'Quang', 'E', '7778899', '1980-11-25', 'Vip', 1);

INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (1, 'P101', 1, '2023-01-01', '2023-01-05', 500, 1);
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (2, 'P201', 2, '2023-02-01', '2023-02-10', 800, 2);
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (3, 'P301', 3, '2023-03-01', '2023-03-08', 700, 3);
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (4, 'P102', 4, '2023-04-01', '2023-04-15', 1000, 4);
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (5, 'P202', 5, '2023-05-01', '2023-05-20', 1200, 5);
INSERT INTO Thue (MaThue, MaPhong, MaKH, NgayThue, NgayTra, TongTien, NguoiCapNhat) VALUES (6, 'P302', 1, '2023-06-01', '2023-06-10', 800, 6);

--Build stored procedures

--a. View(10)


--b.Procedures(10)

--1. Procedure xem thông tin cá nhân 
--2. Procedure load danh sách nhân viên và tìm kiếm theo họ hoặc tên lót hoặc chức vụ
--3. Procedure Sửa thông tin nhân viên theo mã nhân viên
--4. Procedure Thêm nhân viên theo mã nhân viên
--5. Procedure Xóa nhân viên gồm thông tin nhân viên và tài khoản
--6. Procedure Danh sách chức vụ của nhân viên
--7. Procedure Chọn nhân viên theo mã nhân viên

--8. Procedure Xem danh sách khách hàng
--9. Procedure Xóa khách hàng
--10. Procedure Thêm khách hàng
--11. Procedure Sửa thông tin Khách hàng theo mã Khách hàng
--12. Procedure Chọn Khách hàng theo mã Khách hàng
--13. Procedure Danh sách loại Khách hàng

--14. Procedure Xem danh sách thuê phòng
--15. Procedure Thêm thuê phòng

--16. Procedure Xem danh sách phòng
--17. Procedure Thêm phòng mới
--18. Procedure Xóa phòng theo mã phòng
--19. Procedure Sửa phòng theo mã phòng
--20. Procedure Chọn phòng theo mã phòng
--21. Procedure Trả phòng