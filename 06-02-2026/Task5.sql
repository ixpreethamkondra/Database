use retail_db;

--JOIN + Subquery Tasks (IN / NOT IN / EXISTS / NOT EXISTS)

select *
from customers c
join orders o on c.customer_id=o.customer_id
where o.customer_id in(6,7,9,4);

select *
from customers c
join orders o on c.customer_id=o.customer_id
where o.customer_id not in(6,7,9,4);

select *
from  products p 
left join order_items oi on oi.product_id=p.product_id
where oi.product_id is null;

select *
from employees e
left join department d on e.dept_id=d.dept_id
where d.dept_id is null; --empty because all employees in their dept

