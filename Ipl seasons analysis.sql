create database if not exists ipl;



/*batting summery*/

/*What is the total number of runs scored by top 10 player in the  IPL  */
SELECT 
    batting_summary.batsmanName,
    SUM(batting_summary.runs) AS total_runs
FROM
    batting_summary
GROUP BY batting_summary.batsmanName
ORDER BY total_runs DESC
LIMIT 10;



/*total run scored by bastsman with team name in 2021 seaseons*/
SELECT 
    match_summery.year,
    players.team,
    batting_summary.batsmanName,
    SUM(batting_summary.runs) AS total_runs
FROM
    match_summery
        JOIN
    batting_summary ON match_summery.match_id = batting_summary.match_id
        JOIN
    players ON batting_summary.batsmanName = players.name
WHERE
    year IN (2021)
GROUP BY match_summery.year , players.team , batting_summary.batsmanName
ORDER BY match_summery.year ASC , SUM(batting_summary.runs) DESC
LIMIT 10;




/* avg run scord by each players in 2021 2022 2023 ok */
SELECT 
    match_summery.year,
    players.name,
    ROUND(AVG(batting_summary.runs), 2) AS avg_runs
FROM
    players
        JOIN
    batting_summary ON batting_summary.batsmanName = players.name
        JOIN
    match_summery ON batting_summary.match_id = match_summery.match_id
WHERE
    year IN (2021 , 2022, 2023)
GROUP BY match_summery.year , players.name
HAVING AVG(batting_summary.runs) > 40
ORDER BY match_summery.year ASC , AVG(batting_summary.runs) DESC;


/* players name with total sixs and total fours in year 2021,2022,2023 (ok)*/
SELECT 
    players.name,
    match_summery.year,
    SUM(6s) AS total_sixs,
    SUM(4s) AS total_fours
FROM
    batting_summary
        JOIN
    players ON batting_summary.batsmanName = players.name
        JOIN
    match_summery ON batting_summary.match_id = match_summery.match_id
WHERE
    year IN (2021 , 2022, 2023)
GROUP BY players.name , match_summery.year
HAVING SUM(6s) > 20 AND SUM(4s) > 20
ORDER BY match_summery.year ASC , SUM(6s) DESC , SUM(4s) DESC;


/*avg run score by m s dhoni in three seasions*/
SELECT 
    match_summery.year,
    batting_summary.batsmanName,
    AVG(batting_summary.runs) AS avg_runs
FROM
    batting_summary
        JOIN
    match_summery ON batting_summary.match_id = match_summery.match_id
WHERE
    batsmanName = 'Msdhoni'
        AND year IN (2021 , 2022, 2023)
GROUP BY match_summery.year , batting_summary.batsmanName
ORDER BY match_summery.year ASC , AVG(batting_summary.runs) DESC;




/*bowling summery*/

/*q2 What is the total number of wickets taken by each bowler */
SELECT 
    bowling_summary.bowlerName,
    SUM(bowling_summary.wickets) AS total_wickets
FROM
    bowling_summary
GROUP BY bowling_summary.bowlerName
ORDER BY total_wickets DESC;


/* Who are the top 10 wicket-takers in the 2021 seasons bowler name with total wicketes */
SELECT 
    bowling_summary.bowlerName,
    match_summery.year,
    SUM(bowling_summary.wickets) AS total_wickets
FROM
    bowling_summary
        JOIN
    match_summery ON bowling_summary.match_id = match_summery.match_id
WHERE
    year IN (2021 , 2022, 2023)
GROUP BY bowling_summary.bowlerName , match_summery.year
ORDER BY match_summery.year ASC , SUM(bowling_summary.wickets) DESC
LIMIT 10;


/* match summery*/

/*q3 How many matches won by each team */
SELECT 
    match_summery.winner, COUNT(*) AS total_win
FROM
    match_summery
GROUP BY match_summery.winner;


/* avg strick rate of teams */
SELECT 
    players.team,
    match_summery.year,
    ROUND(AVG(batting_summary.SR), 2) AS avg_striker_rate
FROM
    players
        JOIN
    batting_summary ON players.name = batting_summary.batsmanName
        JOIN
    match_summery ON batting_summary.match_id = match_summery.match_id
WHERE
    year IN (2021 , 2022, 2023)
GROUP BY players.team , match_summery.year
ORDER BY match_summery.year ASC , AVG(batting_summary.SR) DESC;


/*how many matches win by each team and run or wicket in three sesons*/
SELECT 
    match_summery.year,
    match_summery.won_by,
    match_summery.winner,
    COUNT(match_summery.winner)
FROM
    match_summery
WHERE
    year IN (2021 , 2022, 2023)
GROUP BY match_summery.year , match_summery.won_by , match_summery.winner
ORDER BY match_summery.year ASC , COUNT(match_summery.winner) DESC;



/* thank you*/











