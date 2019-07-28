-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name,
--    gender, and salary.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
FROM emp e LEFT JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List employees who were hired in 1986.
SELECT *
FROM emp
WHERE date_part('year', hire_date) = 1986;

-- 3. List the manager of each department with the following information:
--    department number, department name, the manager's employee number, last name, first name,
--    and start and end employment dates.
SELECT
    m.dept_no,
    d.dept_name,
    m.emp_no,
    e.last_name,
    e.first_name,
    m.from_date,
    m.to_date
FROM manager m
    LEFT JOIN dept d ON m.dept_no = d.dept_no
    LEFT JOIN emp e ON m.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.
SELECT
    de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_emp de
    LEFT JOIN emp e ON de.emp_no = e.emp_no
    LEFT JOIN dept d ON de.dept_no = d.dept_no
ORDER BY de.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM emp
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- 6. List all employees in the Sales department, including their employee number,
--    last name, first name, and department name.
SELECT
    de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_emp de
    LEFT JOIN emp e ON de.emp_no = e.emp_no
    LEFT JOIN dept d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;

-- 7. List all employees in the Sales and Development departments,
--    including their employee number, last name, first name, and department name.
SELECT
    de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_emp de
    LEFT JOIN emp e ON de.emp_no = e.emp_no
    LEFT JOIN dept d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'
ORDER BY de.emp_no;

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.
SELECT
    last_name,
    COUNT(last_name) AS Name_Count
FROM emp
GROUP BY last_name
ORDER BY Name_Count DESC;