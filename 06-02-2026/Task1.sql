create database retail_db;
use retail_db;

create table customers(
customer_id int primary key,
name varchar(20) not null,
email varchar(20) unique,
phone_number bigint not null
);
delete from orders where product_id=202;
create table orders(
order_id int primary key,
order_number int not null unique,
customer_id int not null,
order_date date not null,
total_amount decimal not null,
foreign key (customer_id) references customers(customer_id)
);
alter table orders
add order_status bit default 0;

create table department(
dept_id int primary key,
dept_name varchar(20) unique not null
);
alter table department
add status bit default 1;

create table employees(
emp_id int primary key,
emp_name varchar(20) not null,
emp_email varchar(20) unique,
dept_id int not null,
salary decimal(10,2),
manager_id int null,
foreign key (dept_id) references department (dept_id),
foreign key (manager_id) references employees(emp_id)
);

create table products(
product_id int primary key,
product_name varchar(20) not null,
price Decimal(10,2) not null,
supplier_id int
foreign key (supplier_id) references suppliers(supplier_id)
);

create table suppliers
(
supplier_id int primary key,
supplier_name varchar(100) not null,
contact_email varchar(20),
phone bigint,
country varchar(20)
);



create table order_items(
order_id int not null,
product_id int not null,
quantity int not null,
primary key (order_id,product_id),
foreign key(order_id) references orders(order_id) on delete cascade,
foreign key (product_id) references products(product_id) on delete cascade
);




insert into customers(customer_id,name,email,phone_number) values
(10,'Preetham','preetham@gmail.com',9876543210),
(1,'arjun','arjun@gmail.com',9000000001),
(2,'rohit','rohit@gmail.com',9000000002),
(3,'kiran','kiran@gmail.com',9000000003),
(4,'sai','sai@gmail.com',9000000004),
(5,'varun','varun@gmail.com',9000000005),
(6,'nikhil','nikhil@gmail.com',9000000006),
(7,'harsha','harsha@gmail.com',9000000007),
(8,'vamsi','vamsi@gmail.com',9000000008),
(9,'pavan','pavan@gmail.com',9000000009);

insert into department(dept_id,dept_name) values
(15,'research'),
(10,'sales'),
(20,'it'),
(30,'hr'),
(40,'finance'),
(50,'support'),
(60,'logistics'),
(70,'marketing'),
(80,'security'),
(90,'admin');


insert into employees(emp_id,emp_name,emp_email,dept_id,salary,manager_id) values
(110,'raghu','raghu@gmail.com',50,20000,104),
(101,'ramesh','ramesh@gmail.com',20,80000,null),
(102,'suresh','suresh@gmail.com',20,60000,101),
(103,'mahesh','mahesh@gmail.com',10,55000,null),
(104,'naresh','naresh@gmail.com',10,45000,103),
(105,'lokesh','lokesh@gmail.com',30,50000,null),
(106,'ganesh','ganesh@gmail.com',40,70000,null),
(107,'rajesh','rajesh@gmail.com',50,42000,null),
(108,'karthik','karthik@gmail.com',60,48000,null),
(109,'srinu','srinu@gmail.com',70,52000,null);

insert into suppliers(supplier_id,supplier_name,contact_email,phone,country) values
(1,'techsup','techsup@gmail.com',8000000001,'india'),
(2,'globalsup','globalsup@gmail.com',8000000002,'usa'),
(3,'asiacorp','asiacorp@gmail.com',8000000003,'india'),
(4,'eurotech','eurotech@gmail.com',8000000004,'germany'),
(5,'fastsup','fastsup@gmail.com',8000000005,'india'),
(6,'cloudmart','cloudmart@gmail.com',8000000006,'uk'),
(7,'hardwares','hardwares@gmail.com',8000000007,'china'),
(8,'softline','softline@gmail.com',8000000008,'usa'),
(9,'datastore','datastore@gmail.com',8000000009,'india');

insert into orders(order_id,order_number,customer_id,order_date,total_amount) values
(310,10010,9,'2024-01-18',13000.00),
(301,10001,1,'2024-01-10',55500.00),
(302,10002,2,'2024-01-11',1500.00),
(303,10003,3,'2024-01-12',12000.00),
(304,10004,4,'2024-01-13',18000.00),
(305,10005,5,'2024-01-14',3000.00),
(306,10006,6,'2024-01-15',6000.00),
(307,10007,7,'2024-01-16',4000.00),
(308,10008,8,'2024-01-17',2500.00),
(309,10009,9,'2024-01-18',55000.00);




insert into products(product_id,product_name,price,supplier_id) values
(210,'harddrive',4000.1,6),
(201,'laptop',55000.00,1),
(202,'mouse',500.00,1),
(203,'keyboard',1500.00,2),
(204,'monitor',12000.00,3),
(205,'printer',18000.00,4),
(206,'router',3000.00,5),
(207,'ssd',6000.00,6),
(208,'ram',4000.00,7),
(209,'webcam',2500.00,8);

insert into order_items(order_id,product_id,quantity) values
(310,208,1),
(301,201,1),
(301,202,1),
(302,203,1),
(303,204,1),
(304,205,1),
(305,206,1),
(306,207,1),
(307,208,1),
(308,209,1),
(309,201,1);

select * from customers;
select * from department;
select * from employees;
select * from orders;
select * from order_items;
select * from products;
select * from suppliers;

update department 
set status=0
where dept_id in (70,50);

update orders
set order_status=0
where order_id in (307,304);

