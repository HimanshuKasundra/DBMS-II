-----------LAB-2------------
CREATE DATABASE EMPLOYEE_INFO

CREATE TABLE EMPLOYEE_INFO
(EID INT,
ENAME VARCHAR(100),
GENDER VARCHAR(10),
JOININGDATE DATETIME,
SALARY DECIMAL(8,2),
CITY VARCHAR(100))

INSERT INTO EMPLOYEE_INFO VALUES 
(1,'NICK','MALE','2013-01-01',4000,'LONDON'),
(2,'JULIAN','FEMALE','2014-10-01',3000,'NEW YORK'),
(3,'ROY','MALE','2016-06-01',3500,'LONDON'),
(4,'TOM','MALE',NULL,4500,'LONDON'),
(5,'JERRY','MALE','2013-02-01',2800,'SYDNEY'),
(6,'PHILIP','MALE','2015-01-01',7000,'NEW YORK'),
(7,'SARA','FEMALE','2017-08-17',4800,'SYDNEY'),
(8,'EMILY','FEMALE','2015-01-01',5500,'NEW YORK'),
(9,'MICHAEL','MALE',NULL,6500,'LONDON'),
(10,'JOHN','MALE','2015-01-01',8800,'LONDON')

--PR_EMPLOYEE_INFO_SELECT
	ALTER PROC PR_EMPLOYEE_INFO_SELECT
	AS
	BEGIN
	SELECT * FROM EMPMASTER
	END

--PR_EMPLOYEE_INFO_INSERT 11,'KISHAN','MALE','2014-02-02',150000,'RAJKOT' 
	ALTER PROC PR_EMPLOYEE_INFO_INSERT
	@EID			INT,
	@FIRSTNAME		VARCHAR(100),
	@GENDER			VARCHAR(10),
	@JOININGDATE	DATETIME,
	@SALARY			DECIMAL(8,2),
	@CITY			VARCHAR(100)

	AS
	BEGIN
	INSERT INTO EMPMASTER
	(
		EID,		
		FIRSTNAME,	
		GENDER,		
		JOININGDATE,
		SALARY,		
		CITY		
	)
	VALUES(
		@EID,		
		@FIRSTNAME	,	
		@GENDER,		
		@JOININGDATE,
		@SALARY	,	
		@CITY		
	)
	END

--PR_EMPMASTER_UPDATE 11,'LILA','MALE','2020-02-02',200000,'BARODA'
	ALTER PROC PR_EMPMASTER_UPDATE
	@EID			INT,
	@FIRSTNAME		VARCHAR(100),
	@GENDER			VARCHAR(10),
	@JOININGDATE	DATETIME,
	@SALARY			DECIMAL(8,2),
	@CITY			VARCHAR(100)

	AS
	BEGIN
	UPDATE EMPMASTER SET
	EID=@EID,FIRSTNAME=@FIRSTNAME,GENDER=@GENDER,JOININGDATE=@JOININGDATE,SALARY=@SALARY,CITY=@CITY
	WHERE EID=@EID
	END

--PR_EMPMASTER_DELETE 11
	ALTER PROC PR_EMPMASTER_DELETE
	@EID			INT
	AS
	BEGIN
	DELETE FROM EMPMASTER
	WHERE EID=@EID
	END

--1. Display all the employees whose name starts with “m” and 4 th character is “h”
	SELECT * FROM EMPLOYEE_INFO WHERE ENAME LIKE 'M__H%'

--2. Find the value of 3 raised to 5. Label the column as output.
	SELECT POWER(3,5) AS OUTPUT

--3. Write a query to subtract 20 days from the current date.
	SELECT GETDATE() -20

--4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
	SELECT ENAME FROM EMPLOYEE_INFO WHERE ENAME LIKE 'J%' AND ENAME LIKE '%N%'

--5. Display 2nd to 9th character of the given string “SQL Programming”.
	SELECT SUBSTRING('SQL PROGRAMMING',2,9)

--6. Display name of the employees whose city name ends with “ney” &contains six characters.
	SELECT ENAME FROM EMPLOYEE_INFO WHERE CITY LIKE '___NEY'

--7. Write a query to convert value 15 to string.
	SELECT CONVERT(VARCHAR(10),15)

--8. Add department column with varchar (20) to Employee table.
	ALTER TABLE EMPLOYEE_INFO ADD DEPARTMENT VARCHAR(20)

--9. Set the value of department to Marketing who belongs to London city.
	UPDATE EMPLOYEE_INFO SET DEPARTMENT='MARKETING' WHERE CITY='LONDON'

	PR_EMPLOYEE_INFO_SELECT


--10. Display all the employees whose name ends with either “n” or “y”.
	SELECT * FROM EMPLOYEE_INFO WHERE ENAME LIKE '%[N,Y]'

--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
	SELECT CEILING(63.1),CEILING(63.8),CEILING(-63.2)

--12. Display all employees whose joining date is not available.
	SELECT * FROM EMPLOYEE_INFO WHERE JOININGDATE IS NULL

--13. Display name of the employees in capital letters and city in small letters.
	SELECT UPPER(ENAME),LOWER(CITY) FROM EMPLOYEE_INFO

--14. Change the data type of Ename from varchar (30) to char (30).
	ALTER TABLE EMPLOYEE_INFO ALTER COLUMN ENAME CHAR(30)

--15. Display city wise maximum salary.
	SELECT CITY,MAX(SALARY) FROM EMPLOYEE_INFO
	GROUP BY CITY

--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
	SELECT ENAME+'WORKS AT '+CITY+'AND EARNS '+CONVERT(VARCHAR(10),SALARY) FROM EMPLOYEE_INFO

--17. Find total number of employees whose salary is more than 5000.
	SELECT COUNT(EID) AS TOTAL_EMPLOYEE FROM EMPLOYEE_INFO WHERE SALARY>5000

--18. Write a query to display first 4 & last 3 characters of all the employees.
	SELECT LEFT(ENAME,4),RIGHT(RTRIM(ENAME),3) 
	FROM EMPLOYEE_INFO

--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
	SELECT CITY,SUM(SALARY) 
	FROM EMPLOYEE_INFO 
	WHERE JOININGDATE>'2014-01-01' 
	GROUP BY CITY 
	HAVING SUM(SALARY)>15000

--20. Write a query to replace “u” with “oo” in Ename.	SELECT REPLACE(ENAME,'U','OO') AS UPDATE_ENAME FROM EMPLOYEE_INFO	PR_EMPLOYEE_INFO_SELECT--21. Display city with average salaries and total number of employees belongs to each city.	
	SELECT CITY,AVG(SALARY),COUNT(EID) 
	FROM EMPLOYEE_INFO
	GROUP BY CITY 

--22. Display total salaries paid to female employees.
	SELECT GENDER,SUM(SALARY)
	FROM EMPLOYEE_INFO
	WHERE GENDER='FEMALE' 
	GROUP BY GENDER

--23. Display name of the employees and their experience in years.
	SELECT ENAME,DATEDIFF(YEAR,JOININGDATE,GETDATE()) 
	FROM EMPLOYEE_INFO

--24. Remove column department from employee table.
	ALTER TABLE EMPLOYEE_INFO DROP COLUMN DEPARTMENT

--25. Update the value of city from SYDNEY to null.
	UPDATE EMPLOYEE_INFO SET CITY=NULL WHERE CITY='SYDNEY'

--26. Retrieve all Employee name, Salary & Joining date.
	SELECT ENAME,SALARY,JOININGDATE
	FROM EMPLOYEE_INFO

--27. Find out combine length of Ename & Gender.
	SELECT LEN(ENAME)+LEN(GENDER)
	FROM EMPLOYEE_INFO

--28. Find the difference between highest & lowest salary.	SELECT MAX(SALARY)-MIN(SALARY) 	FROM EMPLOYEE_INFO--29. Rename a column from Ename to FirstName.	SP_RENAME 'EMPLOYEE_INFO.ENAME','FIRSTNAME','COLUMN'	PR_EMPLOYEE_INFO_SELECT--30. Rename a table from Employee to EmpMaster.
	SP_RENAME 'EMPLOYEE_INFO','EMPMASTER'