create table de11an.kore_empty_table (id integer);

alter table de11an.kore_empty_table 
add column text_col varchar(20);

alter table de11an.kore_empty_table
alter column text_col type VARCHAR(15);

DELETE FROM de11an.kore_empty_table WHERE id = 12345;

insert into de11an.kore_empty_table(text_col) 
values ('Hello, world!');

UPDATE de11an.kore_empty_table
SET id = 12345 WHERE text_col = 'Hello, world!';

alter table de11an.kore_empty_table 
alter column text_col type varchar(10) using text_col::varchar(10);

select * from de11an.kore_empty_table

select first_name, last_name,
	case
		when salary < 4000 then 'бедные'
		when salary >= 4000 and salary < 8000 then 'средний класс'
		when salary >= 8000 and salary < 20000 then 'богатые'
		else 'очень богатые'
	end as class_
from hr.employees;

select last_name, first_name, commission_pct, salary as salary_before, salary+(100000*coalesce(commission_pct, 0)) as salary_after,
	CASE
		when salary < 4000 then 'бедные'
		when salary >= 4000 and salary < 8000 then 'средний класс'
		when salary >= 8000 and salary < 20000 then 'богатые'
		else 'очень богатые'
	end as class_before,
	CASE
		when (salary + 1000000 * coalesce(commission_pct, 0)) < 4000 then 'бедные'
		when (salary + 1000000 * coalesce(commission_pct, 0)) >= 4000 and (salary + 1000000 * coalesce(commission_pct, 0)) < 8000 then 'средний класс'
		when (salary + 1000000 * coalesce(commission_pct, 0)) >= 8000 and (salary + 1000000 * coalesce(commission_pct, 0)) < 20000 then 'богатые'
		else 'очень богатые'
	end as class_after
FROM hr.employees
where commission_pct is not NULL;
