
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



Business Problem Analysis

1. Count the number of Moves vs TV Shows

SELECT 
    type,
	COUNT(*)  AS total_content
FROM Netflix
GROUP BY type;



2. Find the most common rating  for  movies and TV shows.

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
	  duration = (SELECT MAX(duration)
FROM Netflix);



6. Find content added in the last 5 years.

SELECT * FROM Netflix
WHERE 
     TO_DATE(date_added, 'Month DD, YYYY')>= CURRENT_DATE - INTERVAL '5 years'


	  
7. Find all the movies/TV shows by director 'Rjiv Chilkala'

SELECT * FROM Netflix 
WHERE director LIKE '%Rajiv Chilaka%';  



8.List all  TV Shows with more than 5 seasons.

SELECT * FROM Netflix
WHERE
      type = 'TV Show'
	  AND 
	  SPLIT_PART(duration, ' ',1)::numeric > 5 ;


	  
9. Count the  number of item in each genre.

SELECT 
      UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	  COUNT(show_id) as total_content
FROM Netflix
GROUP BY 1;	 



10.Find each year and the average numbers of content realeases by India on Netflix, return top 5 year with highest avg content release.

SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        COUNT(show_id)::numeric /
        (SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100, 2
    ) AS avg_release
FROM Netflix
WHERE country = 'India'
GROUP BY country, release_year
ORDER BY avg_release DESC
LIMIT 5;

11. List All Movies that are Documentaries.

SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';



12. Find All Content Without a Director.

SELECT * 
FROM netflix
WHERE director IS NULL;



13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years.

SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;




14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India.

SELECT 
    UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
    COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY actor
ORDER BY COUNT(*) DESC
LIMIT 10;



15. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords.

SELECT 
    category,
    COUNT(*) AS content_count
FROM (
    SELECT 
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category;



