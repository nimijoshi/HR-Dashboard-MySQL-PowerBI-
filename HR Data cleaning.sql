##DATA CLEANING##
select * from hr;
alter table hr
change column ï»¿id emp_id varchar(20)null;

Describe hr;
select birthdate from hr;

update hr
set birthdate= case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

alter table hr
modify column birthdate date;

update hr
set hire_date= case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
alter table hr
modify column hire_date date;

select termdate from hr;

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '' AND termdate != '  ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

UPDATE hr
SET termdate = NULL
WHERE termdate IS NOT NULL AND (termdate = '' OR termdate = ' ');

Alter table hr add column age INT;

UPDATE hr
set age=timestampdiff(year,birthdate,curdate());

select min(age) as youngest, max(age) as Oldest from hr;

Select count(*) from hr where age<18;

select count(*) from hr where termdate>curdate();
select count(*) from hr where termdate is null;
select location from hr;

