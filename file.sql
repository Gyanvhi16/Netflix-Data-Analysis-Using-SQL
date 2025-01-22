CREATE TABLE Netflix
(
  show_id  VARCHAR(6),
  type   VARCHAR(10),
  title   VARCHAR(150),
  director   VARCHAR(208),
  casts   VARCHAR(1000),
  country   VARCHAR(150),
  date_added   VARChar(50),
  release_year   INT,
  rating   VARCHAR(10),
  duration    VARCHAR(15),
  listed_in  VARCHAR(100),
  description  VARCHAR(250)
);

DROP TABLE IF EXISTS Netflix;

SELECT * FROM Netflix;

SELECT COUNT (*) AS TOTAL_CONTENT FROM Netflix;

SELECT DISTINCT type FROM Netflix;



--Business Problem Analysis

--1. Count the number of Moves vs TV Shows

SELECT * FROM Netflix;

SELECT 
    type,
	COUNT(*)  AS total_content
FROM Netflix
GROUP BY type;


--2. Find the most common rating  for  movies and TV shows.

SELECT
     type,
	 rating
FROM 
(
   SELECT 
       type,
	   rating,
	   count(*),
	   RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC)  AS Ranking
   FROM Netflix
   GROUP BY 1, 2
) AS t1

WHERE 
      ranking = 1;




3. List all movies released in a specific year (e.g., 2020)

select * from Netflix;


SELECT * FROM Netflix
WHERE 
    type = 'Movie'	
	AND
	release_year = 2020;


4.Find the top 5 countries with the most content on Netflix


SELECT
    UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT(show_id) AS total_content
FROM Netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


5. Identify the longest movie.

SELECT * FROM Netflix
WHERE
      type = 'Movie'
	  AND
	  duration = (SELECT MAX(duration) FROM Netflix);




6. Find content added in the last 5 years.

SELECT * FROMM Netflix
WHERE date_added = CURRENT_DATE - INTERVAL '5 years'



	  


7. Find all the movies/TV shows by director 'Rjiv Chilkala'


SELCET * FROM 

          type = 'Movies'
	  

