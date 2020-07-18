SELECT matchid,player FROM goal 
  WHERE teamid = 'GER';

SELECT id,stadium,team1,team2
  FROM game 
  WHERE id = 1012;

SELECT player, teamid, stadium, mdate
  FROM game 
  INNER JOIN goal ON game.id = goal.matchid
  WHERE teamid = 'GER';

SELECT team1, team2, player 
FROM game
INNER JOIN goal AS g ON game.id = g.matchid
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
  FROM goal 
  INNER JOIN eteam ON goal.teamid = eteam.id
 WHERE gtime<=10;

SELECT mdate, teamname 
FROM game
INNER JOIN eteam ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos';

SELECT player 
FROM goal 
INNER JOIN game ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE goal.teamid <> 'GER' AND (game.team2 = 'GER' OR game.team1 = 'GER')

SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

SELECT stadium, COUNT(stadium)
FROM game
INNER JOIN goal ON game.id = goal.matchid
GROUP BY stadium

SELECT DISTINCT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON (id = matchid)
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

SELECT DISTINCT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON (id = matchid)
 WHERE (teamid = 'GER')
GROUP BY matchid, mdate;

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2
  ORDER BY mdate