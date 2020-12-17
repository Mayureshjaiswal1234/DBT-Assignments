CREATE DATABASE assignment8;
use assignment8;
Create table EMP ( 
            EMPNO numeric(4) not null, 
            ENAME varchar(30) not null, 
            JOB varchar(10), MGR numeric(4), 
            HIREDATE date, 
            SAL numeric(7,2), 
            DNO numeric(2) ); 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );

-- que1
-- 1.	Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table by making use of a cursor.

DELIMITER $$
CREATE PROCEDURE DIS_NAME_SAL ()
BEGIN
DECLARE LOCALNM VARCHAR(20);
DECLARE LOCALSAL INT DEFAULT 0;
DECLARE ERR INT DEFAULT 0;
DECLARE NM_SL CURSOR FOR SELECT ENAME, SAL FROM EMP WHERE JOB="ANALYST";
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ERR=1;

OPEN NM_SL;
     TEST:LOOP
         FETCH NM_SL INTO LOCALNM,LOCALSAL;
         IF(ERR=1) THEN
           LEAVE TEST;
         END IF;
         SELECT LOCALNM, LOCALSAL;
     END  LOOP TEST;
CLOSE NM_SL;
END $$

CALL DIS_NAME_SAL();

-- 2.	Write a Procedure to display top 5 employees based on highest salary and display employee number, 
-- employee name and salary using Cursor.
DELIMITER //
CREATE PROCEDURE HIGH_SAL_5 ()
BEGIN 
DECLARE LLEMPNO INT;
DECLARE LLNM VARCHAR(10);
DECLARE LLSAL INT;
DECLARE PRESENT INT DEFAULT 0;

DECLARE ENO_NM_SAL CURSOR FOR SELECT EMPNO,ENAME, SAL FROM EMP ORDER BY SAL DESC LIMIT 5;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET PRESENT=1;
       
       OPEN ENO_NM_SAL;
          TEST:LOOP
              FETCH ENO_NM_SAL INTO LLEMPNO,LLNM,LLSAL;
              IF(PRESENT=1) THEN 
                LEAVE TEST;
              END IF;  
            SELECT LLEMPNO,LLNM,LLSAL;
          END LOOP TEST;
       CLOSE ENO_NM_SAL;
END //
CALL HIGH_SAL_5 ();

-- 3.	Write  a procedure to display the concatenated first_name 
-- and last_name from “emp” table using cursors handle the  errors with Exit handler

DELIMITER $$
CREATE PROCEDURE CONCAT_NM_JOB()
BEGIN
DECLARE LOCALNM VARCHAR(20);
DECLARE LOCALJOB VARCHAR(20);
DECLARE ERR VARCHAR(20);

DECLARE NM_JOB CURSOR FOR SELECT ENAME,JOB FROM EMP;
DECLARE EXIT HANDLER FOR NOT FOUND SET ERR="ERROR OCCURED";

OPEN NM_JOB;
        TEST:LOOP
            FETCH NM_JOB INTO LOCALNM,LOCALJOB;
            IF(ERR="ERROR OCCURED") THEN
              LEAVE TEST;
            END IF;  
            SELECT CONCAT(LOCALNM,' ',LOCALJOB);
        END LOOP TEST;
CLOSE NM_JOB; 
END $$
CALL CONCAT_NM_JOB();

-- 4.	Write a procedure which select all the data from 
-- employee table and display the data of employee where employee name is ‘Manish’ using cursors.
DELIMITER $$
CREATE PROCEDURE IND_ALL_DATA()
BEGIN
DECLARE LLEMPNO numeric(4) DEFAULT 0;
DECLARE LLENAME  varchar(30);
DECLARE LLJOB varchar(10);
DECLARE LLMGR numeric(4)  DEFAULT 0; 
DECLARE LLHIREDATE DATE;
DECLARE LLSAL numeric(7,2)  DEFAULT 0;
DECLARE LLDNO numeric(2)  DEFAULT 0;
DECLARE ERR INT  DEFAULT 0;

DECLARE ALL_DATA CURSOR FOR SELECT * FROM EMP WHERE ENAME="Manish";
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ERR=1;

OPEN ALL_DATA;
     TEST:LOOP
        FETCH ALL_DATA INTO LLEMPNO,LLENAME,LLJOB,LLMGR,LLHIREDATE,LLSAL,LLDNO;
        IF(ERR=1) THEN 
           LEAVE TEST;
		END IF;
        SELECT CONCAT(LLEMPNO," ",LLENAME," ",LLJOB," ",LLMGR," ",LLHIREDATE," ",LLSAL," ",LLDNO);
     END LOOP TEST;
CLOSE ALL_DATA;
END $$
CALL IND_ALL_DATA();

-- QUE5 5.	Write a procedure which select delete the data from employee table if emp sal is less than 10000  
-- using cursor and handle the  Sqlexception with continue handler
DELIMITER $$
CREATE PROCEDURE DELEMPNO_DATA()
BEGIN
DECLARE LLEMPNO numeric(4) DEFAULT 0;
DECLARE ERR INT  DEFAULT 0;

DECLARE DELEMPNO CURSOR FOR SELECT EMPNO FROM EMP WHERE SAL<10000;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ERR=1;

OPEN DELEMPNO;
     TEST:LOOP
        FETCH DELEMPNO  INTO LLEMPNO;
        IF(ERR=1) THEN 
           LEAVE TEST;
		END IF;
       DELETE FROM EMP WHERE EMPNO=LLEMPNO;
    END LOOP TEST;
CLOSE DELEMPNO;
END $$
CALL DELEMPNO_DATA();    -- DELETED ALL RECORDS BCZ ALL EMP HAVING SALARY LESS THAN 10000
SELECT * FROM EMP;