select emp_no, first_name, last_name
from employees as e;

select *
from titles;

drop table titles;

select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into emp_titles
from employees as e, titles as t
where e.emp_no = t.emp_no;

select * from salaries;

select first_name, last_name, emp_no
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')

create table dept_emp (
	emp_no int not null,
	dept_no varchar(5),
	from_date date,
	to_date date);
	
select * from current_empl



select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc


-- Deliverable 2: Create mentorship eligibility

select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
join dept_emp as de
	on (e.emp_no = de.emp_no)
join titles as t
	on (e.emp_no = t.emp_no)
where de.to_date = ('9999-01-01')
and
e.birth_date between ('1965-01-01') and ('1965-12-31')
order by e.emp_no