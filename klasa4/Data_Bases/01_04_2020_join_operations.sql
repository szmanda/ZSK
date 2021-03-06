-- https://sqlzoo.net/wiki/More_JOIN_operations#192_movies

-- 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
  FROM movie
  WHERE yr=1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
  FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr;

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- 5. What is the id of the film 'Casablanca'
SELECT id FROM movie
WHERE title LIKE "%Casablanca%";

-- 6. Obtain the cast list for 'Casablanca'.
SELECT name
FROM actor, casting
WHERE id = actorid AND movieid = (
    SELECT id FROM movie
    WHERE title LIKE "%Casablanca%");

-- 7. Obtain the cast list for the film 'Alien'
SELECT name
FROM actor
JOIN casting
  ON (id=actorid AND movieid = (
      SELECT id FROM movie WHERE title = 'Alien'));

-- 8. List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie JOIN casting
  ON (id=movieid AND actorid = (
      SELECT id FROM actor
      WHERE name = 'Harrison Ford'));

-- poniższe daje inny wynik
SELECT title
FROM movie JOIN casting
  ON (movie.id=casting.movieid)
JOIN actor
  ON (casting.actorid=actor.name);

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title
FROM movie JOIN casting
  ON (id=movieid AND actorid = (
    SELECT id FROM actor WHERE name = 'Harrison Ford')
    AND ord != 1);

-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
ORDER BY 2 DESC;

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, actor.name
FROM movie
JOIN casting
  ON movie.id = movieid
JOIN actor
  ON actorid = actor.id
WHERE ord = 1 AND movieid IN(
    SELECT movieid FROM casting
    JOIN actor
    ON actorid = actor.id
    WHERE name='Julie Andrews');


-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles
SELECT name
FROM actor
JOIN casting
ON (id=actorid)
WHERE ord=1
GROUP BY name
HAVING COUNT(ord)>=15
