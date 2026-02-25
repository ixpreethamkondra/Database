create database citycom_db;
use citycom_db;

create table parent_company(
pc_id int primary key,
pname varchar(20) not null,
reg_no int unique not null,
risk_score int default 0,
created_at datetime2 not null default sysdatetime()
);



create table child_company(
cc_id int  primary key,
pc_id int ,
cname varchar(20) not null,
reg_no int unique,
risk_score int default 0,
created_at datetime2 not null default sysdatetime()
foreign key(pc_id) references parent_company(pc_id)
);

create table outlets(
outlet_id int primary key,
cc_id int not null,
outlet_name varchar(20) not null ,
city varchar(20) not null,
created_at datetime2 default sysdatetime(),
status varchar(20)  check(status in('active','expired','suspended')),
foreign key (cc_id) references child_company(cc_id) 
);

create table name_change (
    change_id int  primary key,
    cc_id int not null,
    old_name varchar(50) not null,
    new_name varchar(50) not null,
    changed_at datetime2 default sysdatetime(),
    foreign key(cc_id) references child_company(cc_id)
);


create table licenses (
    license_id int  primary key,
    outlet_id int unique not null,
    issue_date datetime2 not null default sysdatetime(),
    expiry_date datetime2 not null  ,
    status varchar(50) default 'active',
    foreign key (outlet_id) references outlets(outlet_id),
    check (expiry_date > issue_date),
	check(status in('active','expired','suspended'))
);

create table license_payments (
    payment_id int  primary key,
	payment_no bigint not null unique,
    outlet_id int not null,
    payment_date date not null,
    amount decimal(10,2) not null,
	used bit default 0,
    foreign key (outlet_id) references outlets(outlet_id)
);

alter table licenses
add constraint fk_license_payment
foreign key (payment_no)
references license_payments(payment_no);

 alter table license_payments
add license_number varchar(100);

alter table licenses
add constraint uq_licensepayment unique (payment_no);

create table inspections (
    inspection_id int primary key,
    outlet_id int not null,
    inspection_date datetime2 not null default sysdatetime(),
    result bit default 1,  
    foreign key (outlet_id) references outlets(outlet_id)
);

create table violations (
    violation_id int  primary key,
    inspection_id int not null,
	level varchar(20),
    penalty_amount decimal(10,2),
    created_at datetime2 default sysdatetime(),
    foreign key (inspection_id) references inspections(inspection_id),
    check (level in ('low','medium','high'))
);

create table stop_work (
    order_id int  primary key,
    outlet_id int not null,
    created_at datetime2 default sysdatetime(),
    is_resolved bit default 0,
    foreign key (outlet_id)
        references outlets(outlet_id)
);







insert into parent_company (pc_id, pname, reg_no, risk_score, created_at) values
(1, 'alpha', 101, 10, '2022-01-01 10:00:00'),
(2, 'beta', 102, 0, '2022-02-01 11:00:00'),
(3, 'gamma', 103, 25, '2021-05-15 09:30:00'),
(4, 'delta', 104, 5, '2023-03-10 14:20:00'),
(5, 'omega', 105, 0, '2023-06-12 08:45:00'),
(6, 'sunrise', 106, 18, '2021-09-25 16:10:00'),
(7, 'nova', 107, 7, '2022-08-01 09:00:00'),
(8, 'zenith', 108, 0, '2023-01-15 10:30:00'),
(9, 'matrix', 109, 14, '2021-12-20 08:20:00'),
(10, 'vertex', 110, 3, '2023-04-05 11:45:00');



insert into child_company (cc_id, pc_id, cname, reg_no, risk_score, created_at) values
(11, 4, 'delta trading', 211, 0, '2024-01-01 10:00:00'),
(1, 1, 'alpha foods', 201, 5, '2022-01-05 09:00:00'),
(2, 1, 'alpha retail', 202, 2, '2022-01-10 10:30:00'),
(3, 2, 'beta trading', 203, 0, '2022-02-10 11:15:00'),
(4, 3, 'gamma logistics', 204, 12, '2021-06-01 12:00:00'),
(5, 5, 'omega services', 205, 3, '2023-06-20 15:45:00'),
(6, 7, 'nova foods', 206, 4, '2022-08-05 10:00:00'),
(7, 7, 'nova retail', 207, 1, '2022-08-10 11:00:00'),
(8, 8, 'zenith trading', 208, 0, '2023-01-20 12:30:00'),
(9, 9, 'matrix logistics', 209, 9, '2022-01-05 09:15:00'),
(10, 9, 'matrix exports', 210, 6, '2022-02-10 10:10:00');

insert into name_change (change_id, cc_id, old_name, new_name, changed_at) values
(1, 1, 'af foods', 'alpha foods pvt', '2022-02-01 09:00:00'),
(2, 1, 'alpha foods pvt', 'alpha foods', '2023-01-10 10:30:00'),
(3, 3, 'beta traders', 'beta trading', '2022-05-15 11:15:00'),
(4, 5, 'omega solutions services', 'omega services', '2023-07-01 14:00:00'),
(5, 9, 'matrix transport', 'matrix logistics', '2022-03-20 16:45:00');

delete from outlets where outlet_id in (6,7,8,9,10);

insert into outlets (outlet_id, cc_id, outlet_name, city, created_at, status) values
(6, 2, 'ar outlet2', 'adilabad', '2023-01-10 09:00:00', 'active'),
(7, 2, 'ar outlet3', 'mancherial', '2023-02-12 10:30:00', 'active'),
(8, 3, 'bt outlet2', 'nalgonda', '2023-03-15 11:00:00', 'active'),
(9, 4, 'gl outlet1', 'medak', '2023-04-20 12:00:00', 'expired'),
(10, 6, 'nf outlet1', 'siddipet', '2023-05-05 13:00:00', 'active'),
(11, 7, 'nr outlet1', 'mahbubnagar', '2023-06-10 14:00:00', 'active'),
(12, 8, 'zt outlet1', 'kamareddy', '2023-07-15 15:00:00', 'suspended'),
(13, 9, 'ml outlet2', 'nagarkurnool', '2023-08-01 10:00:00', 'active'),
(14, 10, 'me outlet1', 'wanaparthy', '2023-09-01 11:00:00', 'active'),
(1, 1, 'af outlet1', 'hyderabad', '2022-02-01 10:00:00', 'active'),
(2, 1, 'af outlet2', 'warangal', '2022-03-01 11:00:00', 'expired'),
(3, 2, 'ar outlet1', 'nizamabad', '2022-04-01 09:30:00', 'suspended'),
(4, 3, 'bt outlet1', 'karimnagar', '2022-05-01 08:45:00', 'active'),
(5, 5, 'os outlet1', 'khammam', '2023-07-01 12:15:00', 'active');



insert into license_payments (payment_id, payment_no, outlet_id, payment_date, amount, used) values
(10, 1010, 6, '2024-01-10', 11000, 1),
(11, 1011, 6, '2025-01-10', 11000, 0),  
(12, 1012, 7, '2024-02-12', 9500, 1),
(13, 1013, 8, '2024-03-15', 9000, 1),
(14, 1014, 8, '2025-03-15', 9000, 0),  
(15, 1015, 9, '2023-04-20', 8000, 1),
(16, 1016, 10, '2024-05-05', 12000, 1),
(17, 1017, 11, '2024-06-10', 13000, 1),
(18, 1018, 12, '2023-07-15', 10000, 1),
(19, 1019, 13, '2024-08-01', 14000, 1),
(20, 1020, 14, '2024-09-01', 15000, 1),--
(1, 1001, 1, '2024-01-01', 10000, 1),
(2, 1002, 1, '2024-12-01', 10000, 0),
(3, 1003, 1, '2025-12-01', 10000, 0),
(4, 1004, 2, '2024-02-01', 12000, 1),
(5, 1005, 3, '2024-03-01', 9000, 1),
(6, 1006, 3, '2025-03-01', 9000, 0),
(7, 1007, 4, '2024-04-01', 8000, 1),
(8, 1008, 5, '2024-05-01', 15000, 1),
(9, 1009, 5, '2025-05-01', 15000, 0);

insert into licenses (license_id, outlet_id, issue_date, expiry_date, status, payment_no) values
(6, 6, '2024-01-10 09:00:00', '2025-01-10 09:00:00', 'active', 1010),
(7, 7, '2024-02-12 10:30:00', '2025-02-12 10:30:00', 'active', 1012),
(8, 8, '2024-03-15 11:00:00', '2025-03-15 11:00:00', 'active', 1013),
(9, 9, '2023-04-20 12:00:00', '2024-04-20 12:00:00', 'expired', 1015),
(10, 10, '2024-05-05 13:00:00', '2025-05-05 13:00:00', 'active', 1016),
(11, 11, '2024-06-10 14:00:00', '2025-06-10 14:00:00', 'active', 1017),
(12, 12, '2023-07-15 15:00:00', '2024-07-15 15:00:00', 'suspended', 1018),
(13, 13, '2024-08-01 10:00:00', '2025-08-01 10:00:00', 'active', 1019),
(14, 14, '2024-09-01 11:00:00', '2025-09-01 11:00:00', 'active', 1020),--
(1, 1, '2024-01-01 10:00:00', '2025-01-01 10:00:00', 'active', 1001),
(2, 2, '2023-02-01 11:00:00', '2024-02-01 11:00:00', 'expired', 1004),
(3, 3, '2024-03-01 09:30:00', '2025-03-01 09:30:00', 'suspended', 1005),
(4, 4, '2024-04-01 08:45:00', '2025-04-01 08:45:00', 'active', 1007),
(5, 5, '2025-05-01 12:15:00', '2026-05-01 12:15:00', 'active', 1008);

insert into inspections (inspection_id, outlet_id, inspection_date, result) values
(6, 6, '2024-06-10 09:00:00', 1),
(7, 6, '2024-12-01 09:00:00', 0),
(8, 7, '2024-06-12 10:00:00', 0),
(9, 8, '2024-06-15 11:00:00', 0),
(10, 9, '2024-05-01 12:00:00', 1),
(11, 10, '2024-07-01 13:00:00', 1),
(12, 11, '2024-07-10 14:00:00', 0),
(13, 12, '2024-03-01 15:00:00', 0),
(14, 13, '2024-09-01 16:00:00', 1),
(15, 14, '2024-10-01 17:00:00', 1),--
(1, 1, '2024-06-01 10:00:00', 1),
(2, 2, '2024-03-01 11:00:00', 1),
(3, 3, '2024-06-15 09:30:00', 0),
(4, 4, '2024-07-01 08:45:00', 1),
(5, 5, '2025-06-01 12:15:00', 1);

insert into violations (violation_id, inspection_id, level, penalty_amount, created_at) values
(2, 7, 'medium', 15000, '2024-12-01 09:30:00'),
(3, 8, 'low', 5000, '2024-06-12 10:30:00'),
(4, 9, 'high', 30000, '2024-06-15 11:30:00'),
(5, 12, 'medium', 18000, '2024-07-10 14:30:00'),
(6, 13, 'high', 35000, '2024-03-01 15:30:00'),--
(1, 3, 'high', 25000.00, '2024-06-15 10:00:00');

insert into stop_work (order_id, outlet_id, created_at, is_resolved) values
(2, 8, '2024-06-16 09:00:00', 0),
(3, 12, '2024-03-02 10:00:00', 0),--
(1, 3, '2024-06-16 09:00:00', 0);



select * from parent_company;
select * from child_company;
select * from outlets;
select * from name_change;
select * from licenses;
select * from license_payments;
select * from inspections;
select * from violations;
select * from stop_work;

--Show all companies that do not have any business outlets registered. 
select c.cc_id,c.cname,c.reg_no,c.risk_score
from child_company c
left join outlets o on c.cc_id=o.cc_id
where o.cc_id is null;


--	Find business outlets that do not have any active license. 
select  o.outlet_id,o.outlet_id,o.cc_id,o.city,l.payment_no,l.status
from outlets o
join licenses l on o.outlet_id=l.outlet_id
where l.status!='active';


--Show companies that have more than 3 violations recorded. 
select *
from child_company c
join outlets o on c.cc_id=o.cc_id
join inspections i on i.outlet_id=o.outlet_id
join violations v on v.inspection_id=i.inspection_id;


--Find inspections that were conducted but no violation was recorded
select o.outlet_id,o.cc_id,o.outlet_name,o.city,i.inspection_id,i.result,v.violation_id,v.level
from outlets o
join inspections i on i.outlet_id=o.outlet_id
left join violations v on i.inspection_id=v.inspection_id
where v.inspection_id is null;


--Failed inspection increases company risk score. 
update child_company
set risk_score=risk_score+5 
where cc_id in (
select c.cc_id
from parent_company p
join child_company c on p.pc_id=c.pc_id
join outlets o on o.cc_id=c.cc_id
join inspections i on i.outlet_id=o.outlet_id
where i.result=0);


--Risk score must affect parent company. 
update parent_company
set risk_score = risk_score + 2
where pc_id in (
    select distinct c.pc_id
    from child_company c
    join outlets o on o.cc_id = c.cc_id
    join inspections i on i.outlet_id = o.outlet_id
    where i.result = 0
);


--Business name changes must be logged. 
select * 
from child_company c
join name_change n on c.cc_id=n.cc_id
order by c.cc_id;


