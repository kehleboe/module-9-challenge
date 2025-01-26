-- 1. List employee details including salary
-- Combines employee personal information with their salary
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees e
    INNER JOIN salaries s ON e.emp_no = s.emp_no;
 
-- 2. List employees hired in 1986
-- Converts string date to proper date format and extracts year
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;
 
-- 3. List department managers with their information
-- Links departments, managers, and employee details
SELECT 
    d.dept_no,
    d.dept_name,
    m.emp_no,
    e.last_name,
    e.first_name
FROM 
    departments d
    JOIN dept_manager m ON d.dept_no = m.dept_no
    JOIN employees e ON m.emp_no = e.emp_no;
 
-- 4. List department information for all employees
SELECT 
    de.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_emp de
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN employees e ON de.emp_no = e.emp_no;
 
-- 5. Find employees named Hercules B.
SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    AND last_name LIKE 'B%';
 
-- 6. List Sales department employees
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';
 
-- 7. List Sales and Development department employees
SELECT 
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');
 
-- 8. Count frequency of employee last names
SELECT 
    last_name,
    COUNT(last_name) as name_count
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    name_count DESC;