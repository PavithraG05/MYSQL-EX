use sakila;

-- Display the first and last name of each actor in a single column in upper case
-- letters. Name the column Actor Name.
SELECT UPPER(CONCAT(first_name, ' ',last_name)) AS ActorName FROM actor;

-- You need to find the ID number, first name, and last name of an actor, of
-- whom you know only the first name, "Joe." 
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'joe';

-- Find all actors whose last name contain the letters GEN.
SELECT * FROM actor WHERE last_name LIKE '%GEN%';

-- Find all actors whose last names contain the letters "LI". This time, order the
-- rows by last name and first name, in that order
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name, first_name;

-- Using IN, display the country_id and country columns of the following
-- countries: Afghanistan, Bangladesh, and China.
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- List last names of actors and the number of actors who have that last name,
-- but only for names that are shared by at least two actors
SELECT last_name, COUNT(*) FROM actor GROUP BY last_name HAVING count(*) > 1;

-- The actor HARPO WILLIAMS was accidentally entered in the actor table
-- as GROUCHO WILLIAMS. Write a query to fix the record, and another to verify
-- the change.
UPDATE actor SET first_name = 'HARPO' WHERE last_name='WILLIAMS' AND first_name = 'GROUCHO';
SELECT * FROM actor where last_name='WILLIAMS';

-- Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out
-- that GROUCHO was the correct name after all! In a single query, if the first name
-- of the actor is currently HARPO, change it to GROUCHO. Then write a query to
-- verify your change.
UPDATE actor SET first_name = 'GROUCHO' WHERE last_name='WILLIAMS' AND first_name = 'HARPO';
SELECT * FROM actor where last_name='WILLIAMS';

-- Use JOIN to display the total amount rung up by each staff member in
-- August of 2005. Use tables staff and payment.
SELECT SUM(amount), first_name FROM staff JOIN payment ON payment.staff_id = staff.staff_id GROUP BY payment.staff_id;

-- List each film and the number of actors who are listed for that film. Use
-- tables film_actor and film. Use inner join.
SELECT title, count(*) FROM film_actor JOIN film ON film_actor.film_id = film.film_id GROUP BY film.film_id;

-- How many copies of the film Hunchback Impossible exist in the inventory
-- system?
SELECT COUNT(*) FROM inventory JOIN film ON inventory.film_id = film.film_id WHERE title = 'Hunchback Impossible';

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
-- As an unintended consequence, films starting with the letters K and Q have
-- also soared in popularity. Use subqueries to display the titles of movies
-- starting with the letters K and Q whose language is English.
SELECT title FROM film WHERE title='K%';

-- Insert a record to represent Mary Smith renting the movie
-- ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today. Then write a
-- query to capture the exact row you entered into the rental table.
INSERT INTO rental (rental_date,inventory_id,customer_id,return_date,staff_id) values(now(),1,1,'2024-08-08 21:00:00',1);
SELECT * FROM rental WHERE customer_id =1 AND staff_id = 1 AND inventory_id=1;