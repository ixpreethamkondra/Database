
--SELF JOIN
select e.emp_id,e.emp_name,m.emp_id,m.emp_name
from employees e left join employees m
on e.manager_id=m.emp_id;


select e.emp_id,m.emp_name as 'manager'
from employees e  join employees m
on e.manager_id=m.emp_id;

select e.emp_id,m.emp_name as 'reports to'
from employees e  left join employees m
on e.manager_id=m.emp_id;

--CROSS JOIN
select *
from customers cross join products;

select e.emp_name,d.dept_name
from employees e cross join department d ;

select *
from employees e cross join department d ;



--MULTI TABLE JOINS
select c.name,o.order_number,oi.product_id,o.total_amount
from orders o
join customers c on o.customer_id=c.customer_id
join order_items oi on o.order_id=oi.order_id;

select o.order_id,o.order_number,oi.product_id,p.product_name
from order_items oi
join products p on p.product_id=oi.product_id
right join orders o on o.order_id=oi.order_id;


select *
from customers c
left join orders o on o.customer_id=c.customer_id
join order_items oi on o.order_id=oi.order_id
join products p  on p.product_id=oi.product_id
left join suppliers s on s.supplier_id=p.supplier_id;


select c.customer_id, c.name,o.order_id,o.order_number,o.order_date,p.product_id,p.price,s.supplier_id,s.supplier_name
from customers c
left join orders o on o.customer_id=c.customer_id
join order_items oi on o.order_id=oi.order_id
join products p  on p.product_id=oi.product_id
left join suppliers s on s.supplier_id=p.supplier_id;