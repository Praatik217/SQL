use hr_db;
--\\ all tables\\--
select * from employees;
select * from departments;
select * from jobs;
select * from job_history;
select * from locations;
select * from regions;
select * from countries;

--1.Write a query to display the last name and hire date of any employee in the same department as SALES. 

select employees.last_name,employees.hire_date,departments.department_name
from employees
Join departments
on employees.department_id=departments.department_id
where departments.department_name = 'Sales';

--2. Create a query to display the employee numbers and last names of all employees who 
--earn more than the average salary. Sort the results in ascending order of salary.

select employee_id,last_name,salary from employees
where salary >(select avg(salary) from employees)
group by employee_id,last_name,salary
order by salary asc;

--3. Write a query that displays the employee numbers and last names of all employees who 
--work in a department with any employee whose last name contains a' u 

SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
);

--4.. Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700);

--5.Display the last name and salary of every employee who reports to FILLMORE. 

SELECT e.last_name AS "Last Name",
       e.salary AS "Salary"
FROM employees e
WHERE e.manager_id = (SELECT employee_id FROM employees WHERE last_name = 'FILLMORE');

--6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 


SELECT e.department_id AS "Department Number",
       e.last_name AS "Last Name",
       e.job_id AS "Job ID"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'OPERATIONS';

--7. Modify the above query to display the employee numbers, last names, and salaries of all 
--employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name

SELECT e.employee_id AS "Employee Number",
       e.last_name AS "Last Name",
       e.salary AS "Salary"
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
  AND e.department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
  );
--8.. Display the names of all employees whose job title is the same as anyone in the sales dept. 

select employees.last_name as Employyes,departments.department_name
from employees
inner join departments
on employees.department_id=departments.department_id
where departments.department_name = 'Sales';


--9.. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
--employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.
 
 select employee_id,salary ,
 case
 when department_id in (10, 30) then '5%'
 when department_id in (20) then '10%'
 when department_id in (40, 50) then '15%'
 else 'No Raise'
 end as Raise_Percentage
 from employees;

 --10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 

SELECT TOP 3 last_name, salary
FROM employees
ORDER BY salary DESC;

--11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column

SELECT first_name AS Employee_Name,
       salary AS "Salary",
       COALESCE(commission_pct, 0) AS Commission
FROM employees;

--12. Display the Managers (name) with top three salaries along with their salaries and department information.
select TOP 3 employees.first_name as Managers,employees.salary,departments.department_name
from employees
Inner Join departments
on employees.department_id=departments.department_id;








