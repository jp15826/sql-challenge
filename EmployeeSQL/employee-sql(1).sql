CREATE TABLE title(
	title_id VARCHAR (20) PRIMARY KEY,
	title VARCHAR (30) NOT NULL
);
SELECT * FROM title;
 
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR (20) NOT NULL,
	birth_date VARCHAR (50) NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex VARCHAR (10) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES title(title_id)
);
SELECT * FROM employees;

CREATE TABLE departments(
	dept_no VARCHAR (30) PRIMARY KEY,
	dept_name VARCHAR (50) NOT NULL
);
SELECT * FROM departments;

CREATE TABLE dept_manager(
	dept_no VARCHAR (20),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);
SELECT * FROM dept_manager;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR (30),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_emp;

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)	
);
SELECT * FROM salaries;

SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
LEFT JOIN salaries on employees.emp_no= salaries.emp_no
ORDER BY emp_no ASC;

SELECT first_name,last_name, hire_date 
FROM employees WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no= dept_manager.dept_no

SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no= employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules%' AND last_name LIKE 'B%'

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales'

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name= 'Development'

SELECT last_name, COUNT (last_name) FROM employees 
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;
