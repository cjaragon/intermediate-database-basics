-- TODO Joins

--* solution 1
SELECT * FROM invoice i
JOIN invoice_line il
on i.invoice_id = il.invoice_id
WHERE il.unit_price > 0.99

--* solution 2
SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c 
ON i.customer_id = c.customer_id;

--* solution 3
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e
ON c.support_rep_id = e.employee_id;

--* solution 4
SELECT al.title, ar.name 
FROM album al
JOIN artist ar
ON al.artist_id = ar.artist_id;

--* solution 5
SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p
on pt.playlist_id = p.playlist_id
WHERE p.name = 'Music';

--* solution 6
SELECT t.name
FROM track t
JOIN playlist_track pt
on t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

--* solution 7
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

--* solution 8
SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';

-- TODO Nested Queries

--* solution 1
SELECT * FROM invoice
WHERE invoice_id IN (SELECT invoice_id
FROM invoice_line
WHERE unit_price > 0.99);

--* solution 2
SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id
FROM playlist WHERE name = 'Music');

--* solution 3
SELECT name
FROM track
WHERE track_id IN (SELECT track_id
FROM playlist_track WHERE playlist_id = 5);

--* solution 4
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id
FROM genre WHERE name = 'Comedy');

--* solution 5
SELECT * FROM track
WHERE album_id IN (SELECT album_id
FROM album WHERE title = 'Fireball');

--* solution 6
SELECT * FROM track
WHERE album_id IN (SELECT album_id
FROM album WHERE artist_id IN (SELECT artist_id
FROM artist WHERE name = 'Queen'));

-- TODO Updating Rows

--* solution 1
UPDATE customer
SET fax = null
WHERE fax is not null;

--* solution 2
UPDATE customer
SET company = 'self'
WHERE company is null

--* solution 3
UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' 
AND last_name = 'Barnett';

--* solution 4
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

--* solution 5
UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS null

-- TODO Group By

--* solution 1
SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

--* solution 2
SELECT COUNT(*), g.name
FROM track t
JOIN genre g on t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

--* solution 3
Select ar.name, COUNT(*)
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id
GROUP BY ar.name;

-- TODO Distict

--* solution 1
SELECT DISTINCT composer
FROM track;

--* solution 2
SELECT DISTINCT billing_postal_code
FROM invoice;

--* solution 3
SELECT DISTINCT company
from customer;

-- TODO Delete Table

--* solution 1
DELETE FROM practice_delete
WHERE type = 'bronze';

--* solution 2
DELETE FROM practice_delete
WHERE type 'silver';

--* solution 3
DELETE FROM practice_delete
WHERE value = 150;







