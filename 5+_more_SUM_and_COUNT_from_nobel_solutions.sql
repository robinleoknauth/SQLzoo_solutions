-- These are my solutions of the extra SUM and COUNT questions of the
-- nobel DB of SQLZoo
-- https://sqlzoo.net/wiki/The_nobel_table_can_be_used_to_practice_more_SUM_and_COUNT_functions.



/*
1)
Show the total number of prizes awarded.
*/

SELECT COUNT(winner)
FROM nobel;


/*
2)
List each subject - just once
*/

SELECT DISTINCT subject
FROM nobel;

/*
3)
Show the total number of prizes awarded for Physics.
*/

SELECT COUNT(winner) as Number_of_physics_nobel_prize_winners
FROM nobel
WHERE subject = 'Physics';

/*
4)
For each subject show the subject and the number of prizes.
*/

SELECT subject, COUNT(winner)
FROM nobel
GROUP BY 1;

/*
5)
For each subject show the first year that the prize was awarded.
*/

SELECT subject, MIN(yr)
FROM nobel
GROUP BY 1;


/*
6)
For each subject show the number of prizes awarded in the year 2000.
*/

SELECT subject, COUNT(winner) AS Number_of_awards
FROM nobel
WHERE yr = 2000
GROUP BY 1;

/*
7)
Show the number of different winners for each subject.
*/

SELECT subject, COUNT(DISTINCT winner) AS number_of_differnt_winners
FROM nobel
GROUP BY 1;

/*
8)
For each subject show how many years have had prizes awarded.
*/

SELECT subject, COUNT(DISTINCT yr) AS number_of_differnt_years
FROM nobel
GROUP BY 1;

/*
9)
Show the years in which three prizes were given for Physics.
*/

SELECT yr
FROM nobel
WHERE subject = 'Physics'
GROUP BY 1
HAVING COUNT(subject) = 3;

/*
10)
Show winners who have won more than once.
*/

SELECT DISTINCT winner
FROM nobel
GROUP BY 1
HAVING COUNT(winner) > 1;

/*
11)
Show winners who have won more than one subject.
*/

SELECT DISTINCT winner
FROM nobel
GROUP BY 1
HAVING COUNT(winner) > 1 AND COUNT(DISTINCT subject) > 1;

/*
12)
Show the year and subject where 3 prizes were given. Show only years 2000 onwards.
*/

SELECT yr, subject
FROM nobel
WHERE yr > 1999
GROUP BY 1,2
HAVING COUNT(subject) = 3;

/*
)

*/
