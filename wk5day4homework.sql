

--1. List all customers who live in Texas (use
--JOINs)

SELECT first_name, last_name, district
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
WHERE district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount 
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT SUM(amount), (SELECT first_name FROM customer WHERE customer.customer_id = payment.customer_id) first_name
FROM payment
GROUP BY customer_id 
HAVING SUM(amount) > 175;


--4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
JOIN city c2 
ON c2.city_id = a.city_id 
WHERE country_id = 66;


--5. Which staff member had the most transactions?

SELECT SUM(amount), first_name, last_name
FROM staff s
JOIN payment p 
ON s.staff_id = p.staff_id 
GROUP BY s.staff_id;

--6. How many movies of each rating are there?

SELECT COUNT(title), rating 
FROM film 
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT amount,(SELECT first_name FROM customer WHERE customer.customer_id = payment.customer_id) first_name  
FROM payment 
WHERE amount > 6.99

-- 8.) How many free rentals did our stores give away?

SELECT COUNT(amount)
FROM rental r
JOIN payment p 
ON r.rental_id = p.rental_id 
WHERE amount = 0