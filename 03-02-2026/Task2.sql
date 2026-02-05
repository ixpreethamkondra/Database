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