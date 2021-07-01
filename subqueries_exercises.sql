
#1 find all current employees with the same hire date as employee 101010
SELECT first_name, last_name
FROM employees
WHERE hire_date = (select hire_date
					from employees
				where emp_no = 101010);
				
#2 find all the titles ever held by all current employees with the first name Aamod
SELECT title
FROM titles
WHERE emp_no IN (SELECT emp_no
				FROM employees
			WHERE first_name = 'Aamod');

#3 how many employees are no longer working for the company
SELECT count (emp_no)
FROM employees
WHERE emp_no IN (SELECT emp_no
					FROM salaries
				WHERE to_date < now() );
				
			
				
				
				

				




