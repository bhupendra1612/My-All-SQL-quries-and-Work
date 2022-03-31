# Data Definition Language (DDL) Statement
-- CREATE 
-- ALTER 
-- DROP 
-- RENAME 
-- TRUNCATE


1) CREATE statement:  used for creating entire databases and database objects as tables
2) ALTER statement: used when altering existing objects
3) DROP statement: used for deleting a database object
4) RENAME statement: allows you to rename an object 
5) TRUNCATE statement: Instead of deleting an entire table through DROP, we can also remove its data and continue to 
					   have the table as an object in the database;


# 1) CREATE statement:
CREATE DATABASE Movies;
CREATE TABLE animal(name VARCHAR(20) DEFAULT 'no name provided', age INT DEFAULT 20);
CREATE TABLE students(name VARCHAR(20) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 00);
CREATE TABLE books (book_id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100), price INT, PRIMARY KEY (book_id));
CREATE TABLE comments3 (content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW());
CREATE TABLE inventory (item_name VARCHAR(100), price DECIMAL(8,2), quantity INT);

CREATE TABLE Items (name CHAR(5), current_status VARCHAR(10), price DECIMAL(5,2), number_id FLOAT, 
created_at TIMESTAMP DEFAULT NOW(), changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE employees (id INT AUTO_INCREMENT NOT NULL, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL,
middle_name VARCHAR(255), age INT NOT NULL, current_status VARCHAR(255) NOT NULL DEFAULT 'employed', PRIMARY KEY(id));

CREATE TABLE students (id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255)
NOT NULL, middle_name VARCHAR(255), age INT NOT NULL, current_class VARCHAR(255) NOT NULL DEFAULT 'employed');

create table example (id int auto_increment primary key, age smallint check (age>21), parent_age bigint
check (parent_age > 50));

create table employee (emp_id serial primary key, first_name char(50) not null, last_name varchar(100) unique 
not null, birthdate date check (birthdate > '2000-01-01'), hire_date datetime check (hire_date > '2010-01-01 23:12:34'),
salary integer check (salary > 10000)); 

CREATE TABLE Movies (movies_id INT NOT NULL AUTO_INCREMENT, film_name VARCHAR(100) not null, Lead_actor
VARCHAR(100) not null , Grarne varchar(250),origin char(25), Director VARCHAR(100), Producer varchar(100), Production_company varchar(200),
Distrubuted_by varchar(100), Primary_language char(25) default 'hindi', release_date date, Running_Time int, Budget char(25), India_Gross char(50),
Worldwide_gross char(50), Rating_imd int, Total_Review char(25), Awards int);
 
 
# 2) ALTER statement: 
alter table cats rename to dogs;
alter table animal rename column breed to breed_name;
alter table books alter column name set not null ;  
alter table students alter column name drop not null ;  


# 3) DROP statement:
alter table dogs drop column age;
DROP TABLE animals;
DROP DATABASE IF EXISTS book_shop;


# 4) RENAME statement:
alter table dogs rename column breed to breed_name;


# 5) TRUNCATE statement:
truncate books;

 
# Some useful Command 
use Movies;
show databases;
show tables; 
show table status;
show columns FROM Movies_list;
SHOW WARNINGS; 
DESC Movies_list;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
