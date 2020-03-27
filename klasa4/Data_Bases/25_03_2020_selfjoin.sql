-- https://sqlzoo.net/wiki/Self_join

SELECT COUNT(id) from stops;

SELECT id FROM stops WHERE name='Craiglockhart';

select id, name from stops where id in
(SELECT stop from route where num='4' AND company='LRT');

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop IN (SELECT id from stops where name='London Road');

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

SELECT DISTINCT a.company, a.num FROM route a
INNER JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop = 115 AND b.stop=137;

-- 8

SELECT DISTINCT s.name, a.company, a.num
FROM route a INNER JOIN route b ON
(a.company=b.company AND a.num=b.num)
INNER JOIN stops s ON (b.stop=s.id)
WHERE a.company = 'LRT' and a.stop = (
SELECT id FROM stops WHERE name='Craiglockhart'
);

-- 10

