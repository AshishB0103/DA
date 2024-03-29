CREATE DATABASE ASSIGNMENT;

USE ASSIGNMENT;

-- *********************Database Name: HR1********************* 

-- 1. Display all information in the tables EMP and DEPT. 

/* JOINT METHOD IS USED TO INTERCONNECT BOTH EMPLOYEE AND DEPARTMENT TABLE SO THAT QUERY
REGARDING BOTH THE TABLES CAN BE RUN TOGETHER*/ 
SELECT * FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX ;

-- 2. Display only the hire date and employee name for each employee. 

-- ONLY EMPLOYEE NAME AND HIRE DATE IS REQUIRED FROM THE TABLE
SELECT EMP_HIREDATE, EMP_FIRSTNAME FROM EMPLOYEE;

/* 3. Display the ename concatenated with the job ID, separated by a 
comma and space and name the column Employee and Title */

-- HERE CONCAT_WS METHOD IS USED TO SEPARAT EMPLOYEE NAME AND JOB ID BY COMMA AND SPACE
SELECT EMP_FIRSTNAME ,EMP_JOB_TITLE, CONCAT_WS(", ",EMP_FIRSTNAME,
EMP_JOB_TITLE) AS EMPLOYEE_Deatail FROM EMPLOYEE; 

-- 4. Display the hire date, name and department number for all clerks.

SELECT EMP_HIREDATE ,EMP_FIRSTNAME, DEPT_NO, EMP_JOB_TITLE 
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX 
WHERE  EMP_JOB_TITLE  = "CLERK" ; /* WHERE METHOD IS USED TO DISPALY ONLY THOSE EMPLOYEES 
									 DETAILS WHO WORKS AS A CLERK*/

/* 5. Create a query to display all the data from the EMP table. Separate 
each column by a comma. Name the column THE OUTPUT */

/* HERE CONCAT_WS METHOD IS USED TO SEPARAT EACH COLUMN BY A COMMA AND ALIASES METHOD IS 
USED TO NAME THE COLUMN AS THE_OUTPUT*/

SELECT *, CONCAT_WS(",",EMP_ID, EMP_FIRSTNAME, EMP_LASTNAME, EMP_EMAIL, 
EMP_CONTACTNUMBER, EMP_BLOODGROUP, EMP_JOB_TITLE, EMP_JOB_ID, DEPARTMENT, 
EMP_AGE, EMP_GENDER, EMP_HIREDATE, EMP_DOJ, EMP_ADDRESS, EMP_CITY, 
EMP_POSTALCODE, EMP_COUNTRY, EMP_YEARSOFEXP, EMP_SALARY, 
EMP_COMMISSION_EARNED) AS THE_OUTPUT 
FROM EMPLOYEE;

/* 6. Display the names and salaries of all employees with 
a salary greater than 2000. */

SELECT EMP_FIRSTNAME, EMP_SALARY FROM EMPLOYEE 
WHERE EMP_SALARY > 2000 /* WHERE METHOD IS USED TO DISPALY ONLY THOSE EMPLOYEES 
						   DETAILS WHOES SALARY IS MORE THAN 2000*/
ORDER BY EMP_SALARY ASC;

/* 7. Display the names and dates of employees with the column headers 
"Name" and "Start Date" */

-- ALIASES METHOD IS USED TO NAME THE COLUMN AS F_NAME AND START_DATE

SELECT EMP_FIRSTNAME AS F_NAME , EMP_DOJ AS START_DATE FROM EMPLOYEE;

/* 8. Display the names and hire dates of all employees 
in the order they were hired. */

-- HERE ORDER BY FUNCTION IS USED TO SET HIRE DATE IN ASCENDING ORDER

SELECT EMP_FIRSTNAME, EMP_HIREDATE FROM EMPLOYEE ORDER BY EMP_HIREDATE ASC;

/* 9. Display the names and salaries of all employees in 
reverse salary order. */

-- HERE ORDER BY FUNCTION IS USED TO SET SALARY IN DESCENDING ORDER

SELECT EMP_FIRSTNAME, EMP_SALARY FROM EMPLOYEE ORDER BY EMP_SALARY DESC;

/* 10. Display 'ename" and "deptno" who are all earned commission and 
display salary in reverse order. */

/*WHERE FUNCTION IS USED SO THAT DETAILS OF EMPLOYEE WHO EARN COMMISSION ONLY GET PRINTED
AND ORDER BY IS USED TO SET SALARY IN DESCENDING ORDER*/

SELECT EMPLOYEE.EMP_FIRSTNAME,DEPARTMENT.DEPT_NO,
EMPLOYEE.EMP_COMMISSION_EARNED,EMPLOYEE.EMP_SALARY FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX 
WHERE EMPLOYEE.EMP_COMMISSION_EARNED != 0
GROUP BY EMPLOYEE.EMP_FIRSTNAME,DEPARTMENT.DEPT_NO,
EMPLOYEE.EMP_COMMISSION_EARNED,EMPLOYEE.EMP_SALARY
ORDER BY EMPLOYEE.EMP_SALARY DESC; 

/* 11. Display the last name and job title of 
all employees who do not have a manager */

-- WHERE NOT IS USED SO THAT EMPLOYEES WHOSE JOB TITLE IS NOT MANAGER WILL BE PRINTED

SELECT EMP_LASTNAME, EMP_JOB_TITLE FROM EMPLOYEE 
WHERE NOT EMP_JOB_TITLE ='Manager';

/*12. Display the last name, job, and salary for all employees whose job 
is sales representative or stock clerk and whose salary is not equal to
$2,500, $3,500, or $5,000*/

/* WHERE FUNCTION IS USED TO GET ONLY THOSE EMPLOYEES DETAILS WHO WORKS AS SALES RERESENTATIVE 
OR STOCK CLERK AND WHOSE SALARY IS NOT EQUAL TO $2,500, $3,500, or $5,000 */

SELECT EMP_LASTNAME, EMP_JOB_TITLE, EMP_SALARY FROM EMPLOYEE 
WHERE EMP_SALARY NOT IN(2500,3500,5000) AND 
(EMP_JOB_TITLE = 'sales representative' OR 'Stock clerk') ;



-- *********************Database Name: HR2********************* 


-- 1) Display the maximum, minimum and average salary and commission earned.

/*MAX,MIN AND AVG FUNCTION IS USED TO GET MAXIMUM,MINIMUM AND AVERAGE OF EMPLOYEES
SALARY AND COMMISSION*/

SELECT MAX(EMP_SALARY) Maximum_Salary, MIN(EMP_SALARY) Minimum_Salary,
AVG(EMP_SALARY) Average_Salary, MAX(EMP_COMMISSION_EARNED) Maximum_COMMISSION_EARNED, 
MIN(EMP_COMMISSION_EARNED) Minimum_COMMISSION_EARNED, 
AVG(EMP_COMMISSION_EARNED) Average_COMMISSION_EARNED FROM EMPLOYEE ; 

/*2) Display the department number, total salary payout and total commission 
payout for each department. */

/* SUM FUNCTION IS USED TO GET TOTAL SALARY AND COMMISSION PAYOUT DEPARTMENTWISE
WITH THE HELP OF GROUP BY FUNCTION*/

SELECT DEPARTMENT.DEPT_NO ,SUM(EMPLOYEE.EMP_SALARY) AS TOTAL_SALARY, 
SUM(EMPLOYEE.EMP_COMMISSION_EARNED) AS TOTAL_COMMISSION
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY DEPARTMENT.DEPT_NO ;

-- 3) Display the department number and number of employees in each department.

-- COUNT HELPS TO GET TOTAL EMPLOYEES IN EACH DEPARTMENT WITH THE HELP OF GROUP BY FUNCTION

SELECT DEPARTMENT.DEPT_NO, COUNT(DEPARTMENT.DEPT_NO) AS TOTAL_EMPLOYEES
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY DEPARTMENT.DEPT_NO;

/* 4) Display the department number and total salary of employees in each 
department.*/

-- SUM HELPS TO GET TOTAL SALARY OF EMPLOYEES IN EACH DEPARTMENT WITH THE HELP OF GROUP BY FUNCTION


SELECT DEPARTMENT.DEPT_NO ,SUM(EMPLOYEE.EMP_SALARY) AS TOTAL_SALARY
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY DEPARTMENT.DEPT_NO ;

/*5) Display the employee's name who doesn't earn a commission. 
Order the result set without using the column name */

-- WHERE IS USED TO DISPLAY ONLY THOSE EMPLOYEES NAME WHO DOESN'T EARN COMMISSION

SELECT EMP_FIRSTNAME, EMP_COMMISSION_EARNED AS " " FROM EMPLOYEE 
WHERE  EMP_COMMISSION_EARNED = 0 ;


/* 6) Display the employees name, department id and commission. 
If an Employee doesn't earn the commission, then display as 'No commission'. 
Name the columns appropriately */

/* CASE FUNCTION IS USED TO SET NO COMMISSION FOR THOSE EMPLOYEE WHO DOESN'T EARN COMMISION
AND COMMISSION AMOUNT WILL BE DISPLAYED FOR THOSE WHO EARN COMMISSION*/

SELECT EMPLOYEE.EMP_FIRSTNAME, DEPARTMENT.DEPT_ID,
CASE
    WHEN EMPLOYEE.EMP_COMMISSION_EARNED = 0 THEN "No commission"
    ELSE EMPLOYEE.EMP_COMMISSION_EARNED
END AS COMMISSION_EARNED
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX;

/* 7) Display the employee's name, salary and commission multiplied by 2. 
If an Employee doesn't earn the commission, then display as 'No commission. 
Name the columns appropriately */

/* CASE FUNCTION IS USED TO SET 2X COMMISSION FOR THOSE EMPLOYEE WHO EARN COMMISION
AND NO COMMISSION WILL BE DISPLAYED FOR THOSE EMPLOYEE WHO DOESN'T EARN COMMISION */

SELECT EMP_FIRSTNAME,EMP_SALARY,
CASE
    WHEN EMPLOYEE.EMP_COMMISSION_EARNED > 0 THEN 
    EMPLOYEE.EMP_COMMISSION_EARNED * 2
    ELSE 'No Commission'
END AS 2X_COMMISSION
FROM EMPLOYEE ;

/*8)Display the employee's name, department id who have the first name 
same as another employee in the same department */

/* GROUP BY WILL GROUP IT EMPLOYEES BY NAME AND COUNT FUNCTION WILL COUNT THAT HOW MANY TIMES
 EMPLOYEE NAME IS REPEATING AND WILL ONLY DISPLAY THOSE NAME WHICH ARE MORE THAN 1 TIME*/

SELECT EMPLOYEE.EMP_FIRSTNAME, DEPARTMENT.DEPARTMENT, DEPARTMENT.DEPT_ID
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY EMP_FIRSTNAME,DEPARTMENT,DEPT_ID
HAVING COUNT(*)>=2;

-- 9) Display the sum of salaries of the employees working under each Manager.

/* SUM IS USED TO CALCULATE TOTAL OF SALARIES WHERE JOB TITLE IS MANAGER*/

SELECT EMP_JOB_TITLE , SUM(EMP_SALARY) FROM EMPLOYEE
WHERE EMP_JOB_ID= "MG01" -- MG01 IS JOB ID FOR MANAGERS
GROUP BY EMP_JOB_TITLE;

/*10) Select the Managers name, the count of employees working under and 
the department ID of the manager.*/

SELECT EMPLOYEE.EMP_FIRSTNAME, COUNT(EMPLOYEE.EMP_JOB_ID) AS MANAGER 
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
WHERE EMPLOYEE.EMP_JOB_ID = "MG01"
GROUP BY EMPLOYEE.EMP_FIRSTNAME;

/*11) Select the employee name, department id, and the salary. Group the 
result with the manager name and the employee last name should have second 
letter 'a!*/

/* WHERE FUNCTION IS USED SO THAT ONLY THOSE EMPLOYEE DETAILS WILL WE DISPLAYED WHOSE
JOB TITLE IS MANAGER AND LAST NAME HAVE SECOND LETTER 'A' */

SELECT EMPLOYEE.EMP_FIRSTNAME,EMPLOYEE.EMP_LASTNAME,DEPARTMENT.DEPT_ID,
EMPLOYEE.EMP_SALARY FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
WHERE EMP_JOB_ID = "MG01" AND EMP_LASTNAME LIKE "_A%";

/*12) Display the average of sum of the salaries and group the result with 
the department id. Order the result with the department id.*/

/* AVG FUNCTION IS USED TO GET AVERAGE OF TOTAL AMOUNT OF SALARY WHICH IS GROUP BY 
DEPARTMENT ID */

SELECT DEPARTMENT.DEPT_ID ,AVG(EMPLOYEE.EMP_SALARY) AS AVG_SALARY
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY DEPARTMENT.DEPT_ID
ORDER BY DEPARTMENT.DEPT_ID;

#13) Select the maximum salary of each department along with the department id.

-- MAX FUNCTION IS USED TO DISPLAY MAXIMUM SALARY OF EACH DEPARTMENT

SELECT DEPARTMENT.DEPT_ID ,MAX(EMPLOYEE.EMP_SALARY) AS MAX_SALARY
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
GROUP BY DEPARTMENT.DEPT_ID;

/* 14) Display the commission, if not null display 10% of salary, 
if null display a default value 1 */

/*CASE FUNCTION IS USED TO SET 10% OF SALARY FOR THOSE EMPLOYEES WHO EARNS COMMISSION 
AND THOSE WHO DOESN'T EARN COMMISSION, THERE 1 WILL BE DISPLAYED*/

SELECT EMP_COMMISSION_EARNED,
CASE
    WHEN EMPLOYEE.EMP_COMMISSION_EARNED > 0 THEN 
    EMPLOYEE.EMP_SALARY * 10/100
	ELSE "1"
END AS COMMISSION
FROM EMPLOYEE ;

-- ***********************Database Name: HR3***************************

/*1. Write a query that displays the employee's last names only from the 
string's 2-5th position with the first letter capitalized and all other 
letters lowercase, Give each column an appropriate label.*/

-- UCASE IS USED TO UPPER CASE A VALUE AND MID IS USED TO GET INBETWEEN VALUES OF A STRING

SELECT EMP_LASTNAME,
CONCAT_WS("",UCASE(MID(EMP_LASTNAME,2,1)),MID(EMP_LASTNAME,3,4)) AS LASTNAME
from employee;

/*2. Write a query that displays the employee's first name and last name along 
with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. 
Also displays the month on which the employee has joined.*/

/* CONCAT_WS IS USED TO SET '-' IN BETWEEN EMPLOYEES FIRST AND LAST NAME WHEREAS 
MONTHNAME FUNCTION IS USED TO DISPLAY JOINING MONTH OF A EMPLOYEE*/

SELECT EMP_FIRSTNAME,EMP_LASTNAME,CONCAT_WS("-",EMP_FIRSTNAME,EMP_LASTNAME) 
AS FIRST_AND_LAST_NAME,MONTHNAME(EMP_DOJ) AS EMP_JOINING_MONTH
FROM EMPLOYEE;

/*3. Write a query to display the employee's last name and if half of the 
salary is greater than five thousand then increase the salary by 10% else by 
11.5% along with the bonus amount of 1500 each. Provide each column an 
appropriate label. */

/*CASE FUNCTION IS USED TO INCREASE SALARY BY 10% IF THE EMPLOYEE HALF OF THE SALARY IS
GREATER THAN 5000 ELSE BY 11.5% ALONG WITH THE BONUS OF 1500 FOR THOSE WHOES HALF OF THE 
SALARY IS NOT GREATER THAN 5000*/

SELECT EMP_FIRSTNAME,EMP_SALARY,
CASE
    WHEN EMPLOYEE.EMP_SALARY/2 > 5000 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 10/100)
	ELSE EMPLOYEE.EMP_SALARY+(EMP_SALARY * 11.5/100 +1500)
END AS "BONUS"
FROM EMPLOYEE ;

/*4. Display the employee ID by Appending two zeros after 2nd digit and 'E' 
in the end,department id, salary and the manager name all in Upper case, 
if the Manager name consists of 'z' replace it with '$! */

/* CONCAT IS USED TO ADD '00' AND 'E' IN BETWEEN A VALUE AND MID IS USED TO SET EXCAT 
POSITION WHERE '00' AND 'E' WILL BE ADDED WHEREAS REPLACE FUNCTION IS USED TO REPLACE
'Z' BY '$' FROM THE MANGER'S NAME*/ 

SELECT EMPLOYEE.EMP_ID,CONCAT(MID(EMPLOYEE.EMP_ID,1,2),"00",
MID(EMPLOYEE.EMP_ID,-1),"E") AS "EMPLOYEE ID", DEPARTMENT.DEPT_ID, 
EMPLOYEE.EMP_SALARY,
UCASE(REPLACE(EMPLOYEE.EMP_FIRSTNAME,"Z","$")) AS "MANAGER NAME" 
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX
WHERE EMPLOYEE.EMP_JOB_TITLE = "MANAGER";

/*5. Write a query that displays the employee's last names with the first
letter capitalized and all other letters lowercase, and the length of the
names, for all employees whose name starts with J, A, or M. Give each column
an appropriate label. Sort the results by the employees' last names */

/* UCASE IS USED TO UPPER CASE A VALUE AND LENGTH FUNCTION IS USED TO FIND LENGTH OF A 
VALUE MOREOVER WHERE LIKE FUNCTION WILL HELP TO DISPLAY ONLY THOSE EMPLOYEES NAME WHOSE
NAME STARTS WITH J,M OR A */

SELECT CONCAT_WS("",UCASE(MID(EMP_LASTNAME,1,1)),MID(EMP_LASTNAME,2,15)) AS 
LASTNAME, LENGTH(EMP_LASTNAME) AS LENGTH_OF_NAME 
from employee
WHERE EMP_LASTNAME LIKE "J%" OR 
EMP_LASTNAME LIKE "M%" OR 
EMP_LASTNAME LIKE "A%"
ORDER BY EMP_LASTNAME;

/* 6. Create a query to display the last name and salary for all employees. 
Format the salary to be 15 characters long, left-padded with $. 
Label the column SALARY */

-- LPAD FUNCTION IS USED TO SET '$' BEFORE SALARY AMOUNT TILL THE 15TH INDEX.

SELECT EMP_LASTNAME, LPAD(EMP_SALARY, 15, "$") AS SALARY
FROM EMPLOYEE;

-- 7. Display the employee's name if it is a palindrome.

SELECT EMP_FIRSTNAME,EMP_LASTNAME FROM EMPLOYEE;

-- 8. Display First names of all employees with initcaps.

SELECT EMP_FIRSTNAME FROM EMPLOYEE;

/* 9. From LOCATIONS table, extract the word between first and second space 
from the STREET ADDRESS column. */

-- SUBSTRING_INDEX IS USED TO DISPLAY VALUE AFTER THE FIRST SPACE FROM ADDRESS COLUMN

SELECT EMP_ADDRESS,SUBSTRING_INDEX(EMP_ADDRESS," ",2) FROM EMPLOYEE;

/* 10. Extract first letter from First Name column and append it with the 
Last Name. Also add "@systechusa.com" at the end. Name the column as 
e-mail address. All characters should be in lower case. 
Display this along with their First Name. */

/*MID FUNCTION IS USED TO SELECT EXCAT VALUES FROM A STRING USING INDEX NUMBER AND 
CONCAT IS USED TO JOIN @systechusa.com WITH THAT SELECTED VALUE*/

SELECT EMP_FIRSTNAME,
CONCAT(LCASE(MID(EMP_FIRSTNAME,1,1)),LCASE(EMP_LASTNAME),"@systechusa.com")
AS "e-mail address"
from employee;

/* 11. Display the names and job titles of all employees with the same job 
as Trenna. */

-- WHERE FUNCTION IS USED TO DISPLAY EMPLOYEES DETAILS WHO LIVES IN CITY TRENNA

SELECT EMP_FIRSTNAME, EMP_JOB_TITLE FROM EMPLOYEE WHERE EMP_CITY = "Trenna";

/* 12. Display the names and department name of all employees working 
in the same city as Trenna.*/

-- WHERE FUNCTION IS USED TO DISPLAY EMPLOYEES DETAILS WHO LIVES IN CITY TRENNA

SELECT EMP_FIRSTNAME, DEPARTMENT FROM EMPLOYEE WHERE EMP_CITY = "Trenna";

-- 13. Display the name of the employee whose salary is the lowest.

-- MIN FUNCTION IS USED TO DISPLAY MINIMUM SALARY OF AN EMPLOYEE

SELECT MIN(EMP_SALARY) FROM EMPLOYEE;
SELECT EMP_FIRSTNAME FROM EMPLOYEE WHERE EMP_SALARY = 1000;

-- 14. Display the names of all employees except the lowest paid.

/* MIN FUNCTION IS USED TO CHECK MINIMUM SALARY OF AN EMPLOYEE AND THEN WHERE FUNCTION IS 
USED DISPLAY THOSE EMPLOYEES DETAILS WHO EARN MORE THAN MINIMUM SALARY*/

SELECT MIN(EMP_SALARY) FROM EMPLOYEE;
SELECT EMP_FIRSTNAME FROM EMPLOYEE WHERE  EMP_SALARY > 1000 ;


-- *********************Database Name: HR4********************* 

/*1. Write a query to display the last name, department number, department name 
for all employees*/

/* JOINT METHOD IS USED TO INTERCONNECT BOTH EMPLOYEE AND DEPARTMENT TABLE SO THAT QUERY
REGARDING BOTH THE TABLES CAN BE RUN TOGETHER*/ 

use assignment;
SELECT EMPLOYEE.EMP_LASTNAME, DEPARTMENT.DEPT_NO, DEPARTMENT.DEPARTMENT AS "DEPT_NAME"
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX;

/*2. Create a unique list of all jobs that are in department 4. Include the 
location of the department in the output.*/

-- HERE ALL THE JOB TITLES WHICH ARE INCLUDED IN DEPARTMENT 4 ARE DISPLAYED ONLY ONCE

SELECT EMPLOYEE.EMP_JOB_TITLE, DEPARTMENT.DEPT_NO
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = DEPARTMENT.EMP_ID_DEPT_INDEX
WHERE DEPARTMENT.DEPT_NO = "4"
GROUP BY EMP_JOB_TITLE;

/*3. Write a query to display the employee last name,department name,
location id and city of all employees who earn commission.*/

/* HERE EMPLOYEE POSTALCODE IS NAMED AS LOCATION ID AND WHERE IS USED TO DISPLAY DETAILS OF
THOSE EMPLOYEES WHO EARN COMMISSION*/

SELECT EMPLOYEE.EMP_LASTNAME, DEPARTMENT.DEPARTMENT,EMPLOYEE.EMP_POSTALCODE AS 
"LOCATION ID",EMPLOYEE.EMP_CITY, EMPLOYEE.EMP_COMMISSION_EARNED
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
WHERE EMPLOYEE.EMP_COMMISSION_EARNED > 0;

/*4. Display the employee last name and department name of all employees 
who have an 'a' in their last name.*/

/* WHERE LIKE FUNCTION IS USED TO DISPLAY DETAILS OF ONLY THOSE EMPLOYEES WHO HAVE 'A'
IN THEIR LAST NAME*/

SELECT EMPLOYEE.EMP_ID,EMPLOYEE.EMP_LASTNAME, DEPARTMENT.DEPARTMENT
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
WHERE EMP_LASTNAME LIKE "%A%";

/*5. Write a query to display the last name,job,department number and 
department name for all employees who work in ATLANTA.*/

-- WHERE IS USED TO DISPLAY DETAILS OF ONLY THOSE EMPLOYEES WHO WORK IN ATLANTA

SELECT EMPLOYEE.EMP_LASTNAME,EMPLOYEE.EMP_JOB_TITLE,EMPLOYEE.EMP_CITY,
DEPARTMENT.DEPT_NO,DEPARTMENT.DEPARTMENT 
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
WHERE EMP_CITY = "ATLANTA";

/*6. Display the employee last name and employee number along with their manager's last
name and manager number.*/

/* HERE WE DON'T HAVE ANY SPECIFIC ROW FOR MANAGER SO WE HAD PRINT OUT EMPLOYEE LAST NAME AND
ID WHERE THE JOB TITLE IS MANAGER*/

SELECT EMP_LASTNAME,EMP_ID,EMP_JOB_TITLE,EMP_JOB_ID
FROM EMPLOYEE 
WHERE EMP_JOB_TITLE = "MANAGER";

/*7. Display the employee last name and employee number along with their manager's last
name and manager number (including the employees who have no manager).*/

/* HERE WE DON'T HAVE ANY SPECIFIC ROW FOR MANAGER SO WE HAD PRINT OUT EMPLOYEE LAST NAME AND
ID WHERE THE JOB TITLE IS  NOT A MANAGER*/

SELECT EMP_LASTNAME,EMP_ID,EMP_JOB_TITLE,EMP_JOB_ID
FROM EMPLOYEE 
WHERE EMP_JOB_TITLE != "MANAGER";

/*8. Create a query that displays employees last name,department number,and 
all the employees who work in the same department as a given employee.*/

SELECT EMPLOYEE.EMP_LASTNAME,DEPARTMENT.DEPT_NO,EMPLOYEE.DEPARTMENT
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
GROUP BY EMPLOYEE.DEPARTMENT,EMPLOYEE.EMP_LASTNAME,DEPARTMENT.DEPT_NO;

/*9. Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)*/

-- CASE FUNCTION IS USED TO SET GRADE BASED ON THE EMPLOYEE SALARY

SELECT EMPLOYEE.EMP_FIRSTNAME, EMPLOYEE.EMP_JOB_TITLE,DEPARTMENT.DEPARTMENT,EMPLOYEE.EMP_SALARY,
CASE
    WHEN EMPLOYEE.EMP_SALARY >= 5000 THEN "A GRADE"
    WHEN EMPLOYEE.EMP_SALARY >= 3000 THEN "B GRADE"
	ELSE "C GRADE"
END AS "GRADE"
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX;

/*10. Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date*/

/* HERE WE DON'T HAVE ANY SPECIFIC ROW FOR MANAGER SO WE DISPLAYED EMPLOYEES NAME AND HIRE DATE
WHO WORKS AS MANAGER */

SELECT EMP_FIRSTNAME "NAME", EMP_HIREDATE, EMP_JOB_TITLE
FROM EMPLOYEE
WHERE EMP_JOB_TITLE = "MANAGER";


-- *********************Database Name: HR5********************* 

/*1. Write a query to display the last name and hire date of any employee 
in the same department as SALES.*/

SELECT EMP_LASTNAME,EMP_HIREDATE FROM EMPLOYEE
WHERE DEPARTMENT = "SALES";

/*2. Create a query to display the employee numbers and last names of all 
employees who earn more than the average salary. Sort the results in 
ascending order of salary.*/

SELECT AVG(EMP_SALARY) FROM EMPLOYEE;
SELECT EMP_ID, EMP_LASTNAME,EMP_SALARY FROM EMPLOYEE
WHERE EMP_SALARY > 8360.5000
ORDER BY EMP_SALARY ASC;

/*3. Write a query that displays the employee numbers and last names of 
all employees who work in a department with any employee whose last name 
contains a 'U'*/

SELECT EMP_ID, EMP_LASTNAME,DEPARTMENT FROM EMPLOYEE
WHERE EMP_LASTNAME LIKE "%U%";

/*4. Display the last name, department number, and job ID of all employees 
whose department location is ATLANTA.*/

SELECT EMPLOYEE.EMP_LASTNAME,DEPARTMENT.DEPT_NO,EMPLOYEE.EMP_JOB_ID
FROM EMPLOYEE
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
WHERE EMP_CITY = "ATLANTA";

/*7. Modify the above query to display the employee numbers, last names, 
and salaries of all employees who earn more than the average salary and 
who work in a department with any employee with a 'u'in their name.*/

SELECT AVG(EMP_SALARY) FROM EMPLOYEE;
SELECT EMP_ID, EMP_LASTNAME,EMP_SALARY FROM EMPLOYEE
WHERE EMP_SALARY > 8360.5000 AND EMP_LASTNAME LIKE "%U%"
ORDER BY EMP_SALARY ASC;

/*8. Display the names of all employees whose job title is the same as 
anyone in the sales dept.*/

SELECT EMP_FIRSTNAME , EMP_JOB_TITLE, DEPARTMENT FROM EMPLOYEE
WHERE DEPARTMENT = "SALES";

/*9. Write a compound query to produce a list of employees showing raise 
percentages, employee IDs, and salaries. Employees in department 1 and 3 
are given a 5% raise,employees in department 2 are given a 10% raise, 
employees in departments 4 and 5 are given a 15% raise, and employees in 
department 6 are not given a raise.*/

SELECT EMPLOYEE.EMP_ID,EMPLOYEE.EMP_SALARY,DEPARTMENT.DEPT_NO,
CASE
    WHEN DEPARTMENT.DEPT_NO = 1 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 5/100)
    WHEN DEPARTMENT.DEPT_NO = 3 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 5/100)
    WHEN DEPARTMENT.DEPT_NO = 2 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 2/100)
    WHEN DEPARTMENT.DEPT_NO = 4 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 15/100)
    WHEN DEPARTMENT.DEPT_NO = 5 THEN 
    EMPLOYEE.EMP_SALARY + (EMP_SALARY * 15/100)
	ELSE EMPLOYEE.EMP_SALARY
END AS "RAISE PERCENTAGE"
FROM EMPLOYEE 
INNER JOIN DEPARTMENT 
ON EMPLOYEE.EMP_ID=EMP_ID_DEPT_INDEX
ORDER BY DEPARTMENT.DEPT_NO ASC;

/*10. Write a query to display the top three earners in the EMPLOYEES table. 
Display their last names and salaries.*/

SELECT EMP_LASTNAME, EMP_SALARY FROM EMPLOYEE
ORDER BY EMP_SALARY DESC
LIMIT 3;

/*11. Display the names of all employees with their salary and commission 
earned. Employees with a null commission should have O in the commission 
column*/

SELECT EMP_FIRSTNAME, EMP_SALARY,
CASE
    WHEN EMP_COMMISSION_EARNED IS NULL THEN "0"
    ELSE EMP_COMMISSION_EARNED
END AS COMMISSION_EARNED
FROM EMPLOYEE;

/*12. Display the Managers (name) with top three salaries along with their 
salaries and department information.*/

SELECT EMP_FIRSTNAME,EMP_JOB_TITLE,EMP_SALARY,DEPARTMENT FROM EMPLOYEE
WHERE EMP_JOB_TITLE = "MANAGER"
ORDER BY EMP_SALARY DESC
LIMIT 3;


-- ********************Database Name: Date Function********************* 

/*2) Format the hire date as mm/dd/yyyy(09/22/2003) and DATE OF JOINING as 
mon dd,yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)*/

SELECT EMP_FIRSTNAME,
CASE 
	WHEN EMP_HIREDATE = "1900-12-01" THEN "NULL"
    ELSE DATE_FORMAT(EMP_HIREDATE, "%m %d %Y")
END AS "HIRE DATE",
DATE_FORMAT(EMP_DOJ, "%M %D %Y") AS "DATE OF JOINING" FROM EMPLOYEE;

/*3) Calcuate experience of the employee till date in Years and months
(example 1 year and 3 months)*/

SELECT EMP_FIRSTNAME,CONCAT(floor((DATEDIFF(current_date(),EMP_DOJ)/365)),
" Year and ",floor((DATEDIFF(current_date(),EMP_DOJ)%365)/30)," Months") 
AS "EMPLOYEE EXPERIENCE" FROM EMPLOYEE;

-- 4) Display the count of days in the previous quarter

SELECT DAY( MAKEDATE(YEAR(CURDATE()), 1) 
+ INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 DAY )AS "NUMBER OF DAYS";




