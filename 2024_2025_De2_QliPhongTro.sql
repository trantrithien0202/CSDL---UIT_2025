-- Du Lieu PHONGTRO
INSERT INTO PHONGTRO (MAPT, TENPT, DIENTICH, LOAIPT, GIAPT, TINHTRANGPT) VALUES
('P001', 'Phong 101', 24, 'Kiot', 5000000, 'Da cho thue'),
('P002', 'Phong 102', 24, 'Co gac xep', 3800000, 'Da cho thue'),
('P003', 'Phong 103', 36, 'Khong gac xep', 4800000, 'Da cho thue'),
('P004', 'Phong 104', 24, 'Co gac xep', 3800000, 'Da cho thue'),
('P005', 'Phong 105', 40, 'Kiot', 8000000, 'Da cho thue'),
('P006', 'Phong 106', 36, 'Co gac xep', 5800000, 'Trong'),
('P007', 'Phong 107', 28, 'Khong gac xep', 3800000, 'Da cho thue'),
('P008', 'Phong 108', 28, 'Co gac xep', 4200000, 'Da cho thue'),
('P009', 'Phong 109', 28, 'Co gac xep', 4200000, 'Trong'),
('P010', 'Phong 110', 40, 'Kiot', 8000000, 'Da cho thue');

-- Thêm dữ liệu vào bảng CUDAN
INSERT INTO CUDAN (MACD, HOTEN, CCCD, DIACHI, SODT, TRANGTHAICD) VALUES
('CD001', 'Nguyen Huu Phu', '227635273657', 'Ha Noi', '0367456276', 'Da roi di'),
('CD002', 'Le Thi Thanh Thao', '673272832422', 'Hai Phong', '0927482749', 'Dang o'),
('CD003', 'Tran Nguyen Huu Phuc', '125266729012', 'Da Nang', '0978123456', 'Da roi di'),
('CD004', 'Pham Minh Du', '523483690902', 'Ho Chi Minh', '0888536467', 'Dang o'),
('CD005', 'Hoang Thu Hieu', '736862746710', 'Khanh Hoa', '0904897595', 'Dang o'),
('CD006', 'Tran Khanh Thi', '237864874844', 'Binh Đinh', '0917363487', 'Dang o'),
('CD007', 'Do Van Nam', '980748392617', 'Ho Chi Minh', '0900635473', 'Da roi di'),
('CD008', 'Pham Chien Si', '194784625466', 'Vinh Long', '0990237847', 'Dang o'),
('CD009', 'Luu Thanh Tu', '998467745644', 'Ca Mau', '0911734784', 'Dang o'),
('CD010', 'Bui Thi Mong Uyen', '121234678908', 'Hoa Binh', '0328267480', 'Dang o');

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

create database QLPT2
go

use QLPT2
go

create table PHONGTRO(
	MAPT char(5),
	TENPT nvarchar(50),
	DIENTICH float,
	LOAIPT nvarchar(20),
	GIAPT money,
	TINHTRANGPT nvarchar(20)
	CONSTRAINT PK_PT PRIMARY KEY(MAPT)
)

CREATE TABLE CUDAN(
	MACD char(5),
	HOTEN nvarchar(50),
	CCCD nvarchar(12),
	DIACHI nvarchar(100),
	SODT varchar(15),
	NGAYTHUE smalldatetime,
	TRANGTHAICD nvarchar(15) 
	CONSTRAINT PK_CD PRIMARY KEY(MACD)
)

CREATE TABLE HOPDONG(
	MAHD char(5),
	MACD char(5),
	MAPT char(5),
	NGAYKY smalldatetime,
	NGAYHETHAN smalldatetime,
	TRANGTHAIHD nvarchar(20)
	CONSTRAINT PK_HD PRIMARY KEY(MAHD)
)

CREATE TABLE DICHVU(
	MADV char(5),
	TENDV nvarchar(50),
	DONGIA money
	CONSTRAINT PK_DV PRIMARY KEY(MADV)
)

CREATE TABLE PHIEUTINHTIEN(
	MAPTT char(5),
	MAHD char(5),
	SOTIENDICHVU money,
	SOTIENTHUEPT money,
	TONGTIENTT money,
	NGAYTINHTIEN smalldatetime,
	TINHTRANGTT nvarchar(20),
	PHUONGTHUCTT nvarchar(20)
	CONSTRAINT PK_PTT PRIMARY KEY(MAPTT)
)

CREATE TABLE CHITIETTTDV(
	MAPTT char(5),
	MADV char(5),
	CHISODV float,
	THANHTIEN money
	CONSTRAINT PK_CT PRIMARY KEY(MAPTT, MADV)
)

ALTER TABLE HOPDONG ADD CONSTRAINT FK01_HD FOREIGN KEY(MACD) REFERENCES CUDAN(MACD)
ALTER TABLE HOPDONG ADD CONSTRAINT FK02_HD FOREIGN KEY(MAPT) REFERENCES PHONGTRO(MAPT)

ALTER TABLE PHIEUTINHTIEN ADD CONSTRAINT FK_PTT FOREIGN KEY(MAHD) REFERENCES HOPDONG(MAHD)

ALTER TABLE CHITIETTTDV ADD CONSTRAINT FK01_CT FOREIGN KEY(MAPTT) REFERENCES PHIEUTINHTIEN(MAPTT)
ALTER TABLE CHITIETTTDV ADD CONSTRAINT FK02_CT FOREIGN KEY(MADV) REFERENCES DICHVU(MADV)

----------------------
-- 2.1. Giá thuê phòng trọ có giá trị trong khoảng từ 500,000 VNĐ đến 20,000,000 VNĐ. (0.5 điểm)
alter table PHONGTRO
add constraint ck_gia
check(GIAPT >= 500000 and GIAPT <= 20000000)

-- 2.2. Trạng thái cư dân chỉ nhận một trong hai giá trị ‘Đang ở’ hoặc ‘Đã rời đi’. (0.5 điểm)
alter table CUDAN
add constraint ck_trangthai
check(TRANGTHAICD in ('Dang o', 'Da roi di'))

-- 2.3. Số tiền của mỗi dịch vụ đã sử dụng (ThanhTien) trong chi tiết tính tiền được 
-- tính bằng chỉ số đã sử dụng (ChiSoDV) nhân với đơn giá (DonGia) của dịch vụ đó. 
--Hãy viết trigger để tạo ràng buộc trên cho thao tác sửa một chi tiết sử dụng dịch vụ. (1 điểm)

create trigger ck_thanhtien
on CHITIETTTDV
after update
as
begin
	update ct
	set ct.THANHTIEN = ct.CHISODV * dv.DONGIA
	from inserted i join CHITIETTTDV ct on i.MAPTT = ct.MAPTT and i.MADV = ct.MADV
	join DICHVU dv on i.MADV = dv.MADV
end

-- 3.1. Liệt kê thông tin các cư dân (mã, họ tên) cùng thông tin phòng trọ 
--(mã, tên phòng) mà
-- cư dân đó đã ký hợp đồng với trạng thái hợp đồng ‘Đã hết hạn’ trong năm 2024. (1 điểm)
select cd.MACD, cd.HOTEN, pt.MAPT, pt.TENPT 
from CUDAN cd join HOPDONG hd on cd.MACD = hd.MACD
join PHONGTRO pt on pt.MAPT = hd.MAPT
where year(hd.NGAYKY) = 2024 and hd.TRANGTHAIHD = 'Da het han'

-- 3.2. Tìm các hợp đồng (mã hợp đồng, mã phòng trọ) đã thanh toán các phiếu 
-- tính tiền trong năm 2024 nhưng không sử dụng dịch vụ nào có chỉ số từ 5 
-- trở lên trong những chi tiết của phiếu tính tiền đó. (1 điểm)
select hd.MAHD, hd.MAPT
from HOPDONG hd join PHIEUTINHTIEN p on hd.MAHD = p.MAHD
where year(p.NGAYTINHTIEN) = 2024 and p.TINHTRANGTT = 'Da thanh toan'
	and not exists(
		select 1
		from CHITIETTTDV ct
		where ct.MAPTT = p.MAPTT and ct.CHISODV >= 5
	)

-- 3.3. Tìm thông tin các dịch vụ (mã, tên dịch vụ) 
-- có đơn giá trên 10,000 VNĐ và có trong chi
-- tiết của tất cả các phiếu tính tiền ngày 15/12/2024. (1 điểm)
select dv.MADV, dv.TENDV
from DICHVU dv
where dv.DONGIA > 10000 and not exists(
	select 1
	from PHIEUTINHTIEN p join CHITIETTTDV ct on p.MAPTT = ct.MAPTT
	where p.NGAYTINHTIEN = '2024/12/15'
		and not exists(
			select 1
			from PHIEUTINHTIEN p1
			where p.MAPTT = p1.MAPTT
				and dv.MADV not in(
					select ct1.MADV
					from CHITIETTTDV ct1
					where ct.MAPTT = ct1.MAPTT and ct.MADV = ct1.MADV
				)
		)
) -- SAI

SELECT dv.MADV, dv.TENDV
FROM DICHVU dv
WHERE dv.DONGIA > 10000
  AND NOT EXISTS (
      SELECT 1
      FROM PHIEUTINHTIEN p
      WHERE p.NGAYTINHTIEN = '2024-12-15'
        AND NOT EXISTS (
            SELECT 1
            FROM CHITIETTTDV ct
            WHERE ct.MAPTT = p.MAPTT
              AND ct.MADV = dv.MADV
        )
  ) -- DUNG


-- 3.4. Với mỗi hợp đồng đã hết hạn, hãy cho biết số lượng phiếu tính tiền 
--trong năm 2024 đã được thanh toán. 
--Thông tin hiển thị: Mã hợp đồng, mã cư dân, số lượng. (1 điểm)-- 
select hd.MAHD, hd.MACD, count(*) as SL
from HOPDONG hd join PHIEUTINHTIEN p on hd.MAHD = p.MAHD
where hd.TRANGTHAIHD = 'Da het han' and p.TINHTRANGTT = 'Da thanh toan' and year(p.NGAYTINHTIEN) = 2024
group by hd.MAHD, hd.MACD

-- 3.5. Trong các cư dân có số lần ký hợp đồng ít nhất, 
-- tìm cư dân (mã, họ tên) có tổng số tiền
-- đã thanh toán trong năm 2024 nhiều hơn 5,000,000 VNĐ. (1 điểm)
select cd.MACD, cd.HOTEN
from (
	select top 1 with ties hd.MACD, count(hd.MAHD) as SL
	from HOPDONG hd 
	group by hd.MACD
	order by SL asc
)t join HOPDONG hd1 on t.MACD = hd1.MACD
join PHIEUTINHTIEN p on hd1.MAHD = p.MAHD
join CUDAN cd on cd.MACD = t.MACD
where p.TINHTRANGTT = 'Da thanh toan' and year(p.NGAYTINHTIEN) = 2024
group by cd.MACD, cd.HOTEN
having sum(p.TONGTIENTT) > 5000000