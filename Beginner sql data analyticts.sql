-- The main eda 

-- Project Goals
-- by the end of this project, we shoud   
# Understand our dataset - its structure, columns, and the kind of data it holds\
# Mastered basic SQL commands - like SELECT, WHERE. GROUP BY, ORDER BY, JOIN, and aggregate functions
# Draw meaningful insights - identify trends, patterns, and outliers form the  layoffs data
# Build a storytelling mindset - turn raw data into clear, actionable insights
# Write clean, well_structured SQL code - with comments so others (and future you) can understand it

# Fetching specific columns


select *
from layoffs_staging2;

select company, industry from layoffs_staging2;

# using aliase to rename the columns
select company as Company_name, total_laid_off as layoffs 
from layoffs_staging2;


# 2 Filtering Data - Where
# what it does - it filters rows based on a condition. only rows meeting the condition appear in the result.

select * from layoffs_staging2
where industry = 'Tech';

#companies with more than 1000 layoffs

select company, total_laid_off
from layoffs_staging2
where total_laid_off > 1000;

-- 3. Order by - sorting results
# what it does: order by sorts results in ascending or in descending order

-- syntax
# select column_name from table_name order by column_name {asc\desc}

# sort layoffs by the highest number
select total_laid_off
from layoffs_staging2
order by total_laid_off desc;

# sort layoffs alphabetically by company
select company, industry
from layoffs_staging2 
order by company asc;

-- 4. Group by - Grouping data
# What it does - group by groups rows sharing the same value into summary rows - often used with aggregate functions.alter
-- syntax
# select column_namme, aggregate_function(column_name) from table_name group by column_name;

# total layoffs by industry
select industry, sum(total_laid_off) as total_layoffs
from layoffs_staging2
group by industry;

# average layoffs percentage by country
select country, avg(percentage_laid_off) as total_percentage_laid_off
from layoffs_staging2
group by country;

-- having - filtering grouped data
# what it does: having filters results after aggregation (like GROUP BY), unlike WHERE, which filters rows befare aggregation.
-- syntax
# select column_name, aggregate_functionn(column_name) from table_name group by column_name having condition

#industries with more than 10000

select industry, sum(total_laid_off) as total_layoffs
from layoffs_staging2
group by industry
having total_layoffs > 10000;

# coutries with an average layoffs percentage over 5%
select *
from layoffs_staging2;

select country, avg(percentage_laid_off) as avg_percentage
from layoffs_staging2
group by country
having avg_percentage > 5;

-- 6. count() - counting rows
# what it does: count() returns the number of rows matching a condition
-- syntax
# select count(column_name) from table_name;

select count(*) as total_records
from layoffs_staging2;

# number of distinct companies
select count(distinct company) as unique_company
from layoffs_staging2;

-- 7 - sum() - Adding values
# what it does: sum() returns the total of a numeric column
-- syntax
# select sum(column_name) from  table_name;

# find the total number of layoffs across all companies
select company, sum(total_laid_off) as total_layoffs
from layoffs_staging2
group by company;

# the total layoffs in the finance industry:

select sum(total_laid_off) as finance_layoffs
from layoffs
where industry = 'finance';

-- 7, AVG() - Calculating Averages 
# what it does: it returns the average of a numeric column.
# syntax: select AVG(column_name) from table_name

# find the Average layoffs percentage across industries:

select company, avg(percentage_laid_off)
from layoffs_staging2
group by company;

-- min() and max() - finding the  minimum and the maximum
# what they do min() returns the smallest value. max() returns the largest value.
# syntax select MIN(column_name), max(column_name) form table_name;

select min(`date`) as  first_layoff, max(`date`) as last_layoff
 from layoffs_staging2;
 
 select *
 from layoffs_staging2;
 -- excercises
 # find the 5 cities with the highest total layoffs.
 select location, sum(total_laid_off) as total_layoffs
 from layoffs_staging2
 group by location
 order by total_layoffs desc
 limit 5;
 
 # 2, get the  average number of layoffd per company
 
 select company, avg(total_laid_off) as avg_layoffs
 from layoffs_staging2
 group by company;
 
 
select *
from layoffs_staging2
where `date` > '2022-12-31';

# find the top three industries with the hoighest average percentage of workforce laid off;

select industry, avg(percentage_laid_off) as avg_percentage
from layoffs_staging2
group by industry
order by avg_percentage desc
limit 3;

# count how many layoffs in the finance industry
select sum(total_laid_off) as finance_layoffs
from layoffs_staging2
where industry = 'finance';