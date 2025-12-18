CREATE TABLE salesman (
    salesman_id   INT PRIMARY KEY,
    name  VARCHAR(100),
    city  VARCHAR(100),
    commission DECIMAL(4,2)
);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE cust(
    customer_id   INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade  INT,
    salesman_id  INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO cust(customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


CREATE TABLE orders (
    ord_no   INT PRIMARY KEY,
    purch_amt  DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id  INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29,  '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5007);

CREATE TABLE emp_details (
    emp_idno     INT PRIMARY KEY,
    emp_fname    VARCHAR(100),
    emp_lname    VARCHAR(100),
    emp_dept     INT
);

INSERT INTO emp_details (emp_idno, emp_fname, emp_lname, emp_dept) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);




CREATE TABLE item_mast (
    pro_id     INT PRIMARY KEY,
    pro_name   VARCHAR(100),
    pro_price  DECIMAL(10,2),
    pro_com    INT
);

INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) VALUES
(101, 'Motherboard', 3200.00, 15),
(102, 'Keyboard', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);


/*1. write a SQL query to find customers who are either from the city 'NewYork' or
who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id*/

select customer_id, cust_name, city, grade, salesman_id from cust
WHERE city = 'new york'OR grade >100;

/*2 . write a SQL query to find all the customers in ‘New York’ city
 who have a gradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id.*/
select customer_id, cust_name, city, grade, salesman_id from cust
WHERE city = 'new york'AND grade >100;

/*Write a SQL query that displays order number, purchase amount, and the
achieved and unachieved percentage (%) for those orders that exceed 50%of thetarget value of 6000.*/
select ord_no,
 purch_amt,
 purch_amt,
 round((purch_amt /6000) * 100, 2) as achieved_percentage,
 round(100 - (purch_amt /6000) * 100, 2) as unachieved_percentage
 from orders;

/*write a SQL query to calculate the total purchase amount of all orders
. Returntotal purchase amount.*/
select purch_amt from orders;
select sum(purch_amt)
from orders;

/*write a SQL query to find the highest purchase amount ordered by each customer.
 Return customer ID, maximum purchase amount*/
 
select
 cust.customer_id,
 cust.cust_name,
 max(orders.purch_amt)
 from cust
 left join orders 
 on cust.customer_id = orders.customer_id 
 GROUP BY cust.customer_id,
          cust.cust_name ;
          
/*write a SQL query to calculate the average product price. Return average product
price.*/
select avg(pro_price) from item_mast;


 
 CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(150),
    age  INT,
    department VARCHAR(100),
    salary  DECIMAL(10,2),
    joining_date  DATE
);

INSERT INTO employees (name, age, department, salary, joining_date) VALUES
('Alice Johnson', 30, 'HR', 60000, '2019-05-15'),
('Bob Smith', 40, 'IT', 80000, '2015-08-20'),
('Charlie Brown', 35, 'Finance', 75000, '2018-11-30'),
('David White', 28, 'IT', 72000, '2021-01-10'),
('Emma Wilson', 32, 'Marketing', 65000, '2017-03-25'),
('Franklin Adams', 45, 'Finance', 90000, '2010-07-12'),
('Grace Lee', 29, 'HR', 58000, '2020-06-05'),
('Henry Ford', 50, 'IT', 95000, '2008-12-15'),
('Isabella Martinez', 38, 'Marketing', 70000, '2016-09-18'),
('Jack Carter', 27, 'Finance', 68000, '2022-04-10');

/*write a SQL query to find those employees whose department is located at ‘Toronto’.
 Return first name, last name, employee ID, job ID*/
 select*from locations;
 select employees.first_name, 
        employees.last_name, 
        employees.employee_id, 
        employees.job_id 
from employees
join departments
on employees.department_id = departments.department_id
join locations
on departments.location_id = locations.location_id
where locations.city = 'Toronto';


SELECT 
    e.first_name, 
    e.last_name, 
    e.employee_id, 
    e.job_id
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    l.city = 'Toronto';


/*8. write a SQL query to find those employees whose salary is lower than that of
employees whose job title is "MK_MAN". Exclude employees of the Jobtitle‘MK_MAN’. 
Return employee ID, first name, last name, job ID.*/
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees WHERE job_id = 'MK_MAN')
AND job_id <> 'MK_MAN';


#9. write a SQL query to find all those employees who work in department ID80or40. 
#Return first name, last name, department number and department name.

select e.first_name,
	   e.last_name, 
       d.department_id,
       d.department_name
from employees e
left join departments d
on d.department_id = e.department_id
where d.department_id = 80 OR d.department_id = 40;


/*10.write a SQL query to calculate the average salary, the number of employees
receiving commissions in that department. Return department name, averagesalary 
and number of employees.*/ 
select* from employees;
select 
     d.department_name,
	 avg(e.salary) as avg_salary,
     count(e.commission_pct)
from employees e
left join departments d
on d.department_id = e.department_id
group by d.department_name;

/*11.write a SQL query to find out which employees have the same designations 
theemployee whose ID is 169. Return first name, last name, department IDandjobID.*/
select e.first_name,
       e.last_name,
       e.department_id,
       e.job_id
from employees e
where job_id = (select job_id from employees where employee_id = 169);


#12.write a SQL query to find those employees who earn more than the averagesalary. Return employee ID, first name, last name. 
select 
     e.employee_id,
     e.first_name,
     e.last_name
from employees e
where salary > (select avg(salary) from employees );

/*13.write a SQL query to find all those employees who work in the Finance department. 
Return department ID, name (first), job ID and department name. */
select 
     d.department_id,
     e.first_name,
     e.job_id,
     d.department_name
	from employees e
    left join departments d
    on d.department_id = e.department_id
    where d.department_name = 'Finance';


/*14. From the following table, write a SQL query to find the employees whoearnlessthan the employee of ID 182. 
Return first name, last name and salary. */
select first_name, last_name, salary from employees
where salary< (select salary from employees where employee_id = 182);

#15.Create a stored procedure CountEmployeesByDept that returns the number of employees in each department
select* from departments;
delimiter $$
create procedure countemployeesbydept()
begin 
    select
        d.department_name ,
        COUNT(e.employee_id) as total_employees
    from employees e
    left join departments d
    on e.department_id= d.department_id
    group by  d.department_name ;
end $$
delimiter ;
call countemployeesbydept();

#16.Create a stored procedure AddNewEmployee that adds a new employee tothedatabase. 
delimiter $$
CREATE PROCEDURE AddNewEmployee(
    IN p_employee_id INT,
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_job_id VARCHAR(10),
    IN p_salary DECIMAL(10, 2),
    IN p_department_id INT
)
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email, job_id, salary, department_id, hire_date)
    VALUES (p_employee_id,p_first_name, p_last_name, p_email, p_job_id, p_salary, p_department_id, CURRENT_DATE());
END $$
delimiter ;
call addnewemployee(45,'vrushti', 'shah', 'abc@gmail.com', 'data', 45000, 38)


#17.Create a stored procedure DeleteEmployeesByDept that removes all employeesfrom a specific department
Delimiter $$
CREATE PROCEDURE DeleteEmployeesByDept(IN dept_id INT)
BEGIN
    DELETE FROM employees 
    WHERE department_id = dept_id;
END $$
delimiter ;

call DeleteEmployeesByDept(25);


#18.Create a stored procedure GetTopPaidEmployees that retrieves the
# highest-paidemployee in each department. 
delimiter $$
CREATE PROCEDURE gettoppaidemployees(in x varchar(30))
BEGIN
   select e.first_name,
          d.department_name,
          max(e.salary)
   FROM employees e
   left join departments d
   on e.department_id = d.department_id
   where  d.department_name = x
   group by e.first_name,
          d.department_name;
END $$
delimiter ;
call gettoppaidemployees('finance');
#19.Create a stored procedure PromoteEmployee that increases an employee’s salaryand changes their job role. 
#DROP PROCEDURE promoteemployee;
delimiter $$
create procedure promoteemployee(IN X  INT ,in y varchar(20), in z int)
begin 
update employees
set 
job_id =y,
    salary = z
WHERE EMPLOYEE_ID = X;
end $$
delimiter ;
call promoteemployee(100,"AC_ACCOUNT", 10);
	
select* from employees;
#20.Create a stored procedure AssignManagerToDepartment that assigns a newmanager to all employees in a specific department
use vrushti;
delimiter  $$
create procedure Assignmanagertodept(in x int, in y int , in z int)
begin
update employees
set manager_id = x,
	 department_id = y
where employee_id = z;
end $$
delimiter ;
call assignmanagertodept(102,60,101);
	
