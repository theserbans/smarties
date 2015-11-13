SHOW databases;
DROP DATABASE IF EXISTS 250766858db;
CREATE DATABASE 250766858db;
USE 250766858db;
SHOW TABLES;

CREATE TABLE customer (
	customerid INT(3) NOT NULL,
	firstname VARCHAR(30) NOT NULL, 
	lastname VARCHAR(30) NOT NULL, 
	sex CHAR(1), 
	email VARCHAR(20), 		 	
	PRIMARY KEY (customerid)
);

CREATE TABLE theatreRoom (          
	roomnumber INT(3) NOT NULL,
	capacity INT(3),
	PRIMARY KEY (roomnumber)
);

CREATE TABLE movie (
	movieid INT(3) NOT NULL,
	name VARCHAR(50) NOT NULL,
	releaseyear INT(4),
	genre VARCHAR(50) DEFAULT 'Not specified',     	
	PRIMARY KEY (movieid)
);

CREATE TABLE showing (
	movieid INT(3) NOT NULL,
	showid INT(3) NOT NULL,
	date DATE, 
	time TIME, 
	roomnumber INT(3) NOT NULL,
	FOREIGN KEY (movieid) REFERENCES movie(movieid),
	FOREIGN KEY (roomnumber) REFERENCES theatreRoom(roomnumber),
	PRIMARY KEY (showid)
);

CREATE TABLE selection (
	showid INT(3) NOT NULL,
	customerrating INT(1),	
	cost DECIMAL(5,2),
	customerid INT(3) NOT NULL,
	FOREIGN KEY (showid) REFERENCES showing(showid),
	FOREIGN KEY (customerid) REFERENCES customer(customerid),
	PRIMARY KEY (showid, customerid)
);

SHOW TABLES;	

