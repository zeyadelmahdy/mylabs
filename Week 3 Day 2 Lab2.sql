#Select all the actors with the first name ‘Scarlett’.
select actor_id, first_name from actor
where first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?

select count(distinct(inventory_id)) as 'Movies Available for Rent', 
count(distinct(rental_id)) as 'Films Rented', 
count(distinct(inventory_id)) + count(distinct(rental_id)) as 'Total Movies'
from rental;

#What are the shortest and longest movie duration? 
#Name the values max_duration and min_duration.
select title, min(length) as min_duration, max(length) as max_duration from film; 

#What's the average movie duration expressed in format (hours, minutes)?
SELECT FORMAT('hh:mm') from film;
select (sec_to_time(length*60)) as 'Movie Duration'from film;
select sec_to_time(avg(sec_to_time(length))) as "Avg Movie Duration" FROM film;

#How many distinct (different) actors' last names are there?
select count(distinct(last_name)) as 'Number of unique last names' from actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF (max(payment_date), min(payment_date)) AS 'Days of Operation' from payment;


#Show rental info with additional columns month and weekday. Get 20 results.
select *,
date_format(convert(substring_index(rental_date,' ',1), date), "%w") as weekdayno,
date_format(convert(substring_index(rental_date,' ',1), date), "%m") as month
from rental
limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select * ,  
case
when weekday(rental_date) >=6 then 'weekend'
else 'workday'
end
as day_type
from rental
end;



#How many rentals were in the last month of activity?
select max(rental_date) from rental;
select count(*) from rental
where rental_date like "2006-02%";