# Uses of Some Important Function 

# 1) Using Where 
SELECT lead_actor, primary_language FROM movies WHERE primary_language = 'Hindi';
SELECT * FROM movies WHERE origin ='USA';
SELECT * FROM movies WHERE rating_imd = 8;
SELECT * FROM movies WHERE rating_imd < 8;


# 2) Using CONCAT
SELECT CONCAT('Hello', 'World');
SELECT CONCAT('Hello', '...', 'World');
SELECT CONCAT(director, ' ', producer) FROM movies;
SELECT CONCAT(director, ' ', producer) AS 'full name' FROM movies;
SELECT CONCAT(film_name, '-', lead_actor, '-', director) FROM movies;
SELECT CONCAT_WS(' - ', film_name, lead_actor, director) FROM movies;
SELECT CONCAT_WS(' - ', film_name, lead_actor, director) as Full_name FROM movies;
SELECT CONCAT(film_name, ' was released in ', release_date) AS blurb FROM movies;
SELECT film_name AS movies, lead_actor AS actor, CONCAT(film_name, ' actor name is ', lead_actor) AS Detail FROM movies;
SELECT CONCAT(SUBSTRING(film_name, 1, 10), '...') AS 'short title', CONCAT(lead_actor, ', ',  director) AS name,
CONCAT('Total movie budget is ', budget ) AS quantity FROM movies;


# 3) Using SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);
SELECT SUBSTRING('Hello World', 3, 8);
SELECT SUBSTRING('Hello World', 3);
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTRING('Hello World', -7);
SELECT SUBSTRING('Hello World', -1, -4);
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTRING(film_name, 1, 10) FROM movies;
SELECT SUBSTRING(film_name, 1, 10) AS 'short title' FROM movies;
SELECT SUBSTR(film_name, 1, 10) AS 'short title' FROM movies;
SELECT CONCAT(SUBSTRING(film_name, 1, 10), '...') FROM movies;
SELECT CONCAT(SUBSTRING(film_name, 1, 10),'...') AS 'short title' FROM movies;
SELECT film_name, Lead_actor FROM movies WHERE SUBSTR(Lead_actor,1,1) = 'C' OR SUBSTR(Lead_actor,1,1) = 'S';
SELECT film_name, Lead_actor FROM movies WHERE SUBSTR(Lead_actor,1,1) IN ('C', 'S'); 


# 4) Using REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0');
SELECT REPLACE('HellO World', 'o', '*');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(film_name, 'e ', '3') FROM movies;
SELECT REPLACE(film_name, ' ', '->') AS title FROM movies; 
SELECT SUBSTRING(REPLACE(film_name, 'e', '3'), 1, 10) FROM movies;
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'movies'), ' ', '-'); 
SELECT SUBSTRING(REPLACE(film_name, 'e', '3'), 1, 10) AS 'weird string' FROM movies;


# 5) Using REVERSE
SELECT REVERSE('Hello World');
SELECT REVERSE('meow meow');
SELECT REVERSE(lead_actor) FROM movies;
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(lead_actor, REVERSE(lead_actor)) FROM movies;
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?')); 
SELECT film_name AS forwards, REVERSE(film_name) AS backwards FROM movies;


# 6) CHAR LENGTH
SELECT CHAR_LENGTH('Hello World');
SELECT film_name, CHAR_LENGTH(film_name) AS 'length' FROM movies;
SELECT CONCAT(film_name, ' is ', CHAR_LENGTH(film_name), ' characters long') as film_length FROM movies;


# 7) Using UPPER and LOWER
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE Movies IS ', UPPER(film_name)) FROM movies;
SELECT CONCAT('MY FAVORITE Movies IS ', LOWER(film_name)) FROM movies;
SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?')); 
SELECT CONCAT(UPPER(film_name), ' ', UPPER(lead_actor)) AS "full name in caps" FROM movies;


# 8) Using DISTINCT
SELECT DISTINCT Primary_language FROM movies;
SELECT DISTINCT CONCAT(producer,' ', director) FROM movies;
SELECT DISTINCT producer, director FROM movies;


# 9) Using ORDER BY
SELECT film_name FROM movies ORDER BY director;
SELECT film_name FROM movies ORDER BY film_name;
SELECT Lead_actor FROM movies ORDER BY Lead_actor DESC;
SELECT release_date FROM movies ORDER BY release_date;
SELECT release_date FROM movies ORDER BY release_date DESC;
SELECT release_date FROM movies ORDER BY release_date ASC;
SELECT film_name, release_date, Budget FROM movies ORDER BY release_date;
SELECT film_name, budget FROM movies ORDER BY release_date;
SELECT film_name, producer, director FROM movies ORDER BY 2;
SELECT film_name, producer, director FROM movies ORDER BY 3;
SELECT film_name, producer, director FROM movies ORDER BY 1;
SELECT film_name, producer, director FROM movies ORDER BY 1 DESC;
SELECT producer, director FROM movies ORDER BY producer, director;
SELECT CONCAT('MY FAVORITE movies IS ', UPPER(film_name)) AS Awsome FROM movies ORDER BY director;


#) 10) Using LIMIT
SELECT * FROM movies LIMIT 1;
SELECT film_name FROM movies LIMIT 3;
SELECT film_name FROM movies LIMIT 1;
SELECT film_name FROM movies LIMIT 10;
SELECT film_name FROM movies LIMIT 5, 123219476457;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 5;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 14;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 0,5;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 0,23;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 20,20;
SELECT film_name, release_date FROM movies ORDER BY release_date DESC LIMIT 10,4;
SELECT CONCAT(producer, ' ', Lead_actor) FROM movies ORDER BY Awards DESC LIMIT 1;
SELECT CONCAT(film_name, ' - ', release_date) AS summary FROM movies ORDER BY release_date DESC LIMIT 7; 


# 11) Using LIKE
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor LIKE '%ba%'; 
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor LIKE 'a%';
SELECT film_name, grarne FROM movies WHERE  grarne LIKE 'Action';
SELECT film_name FROM movies WHERE film_name LIKE '%t';
SELECT film_name, budget FROM movies WHERE budget LIKE '____'; 
SELECT film_name, budget FROM movies WHERE budget LIKE '__';
SELECT film_name, budget FROM movies WHERE budget LIKE '%';
SELECT film_name FROM movies WHERE film_name LIKE '%\%%';   
SELECT film_name FROM movies WHERE film_name LIKE '%\_%';    
SELECT film_name, budget FROM movies WHERE budget LIKE '%%%%';


# 12)  Using Count
SELECT COUNT(*) FROM movies;
SELECT COUNT(film_name) FROM movies; 
SELECT COUNT(DISTINCT Lead_actor) FROM movies; 
SELECT COUNT(DISTINCT producer) FROM movies;
SELECT COUNT(DISTINCT Lead_actor, producer) FROM movies;
SELECT release_date, COUNT(*) FROM movies GROUP BY release_date;
SELECT count(film_name) FROM movies WHERE film_name LIKE '%the%'; 
SELECT COUNT(*) FROM movies WHERE film_name LIKE '%the%';
SELECT producer, director, COUNT(*) FROM movies GROUP BY director, producer;
SELECT CONCAT('In ', release_date, ' ', COUNT(*), ' movies released') AS year FROM movies GROUP BY release_date;
SELECT CONCAT('In ', release_date, ' ', COUNT(*), ' movies released') AS year FROM movies GROUP BY release_date 
having release_date > 1/1/2015;


# 13) Using MIN and MAX Basics
SELECT MIN(release_date) FROM movies;
SELECT MAX(release_date) FROM movies;
SELECT MIN(Awards) FROM movies;
SELECT MAX(Awards) FROM movies;
SELECT MAX(Awards), film_name FROM movies;


# 14) Problem with Min and Max
SELECT * FROM movies WHERE Awards = (SELECT Min(Awards) FROM movies); 
SELECT film_name, Awards FROM movies WHERE Awards = (SELECT Max(Awards) FROM movies); 
SELECT film_name, Awards FROM movies WHERE Awards = (SELECT Min(Awards) FROM movies); 
SELECT producer, director, Min(release_date) FROM movies GROUP BY director, producer;
SELECT producer, director, Max(Awards) FROM movies GROUP BY director, producer;
SELECT CONCAT(producer, ' ', director) AS author, MAX(Awards) AS 'longest movies' , count(*) FROM movies
GROUP BY director, producer order by producer;
SELECT CONCAT(producer, ' ', Lead_actor) as promoter FROM movies WHERE Awards = (SELECT Max(Awards) FROM movies); 


# 15) Using Sum
SELECT SUM(Awards) FROM movies;
SELECT Sum(release_date) FROM movies;
SELECT SUM(Running_Time) FROM movies;
SELECT producer, director, Sum(Awards) FROM movies GROUP BY Lead_actor;
SELECT producer, director, Sum(release_date) FROM movies GROUP BY producer, Lead_actor; 
SELECT producer, director, Sum(release_date) FROM movies where release_date > 1/1/2015 group BY Lead_actor, director; 
SELECT producer, director, Sum(release_date) FROM movies group BY Lead_actor, director having sum(release_date) > 12/02/2015;
SELECT CONCAT(producer, ' ', Lead_actor) as full_names, sum(Awards) FROM movies GROUP BY producer order by sum(Awards) desc;   


# 16) Using Avg(Average)
SELECT AVG(release_date) FROM movies;
SELECT AVG(Awards) FROM movies;
SELECT round(AVG(Running_Time),2) FROM movies GROUP BY release_date;
SELECT AVG(release_date) FROM movies GROUP BY Lead_actor, producer;
SELECT release_date, AVG(release_date) FROM movies GROUP BY release_date;
SELECT producer, Lead_actor, AVG(Awards) FROM movies GROUP BY Lead_actor, producer;
SELECT producer, Lead_actor, AVG(release_date) FROM movies GROUP BY Lead_actor;
SELECT release_date AS year, COUNT(*) AS '# of MOVIES', AVG(Awards) AS 'avg awards' FROM movies GROUP BY release_date;
select release_date as date , count(release_date) as movies , avg(Awards) as avg_awards from movies
GROUP BY release_date order by release_date;

 
# 17) Using Not Equal
SELECT film_name FROM movies WHERE release_date = 6/29/2018;
SELECT film_name FROM movies WHERE release_date != 06/12/2017;
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor = 'Aamir Khan';
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor != 'Aamir Khan'; 
SELECT * FROM movies;


# 18) Using Like and Not Like
SELECT film_name FROM movies WHERE film_name LIKE 'D';
SELECT film_name FROM movies WHERE film_name LIKE 'W%';   
SELECT film_name FROM movies WHERE film_name LIKE '%W%'; 
SELECT film_name FROM movies WHERE film_name NOT LIKE '%W%'; 
SELECT film_name FROM movies WHERE film_name NOT LIKE 'W%';
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor LIKE 'C%' OR Lead_actor LIKE 'S%';   


# 19) Using Greater Than and Less Than
SELECT film_name, Awards FROM movies WHERE Awards >= 30; 
SELECT film_name, release_date FROM movies WHERE release_date > 10/2/2014 ORDER BY release_date;
SELECT film_name, release_date FROM movies WHERE release_date >= 1/1/2000 ORDER BY release_date; 
SELECT film_name, release_date FROM movies WHERE release_date < 2000;
SELECT film_name, release_date FROM movies WHERE release_date <= 2000; 
SELECT film_name, Lead_actor, release_date FROM movies WHERE release_date > 1/1/2010; 


# 20) Using AND
SELECT film_name, Lead_actor, release_date FROM movies WHERE Lead_actor='Aamir Khan' AND release_date > 12/23/2016;
SELECT * FROM movies WHERE Lead_actor ='Aamir Khan' AND release_date > 4/28/2017 AND film_name LIKE '%Khan%';
SELECT film_name, Lead_actor, release_date FROM movies WHERE Lead_actor = 'Aamir Khan' && release_date > 1/1/2017;


# 21) Using OR
SELECT film_name, Lead_actor, release_date FROM movies WHERE Lead_actor ='Aamir Khan' || release_date > 2010;
SELECT film_name, Lead_actor, release_date, Awards FROM movies WHERE  Lead_actor = 'Aamir Khan' || 
release_date > 2010 OR Awards > 100; 


# 22) Using Between
SELECT film_name, release_date FROM movies WHERE release_date >= 1/1/2010 && release_date <= 1/1/2015;
SELECT film_name, release_date FROM movies WHERE release_date BETWEEN 1/1/20012 AND 2015; 
SELECT film_name, release_date FROM movies WHERE release_date NOT BETWEEN 2004 AND 2015; 


# 23) Using In And Not In
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor='Aamir Khan' OR Lead_actor='Prabhas' OR Lead_actor='Salma Khan'; 
SELECT film_name, Lead_actor FROM movies WHERE Lead_actor IN ('Aamir Khan', 'Prabhas', 'Salma Khan'); 
SELECT film_name, release_date FROM movies WHERE release_date IN (2017, 2018);
SELECT film_name, release_date FROM movies WHERE release_date != 2000 AND release_date != 2002 AND release_date != 2004
AND release_date != 2006 AND release_date != 2008 AND release_date != 2010 AND release_date != 2012 AND
release_date != 2014 AND release_date != 2016;
SELECT film_name, release_date FROM movies WHERE release_date NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT film_name, release_date FROM movies WHERE release_date >= 2000 AND release_date NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016); 
SELECT film_name, release_date FROM movies WHERE release_date >= 2000 AND release_date % 2 != 0;
SELECT film_name, release_date FROM movies WHERE release_date >= 2000 AND release_date % 2 != 0 ORDER BY release_date;


# 24) Using Case Statements
SELECT film_name, release_date, 
CASE WHEN release_date >= 1/1/2015 THEN 'Modern movies' ELSE '20th Century movies' END AS movies_list FROM movies;

SELECT film_name, Awards, 
CASE WHEN Awards BETWEEN 0 AND 20 THEN '*' WHEN Awards BETWEEN 21 AND 40 THEN '**' ELSE '***' END AS Awards FROM movies;

SELECT film_name,
CASE WHEN Awards BETWEEN 0 AND 10 THEN '*' WHEN Awards BETWEEN 11 AND 31 THEN '**' ELSE '***' END AS Awards FROM movies;
 
SELECT film_name, Awards, 
CASE WHEN Awards BETWEEN 0 AND 30 THEN '*' WHEN Awards BETWEEN 51 AND 60 THEN '**' WHEN Awards BETWEEN 61 AND 70 THEN '***' 
ELSE '****' END AS Awards FROM movies;
 
SELECT film_name, Awards, 
CASE WHEN Awards <= 50 THEN '*' WHEN Awards <= 100 THEN '**' ELSE '***' END AS Awards FROM movies;

SELECT film_name, Lead_actor, 
CASE WHEN Grarne LIKE '%Action%' THEN 'Action_movies' WHEN Lead_actor = 'Salma Khan' OR Lead_actor = 'Aamir Khan' 
THEN 'Lead_actor' ELSE 'None' END AS report FROM movies;

SELECT film_name, Lead_actor, 
CASE film_name WHEN '%WAR%' THEN 'Short Stories' WHEN 'Just Kids' OR 'Aamir Khan' THEN 'Memoir' ELSE 'Novel' END AS TYPE FROM movies;

select Director, Lead_actor, 
case when count(Lead_actor) = 1 then 'singl actor' else CONCAT(COUNT(*), 'actor') end as COUNT from movies group by Lead_actor;


# 25) Using number 
SELECT 99 > 1;       -- True
SELECT 99 > 567;     -- False
SELECT 100 > 5;      -- True
SELECT 15 > 15;      -- False
SELECT 9 > -10;      -- True
SELECT 1 > 1 ;       -- False
SELECT 3 < -10;      -- False
SELECT -10 < -9;     -- True
SELECT 42 <= 42;     -- True
SELECT 1 < 5 && 7 = 9;           -- False
SELECT -10 > -20 && 0 <= 0;      -- True
SELECT -40 <= 0 AND 10 > 40;     -- False
SELECT 40 <= 100 || -2 > 0;      -- True
SELECT 10 > 5 || 5 = 5;          -- True
SELECT 10 != 10;                 -- False
SELECT 15 > 14 && 99 - 5 <= 94;  -- True


# 26) Using alphabates
SELECT 'a' > 'b';    -- False
SELECT 'a' < 'b';    -- True
SELECT 'A' > 'a';    -- False
SELECT 'A' >=  'a';  -- True
SELECT 'h' < 'p';    -- True
SELECT 'Q' <= 'q';   -- True
SELECT 'Q' > 'q';    -- False
SELECT 'Q' < 'q';    -- False


# 27) Using Alphabates and Numbers
SELECT 'A' > '1';    -- True 
SELECT 'A' >= '1';   -- True
SELECT 'A' = '1';    -- False
SELECT 'A' < '1';    -- False 
SELECT 54 <= 54 && 'a' = 'A';    -- True
SELECT 'a' = 5 || 3000 > 2000;   -- True
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;   -- True


