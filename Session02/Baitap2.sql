create database Baitap2;
use Baitap2;
create table Customer(
cID int primary key auto_increment,
cName varchar(100) not null,
cAge int not null
);
create table Orders (
oID int primary key auto_increment,
cID int,
foreign key(cID) references Customer(cID),
oDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
oTotalPrice float
);
create table Product(
pID int primary key auto_increment,
pName varchar(100) not null,
pPrice float
);
create table Orderdetail(
oID int,
pID int,
foreign key(oID) references Orders(oID),
foreign key(pID) references Product(pID),
odQTY int,
primary key (oID,pID)
)