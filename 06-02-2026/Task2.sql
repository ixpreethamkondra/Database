use retail_db;
--INNER JOIN
select c.customer_id,c.name,o.order_id,o.order_number,oi.product_id,p.product_name
from orders o
inner join customers c on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
join  products p on p.product_id=oi.product_id
order by customer_id;


select e.emp_id,e.emp_name,e.dept_id,d.dept_name
from employees e join department d
on e.dept_id=d.dept_id;

select o.order_id,o.order_number,oi.product_id,p.product_name
from orders o
join order_items oi on o.order_id=oi.order_id
join  products p on p.product_id=oi.product_id

select c.customer_id,c.name,o.order_id,o.order_number,oi.product_id,p.product_name
from orders o
join customers c on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
join  products p on p.product_id=oi.product_id
where c.name like '%a%' and o.order_date>'2013-01-13'
order by customer_id;


--LEFT JOIN
select c.customer_id,c.name,o.order_id,o.order_number
from customers c left join orders o
on c.customer_id=o.customer_id;

select c.customer_id,c.name,o.order_id,o.order_number
from customers c left join orders o
on c.customer_id=o.customer_id
where o.order_id is null;

select d.dept_id,d.dept_name,e.emp_id,e.emp_name
from department d join employees e
on d.dept_id=e.dept_id
order by d.dept_id

select d.dept_id,d.dept_name,e.emp_id,e.emp_name
from department d left join employees e
on d.dept_id=e.dept_id
where e.emp_id is null;


select p.product_id,p.product_name,oi.order_id
from products p left join order_items oi
on p.product_id=oi.product_id
where oi.order_id is null;


select p.product_id,p.product_name,oi.order_id
from products p left join order_items oi
on p.product_id=oi.product_id
where p.product_name like '%a%';


--RIGHT JOIN
select o.order_id,o.order_number, c.customer_id,c.name
from customers c right join orders o
on c.customer_id=o.customer_id;

select o.order_id,o.order_number, c.customer_id,c.name
from customers c right join orders o
on c.customer_id=o.customer_id
where c.customer_id is null;


select d.dept_name,count(e.emp_id)
from  employees e right join department d 
on d.dept_id=e.dept_id
group by d.dept_name;

select o.order_id,o.order_number, c.customer_id,c.name
from customers c right join orders o
on c.customer_id=o.customer_id
where c.customer_id <5;

select o.customer_id,c.name,count(o.order_number) as 'count of orders'
from customers c right join orders o
on c.customer_id=o.customer_id
group by o.customer_id,c.name
order by o.customer_id;

--FULL OUTER JOIN
select c.customer_id,c.name,c.email,o.order_number,o.total_amount
from customers c full outer join orders o
on c.customer_id=o.customer_id

select e.emp_id,e.emp_name,d.dept_id,d.dept_name
from  employees e full join department d 
on d.dept_id=e.dept_id

select c.customer_id,c.name,c.email,o.order_number,o.total_amount
from customers c left join orders o
on c.customer_id=o.customer_id
union 
select c.customer_id,c.name,c.email,o.order_number,o.total_amount
from customers c right join orders o
on c.customer_id=o.customer_id



