create database assignment_7;   -- trigger ---
use assignment_7;

CREATE TABLE  Ord_master(Ord_no INT primary KEY, Cust_cd VARCHAR(20),Status CHAR);
CREATE TABLE  Ord_dtl(Ord_no INT,Prod_cd VARCHAR(50),Qty INT3,CONSTRAINT FK foreign key(Ord_no) references Ord_master(Ord_no));
CREATE TABLE  Prod_master( Prod_cd varchar(20) primary KEY,Prod_name VARCHAR(20), Qty_in_stock INT4,Booked_qty INT4);
insert into Ord_master values(1,'C1','P');
insert into Ord_dtl values(1,'P1',100),(1,'P2',200);
insert into Prod_master values('P1','Floppies',10000,1000),('P2','Printers',5000,600),('P3','Modems',3000,200);
-- SELECT * FROM Ord_master;
SELECT * FROM Ord_dtl;
SELECT * FROM Prod_master;


delimiter ##
create trigger QUE1  before insert on Ord_dtl for each row
begin
UPDATE Prod_master SET Booked_qty=Booked_qty + NEW.Qty WHERE  Prod_cd=NEW.Prod_cd;
end ##
insert into Ord_dtl values(1,'P3',400);
show triggers;
delete from Ord_dtl where Prod_cd='P3';


delimiter ##
create trigger QUE1  before insert on Ord_dtl for each row
begin
UPDATE Prod_master SET Booked_qty=Booked_qty + NEW.Qty WHERE  Prod_cd=NEW.Prod_cd;
end ##
insert into Ord_dtl values(1,'P3',400);
show triggers;
delete from Ord_dtl where Prod_cd='P3';

 -- Write a after Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
-- Booked_qty in Prod_mastershould be decreased accordingly.

delimiter ##
create trigger QUE11  after  insert on Ord_dtl for each row
begin
UPDATE Prod_master SET Booked_qty=Booked_qty + old.Qty WHERE  Prod_cd=old.Prod_cd;
end ##
insert into Ord_dtl values(1,'P3',400);
show triggers;
delete from Ord_dtl where Prod_cd='P3';
