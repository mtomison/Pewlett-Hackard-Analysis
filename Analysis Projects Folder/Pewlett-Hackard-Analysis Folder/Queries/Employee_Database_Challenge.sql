-- Deliverable 1: Retirement tables
-- Create retirement_titles table
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
inner join titles as t 
	on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31';

-- create Unique Titles table
select distinct on (emp_no) emp_no, first_name, last_name, title
into unique_titles
from retirement_titles
order by emp_no, to_date desc;

-- Retrieve number of employees by their most recent job title who are about to retire.
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc

-- Deliverable 2: Mentorship Eligibility 
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
	on e.emp_no = de.emp_no
inner join titles as t
	on e.emp_no = t.emp_no
where de.to_date = '9999-01-01' and e.birth_date between '1965-01-01' and '1965-12-31'
order by e.emp_no