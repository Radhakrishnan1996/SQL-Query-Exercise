--08-02-2023

--Aggregate Function
SELECT * FROM EmployeeDetails

--Sum --
SELECT SUM(EmpId) FROM EmployeeDetails

--Count--
SELECT COUNT(*) FROM EmployeeDetails

--MIN--
SELECT MIN(EmpAttendance) FROM EmployeeDetails

--MAX
SELECT MAX(EmpAttendance) FROM EmployeeDetails

--AVG--
SELECT AVG(EmpId) FROM EmployeeDetails



--String Function--

--concat--
SELECT CONCAT(EmpName, ',', EmpAddress) AS full_name FROM EmployeeDetails;

--LOWER--
SELECT LOWER(EmpAddress) FROM EmployeeDetails;

--UPPER--
SELECT UPPER(EmpAddress) FROM EmployeeDetails;

--LENGTH--
SELECT LENGTH(Rupees) FROM BankDetails;

SELECT * FROM BankDetails

--SUBSTR--
SELECT SUBSTR(Rupees, 1, 3) FROM BankDetails;

SELECT NOW() AS current_time;


SELECT CEIL(Rupees) FROM BankDetails;

SELECT FLOOR(Rupees) FROM BankDetails;

