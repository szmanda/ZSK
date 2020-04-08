-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
  FROM world
  WHERE gdp > ALL (
    SELECT gdp
    FROM world
    WHERE continent='Europe' AND gdp>0)

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL(
    SELECT area FROM world y
      WHERE y.continent=x.continent
        AND x.name <> y.name)

-- 8. List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
  FROM world x
  WHERE name = (
    SELECT name FROM world
    WHERE continent=x.continent ORDER BY name LIMIT 1)

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
  FROM world x
  WHERE 25000000 >= ALL (
    SELECT population FROM world y WHERE x.continent=y.continent);


-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
  FROM world x
  WHERE population > ALL (
    SELECT population*3 FROM world y WHERE x.continent=y.continent AND x.name <> y.name);
