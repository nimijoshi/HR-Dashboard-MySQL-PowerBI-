##DATA QUESTION##

#--What is the gender breakdown of employees in the company?
SELECT gender, count(*) as Count from hr 
where age >= 18 and termdate is null
group by gender;

#--What is the race/ethnicity breakdown of employees in the company?
SELECT race, count(*) as count from hr
where age >= 18 and termdate is null
group by race
order by count desc;

#--What is the age distribution of employees in the company?
select min(age) as Youngest, max(age) as oldest 
from hr
where age>= 18 and termdate is null;
select 
case 
when age>=18 and age<= 24 then '18-24'
when age>=25 and age<=34 then '25-34'
when age>=35 and age<=44 then '35-44'
when age>=45 and age<=54 then'45-54'
when age>=55 and age<=64 then '55-64'
else '65+'
end as Age_group,
count(*) as Count from hr
where age>=18 and termdate is null
group by age_group
order by age_group;

select 
case 
when age>=18 and age<= 24 then '18-24'
when age>=25 and age<=34 then '25-34'
when age>=35 and age<=44 then '35-44'
when age>=45 and age<=54 then'45-54'
when age>=55 and age<=64 then '55-64'
else '65+'
end as Age_group,gender,
count(*) as Count from hr
where age>=18 and termdate is null
group by age_group, gender
order by age_group, gender

#--How many employees work at headquarters versus remote locations?

select location, count(*) as Count
from hr 
where age>=18 and termdate is null
group by location;

#--What is the average length of employment for employees who have been terminated?
select 
round(avg(datediff(termdate,hire_date))/365,0) as Lenght_of_Employment
from hr
where age>=18 and termdate <=curdate() and termdate is not null

#--How does the gender distribution vary across departments and job titles?

SELECT department,gender,count(*) as count
from hr
where age>=18 and termdate is null
group by gender,department
order by department;

#--What is the distribution of job titles across the company?

SELECT jobtitle,count(*) as count
from hr
where age>=18 and termdate is null
group by jobtitle
order by jobtitle DESC;

#--Which department has the highest turnover rate?
select department,
		total_count,
        terminated_count,
        terminated_count/total_count as terminated_rate
from
(select department,
count(*) as total_count,
sum(case when termdate is not null and termdate <= curdate() then 1 else 0 end) as terminated_count
from hr
where age>=18 
group by department) as temp
order by terminated_rate desc

#--What is the distribution of employees across locations by cities & state?
select location_state,count(*) as count
from hr
where age>18 and termdate is null
group by location_state
order by count desc

#--How has the company's employee count changed over time based on hire and term dates?
select
year,
hires,
terminations,
hires-terminations as net_change,
round((hires-terminations)/hires* 100,2) as net_change_percentage
from(
select 
year(hire_date) as year,
count(*) as hires,
sum(case when termdate is not null and termdate<=curdate() then 1 else 0 end) as terminations
from hr
where age>=18
group by year(hire_date)) as temp
order by year 
    
     
#--What is the tenure distribution for each department?
select department,round(Avg(datediff(termdate,hire_date)/365),0) as Avg_tenure
from hr
where termdate<=curdate() and termdate is not null and age>=18
group by department

