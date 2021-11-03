#Get release years.
select distinct(release_year) from film;

#Get all films with ARMAGEDDON in the title.

select title from film 
where title  like '%ARMAGEDDON%';

#Get all films which title ends with APOLLO.
select title from film 
where title  like '%APOLLO';

#Get 10 the longest films.
select title, length as duration from film 
order by length DESC
limit 10;

#How many films include Behind the Scenes content?
select count(title) from film 
where special_features like '%Behind the Scenes%';

#Drop column picture from staff.
alter table staff drop picture;
select * from staff;


#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff ( 
      store_id, 
      first_name, 
      last_name, 
      address_id,
      email,
      username,
      last_update) 
SELECT  store_id, 
      first_name, 
      last_name, 
      address_id,
      email,
      'TAMMY',
      last_update
FROM customer 
where first_name = 'TAMMY';



#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. 
#For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

#customerid = 130
select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';


#film_id =1
select title, film_id from film
where title like 'Academy Dinosaur';


#the last rental id is 16049
SELECT max(rental_id) from rental;

# there are 4 copies of the movie at store 1 
select inventory_id from inventory
where film_id = 1 and store_id = 1;

#final clean-ish product
insert into rental
(rental_id,rental_date,inventory_id, customer_id, staff_id)
select 
16050,Curdate(),1,customer_id,1
from customer
where first_name = 'CHARLOTTE' and last_name='HUNTER';


#Delete non-active users, but first, create a backup table deleted_users to store customer_id,
 #email, and the date for the users that would be deleted. Follow these steps:
create table backup_table(
customer_id int AUTO_INCREMENT not null, 
email VARCHAR(50) default null, 
deletion_date VARCHAR(30) default null,
primary key(customer_id)); 

drop table if exists sakila.backup_table;
insert into backup_table
(customer_id,email,deletion_date)
select customer_id, email, current_timestamp()
from customer 
where active = 0;

drop from customer
where active =0










