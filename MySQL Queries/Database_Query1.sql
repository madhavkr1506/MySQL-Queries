-- sql is not a case sensitive language:
-- This is for database creation:
CREATE DATABASE database1;
-- this is for database deletion:
DROP DATABASE database1;
-- To perfrom action in the database1 we have to use "USE databseName" command:
USE database1; 
-- Table creation:
CREATE TABLE student(Reg_ID INT PRIMARY KEY,Name VARCHAR(50),Age INT NOT NULL);
INSERT INTO student VALUES(12213356,"Madhav",20);
INSERT INTO student VALUES(12213357,"Khushi",19);
INSERT INTO student VALUES(12213358,"Ram jee",21),(12213359,"Happy",22),(12213360,"Sandeep",23);
-- Lets take a view of student table: 
SELECT * from student;

/*
sql datatypes:
Signed and Unsigned

TINYINT unsigned(0 to 255)
TINYINT (-128 to 127)

Types of sql commands :
1. data definition language : create, alter, rename, truncate and drop
2. data query language : select
3. data manipulation language : insert, delete, update
4. data control language : grant and revoke permission to the users
5. transaction control language : start transaction, commit, rollback and savepoint


*/

-- Create database using "if not exist databaseName" command:
create database if not exists student; -- It will create a database name student:
create database if not exists database1; -- It will throw a warning because database1 is already created:

-- Delete database using "if exist databaseName" command:
drop database if exists student;  -- It will successfully delete the database:
drop database if exists superman; -- It will throw an error because there is no database named as superman:

-- show databases and tables:
show databases;
show tables;

/*
table related queries:
create : define table scheme(design);
drop : drop table;
select and view all columns : select * from table_name;
insert : insert data into table;

*/


create database Adani_Group;
create table employee(Id int primary key,Name varchar(50),salary int);
insert into employee values(1,"adam",25000),(2,"bob",30000),(3,"casey",40000);
select * from employee;



/*
keys : 
1. primary key : it should be not null;
there is only 1 primary key in a table.
it is a column or set of columns in a table that unniquely identifies each row;
2. foreign key : it can have duplicate and null values;
there can be multiple foreign keys;
it is a column or set of columns in a table that refers to the primary key of another table;

constraints : sql constraints are used to specifies rules for data in a table;
1. not null : columns cannot have null values;
2. unique : all values in column are different;
3. primary key : make a column unique and not null used only for one;
4. foreign key : prevent actions that would destroy links between tables;
5. default : set the default value of a column;  eg : salary int default 25000;
6. check : it can limit the values allowed in the column;
*/


create table temp1(Id int unique);
insert into temp1 values(101);
-- insert into temp1 values(101); It will throw an error because it is a duplicate entry;
select * from temp1;

-- different syntax for using primary key; 
create table temp2 (Id int ,name varchar(50),primary key(id));
create table temp3(Id int, name varchar(50),primary key(id,name));

-- syntax for foreign key; 
create table temp4 (Id int,foreign key(Id) references temp2(Id));
drop table temp4;
create table temp5(Id int , foreign key(Id) references temp3(Id));

-- syntax for default; 
create table temp6(Id int, salary int default 25000);
insert into temp6 values (12213356,30000);
insert into temp6 (Id) values (12213356);
-- insert into temp6 values (12213356,30000),(12213356);  It will throw an error;
select * from temp6;

-- syntax for check;
create table temp7(Id int primary key,city varchar(50),age int,constraint age_check check(age >=18 and city ="patna"));
insert into temp7 values (12213356,"patna",20);
-- insert into temp7 values (12213357,"up",17); It will throw an error because constraint is violated;
select * from temp7;

create table temp8(age int check (age >= 18));

-- select command : It is used to select any data from the database;
create table temp9(Id int ,name varchar(50),country varchar(50),salary int, primary key(Id));
insert into temp9 values(12213356,"Madhav","India",56100),(12213357,"Ram jee","India",56200),(12213358,"Sandeep","India",56300),(12213359,"Happy","India",56400);
select * from temp9;
select name from temp9;
select Id from temp9;
select country from temp9;
select salary from temp9;
select name,salary from temp9;









