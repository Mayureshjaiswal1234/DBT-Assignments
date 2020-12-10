create database sql_ass1;
use sql_ass1;
Create table EMP 
( EMPNO numeric(4) not null, 
ENAME varchar(30) not null, 
JOB varchar(10), MGR numeric(4), 
HIREDATE date, SAL numeric(7,2), 
DEPTNO numeric(2) ); 
select * from EMP;

Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );

Create table dept (dno numeric(4) not null, dname varchar(10) not null,area varchar(30));
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');
select * from dept

=========QUE-1================================
delimiter $$
create procedure que1(IN VAL1 INT, IN VAL2 INT)
begin
select val1 + val2;
select val1 - val2;
select val1 * val2;
select val1 / val2;
end $$
call que1 (10,20);
end $$

========QUE-2==========
delimiter $$
CREATE PROCEDURE que2(INOUT STR VARCHAR(10))
BEGIN
SET STR=(SELECT REVERSE(STR));
END $$
SET @STR='DATABASE';
CALL que2(@STR);
SELECT @STR AS REV;

========QUE-3===========
delimiter $$
CREATE PROCEDURE que3()
BEGIN
SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC LIMIT 5;
END $$
CALL que3();

========QUE-4===========
delimiter $$
create procedure que4()
begin
create table emp_test(emp_id int,ename varchar(20),ejoining_date date);
end $$
call que4; 

==========QUE-5=============
delimiter $$
create procedure que5()
begin 
insert into dept(dno,dname,area)values(60,'education','pune');
end $$
call que5;
select * from dept;

==========QUE-6============
delimiter $$
create procedure que6( in value int ,out squr int,out cube int)
begin 
declare val1 int ;
set val1=value;
set squr = power(val1,2);
set cube = power(val1,3);
end;$$

call que6(2,@sqr,@cube);
select @sqr;
select @cube;

=========QUE-7===========
delimiter $$
create procedure que7(out ans int)
begin
declare num int;
set num = 2;
select num into ans;
end $$
call que7(@ans);
select @ans;

=========QUE-8=========
delimiter $$
create procedure que8(IN X INT,OUT STR VARCHAR(50))
begin
select concat(E.ENAME,' IS FROM ',D.DNAME) INTO STR  FROM EMP E INNER JOIN DEPT D ON D.DNO=E.DEPTNO WHERE E.DEPTNO=X AND E.EMPNO=1004;
end $$
call que8(10,@STR);
select @STR;


