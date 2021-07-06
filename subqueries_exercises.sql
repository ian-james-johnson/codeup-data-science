
#1 find all current employees with the same hire date as employee 101010
SELECT *
FROM employees
Join salaries USING(emp_no)
WHERE hire_date = (select hire_date
					from employees
					where emp_no = 101010)
		AND to_date > CURRENT_DATE				
;
				
#2 find all the titles ever held by all current employees with the first name Aamod
SELECT *
FROM titles
WHERE emp_no IN (SELECT emp_no
				FROM employees
				WHERE first_name = 'Aamod')				
;

#3 how many employees are no longer working for the company
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (SELECT emp_no
					FROM dept_emp
					WHERE to_date > CURRENT_DATE)
;
# 59900 employees

#4 Find all current managers that are female. List their names.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
					SELECT emp_no
					FROM dept_manager
					WHERE to_date = '9999-01-01'
				) and gender = 'F'
;
#Leon	DasSarma, Hilary	Kambil, Isamu	Legleitner, Karsten	Sigstam				

#5 Find the employees who currently have a higher salary than the company's average salary
SELECT *
FROM employees
WHERE emp_no IN (
					SELECT emp_no
					FROM salaries
					WHERE salary > (SELECT AVG(salary) FROM salaries)
				) 	
;

#6 How many current salaries are within one standard deviation from the current highest salary
SELECT COUNT(salary)
FROM salaries
WHERE to_date >= CURRENT_DATE 
		AND salary >= (
					SELECT ( MAX(salary) - STDDEV(salary) )
					FROM salaries
					WHERE to_date >= CURRENT_DATE
						)
;
# 83 employees

# Find the percent of employees within one standard deviation of the max salary
SELECT
		( SELECT COUNT(salary)
		FROM salaries
		WHERE to_date >= CURRENT_DATE 
		AND salary >= (
					SELECT MAX(salary) - STDDEV(salary)
					FROM salaries
					WHERE to_date >= CURRENT_DATE
						)
		)
/
	( SELECT COUNT(salary)
	FROM salaries
	WHERE to_date >= CURRENT_DATE ) *100 AS percent_of_salaries
;
#0.0346





