CREATE TABLE employees(
emp_no INT,
emp_title_id VARCHAR,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date DATE,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees

CREATE TABLE salaries(
emp_no INT,
salary INT,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries

CREATE TABLE titles(
title_id VARCHAR,
title VARCHAR,
PRIMARY KEY (title_id)
);

SELECT * FROM titles

CREATE TABLE departments(
dept_no VARCHAR,
dept_name VARCHAR,
PRIMARY KEY (dept_no)	
);

SELECT * FROM departments
	
CREATE TABLE dept_managers(
dept_no VARCHAR,
emp_no INT,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_managers
	
CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp
	
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
