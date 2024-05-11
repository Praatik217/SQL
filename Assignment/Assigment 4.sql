use hr_db;
---\\ all tables \\---
select * from employees;
select * from countries
select * from departments
select * from regions
select * from jobs
select * from job_history
select * from locations

--1.1. Write a query to display the last name, department number, department name for all employees.

select employees.last_name,employees.department_id,departments.department_name
from employees
left join departments
on employees.department_id=departments.department_id;

--2.. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select employees.job_id,departments.location_id
from employees
Join departments
on employees.department_id=departments.department_id
where employees.department_id = 10;

--3.. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select employees.last_name,departments.department_name,departments.location_id,locations.city
from employees
Join departments
on employees.department_id=departments.department_id
join locations
on departments.location_id=locations.location_id
where employees.commission_pct  is not null;

--4.. Display the employee last name and department name of all employees who have an 'a' in their last name

select employees.last_name,departments.department_name
from employees
join departments
on employees.commission_pct=departments.department_id
where employees.last_name like '%a%';

--5.. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
select locations.city,employees.last_name,employees.job_id,departments.department_id,departments.department_name
from employees
Join departments
on employees.department_id=departments.department_id
join locations
on departments.location_id=locations.location_id
where locations.location_id = (select location_id from locations where city = 'Tokyo')

--6. Display the employee last name and employee number along with their manager's last name and manager number.

select e.last_name as employee,e.employee_id,m.last_name as managers_last_name,m.manager_id
from employees as e
join employees as m
on e.employee_id=m.manager_id;

--7.Display the employee last name and employee number along with their manager's last 
--name and manager number (including the employees who have no manager). 

select e.last_name as employee,e.employee_id,m.last_name as managers_last_name,m.manager_id
from employees as e
join employees as m
on e.employee_id=m.manager_id;

--8.. Create a query that displays employees last name,department number,and all the 
--employees who work in the same department as a given employee.

SELECT e.last_name AS Employee_LastName,
       e.department_id AS Department_Number,
       m.last_name AS Colleague_LastName,e.employee_id as Given_employee_id
FROM employees e
JOIN employees m ON e.department_id = m.department_id;

--9. Create a query that displays the name,job,department name,salary,grade for all 
--employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select CONCAT(employees.first_name,' ',employees.last_name) as Employees_name,employees.job_id,employees.salary,departments.department_name,
case 
when employees.salary>=50000 then 'A'
when employees.salary>=30000 then 'B'
else 
'C'
end as 'Grade'
from employees
join departments
on employees.department_id=departments.department_id;

--10.. Display the names and hire date for all employees who were hired before their 
--managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date--
 select CONCAT(e.first_name,' ',e.last_name) as Employee_name,e.hire_date,CONCAT(m.first_name,' ',m.last_name) as Manager_name,m.hire_date
 from employees e
 join employees m
 on e.manager_id=m.manager_id
 where e.hire_date<m.hire_date;



 





 