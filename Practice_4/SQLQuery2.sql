create database QuanLyBanHang;
go

create table MatHang(
MaMH varchar(255),
TenMH varchar(255),
Dvt varchar(255),
SLTonDau int check(SLTonDau >=0),
TGTonDau time check(TGTonDau >=0),
SLNhap int,
TGNhap time,
SLXuat int check(SLXuat >0), 
TGXuat time,
CONSTRAINT MatHang_pk PRIMARY KEY (MaMH)
);

create table NhaCC(
MaNCC varchar(255), 
TenNCC varchar(255) not null,
DiachiNCC varchar(255), 
NoDau decimal(10,3),
Constraint NhaCC_pk Primary key(MaNCC)
);

Create table DonHang(
SoDH int, 
NgayDH date not null, 
MaNCC varchar(255), 
TriGia decimal(10,3), 
HinhthucTT int,
CHECK (HinhThucTT IN (1, 2)),
Constraint DonHang_pk Primary Key(SoDH)
);

Create table CT_DonHang(
SoDH int, 
MaMH varchar(255), 
SlDat int check(SLDat >0), 
DonGia decimal(10,3) check(DonGia >0),
CHECK (SlDat >= 1 AND SlDat <= 10),
--CHECK (MaMH IN (SELECT MaMH 
  --              FROM DonHang 
  --              WHERE DonHang.SoDH = CT_DonHang.SoDH)),
Constraint CTDonHang_pk Primary Key(SoDH, MaMH)
);


Create table NhanHang(
SoPNH int,
NgayNH date not null,
NguoiNhan varchar(255), 
SoDH int,
Constraint NhanHang_pk Primary key(SoPNH)
);

Create table CTNhanHang(
SoPNH int, 
MaMH varchar(255),
SLNhan int,
Constraint CTNhanHang_pk primary key(SoPNH, MaMH)
);

Create table PhieuXuat(
SoPX int, 
NgayXuat date, 
NguoiXuat varchar(255), 
LyDoXuat varchar(255),
Constraint PhieuXuat_pk primary key(SoPX)
);

Create table ChitietXuat(
SoPX int, 
MAMH varchar(255),
SoLgXuat int,
DonGiaxuat decimal(10,3) check(DonGiaXuat >0),
Constraint ChiTietXuat_pk primary key(SoPX, MaMH)
);
 
 create table ThanhToan(
 SoCT int, 
 NgayCT date not null,
 DienGiai varchar(255),
 SoHD int, 
 SoTien decimal(10,3) check(SoTien >0),
 CHECK (
       (SELECT HinhThucTT 
	    FROM DonHang 
		WHERE SoDH = ThanhToan.SoDH) = 2
        OR (SoTien = (SELECT TriGia FROM DonHang WHERE SoDH = ThanhToan.SoDH))),
 Constraint ThanhToan_pk primary key(SoCT)
 );
 --Set foreign key for all tables
 ALTER table DonHang
 ADD CHECK (TriGia = (SELECT SUM(SlDat * DonGia) FROM CTDonHang WHERE SoDH = DonHang.SoDH));