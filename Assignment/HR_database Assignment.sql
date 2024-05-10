USE hr_db;

---. Display all information in the tables EMP and DEPT. --
select * from employees;
select * from departments;

----Display only the hire date and employee name for each employee. ---
select first_name,last_name,hire_date from employees;

---3.. Display the ename concatenated with the job ID, separated by a comma and space, and 
---name the column Employee and Title --
select CONCAT(first_name,' ',last_name,',',job_id) as Employee_and_Tital from employees;

----4.Display the hire date, name and department number for all clerks. ---

select hire_date,department_id,first_name,last_name from employees;

---5. Create a query to display all the data from the EMP table. Separate each column by a 
--comma. Name the column THE OUTPUT --
select CONCAT(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',commission_pct,',',manager_id,',',department_id) as THE_OUTPUT from employees;

--6. Display the names and salaries of all employees with a salary greater than 2000. --
select  first_name,last_name,salary from employees
where salary >2000;

--7.. Display the names and dates of employees with the column headers "Name" and "Start 
--Date*--
select CONCAT(first_name,' ',last_name) as Name,hire_date as Start_date from employees;

--8. Display the names and hire dates of all employees in the order they were hired. 
select first_name,last_name,hire_date from employees
order by hire_date asc;

--9.. Display the names and salaries of all employees in reverse salary order. 
select CONCAT(first_name,' ',last_name) as Name,salary from employees
order by salary desc;
--10. Display 'ename" and "deptno" who are all earned commission and display salary in 
--revers order----
select CONCAT(first_name,' ',last_name) as ename,department_id,commission_pct,salary from employees
order by salary desc;

--11. Display the last name and job title of all employees who do not have a manager --
select last_name,job_id from employees
where manager_id is null;

--12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000---select last_name,job_id as job,salary from employeeswhere (job_id = 'SA_REP' OR job_id = 'ST_CLERK')AND salary not in(2500,3500,5000)