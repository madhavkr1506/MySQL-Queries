use db1;

set sql_safe_updates = 0;
create table tataEmp(empId varchar(12),name varchar(30), mobile bigint, state varchar(20), salary int);
insert into tataEmp values('1001','Madhav',9693744950,'Bihar',60000),('1002','Krishna',9693744951,'Assam',10000),('1003','Keshav',9693744952,'Maharastra',20000),('1004','Govind',9693744953,'Jharkhand',50000),('1005','Mohan',9693744954,'Telengna',70000),('1006','HariOm',9693744955,'Uttar Pradesh',40000),('1007','Shivam',1234567890,'Bihar',80000);

-- delete from tataEmp where name = 'Madhav'; 
-- delete from tataEmp;
select * from tataEmp;

create table infosysEmp(empId varchar(12),name varchar(30), mobile bigint, state varchar(20), salary int);

insert into infosysEmp values('2001','Madhavi',9693744950,'Bihar',60000),('2002','Radha',9693744951,'Assam',10000),('2003','Kavya',9693744952,'Maharastra',20000),('2004','Gopi',9693744953,'Jharkhand',50000),('2005','Suman',9693744954,'Telengna',70000),('2006','Gita',9693744955,'Uttar Pradesh',40000);

select * from infosysEmp;


select * from tataEmp where name = 'Madhav';

select count(state) from tataEmp;

select * from tataEmp where name='Madhav'
union 
select * from infosysEmp where name='Madhavi';

select count(name), state from tataEmp group by state;

show databases;

use performance_schema;

show tables;

use db1;
create table appleEmp(name varchar(20),address varchar(30),id int,salary int,state varchar(20),pincode int);

insert into appleEmp (name, address, id, salary, state, pincode)
values 
('John Doe', '123 Apple St, Cupertino', 101, 120000, 'California', 95014),
('Jane Smith', '456 Orange Ave, Seattle', 102, 110000, 'Washington', 98101),
('Alice Johnson', '789 Peach Blvd, Austin', 103, 100000, 'Texas', 73301),
('Bob Brown', '321 Cherry Ln, Miami', 104, 130000, 'Florida', 33101),
('Carol Davis', '654 Banana Rd, New York', 105, 90000, 'New York', 10001),
('David Wilson', '987 Grape Dr, Chicago', 106, 115000, 'Illinois', 60601),
('Eve White', '159 Plum Way, Denver', 107, 95000, 'Colorado', 80201),
('Frank Black', '753 Mango St, Boston', 108, 105000, 'Massachusetts', 02101),
('Grace Lee', '258 Lemon Ct, Phoenix', 109, 125000, 'Arizona', 85001),
('Henry Green', '852 Lime Ave, San Francisco', 110, 140000, 'California', 94101);

select * from appleEmp;

-- delete from appleEmp;

select avg(salary), state from appleEmp group by state;

select count(state), state from appleEmp group by state;







