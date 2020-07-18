SELECT COUNT(id) 
FROM stops

SELECT id
FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name
FROM stops
JOIN route ON stops.id=route.stop
WHERE num = '4' AND company = 'LRT'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

SELECT A.company, A.num
FROM route A
JOIN route B ON A.company = B.company AND A.num = B.num
WHERE (A.stop=115 AND B.stop=137) OR (B.stop=115 AND A.stop=137)
GROUP BY company, num

SELECT A.company, A.num
FROM route A
JOIN route B ON A.company = B.company AND A.num = B.num
JOIN stops s1 ON A.stop=s1.id
JOIN stops s2 ON B.stop=s2.id
WHERE (s1.name= 'Craiglockhart' AND s2.name='Tollcross') OR (s2.name= 'Craiglockhart' AND s1.name='Tollcross')
GROUP BY company, num

SELECT DISTINCT s2.name, A.company, A.num
FROM route A
JOIN route B ON A.company = B.company AND A.num = B.num
JOIN stops s1 ON A.stop=s1.id
JOIN stops s2 ON B.stop=s2.id
WHERE s1.name= 'Craiglockhart'

SELECT DISTINCT A.num, A.company, s2.name, D.num, D.company
FROM route A
JOIN route B ON (A.company = B.company AND A.num = B.num)
JOIN route C ON (B.stop = C.stop AND B.num != C.num)
JOIN route D ON (C.company = D.company AND C.num = D.num)
JOIN stops s1 ON A.stop=s1.id
JOIN stops s2 ON B.stop=s2.id
JOIN stops s3 ON C.stop=s3.id
JOIN stops s4 ON D.stop=s4.id
WHERE s1.name= 'Craiglockhart' AND s4.name='Lochend' AND s2.name=s3.name
ORDER BY A.num, s2.name, 4
