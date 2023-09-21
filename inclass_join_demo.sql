SELECT * FROM favorite_song;

SELECT * FROM artist;

-- LEFT TABLE (FROM CLAUSE)
-- RIGHT TABLE (JOIN CLAUSE)

--Inner Join
SELECT *
FROM artist
INNER JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id;

-- LEFT JOIN
SELECT *
FROM artist
LEFT JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id;

--RIGHT JOIN
SELECT *
FROM artist
RIGHT JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id;

-- FULL JOIN
SELECT artist_name, song_name, a.artist_id AS a_id
FROM artist AS a
FULL JOIN favorite_song AS f_s
ON a.artist_id = f_s.artist_id;


-- You can add any filter from day 1 here as well
SELECT artist_name, song_name, plays
FROM artist
INNER JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id
WHERE plays > 10000000
ORDER BY plays DESC;