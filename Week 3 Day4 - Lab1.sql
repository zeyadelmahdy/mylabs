#List number of films per category.
select c.name as Film_Name, count(f.film_id) as Number_of_Films
from category c
join film_category f
on c.category_id = f.category_id
group by name
order by name;


#Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address 
from staff s
join address a
on s.address_id = a.address_id;

#Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, sum(p.amount) as 'Total Amount'
from staff s
join payment p 
on s.staff_id = p.staff_id
where payment_date like '2005-08%';

#List each film and the number of actors who are listed for that film.
select f.title, COUNT(fa.actor_id) as 'Actor Count'
from film f
join film_actor fa
on f.film_id = fa.film_id
group by title;

#Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
select c.first_name, c.last_name, SUM(p.amount) as 'Total by Each Customer'
from payment p
join customer c
on p.customer_id = c.customer_id
group by  c.first_name, c.last_name
Order by c.last_name ASC;



