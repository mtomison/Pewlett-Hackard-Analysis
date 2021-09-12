select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into unique_titles
from employees as e
left join titles as t
on e.emp_no = t.emp_no
where e.birth_date between ('1952-01-01') and ('1955-12-31')
order by e.emp_no, t.from_date desc;

select * from unique_titles

