SELECT e.emp_no,
e.first_name,
e.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

ORDER BY emp_no DESC;

SELECT * FROM retirement_titles

-- DELIVERABLE 1: Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM unique_titles

-- DELIVERABLE 1: RETIRING TITLES
SELECT COUNT (unique_titles.emp_no), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE 2: MENTORSHIP ELIGIBILITY
SELECT DISTINCT ON (emp_no) e.emp_no, 
e.first_name,
e.last_name,
e.birth_date,
dept_emp.from_date,
dept_emp.to_date,
ti.title
INTO mentorship_eligibility
from employees as e 
INNER JOIN dept_emp
ON (e.emp_no = dept_emp.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE dept_emp.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;

SELECT * FROM mentorship_eligibility