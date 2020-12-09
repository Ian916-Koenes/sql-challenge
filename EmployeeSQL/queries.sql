SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
dept_managers.dept_no,
departments.dept_name
FROM employees
INNER JOIN dept_managers ON
(employees.emp_no = dept_managers.emp_no)
	INNER JOIN departments 
		ON (departments.dept_no = dept_managers.dept_no)
		ORDER BY employees.emp_no;
	
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
(employees.emp_no = dept_emp.emp_no)
	INNER JOIN departments 
		ON (departments.dept_no = dept_emp.dept_no)
		ORDER BY employees.emp_no;	
		
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
(employees.emp_no = dept_emp.emp_no)
	INNER JOIN departments 
		ON (departments.dept_no = dept_emp.dept_no)
		WHERE dept_name = 'Sales'
		ORDER BY employees.emp_no;
		
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
(employees.emp_no = dept_emp.emp_no)
	INNER JOIN departments 
		ON (departments.dept_no = dept_emp.dept_no)
		WHERE dept_name = 'Sales'
		OR dept_name = 'Development'
		ORDER BY employees.emp_no;

SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;

SELECT *
FROM employees
WHERE emp_no = 499942;