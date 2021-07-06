
#2 Find employees with first name Irena, Vidya, or Maya using 'IN'
SELECT first_name, last_name 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
#709 rows returned

#3 Find employees with first name Irena, Vidya, or Maya using 'OR'
SELECT first_name, last_name 
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
#709 rows returned

#4 Find employees with first name Irena, Vidya, or Maya; and who is male
SELECT first_name, last_name 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') AND (gender = 'M');
# 441 rows returned

#5 Find all employees whose last name starts with 'E'
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%';
#7330 employees

#6 Find all employees whose last name starts or ends with 'E'
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' OR '%E';
#7330 employees

#7 Find all employees whose last name starts and ends with 'E'
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E';
#899 employees

#8 Find all employees hired in the 90's
SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%';
# 135214 employees

#9 Find all employees born on Christmas
SELECT *
FROM employees
WHERE hire_date LIKE '%-12-25';
#789 employees

#10 Find all employees born on Christmas and in the 90's
SELECT first_name, last_name
FROM employees
WHERE (hire_date LIKE '199%') AND (hire_date LIKE '%-12-25');
#346 employees

#11 Find all employees with a 'q' in their last name
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
#1873 employees

#12 Find all employees with a 'q' in their last name but not 'qu'
SELECT *
FROM employees
WHERE (last_name LIKE '%q%') AND NOT (last_name LIKE '%qu%');
#547 employees
