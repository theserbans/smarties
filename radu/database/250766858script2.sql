USE 250766858db;


SELECT * FROM movie;
LOAD DATA INFILE '/tmp/fall2015data.txt' INTO TABLE movie FIELDS TERMINATED BY ',';

INSERT INTO movie  
VALUES ('112','Bourne Supremacy','2004','');

SELECT * FROM movie;

INSERT INTO customer 
VALUES 
	('222','Laura','Reid','F','lreid@csd.uwo.ca'),
	('223','Radu','Serban','M','rserban2@uwo.ca'),
	('224','Bill','Clinton','M','billy@prez.com'),
	('225','Hilary','Clinton','F','nextprez@prez.com'),
	('226','Donald','Trump','M','nextprezalso@prez.com'),
	('227','Chelsea','Clinton','F','firstdaug@prez.com'),
	('228','Ivanka','Trump','F','apprentice@trump.com'),
	('229','Sandra','Bullock','F','sandy@blindside.com')
;

SELECT * FROM customer;

CREATE TABLE genreTable (
	movieid INT(3) NOT NULL,
	moviegenre VARCHAR(50),
	FOREIGN KEY (movieid) REFERENCES movie(movieid),
	PRIMARY KEY (movieid, moviegenre)
);

INSERT INTO genreTable
VALUES
	('100','Action,SciFi'),
	('101','Animated'),
	('102','Action'),
	('103','Romance'),
	('104','Action,SciFi'),
	('105','Action,SciFi'),
	('106','Drama'),
	('107','Comedy'),
	('108','Action'),
	('109','Comedy'),
	('110','Comedy,Romance'),
	('111','SciFi,Action,Comedy'),
	('112','Action,Thriller');

SELECT * FROM genreTable;

SELECT * FROM movie;
UPDATE movie 
SET movie.genre=(SELECT moviegenre
		 FROM genreTable
		 WHERE movie.movieid=genreTable.movieid);

SELECT * FROM movie;

INSERT INTO theatreRoom
VALUES 
	('1','30'),
	('2','5'),
	('3','100'),
	('4','30'),
	('5','6');

SELECT * FROM theatreRoom;

INSERT INTO showing
VALUES
	('100','333','15/02/11','213000','1'),
	('100','334','15/02/11','193000','2'),
	('101','335','15/02/11','190000','3'),
	('102','337','15/03/12','190000','1'),
	('103','338','15/03/12','190000','1'),
	('103','339','15/03/13','210000','2'),
	('103','340','15/03/20','190000','1'),
	('104','341','15/03/20','190000','1'),
	('107','346','15/03/22','210000','2'),
	('108','345','15/03/22','203000','3'),
	('109','342','15/03/20','210000','2'),
	('110','344','15/03/21','190000','1'),
	('110','347','15/03/23','220000','1'),
	('111','336','15/02/11','210000','2'),
	('112','999','12/02/22','142200','1');


SELECT * FROM showing;


INSERT INTO selection
VALUES
	('333','5','4.00',(SELECT customerid FROM customer WHERE (firstname='Laura' AND lastname='Reid'))),
	('340','1','12.00',(SELECT customerid FROM customer WHERE (firstname='Laura' AND lastname='Reid'))),
	('334','3','10.00',(SELECT customerid FROM customer WHERE (firstname='Laura' AND lastname='Reid'))),
	('346','4','5.00',(SELECT customerid FROM customer WHERE (firstname='Laura' AND lastname='Reid'))),
	('334','5','30.00',(SELECT customerid FROM customer WHERE (firstname='Radu' AND lastname='Serban'))),
	('340','1','5.00',(SELECT customerid FROM customer WHERE (firstname='Radu' AND lastname='Serban'))),
	('334','4','20.00',(SELECT customerid FROM customer WHERE (firstname='Bill' AND lastname='Clinton'))),
	('334','2','100.00',(SELECT customerid FROM customer WHERE (firstname='Donald' AND lastname='Trump'))),
	('344','1','5.00',(SELECT customerid FROM customer WHERE (firstname='Chelsea' AND lastname='Clinton'))),
	('347','5','12.00',(SELECT customerid FROM customer WHERE (firstname='Sandra' AND lastname='Bullock'))),
	('334','3','5.00',(SELECT customerid FROM customer WHERE (firstname='Sandra' AND lastname='Bullock'))),
	('333','4','22',(SELECT customerid FROM customer WHERE (firstname='Radu' AND lastname='Serban')));

SELECT * FROM selection;

SELECT * FROM customer;
UPDATE customer 
SET firstname='Sue'
WHERE customerid='228';
SELECT * FROM customer;

UPDATE selection,showing,movie
SET customerrating='5'
WHERE (selection.showid=showing.showid AND showing.movieid=movie.movieid AND movie.name='Star Wars');
SELECT * FROM selection;
