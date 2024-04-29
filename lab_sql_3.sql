-- Instructions

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT LAST_NAME)
FROM SAKILA.ACTOR;

-- In how many different languages were the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT LANGUAGE_ID)
FROM SAKILA.LANGUAGE;

-- How many movies were released with "PG-13" rating?
SELECT COUNT(DISTINCT TITLE)
FROM SAKILA.FILM
WHERE RATING IN ("PG-13");

-- Get the 10 longest movies from 2006.
SELECT TITLE AS 'LONGEST FILMS', LENGTH AS 'LENGTH(MIN)'
FROM SAKILA.FILM
WHERE RELEASE_YEAR IN ('2006')
ORDER BY LENGTH DESC
LIMIT 10;

-- How many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(CURRENT_DATE, MIN(RENTAL_DATE)) AS 'COMPANY OPERATION(DAYS)'
FROM SAKILA.RENTAL; -- 'has been operating' = it still works until now
SELECT DATEDIFF(MAX(RENTAL_DATE), MIN(RENTAL_DATE)) AS 'COMPANY OPERATION(DAYS)'
FROM SAKILA.RENTAL; -- 	here is the diff between the last and first day of operation in the table

-- Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTH(RENTAL_DATE), WEEKDAY(RENTAL_DATE), MONTH(RETURN_DATE), WEEKDAY(RETURN_DATE)
FROM SAKILA.RENTAL
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
		-- 0=MONDAY; 1=TUESDAY; 2=WEDNESDAY; 3=THURSDAY; 4=FRIDAY; 5=SATURDAY; 6=SUNDAY
SELECT *, 
  CASE 
    WHEN WEEKDAY(RENTAL_DATE) < 5 THEN 'workday'
    ELSE 'weekend'
  END AS day_type
FROM SAKILA.RENTAL;

-- How many rentals were there in the last month of activity?
SELECT COUNT(RENTAL_ID)
FROM SAKILA.RENTAL
WHERE MONTH(RENTAL_DATE) = (SELECT MONTH(MAX(RENTAL_DATE)) FROM SAKILA.RENTAL) 
  AND YEAR(RENTAL_DATE) = (SELECT YEAR(MAX(RENTAL_DATE)) FROM SAKILA.RENTAL);


