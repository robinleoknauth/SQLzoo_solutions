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
6)
A "title track" is where the song is the same as the title. Find the title tracks.
*/

SELECT song
FROM album
JOIN track ON (asin = album)
WHERE song = title;

/*
7)
An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
*/

SELECT title
FROM album
WHERE artist = title;

/*
8)
Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.
*/

SELECT track.song, COUNT(album.title) AS Song_count
FROM album JOIN track ON (album.asin = track.album)
GROUP BY track.song
HAVING COUNT(DISTINCT album.title) > 2

/*
9)
A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks.
*/

SELECT title, price, COUNT(song)
FROM album JOIN track ON (album.asin = track.album)
GROUP BY 1, 2
HAVING price / COUNT(song) < 0.5

/*
10)
Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101 tracks.

List albums so that the album with the most tracks is first. Show the title and the number of tracks

-- NOTE this will come back as incorrect, "too many rows",
but it returns exactly what their example wants you to return.
*/

SELECT title, COUNT(asin)
FROM album JOIN track ON (album.asin = track.album)
GROUP BY 1
ORDER BY 2 DESC
