create database QLPT1
go

use QLPT1
go

create table PHONGTRO(
	MAPT char(5),
	TENPT nvarchar(50),
	DIENTICH float,
	GIAPT money,
	TINHTRANGPT nvarchar(20)
	constraint PK_PT primary key(MAPT)
)

create table CUDAN(
	MACD char(5),
	HOTEN nvarchar(50),
	CCCD nvarchar(12),
	DIACHI nvarchar(100),
	SODT varchar(15),
	NGAYTHUE smalldatetime,
	TRANGTHAICD nvarchar(15)
	constraint PK_CD primary key(MACD)
)

create table HOPDONG(
	MAHD char(5),
	MACD char(5),
	MAPT char(5),
	NGAYKY smalldatetime,
	NGAYHETHAN smalldatetime,
	TRANGTHAIHD nvarchar(20)
	constraint PK_HD primary key(MAHD)
)
create table DICHVU(
	MADV char(5),
	TENDV nvarchar(50),
	DONGIA money
	constraint PK_DV primary key(MaDV)
)

create table PHIEUTINHTIEN(
	MAPTT char(5),
	MAHD char(5),
	SOTIENDICHVU money,
	SOTIENTHUEPT money,
	TONGTIENTT money,
	NGAYTINHTIEN smalldatetime,
	TINHTRANGTT nvarchar(20),
	PHUONGTHUCTT nvarchar(20)
	constraint PK_PTT primary key(MAPTT)
)

create table CHITIETTTDV(
	MAPTT char(5),
	MADV char(5),
	CHISODV float,
	THANHTIEN money
	constraint PK_CHITIET primary key(MAPTT, MADV)
)

alter table HOPDONG add constraint FK01_CD foreign key (MACD) references CUDAN(MACD)
alter table HOPDONG add constraint FK02_CD foreign key (MAPT) references PHONGTRO(MAPT)

alter table PHIEUTINHTIEN add constraint FK01_PTT foreign key (MAHD) references HOPDONG(MAHD)

alter table CHITIETTTDV add constraint FK01_CT foreign key (MAPTT) references PHIEUTINHTIEN(MAPTT)
alter table CHITIETTTDV add constraint FK02_CT foreign key (MADV) references DICHVU(MADV)


-- Du Lieu PHONGTRO
INSERT INTO PHONGTRO (MAPT, TENPT, DIENTICH, GIAPT, TINHTRANGPT) VALUES
('P001', 'Phong 101', 24, 5000000, 'Da cho thue'),
('P002', 'Phong 102', 24, 3800000, 'Da cho thue'),
('P003', 'Phong 103', 36, 4800000, 'Da cho thue'),
('P004', 'Phong 104', 24, 3800000, 'Da cho thue'),
('P005', 'Phong 105', 40, 8000000, 'Da cho thue'),
('P006', 'Phong 106', 36, 5800000, 'Trong'),
('P007', 'Phong 107', 28, 3800000, 'Da cho thue'),
('P008', 'Phong 108', 28, 4200000, 'Da cho thue'),
('P009', 'Phong 109', 28, 4200000, 'Trong'),
('P010', 'Phong 110', 40, 8000000, 'Da cho thue');

-- Thêm dữ liệu vào bảng CUDAN
INSERT INTO CUDAN (MACD, HOTEN, CCCD, DIACHI, SODT, NGAYTHUE, TRANGTHAICD) VALUES
('CD001', 'Nguyen Huu Phu', '227635273657', 'Ha Noi', '0367456276', '2024-10-01', 'Da roi di'),
('CD002', 'Le Thi Thanh Thao', '673272832422', 'Hai Phong', '0927482749', '2024-10-01', 'Dang o'),
('CD003', 'Tran Nguyen Huu Phuc', '125266729012', 'Da Nang', '0978123456', '2024-10-15', 'Da roi di'),
('CD004', 'Pham Minh Du', '523483690902', 'Ho Chi Minh', '0888536467', '2024-10-30', 'Dang o'),
('CD005', 'Hoang Thu Hieu', '736862746710', 'Khanh Hoa', '0904897595', '2024-11-01', 'Dang o'),
('CD006', 'Tran Khanh Thi', '237864874844', 'Binh Đinh', '0917363487', '2024-11-15', 'Dang o'),
('CD007', 'Do Van Nam', '980748392617', 'Ho Chi Minh', '0900635473', '2024-11-15', 'Da roi di'),
('CD008', 'Pham Chien Si', '194784625466', 'Vinh Long', '0990237847', '2024-12-01', 'Dang o'),
('CD009', 'Luu Thanh Tu', '998467745644', 'Ca Mau', '0911734784', '2024-12-10', 'Dang o'),
('CD010', 'Bui Thi Mong Uyen', '121234678908', 'Hoa Binh', '0328267480', '2024-12-15', 'Dang o');

-- Thêm dữ liệu vào bảng HOPDONG
INSERT INTO HOPDONG (MAHD, MACD, MAPT, NGAYKY, NGAYHETHAN, TRANGTHAIHD) VALUES
('HD001', 'CD001', 'P002', '2024-10-01', '2024-10-31', 'Da het han'),
('HD002', 'CD002', 'P004', '2024-10-01', '2024-11-30', 'Da het han'),
('HD003', 'CD003', 'P006', '2024-10-15', '2024-11-14', 'Da het han'),
('HD004', 'CD004', 'P001', '2024-10-30', '2025-03-31', 'Dang thue'),
('HD005', 'CD005', 'P003', '2024-11-01', '2025-03-31', 'Dang thue'),
('HD006', 'CD006', 'P005', '2024-11-15', '2025-05-14', 'Dang thue'),
('HD007', 'CD004', 'P006', '2024-11-15', '2024-12-14', 'Da het han'),
('HD008', 'CD002', 'P004', '2024-12-01', '2025-03-31', 'Dang thue'),
('HD009', 'CD007', 'P009', '2024-12-01', '2024-12-31', 'Da het han'),
('HD010', 'CD008', 'P002', '2024-12-01', '2025-05-31', 'Dang thue'),
('HD011', 'CD009', 'P007', '2024-12-10', '2025-06-09', 'Dang thue'),
('HD012', 'CD010', 'P008', '2024-12-15', '2025-09-14', 'Dang thue'),
('HD013', 'CD006', 'P010', '2025-01-01', '2025-12-31', 'Dang thue');


-- Thêm dữ liệu vào bảng DICHVU
INSERT INTO DICHVU (MADV, TENDV, DONGIA) VALUES
('DV001', 'Dien', 3500),
('DV002', 'Nuoc', 10000),
('DV003', 'Internet', 150000),
('DV004', 'Ve sinh', 50000),
('DV005', 'Truyen hinh cap', 160000);

-- Thêm dữ liệu vào bảng THANHTOAN
INSERT INTO PHIEUTINHTIEN (MAPTT, MAHD, SOTIENDICHVU, SOTIENTHUEPT, TONGTIENTT, NGAYTINHTIEN, TINHTRANGTT, PHUONGTHUCTT) VALUES
('TT001', 'HD001', 0, 3800000, 3800000, '2024-10-01', 'Da thanh toan', 'Chuyen khoan'),
('TT002', 'HD002', 0, 3800000, 3000000, '2024-10-01', 'Da thanh toan', 'Chuyen khoan'),
('TT003', 'HD003', 0, 5800000, 5800000, '2024-10-15', 'Da thanh toan', 'Tien mat'),
('TT004', 'HD004', 0, 5000000, 5000000, '2024-10-30', 'Da thanh toan', 'Chuyen khoan'),
('TT005', 'HD005', 0, 4800000, 4800000, '2024-11-01', 'Da thanh toan', 'Chuyen khoan'),
('TT006', 'HD001', 402000, 0, 402000, '2024-11-01', 'Da thanh toan', 'Chuyen khoan'),
('TT007', 'HD002', 289000, 3800000, 4089000, '2024-11-01', 'Da thanh toan', 'Tien mat'),
('TT008', 'HD003', 320000, 0, 320000, '2024-11-15', 'Da thanh toan', 'Chuyen khoan'),
('TT009', 'HD006', 0, 8000000, 8000000, '2024-11-15', 'Da thanh toan', 'Chuyen khoan'),
('TT010', 'HD007', 0, 5800000, 5800000, '2024-11-15', 'Da thanh toan', 'Chuyen khoan'),
('TT011', 'HD002', 296000, 0, 296000, '2024-12-01', 'Da thanh toan', 'Chuyen khoan'),
('TT012', 'HD004', 396000, 5000000, 5396000, '2024-12-01', 'Da thanh toan', 'Tien mat'),
('TT013', 'HD005', 204500, 4800000, 5004500, '2024-12-01', 'Da thanh toan', 'Tien mat'),
('TT014', 'HD008', 0, 3800000, 3800000, '2024-12-01', 'Da thanh toan', 'Chuyen khoan'),
('TT015', 'HD009', 0, 4200000, 4200000, '2024-12-01', 'Da thanh toan', 'Tien mat'),
('TT016', 'HD010', 0, 3800000, 3800000, '2024-12-01', 'Da thanh toan', 'Tien mat'),
('TT017', 'HD011', 0, 3800000, 3800000, '2024-12-10', 'Da thanh toan', 'Chuyen khoan'),
('TT018', 'HD012', 0, 4200000, 4200000, '2024-12-10', 'Da thanh toan', 'Tien mat'),
('TT019', 'HD006', 382000, 8000000, 8382000, '2024-12-15', 'Da thanh toan', 'Tien mat'),
('TT020', 'HD007', 320000, 0, 320000, '2024-12-15', 'Da thanh toan', 'Chuyen khoan');


-- Thêm dữ liệu vào bảng CHITIETTTDV
INSERT INTO CHITIETTTDV (MAPTT, MADV, CHISODV, THANHTIEN) VALUES
('TT006', 'DV001', 32, 112000),
('TT006', 'DV002', 9, 90000),
('TT006', 'DV003', 1, 150000),
('TT006', 'DV004', 1, 50000),
('TT007', 'DV001', 14, 49000),
('TT007', 'DV002', 4, 40000),
('TT007', 'DV003', 1, 150000),
('TT007', 'DV004', 1, 50000),
('TT008', 'DV001', 20, 70000),
('TT008', 'DV002', 5, 50000),
('TT008', 'DV003', 1, 150000),
('TT008', 'DV004', 1, 50000),
('TT011', 'DV001', 16, 56000),
('TT011', 'DV002', 4, 40000),
('TT011', 'DV003', 1, 150000),
('TT011', 'DV004', 1, 50000),
('TT012', 'DV001', 36, 126000),
('TT012', 'DV002', 9, 90000),
('TT012', 'DV003', 1, 150000),
('TT012', 'DV004', 1, 50000),
('TT013', 'DV001', 27, 94500),
('TT013', 'DV002', 6, 60000),
('TT013', 'DV004', 1, 50000),
('TT019', 'DV001', 32, 112000),
('TT019', 'DV002', 7, 70000),
('TT019', 'DV003', 1, 150000),
('TT019', 'DV004', 1, 50000),
('TT020', 'DV001', 20, 70000),
('TT020', 'DV002', 5, 50000),
('TT020', 'DV003', 1, 150000),
('TT020', 'DV004', 1, 50000);

------------------
-- 2.1. Diện tích của một căn phòng trọ có giá trị từ 10 đến 50 m2. (0.5 điểm)
alter table PHONGTRO
add constraint ck_dt
check(DIENTICH>=10 and DIENTICH <=50)

-- 2.2. Tình trạng thanh toán của phiếu tính tiền chỉ nhận một trong hai giá trị 
-- ‘Chưa thanh toán’ hoặc ‘Đã thanh toán’. (0.5 điểm)
alter table PHIEUTINHTIEN
add constraint ck_tttt
check(TINHTRANGTT in ('Chua thanh toan', 'Da thanh toan'))

-- 2.3. Số tiền của mỗi dịch vụ đã sử dụng (ThanhTien) trong chi tiết tính tiền được tính bằng
-- chỉ số đã sử dụng (ChiSoDV) nhân với đơn giá (DonGia) của dịch vụ đó. Hãy viết trigger để
-- tạo ràng buộc trên cho thao tác thêm mới một chi tiết sử dụng dịch vụ. (1 điểm)
create trigger ck_thanhtien
on CHITIETTTDV
after insert, update
as
begin
	update ct
	set ct.THANHTIEN = ct.CHISODV * dv.DONGIA
	from CHITIETTTDV ct join inserted i
	on ct.MAPTT = i.MAPTT and ct.MADV = i.MADV
	join DICHVU dv 
	on i.MADV = dv.MADV
end

-- 3.1 Liệt kê thông tin các phòng trọ (mã, tên phòng) có giá thuê trên 5,000,000 VNĐ cùng
-- với thông tin cư dân (mã, họ tên) đã ký hợp đồng thuê các phòng đó trong năm 2024
select hd.MAPT, pt.TENPT, cd.MACD, cd.HOTEN
from PHONGTRO pt join HOPDONG hd
on pt.MAPT = hd.MAPT
join CUDAN cd
on hd.MACD = cd.MACD
where pt.GIAPT > 5000000 and year(hd.NGAYKY) = 2024

-- 3.2. Liệt kê các dịch vụ (mã, tên dịch vụ) đã được thanh toán trong các phiếu tính tiền của
-- cả hai tháng 11 và tháng 12 năm 2024 cho hợp đồng có mã ‘HD002’. (1 điểm)
select distinct dv.MADV, dv.TENDV
from PHIEUTINHTIEN ptt join CHITIETTTDV ct
on ptt.MAPTT = ct.MAPTT
join DICHVU dv
on dv.MADV = ct.MADV
where ptt.TINHTRANGTT = 'Da thanh toan' and ptt.MAHD = 'HD002' 
	and year(ptt.NGAYTINHTIEN) = 2024 and not exists(
		select 1 
		from PHIEUTINHTIEN p2
		where ptt.MAPTT = p2.MAPTT and p2.TINHTRANGTT <> 'Da thanh toan'
			and (month(p2.NGAYTINHTIEN) = 11 or month(p2.NGAYTINHTIEN) = 12)
	)



-- 3.3. Tìm thông tin các phiếu tính tiền (mã phiếu tính tiền, mã hợp đồng) trong năm 2024 
-- và đã sử dụng tất cả các dịch vụ có đơn giá từ 150,000 VNĐ trở xuống. (1 điểm)
select p.MAPTT, p.MAHD
from PHIEUTINHTIEN p
where year(p.NGAYTINHTIEN) = 2024 and not exists(
	select 1 
	from CHITIETTTDV ct join DICHVU dv
	on ct.MADV = dv.MADV
	where p.MAPTT = ct.MAPTT and dv.DONGIA <= 150000 and p.TINHTRANGTT <> 'Da thanh toan'
)

-- 3.4. Với mỗi hợp đồng, hãy cho biết số lượng phiếu tính tiền đã được thanh toán bằng phương
-- thức ‘Chuyển khoản’ trong năm 2024. Thông tin hiển thị: Mã hợp đồng, mã cư dân, số lượng.
-- (1 điểm)
select hd.MAHD, hd.MACD, count(*) as SL
from HOPDONG hd join PHIEUTINHTIEN p
on hd.MAHD = p.MAHD
where p.PHUONGTHUCTT = 'Chuyen khoan' and year(p.NGAYTINHTIEN) = 2024 and p.TINHTRANGTT = 'Da thanh toan'
group by hd.MAHD, hd.MACD

--3.5. Trong các cư dân có số lần ký hợp đồng nhiều nhất, tìm cư dân (mã, họ tên) có tổng số
-- tiền đã thanh toán trong năm 2024 nhiều hơn 15,000,000 VNĐ. 
select cd.MACD, cd.HOTEN
from (
	select top 1 with ties hd.MACD, count(*) as SL
	from HOPDONG hd
	group by hd.MACD
	order by SL desc
) t join HOPDONG hd on t.MACD = hd.MACD
join PHIEUTINHTIEN p on hd.MAHD = p.MAHD
join CUDAN cd on cd.MACD = t.MACD
where p.TINHTRANGTT = 'Da thanh toan' and year(p.NGAYTINHTIEN) = 2024
group by cd.MACD, cd.HOTEN
having sum(p.TONGTIENTT) > 15000000
