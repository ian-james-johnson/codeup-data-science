

#1 write a query that finds all employes (emp_no), department number, start date, end date, and a new column 'is current employer'
# need emp_no, dept_no, start_date, end_date
# need tables: dept_emp
SELECT emp_no, dept_no, from_date, to_date,
	IF (to_date = '9999-01-01', 'is_currently_employed', 'not_currently_employed') AS currently_employed
From dept_emp
;

#2 write a query that returns all employees names (previous and current) and a new column 'alpha_group' that returns 'a-h', 'i-q', 'r-z' depending on last name
# need first_name, last_name
# need employees table
SELECT first_name, last_name,
	CASE
	WHEN lower(SUBSTR(last_name, 1, 1)) IN ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'a-h'
	WHEN lower(SUBSTR(last_name, 1, 1)) IN ('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'i-q'
	WHEN lower(SUBSTR(last_name, 1, 1)) IN ('r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z') THEN 'r-z'
	ELSE 'ERROR'
	END AS alpha_group
FROM employees;

#3 how many employees (previous or current) were born in each decade
SELECT MIN(birth_date), MAX(birth_date)
FROM employees;
# need decades from 1950's to 1960's
SELECT count(*),
		CASE
		WHEN ( SUBSTR(birth_date,1 ,4) BETWEEN 1950 AND 1959) THEN "1950's"
		WHEN ( SUBSTR(birth_date,1 ,4) BETWEEN 1960 AND 1969) THEN "1960's"
		ELSE 'ERROR'
		END AS decade_born
FROM employees
GROUP by decade_born
;
		
#bonus1 what is the current average salary for each of the current department groups
#	R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service

#CONCAT('Research', 'Development') AS 'R&D', CONCAT('Sales', 'Marketing') AS 'Sales & Marketing', CONCAT('Production',
#'Quality Management') AS 'PROD & QM', CONCAT('Finance', 'Human Resources') AS 'Finance & HR', 'Customer Service'
SELECT *,
		CASE
		WHEN (dept_name = 'Research' OR 'Development') THEN 'R&D'
		WHEN (dept_name = 'Sales' OR 'Marketing') THEN 'Sales & Marketing'
		WHEN (dept_name = 'Production' OR 'Quality Management') THEN 'Prod and QM'
		WHEN (dept_name = 'Finance' OR 'Human Resources') THEN 'Finance & HR'
		WHEN dept_name = 'Customer Service' THEN 'Customer Service'
		#ELSE 'WARNING! Missing Department'
		END AS department_group
FROM departments
;

SELECT 
		CASE
		WHEN dept_name = 'Research' THEN 'R&D'
		WHEN dept_name = 'Development' THEN 'R&D'
		WHEN dept_name = 'Sales' THEN 'Sales & Marketing'
		WHEN dept_name = 'Marketing' THEN 'Sales & Marketing'
		WHEN dept_name = 'Production' THEN 'Prod and QM'
		WHEN dept_name = 'Quality Management' THEN 'Prod and QM'
		WHEN dept_name = 'Finance' THEN 'Finance & HR'
		WHEN dept_name = 'Human Resources' THEN 'Finance & HR'
		WHEN dept_name = 'Customer Service' THEN 'Customer Service'
		#ELSE 'WARNING! Missing Department'
		END AS department_group
FROM departments

#JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
#JOIN salaries ON dept_no.emp_no = salaries.emp_no

GROUP BY department_group
;


SELECT *
FROM departments;


