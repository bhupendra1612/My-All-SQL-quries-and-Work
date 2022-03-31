# Data Manipulation Language(DML)
-- INSERT INTO… VALUES…
-- SELECT… FROM… 
-- UPDATE… SET… WHERE… 
-- DELETE FROM… WHERE…


1) INSERT statement: used to insert data into tables
2) SELECT statement: used to retrieve data from database objects, like tables 							 																				
3) UPDATE statement: allows you to renew existing data of your tables                                          
4) DELETE statement: functions similarly to the TRUNCATE statement  


# 1) INSERT statement
INSERT INTO shirts(color, article, shirt_size, last_worn) 
VALUES ('purple', 'polo shirt', 'medium', 50);

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4), ('Cindy', 'Maine Coon', 10), ('Dumbledore', 'Maine Coon', 11), ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13), ('George Michael', 'Ragdoll', 9), ('Jackson', 'Sphynx', 7);

INSERT INTO shirts(article, color, shirt_size, last_worn) 
VALUES ('t-shirt', 'white', 'S', 10), ('t-shirt', 'green', 'S', 200), ('polo shirt', 'black', 'M', 10), ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0), ('polo shirt', 'red', 'M', 5), ('tank top', 'white', 'S', 200), ('tank top', 'blue', 'M', 15);


# 2) SELECT statement:
SELECT database();
SELECT * FROM cats;
SELECT * FROM dogs;
SELECT age FROM cats; 
SELECT name, age FROM cats; 
SELECT cat_id, name, age FROM cats; 
SELECT cat_id, name, age, breed FROM cats; 
SELECT * FROM cats WHERE age=4; 
SELECT * FROM cats WHERE name='Egg'; 
SELECT name, age FROM cats WHERE breed='Tabby'; 
SELECT cat_id, age FROM cats WHERE cat_id=age; 


# 3) UPDATE statement:
update cats set name = 'Raj' where name = 'Ringo';
update cats set age = 20 where age = 10;
update cats set name = breed;
update cats set name = shirts.color where cats.name = shirts.color; 
update cats set name = 'ringo' where name = 'Tabby' returning name, breed;
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 
UPDATE cats SET age=14 WHERE name='Misty'; 
UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';


# 4) DELETE statement:
delete from cats where breed = 'Tabby';
delete from cats where age;
delete from cats where breed = 'Tabby' returning breed, name;
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE cat_id=age;
DELETE FROM cats;


