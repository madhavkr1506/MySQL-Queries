create database db1;
use db1;
create table k22gmStudent(regNo int, name varchar(50),cgpa float,mobileNo bigint);
insert into k22gmStudent values(12213356,"Madhav",8.65,9693744950),(12213357,"Krishna",8.66,9693744951),(12213358,"Keshav",8.67,9693744952),(12213359,"Goviind",8.68,9693744953),(12213360,"Gopal",8.69,9693744954),(12213361,"Hari Om",8.70,9693744955);

select * from k22gmStudent;

create table k22zmStudent(regNo int, name varchar(50),cgpa float,mobileNo bigint);
insert into k22zmStudent values(22213356,"Madhavi",8.65,7693744950),(22213357,"Radha",8.66,7693744951),(22213358,"Sita",8.67,7693744952),(22213359,"Gita",8.68,7693744953),(22213360,"Gopi",8.69,7693744954),(22213361,"Sumati",8.70,7693744955);

select * from k22zmStudent;

select mobileNo,name from k22gmStudent
union
select mobileNo,name from k22zmStudent;

select * from k22gmStudent
union all
select * from k22zmStudent;





select * from k22gmStudent where name='Madhav'
union
select * from k22zmStudent where name='Madhavi';

select 'Boys' as type, name, mobileNo from k22gmStudent
union
select 'Girls' as type, name, mobileNo from k22zmStudent;

-- the union operator is used to combine the result set of two or more select statements.
-- every select statement within union must have same number of column.
-- the column must also have similar data types.
-- the column in every select statement must also be in same order.
-- the union operator select only distinct values by default. to allow duplicate values, use union all.
-- as type : it  is an alias. sql aliases are used to give a table or a column a temporary name. alias only exists for the duration of the query. 

