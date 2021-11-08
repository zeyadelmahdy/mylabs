# 1.How many copies of the film Hunchback Impossible exist in the inventory system?

select title, count(inventory_id) as 'Number of Copies', film_id from film 
join inventory 
using (film_id)
where title = 'Hunchback Impossible' ;


# 2. List all films whose length is longer than the average of all the films.

select title, length from film 
where length > (select avg(length) from film);

# 3. Use subqueries to display all actors who appear in the film Alone Trip.

select * from film_actor
where film_id in 
(select film_id from film where title = 'Alone Trip');

# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.

select f.title, c.name from film f
join film_category using (film_id)
join category c using (category_id)
where name = 'Family';



# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
#Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
#that will help you get the relevant information.

#subquery
select first_name, last_name, email from customer
where address_id in (select address_id from address
where city_id in (select city_id from city
where country_id in (select country_id from country where country = 'Canada'))) ;

#join
select c.first_name, c.last_name, c.email from customer c 
join address a
on a.address_id = c.address_id
join city ci
on ci.city_id = a.city_id
join country co
on co.country_id = ci.country_id
where country = 'Canada';


# 6. Which are films starred by the most prolific actor? 
#Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select a.first_name, a.last_name, a.actor_id, count(fa.film_id)
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by actor_id
order by count(fa.film_id) desc;

# Most Proflic actor is Gina Degeneres, actor_id number 107 

#All movie titles for Gina Degeneres! Sorry couldn't do it via subqueries :S

select f.title from actor a
join film_actor ac
on a.actor_id = ac.actor_id
join film f 
on f.film_id = ac.film_id
where ac.actor_id = 107;


select * from film
where actor_id in (select actor_id from actor
where film_id in (select film_id from film
where actor_id = 107))

#Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

#Customers who spent more than the average payments.