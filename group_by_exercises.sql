#2
SELECT DISTINCT title
FROM titles;
#7 titles

#3
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;
#5 names

#4
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;
#846 rows

#5
SELECT last_name
FROM employees
WHERE (last_name LIKE '%q%') AND NOT (last_name LIKE '%qu%')
GROUP BY last_name;
#Chleq, Lindqvist, Qiwen

#6
SELECT COUNT(last_name)
FROM employees
WHERE (last_name LIKE '%q%') AND NOT (last_name LIKE '%qu%')
GROUP BY last_name;
#189, 190, 168

#7
SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name;
#Vudya=232, Irena=241, Maya=236

#8
SELECT
			
			CONCAT( 
			LOWER( SUBSTR(first_name, 1, 1)), 
			LOWER( SUBSTR(last_name, 1, 4)), 
			'_', 
			SUBSTR(birth_date, 6, 2), 
			SUBSTR(birth_date, 3, 2) ) AS username
			
			,COUNT(*) AS user_count
			
FROM employees
GROUP BY username
ORDER BY COUNT(*) DESC
;
#there are duplicate usernames

#8b
SELECT
			Count(DISTINCT
			CONCAT( 
			LOWER( SUBSTR(first_name, 1, 1)), 
			LOWER( SUBSTR(last_name, 1, 4)), 
			'_', 
			SUBSTR(birth_date, 6, 2), 
			SUBSTR(birth_date, 3, 2) ) 
			)AS unique_user
			
			
FROM employees
;
#285872