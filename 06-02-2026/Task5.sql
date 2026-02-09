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

select *
from customers c 
join orders o on c.customer_id=o.customer_id
where o.total_amount>(select avg(total_amount) from orders );


select *
from employees e
join department d on e.dept_id=d.dept_id	
where e.salary>(select avg(e2.salary) from employees e2 where e2.dept_id=e.dept_id);

select *
from employees e
join department d on e.dept_id=d.dept_id
where d.status=1;

select c.customer_id,c.name
from customers c
join orders o on c.customer_id=o.customer_id
where o.order_status=1;

select *
from suppliers s
join products p on s.supplier_id=p.supplier_id
where p.product_id in (select p1.product_id 
		from  products p1 join order_items oi1 on p1.product_id=oi1.product_id
		where oi1.order_id>304);


select * 
from employees e
join department d 
on e.dept_id=d.dept_id and d.dept_id=(select dept_id from  department where dept_name='it') ;

select * 
from employees e
join (select * from  department where dept_name='it') d 
on e.dept_id=d.dept_id ;

select *
from customers c 
where not exists(
	select *
	from orders o
	where o.customer_id=c.customer_id
	);

select *
from customers c 
where exists(
	select *
	from orders o
	where o.customer_id=c.customer_id
	);

select *
from customers c 
join orders o on c.customer_id=o.customer_id
where exists(
	select *
	from orders o1
	where o1.customer_id=c.customer_id and o1.total_amount>5000
	);

select *
from employees e 
join department d on e.dept_id=d.dept_id
where e.salary>  (select avg(salary) from employees);

--Multi-Select JOIN Tasks

select c.customer_id,c.name,c.email,o.order_id,o.order_date,o.order_number,o.total_amount
from customers c 
join orders o on c.customer_id=o.customer_id
where o.total_amount>4000;

select c.name as 'Name',c.email as 'customer mail',o.order_number as 'order num',o.total_amount as 'total amount'
from customers c
join orders o on c.customer_id=o.customer_id;

select *
from customers c
join orders o on c.customer_id=o.customer_id and c.name is not null;

select *,
case 
	when e.salary>=50000 and e.salary<70000 then 'medium salary'
	when e.salary<50000 then 'low salary'
	else 'high salary'
end as salary 
from employees e
join department d on e.dept_id=d.dept_id;

























	..                         