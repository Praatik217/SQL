use hr_db;
--- 1.Display the maximum, minimum and average salary and commission earned. 
select * from employees;
select max(salary) as Max_salary,
     min(salary) as Min_salary,
	 AVG(salary) as Average_salary,
	 max(commission_pct) as Max_commission,
	 MIN(commission_pct) as Min_commission,
	 AVG(commission_pct) as Average_commission
	 from employees;
----2. Display the department number, total salary payout and total commission payout for 
--each department. 
 select department_id,sum(salary) as Total_salary_payout,sum(commission_pct) as total_commission_payout from employees
 group by department_id;

 --3.Display the department number and number of employees in each department. --

 select department_id as department_number, count(employee_id) as Employees from employees
 group by department_id;


 ---4.Display the department number and total salary of employees in each department. --

  select department_id as department_number, sum(salary) as Total_salary_of_employees from employees
  group by department_id;

  --5. Display the employee's name who doesn't earn a commission. Order the result set 
--without using column name-- ----

select CONCAT(first_name, ' ',last_name) as Employees_name from employees
where commission_pct is null
order by 1;

--6.Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately--


select CONCAT(first_name, ' ',last_name) as Employees_name,department_id,isnull(Null,'No commission') as Commission from employees;


--7. Display the employee's name, salary and commission multiplied by 2. If an Employee 
--doesn't earn the commission, then display as 'No commission. Name the columns 
--appropriately

select CONCAT(first_name, ' ',last_name) as Employees_name,department_id,isnull(Null,'No commission') as Commission,(commission_pct * 2) from employees;

--8. Display the employee's name, department id who have the first name same as another 
---employee in the same department----select employees.first_name,employees.last_name,departments.department_idfrom employeesInner Join departmentson employees.department_id=departments.department_id;--9. Display the sum of salaries of the employees working under each Manager. ---select manager_id,sum(salary) as total_salary from employeesgroup by manager_id;--10. Select the Managers name, the count of employees working under and the department 
--ID of the manager.--

select manager_id,count(employee_id) as Employee_working,department_id from employees
group by manager_id,department_id;

--11. Select the employee name, department id, and the salary. Group the result with the 
---manager name and the employee last name should have second letter 'a! 

select CONCAT(first_name, ' ',last_name) as Employees_name,department_id,salary,manager_id as Manager_name from employees
where substring(last_name,2,1) = 'a'
order by manager_id ;

--12.2) Display the average of sum of the salaries and group the result with the department id. 
 ---Order the result with the department id.--
SELECT department_id, AVG(Sum_Salary) AS Average_Salary
FROM (
    SELECT department_id, SUM(SALARY) AS Sum_Salary
    FROM employees
    GROUP BY department_id
) summed_salaries
GROUP BY department_id
ORDER BY department_id;

--13.Select the maximum salary of each department along with the department id --
select department_id,Max(salary) as maximum_salary from employees
group by department_id;

--14. Display the commission, if not null display 10% of salary, if null display a default value 1--

select commission_pct,isnull(null,1) as commission,(salary *0.1) as adjust_commission from employees;
