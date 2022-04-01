# Important Data and Time Fuction

# 1) Creating Our DATE data
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Harry',curdate(), curtime(), now()); 
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Marry',curtime(), now(), curdate());  


# 2) Current Date and Time Formate
select curdate();
select curtime();
select now();
select curdate();
select current_date();
select current_time();
select current_timestamp();  -- Important


# 3) find day, week, month
select dayofweek(now());
SELECT dayofweek(curdate());
select dayname(now());
select monthname(now());


# 4) Using Date_formate
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') as Age FROM people;  -- important
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') as Age  FROM people;    -- important
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') as Age  FROM people;  -- important
SELECT DATE_FORMAT(now(), '%W');
SELECT DATE_FORMAT(now(), '%w') + 1;
SELECT DATE_FORMAT(curdate(), '%m/%d/%Y');  
SELECT DATE_FORMAT(now(), '%M %D at %h:%i'); 


# 5) Using Date Extract
select extract(year from created_at) from users;    -- Important
select extract(quarter from created_at) from users;
select extract(month from created_at) from users;   -- Important
select extract(week from created_at) from users;
select extract(day from created_at) from users;   -- Important


# 6) Using Date Interval
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) as Age FROM people;  -- important
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) as Age FROM people;  -- important
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) as Age FROM people;  -- important
SELECT birthdt, birthdt + INTERVAL 1 MONTH as Age FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH as Age FROM people;  -- important
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR as Age FROM people; -- important


# 7) Using Dateiff
SELECT DATEDIFF(NOW(), birthdate) as DATEDIFF FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) as Age FROM people;


# 8) Using & Retrieve Date and Time 
SELECT name, birthtime, minute(birthtime) FROM people;
SELECT name, birthtime, hour(birthtime) FROM people; 
select id, username, day(created_at) from users;
select id, username, week(created_at) from users;
select id, username, month(created_at) from users;
select id, username, year(created_at) from users;

 
# 9) Formatting Dates
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
SELECT name, birthdate, MONTHNAME(birthdt) FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT name, birthdate, DAYOFMONTH(birthdate) FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people; 

select id, username, dayname(created_at) from users;
select id, username, monthname(created_at) from users;
select id, username, dayofweek(created_at) from users;
select id, username, dayofmonth(created_at) from users;
select id, username, dayofyear(created_at) from users;
select id, username, weekofyear(created_at) from users;
select id, username, weekday(created_at) from users;
select id, username, yearweek(created_at) from users;

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) as Age FROM people;  -- important






















