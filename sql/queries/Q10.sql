-- Query 10: Top 3 genre pairs common among artists who performed at festivals
SELECT 
    g1.genre_name AS genre1,
    g2.genre_name AS genre2,
    COUNT(DISTINCT genre_pairs.event_id) AS appearance_count
FROM (
    -- Genre pairs for artists who performed
    SELECT 
        ag1.artist_id,
        ag1.genre_id AS genre_id1,
        ag2.genre_id AS genre_id2,
        p.event_id
    FROM Performance p
    JOIN ArtistGenre ag1 ON p.artist_id = ag1.artist_id
    JOIN ArtistGenre ag2 ON p.artist_id = ag2.artist_id AND ag1.genre_id < ag2.genre_id
    WHERE p.artist_id IS NOT NULL
    UNION
    -- Genre pairs for bands who performed
    SELECT 
        p.band_id AS band_id,
        bg1.genre_id AS genre_id1,
        bg2.genre_id AS genre_id2,
        p.event_id
    FROM Performance p
    JOIN BandGenre bg1 ON p.band_id = bg1.band_id
    JOIN BandGenre bg2 ON p.band_id = bg2.band_id AND bg1.genre_id < bg2.genre_id
    WHERE p.band_id IS NOT NULL
) AS genre_pairs
JOIN Genre g1 ON genre_pairs.genre_id1 = g1.genre_id
JOIN Genre g2 ON genre_pairs.genre_id2 = g2.genre_id
GROUP BY 
	genre1, genre2
ORDER BY 
	appearance_count DESC
LIMIT 3;
