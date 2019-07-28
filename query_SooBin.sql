-- Data Engineering: importing six CSVs
-- Employees
DROP TABLE emp;

CREATE TABLE emp(
    emp_no INT NOT NULL PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL
);

-- Department
DROP TABLE dept;

CREATE TABLE dept(
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

-- Titles
DROP TABLE titles;

CREATE TABLE titles(
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES emp(emp_no),
    title VARCHAR(255) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

-- Employees by department
DROP TABLE dept_emp;

CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES emp(emp_no),
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES dept(dept_no),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

-- Department mangers
DROP TABLE manager;

CREATE TABLE manager(
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES dept(dept_no),
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES emp(emp_no),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

-- Salaries
DROP TABLE salaries;

CREATE TABLE salaries(
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES emp(emp_no),
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);


-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name,
--    gender, and salary.
SELECT
e.emp_no AS Employee_Number,
e.last_name AS Last_Name,
e.first_name AS First_Name,
e.gender AS Gender,
s.salary AS Salary
FROM emp e LEFT JOIN salaries s ON e.emp_no = s.emp_no;

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
    LEFT JOIN emp e ON m.emp_no = e.emp_no

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.



-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.