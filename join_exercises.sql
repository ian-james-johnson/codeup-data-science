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

#2 Find the department and manager names
SELECT first_name, last_name, dept_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date >= CURRENT_DATE ;
#9 rows

#3
SELECT first_name, last_name, dept_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE (to_date >= CURRENT_DATE) AND (gender = 'F') ;

#4 Find the titles of current employees in the Customer Service Department
SELECT title, count(title)
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE (titles.to_date >= CURRENT_DATE) AND (dept_name = 'Customer Service')
GROUP BY title
ORDER BY title
;

#5 Find the alaries of all current managers
SELECT dept_name, salary, first_name, last_name, dept_manager.to_date
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE (dept_manager.to_date >= CURRENT_DATE) AND (salaries.to_date >= CURRENT_DATE)
;


#6 Find the number of current employees in each department
SELECT dept_name, COUNT(dept_name)
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > CURRENT_DATE
GROUP BY dept_name
;

#7 Which department has the highest average salary
#need tables: salaries, departments, dept_emp
SELECT dept_name, AVG(salary) AS avg_salary
FROM salaries
JOIN dept_emp on salaries.emp_no = dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
GROUP BY dept_name
;

#8 Who is the highest paid employee in the marketing department
SELECT first_name, last_name
FROM employees AS e
JOIN salaries AS s
		ON e.emp_no = s.emp_no
		AND s.to_date >= CURRENT_DATE
JOIN dept_emp AS de
		ON s.emp_no = de.emp_no
		AND de.to_date >= CURRENT_DATE
JOIN departments AS d
		ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1
# dept_name = 'Marketing'
;

#9 Which current manager has the highest salary
SELECT *
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND dm.to_date >= CURRENT_DATE
JOIN salaries AS s ON e.emp_no = s.emp_no AND s.to_date >= CURRENT_DATE
ORDER BY salary DESC
LIMIT 1
;

#10 Find the names of all current employees, their department name, and their manager name
SELECT e.first_name, e.last_name, d.dept_name, concat(mgr.first_name, ' ',mgr.last_name) AS manager_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no AND de.to_date >= CURRENT_DATE
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN dept_manager AS dm ON de.dept_no = dm.dept_no AND dm.to_date >= CURRENT_DATE
JOIN salaries AS s ON e.emp_no = s.emp_no AND s.to_date >= CURRENT_DATE
JOIN employees AS mgr ON mgr.emp_no = dm.emp_no
;



