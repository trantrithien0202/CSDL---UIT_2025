-- Chay lenh tao CSDL truoc
CREATE DATABASE QUANLIGIAOVU_0208
GO
-- Refesh lai CSDL moi lam tiep cac lenh sau
USE QUANLIGIAOVU_0208
GO
-------------------------------------------------
-------------------------------------------------
-- Tao bang + khoa chinh,khoa ngoai
CREATE TABLE KHOA(
	MAKHOA	char(4),
	TENKHOA	varchar(40),
	NGTLAP	smalldatetime,
	TRGKHOA	char(4)
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC(
	MAMH	char(10),
	TENMH	varchar(40),
	TCLT	tinyint,
	TCTH	tinyint,
	MAKHOA	char(4),
	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH		char(10),
	MAMH_TRUOC	char(10),
	CONSTRAINT PK_DK PRIMARY KEY(MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN(
	MAGV		char(4),
	HOTEN		varchar(40),
	HOCVI		varchar(10),
	HOCHAM		varchar(10),
	GIOITINH	varchar(3),
	NGSINH		smalldatetime,
	NGVL		smalldatetime,
	HESO		numeric(4,2),
	MUCLUONG	money,
	MAKHOA		char(4),
	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
)

CREATE TABLE LOP(
	MALOP	char(3),
	TENLOP	varchar(40),
	TRGLOP	char(5),
	SISO	tinyint,
	MAGVCN	char(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN(
	MAHV		char(5),
	HO		varchar(40),
	TEN		varchar(10),
	NGSINH		smalldatetime,
	GIOITINH	varchar(3),
	NOISINH		varchar(40),
	MALOP		char(3),
	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
)


CREATE TABLE GIANGDAY(
	MALOP	char(3),
	MAMH	char(10),
	MAGV	char(4),
	HOCKY	tinyint,
	NAM	smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	CONSTRAINT PK_GD PRIMARY KEY(MALOP,MAMH)
)

CREATE TABLE KETQUATHI(
	MAHV	char(5),
	MAMH	char(10),
	LANTHI	tinyint,
	NGTHI	smalldatetime,
	DIEM	numeric(4,2),
	KQUA	varchar(10),
	CONSTRAINT PK_KQ PRIMARY KEY(MAHV,MAMH,LANTHI)
)

-------------------------------------------
-- KHOA 	
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- MONHOC 		
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- DIEUKIEN 	
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK01_DK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK02_DK FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)
-------------------------------------------
-- GIAOVIEN
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- LOP
ALTER TABLE LOP ADD CONSTRAINT FK01_LOP FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD CONSTRAINT FK02_LOP FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- HOCVIEN
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
-------------------------------------------
-- GIANGDAY
ALTER TABLE GIANGDAY ADD CONSTRAINT FK01_GD FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK02_GD FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK03_GD FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT FK01_KQ FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK02_KQ FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)

-------------------------------------------------
-------------------------------------------------
-- Nhap lieu
ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL

delete from KHOA
delete from LOP
delete from MONHOC
delete from DIEUKIEN
delete from GIAOVIEN
delete from HOCVIEN
delete from GIANGDAY
delete from KETQUATHI

set dateformat dmy
-- KHOA
INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','06/07/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','He thong thong tin','06/07/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','06/07/2005','GV04')
INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- LOP
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- MONHOC
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- DIEUKIEN
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')

-- GIANGDAY
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- GIAOVIEN
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')

-- HOCVIEN
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

-- KETQUATHI
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')

-----------------

----------------- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
-- 1. Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
alter table HOCVIEN
add GHICHU varchar(50), DIEMTB numeric(4,2), XEPLOAI varchar(10)

-- 2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”
create trigger check_mahv
on HOCVIEN
after insert, update
as
begin
	if not exists(
		select 1
		from LOP, inserted
		where SUBSTRING(inserted.MAHV,1,3) = LOP.MALOP
	)
	begin
	rollback transaction
	print'Nhap MAHV khong hop le!'
	return
	end

	else if not exists(
		select 1
		from inserted
		where SUBSTRING(inserted.MAHV,4,2) like '[0-9][0-9]'
	)
	begin
	rollback transaction
	print'Nhap MAHV khong hop le!'
	end
end

-- 3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.
alter table HOCVIEN
add constraint ck_gioitinh
check (GIOITINH IN('Nam','Nu'))

-- 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22)
alter table KETQUATHI
alter column DIEM numeric(4,2)

alter table KETQUATHI
add constraint ck_diem
check(DIEM>=0 and DIEM<=10)

-- 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5

create trigger ck_kqua
on KETQUATHI
after insert, update
as
begin
	update KETQUATHI
	set KQUA = CASE
		when inserted.DIEM >= 5 then 'Dat'
		else 'Khong dat'
		end
	from KETQUATHI join inserted
	on inserted.MAHV = KETQUATHI.MAHV and inserted.MAMH = KETQUATHI.MAHV
end

-- 6. Học viên thi một môn tối đa 3 lần
create trigger ck_lanthi
on KETQUATHI
after insert, update
as
begin
	if exists(
		select kqt.MAHV, kqt.MAMH
		from KETQUATHI kqt join inserted i
		on kqt.MAHV = i.MAHV and kqt.MAMH = i.MAMH
		group by kqt.MAHV, kqt.MAMH
		having count(*) > 3
	)
	begin
	rollback transaction
	print'Hoc vien thi mot mon toi da 3 lan'
	end
end

-- Học kỳ chỉ có giá trị từ 1 đến 3.
alter table GIANGDAY
add constraint ck_hocki
check(HOCKY>=1 and HOCKY<=3)

-- 8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”
alter table GIAOVIEN
add constraint ck_giaovien
check (HOCVI in('CN','KS','Ths','TS','PTS'))

-- 9. Lớp trưởng của một lớp phải là học viên của lớp đó
create trigger ck_trglop
on LOP
after insert, update
as
begin
	if exists(
		select 1
		from inserted i left join HOCVIEN hv			
		on i.MALOP = hv.MALOP and i.TRGLOP = hv.MAHV
		where i.TRGLOP is not null and hv.MAHV is null
		-- Nếu hợp lệ thì khi left join sẽ không có hv.MAHV nào bị null, còn có 1 cái ko hợp
		-- lệ bị null thì rollback
	)
	begin
	rollback transaction
	print'Hoc vien khong thuoc lop'
	end
end

-- 10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”
create trigger ck_trgkhoa
on KHOA
after insert, update
as
begin
	if exists(
		select *
		from inserted i left join GIAOVIEN gv
		on i.MAKHOA = gv.MAKHOA and i.TRGKHOA = gv.MAGV
		where (i.TRGKHOA is not null) and (gv.MAGV is null or gv.HOCVI not in ('TS','PTS'))
	)
	begin
	rollback transaction
	print'Truong khoa phai thuoc khoa va co hoc vi "TS", "PTS"'
	end
end

-- 11.Học viên ít nhất là 18 tuổi
-- DATEDIFF là hàm dùng để tính khoảng cách thời gian giữa hai mốc ngày/giờ trong SQL Server.
-- DATEDIFF (datepart, startdate, enddate) 
-- datepart là đơn vị tính year,week,month,day,hour, minute, second...
alter table HOCVIEN
add constraint ck_tuoi_hv
check(getdate() >= dateadd(year, 18, NGSINH))

-- 12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
alter table GIANGDAY
with nocheck
add constraint ck_ngaygd
check(TUNGAY < DENNGAY)

-- 13. Giáo viên khi vào làm ít nhất là 22 tuổi
-- DATEADD là hàm cộng (hoặc trừ) thời gian
-- DATEADD(datepart, number, date). number là ngày cần cộng/trừ
alter table GIAOVIEN
add constraint ck_tuoi_gv
check(dateadd(year, 22, NGSINH)<=NGVL)

-- 14. Tất cả các môn học đều có số tín chỉ lý thuyết và 
-- tín chỉ thực hành chênh lệch nhau không quá 3
-- ép kiểu cast(... as type)
alter table MONHOC
add constraint ck_tinchi
check(abs(cast(TCLT as int) - cast(TCTH as int)) <=3)

--15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này

create trigger ck_thi
on KETQUATHI
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join GIANGDAY gd 
		on i.MAMH = gd.MAMH 
		join HOCVIEN hv
		on i.MAHV = hv.MAHV
		where i.NGTHI < gd.DENNGAY
	)
	begin
	rollback transaction
	print'Hoc vien chi duoc thi khi da hoc xong'
	end
end

-- 16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
create trigger ck_so_mon_hoc
on GIANGDAY
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join GIANGDAY gd
		on i.MALOP = gd.MALOP and i.HOCKY = gd.HOCKY and i.NAM = gd.NAM
		group by i.MALOP, i.HOCKY, i.NAM
		having count(*) > 3
	)
	begin
	rollback transaction
	print'Chi duoc hoc toi da 3 mon '
	end
end

-- 17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
create trigger ck_siso
on HOCVIEN
after insert, update, delete
as
begin
	update LOP
	set SISO = (
	select count(*)
	from HOCVIEN hv
	where hv.MALOP = LOP.MALOP
	)
	where LOP.MALOP in (
		select MALOP
		from inserted
		union
		select MALOP
		from deleted
	)
end

--18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ
-- không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
create trigger ck_monhoctruoc
on DIEUKIEN
after insert, update
as
begin
	if exists(
		select 1
		from inserted i
		where i.MAMH = i.MAMH_TRUOC
	)
	begin
	rollback transaction
	print'Ma mon hoc khong duoc giong nhau'
	return
	end

	if exists(
		select 1
		from inserted i join DIEUKIEN dk
		on i.MAMH = dk.MAMH_TRUOC and i.MAMH_TRUOC = dk.MAMH
	)
	begin
	rollback transaction
	print'Da ton tai dieu kien nay'
	end
end

-- 19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
create trigger ck_luong_gv
on GIAOVIEN
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join GIAOVIEN gv
		on i.HOCHAM = gv.HOCHAM and i.HOCVI = gv.HOCVI and i.HESO = gv.HESO
			and i.MAGV <> gv.MAGV
		where i.MUCLUONG <> gv.MUCLUONG
	)
	begin
	rollback transaction
	print'Muc luong chenh lech'
	end
end

-- 20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
create trigger ck_thilai
on KETQUATHI
after insert, update
as
begin
		if exists(
			select 1
			from inserted i
			where i.LANTHI > 1
			and not exists (
				select 1
				from KETQUATHI kqt
				where i.MAHV = kqt.MAHV and i.MAMH = kqt.MAMH
					  and i.LANTHI = kqt.LANTHI + 1
					  and kqt.DIEM < 5
			)
		)
		begin
		rollback transaction
		print'Lan thi truoc khong duoi 5'
		end
end

-- 21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học)
create trigger ck_ngaythilansau
on KETQUATHI
after insert, update
as
begin
	if exists(
		select 1
		from inserted i
		where i.LANTHI > 1
		and not exists(
			select 1
			from KETQUATHI kqt
			where kqt.LANTHI = i.LANTHI - 1
				and kqt.MAHV = i.MAHV
				and kqt.MAMH = i.MAMH
				and i.NGTHI > kqt.NGTHI
		)
	)
	begin
	rollback transaction
	print'Ngay thi lan sau phai lon hon ngay thi lan truoc'
	end
end

-- 22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong
create trigger ck_duocthi
on KETQUATHI
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join HOCVIEN hv
		on i.MAHV = hv.MAHV
		where not exists(
			select 1
			from GIANGDAY gd
			where i.MAHV = gd.MAMH and hv.MALOP = gd.MALOP and i.NGTHI > gd.DENNGAY
		)
	)
	begin 
	rollback transaction
	print'Hoc vien chi duoc thi mon ma lop da hoc xong'
	end
end


-- 23. Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học
-- xong những môn học phải học trước mới được học những môn liền sau).
create trigger ck_monhoctruoc
on GIANGDAY
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join DIEUKIEN dk
		on i.MAMH = dk.MAMH and dk.MAMH_TRUOC is not null
		where not exists(
			select 1
			from GIANGDAY gd
			where i.MALOP = gd.MALOP and dk.MAMH_TRUOC = gd.MAMH and i.TUNGAY > gd.DENNGAY
		)
	)
	begin
	rollback transaction
	print'Lop chua hoc mon hoc tien quyet'
	end
end

-- 24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách
create trigger ck_khoa_gv
on GIANGDAY
after insert, update
as
begin
	if exists(
		select 1
		from inserted i join GIAOVIEN gv
		on i.MAGV = gv.MAGV
		join MONHOC mh
		on i.MAMH = mh.MAMH 
		where gv.MAKHOA <> mh.MAKHOA
	)
	begin
	rollback transaction
	print'Giao vien chi duoc day mon ma khoa giao vien do phu trach'
	end
	
end

----------------- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
-- 1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa
update gv
set gv.HESO = gv.HESO + 0.2
from GIAOVIEN gv join KHOA k
on gv.MAKHOA = k.MAKHOA and gv.MAGV = k.TRGKHOA 

-- 2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn
-- học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
update hv
set hv.DIEMTB = (
	select avg(kqt.DIEM)
	from KETQUATHI kqt
	where hv.MAHV = kqt.MAHV
	and kqt.LANTHI = (
		select max(kqt1.LANTHI)
		from KETQUATHI kqt1
		where kqt.MAHV = kqt1.MAHV and kqt.MAMH = kqt1.MAMH
	)
)
from HOCVIEN hv

-- 3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi
-- lần thứ 3 dưới 5 điểm.
update hv
set hv.GHICHU = 'Cam thi'
from HOCVIEN hv
where exists(
	select 1
	from KETQUATHI kqt
	where hv.MAHV = kqt.MAHV and kqt.LANTHI = 3 and kqt.DIEM < 5
)

-- 4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
-- Nếu DIEMTB >= 9 thì XEPLOAI =”XS”
-- Nếu 8 >= DIEMTB < 9 thì XEPLOAI = “G”
-- Nếu 6.5 >= DIEMTB < 8 thì XEPLOAI = “K”
-- Nếu 5 >= DIEMTB < 6.5 thì XEPLOAI = “TB”
-- Nếu DIEMTB < 5 thì XEPLOAI = ”Y”
update HOCVIEN
set XEPLOAI =
	case
	when DIEMTB is null then null
	when DIEMTB >= 9 then 'XS'
	when DIEMTB >= 8 then 'G'
	when DIEMTB >= 6.5 then 'K'
	when DIEMTB >= 5 then 'TB'
	else 'Y'
	end

----------------- III. Ngôn ngữ truy vấn dữ liệu:
-- 1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp
select hv.MAHV, hv.HO, hv.TEN, hv.NGSINH, hv.MALOP
from LOP l join HOCVIEN hv
on l.TRGLOP = hv.MAHV

-- 2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số)
-- môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
select hv.MAHV, hv.HO, hv.TEN, kqt.LANTHI, kqt.DIEM
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
join MONHOC mh
on kqt.MAMH = mh.MAMH
where hv.MALOP = 'K12' and mh.MAMH = 'CTRR'
order by hv.TEN, hv.HO

-- 3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
select hv.MAHV, hv.HO, hv.TEN, kqt.MAMH
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
where kqt.DIEM >= 5 and kqt.LANTHI = 1

-- 4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1)
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
where hv.MALOP = 'K11' and kqt.MAMH = 'CTRR' and kqt.DIEM < 5 and kqt.LANTHI = 1

-- 5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” 
-- thi môn CTRR không đạt (ở tất cả các lần thi)
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
where hv.MALOP like 'K%' and kqt.MAMH = 'CTRR'
group by hv.MAHV, hv.HO, hv.TEN
having max(kqt.DIEM) < 5

-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
select distinct mh.TENMH
from GIAOVIEN gv join GIANGDAY gd
on gv.MAGV = gd.MAGV
join MONHOC mh
on mh.MAMH = gd.MAMH
where gv.HOTEN = 'Tran Tam Thanh' and gd.HOCKY = 1 and gd.NAM = 2006

-- 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006
select distinct mh.MAMH, mh.TENMH
from LOP l join GIANGDAY gd
on l.MAGVCN = gd.MAGV
join MONHOC mh
on mh.MAMH = gd.MAMH
where l.MALOP = 'K11' and gd.HOCKY = 1 and gd.NAM = 2006

-- 8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” 
-- dạy môn “Co So Du Lieu”
select hv.HO, hv.TEN
from GIAOVIEN gv join GIANGDAY gd
on gv.MAGV = gd.MAGV
join MONHOC mh
on gd.MAMH = mh.MAMH
join LOP l
on l.MALOP = gd.MALOP
join HOCVIEN hv 
on l.TRGLOP = hv.MAHV
where gv.HOTEN = 'Nguyen To Lan' and mh.TENMH = 'Co So Du Lieu'

-- 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
select dk.MAMH_TRUOC, mh1.TENMH
from MONHOC mh join DIEUKIEN dk
on mh.MAMH = dk.MAMH
join MONHOC mh1
on dk.MAMH_TRUOC = mh1.MAMH
where mh.TENMH = 'Co So Du Lieu'

-- 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào
select dk.MAMH, mh1.TENMH
from DIEUKIEN dk join MONHOC mh
on dk.MAMH_TRUOC = mh.MAMH
join MONHOC mh1
on mh1.MAMH = dk.MAMH
where mh.TENMH = 'Cau Truc Roi Rac' 

-- 11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
select distinct gv.HOTEN
from GIAOVIEN gv join GIANGDAY gd
on gd.MAGV = gv.MAGV
where exists (
		select 1
		from GIANGDAY gd1
		where gd.MAGV = gd1.MAGV and gd1.HOCKY = 1 and gd1.NAM = 2006 and gd1.MAMH = 'CTRR' and gd1.MALOP = 'K11'
	)
	and exists(
		select 1
		from GIANGDAY gd1
		where gd.MAGV = gd1.MAGV and gd1.HOCKY = 1 and gd1.NAM = 2006 and gd1.MAMH = 'CTRR' and gd1.MALOP = 'K12'
	)

-- 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
where kqt.MAMH = 'CSDL' and kqt.DIEM < 5 and kqt.LANTHI = 1
	and not exists(
		select 1
		from KETQUATHI k1
		where hv.MAHV = k1.MAHV and k1.MAMH = 'CSDL' and k1.LANTHI > 1
	)

-- 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv left join GIANGDAY gd
on gv.MAGV = gd.MAGV
where gv.MAGV is not null and gd.MAGV is null

-- 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv
where not exists(
    select 1
    from GIANGDAY gd
    join MONHOC mh on gd.MAMH = mh.MAMH
    where gd.MAGV = gv.MAGV and gv.MAKHOA = mh.MAKHOA
)

-- 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
select hv.HO, hv.TEN
from HOCVIEN hv 
where hv.MALOP = 'K11' and ( exists(
	select 1
	from KETQUATHI kqt
	where hv.MAHV = kqt.MAHV and kqt.MAMH = 'CTRR' and kqt.LANTHI = 2 and kqt.DIEM=5
	) 
or exists(
	select 1
	from KETQUATHI kqt
	where hv.MAHV = kqt.MAHV
	group by kqt.MAHV, kqt.MAMH
	having max(kqt.DIEM) < 5 and count(*)>=3
	)
)

-- 16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học
select gv.HOTEN
from GIAOVIEN gv
where exists(
	select 1
	from GIANGDAY gd
	where gv.MAGV = gd.MAGV and gd.MAMH = 'CTRR'
	group by gd.MAGV, gd.MAMH, gd.HOCKY, gd.NAM
	having count(*) >= 2
)

-- 17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN, kqt.MAMH, kqt.LANTHI, kqt.DIEM
from HOCVIEN hv join KETQUATHI kqt
on hv.MAHV = kqt.MAHV
where kqt.MAMH = 'CSDL' and kqt.LANTHI = (
	select max(k.LANTHI)
	from KETQUATHI k
	where kqt.MAHV = k.MAHV and kqt.MAMH = k.MAMH
)

-- 18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
select hv.MAHV, hv.HO, hv.TEN, k.MAMH, k.LANTHI, k.DIEM
from HOCVIEN hv join KETQUATHI k
on hv.MAHV = k.MAHV
where k.MAMH = 'CSDL' and k.DIEM = (
	select max(k1.DIEM)
	from KETQUATHI k1
	where k.MAHV = k1.MAHV and k.MAMH = k1.MAMH
)

-- 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất
select k.MAKHOA, k.TENKHOA
from KHOA k
where k.NGTLAP = (
	select MIN(k1.NGTLAP)
	from KHOA k1
)

-- 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
select count(*)
from GIAOVIEN gv
where gv.HOCHAM = 'GS' or gv.HOCHAM = 'PGS'

-- 21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa
select k.TENKHOA, count(*) as SL_HocVi
from GIAOVIEN gv join KHOA k
on gv.MAKHOA = k.MAKHOA
where gv.HOCVI in('CN','KS','Ths','TS','PTS')
group by k.TENKHOA

-- 22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt)
select mh.TENMH, kqt.KQUA, count(*) as SL
from MONHOC mh join KETQUATHI kqt
on mh.MAMH = kqt.MAMH
where kqt.LANTHI = (
	select max(k.LANTHI)
	from KETQUATHI k
	where kqt.MAHV = k.MAHV and kqt.MAMH = k.MAMH
)
group by kqt.KQUA, kqt.MAMH, mh.TENMH

-- 23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học
select distinct gv.MAGV, gv.HOTEN
from GIAOVIEN gv join LOP l
on gv.MAGV = l.MAGVCN
join GIANGDAY gd
on gd.MAGV = l.MAGVCN and gd.MALOP = l.MALOP

-- 24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất
select hv.HO, hv.TEN, l.MALOP
from LOP l join HOCVIEN hv
on l.MALOP = hv.MALOP and l.TRGLOP = hv.MAHV
where l.SISO = (
	select max(l1.SISO)
	from LOP l1
)

-- 25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn 
-- (mỗi môn đều thi không đạt ở tất cả các lần thi).
select hv.HO, hv.TEN
from (
	select k.MAHV, k.MAMH
	from KETQUATHI k
	group by k.MAHV, k.MAMH
	having max(k.DIEM) < 5
) THITRUOT join LOP 
on THITRUOT.MAHV = LOP.TRGLOP
join HOCVIEN hv 
on hv.MAHV = LOP.TRGLOP
group by hv.MAHV, hv.HO, hv.TEN
having count(*)>3

-- 26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất
select top 1 with ties hv.MAHV, hv.HO, hv.TEN, count(*) as SOMON
from HOCVIEN hv
join(
	select MAHV, MAMH
	from KETQUATHI
	group by MAHV, MAMH
	having max(DIEM) >= 9
) t
on hv.MAHV = t.MAHV
group by hv.MAHV, hv.HO, hv.TEN
order by count(*) desc

-- 28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
select gd.MAGV, gd.HOCKY,gd.NAM, count(distinct gd.MAMH) as SOMON, count(distinct gd.MALOP) as SOLOP
from GIANGDAY gd
group by gd.MAGV, gd.HOCKY, gd.NAM

-- 30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
select top 1 with ties mh.MAMH,mh.TENMH, count(distinct kqt.MAHV) as SL_KODAT
from MONHOC mh
join KETQUATHI kqt on mh.MAMH = kqt.MAMH
where kqt.LANTHI = 1 and kqt.DIEM < 5
group by mh.MAMH, mh.TENMH
order by count(distinct kqt.MAHV) desc

-- 31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1)
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from KETQUATHI kqt
	where kqt.MAHV = hv.MAHV
	  and kqt.LANTHI = 1
	  and kqt.DIEM < 5
)

-- 32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from KETQUATHI kqt
	where kqt.MAHV = hv.MAHV
	  and kqt.LANTHI =(
		select max(k.LANTHI)
		from KETQUATHI k
		where k.MAHV = kqt.MAHV
		  and k.MAMH = kqt.MAMH
	  )
	  and kqt.DIEM < 5
)

-- 33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1)
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(		-- Ko ton tai mon nao ma sv chua thi lan 1
		select 1
		from MONHOC mh
		where not exists(
			select 1
			from KETQUATHI kqt
			where kqt.MAHV = hv.MAHV
			  and kqt.MAMH = mh.MAMH
			  and kqt.LANTHI = 1
		)
)
and not exists(			-- Ko ton tai mon nao thi lan 1 ma khong dat
		select 1
		from KETQUATHI kqt
		where kqt.MAHV = hv.MAHV
		  and kqt.LANTHI = 1
		  and kqt.DIEM < 5
)

-- 34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from MONHOC mh
	where not exists(
		select 1
		from KETQUATHI kqt
		where kqt.MAHV = hv.MAHV
		and kqt.MAMH = mh.MAMH
		)
)
and not exists(
	select 1
	from KETQUATHI kqt
	where kqt.MAHV = hv.MAHV
	  and kqt.DIEM < 5
	  and kqt.LANTHI = (
			select max(k1.LANTHI)
			from KETQUATHI k1
			where k1.MAHV = kqt.MAHV
			  and k1.MAMH = kqt.MAMH
			)
)

--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng)
select hv.MAHV, hv.HO, hv.TEN, kqt.MAMH, kqt.DIEM
from HOCVIEN hv
join KETQUATHI kqt
	on hv.MAHV = kqt.MAHV
where kqt.LANTHI =(
		select max(k1.LANTHI)
		from KETQUATHI k1
		where k1.MAHV = kqt.MAHV
		  and k1.MAMH = kqt.MAMH
)
and kqt.DIEM =(
		select max(k2.DIEM)
		from KETQUATHI k2
		where k2.MAMH = kqt.MAMH
		  and k2.LANTHI =(
				select max(k3.LANTHI)
				from KETQUATHI k3
				where k3.MAHV = k2.MAHV
				  and k3.MAMH = k2.MAMH
		  )
)
