create database ThuchanhSQL_DDL
go

use [ThuchanhSQL_DDL]
Go


create table Khoa
(
    MaKhoa char(4),
	TenKhoa nvarchar(20) not null,
	NgayThanhLap date,
	NoiDungDaotao nvarchar(200),
	GhiChu nvarchar(MAX)
	primary key(MaKhoa)
)


create table Lop
(
	MaLop char(6),
	TenLop nvarchar(20) not null,
	KhoaHoc nvarchar(4),
	GVCN nvarchar(50),
	MaKhoa char(4),
	GhiChu nvarchar(MAX)
	primary key(MaLop)
	foreign key(Makhoa) references Khoa(MaKhoa)
)

create table SinhVien
(
	MaSV char(8),
	HoSV nvarchar(50) not null,
	TenSV nvarchar(20) not null,
	GioiTinh nvarchar(4),
	NgaySinh date,
	QueQuan nvarchar(200),
	DiaChi nvarchar(100),
	MaLop char(6),
	GhiChu nvarchar(MAX)
	primary key(MaSV)
	foreign key(MaLop) references Lop(MaLop)
)

create table MonHoc
(
	MaMH int IDENTITY,
	TenMH nvarchar(20) not null,
	NoiDungMH nvarchar(200),
	MaKhoa char(4),
	SoTinChi int,
	SoTiet int,
	GhiChu nvarchar(MAX)
	primary key(MaMH)
	foreign key (MaKhoa) references Khoa(MaKhoa)
)

create table Hoc
(
	MaSV char(8),
	MaMH int,
	NgayDangKy date,
	NgayThi date,
	DiemTrungBinh decimal(8,2),
	GhiChu nvarchar(MAX)
	primary key(MaSV,MaMH,NgayDangKy)
	foreign key (MaSV) references SinhVien(MaSV)
)

alter table Hoc
add foreign key (MaMH) references MonHoc(MaMH)


--	Viết lệnh SQL để thêm cột CMND (VarChar, 9) vào bảng SinhViên. 
alter table SinhVien
add  CMND varchar(9)
--	Viết lệnh SQL để thêm cột DTDD (VarChar, 10) vào bảng SinhViên.
alter table SinhVien
add DTDD varchar(10)
--	Viết lệnh SQL để sửa thiết kế cột DTDD thành (VarChar, 12) của bảng SinhViên. 

ALTER TABLE SinhVien
alter column DTDD varchar(12)
--	Viết lệnh SQL để xoá cột DTDD của bảng SinhViên. 
alter table SinhVien
drop column DTDD

---	Viết lệnh SQL để tạo index idxTênSV trong bảng SinhViên
create unique index idxTenSV on SinhVien(TenSV)


--.	Viết lệnh SQL để tạo index idxSoCMND (index không trùng dữ liệu) trong bảng SinhViên. 
alter table SinhVien
add CMND char(15)
create unique index idxSoCMND on SinhVien(CMND)
--.	Tạo các query dùng INSERT…VALUES… để thêm thông tin vào các bảng dữ liệu về cá nhân mình, lớp, khoa, môn học, học. Chú ý các thuộc tính not null và thứ tự chạy các câu query này.

insert into SinhVien(MaSV,
	HoSV ,
	TenSV,
	GioiTinh,
	NgaySinh,
	QueQuan,
	DiaChi ,
	MaLop ,
	GhiChu )
	VALUES('12349', N'Le',N'A', N'Nam', '2004/07/23',N'Ca Mau','154/32/54 kinh duong vuong', 'D23'
	,'Sinh Vien nam nhat')

	insert into Khoa
	(MaKhoa ,
	TenKhoa ,
	NgayThanhLap ,
	NoiDungDaotao ,
	GhiChu )
	VALUES('23','CNTT', '1990/12/24', 'Sinh vien IT','Khong co')

	insert into Lop
	(
	MaLop ,
	TenLop ,
	KhoaHoc ,
	GVCN ,
	MaKhoa ,
	GhiChu 
	)
	VALUES('D23', 'Khoa hoc may tinh','CNTT','Vo Thi Hong Tuyet','23','Khong co')

--.	Viết lệnh SQL để xóa index idxTênSV trong bảng SinhViên. 
DROP index idxTenSV
--.	Tạo các query dùng DROP TABLE để xoá các bảng SinhViên, Lớp, Khoa, MônHọc,Học. Chú ý thứ tự thực hiện câu lệnh và các ràng buộc khi xoá bảng. 


