create database assignment_2;
use assignment_2;
create table publisher(p_name varchar(50),p_phone numeric(10),p_email varchar(50));
insert into publisher values('Romeo','9595048292','mayur@gmail.com');
insert into publisher values('Juliet','1234567890','abcd@gmail.com');
INSERT INTO publisher VALUES ('TATA MCGRAW-HILL','9133333322','bddhqid@.com');
INSERT INTO publisher VALUES ('TECHMEDIA','5115161611','BOOKS@TECHMEDIA.COM');
select * from publisher;

create table Authors(a_name varchar(50),phone numeric(10));
insert into Authors values('Spartan','9595048292');
insert into Authors values('Alkred','1234567890');
insert into Authors values('STEPHEN WALTHER','232322333');
select * from Authors;

create table Titles(titleid varchar(50),title varchar(10),pubdate date);
insert into Titles values(1,'Satyam','2020-10-8');
insert into Titles values(2,'Shivam','2020-09-7');
alter table Titles add price int (10);
INSERT INTO Titles VALUES (1001,'ASP','12-04-02',540);
INSERT INTO Titles VALUES (1002,'ORCL','1-05-05',575);
INSERT INTO Titles VALUES (1003,'MSTR','3-02-05',475);
INSERT INTO Titles VALUES (1004,'JAVA','3-04-05',499);
INSERT INTO Titles VALUES (1005,'VB.NET','15-06-05',450);
select * from Titles;

create table titleauthors(auid numeric(2),titleid int(1),importance int(10));
insert into titleauthors values('01','4','500');
insert into titleauthors values('02','5','600');
select * from titleauthors;

create table SUBJECTS (SUBID varchar(5)PRIMARY KEY,SNAME varchar(30));
INSERT INTO SUBJECTS VALUES ('ORA','ORACLE DATABASE 10g');
INSERT INTO SUBJECTS VALUES ('JAVA','JAVA LANGUAGE');
INSERT INTO SUBJECTS VALUES ('JEE','JAVA ENTEPRISE EDITION');
INSERT INTO SUBJECTS VALUES ('VB','VISUAL BASIC.NET');
INSERT INTO SUBJECTS VALUES ('ASP','ASP.NET');

select SNAME from SUBJECTS where SNAME='ORACLE DATABASE 10g';
select SNAME from SUBJECTS where SNAME like 'J%';
select SNAME from SUBJECTS where SNAME like '%.NET%';
select a_name from Authors where a_name like '%ER';
select p_name from publisher where p_name like '%HILL%';

select title from titles where price < 500;
select title from titles where pubdate < '3-04-05';
desc SUBJECTS ;
select SNAME from SUBJECTS where SUBID ='JAVA' or SUBID= 'jee' ;
desc authors;
select * from titles where titleid=1005 or price>400;

select * from publisher where p_name=('TECHMEDIA');

select avg(importance) from titleauthors;
select max(price) from titles;
select count(*) from authors;

CREATE TABLE EMP(EMP_ID INT NOT NULL UNIQUE ,EMP_NAME CHAR(50));
INSERT INTO EMP VALUES(101,"MAYUR");
INSERT INTO EMP VALUES(102,"SANKET"); 
INSERT INTO EMP VALUES(103,"VARSHA");
INSERT INTO EMP VALUES(104,"ROSHANI");
ALTER TABLE EMP ADD DEPT_ID INT NOT NULL;
ALTER TABLE EMP MODIFY EMP_NAME VARCHAR(20);
SELECT * FROM EMP;
 UPDATE EMP  SET EMP_NAME="MAYURESH" WHERE EMP_ID=101;

SELECT * FROM EMP;
TRUNCATE TABLE EMP;
CREATE TABLE EMPLOYEE11(EMP_ID INT NOT NULL UNIQUE ,EMP_NAME CHAR(50) ,SALARY FLOAT(7,3));

insert into EMPLOYEE11 values(101,"MAYUR",1234.57);
insert into EMPLOYEE11 values(102,"SANKET",1530.57);
insert into EMPLOYEE11 values(103,"DIPIKA",1652.76);
insert into EMPLOYEE11 values(104,"ROSHANI",1775.15);

TRUNCATE TABLE EMPLOYEE1;

SELECT * FROM EMPLOYEE11;

SELECT ROUND(1234.57, 2) AS EMPLOYEE11;

SELECT ROUND(1234.567,2) AS EMPLOYEE11;

SELECT CEIL(1530.57) AS EMPLOYEE11;
SELECT CEIL(1652.76) AS EMPLOYEE11;

SELECT CEILING(1775.15) AS EMOLOYEE11;
SELECT CEILING(1652.786) AS EMOLOYEE11;

SELECT FLOOR(1775.15) AS EMOLOYEE11;
SELECT FLOOR(1652.786) AS EMOLOYEE11;

SELECT SIGN(15);
SELECT SIGN(-15);

SELECT 17 MOD 5;

SELECT SQRT(25);

SELECT POWER(4,-2);
SELECT POWER(4,2);

SELECT CHAR_LENGTH("CDAC JUHU") AS LengthOfString;
SELECT CONCAT("CDAC ", "JUHU" ) AS ConcatenatedString;

SELECT CURDATE();
SELECT CURTIME();