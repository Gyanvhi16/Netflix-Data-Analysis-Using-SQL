# Netflix-Data-Analysis-Using-SQL

## Netflix Movies and TV Shows Data Analysis     


## Overview  

This project focuses on an in-depth analysis of Netflix's movies and TV shows dataset using SQL. The aim is to derive meaningful insights and address key business questions, offering a clearer understanding of Netflix's content catalog. This README outlines the project’s objectives, challenges, approaches, findings, and conclusions.



## Objectives 

1. Examine the distribution between content types (Movies vs. TV Shows).  
2. Discover the most prevalent ratings across various categories of content.  
3. Analyze content trends by release year, countries of origin, and durations.  
4. Investigate and classify content using specific attributes, themes, and keywords.



## Dataset

 For this project, the dataset has been sourced from Kaggle :
 ####  Dataset link :

 

## Schema 

```sql 
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
```


## Business Problem Analysis

### 1. Count the number of Moves vs TV Shows

```sql
SELECT 
    type,
	COUNT(*)  AS total_content
FROM Netflix
GROUP BY type;
```


### 2. Find the most common rating  for  movies and TV shows.

```sql
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
```


## Findings and Conclusion  

1. **Content Distribution**: The dataset showcases a wide variety of movies and TV shows spanning multiple genres and ratings.  
2. **Popular Ratings**: Analysis of the most frequent ratings offers valuable insights into the target audience for Netflix's content.  
3. **Geographical Insights**: The prominence of certain countries, such as India, and the average number of releases emphasize regional trends in content distribution.  
4. **Content Categorization**: Organizing content based on specific keywords provides a clearer perspective on the types of content available on Netflix.
   
This analysis offers a detailed overview of Netflix's content, providing valuable insights to guide content strategy and decision-making.



