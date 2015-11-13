USE 250766858db;

SELECT lastname FROM customer
GROUP BY lastname HAVING count(lastname) > 1;

SELECT lastname FROM customer
GROUP BY lastname HAVING count(lastname) = 1;

SELECT firstname, lastname, email FROM customer
WHERE sex='M';

SELECT name FROM movie
WHERE genre LIKE '%comedy%';

SELECT name, releaseyear FROM movie
WHERE releaseyear < '2000' 
ORDER BY releaseyear ASC;


SELECT DATE_FORMAT(date,'%M %e, %Y') as 'Showing Date',
       TIME_FORMAT(time,'%r') as 'Showing Time',
       capacity
FROM showing, theatreRoom
WHERE (showing.roomnumber=theatreRoom.roomnumber AND showing.movieid='100');

SELECT name FROM movie
WHERE name LIKE '%the %';

SELECT * FROM showing;

SELECT firstname, lastname, name FROM customer, movie, selection, showing
WHERE (selection.showid=showing.showid AND 
       selection.customerid=customer.customerid AND 
       showing.movieid=movie.movieid AND
       showing.date BETWEEN '15/03/01' AND '22/03/01'
       );

SELECT DISTINCT firstname, lastname FROM customer, selection, showing, movie
WHERE (customer.customerid=selection.customerid AND
       selection.showid=showing.showid AND
       showing.movieid=movie.movieid AND
       movie.genre LIKE '%SciFi%'
       );

SELECT name FROM movie
WHERE movieid NOT IN(SELECT movieid FROM showing);
		
SELECT name FROM movie, showing
WHERE (movie.movieid=showing.movieid) AND 
      (showing.showid NOT IN (SELECT showid FROM selection));

SELECT DISTINCT name FROM movie, showing
WHERE (movie.movieid NOT IN(SELECT movieid FROM showing) OR 
      (movie.movieid=showing.movieid AND 
		(showing.showid NOT IN (SELECT showid FROM selection))));

SELECT DISTINCT releaseyear, COUNT(*) AS 'Number of movies' FROM movie
GROUP BY releaseyear;

SELECT SUM(cost) FROM selection;

SELECT * FROM selection;

SELECT DISTINCT selection.showid, COUNT(customerrating), capacity 
FROM selection, showing, theatreRoom
WHERE (selection.showid=showing.showid AND showing.roomnumber=theatreRoom.roomnumber)
GROUP BY customerrating;

