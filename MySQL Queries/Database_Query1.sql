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
insert into temp9 values(12213356,"Madhav","India",56100),(12213357,"Ram jee","India",66200),(12213358,"Sandeep","India",6300),(12213359,"Happy","India",20400);
insert into temp9 values(12213366,"Madhavi","Japan",15100),(12213367,"Ram kumar","South korea",50200),(12213368,"Sandeepa","Sweden",46300),(12213369,"sad","Denmark",30400);
insert into temp9 values(12213376,"Madhu","Japan",9100),(12213377,"Ramu","South korea",19200),(12213378,"Sanika","Sweden",25300),(12213379,"anguri","Denmark",52400);
select * from temp9;
select name from temp9;
select Id from temp9;
select country from temp9;
select salary from temp9;
select name,salary from temp9;
select distinct country from temp9;
select country="India" from temp9;
select country="Japan" from temp9;
drop table temp9;

-- where clause : To define some condition;
 select country, salary from temp9 where salary >=21000;
 select country, salary from temp9 where salary <21000;
 select * from temp9 where country="India" and salary>36000;
 
 /*
 using operator in the where clauses;
 arithmetic operators : +,-,*,/,%
 logical operators : and, or, not,in, between, all, like, any
 bitwise operators : &, |
 comparison operators : =, !=, >, >=, <, <=
 
 
 */
 
select * from temp9 where salary + 10000 > 30000;
select * from temp9 where salary = 56100;

select * from temp9 where salary between 29000 and 49000;  -- here 29000 and 49000 are inclusive;

select * from temp9 where country in("Japan","Sweden");
select * from temp9 where country not in ("Japan","Sweden");

-- limit clause; 
select * from temp9 limit 3; -- sets an upper limit on number of tupples(rows) to be returned;

select * from temp9 where country in("India") limit 3;

-- order by clause;
-- It will sort data in ascending order or descending order;
select * from temp9 order by country asc; 
select * from temp9 order by salary desc;

select * from temp9 order by salary desc limit 3;

/* 
aggregate function : 
It perform calculation on set of values, and return single value;
count(), max(),min(),avg(),sum()



 */

select max(salary) from temp9;
select min(salary) from temp9;
select avg(salary) from temp9;
select count(name) from temp9;
select sum(salary) from temp9;

/*
group by clause : 
it groups rows that have same values into summary rows;
it collects data from multiple records and groups the result by one or more column;

generally, we use group by with some aggregation function;

*/
select country,count(name) from temp9 group by country;
select country,max(salary) from temp9 group by country;

select country,avg(salary) from temp9 group by country order by country desc;
select country,avg(salary) from temp9 group by country order by avg(salary) desc;

select country,count(salary) from temp9 group by country;

/*
having clause : 
it is similar to where clause applies some condition on rows;
it is used when we want to apply any condition after grouping;


*/

create table temp10(id int primary key, name varchar(50),percentage int, grade char(1),city varchar(50));
insert into temp10 values (1,"john adam",91,"A","Patna");
insert into temp10 values (2,"adam john",81,"B","Patan");
insert into temp10 values (3,"johnny adam",71,"c","delhi");
insert into temp10 values (4,"adam johnny",86,"B","Patan");
insert into temp10 values (5,"johnathan adam",97,"A","Patna");
insert into temp10 values (6,"adam johnathan",85,"B","punjab");
insert into temp10 values (7,"josper adam",77,"C","punjab");
insert into temp10 values (8,"adam josper",61,"D","noida");
insert into temp10 values (9,"kamal",89,"B","patna");
insert into temp10 values (10,"kamala harris",89,"B","punjab");
insert into temp10 values (11,"harris",99,"A","haryana");

select * from temp10;
drop table temp10;
select grade ,count(id) from temp10 group by grade order by grade asc;
select city, count(id) from temp10 group by city having max(percentage) > 85;

/*
general order of commands : 
select
from
where
group by
having
order by
*/
select city from temp10 where grade in("A" ,"B") group by city having max(percentage) > 83 order by city desc; 


/*
Table related queries : 
update : to update existing rows;

by default : sql are are int safe mode. if we try to update any existing rows it will throw an error (error 1175). so, we have to off safe mode by writing these following command : 
set sql_safe_updates = 0; 

*/
set sql_safe_updates = 0;
update temp10 set grade = "O" where grade = "A";

update temp10 set grade = "P" where percentage > 95;

/*
delete command : 
to delete existing rows : 


*/

delete from temp10 where percentage < 65;

/*
revisiting foreign key : 

*/

create table course(course_code int primary key, course_name varchar(50));
drop table course;

create table faculty(id int primary key, name varchar(50), course_code int, foreign key(course_code) references course(course_code));
drop table faculty;
/*
cascading for foreign key : 
on delete cascade : when we create a foreign key using this option, it deletes the referencing rows int he child table
when the referenced row is deleted in the parent table which has a primary key;

on update cascade : when we create a foreign key using update cascade the referencing rows are updated in the child 
table when the referenced row is updated in the parent table which has a primary key;

*/

create table course(course_code int primary key, course_name varchar(50));
create table faculty(id int primary key,name varchar(50),course_code int, foreign key (course_code) references course(course_code) on delete cascade on update cascade);

insert into course values(101,"hindi"),(102,"english"),(103,"sanskrit");
select * from course;

update course set course_code=104 where course_code=103;

insert into faculty values(1001,"rahul",101),(1002,"rohit",102),(1003,"ronit",103),(1004,"raghu",101),(1005,"ravi",103);
select * from faculty;

/*
table related queries : 
alter : to change the schema;
add column
drop column
rename table
change --- rename
modify --- modify datatype and constraint
*/

alter table faculty add column age int;
alter table faculty drop column age;
alter table faculty rename to faculty_data;

drop table faculty_data;

alter table faculty change id faculty_id int;
alter table course change course_code course_id int;
alter table course modify course_id varchar(50);

-- deletion
delete from course where course_id="RK1001";
insert into course values("RK1001","programming");
select * from course;

/*
truncate table : 
it will delete all table's data;


*/
truncate table course;

/*
joins in sql : 
join is used to combine rows from two or more tables, based on a related column between them;
types of join :
1. inner join : returns records that have matching values in both tables;

2. outer join : 
 a. left join --> returns all records from the left table, and the matched records from the right table;
 b. right join --> returns all records from the right table, and the matched records from the left table;
 c. full join  --> returns all records when there is a match in either left or right table;
 --> left join union right join;
 
left exclusive join
right exclusive join
self join : it is a regular join but the table is joined with itself;
*/

create table stud(id int , name varchar(50));
create table cou(id int , course varchar(50));
insert into stud values(101,"adam"),(102,"bob"),(103,"casey"); 
insert into cou values(102,"english"),(105,"math"),(103,"science"),(107,"computer science");
-- inner join
select * from stud inner join cou on stud.id = cou.id;
select * from stud as s inner join cou as c on s.id = c.id;
-- left join
select * from stud left join cou on stud.id = cou.id;
-- right join
select * from stud right join cou on stud.id = cou.id;
-- full join : 
select * from stud left join cou on stud.id = cou.id union select * from stud right join cou on stud.id = cou.id;
-- left exclusive join :  
select * from stud left join cou on stud.id = cou.id where cou.id is null;
-- right exclusive join : 
select * from stud right join cou on stud.id = cou.id where stud.id is null;


create table emp(id int , name varchar(50),m_id int);
insert into emp values(101,"adam",103),(102,"bob",104),(103,"casey",null),(104,"donald",103);
select * from emp;
-- self join
select a.name as manager_name, b.name from emp as a join emp as b on a.id = b.m_id;

/*
union : 
it is used to combine the result set of two or more select statements;
it gives unique records;

to use it :
every select should have same no of column;
columns must have similar data types;
columns in every select should be in same order;


*/
select name from emp union select name from emp;  
select name from emp union all select name from emp;

/*
sql sub queries : 
a subquery or inner query or a nested query is a query within another sql query;
it involves two select statements;


*/
create table marks(id int , name varchar(50),mar int);
insert into marks values (101,"anil",78),(102,"bhumika",93),(103,"chetan",85),(104,"dhruv",96),(105,"emanual",92),(106,"farah",82);
select * from marks;
drop table marks;
select avg(mar) from marks;
select name, mar from marks where mar > 87.667;
select name, mar from marks where mar > (select avg(mar) from marks);  -- it is dynamic in nature;

select id,name from marks where id % 2 = 0;
select id, name from marks where id in (select id from marks where id % 2 = 0);

alter table marks add column city varchar(50);
update marks set city = "pune" where id = 101;
update marks set city = "mumbai" where id in (102,103);
update marks set city = "delhi" where id in (104,105,106);

select * from marks where city = "delhi";
select max(mar) from(select * from marks where city = "delhi") as temp;
select max(mar) from marks where city = "mumbai";


