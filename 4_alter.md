# Basics of MySql  
  
## Start mysql  
- start -> services.msc -> search mysql -> start (if stopped)  
  
## Create connection with mysql from cmd  
```cmd  
mysql -u root -p  
  
mysql --host ip --port 3306 -u root -p  
```  
  
## Create database  
```sql  
show databases;  
drop database if exists tutorial;  
create database tutorial;  
use tutorial;  
```  
  
## Create tables for school and insert data  
```sql  
-- Student table  
create table Students(  
	roll int primary key auto_increment,  
	name varchar(20),  
    class varchar(5),  
	marks int  
);  
  
  
-- Insert data in tables  
insert into Students(name) values('Ramesh'), ('Mahesh'), ('Suresh'), ('Mukesh');  
  
-- add email column  
alter table Students  
add column  
email varchar(50);  
  
-- Insert email data in tables  
insert into Students(name, email) values('Ram','Ram@123');  
  
-- add class_teacher  
alter table Students   
add column  
class_teacher varchar(40);  
```  
  
## Update data  
```sql  
update Students   
set class = '9B', marks=76, email='ramesh@123', class_teacher='Sudarshan'  
where roll = 1;  
  
update Students   
set class = '10C', marks=88, email='ram@123', class_teacher='Sudha'  
where roll = 5;  
  
  
-- change email column to contain unique data  
alter table Students  
modify column  
email varchar(50) unique;  
  
  
-- update marks with check  
  
ALTER TABLE Students  
ADD CONSTRAINT chk_valid_marks CHECK (marks BETWEEN 0 AND 100);  
```  
  
update Students  
set marks = 84  
where roll = 23;  
  
  
## Group by  
```sql  
select email from Students group by email  
having count(*) > 1  
;  
```  
