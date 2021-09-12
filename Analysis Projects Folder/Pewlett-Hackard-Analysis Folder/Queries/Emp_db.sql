-- joining departments and dept_manager tables
select d.dept_name, dm.emp_no, dm.from_date, dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
select r.emp_no, r.first_name, r.last_name, de.to_date
into current_empl
from retirement_info as r
left join dept_emp as de
on r.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

select count(ce.emp_no), de.dept_no
from current_empl as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no;

-- list of managers per department
select dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   ce.last_name,
	   ce.first_name,
	   dm.from_date,
	   dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join current_empl as ce
		on (dm.emp_no = ce.emp_no);
		
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
into dept_info
from current_empl as ce
	inner join dept_emp as de
		on (ce.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no);