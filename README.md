# Netflix Data Analysis Using SQL

## Netflix Movies and TV Shows Data Analysis Using Postgresql


## Overview  

This project focuses on an in-depth analysis of Netflix's movies and TV shows dataset using SQL. The aim is to derive meaningful insights and address key business questions, offering a clearer understanding of Netflix's content catalog. This README outlines the project’s objectives, challenges, approaches, findings, and conclusions.



## Objectives 

1. Examine the distribution between content types (Movies vs. TV Shows).  
2. Discover the most prevalent ratings across various categories of content.  
3. Analyze content trends by release year, countries of origin, and durations.  
4. Investigate and classify content using specific attributes, themes, and keywords.



## Dataset

 For this project, the dataset has been sourced from Kaggle :
  **Dataset Link** : [Movies Dataset](https://github.com/Gyanvhi16/Netflix-Data-Analysis-Using-SQL/tree/main/Dataset)

 

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


## Business Problem and their Objectives

### 1. Count the number of Movies vs TV Shows

**Objective:** Determine the distribution of content types on Netflix.


### 2. Find the most common rating  for  movies and TV shows.

**Objective:** Identify the most frequently occurring rating for each type of content.


### 3. List All Movies Released in a Specific Year (e.g., 2020)

**Objective:** Retrieve all movies released in a specific year.


### 4. Find the Top 5 Countries with the Most Content on Netflix.

**Objective:** Identify the top 5 countries with the highest number of content items.


### 5. Identify the Longest Movie.

**Objective:** Find the movie with the longest duration.


### 6. Find Content Added in the Last 5 Years.

**Objective:** Retrieve content added to Netflix in the last 5 years.


### 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'.

**Objective:** List all content directed by 'Rajiv Chilaka'.


### 8. List All TV Shows with More Than 5 Seasons.

**Objective:** Identify TV shows with more than 5 seasons.

### 9. Count the Number of Content Items in Each Genre.

**Objective:** Count the number of content items in each genre.


### 10.Find each year and the average numbers of content release in India on netflix. 

**Objective:** Calculate and rank years by the average number of content releases by India.


### 11. List All Movies that are Documentaries

**Objective:** Retrieve all movies classified as documentaries.


### 12. Find All Content Without a Director

**Objective:** List content that does not have a director.


### 13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years.

**Objective:** Count the number of movies featuring 'Salman Khan' in the last 10 years.


### 14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India

**Objective:** Identify the top 10 actors with the most appearances in Indian-produced movies.


### 15. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords

**Objective:** Categorize content as 'Bad' if it contains 'kill' or 'violence' and 'Good' otherwise. Count the number of items in each category.



## Findings and Conclusion  

1. **Content Distribution**: The dataset showcases a wide variety of movies and TV shows spanning multiple genres and ratings.  
2. **Popular Ratings**: Analysis of the most frequent ratings offers valuable insights into the target audience for Netflix's content.  
3. **Geographical Insights**: The prominence of certain countries, such as India, and the average number of releases emphasize regional trends in content distribution.  
4. **Content Categorization**: Organizing content based on specific keywords provides a clearer perspective on the types of content available on Netflix.
   
This analysis offers a detailed overview of Netflix's content, providing valuable insights to guide content strategy and decision-making.



