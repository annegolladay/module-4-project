-- Part 1 - SQL Skills
-- ARTIST TABLE
-- 1. Add 3 new artists to the artist table using INSERT. 

insert into artist (name)
values ('Frank Sinatra');

insert into artist (name)
values ('Garth Brooks');

insert into artist (name)
values ('Shania Twain');

select * from artist;


-- 2. Select 5 artists in alphabetical order.

select * from artist
order by name ASC limit 5;



-- EMPLOYEE TABLE
-- 1. List all employee first and last names only that live in Calgary.

select first_name, last_name from employee
where city = 'Calgary';

-- 2. Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

select employee_id from employee
where first_name = 'Nancy' and last_name = 'Edwards';

select * from employee
where reports_to = 2;

-- 3. Count how many people live in Lethbridge.

select count(city) from employee
where city = 'Lethbridge';



-- INVOICE TABLE
-- 1. Count how many orders were made from the USA.

select count(*) from invoice
where billing_country = 'USA';

-- 2. Find the largest order total amount.

select max(total) from invoice;

-- 3. Find the smallest order total amount.

select min(total) from invoice;

-- 4. Find all orders bigger than $5.

select * from invoice
where total > 5;

-- 5. Count how many orders were smaller than $5.

select count(*) from invoice
where total < 5;

-- 6. Get the total sum of the orders.

select sum(total) from invoice;



-- JOIN QUERIES (Various tables)
-- 1. Get all invoices where the unit_price on the invoice_line is greater than $0.99.

select * from invoice
join invoice_line 
on invoice_line.invoice_id = invoice.invoice_id
where invoice_line.unit_price > .99;

-- 2. Get the invoice_date, customer first_name and last_name, and total from all invoices.

select invoice.invoice_date, customer.first_name, customer.last_name, invoice.total 
from invoice
join customer
on customer.customer_id = invoice.customer_id;

-- 3. Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

select customer.first_name, customer.last_name, employee.first_name, employee.last_name
from customer
join employee
on employee.employee_id = customer.support_rep_id;

-- 4. Get the album title and the artist name from all albums.

select album.title, artist.name
from album
join artist
on artist.artist_id = album.artist_id;



-- Extra Credit - SQL
-- Artist Table

-- 1. Select 10 artists in reverse alphabetical order.

select * from artist
order by name DESC LIMIT 10;

-- 2. Select all artists that start with the word ‘Black’.

select * from artist
where name LIKE 'Black%';

-- 3. Select all artists that contain the word ‘Black’.

select * from artist
where name LIKE '%Black%';



-- Employee Table

-- Find the birthdate for the youngest employee.

select MAX(birth_date) from employee;

-- Find the birthdate for the oldest employee.
select MIN(birth_date) from employee;



-- Invoice Table

-- Count how many orders were in CA, TX, or AZ (use IN).
select COUNT(*) from invoice 
where billing_state in ('CA', 'TX', 'AZ');

-- Get the average total of the orders.
select AVG(total) from invoice;




-- More Join Queries

-- Get all playlist_track track_ids where the playlist name is Music.
select playlist_track.track_id
from playlist_track
join playlist
on playlist.playlist_id = playlist_track.playlist_id
where playlist.name = 'Music';


-- Get all track names for playlist_id 5.
select track.name
from track
join playlist_track 
on playlist_track.track_id = track.track_id
where playlist_track.playlist_id = 5;


-- Get all track names and the playlist name that they’re on ( 2 joins ).
select track.name, playlist.name
from track
join playlist_track 
on playlist_track.track_id = track.track_id
join playlist 
on playlist.playlist_id = playlist_track.playlist_id


-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).

select track.name, album.title
from track 
join genre 
on genre.genre_id = track.genre_id
join album 
on album.album_id = track.album_id
where genre.name = 'Alternative & Punk'