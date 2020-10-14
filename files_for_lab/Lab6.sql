USE sakila;

## Add the new films to the database.
 
CREATE TABLE film_2020
(title VARCHAR(3000),
description VARCHAR(3000),
release_year INT,
language_id INT,
rental_rate decimal,
length INT,
rating VARCHAR(10),
special_features VARCHAR(3000));


Select * from film_2020;
select * from film where release_year = '2020';

## Adding files from film_2020 to film

INSERT INTO sakila.film (title,description,release_year,language_id,rental_rate,length,rating,special_features)
SELECT title, description,release_year,language_id,rental_rate,length,rating,special_features FROM sakila.film_2020;

-- checking invenentory
Select * from inventory;
select store_id , count(*) from sakila.inventory
group by store_id;


-- Converting existing rows with store_id 2 into 1
update inventory
set store_id = '1'
where store_id = '2';

-- updating the inventory
insert into inventory(film_id , store_id )
Select film_id ,'2' AS store_id from film where release_year = '2020';

SET SQL_SAFE_UPDATES = 0;

-- setting price and return price for the film
update film
set rental_rate = '2.99' , replacement_cost = '8.99'
where release_year = '2020';