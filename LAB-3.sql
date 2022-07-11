CREATE DATABASE PERSON_INFO_21010101117

USE PERSON_INFO_21010101117

CREATE TABLE PERSON
(	PERSONID INT PRIMARY KEY,
	PERSONNAME VARCHAR(100) NOT NULL,
	DEPARTMENTID INT FOREIGN KEY REFERENCES DEPARTMENT(DEPARTMENTID),
	SALARY DECIMAL(8,2) NOT NULL,
	JOININGDATE DATETIME NOT NULL,
	CITY VARCHAR(100) NOT NULL)
	SELECT * FROM PERSON
CREATE TABLE DEPARTMENT
(	DEPARTMENTID INT PRIMARY KEY,
	DEPARTMENTNAME VARCHAR(100) NOT NULL UNIQUE,
	DEPARTMENTCODE VARCHAR(50) NOT NULL UNIQUE,
	LOCATION VARCHAR(50) NOT NULL
)

SELECT * FROM DEPARTMENT
--1	ADMIN		ADM	A-BLOCK
--2	COMPUTER	CE	C-BLOCK
--3	CIVIL		CI	G-BLOCK
--4	ELECTRICAL	EE	E-BLOCK
--5	MECHANICAL	ME	B-BLOCK

--1. Find all persons with their department name & code. 
	SELECT PERSONNAME,DEPARTMENT.DEPARTMENTNAME,DEPARTMENT.DEPARTMENTCODE
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID

--2. Give department wise maximum & minimum salary with department name.
	SELECT DEPARTMENT.DEPARTMENTNAME,MAX(SALARY),MIN(SALARY)
	FROM PERSON
	RIGHT OUTER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENTNAME

--3. Find all departments whose total salary is exceeding 100000.
	SELECT DEPARTMENT.DEPARTMENTNAME,SUM(SALARY) AS TOTALSALARY
	FROM PERSON 
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENTNAME
	HAVING SUM(SALARY)>100000

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT PERSONNAME,SALARY,DEPARTMENT.DEPARTMENTNAME 
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE CITY='JAMNAGAR'

--5. Find all persons who does not belongs to any department.
	SELECT PERSONNAME
	FROM PERSON
	WHERE DEPARTMENTID IS NULL	

--6. Find department wise person counts.
	SELECT COUNT(PERSONID) AS NO_OF_PERSON,DEPARTMENT.DEPARTMENTNAME
	FROM PERSON
	RIGHT OUTER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENTNAME

--7. Find average salary of person who belongs to Ahmedabad city.
	SELECT AVG(SALARY) AS AVERAGESALARY
	FROM PERSON
	WHERE CITY='AHMEDABAD'

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In single column)
	SELECT DEPARTMENT.DEPARTMENTNAME
	SELECT DISTINCT CITY FROM PERSON
	SELECT DEPARTMENT.DEPARTMENTNAME,COUNT(PERSONID) AS TOTAL_PERSON
	SELECT SUBSTRING(PERSONNAME,1,3)+RIGHT(CITY,3) AS PERSON_CITY_3_CHAR
	FROM PERSON

--14. Give 10% increment in Computer department employee�s salary.
	SELECT SALARY+SALARY*0.1 AS SALARY_INCREMENT_10PER 
	FROM PERSON
	INNER JOIN DEPARTMENT
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE DEPARTMENTNAME='COMPUTER'

--15. Display all the person name�s who�s joining dates difference with current date is more than 365 days.
	SELECT PERSONNAME 
	FROM PERSON
	WHERE DATEDIFF(DAY,GETDATE(),JOININGDATE)>365