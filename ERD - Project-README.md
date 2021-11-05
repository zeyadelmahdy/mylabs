# ERD PROJECT - TRANSPORTATION 
The following is a conceptual ERD proposal for public transportation in a city. 
![ERD Transportation (2)](https://user-images.githubusercontent.com/88034001/140499170-225901b8-e741-4391-b53e-27af49589fbc.jpeg)
## Below is the test code for mysql which should be able to answer the following scenarios. 
### Whats the average journey time between any two public transport (ubahn or metro) stations?
feild journey time is calculated based on departure and arrival from each station id to the next.

```{mysql}
#feild journey time is calculated based on departure and arrival from each station id to the next.
select avg(journey_time)
from schedule;
```

### Which train/ tram or bus route has the most stops?
```{mysql}
select route_id, t.type_name, count(s.station_id)
from route
join stations s
on r.route_id = s.route_id
join type t
on s.type_id = t.type_id
group by t.type_name
order by ASC
LIMIT 1; 
```
### Are there parts of the city with more public transport options than others?
this will return the parts of city with most trans types and routes, thus giving us the full picture on 'options'

```{mysql}
Select l.location_name, count(t.type_name), count(s.route_id)
from location l
join station s
on l.location_id = s.location_id
join type t
on s.type_id = t.type_id
group by l.location_name
order by count(t.type_name);
```

### Which routes are the more pleasant/ recommended by passengers / go to scenic areas?
#based on what rating we are checking, we can query the max rating for it based on the route
#and find what is the most highly rated route based on the criteria
```{mysql} 
select r.route_name, avg(ra.scenic_rating)
from route r
join rating ra
on r.route_id = ra.route_id
group by r.route_name;
```
## What we would add/do differently
1. Add actual departure time vs scheduled time

  - Allows us to calculate/dive deeper into punctuality/rating 
  
  - We’d need to add trip_id to each involved table
 
2. Map out any metrics we would need in the next 2 years
  - Create more granular tables with more precise data points
 
## Challenges: 
1. Do we start with tables or columns? (chicken and egg)

  - Started by randomly listing columns in tables then switched the approach to thinking about tables and how they would work in a network/interact with each other. 
  
  - Columns and values came later
 
2. Are we thinking like an analyst or a web designer? 

  - Building a database not a website
  
  - Putting ourselves in the shoes of an analyst instead of thinking of the customer journey and how they interact with the “website”
 
3. Understanding the relationships and how to link them visually

  - We had to think through each use case and if we would need (in the future) to extract information across any two tables
