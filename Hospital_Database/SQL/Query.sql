--Query 1
--show patient's id, first name, and last name, along with the appointment ID and date
--of appointments 
SELECT patient.patientid, patient.firstname, patient.lastname,
Appointment.appointmentID, Appointment.patientID, Appointment.appointmentDate
FROM patient
JOIN Appointment ON patient.patientid = Appointment.patientid;


--Query 2
--- display the nurse IDs and salaries of nurses in the second department whose
--salaries are less than the salary of some nurses in the first department
select nurseid,salary
from nurses
where deptnum='Dept002' and salary < some(select salary from nurses where
deptnum='Dept001');


--Query 3
---Display the first name, last name, and position of employees whose first name
--starts with the letter 'N'.
SELECT firstname, lastname, position
FROM employee
WHERE firstname LIKE 'N%';


--Query 4
---update the salary of the managers,if the salary is more than 25000 then add
--1000, else add 2000
update manager
set salary = case when salary >=25000 then salary + 1000
else salary + 2000
end;


--Query 5
---display employee's first name,last name,department number and salary where
--their salary is more than 9000 or they work in the first department select
--firstname,lastname,salary,deptnum
from employee
where salary > 9000 or deptnum ='Dept001';


--Query 6
--- show the patient ID, first name, last name, room number, and admission date
--for patients who are admitted to the hospital.
select patientid,firstname,lastname,roomnum,admissiondate
from patient inner join admission using(patientid);

--Query 7
---Display all specializations from the
--doctors’ table.
SELECT ALL Specialization
FROM doctor


--Query 8
---Display the Nurse ID and their specialty for all nurses whose names end with
--'ed' and whose salary is greater than or equal to 10000.
SELECT nurseID , specialization
FROM Nurses
WHERE lastName LIKE '%ed' AND salary >= 10000;

--Query 9
---Display the employee ID and first name
--for all employees whose department
--number in dept001 , dept005, and whose
--first name has at least four characters.
SELECT employeeID , firstName
FROM Employee
WHERE deptNum IN ('Dept001' ,
'Dept005') AND firstName LIKE '____%';


--Query 10
---Display the deptnum of the employee with the highest salary in each
--department and order them by department.
SELECT deptNum, MAX(salary) AS maxSalary
FROM Employee
GROUP BY deptNum;


--Query 11
---Display the patient ID, first name, and last name for patients who are aged
--30 or above and are currently in the hospital.
SELECT patientID, firstName , lastName
FROM Patient
WHERE Age >= 30 -Output:
AND patientID IN (
SELECT patientID
FROM Admission
WHERE dischargeDate IS NULL
);


--Query 12
---Display the employee ID, Deptnum, and salary for employees whose salary is higher
--than all salaries of employees in the ophthalmology department(Dept001). -SELECT
--employeeID , deptNum , salary
FROM Employee
WHERE salary > ALL ( -Output:
SELECT salary
FROM Employee
WHERE deptNum = 'Dept001'


--Query 13
--display all the specializations that
--are available in the hospital and
--remove duplicates SELECT
DISTINCT specialization
FROM doctor;

--Query 14
--- Display the newly added “Email” column of type VARCHAR in the
--employee table
ALTER TABLE employeeBefore Alter:
ADD Email VARCHAR (50);


--Query 15
--- Display the specializations and salaries of doctors and nurses whose salaries
--are below 10,000
SELECT Specialization , Salary
FROM Doctor
WHERE Salary < 10000
UNION ALL
SELECT Specialization , Salary
FROM Nurses
WHERE Salary < 10000;


--Query 16
--- Display Nurses names that ends with an a after four digits SELECT
--firstName
FROM Nurses
WHERE firstName LIKE '____a';


--Query 17
---Display the total salary of all doctors in each department
SELECT deptNum, SUM(salary) AS total_salary
FROM Doctor
GROUP BY deptNum;

--Query 18
---Display the number of nurses for each specialization in the Nurses table
SELECT Specialization , COUNT(*) AS nursesNum
FROM Nurses
GROUP BY Specialization;


--Query 19
---Display doctorID,firstName,lastName,Email for doctors whose names do not
--start with A
SELECT doctorID,firstName,lastName,Email
FROM Doctor
WHERE firstName NOT LIKE 'A%';
-:

-- Query 20
-- Display employeeID, firstName, lastName, deptNum and Salary of the employees
-- who work in the fourth department and their salary is more than 10,000
SELECT employeeID, firstName, lastName, deptNum, Salary
FROM Employee
WHERE deptNum = 'Dept004'
INTERSECT
SELECT employeeID, firstName, lastName, deptNum, Salary
FROM Employee
WHERE Salary > 10000;


-- Query 21
-- Display employeeID, firstName, lastName and Salary for employees
-- whose salaries are between 10,000 and 20,000
SELECT employeeID, firstName, lastName, Salary
FROM Employee
WHERE Salary BETWEEN 10000 AND 20000;


-- Query 22
-- Display nurseID, firstName, lastName, Salary, deptNum for nurses
-- working in the first and second departments
SELECT nurseID, firstName, lastName, Salary, deptNum
FROM Nurses
WHERE deptNum IN ('Dept001', 'Dept002');


-- Query 23
-- Increase the salary of a manager with the ID (M004) by 2000
UPDATE Manager
SET Salary = Salary + 2000
WHERE managerID = 'M004'
AND deptNum = 'Dept004';


-- Query 24
-- Display employeeID, firstName, lastName, deptNum, Position for employees
-- who work in the third department and their position is Finance Analyst
SELECT employeeID, firstName, lastName, deptNum, Position
FROM Employee
WHERE deptNum = 'Dept003'
AND Position = 'Finance Analyst';


-- Query 25
-- Display nurseID, firstName, lastName, deptNum for all nurses
-- except those who work in the first department
SELECT nurseID, firstName, lastName, deptNum
FROM Nurses
WHERE deptNum <> 'Dept001';


-- Query 26
-- Display employees from department 'Dept001' but have a salary not greater than 8000
SELECT employeeID, firstName, deptNum, salary
FROM Employee
WHERE deptNum = 'Dept001'
MINUS
SELECT employeeID, firstName, deptNum, salary
FROM Employee
WHERE salary > 8000;


-- Query 27
-- Display the average salary for employees in each department
SELECT deptNum, AVG(salary) AS avg_salary
FROM Employee
GROUP BY deptNum;


-- Query 28
-- Display the lowest salary paid to an employee in each department
SELECT deptNum, MIN(salary) AS min_salary
FROM Employee
GROUP BY deptNum;


-- Query 29
-- Display and count the number of doctors in each department with salaries >= 8000,
-- only including departments with more than 2 such doctors
SELECT deptNum, COUNT(*) AS NumDoctors
FROM Doctor
WHERE Salary >= 8000
GROUP BY deptNum
HAVING COUNT(*) > 2;


-- Query 30
-- Display the first name and last name of patients under 25 years old
-- who haven’t been admitted to the hospital
SELECT firstName, lastName
FROM Patient
WHERE Age < 25
AND patientID NOT IN (
    SELECT patientID
    FROM Admission
);


-- Query 31
-- Display patientIDs, first names and last names alongside their admissionIDs and room numbers.
-- Include all patients even if they have not been admitted.
SELECT patientID, firstName, lastName, admissionID, roomNum
FROM Admission
NATURAL RIGHT OUTER JOIN Patient;


-- Query 32
-- Remove the phoneNumber column from the Employee table
ALTER TABLE Employee
DROP COLUMN phoneNumber;


-- Query 33
-- Display all employee data for employees who have a salary of more than 10,000
SELECT *
FROM Employee
WHERE Salary > 10000;


-- Query 34
-- List female patients’ firstName in ascending order and display their lastName and gender
SELECT firstName, lastName, Gender
FROM Patient
WHERE Gender = 'F'
ORDER BY firstName ASC;


-- Query 35
-- Display firstName and lastName of nurses who have not registered their emails
SELECT firstName, lastName
FROM Nurses
WHERE Email IS NULL;


-- Query 36
-- Display firstName, lastName, Email of female patients who have registered their emails
SELECT firstName, lastName, Email
FROM Patient
WHERE Gender = 'F'
AND Email IS NOT NULL;


-- Query 37
-- Display the wards and the total number of rooms in each ward
SELECT Ward, COUNT(roomNum) AS Total_Rooms
FROM Room
GROUP BY Ward;

--Query 38
---Display patientID , firstName,
--lastName,Gender,age where gender is
--M or age is less than 25
SELECT patientID , firstName,
lastName,Gender,age
FROM patient
WHERE Gender = 'M'
UNION
SELECT patientID , firstName,
lastName,Gender,age
FROM patient
WHERE age < 25;

-- Query 39
-- Combine patient and admission information based on shared patientID
SELECT *
FROM Patient
NATURAL JOIN Admission;


-- Query 40
-- Show patients' first and last names and rename the columns
SELECT firstName AS First, lastName AS Last
FROM Patient;


-- Query 41
-- List all patients' information sorted by age in descending order
SELECT *
FROM Patient
ORDER BY Age DESC;


-- Query 42
-- Count the total number of doctors in the database
-- Rename the column as "allDoctors"
SELECT COUNT(*) AS allDoctors
FROM Doctor;


-- Query 43
-- Delete rows from the Employee table where the position is 'Receptionist'
-- and the salary is less than 9000
DELETE FROM Employee
WHERE Position = 'Receptionist'
AND Salary < 9000;


-- Query 44
-- Show patient information with their admission records
-- Include all patients whether admitted or not
SELECT *
FROM Patient
FULL OUTER JOIN Admission
ON Patient.patientID = Admission.patientID;


-- Query 45
-- Display the first name, last name, and specialization of doctors
-- whose first name contains the letter 'h'
SELECT firstName, lastName, specialization
FROM Doctor
WHERE firstName LIKE '%h%';


-- Query 46
-- Display nurseIDs, first and last names, and salaries for nurses
-- whose specialization is Cardiac Nurse and salary is between 10000 and 11000
SELECT nurseID, firstName, lastName, salary
FROM Nurses
WHERE salary BETWEEN 10000.00 AND 11000.00
AND specialization = 'Cardiac Nurse';


-- Query 47
-- Display nurseIDs and specializations of nurses in Department 3
-- whose salary matches some salaries of nurses in Department 1
SELECT nurseID, specialization
FROM Nurses
WHERE deptNum = 'Dept003'
AND salary = SOME (
    SELECT salary
    FROM Nurses
    WHERE deptNum = 'Dept001'
);


-- Query 48
-- Get all patient details along with their prescriptions if available
SELECT *
FROM Patient
NATURAL LEFT OUTER JOIN Prescription;


-- Query 49
-- Retrieve specializations of doctors who work in departments
-- where at least one nurse earns a salary greater than 10,000
SELECT specialization
FROM Doctor d
WHERE EXISTS (
    SELECT nurseID
    FROM Nurses n
    WHERE d.deptNum = n.deptNum
    AND n.salary > 10000.00
);


-- Query 50
-- Retrieve nurseIDs and specializations of nurses working in Department 'Dept001'
-- whose salary is greater than at least one nurse's salary in Department 'Dept003'
SELECT nurseID, specialization
FROM Nurses
WHERE deptNum = 'Dept001'
AND salary > SOME (
    SELECT salary
    FROM Nurses
    WHERE deptNum = 'Dept003'
);

