-- MULT JOINS
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT *
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- add constraints/filter
SELECT title, first_name, last_name
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE title LIKE 'B%'
ORDER BY film.film_id;

-- SUBQUERIES
-- There are 3 places we can do a sub-query
-- 1) FROM CLAUSE  2) WHERE/HAVING CLAUSE 3) SELECT (MOST UNCOMMON)

--ex1. i want to find all customer emails who spent more than $100 total on $5 or more purchases
-- step 1) look in the payment table and filter customer_ids who spent more than $100
-- step 2) look in customer table for emails that correspond to our list

--query1:
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount >5
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;

--query2:
SELECT email
FROM customer;

-- Putting both queries together
-- WHERE CLAUSE SUBQUERY
-- The subquery should return only ONE column
SELECT email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount >5
    GROUP BY customer_id
    HAVING SUM(amount) > 100
    ORDER BY SUM(amount) DESC
);


-- FROM CLAUSE SBUQUERY
-- use the resulting table from another query to perform your request
SELECT first_name, last_name
FROM (
    SELECT title, first_name, last_name
    FROM film
    INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    WHERE title LIKE 'M%'
    ORDER BY film.film_id
) AS m_name_films 
WHERE title = 'Mulan Moon';

-- SELECT CLAUSE SUBQUERY
--not entirely useful
SELECT email, customer_id, (SELECT COUNT(*) FROM payment)
FROM customer
WHERE customer_id < 10;