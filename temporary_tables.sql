
#1 Create a temporary table that contains first name, last name, dept_name for currently working employees
USE germain_1484;	#this is the database in which I can create temporary tables

#creating a temporary table
CREATE TEMPORARY TABLE employee_names_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
;

USE germain_1484;
SELECT *
FROM employees;
#get error that table doesn't exist because now I am in a different database where I can create temporary tables
CREATE TEMPORARY TABLE employee_names_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
;
#now I just created a temporary table
SELECT *
FROM employee_names_departments
;
#this brings up the temporary table that I just created

#1a add a column called full_name
ALTER TABLE employee_names_departments ADD full_name VARCHAR(100);
#this added an empty column to the table

#1b fill in the new column with full names
UPDATE employee_names_departments SET full_name = CONCAT(first_name, ' ', last_name);
#this fills in the new column that I just added

#1c remove the first and last name columns
ALTER TABLE employee_names_departments DROP COLUMN first_name;
ALTER TABLE employee_names_departments DROP COLUMN last_name;
#the first and last name columns have been removed from the table

#1d another way to get this table is to select from joined employees, dept_emp, and dept_name tables

#2 create a temporary table based on the payment table from the sakila database

#this creates the payment table
USE germain_1484;
CREATE TEMPORARY TABLE sakila_payments AS
SELECT *
FROM sakila.payment
;

#change the 'amount' column to cents instead of dollars
ALTER TABLE sakila_payments  MODIFY COLUMN amount FLOAT(10, 2);
#this changes the type to add more decimals, because the default is too small to hold our values after being multiplied by 100
UPDATE sakila_payments SET amount = (amount * 100);
#this converts dollars to cents

SELECT *
FROM sakila_payments
;

#3 compare the current average pay in each department to the historical pay for the company
#	use z scores to compare salaries
USE germain_1484;

CREATE TEMPORARY TABLE emp_sal_dept AS
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, employees.salaries.salary, employees.salaries.to_date,
		employees.departments.dept_name
FROM employees.employees
JOIN employees.salaries USING(emp_no)
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.salaries.to_date >= CURRENT_DATE;
#this creates a temporary table holding employee names, salaries, and departments
SELECT *
FROM emp_sal_dept;

CREATE TABLE historic_company AS
SELECT AVG(salary) AS historic_company_avg, STDDEV(salary) AS historic_company_stddev
FROM emp_sal_dept;
#this creates historic scalar avg and stddev for all company and all time, to be used as constants for later calculations
SELECT *
FROM historic_company;


CREATE TEMPORARY TABLE dept_values AS
SELECT dept_name, AVG(salary) AS avg_dept_salary, STDDEV(salary) AS stddev_dept_salary
FROM emp_sal_dept
WHERE to_date >= CURRENT_DATE
GROUP BY dept_name;
#this calculated avg and stddev for each each department
SELECT *
FROM dept_values;

SELECT dept_name, (avg_dept_salary - (SELECT historic_company_avg FROM historic_company)) / 
		(SELECT historic_company_stddev FROM historic_company) AS z_score
FROM dept_values;
#this calculates z scores for the departments


