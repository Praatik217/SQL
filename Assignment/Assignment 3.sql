use hr_db;

--1.1. Write a query that displays the employee's last names only from the string's 2-5th 
 --position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.--

 select SUBSTRING(UPPER(last_name),2,5) as Formatted_last_name from employees;

 --2 Write a query that displays the employee's first name and last name along with a " in 
--between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
select CONCAT(first_name,'-',last_name) as Full_name,MONTH(hire_date) as Joining_Month from employees;

--3.. Write a query to display the employee's last name and if half of the salary is greater than 
--ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 

 SELECT
    last_name AS Employee_Last_Name,
    CASE
        WHEN salary * 0.5 > 10000 THEN ROUND(salary * 1.1 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
    END AS Adjusted_Salary
FROM employees;

---\\ all tables \\---
select * from employees;
select * from countries
select * from departments
select * from regions
select * from jobs
select * from job_history
select * from locations

--4.. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
--department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! --

SELECT
    SUBSTRING(employee_id,1, 2), '00E' AS Employee_ID,
    UPPER(department_id      ) AS Department_ID,
    salary AS Salary,
    REPLACE(UPPER(CASE WHEN manager_id LIKE '%z%' THEN '$' ELSE manager_id END), 'Z', '$') AS Manager_Name
FROM employees;

--5. Write a query that displays the employee's last names with the first letter capitalized and 
--all other letters lowercase, and the length of the names, for all employees whose name 
--starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 

SELECT
    upper(last_name) AS Formatted_Last_Name,
    LEN(last_name) AS Name_Length
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

--6.. Create a query to display the last name and salary for all employees. Format the salary to 
--be 15 characters long, left-padded with $. Label the column SALARY 

SELECT
    last_name AS Last_Name,
    RIGHT('$' + REPLICATE('0', 15 - LEN(CAST(salary AS VARCHAR))), 15) AS Salary
FROM employees;

--7.Display the employee's name if it is a palindrome --
select first_name from employees
where first_name = REVERSE(first_name)
group by first_name
--8.Display First names of all employees with initcaps. --
select upper(first_name) as First_name from employees;

--9.. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. --

SELECT SUBSTRING(street_address, CHARINDEX(' ',street_address)+1,CHARINDEX(' ',street_address,charindex(' ',street_address)+1)-charindex(' ',street_address)-1) as ExtractedWord
FROM locations;

--10.. Extract first letter from First Name column and append it with the Last Name. Also add 
--"@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name. 

select LOWER(substring(first_name, 1, 1) + last_name + '@systechusa.com') as EmailAddress,first_name from employees

--11.Display the names and job titles of all employees with the same job as Trenna. ---

select employees.first_name as Employees_name,jobs.job_title
from employees
LEFT JOIN jobs
on employees.job_id=jobs.job_id
where employees.job_id = 'ST_CLEARK'
group by employees.first_name,jobs.job_title

--12. Display the names and department name of all employees working in the same city as Trenna. 

select employees.first_name,departments.department_name,locations.city
from employees
Join departments
on employees.department_id=departments.department_id
join locations
on departments.location_id=locations.location_id
where employees.first_name = 'Lex';

--13. Display the name of the employee whose salary is the lowest. 
 select first_name,salary from employees
 where salary = (select min(salary) as Lowest from employees);

 --14. Display the names of all employees except the lowest paid.
 select first_name,salary from employees
 where salary > (select Min(salary) from employees);



