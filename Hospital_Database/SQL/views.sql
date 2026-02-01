View 1
CREATE VIEW PatientBasicInfo AS
SELECT patientID, firstName, lastName, Age, Gender
FROM Patient
WHERE Age >= 30
ORDER BY Age DESC
WITH CHECK OPTION;

View 2
CREATE VIEW View_Employee_Department AS
SELECT e.employeeID, e.firstName, e.lastName, e.Position,
d.deptNum, d.deptName, d.location
FROM Employee e
JOIN Department d ON e.deptNum = d.deptNum
WHERE d.deptNum IN ('Dept001', 'Dept002', 'Dept003'); 

View 3
Create view doctorimportantinfo AS select
firstName,lastName,specialization from
doctor
where salary >8000.00
order by firstName DESC ;

View 4
CREATE VIEW DoctorSpecialization AS
SELECT doctorID, firstName, lastName, Specialization
FROM Doctor
WHERE Specialization LIKE '%Surgeon%';


View 5
CREATE VIEW DepartmentSalaryTotal AS
SELECT d.deptNum, d.deptName, SUM(e.Salary) AS
TotalSalary
FROM Department d
JOIN Employee e ON d.deptNum = e.deptNum GROUP
BY d.deptNum, d.deptName;

