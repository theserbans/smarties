USE 250766858db;

CREATE VIEW view AS
SELECT DISTINCT firstname, lastname, name, customerrating
FROM selection, customer, showing, movie
WHERE  (customer.customerid=selection.customerid AND
	movie.movieid=showing.movieid AND
	showing.showid=selection.showid
       )
GROUP BY firstname;

SELECT * FROM view;
DROP VIEW view;       

SELECT * FROM selection;
DELETE FROM selection
WHERE customerid IN (SELECT customerid FROM customer WHERE lastname='Trump');
SELECT * FROM selection;

SELECT * FROM customer;
DELETE FROM customer
WHERE lastname LIKE '%Trump%';
SELECT * FROM customer;
