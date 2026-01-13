create database tproject;
use tproject;

CREATE TABLE DEPT (
    Deptno INT(2) NOT NULL DEFAULT 0,
    Dname VARCHAR(14),
    Loc VARCHAR(13),
    PRIMARY KEY (Deptno)
);

CREATE TABLE EMP (
    Empno INT(4) NOT NULL DEFAULT 0,
    Ename VARCHAR(10),
    Job VARCHAR(9),
    Mgr INT(4),
    Hiredate DATE,
    Sal DECIMAL(7,2),
    Comm DECIMAL(7,2),
    Deptno INT(2),
    PRIMARY KEY (Empno),
    FOREIGN KEY (Deptno) REFERENCES DEPT(Deptno)
);

CREATE TABLE STUDENT (
    Rno INT(2) NOT NULL DEFAULT 0,
    Sname VARCHAR(14),
    City VARCHAR(20),
    State VARCHAR(20),
    PRIMARY KEY (Rno)
);

CREATE TABLE EMP_LOG (
    Emp_id INT(5) NOT NULL,
    Log_date DATE,
    New_salary INT(10),
    Action VARCHAR(20)
);

INSERT INTO DEPT (Deptno, Dname, Loc) VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP (Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, Deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-08-09', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);


#1. Select unique job from EMP table.
select distinct job from emp;  

#2. List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP
ORDER BY Deptno ASC, Job DESC;

#3. Display all the unique job groups in the descending order?
select distinct job from emp
order by job desc;

#4. List the emps who joined before 1981.
select ename from emp
where hiredate < 1980-12-31;
#5. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select empno, ename, sum(sal*12) as annsal from emp
group by empno, ename
order by annsal asc;

#6. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
select empno, ename, sal from emp
where mgr = 7369;

select*from emp;


#7. Display all the details of the emps who’s Comm. Is more than their Sal?
select * from emp where comm > sal;

#8. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * from emp
where job =  "CLERK" or job ='ANALYST'
order by job desc;


#9. List the emps Who Annual sal ranging from 22000 and 45000.
select ename,
       empno,
       sum(sal *12) as annsal
from emp
group by ename, empno
having annsal between 22000 and 45000;

#10. List the Enames those are starting with ‘S’ and with five characters.
select ename 
from emp
where ename like 'S%';


#11. List the emps whose Empno not starting with digit78.
select * from emp
where empno not like '78%';

#12. List all the Clerks of Deptno 20.
select ename , job, deptno from emp 
where deptno = 20 And job = 'CLERK';

#13. List the Emps who are senior to their own MGRS.
select e.ename as employee,
	   e.hiredate ,
       m.ename as managers,
       m.hiredate
from emp e
join emp m
on e.empno = m.mgr
where e.hiredate > m.hiredate;


#14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10.
SELECT * FROM EMP 
WHERE Deptno = 20 
AND Job IN (SELECT DISTINCT Job FROM EMP WHERE Deptno = 10);

#15. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal.
select * from emp
where sal = (select sal from emp where ename in('FORD', 'SMITH'));


#16. List the  whose jobs same as SMITH or ALLEN.
SELECT * FROM EMP
WHERE job = (select job from emp where ename in('smith','allen'));

#17 Any jobs of deptno 10 those that are not found in deptno 20.
SELECT DISTINCT job
FROM emp
WHERE deptno = 10 AND job NOT IN (SELECT DISTINCT job FROM emp WHERE deptno = 20);

#18. Find the highest sal of EMP table.
select max(sal) from emp;

#19. Find details of highest paid employee.
select * from emp
where sal = 5000;

# 20. Find the total sal given to the MGR.
select sum(sal) from emp 
where job = 'manager';

#List the emps whose names contains ‘A’.
select * from emp 
where ename like '%A%';

#22. Find all the emps who earn the minimum Salary for each job wise in ascending order.
select distinct job , min(sal) as min_sal from emp
group by job
order by min_sal  asc;

#23. List the emps whose sal greater than Blake’s sal.
select * from emp
where sal > (select sal from emp where ename = 'blake');

#24. Create view v1 to select ename, job, dname, loc whose deptno are same.
create view v1 AS
select e.ename ,
       e.job,
       d.dname,
       d.loc
from emp e
left join dept d 
on e.deptno = d.deptno;

select * from v1;

#25. Create a procedure with dno as input parameter to fetch ename and dname
delimiter $$
create procedure input(in x int)
begin
     SELECT e.ename, d.dname
    FROM emp e 
    left join dept d
    on e.deptno = d.deptno 
    where d.deptno = x;
end $$
delimiter ;
call input(10);

#26. Add column Pin with bigint data type in table student.
ALTER TABLE student
ADD pin BIGINT;

#27. Modify the student table to change the sname length from 14 to 40.
#Create trigger to insert data in emp_log table whenever any update of sal
#in EMP table. You can set action as ‘New Salary’.
ALTER TABLE student MODIFY sname VARCHAR(40);
DELIMITER $$ 
CREATE TRIGGER New_Sal
after update on emp
FOR EACH row
BEGIN
    IF OLD.sal != NEW.sal THEN
        INSERT INTO emp_log (empno, old_sal, new_sal, action)
        VALUES (OLD.empno, OLD.sal, NEW.sal, 'New Salary');
	end if;
end $$
delimiter ;


    
    
    
    

