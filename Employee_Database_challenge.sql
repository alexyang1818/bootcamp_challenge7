-- SELECT emp_no,
-- 	first_name,
-- 	last_name
-- FROM employees;

-- SELECT title,
-- 	from_date,
-- 	to_date
-- FROM title;

SELECT * FROM employees;
SELECT * FROM title;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	JOIN title AS t
	ON e.emp_no=t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title
-- 	t.from_date,
-- 	t.to_date
--INTO unique_titles
FROM employees AS e
	JOIN title AS t
	ON e.emp_no=t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ASC, 
	t.to_date DESC;

SELECT COUNT(title) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	JOIN title AS t
		ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no ASC,
	de.to_date DESC;

-- -- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- ORDER BY _____, _____ DESC;
