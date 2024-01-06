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


