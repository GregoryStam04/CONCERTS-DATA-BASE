-- Query 2: Find all artists of a specific genre with indication if they participated in a specific year's festival
SELECT 
    a.artist_id,
    a.artist_name,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM Performance p
                JOIN Event e ON p.event_id = e.event_id
                JOIN Stage s ON e.stage_id = s.stage_id
                JOIN Festival f ON s.festival_id = f.festival_id
            WHERE 
                p.artist_id = a.artist_id AND YEAR(f.start_date) = 2019
        ) THEN 'Yes'
        ELSE 'No'
    END AS performed_in_festival_2019
FROM 
    Artist a
    JOIN ArtistGenre ag ON a.artist_id = ag.artist_id
    JOIN Genre g ON ag.genre_id = g.genre_id
WHERE 
    g.genre_name = 'Rock'
ORDER BY 
    a.artist_name;