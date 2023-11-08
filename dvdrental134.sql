-- Select all records from actor table query
-- * all columns
-- columns named in the SELECT statement will show up in the query output
SELECT *
FROM actor;

-- Query for actor first and last name
SELECT first_name, last_name
FROM actor;

-- WHERE clause is going to bring back information based on a provided condition
-- where first_name is equal to Nick
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query using LIKE, LIKE is similar to = but a bit more forgiving
-- % wild card character that stands for anything that could occupy that space
-- Query for any name that starts with J
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- __ placeholder for characters
-- Query for 3 letter word first names that start with K
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '___';


-- Comparing Operators are:
-- Greater than > 
-- less than <
-- greater or equal >= 
--  less than or equal <=
-- Not equal <> 

SELECT *
FROM payment;

-- Query for data that shows customers who have paid an amount
-- greater than $2.99

SELECT customer_id, amount 
FROM payment
WHERE amount > 2.99; 

-- WHERE clause is similar to if statement where we are asking a question
-- of our data 

-- Same thing but with < 

SELECT customer_id, amount
FROM payment
WHERE amount < 5.99;

-- Same thing but with >= 

SELECT customer_id, amount
FROM payment
WHERE amount >= .99; 

-- Same thing but with <=

SELECT customer_id, amount 
FROM payment
WHERE amount <= .99; 

-- Same thing but with <> (aka not equal)

SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00;

-- ORDER BY clause does just that. It organizes the data either by ASC or DESC (default to ASC)


SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;
-- LIMIT 1; 


-- SQL Aggregates ( aka running calculations on your data)
-- SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display sum of amounts payed above $5.99

SELECT SUM(amount) AS sum_amount
FROM payment
WHERE amount > 5.99;

SELECT payment_date
FROM payment
ORDER BY payment_date ASC; 


-- Query to display average payment amount 

SELECT ROUND(AVG(amount), 2)
FROM payment; 

-- Query to display the count of amounts greater than $5.99

SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99; 


-- select * from actor where first_name = 'Nick'; BAD CONVENTION

-- SELECT *
-- FROM actor
-- WHERE first_name = 'Nick'; GOOD CONVENTION 


-- BETWEEN something AND something_else 

SELECT *
FROM payment;

-- WE can chain our WHERE clauses together 

SELECT *
FROM payment
WHERE amount > 5.99 AND customer_id = 341; --extremely similar to "if conditional" in python

-- Query to display MAX() payment amount

SELECT MAX(amount)
FROM payment
WHERE amount < 6.50; 

-- Query to display MIN() payment amount

SELECT MIN(amount)
FROM payment;


-- We can run calculations but then also group those calculations using the GROUP BY clause 

-- Query to get the total sum of all transactions
SELECT SUM(amount)
FROM payment; 

-- Query to display the sum of transactions seperated by their amounts (whatever you seperate your calculation on 
-- thats what you GROUP BY)

SELECT SUM(amount), amount
FROM payment
GROUP BY amount
ORDER BY amount; 

-- Query to display how many rentals per customer. Using the COUNT() to grab how many and seperate out by customer_id (GROUP BY)

SELECT COUNT(amount), customer_id
FROM payment
GROUP BY customer_id 
ORDER BY COUNT(amount) DESC 
LIMIT 3;

SELECT *
FROM payment; 

-- SELECT *
-- FROM customer
-- WHERE customer_id = 341;


-- TOMORROW
-- SELECT customer.customer_id, first_name, last_name 
-- FROM customer
-- JOIN payment
-- ON customer.customer_id = payment.customer_id
-- WHERE customer.customer_id = 341
-- LIMIT 1


-- Queries we have so far 

-- SELECT
-- FROM
-- WHERE (optional)
-- GROUP BY (optional)
-- HAVING (optional, Having is to GROUP BY as WHERE is to SELECT)
-- ORDER BY (optional)

-- She Fell With Grace Holding Oreos 


-- Last clause is HAVING (this is just a conditional we run on our GROUP BY)

-- Query to select how many rentals per customer (Using COUNT() aggregate & GROUP BY)
-- What if we wnated to add that we only wnat customer_ids above 350 (we could have this in a WHERE clause)
-- What if we wanted ONLY the rental count amount above 20

SELECT COUNT(amount), customer_id
FROM payment
WHERE customer_id > 350 --Since this conditional/question isn't being asked on our calculation it can be in a WHERE 
GROUP BY customer_id --Seperating out our calculation by our customers via customer_ids 
HAVING COUNT(amount) > 20 --Since this conditional/quesstion IS being asked on our calculation needs to be in HAVING
ORDER BY customer_id ASC;

---DISTINCT grabs unique data

SELECT DISTINCT(film_id)
FROM inventory;



-- ************************************ HOME ASSIGNMENT  *************************************


--Question 1 - How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';


--Question 2 - How many payments were made between $3.99 and $5.99?
SELECT *
FROM payment
WHERE amount >= 3.99 and amount <= 5.99;



-- Questions 3 - What film does the store have the most of? (search in inventory)
SELECT COUNT(film_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;


--Questions 4 - How many customers have the last name ‘William’?
SELECT *
FROM customer
WHERE last_name = 'William';



--Questions 5 - What store employee (get the id) sold the most rentals?
SELECT COUNT (staff_id), staff_id
FROM rental
GROUP BY staff_id;




--Question 6 - How many different district names are there?
SELECT COUNT(DISTINCT(district))
FROM address;

-- SELECT *
-- FROM rental;



--Question 7 - What film has the most actors in it? (use film_actor table and get film_id)
SELECT COUNT(film_id), film_id
FROM film_actor
GRoUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 15;

--Question 8 - From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT customer_id
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';




--Questions 9 - How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT (amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT (amount)> 250



--Question 10 - Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT (rating) DESC;