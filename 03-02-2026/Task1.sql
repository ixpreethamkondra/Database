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