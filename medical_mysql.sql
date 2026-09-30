--q1
select first_name , last_name , gender
from patients 
where gender = 'M';

--Q2
select first_name , last_name
from patients
where allergies is null;

--Q3
select first_name
from patients
where first_name like 'C%';

--Q4
select first_name , last_name
from patients
where weight between 100 and 120; 

--Q5
update patients
set allergies = "NKA"
where allergies is null;

--Q6

select concat(first_name, ' ' , last_name) as full_name
from patients;

--Q7 
select first_name , last_name, concat(first_name, ' ', last_name)
from patients;

--Q8
select count(*) as total_patients
from patients
where year(birth_date) = 2010;

--Q9
select first_name ,last_name ,height
from patients
order by height desc
limit 1;

--Q10 
select *
from patients
where patient_id in (1, 45, 534, 879, 1000);

--Q11
select count(patient_id) as total_admissions
from admissions

--Q12
select *
from admissions
where admission_date = discharge_date;

--Q13
select count(patient_id) as total_patients
from admissions
where patient_id = 579;

--Q14
select distinct city 
from patients 
where province_id = 'NS';

--Q15
select first_name, last_name,birth_date
from patients
where height > 160 and weight > 70; 

--Q16
select distinct year(birth_date) as year
from patients
order by year(birth_date) asc;

--Q17
select first_name
from patients
group by first_name
having count(*)=1;

--Q18
select patient_id , first_name
from patients
where first_name like 'S%s' and length(first_name) >= 6;

--Q19
select p.patient_id , p.first_name , p.last_name
from patients p
join admissions a
on p.patient_id = a.patient_id
where a.diagnosis = 'Dementia ';

--Q20
select first_name
from patients
order by length(first_name) , first_name asc;

--Q21
select gender, count(*) as total_patients
from patients
group by gender;

-- but they want it in the same row Q22
select 
    count(case when gender = 'M' then 1 end ) as total_male,
    count(case when gender = 'F' then 1 end ) as total_female
from patients;

--Q23
select p.patient_id , a.diagnosis, count(a.diagnosis) as total_admissions
from patients p
join admissions a 
 on p.patient_id = a.patient_id
group by p.patient_id, a.diagnosis
having count(a.diagnosis) > 1;

--Q24
select city , count(patient_id) as total_patients
from patients
group by city 
order by total_patients desc , city asc ; 

--Q25
select first_name,last_name , 'Patient' as role  
from patients 
union all 
select first_name, last_name, 'Doctor' as role
from doctors;

--Q26
select allergies, count(allergies) as popularity 
from patients
where allergies is not null
group by allergies
order by popularity desc;

--Q27
select first_name , last_name , birth_date
from patients 
where year(birth_date) between 1970 and 1979 
order by birth_date desc;

--Q28
select concat(upper(last_name),",", lower(first_name)) as Patient_Name
from patients
order by first_name desc;

--Q29
select province_id , sum(height) as total_height
from patients
group by province_id
having sum(height) >= 2000; 

--Q30
select max(weight) as max_weight, min(weight) as min_weight , max(weight)-min(weight) as difference
from patients
where last_name = 'Maroni';

--Q31
select day(admission_date)as dayinMonth,count(admission_date) as total_admissions
from admissions
group by day(admission_date)
order by total_admissions desc;

--Q32
SELECT FLOOR(weight / 10) * 10 AS weight_group,
       COUNT(*) AS total_patients
FROM patients
GROUP BY FLOOR(weight / 10) * 10
ORDER BY weight_group DESC;

--Q33
select patient_id, weight, height,
case 
    when weight/((height/100) * (height/100)) >= 30 then 1 
    else 0
end as isObese
from patients;

--Q34
select p.patient_id , p.first_name,p.last_name, d.specialty
from patients p
join admissions a
    on p.patient_id = a.patient_id
join doctors d
    on d.doctor_id = a.attending_doctor_id
where a.diagnosis = 'Epilepsy' and d.first_name = 'Lisa';

--Q35
select patient_id,
        concat(
            patient_id,
            length(first_name),
            year(birth_date)
        ) as temp_password
from patients;