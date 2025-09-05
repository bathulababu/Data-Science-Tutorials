-- No of rows in the dataset

SELECT COUNT(*) FROM indiacensus.population;
SELECT COUNT(*) FROM indiacensus.growth;

-- Insights for Jharkhand and Bihar 

SELECT * FROM indiacensus.growth
WHERE State IN ('Jharkhand', 'Bihar');

-- All the state names starting with 'A' 

SELECT DISTINCT State FROM indiacensus.growth
WHERE State LIKE 'A%';

-- Total population of India 

SELECT SUM(population) FROM indiacensus.population;

-- Average growth of India in the year 2011

SELECT ROUND(AVG(growth)*100, 2) AS Average_Growth
FROM indiacensus.growth;

-- Average growth percentage for each state

SELECT State, ROUND(AVG(growth)*100, 2) AS Average_Growth
FROM indiacensus.growth
GROUP BY State;

-- Average Sex Ratio for each state 

SELECT State, ROUND(AVG(sex_ratio)*100, 2) Average_SexRatio
FROM indiacensus.growth
GROUP BY State
ORDER BY State;

-- Average literacy rate for each state 

SELECT State, ROUND(AVG(literacy)*100, 2) AS Average_LiteracyRate
FROM indiacensus.growth
GROUP BY State
ORDER BY Average_LiteracyRate DESC;

-- Top 5 states displaying highest growth percentage ratio
 
SELECT State, ROUND(AVG(growth)*100, 2) AS Average_Growth
FROM indiacensus.growth
GROUP BY State
ORDER BY Average_Growth DESC
LIMIT 5;

-- 5 states showing Least Sex Ratio

SELECT State, ROUND(AVG(sex_ratio)*100, 2) AS Average_SexRatio
FROM indiacensus.growth
GROUP BY State
ORDER BY Average_SexRatio
LIMIT 5;

-- fetch Top and Bottom 3 states for literacy rate in a single result set 

SELECT * FROM (SELECT State, ROUND(AVG(literacy),2) AS Average_LiteracyRate
FROM indiacensus.growth
GROUP BY State
ORDER BY Average_LiteracyRate DESC
LIMIT 3) A 
UNION 
SELECT * FROM (SELECT State, ROUND(AVG(literacy),2) AS Average_LiteracyRate
FROM indiacensus.growth
GROUP BY State
ORDER BY Average_LiteracyRate ASC
LIMIT 3) B;

-- total number of males and females from the census data 

SELECT c.district, c.state, 
	ROUND(c.population/(c.sex_ratio + 1), 0) AS males, 
    ROUND((c.population*c.sex_ratio)/(c.sex_ratio + 1), 0) AS females
FROM (
SELECT g.district, g.state, g.sex_ratio/1000 AS sex_ratio, p.population
FROM indiacensus.growth g 
INNER JOIN indiacensus.population p 
ON g.district = p.district) c;

-- Total no of people who are literate from the population in each state 
SELECT d.state, SUM(d.Literate_People) AS total_literates FROM 
(SELECT c.district, c.state, ROUND(c.literacy_ratio*c.population, 0) AS Literate_People FROM 
(SELECT g.district, g.state, g.literacy/100 AS literacy_ratio, p.population
FROM indiacensus.growth g
INNER JOIN indiacensus.population p
ON g.district = p.district) c) d
GROUP BY state;

-- Population in previous census 

SELECT c.district, c.state, ROUND(c.population/(1 + c.growth_rate), 0) AS prev_census_population, c.population AS curr_Census_population 
FROM (
SELECT g.district, g.state, g.growth AS growth_rate, p.population
FROM indiacensus.growth g 
INNER JOIN indiacensus.population p
ON g.district = p.district) c;

-- Find out the top 3 district from each states having high literacy ratio

SELECT a.* FROM 
(SELECT district, state, literacy,
DENSE_RANK() OVER(PARTITION BY state ORDER BY literacy DESC) AS rnk
FROM indiacensus.growth) a
WHERE a.rnk <= 3;