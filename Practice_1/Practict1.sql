create database Practice_1

go
use Practice_1;

--question 1: Dùng câu lệnh DDL để tạo database và các table cùng với các ràng buộc về khóa chính, khóa ngoại. 

--create table of practice

create table DEAN(
MaDA varchar(20),
TenDA varchar(50),
KinhPhi int 
CONSTRAINT dean_pk PRIMARY KEY (MaDA)
);

create table PHONGBAN(
MaPB varchar(20),
TenPB varchar(50),
MaTP varchar(20),
DiaDiem varchar(50)
CONSTRAINT phongban_pk PRIMARY KEY (MaPB)
);

create table NHANVIEN(
MaNV varchar(20),
TenNV varchar(50),
NgaySinh date,
GT varchar(5),
MaPB varchar(20)
CONSTRAINT nhanvien_pk PRIMARY KEY (MaNV)
);

create table THAMGIA(
MaNV varchar(20),
MaDA varchar(20),
NgayBD date,
ChucVu varchar(20)
CONSTRAINT thamgia_pk PRIMARY KEY (MaNV, MaDA)
);

-- Set foreign key for tables

ALTER TABLE PHONGBAN ADD CONSTRAINT fk_phongban_nhanvien FOREIGN KEY (MaTP) REFERENCES NHANVIEN (MaNV);
ALTER TABLE NHANVIEN ADD CONSTRAINT fk_nhanvien_phongban FOREIGN KEY (MaPB) REFERENCES PHONGBAN (MaPB);
ALTER TABLE THAMGIA ADD CONSTRAINT fk_thamgia_nhanvien FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV);
ALTER TABLE THAMGIA ADD CONSTRAINT fk_thamgia_dean FOREIGN KEY (MaDA) REFERENCES DEAN (MaDA);	

-- Insert data to database

insert into DEAN(MaDA,TenDA,KinhPhi) VAlUES('DA001','Begin of Database',1);
insert into DEAN(MaDA,TenDA,KinhPhi) VAlUES('DA002','System Database',250.000);
insert into DEAN(MaDA,TenDA,KinhPhi) VAlUES('DA003','Website Programing',500.000);
insert into DEAN(MaDA,TenDA,KinhPhi) VAlUES('DA004','Practice Website',750.000);
insert into DEAN(MaDA,TenDA,KinhPhi) VAlUES('DA005','Data Mining',500.000);

insert into PHONGBAN(MaPB, TenPB, MaTP, DiaDiem) VALUES('PB001','Websiste',null,'place1');
insert into PHONGBAN(MaPB, TenPB, MaTP, DiaDiem) VALUES('PB002','Java',null,'place2');
insert into PHONGBAN(MaPB, TenPB, MaTP, DiaDiem) VALUES('PB003','Network',null,'place3');
insert into PHONGBAN(MaPB, TenPB, MaTP, DiaDiem) VALUES('PB004','Software',null,'place4');

insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV001', 'Quýt Ú', '2002-01-01', 'nam','PB001');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV002', 'Thơm lùn', '2002-01-01', 'nam','PB001');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV003', 'Táo Ngố', '2002-01-01', 'nam','PB001');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV004', 'Dâu Con', '2002-01-01', 'nữ','PB002');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV005', 'Đào tròn', '2002-01-01', 'nữ','PB002');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV006', 'Nho Xinh', '2002-01-01', 'nữ','PB002');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV007', 'Sư phụ Chuối', '2002-01-01', 'nam','PB003');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV008', 'Sư Phụ Dưa Hấu', '2002-01-01', 'nam','PB003');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV009', 'Cô Măng Cục', '2002-01-01', 'nữ','PB003');
insert into NHANVIEN(MaNV, TenNV, NgaySinh, GT, MaPB) VALUES('NV010', 'Giáo Sư Dừa', '2002-01-01', 'nam','PB004');

insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV001', 'DA001', '2023-09-18','Trưởng phòng')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV002', 'DA001', '2023-09-18','Nhân viên')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV003', 'DA001', '2023-09-18','Nhân viên')

insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV004', 'DA002', '2023-09-18','Trưởng phòng')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV005', 'DA002', '2023-09-18','Nhân viên')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV006', 'DA002', '2023-09-18','Nhân viên')

insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV009', 'DA003', '2023-09-18','Trưởng phòng')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV007', 'DA003', '2023-09-18','Nhân viên')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV008', 'DA003', '2023-09-18','Nhân viên')

insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV001', 'DA004', '2023-09-18','Trưởng phòng')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV004', 'DA004', '2023-09-18','Trưởng phòng')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV009', 'DA004', '2023-09-18','Trưởng phòng')

insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV003', 'DA005', '2023-09-18','Nhân viên')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV002', 'DA005', '2023-09-18','Nhân viên')
insert into THAMGIA(MaNV, MaDA, NgayBD, ChucVu) VALUES('NV005', 'DA005', '2023-09-18','Nhân viên')

update PHONGBAN set MaTP ='NV001' where MaPB ='PB001';
update PHONGBAN set MaTP ='NV004' where MaPB ='PB002';
update PHONGBAN set MaTP ='NV009' where MaPB ='PB003';
update PHONGBAN set MaTP ='NV010' where MaPB ='PB004';

--question 3: 

--a. Cho biết số lượng nhân viên của từng phòng ban. Thông tin gồm: MaPB, TenPB, SLNV

select NHANVIEN.MaPB,PHONGBAN.TenPB, count(NHANVIEN.MaPB) as "total"
from PHONGBAN, NHANVIEN 
WHERE PHONGBAN.MaPB = NHANVIEN.MaPB
group by NHANVIEN.MaPB, PHONGBAN.TenPB;
 
--b. Cho biết số lượng nhân viên của từng đề án. Thông tin gồm: MaDA, TenDA, SLNV

select THAMGIA.MaDA, DEAN.TenDA, count(THAMGIA.MaDA) as "total"
from THAMGIA, DEAN
where THAMGIA.MaDA = DEAN.MaDA
group by THAMGIA.MaDA, DEAN.TenDA;

--c. Cho biết danh sách các trưởng phòng. Thông tin gồm: TenPB, Tên trưởng phòng

select PHONGBAN.TenPB, NHANVIEN.TenNV
from PHONGBAN, NHANVIEN
where PHONGBAN.MaTP = NHANVIEN.MaNV;