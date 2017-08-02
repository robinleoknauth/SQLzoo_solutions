-- These are my solutions of the music database questions  of SQLZoo
-- https://sqlzoo.net/wiki/Music_Tutorial




/*
1)
Find the title and artist who recorded the song 'Alison'.
*/

SELECT title, artist
FROM album JOIN track ON (album.asin = track.album)
WHERE song = 'Alison';

/*
2)
Which artist recorded the song 'Exodus'?
*/

SELECT artist
FROM album
JOIN track ON (album.asin = track.album)
WHERE song = 'Exodus';

/*
3)
Show the song for each track on the album 'Blur'
*/

SELECT song
FROM album JOIN track ON (asin = album)
WHERE title = 'Blur';


/*
4)
For each album show the title and the total number of track.
*/

SELECT title, COUNT(*)
FROM album JOIN track ON (asin = album)
GROUP BY title;

/*
5)
For each album show the title and the total number of tracks containing the word 'Heart' (albums with no such tracks need not be shown).
*/

SELECT title, COUNT(*)
FROM album
JOIN track ON (asin = album)
WHERE song LIKE '%heart%'
GROUP BY 1

/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/


/*
)

*/
