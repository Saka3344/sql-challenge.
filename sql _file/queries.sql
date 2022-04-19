select * from "Departments";
select * from "Titles";
select * from "Salaries";
select * from "Employees";
select * from "Dept_Emp";
select * from "Dept_Manager";
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no,e.last_name,e.first_name,e.gender,s.salary
from "Employees" as e, "Salaries" as s
where s.emp_no=e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date 
from "Employees" 
WHERE hire_date between '1/1/1986 ' and '12/31/1986 ' ;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM "Employees" AS e
INNER JOIN "Dept_Manager" AS dm
ON dm.emp_no = e.emp_no
JOIN "Departments" AS d
ON d.dept_no = dm.dept_no;
-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no;
-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM "Employees"
WHERE first_name = 'Hercules' 
AND last_name Like 'B%' ;
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';
-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
or d.dept_name = 'Development';
-- 8.List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS "count of last_name"
FROM "Employees"
GROUP BY last_name
ORDER BY last_name DESC;

