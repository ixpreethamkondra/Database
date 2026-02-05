--Task1
use college_db;
Create table students(
student_id bigint primary key,
names varchar(50),
email varchar(100) unique,
age int,
join_date date,
active_flag Bit DEFAULT 1
);
 
Create table courses(
course_id int primary key,
course_name varchar(50) not null,
fees decimal(10,2)
);
create table enrollments(
enroll_id bigint primary key,
student_id bigint,
course_id int,
enroll_timestamp TIMESTAMP 
);

--task2
Insert into students values (1001,'Dhanush','dhanush@gmail.com',21,'2026-02-02',1);
Insert into students values (1002,'sujith','sujity@gmail.com',10,'2026-02-02',0);
Insert into students values (1003,'srishanth','sri@gmail.com',29,'2026-02-02',1);
Insert into students values (1004,'rithra','mith@gmail.com',91,'2026-02-02',1);
Insert into students values (1005,'Ramu','ramu@gmail.com',100,'2026-02-02',1);
Insert into students values (1006,'Ravi','ravi@gmail.com',88,'2026-02-02',0);
Insert into students values (1007,'Raju','raju@gmail.com',74,'2026-02-02',0);
Insert into students values (1008,'Rakesh','rakesh@gmail.com',19,'2026-02-02',1);
Insert into students values (1009,'Teja','teja@gmail.com',30,'2026-02-02',0);
Insert into students values (1010,'Rahul','rahul@gmail.com',42,'2026-02-02',0);
 
 
 
Insert into courses values (100,'AIML',1632.45);
Insert into courses values (101,'CSE',1632.45);
Insert into courses values (102,'IT',1632.45);
Insert into courses values (103,'EEE',1632.45);
Insert into courses values (104,'ECE',1632.45);
 
 
select * from courses;
 
ALTER TABLE enrollments
DROP COLUMN enroll_timestamp;
 
 
ALTER TABLE enrollments
ADD enroll_timestamp DATETIME2 DEFAULT SYSDATETIME();
 
 
INSERT INTO enrollments (enroll_id, student_id, course_id) VALUES (10001, 1001, 100);
INSERT INTO enrollments VALUES (10002, 1002, 101, SYSDATETIME());
INSERT INTO enrollments VALUES (10003, 1003, 102, SYSDATETIME());
INSERT INTO enrollments VALUES (10004, 1004, 103, SYSDATETIME());
INSERT INTO enrollments VALUES (10005, 1005, 104, SYSDATETIME());
INSERT INTO enrollments VALUES (10006, 1006, 100, SYSDATETIME());
INSERT INTO enrollments VALUES (10007, 1007, 101, SYSDATETIME());
INSERT INTO enrollments VALUES (10008, 1008, 102, SYSDATETIME());
INSERT INTO enrollments VALUES (10009, 1009, 103, SYSDATETIME());
INSERT INTO enrollments VALUES (10010, 1010, 104, SYSDATETIME());
INSERT INTO enrollments VALUES (10011, 1001, 100, SYSDATETIME());
INSERT INTO enrollments VALUES (10012, 1002, 101, SYSDATETIME());
INSERT INTO enrollments VALUES (10013, 1003, 102, SYSDATETIME());
INSERT INTO enrollments VALUES (10014, 1004, 103, SYSDATETIME());
INSERT INTO enrollments VALUES (10015, 1005, 104, SYSDATETIME());
 
select * from enrollments;

 --task3
Insert into students values (1011,'Shiva','shiva@gmail.com',64,'2026-02-02',1);
Insert into students values (1012,'Laxman','laxman@gmail.com',55,'2026-02-02',1);
Insert into students values (1013,'Hanuma','hanuma@gmail.com',33,'2026-02-02',0);
 
Insert into courses values (105,'Mech',1932.45);
 
Insert INTO enrollments VALUES (10016, 1011, 104, SYSDATETIME());
 
select * from students;
 
select names,email from students;
 
select * from students order by age desc;
 
SELECT TOP 5 * FROM students ORDER BY join_date DESC;
 
select distinct age from students;
 
select distinct course_name from courses;
 
update students set age=27 where student_id=1001;
 
update students set active_flag='false' where student_id in (1001,1003);
 
update courses set fees+=0.1*fees;
 
update enrollments set enroll_timestamp='2027-02-02 17:43:30.053' where course_id=100;
 
 
delete  from students where student_id=1001;
 
delete from courses where fees<1700;
 
delete from enrollments where enroll_timestamp>'2026-03-01';
 
alter table students alter column names varchar(60);
 
EXEC sp_rename 'students.join_date', 'registration_date', 'COLUMN';
 
alter table students add  phone_number varchar(15);
 
 
--<TASK4>
 
select * from students where age>21;
 
select * from students where active_flag='true';
 
select * from courses where fees between 1000 and 5000;
 
select * from students where age in (20,22,25);
 
select * from students where age>20 and active_flag='true';
 
select * from students where age<20 and active_flag='false';
 
select * from courses where fees>2000 and course_name like '%M%';
 
select * from students where email like '%gmail.com';
 
select * from courses where course_name like 'data%';
 
select * from students where names like '%new%';
 
Insert into students values (1017,'nikhil','nikhil@gmail.com',NULL ,'2026-01-20',1,NULL);
 
select * from students where age is NULL;
 
select * from students where age is not NULL;
 
--<TASK-5>
 
SELECT count(*) from students;
 
select count(*) from students where active_flag=1;
 
select sum(fees) from courses;
 
select avg(fees) from courses;
 
select fees from courses group by fees having fees>2000;
 
select min(age) from students;
 
select max(fees) from courses;
 
select max(registration_date) from students;
 
select min(registration_date) from students;
 
select active_flag,count(*) from students group by active_flag;
 
select age,count(*) from students group by age;
 
select fees,count(*) from courses group by fees;
 
select course_id from enrollments group by course_id having count(*)>3;
 
select age from students group by age having age>avg(age);
 
select course_id,count(*) from enrollments group by course_id having count(*)>2;
 
--<Task -6>
 
select * from students where age>20 order by age desc;
 
select count(*) from students where names like '%a%';
 
select course_id,course_name from courses where fees between 1000 and 5000 order by fees;
 
select * from students where active_flag='true' and age is not null;
 
select student_id,count(course_id) from enrollments group by student_id having count(course_id)>1;