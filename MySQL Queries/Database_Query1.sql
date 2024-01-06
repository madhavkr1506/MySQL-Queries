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
*/