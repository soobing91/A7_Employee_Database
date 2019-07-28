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