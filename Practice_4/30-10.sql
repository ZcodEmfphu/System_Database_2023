create database QuanLyBanHang;
go

create table MatHang(
MaMH varchar(255),
TenMH varchar(255),
Dvt varchar(255),
TGTonDau time,
SLNhap int,
TGNhap time,
SLXuat int, 
TGXuat time,
CONSTRAINT MatHang_pk PRIMARY KEY (MaMH)
);

create table NhaCC(
MaNCC varchar(255), 
TenNCC varchar(255),
DiachiNCC varchar(255), 
NoDau decimal(10,3),
Constraint NhaCC_pk Primary key(MaNCC)
);

Create table DonHang(
SoDH int, 
NgayDH date, 
MaNCC varchar(255), 
TriGia decimal(10,3), 
HinhthucTT int,
CHECK (HinhThucTT IN (1, 2)),
Constraint DonHang_pk Primary Key(SoDH)
);

Create table CT_DonHang(
SoDH int, 
MaMH varchar(255), 
SlDat int, 
DonGia decimal(10,3),
CHECK (SlDat >= 1 AND SlDat <= 10),
Constraint CTDonHang_pk Primary Key(SoDH, MaMH)
);

Create table NhanHang(
SoPNH int,
NgayNH date,
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
DonGiaxuat money,
Constraint ChiTietXuat_pk primary key(SoPX, MaMH)
);
 
 create table ThanhToan(
 SoCT int, 
 NgayCT date,
 DienGiai varchar(255),
 SoHD int, 
 Sotien decimal(10,3),
 CHECK (
       (SELECT HinhThucTT 
	    FROM DonHang 
		WHERE SoDH = ThanhToan.SoDH) = 2 OR 
		     (SoTien = (SELECT TriGia FROM DonHang WHERE SoDH = ThanhToan.SoDH))
    ),
 Constraint ThanhToan_pk primary key(SoCT)
 );
