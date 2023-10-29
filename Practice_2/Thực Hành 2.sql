create database Practice_2;

go 
use Practice_2;

--Create table

create table NGK(
MaNGK varchar(20),
TenNGK varchar(50),
QuyCach varchar(50),
MaLoaiNGK varchar(20)
CONSTRAINT NGK_pk PRIMARY KEY (MaNGK)
);

create table LoaiNGK(
MaLoaiNGK varchar(20),
TenLoaiNGK varchar(20),
MaNCC varchar(20),
CONSTRAINT LoaiNGK_pk PRIMARY KEY (MaLoaiNGK)
);

create table NHACC(
MaNCC varchar(20),
TenNCC varchar(100),
DiaChiNCC varchar(100),
DTNCC int,
CONSTRAINT NHANCC_pk PRIMARY KEY (MaNCC)
);

create table KH(
MaKH varchar(20),
TenKH varchar(20),
DCKH varchar(20),
DTKH int,
CONSTRAINT KH_pk PRIMARY KEY (MaKH)
);

create table DDH(
SoDDH varchar(20),
NgayDH date,
MaNCC varchar(20),
CONSTRAINT DDH_pk PRIMARY KEY (SoDDH)
);

create table CT_DDH(
SoDDH varchar(20),
MaNGK varchar(20),
SLDat int,
CONSTRAINT CT_DDH_pk PRIMARY KEY (SoDDH,MaNGK)
);

create table PHIEUGH(
SoPGH varchar(20),
NgayGH date,
SoDDH varchar(20),
CONSTRAINT PHIEUGH_pk PRIMARY KEY (SoPGH)
);

create table CT_PGH(
SoPGH varchar(20),
MaNGK varchar(20),
SLGiao int,
DGGiao varchar(20),
CONSTRAINT CT_PGH_pk PRIMARY KEY (SoPGH, MaNGK)
);

create table HOADON(
SoHD varchar(20),
NgaylapHD date,
MaKH varchar(20),
CONSTRAINT HOADON_pk PRIMARY KEY (SoHD)
);

create table CT_HOADON(
SoHD varchar(20),
MaNGK varchar(20),
SLKHMua int,
DGBan varchar(20),
CONSTRAINT CT_HOADON_pk PRIMARY KEY (SoHD,MaNGK)
);

create table PHIEUHEN(
SoPH varchar(20),
NgayLapPH date,
NgayHenGiao date,
MaKH varchar(20),
CONSTRAINT PHIEUHEN_pk PRIMARY KEY (SoPH)
);

create table CT_PH(
SoPH varchar(20),
MaNGK varchar(20),
SLHen int,
CONSTRAINT CT_PH_pk PRIMARY KEY (SoPH,MaNGK)
);

create table PHIEUTRANNO(
SoPTN varchar(20),
NgayTra date,
SoTienTra money,
SoHD varchar(20),
CONSTRAINT PHIEUTRANNO_pk PRIMARY KEY (SoPTN)
);

--Set foreign key for all tables

ALTER TABLE NGK ADD CONSTRAINT fk_NGK_LoaiNGK FOREIGN KEY (MaLoaiNGK) REFERENCES LOAINGK (MaLoaiNGK);
ALTER TABLE LOAINGK ADD CONSTRAINT fk_LoaiNGK_NhaCC FOREIGN KEY (MaNCC) REFERENCES NHACC (MaNCC);
ALTER TABLE DDH ADD CONSTRAINT fk_DDH_NhaCC FOREIGN KEY (MaNCC) REFERENCES NHACC (MaNCC);
ALTER TABLE PHIEUGH ADD CONSTRAINT fk_PhieuGH_DDH FOREIGN KEY (SoDDH) REFERENCES DDH (SoDDH);
ALTER TABLE HOADON ADD CONSTRAINT fk_HOADON_KH FOREIGN KEY (MaKH) REFERENCES KH (MaKH);
ALTER TABLE PHIEUHEN ADD CONSTRAINT fk_PHIEUHEN_KH FOREIGN KEY (MaKH) REFERENCES KH (MaKH);
ALTER TABLE PHIEUTRANNO ADD CONSTRAINT fk_PhieuTraNo_HOADON FOREIGN KEY (SoHD) REFERENCES HOADON (SoHD);

--ALTER TABLE PHIEUTRANNO Drop CONSTRAINT fk_PhieuTraNo_HOADON;

--Insert data to database

Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('CC1','Coca Cola','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('CC2','Coca Cola','Lon',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('PS1','Pepsi','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('PS2','Pepsi','Lon',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('SV1','Seven Up','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('SV2','Seven Up','Lon',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('NO1','Number One','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('NO2','Number One','Lon',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('ST1','Sting dâu','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('ST2','Sting dâu','Lon',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('C2','Trà C2','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('OD','Trà xanh 0 độ','Chai',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('ML1','Sữa tươi tiệt trùng','Bịch',null);
Insert into NGK(MaNGK,TenNGK, QuyCach, MaLoaiNGK) values ('WT1','Nước uống đóng chai','Chai',null);

Insert into LOAINGK(MaLoaiNGK,TenLoaiNGK,MaNCC) values ('NK1','Nước ngọt có gas',null);
Insert into LOAINGK(MaLoaiNGK,TenLoaiNGK,MaNCC) values ('NK2','Nước ngọt không gas',null);
Insert into LOAINGK(MaLoaiNGK,TenLoaiNGK,MaNCC) values ('NK3','Trà',null);
Insert into LOAINGK(MaLoaiNGK,TenLoaiNGK,MaNCC) values ('NK4','Sữa',null);

Insert into NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC) values ('NC1','Công ty NGK quốc tế CocaCola','Xa lộ Hà Nội, Thủ Đức, TP.HCM',088967908);
Insert into NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC) values ('NC2','Công ty NGK quốc tế Pepsi','Bến Chương Dương, Quận 1, TP.HCM',083663366);
Insert into NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC) values ('NC3','Công ty NGK Bến Chương Dương','Hàm Tử, Q.5, TP.HCM',088946677);

Insert into KH(MaKH,TenKH, DCKH, DTKH) values ('KH01','Cửa hàng BT','144 XVNT',088405996);
Insert into KH(MaKH,TenKH, DCKH, DTKH) values ('KH02','Cửa hàng Trà','198/43 NTT',085974572);
Insert into KH(MaKH,TenKH, DCKH, DTKH) values ('KH03','Siêu thị Coop','24 ĐTH',086547888);

Insert into DDH(SoDDH, NgayDH, MaNCC) values ('DDH01', '2011-05-10','NC1');
Insert into DDH(SoDDH, NgayDH, MaNCC) values ('DDH02', '2011-05-20','NC1');
Insert into DDH(SoDDH, NgayDH, MaNCC) values ('DDH03', '2011-05-26','NC2');
Insert into DDH(SoDDH, NgayDH, MaNCC) values ('DDH04', '2011-06-03','NC2');

Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH01', 'CC1', 20);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH01', 'CC2', 15);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH01', 'PS1', 18);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH01', 'SV2', 12);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH02', 'CC2', 30);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH02', 'PS2', 10);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH02', 'SV1', 5);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH02', 'ST1', 15);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH02', 'C2', 10);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH03', 'OD', 45);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH04', 'CC1', 8);
Insert into CT_DDH(SoDDH, MaNGK, SLDat) values ('DDH04', 'ST2', 12);

Insert into PHIEUGH(SoPGH, NgayGH, SoDDH) values ('PGH01', '2010-05-12','DDH01');
Insert into PHIEUGH(SoPGH, NgayGH, SoDDH) values ('PGH02', '2010-05-12','DDH01');
Insert into PHIEUGH(SoPGH, NgayGH, SoDDH) values ('PGH03', '2010-05-21','DDH02');
Insert into PHIEUGH(SoPGH, NgayGH, SoDDH) values ('PGH04', '2010-05-22','DDH02');
Insert into PHIEUGH(SoPGH, NgayGH, SoDDH) values ('PGH05', '2010-05-28','DDH03');

Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH01','CC1',15,'5000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH01','CC2',15,'4000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH01','SV2',10,'4000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH02','SV2',2,'4000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH03','CC2',30,'5000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH03','PS2',10,'4000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH03','ST1',15,'9000');
Insert into CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao) values ('PGH03','C2',10,'8000');

Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD01','2010-05-10','KH01');
Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD02','2010-05-20','KH01');
Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD03','2010-06-5','KH02');
Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD04','2010-06-16','KH02');
Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD05','2010-06-22','KH02');
Insert into HOADON(SoHD, NgaylapHD, MaKH) values ('HD06','2010-07-8','KH03');

Insert into CT_HOADON(SoHD, MaNGK  , SLKHMua, DGBan) values ('HD01','CC1', 20, '6000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD01','CC2', 50, '5000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD02','ST1', 40, '10000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD03','SV2', 60, '5000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD04','PS2', 25, '5000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD05','CC1', 100, '6000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD05','SV1', 20, '8000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD05','C2', 80, '9000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD06','OD', 55, '1000');
Insert into CT_HOADON(SoHD, MaNGK, SLKHMua, DGBan) values ('HD06','ST2', 50, '11000');

Insert into PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH) values ('PH01','2010-05-08', '2010-06-09', 'KH01');
Insert into PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH) values ('PH02','2010-05-25', '2010-06-28', 'KH02');
Insert into PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH) values ('PH03','2010-06-01', '2010-06-02', 'KH03');

Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH01','ST2',10);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH01','OD',8);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH02','CC1',20);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH03','ST1',7);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH03','SV2',12);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH03','CC2',9);
Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH01','PS2',15);

Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN01','2010-05-18',500000 ,'HD01')
Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN02','2010-06-01',350000 ,'HD01')
Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN03','2010-06-02',650000 ,'HD02')
Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN04','2010-06-15',1020000 ,'HD03')
Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN05','2010-07-01',1080000 ,'HD03')

--Update database
select * from PHIEUTRANNO

update NGK set MaLoaiNGK ='NK1' where TenNGK ='Coca Cola';
update NGK set MaLoaiNGK ='NK1' where TenNGK ='Pepsi';
update NGK set MaLoaiNGK ='NK1' where TenNGK ='Seven Up';
update NGK set MaLoaiNGK ='NK1' where TenNGK ='Number One';
update NGK set MaLoaiNGK ='NK1' where TenNGK ='Sting dâu';
update NGK set MaLoaiNGK ='NK2' where TenNGK Like 'Trà%';
update NGK set MaLoaiNGK ='NK1' where TenNGK ='Sữa tươi tiệt trùng';
update NGK set MaLoaiNGK ='NK2' where TenNGK ='Nước uống đóng chai';

update LoaiNGK set MaNCC ='NC1' where TenLoaiNGK ='Nước ngọt có gas';
update LoaiNGK set MaNCC ='NC2' where TenLoaiNGK ='Nước ngọt không gas';
update LoaiNGK set MaNCC ='NC1' where TenLoaiNGK ='Trà';
update LoaiNGK set MaNCC ='NC2' where TenLoaiNGK ='Sữa';

--Yêu cầu

--1) Liệt kê các NGK và loại NGK tương ứng.

Select TenNGK,TenLoaiNGK 
from NGK, LoaiNGK
where NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK;

--2) Cho biết thông tin về nhà cung cấp ở Thành phố HCM.

Select * from NHACC where DiaChiNCC like '%TP.HCM';

--3) Liệt kê các hóa đơn mua hàng trong tháng 5/2010.

Select * from HOADON where NgaylapHD like '2010-05%';

--4) Cho biết tên các nhà cung cấp có cung cấp NGK ‘Coca Cola’.

select TenNGK, TenNCC
from NGK , LOAINGK , NHACC 
where NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK and LoaiNGK.MaNCC = NHACC.MaNCC and TenNGK = 'Coca Cola';

--5) Cho biết tên các nhà cung cấp có thể cung cấp nhiều loại NGK nhất

Select top 1 TenNCC, count(MaLoaiNGK) SoLoaiNGK
from NHACC , LOAINGK 
where NHACC.MaNCC = LoaiNGK.MaNCC
group by TenNCC;

--6) Cho biết tên nhà cung cấp không có khả năng cung cấp NGK có tên ‘Pepsi’.
go
create view NCC_Pepsi
as
select TenNCC,  TenNGK
from  NHACC, NGK , LOAINGK 
where NGK.MaLoaiNGK = LoaiNGK. MaLoaiNGK 
  and LoaiNGK.MaNCC = NHACC.MaNCC
  and TenNGK = 'Pepsi';

select * from NHACC
where TenNCC not in (select distinct TenNCC from NCC_Pepsi)

--7) Hiển thị thông tin của NGK chưa bán được.

select * from NGK
Where MaNGK not in (select CT_HOADON.MaNGK 
                    from CT_HOADON , NGK 
	                where CT_HOADON.MaNGK = NGK.MaNGK);

--8) Hiển thị tên và tổng số lượng bán của NGK bán chạy nhất.

select TenNGK, sum(SLKHMua) AS "Số lượng bán"
from NGK, CT_HOADON  
where NGK.MaNGK = CT_HOADON.MaNGK
group by TenNGK

--9) Hiển thị tên và tổng số lượng của NGK nhập về.

select TenNGK , sum(SLDat) as "Số lượng đặt"
from NGK , CT_DDH 
where NGK.MaNGK = CT_DDH.MaNGK
group by TenNGK;

--10) Hiển thị ĐĐH đã đặt NGK với số lượng nhiều nhất so với các ĐĐH khác có đặt NGK đó. Thông tin hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất].

Select SoDDH, MaNGK, max(SLDat) as "SL đặt nhiều nhất"
from  CT_DDH
group by SoDDH, MaNGK;

--11) Hiển thị các NGK không được nhập trong tháng 1/2010.

select TenNGK, NgayDH 
from NGK , CT_DDH, DDH
where NGK.MaNGK = CT_DDH.MaNGK 
and CT_DDH.SoDDH = DDH.SoDDH
and not  (month(NgayDH)=1 and year(NgayDH)=2010);

--12) Hiển thị tên các NGK không bán được trong tháng 6/2010.
go
create view NGK_sale
as
select TenNGK, NgaylapHD
from NGK,HOADON, CT_HOADON
where NGK.MaNGK = CT_HOADON.MaNGK and  HOADON.SoHD = CT_HOADON.SoHD
and MONTH(NgaylapHD)=6 and YEAR(NgaylapHD)=2010;

select * from NGK
where TenNGK not in (select distinct TenNGK from NGK_sale)

--13) Cho biết cửa hàng bán bao nhiêu thứ NGK.

select TenKH, count(MaNGK) as "Số NGK"
from  KH, HOADON, CT_HOADON
where KH.MaKH = HOADON.MaKH and HOADON.SoHD = CT_HOADON.SoHD
group by TenKH;

--14) Cho biết cửa hàng bán bao nhiêu loại NGK.
create view LoaiNGK_KH
as
select distinct TenKH ,MaLoaiNGK
from NGK, KH, HOADON, CT_HOADON
where KH.MaKH = HOADON.MaKH 
  and HOADON.SoHD = CT_HOADON.SoHD
  and CT_HOADON.MaNGK = NGK.MaNGK

select TenKH , count(MaloaiNGk) as " Số loại NGK"
from LoaiNGK_KH
group by TenKH;

--15) Hiển thị thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất (căn cứ vào số lần mua hàng).

select top 1 MaKH, count(MaKH)  as "Số Khách Hàng"
from HOADON
group by MaKH
order by [Số Khách Hàng] desc;

--16) Tính tổng doanh thu năm 2010 của cửa hàng.

select  sum(SLKHMua * DGBan) as "Doanh Thu"
from  CT_HOADON, HOADON
where HOADON.SoHD = CT_HOADON.SoHD and Year(HOADON.NgaylapHD) =2010;

--17) Liệt kê 5 loại NGK bán chạy nhất (doanh thu) trong tháng 5/2010

select top 5 MaNGK, sum(SLKHMua* DGBan) as "Doanh Thu" 
from CT_HOADON , HOADON
where CT_HOADON.SoHD = HOADON.SoHD and Month(HOADON.NgaylapHD) = 5 and Year(HOADON.NgayLapHD) = 2010
group by MaNGK
order by [Doanh Thu] desc;

--18) Liệt kê thông tin bán NGK của tháng 5/2010. Thông tin hiển thị: Mã NGK, Tên NGK, SL bán.

select CT_HOADON.MaNGK, TenNGK, SLKHMua as "SL Bán"
from  CT_HOADON, HOADON , NGK
where CT_HOADON.SoHD = HOADON.SoHD and CT_HOADON.MaNGK = NGK.MaNGK and Month(HOADON.NgaylapHD) = 5 and Year(HOADON.NgayLapHD) = 2010;

--19) Liệt kê thông tin của NGK có nhiều người mua nhất.

select top 1 CT_HOADON.MaNGK, NGK.TenNGK, NGK.QuyCach, NGK.MaLoaiNGK, count(MaKH) as "Số Người Mua" 
from  CT_HOADON, HOADON, NGK
where CT_HOADON.SoHD = HOADON.SoHD AND CT_HOADON.MaNGK = NGK.MaNGK
group by CT_HOADON.MaNGK, NGK.TenNGK, NGK.QuyCach, NGK.MaLoaiNGK
order by [Số Người Mua] desc ;

--20) Hiển thị ngày nhập hàng gần nhất của cửa hàng.

select max(NgayGH) as "Ngày Nhập Hàng Gần Nhất" from PHIEUGH;

--21) Cho biết số lần mua hàng của khách có mã là ‘KH01’.

select MaKH, count(MaKH) as "Số Lần Mua" 
from HOADON 
where MaKH='KH01'
group by MaKH;

--22) Cho biết tổng tiền của từng hóa đơn.

select SoHD, sum(SLKHMua*DGBan) as "Tổng tiền"
from CT_HOADON
group by SoHD;

--23) Cho biết danh sách các hóa đơn gồm SoHD, NgaylapHD, MaKH, TenKH và tổng trị giá của từng HoaDon. 
--Danh sách sắp xếp tăng dần theo ngày và giảm dần theo tổng trị giá của hóa đơn.

select CT_HOADON.SoHD,NgaylapHD,HOADON.MaKH,TenKH, sum(SLKHMua*DGBan) as "Tổng tiền"
from CT_HOADON, HOADON, KH
where CT_HOADON.SoHD = HOADON.SoHD and HOADON.MaKH = KH.MaKH
group by CT_HOADON.SoHD,NgaylapHD,HOADON.MaKH,TenKH
order by NgaylapHD asc, [Tổng tiền] desc;

--24) Cho biết các hóa đơn có tổng trị giá lớn hơn tổng trị giá trung bình của các hóa đơn trong ngày 18/06/2010.
--25) Cho biết số lượng từng NGK tiêu thụ theo từng tháng của năm 2010.
--26) Đưa ra danh sách NGK chưa được bán trong tháng 9 năm 2010.
--27) Đưa ra danh sách khách hàng có địa chỉ ở TP.HCM và từng mua NGK trong tháng 9 năm 2010.
--28) Đưa ra số lượng đã bán tương ứng của từng NGK trong tháng 10 năm 2010.
--29) Hiển thị thông tin khách hàng đã từng mua và tổng số lượng của từng NGK tại cửa hàng.
--30) Cho biết trong năm 2010, khách hàng nào đã mua nợ nhiều nhất.
--31) Có bao nhiêu hóa đơn chưa thanh toán hết số tiền?
--32) Liệt kê các hóa đơn cùng tên của khách hàng tương ứng đã mua NGK và thanh toán tiền đầy đủ 1 lần. (Không có phiếu trả nợ)
--33) Thông kê cho biết thông tin đặt hàng của cửa hàng trong năm 2010: Mã NGK, Tên NGK, Tổng SL đặt.
--34) Để thuận tiện trong việc tặng quà Tết cho khách hàng, hãy liệt kê danh sách khách hàng đã mua NGK với tổng số tiền tương ứng trong năm 2010 (hiển thị giảm dần theo số tiền đã mua)

--View
--1. Tạo View V_NGK tổng hợp dữ liệu về từng NGK đã được bán. Cấu trúc View gồm các thuộc tính:
--MaNGK, TenNGK, Quycach, SoLuongBan,Tổng tiền = SoLuongBan * Đơn giá bán

create view V_NGK
as  
select NGK.MaNGK ,TenNGK, Quycach , sum (SLKHMua * DGBan) as "Tong Tien"
from NGK, CT_HOADON
where NGK.MaNGK = CT_HOADON.MaNGK 
group by TenNGK, QuyCach, NGK.MaNGK;

--2. Tạo View V_khachang tổng hợp dữ liệu về 10 khách hàng lớn. Danh sách gồm MaKH, TenKH,
--DTKH, Tổng tiền= SoLuongBan*Đơn giá bán
go
create view V_khachhang
as
select HOADON.MaKH, TenKH, DTKH , sum(SLKHMua * DGBan) as "Tong Tien"
from HOADON, CT_HOADON, KH
where HOADON.SoHD = CT_HOADON.SoHD and HOADON.MaKH = KH.MaKH
group by HOADON.MaKH, TenKH, DTKH

--3. Tạo view V_TRANO cho biết danh sách khách hàng đã thu hơn 2 lần nhưng chưa trả hết tiền. Danh
--sách gồm: MaKH, TenKH, DTKH, tổng tiền phải trả, tổng tiền đã trả, số lần thu tiền

create view v_tongtrano
as
select KH.MaKH, PhieuTraNNO.SoHD, sum(SoTienTra) as "Tong Tien Tra", count(PhieuTraNNo.SoHD) as "So lan Tra"
from PHIEUTRANNO, KH , HOADON
where PHIEUTRANNO.SoHD = HOADON.SoHD and KH.MaKH = HOADON.MaKH
group by KH.MaKH,PhieuTraNNO.SoHD
having  count(PhieuTraNNO.SoHD) > 1

create view v_tongtien
as
select HoaDon.MaKH, sum(SLKHMua * DGBan) as "Tong Tien Phai Tra"
from HOADON, CT_HOADON, KH
where HOADON.SoHD = CT_HOADON.SoHD and KH.MaKH = HOADON.MaKH
group by  HoaDon.MaKH

create view V_TraNo
as
select KH.MaKH, KH.TenKH, KH.DTKH, [Tong Tien Phai Tra], [Tong tien tra], [So lan Tra]
from v_tongtrano, v_tongtien , KH
where v_tongtrano.MaKH = v_tongtien.MaKH and KH.MaKH =  v_tongtien.MaKH 

select * from V_TraNo
--4. Tạo view V_ngk_ton hiển thị thông tin nước giải khát chưa bán được

--Procedure
--1. Tạo thủ tục sp _ngk liệt kê tất cả nước giải khát và loại nước giải khát tương ứng

create procedure sp_ngk 
as 
Select distinct TenNGK,TenLoaiNGK 
from NGK, LoaiNGK
where NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK;

EXEC sp_ngk;

--2. Tạo thủ tục sp_ncc cho biết thông tin về nhà cung cấp với mã nhà cung cấp là tham số đầu vào

CREATE PROCEDURE sp_ncc
    @MaNCC Varchar(255)
AS
BEGIN
    SELECT * FROM NHACC
    WHERE MaNCC = @MaNCC;
END;

EXEC sp_ncc @MaNCC = 'NC1';

--3. Tạo thủ tục sp_ton hiển thị thông tin nước giải khát chưa bán được

create procedure sp_ton
as
begin
select * from NGK
Where MaNGK not in (select CT_HOADON.MaNGK 
                    from CT_HOADON , NGK 
	                where CT_HOADON.MaNGK = NGK.MaNGK);
end;

EXEC sp_ton;

--4. Tạo thủ tục sp_dt tinh tổng doanh thu của năm (với năm là tham số đầu vào và doanh thu là tham số đầu ra)
go
CREATE PROCEDURE sp_dt
    @Nam int
AS
BEGIN
     select  sum(SLKHMua * DGBan) as "Tong Doanh Thu"
     from CT_HOADON, HOADON
     where HOADON.SoHD = CT_HOADON.SoHD and YEAR(NgaylapHD) = @Nam
END;

EXEC sp_dt @Nam = 2010

--5. Tạo thủ tục sp_tong_dt tinh tổng doanh thu của năm (với năm là tham số đầu vào và doanh thu là tham số đầu ra)
--6. Tạo thủ tục sp_danhsach liệt kê n loại nước giải khát bán chạy nhất (doanh thu) trong tháng (với n và tháng là tham số đầu vào)
--7. Tạo thủ tục sp_insert_CTPGH nhận vào các tham số tương ứng với thông tin của một dòng trong chi
--tiết phiếu giao hàng, nếu các điều kiện sau đây được thỏa mãn thì thêm dòng mới tương ứng với các thông tin đã cho vào Table CT_PGH:
-- SoPGH phải tồn tại trong table PGH
-- MaNGK ứng với SoDDH phải tồn tại trong table CT_DDH SLGiao<=SLDAT
--Thông báo nếu điều kiện trên bị vi phạm
--8. Tạo thủ tục có tên sp_delete_CTPH nhận vào các tham số tương ứng với thông tin của một dòng trong
--chi tiết phiếu hẹn, thực hiện các yêu cầu sau:7
-- Xóa dòng trương ứng trong chi tiết phiếu hẹn
-- Nếu phiếu hẹn tương ứng không còn dòng chi tiết thì xóa luôn phiếu hẹn đó

--Function
--1. Tạo hàm f_list có 2 tham số là @Ngay1 và @Ngay2 cho biết danh sách các NGK đã được bán trong khoảng thời gian trên. Danh sách gồm các thuộc tính: MaNGK, TenNGK, DVT, SoLuong.
go
CREATE FUNCTION f_list (@Ngay1 DATE, @Ngay2 DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT CT_HOADON.MaNGK, TenNGK, sum(SLKHMua) as "So luong mua"
    FROM HOADON, NGK, CT_HOADON
    WHERE CT_HOADON.SoHD = HOADON.SoHD and NGK.MaNGK = CT_HOADON.MaNGK and NgaylapHD BETWEEN @Ngay1 AND @Ngay2
	group by CT_HOADON.MaNGK, TenNGK
);
go
DECLARE @Ngay1 DATE = '2009-05-18';
DECLARE @Ngay2 DATE = '2020-05-19';
SELECT * FROM dbo.f_list(@Ngay1, @Ngay2);

--2. Tạo hàm f_max cho biết ĐĐH đã đặt NGK với số lượng nhiều nhất so với các ĐĐH khác có đặt NGK đó. Thông tin hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất].
go
CREATE FUNCTION f_max()
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 SoDDH , MaNGK, SUM(SLDat) AS [SL đặt nhiều nhất]
    FROM CT_DDH
    GROUP BY SoDDH, MaNGK
    ORDER BY SUM(SLDat) DESC
);
go
SELECT * FROM f_max();

--3. Tạo hàm f_kh hiển thị thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất (căn cứ vào số lần mua hàng).
go
CREATE FUNCTION f_kh()
RETURNS TABLE
AS
RETURN
(
    SELECT Top 1 KH.MaKH , KH.TenKH, KH.DTKH, KH.DCKH, COUNT(KH.MaKH) AS "So Lan Mua Hang"
    FROM HOADON, KH
	where HOADON.MaKH = KH.MaKH
    GROUP BY KH.MaKH , KH.TenKH, KH.DTKH, KH.DCKH
    ORDER BY [So Lan Mua Hang] DESC
);
go
select * from f_kh();

--4. Tạo hàm f_xlkh nhận vào tham số @MaKH, tính tổng tiền khách hàng đã trả (TongTien=sum(SLKHMua*DGBan)). Sau đó hàm trả về kết quả xếp loại khách hàng như sau:
--Nếu TongTien>800.000 : xếp loại “KH VIP”
--Nếu TongTien>500.000 : xếp loại “KH THÀNH VIÊN”
--Nếu TongTien<=500.000 : xếp loại “KH THÂN THIẾT”
go
CREATE FUNCTION f_xlkh (@MaKH varchar(250))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @TongTien DECIMAL(18, 2);

    SELECT @TongTien = SUM(SLKHMua * DGBan)
    FROM CT_HOADON, HOADON
    WHERE  CT_HOADON.SoHD = HOADON.SoHD and MaKH = @MaKH
	group by HoaDOn.MaKH

    -- Xếp loại khách hàng
    DECLARE @XepLoai NVARCHAR(255);

    IF @TongTien >= 800000
        SET @XepLoai = 'KH VIP';
    ELSE IF @TongTien > 500000
        SET @XepLoai = 'KH THANH VIEN';
    ELSE
        SET @XepLoai = 'KH Thuong';
    RETURN @XepLoai;
END;
go 
Declare @MAKH varchar(255) = 'KH02';
select  dbo.f_xlkh(@MaKH) as "Xep Loai";

--Trigger
--1. Tạo trigger PH _insert trên bảng PHIEUHEN kiểm tra ràng buộc toàn vẹn sau đây mỗi khi thêm một dòng vào bảng PHIEUHEN:
--MaKH phải tồn tại tronh bảng KH
--Ngày hẹn giao không thể trước ngày lập phiếu hẹn.
go
create trigger PH_insert
on PHIEUHEN
AFTER INSERT
AS
BEGIN
    --MaKH phải tồn tại trong bảng KH
    IF EXISTS (
        SELECT 1
        FROM inserted AS I
        WHERE NOT EXISTS (SELECT 1 FROM KH WHERE KH.MaKH = I.MaKH)
    )
    BEGIN
        RAISERROR('Ràng buộc: MaKH không tồn tại trong bảng KH',10, 1)
        ROLLBACK;
    END;
	--Ngày hẹn giao không thể trước ngày lập phiếu hẹn.
	IF EXISTS (
        SELECT 1
        FROM inserted AS I
        WHERE I.NgayHenGiao < I.NgayLapPH
    )
    BEGIN
        RAISERROR('Ràng buộc: Ngày hẹn giao không thể trước ngày lập phiếu hẹn.', 10, 1);
        ROLLBACK;
    END
END;

go 
INSERT INTO PHIEUHEN (SoPH, NgayLapPH, NgayHenGiao,MaKH) VALUES ('PH05','2010-05-08', '2010-05-06', 'KH03')

--2. Tạo trigger CTPH _insert trên bảng CT_PH kiểm tra ràng buộc toàn vẹn sau đây mỗi khi thêm một dòng vào bảng CT_PH:”Tổng số lượng hẹn cho mỗi MaNGK không vượt quá 20”
go
CREATE TRIGGER CTPH_insert
ON CT_PH
AFTER INSERT
AS
BEGIN
   --Tổng số lượng hẹn cho mỗi MaNGK không vượt quá 20
    IF EXISTS (
        SELECT  MaNGK, SLHen
        FROM CT_PH 
        GROUP BY SLHen, MaNGK
        HAVING SUM(SLHen) > 20
    )
    BEGIN
        RAISERROR('Ràng buộc: Tổng số lượng hẹn cho mỗi MaNGK không vượt quá 20.', 10, 1);
        ROLLBACK;
    END
END;

Insert into CT_PH(SoPH, MaNGK,SLHen) values ('PH05','ST2',21);

--3. Viết trigger PT_insert trên bảng PHIEUTRANO kiểm tra ràng buộc toàn vẹn sau đây mỗi khi thêm một dòng vào bảng PHIEUTRANO:“ Khách hàng chỉ được trả tối đa 3 lần cho mỗi hóa đơn”
go
CREATE TRIGGER PT_insert
ON PHIEUTRANNO
AFTER INSERT
AS
BEGIN
    --Khách hàng chỉ được trả tối đa 3 lần cho mỗi hóa đơn
    IF EXISTS (
        select  HoaDon.MaKH, count(MaKH) as "Số lần trả"
        from PHIEUTRANNO, HOADON
        where PHIEUTRANNO.SoHD = HOADON.SoHD
        group by  HoaDOn.MaKH
        HAVING COUNT(MaKH) > 3
    )
    BEGIN
        RAISERROR('Ràng buộc: Khách hàng chỉ được trả tối đa 3 lần cho mỗi hóa đơn.', 16, 1);
        ROLLBACK;
    END
END;

Insert into PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD) values('PTN06','2010-07-01',1080000 ,'HD01')

--4. Viết trigger HD_update trên bảng HOADON kiểm tra ràng buộc toàn vẹn sau đây mỗi khi cập nhật một dòng trên bảng HOADON:
--Không được cập nhật SoHD
--MaKH phải tồn tại trong bảng KH
--NgaylapHD <= Ngày hiện tại

go
CREATE TRIGGER HD_update
ON HOADON
AFTER UPDATE
AS
BEGIN
    --Không được cập nhật SoHD
    IF UPDATE(SoHD)
    BEGIN
        RAISERROR('Ràng buộc: Không được cập nhật SoHD.', 10, 1);
        ROLLBACK;
    END
	--MaKH phải tồn tại trong bảng KH
	IF NOT EXISTS (
        SELECT 1
        FROM inserted AS I
        WHERE I.MaKH IN (SELECT MaKH FROM KH)
    )
    BEGIN
        RAISERROR('Ràng buộc: MaKH không tồn tại trong bảng KH.', 10, 1);
        ROLLBACK;
        RETURN;
    END
	-- NgaylapHD <= Ngày hiện tại
    IF EXISTS (
        SELECT 1
        FROM inserted AS I
        WHERE I.NgaylapHD > GETDATE()
    )
    BEGIN
        RAISERROR('Ràng buộc: NgaylapHD phải nhỏ hơn hoặc bằng ngày hiện tại.', 10, 1);
        ROLLBACK;
        RETURN;
    END

END;

update HOADON set SoHD ='HD01' where NgaylapHD='2023-11-20';