# SQL GitHub One to Many Relationship

# 1) Create tables and Insert into values
CREATE TABLE customers(id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), 
email VARCHAR(100));

CREATE TABLE orders(id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT,
FOREIGN KEY(customer_id) REFERENCES customers(id));

CREATE TABLE customers2(id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), 
email VARCHAR(100));

CREATE TABLE orders2(id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT); 

CREATE TABLE papers (title VARCHAR(100), grade INT, student_id INT, FOREIGN KEY (student_id) 
REFERENCES students(id) ON DELETE CASCADE);   

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),('George', 'Michael', 'gm@gmail.com'), ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'), ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),('2017/11/11', 35.50, 1),('2014/12/12', 800.67, 2),('2015/01/03', 12.50, 2),('1999/04/11', 450.25, 5);

INSERT INTO customers2 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),('George', 'Michael', 'gm@gmail.com'),('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders2 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1), ('2017/11/11', 35.50, 1), ('2014/12/12', 800.67, 2), ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25,5), ('2017/11/05', 23.45, 45), (CURDATE(), 777.77, 109);  -- Important



# 2) Cross Join 
SELECT * FROM customers, orders;
SELECT first_name, order_date, amount from customers, orders;

# 3) ARBITRARY JOIN 
SELECT * FROM customers JOIN orders ON customers.id = orders.id; 


# 4) Inner join
select * from orders inner join customers on orders.customer_id = customers.id ;
select customers.id, order_date, amount, last_name from orders inner join customers on orders.customer_id = customers.id 
where last_name= 'George';  


# 5) IMPLICIT INNER JOIN
SELECT * FROM customers, orders where customers.id = orders.customer_id;  
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;
    
    
# 6) EXPLICIT INNER JOINS
SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;   
SELECT * FROM customers inner JOIN orders ON customers.id = orders.customer_id;    
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;
SELECT * FROM orders inner JOIN customers ON orders.customer_id = customers.id;   
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount  FROM customers JOIN orders ON customers.id = orders.customer_id 
ORDER BY order_date;
SELECT first_name, last_name, order_date, SUM(amount) AS total_spent, count(orders.customer_id) FROM customers 
JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id ORDER BY total_spent DESC;  


# 7) LEFT JOINS
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;    
SELECT * FROM customers LEFT OUTER JOIN orders ON customers.id = orders.customer_id;  
SELECT * FROM orders LEFT JOIN customers ON customers.id = orders.customer_id; 
SELECT first_name, last_name, order_date, amount FROM customers LEFT JOIN orders ON customers.id = orders.customer_id; 
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers LEFT JOIN orders
ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent;


# 8) Right Joins 
SELECT * FROM customers2 RIGHT JOIN orders2 ON customers2.id = orders2.customer_id;
SELECT * FROM customers2 RIGHT OUTER JOIN orders2 ON customers2.id = orders2.customer_id;
SELECT * FROM customers2 LEFT JOIN orders2 ON customers2.id = orders2.customer_id;
SELECT * FROM customers2 LEFT OUTER JOIN orders2 ON customers2.id = orders2.customer_id;
SELECT * FROM customers2 RIGHT JOIN orders2 ON customers2.id = orders2.customer_id order by first_name;
SELECT first_name, last_name, order_date, amount, sum(amount), count(customer_id) FROM customers2 RIGHT JOIN orders2 
ON customers2.id = orders2.customer_id group by customer_id;

SELECT IFNULL(first_name,'MISSING') AS first, IFNULL(last_name,'USER') as last, order_date, amount, SUM(amount)
FROM customers2 RIGHT JOIN orders2 ON customers2.id = orders2.customer_id GROUP BY first_name;
SELECT IFNULL(first_name,'MISSING') AS first, IFNULL(last_name,'USER') as last, order_date, amount, SUM(amount)
FROM customers2 RIGHT JOIN orders2 ON customers2.id = orders2.customer_id GROUP BY customers2.id;
SELECT IFNULL(first_name,'MISSING') AS first, IFNULL(last_name,'USER') as last, order_date, amount, SUM(amount)
FROM customers2 RIGHT JOIN orders2 ON customers2.id = orders2.customer_id GROUP BY orders2.customer_id;  


# 9) Common Mistake 
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT * FROM orders LEFT JOIN customers ON customers.id = orders.customer_id;  
SELECT * FROM orders RIGHT JOIN customers ON customers.id = orders.customer_id;    
SELECT * FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;  


# 10) Exercise 
select * from students left outer join papers on students.id = papers.student_id;
SELECT first_name, title, grade FROM students INNER JOIN papers ON students.id = papers.student_id order by grade desc;
SELECT first_name, title, grade FROM students RIGHT JOIN papers ON students.id = papers.student_id ORDER BY grade DESC;
SELECT first_name, title, grade FROM papers RIGHT JOIN students ON students.id = papers.student_id;  
SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;
SELECT first_name, IFNULL(title, 'MISSING') as title, IFNULL(grade, 0) as grade FROM students LEFT JOIN papers 
ON students.id = papers.student_id;
SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id ORDER BY average DESC;


# 11) Case statment 
SELECT first_name, IFNULL(AVG(grade), 0) AS average, 
case when grade>= 1 then 'PASSING' else 'FAILING' end as passing_status from students LEFT JOIN papers ON 
students.id = papers.student_id GROUP BY students.id ORDER BY average DESC;

SELECT first_name, Ifnull(Avg(grade), 0) AS average, 
CASE WHEN Avg(grade) IS NULL THEN 'FAILING' WHEN Avg(grade) >= 75 THEN 'PASSING' ELSE 'FAILING' end AS passing_status 
FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC; 

SELECT first_name, Ifnull(Avg(grade), 0) AS average,   -- use two case statement in one query
CASE WHEN Avg(grade) IS NULL THEN 'FAILING' ELSE 'FAILING' end AS passing_status, case when Avg(grade) >= 75 THEN 'PASSING' end as
status FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC; 


# 12) View statment
create view two_case as SELECT first_name, Ifnull(Avg(grade), 0) AS average,   -- use two case statement in one query
CASE WHEN Avg(grade) IS NULL THEN 'FAILING' ELSE 'FAILING' end AS passing_status, case when Avg(grade) >= 75 THEN 'PASSING' end as
status FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC;
 
create view single_case_with_multiple_condition as SELECT first_name, Ifnull(Avg(grade), 0) AS average, 
CASE WHEN Avg(grade) IS NULL THEN 'FAILING' WHEN Avg(grade) >= 75 THEN 'PASSING' ELSE 'FAILING' end AS passing_status 
FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC; -- important

