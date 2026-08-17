-- Name: Fatemeh Kamrani
-- Course: SQL
-- Exercise: 01
-- Date: 2026-08-06


use Hospital;
Go
-------------------------------------------------------------------------------------------------------------------
-- Show the first name, last name, and gender of patients whose gender is male (M) 
select first_name, last_name ,gender
from Hospital.dbo.patients
where gender=  'M'


-------------------------------------------------------------------------------------------------------------------
-- Show the first name and last name of patients who do not have allergies— their allergies value is NULL. 

select first_name ,last_name 
from patients
where allergies is null

-------------------------------------------------------------------------------------------------------------------
-- Show the first names of patients whose first name starts with the letter C.
select first_name 
from patients
where first_name like 'C%'

-------------------------------------------------------------------------------------------------------------------
-- Show the first name and last name of patients whose weight is between 100 and 120.
select first_name ,last_name 
from patients
where weight  between 100 and 120

-------------------------------------------------------------------------------------------------------------------
--Display each patient’s first name and last name combined into a single column named Full Name.

select concat( first_name, ' ',last_name ) as [Full Name]
from patients

-------------------------------------------------------------------------------------------------------------------
-- Show the number of patients whose birth year is 2010.
select count(*) 
from patients
where YEAR(birth_date) =2010

-------------------------------------------------------------------------------------------------------------------
-- Show all columns for patients whose patient ID is one of the following values: 1, 45, 534, 879, or 1000.
select *
from patients
where patient_id in(1,45,534,879,1000)

-------------------------------------------------------------------------------------------------------------------
--Show the first name, last name, and birth date of patients whose height is greater than 160 and whose weight is greater than 70.
select first_name, last_name  , birth_date 
from patients 
where  height >160  and weight >70
-------------------------------------------------------------------------------------------------------------------
--Update the patients table and replace all NULL values in the allergies column with NKA.
update patients
set allergies ='NKA' 
where allergies is null


SELECT COUNT(*)
FROM patients
WHERE allergies IS NULL;