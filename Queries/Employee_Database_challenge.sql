
SELECT e.emp_no,
    e.first_name,
    e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date
FROM titles;

--Create a new "retirement_titles" table using the 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
    rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--query to retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no) AS count,
	ut.title
INTO retiring_titles	
From unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

--Deliverable 2
--create a mentorship-eligibility table 

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Additional
-- retiring employees department
SELECT DISTINCT ON (ut.emp_no) ut.emp_no,
		de.dept_no,
	ut.first_name,
    ut.last_name,
	ut.title,
	de.from_date,
	de.to_date,
	d.dept_name	
INTO retiring_depatment
FROM unique_titles AS ut
INNER JOIN dept_emp AS de
ON (ut.emp_no = de.emp_no)
LEFT JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE de.to_date = ('9999-01-01')
ORDER BY ut.emp_no, de.to_date DESC;

--count of retiring employees from each department
SELECT COUNT(rd.emp_no) AS emp_count,
	rd.dept_name, rd.dept_no
INTO retiring_depatment_c	
From retiring_depatment AS rd
GROUP BY rd.dept_name, rd.dept_no 
ORDER BY emp_count DESC;

-- Additional 2 queries
-- create a mentorship-eligibility table by title
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	de.dept_no,
	t.title
INTO mentorship_title
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Mentorship count by title
SELECT COUNT(med.emp_no) AS mentor_count,	
	med.title	
INTO mentorship_title_count
FROM mentorship_title AS med
GROUP BY med.title
ORDER BY mentor_count DESC;