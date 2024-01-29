create database flipkart;
use flipkart;

create table account(
acc_id int primary key auto_increment,
name varchar(50) not null,
country varchar(20) not null,
countrycode varchar(20) default (+91),
mobileOrEmail varchar(50) not null,
password varchar(20) not null);

desc account;

insert into account values 
(1,'Vinayaka','India',+91,'9481715069','vinay@gmail.com');
insert into account values
(2,'Sanju','India',+91,'9876543210','sanju@gmail.com');
insert into account values
(3,'Anil','India',+91,'9632587410','anil@gmail.com');

select * from account;
select ('sign-in')as ' 'from dual;
/*login account*/
select *from account 
where mobileOrEmail=9481715069
AND password='vinay123@';

CREATE TABLE account_info(acc_id INT PRIMARY KEY ,
country VARCHAR(20),
name VARCHAR(20) NOT NULL ,
 mobileno BIGINT UNIQUE NOT NULL ,
 pincode INT NOT NULL,
 flat_company VARCHAR(50) NOT NULL ,
 area VARCHAR(50) NOT NULL , 
 town_city VARCHAR(50) NOT NULL,
 FOREIGN KEY (acc_id) REFERENCES account(acc_id));


INSERT INTO account_info VALUES(1,'India','Tejas Gire',8600859005,411046,'Mahavir Kunj A9','Katraj Dattanager Road','Pune');
drop table department;
create table department(
deptid bigint not null,
deptname varchar(80) not null,
description varchar(80) not null);
SELECT * FROM department;
insert into department values
(1001,'Mobile,Computers','All mobile phones, Accessories, Power Banks, Tablet');
SELECT * FROM department WHERE deptname='TV,Appliences,Electronics';
insert into department values
(1002,'Tv,Appliences,Electronics','Speakers,Headphones,Cameras,Accessories');
insert into department values
(1003,'Mens Fashion','Clothing,Watches,Shoes,Sunglases');
insert into department values
(1004,'Home,Kitchen,Pets','Furniture,Decore,Lightning');

select * from department;
select * from department where deptname='TV,Appliences,Electronics';
drop table productType;
create table productType(
productTypeid varchar(50) not null primary key,
dept_id bigint not null,
product_type varchar(50) not null);

insert into productType values(
'Aud10',1002,'Speakers');
insert into productType values(
'Cam007',1002,'Cameras');
insert into productType values(
'Head01',1002,'Headphones');
insert into productType values(
'Lap100',1002,'Laptop');
insert into productType values(
'Tab104',1001,'Tablets');
insert into productType values(
'Wat111',1003,'Watches');

select * from productType;

select * from productType where product_type='Laptop';

create table products(
prodId varchar(20) primary key,
prodtypeid varchar(20) not null,
supplierid varchar(20) unique,
productName varchar(50) not null,
brand varchar(20) not null,
price int not null,
desr varchar(100),
custReview INT CHECK(custReview<=5),
foreign key (prodtypeid) references productType(productTypeid));

insert into products values(
'Vivobook14','Lap100','EAHS1001','Asus Vivobook 14','Asus',
33990,'14(35.56 cm) FHD, Intel
Core i3-1115G4 11th Gen(8GB/256GB 
SSD',3);
insert into products values(
'Vivobook14s','Lap100','AHS1475','Asus Vivobook 14','Asus',
57990,'14(35.56 cm) FHD, Intel
Core i3-1115G4 11th Gen(16GB/512GB 
SSD',4);

insert into products values(
'14s-dy2506TU','Lap100','JADHD01','HP 14S','HP',
35990,'HP 14s 11th Gen Intel Core i3- 8GB RAM/256GB SSD 14
inch(35.6m)IPS Display', 3.9);

insert into products values(
'15s-du3517TU','Lap100','YDBS325','HP 155','HP',52990,'11th Gen
Intel Core i5-8GB RAM/512GB SSD',5);

select * from products;
select ('choose laptop whose rating is 5');
select * from products where custReview>all(select avg(custReview)
from products group by brand);


