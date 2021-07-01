#example 1
SELECT *
FROM users, roles;

#example 2
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;
#4 rows

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
#6 rows, 2 row with nulls on role side

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
#5 rows, 1 row with nulls on user side

#example 3
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role_id;

#2
SELECT first_name, last_name, dept_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date >= CURRENT_DATE ;

#3
SELECT first_name, last_name, dept_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE (to_date >= CURRENT_DATE) AND (gender = 'F') ;

#4
SELECT title, count(title)
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE (dept_emp.to_date >= CURRENT_DATE) AND (dept_name = 'Customer Service')
GROUP BY title
ORDER BY title
;
#wrong numbers for answer

#5
SELECT dept_name, salary, first_name, last_name, dept_manager.to_date
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE (dept_manager.to_date >= CURRENT_DATE)

;
#wa not able to filter additional row out (multiple salaries for each person)

#6
SELECT dept_name, COUNT(*)
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_name
;
#answer numbers are way off

#7


