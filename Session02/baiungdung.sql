/*
	1. Tạo bảng Product gồm các thông tin sau:
    - Product_Id - mã sản phẩm - char(5) - khóa chính
    - Product_Name - tên sản phẩm - varchar(100) - not null - unique
    - Price - float - có giá trị >0
    - Descriptions - text - not null
    - Product_status - bit - mặc định là 1
    2. Tạo bảng Order - hóa đơn gồm các thông tin sau
    - Order_id - Mã hóa đơn - int - tự tăng
    - Created - Ngày tạo - date - mặc định là ngày hiện tại
    - Total_amount - float
    - Order_Status: bit mặc định là 0
    3. Tạo bảng Order-Detail - Hóa đơn chi tiết gồm các thông tin sau:
    - Order_id - Mã hóa đơn - khóa ngoại của bảng Order
    - Product_id - mã sản phẩm - khóa ngoại của bảng product
    - (Order_id,Product_id) xác định khóa chính của bảng Order_Detail
    - Price - Giá sản phẩm lúc mua - float
    - Quantity - Số lượng sản phẩm mua - int
    - Amount - Thành tiền - tính tự động bằng công thức: price * quantity
      
*/
create database Demo_02;
use Demo_02;
create table Product(
product_Id char(5) primary key,
product_Name varchar(100) not null unique,
price float check(price>0),
descriptions text not null,
product_status bit default 1
);
create table Orders(
Orders_id int auto_increment primary key,
create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Total_amount float,
Order_Status bit default 0
);
create table Orders_Detail(
Orders_id int,
product_Id char(5),
foreign key(Orders_id) references Orders(Orders_id),
foreign key(product_Id) references Product(product_Id),
Price float,
Quantity int,
Amount float as (price * quantity)
)