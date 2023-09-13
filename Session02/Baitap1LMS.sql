use Baitap1;
create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table VATTU(
MaVTU char(4) primary key ,
TenVTu varchar(50) not null unique
);
create table CTPHIEUXUAT (
SoPX int,
MaVTU char(4),
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU ) references VATTU(MaVTU ),
DGXuat bit,
SLXuat int,
primary key (SoPX,MaVTU)
);
create table PHIEUNHAP(
SoPN int primary key auto_increment ,
NgayNhap date 
);
create table CTPHIEUNHAP(
SoPN int,
MaVTU char(4),
foreign key (SoPN) references PHIEUNHAP(SoPN),
foreign key (MaVTU ) references VATTU(MaVTU ),
DGNhap bit,
SLNhap int,
primary key (SoPN,MaVTU)
);
create table DONDH(
SoDH int primary key auto_increment unique,
NgayDH date 
);
create table CTDonDatHang(
MaVTU char(4),
SoDH int,
foreign key (MaVTU) references VATTU(MaVTU ),
foreign key (SoDH) references DONDH(SoDH),
primary key (MaVTU,SoDH)
);
create table NHACC(
MaNCC char(4) primary key unique,
TenNCC varchar(100) not null,
DiaChi varchar(200) not null,
SDT char(10)
);