--Retrive all data from Customers Table
SELECT * FROM Customers

--Retrive all data from Persons Table
SELECT * FROM Persons

--SQL Exist Operator ( Here i have selected the customer name from customer table where personid act as a primary key and the condition is firstname should be "Appxpert"
SELECT CustomerName FROM Customers
WHERE EXISTS (SELECT Firstname FROM Persons WHERE Persons.PersonId=Customers.PersonId AND FirstName='AppXpert')

--Another Example ( Here i have selected the Firstname from persons table where personid act as a primary key and the condition is customerid should be "1001,1002"
SELECT FirstName FROM Persons
WHERE EXISTS (SELECT CustomerId FROM Customers WHERE Customers.PersonId=Persons.PersonId AND CustomerId IN('1001','1002'))

--SQL ANY  Operator( 
SELECT FirstName FROM Persons
WHERE PersonId=ANY( SELECT PersonId FROM Customers WHERE AddressName='Palayam' )

	


--SQL ALL Operator
SELECT FirstName FROM Persons
WHERE PersonId=ALL( SELECT PersonId FROM Customers WHERE AddressName='Kiliyanur' )

--Create table
CREATE TABLE EmployeeDetails (
EmpId INT PRIMARY KEY,
EmpName VARCHAR(50),
EmpAddress VARCHAR(100),
EmpAttendance VARCHAR(25)
);

--Retrive All data
SELECT * FROM EmployeeDetails

--Inserting Data into EmployeeDetails Table
INSERT INTO EmployeeDetails (EmpId,EmpName,EmpAddress,EmpAttendance)
VALUES (1,'Vinoth','Pondy','90%'),
(2,'Raja','Kiliyanur','70%'),
(3,'Kumar','Tindivanam','65%'),
(4,'Vicky','Cuddalore','60%'),
(5,'Sugu','Chennai','85%');


--Create table for Bank
CREATE TABLE BankDetails (
EmpId INT PRIMARY KEY,
BankId VARCHAR(50),
BankName VARCHAR(50),
Rupees VARCHAR(100),
);


--Inserting  data in Bankdetails
INSERT INTO BankDetails (EmpId,BankId,BankName,Rupees)
VALUES (1,'SBI001','State Bank Of India','10000'),
(2,'ICICI2518','ICICI Bank','500'),
(3,'HDFC567','HDFC Bank','6000'),
(4,'RBI001','Reserve Bank Of India','100'),
(5,'INDIAN897','Indian Bank','8000');

--retrive all Data
SELECT * FROM BankDetails


--Using Exist operator in  EmployeeDetails vs BankDetails to find above RS500
SELECT BankName FROM BankDetails
WHERE EXISTS (SELECT EmpName FROM EmployeeDetails WHERE EmployeeDetails.EmpId=BankDetails.EmpId AND Rupees > 500); 

SELECT BankId FROM BankDetails
WHERE EXISTS (SELECT EmpAddress FROM  EmployeeDetails WHERE EmployeeDetails.EmpId=BankDetails.EmpId AND BankName= 'Indian Bank'); 


INSERT INTO BankDetails (EmpId,BankId,BankName,Rupees)
VALUES (6,'SBI001','State Bank Of India','10');

INSERT INTO EmployeeDetails (EmpId,EmpName,EmpAddress,EmpAttendance)
VALUES (6,'jayakumar','Siruvallur','50%');

--SQL Any Operators
SELECT EmpAddress 
FROM EmployeeDetails
WHERE EmpId = ANY (SELECT EmpId FROM BankDetails WHERE BankId = 'SBI001');

SELECT EmpAddress 
FROM EmployeeDetails
WHERE EmpId = ANY (SELECT EmpId FROM BankDetails WHERE BankId = 'RBI001');

--SQL All Operators
SELECT EmpAddress 
FROM EmployeeDetails
WHERE EmpId = ALL (SELECT EmpId FROM BankDetails WHERE BankId = 'SBI001');

-- by using Select Into  to create a table by using BankDetails Data
SELECT * INTO BankId
FROM BankDetails
WHERE Rupees= 100;

--retrive the new created table
SELECT * FROM BankId

--The following SQL statement copies data from more than one table into a new table:
SELECT BankDetails.BankName, EmployeeDetails.EmpAddress
INTO BackupReport2023
FROM BankDetails
LEFT JOIN EmployeeDetails ON BankDetails.EmpId = EmployeeDetails.EmpId;

SELECT * FROM BackupReport2023

--Insert into select Examples

INSERT INTO InactiveBankDetails(EmpId,BankName,amount)
SELECT EmpId,BankName,Rupees FROM BankDetails where empid in (1,3,5,7)


CREATE TABLE InactiveBankDetails
(
Id int IDENTITY(1,1),
EmpId INT,
BankName VARCHAR(50),
amount VARCHAR(50),
Rupees VARCHAR(50)
)

SELECT * FROM InactiveBankDetails

ALTER TABLE InactiveBankDetails
ADD createddatev DATE

UPDATE InactiveBankDetails
SET createddatev = '2023-04-06'
WHERE Id IN (1,2)

