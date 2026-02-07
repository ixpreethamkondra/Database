use retail_db;

--JOIN + GROUP BY Tasks
select c.customer_id,c.name ,count(*) as 'order count'
from customers c left join orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.name;

select c.customer_id,c.name ,sum(o.total_amount) as 'total orders amount'
from customers c left join orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.name;

select d.dept_id,d.dept_name,count(e.emp_id) as 'No.of employees'
from employees e  right join department d
on e.dept_id=d.dept_id
group by d.dept_id,d.dept_name
order by count(e.emp_id) desc;

select p.product_id,p.product_name,count(oi.order_id)
from products p left join order_items oi
on p.product_id=oi.product_id
group by p.product_id,p.product_name;


select d.dept_id,d.dept_name,sum(e.salary)
from department d left join employees e
on e.dept_id=d.dept_id
group by d.dept_id,d.dept_name;

--JOIN + HAVING
select c.customer_id,c.name,count(o.order_id) as 'order count'
from customers c left join orders o
on c.customer_id =o.customer_id
group by c.customer_id,c.name
having count(o.order_id)>1;


select  o.dept_id,o.dept_name,count(c.emp_id) as 'emp count'
from employees c right join department o
on c.dept_id =o.dept_id
group by o.dept_id,o.dept_name
having count(c.emp_id)>1;

select c.customer_id,c.name,sum(o.total_amount) as 'amount spent'
from customers c join orders o
on c.customer_id =o.customer_id
group by c.customer_id,c.name
having sum(o.total_amount)>5000;

--JOIN + COUNT Tasks

select c.customer_id,c.name,count(o.order_id) as 'order count'
from customers c left join orders o
on c.customer_id =o.customer_id
group by c.customer_id,c.name;

select  o.dept_id,o.dept_name,count(c.emp_id) as 'emp count'
from employees c right join department o
on c.dept_id =o.dept_id
group by o.dept_id,o.dept_name;

select s.country,count(o.order_id) as'count of orders'
from products p
right join suppliers s on s.supplier_id=p.supplier_id
join order_items oi on oi.product_id=p.product_id
join orders o on o.order_id=oi.order_id
group by s.country;

--JOIN + WHERE Tasks

select *
from orders o
left join customers c on c.customer_id=o.customer_id
where o.order_date>'2024-01-13';

select *
from department d
left join employees e on e.dept_id=d.dept_id
where d.dept_id=20;

select *
from department d
left join employees e on e.dept_id=d.dept_id
where manager_id is null;

select p.product_id,p.product_name,o.order_id,o.order_number,o.total_amount
from products p
join order_items oi on oi.product_id=p.product_id
join orders o on o.order_id=oi.order_id
where o.total_amount>5000;

--JOIN + LIKE Tasks
select *
from customers c
join orders o on c.customer_id=o.customer_id
where c.name like 'a%';

select *
from employees e
join department d on e.dept_id=d.dept_id
where e.emp_name like '_a%';

select *
from products p
left join order_items oi on p.product_id=oi.product_id
where p.product_name like '%c%';

--JOIN + Constraints Tasks
insert into order_items values(234,567,2); --ERROR because its fk

insert into orders (order_id, customer_id,total_amount,order_number)
values(302, 999,6000,999); 

select c.customer_id,c.name,c.email,o.order_number,o.total_amount
from customers c full outer join orders o
on c.customer_id=o.customer_id

insert into orders (order_id, customer_id,total_amount,order_number,order_date)
values(302, 999,6000,999,'2026-09-17'); 






