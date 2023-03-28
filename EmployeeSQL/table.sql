SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
LEFT JOIN salaries on employees.emp_no= salaries.emp_no
ORDER BY emp_no ASC;

SELECT first_name,last_name, hire_date 
FROM employees WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no= dept_manager.dept_no;

SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no= employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules%' AND last_name LIKE 'B%';

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name= 'Development';

SELECT last_name, COUNT (last_name) FROM employees 
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;