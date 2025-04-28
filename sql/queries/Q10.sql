-- Query 10: Top 3 genre pairs common among artists who performed at festivals
SELECT 
    g1.genre_name AS genre1,
    g2.genre_name AS genre2,
    COUNT(DISTINCT a.artist_id) AS artist_count
FROM 
    ArtistGenre ag1
    JOIN ArtistGenre ag2 ON ag1.artist_id = ag2.artist_id AND ag1.genre_id < ag2.genre_id
    JOIN Genre g1 ON ag1.genre_id = g1.genre_id
    JOIN Genre g2 ON ag2.genre_id = g2.genre_id
    JOIN Artist a ON ag1.artist_id = a.artist_id
    JOIN Performance p ON a.artist_id = p.artist_id
GROUP BY 
    g1.genre_name, g2.genre_name
ORDER BY 
    artist_count DESC
LIMIT 3;