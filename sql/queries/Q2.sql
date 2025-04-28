-- Query 2: Artists in a specific genre, indicating if they performed in a given year
SELECT 
    a.artist_id,
    a.artist_name,
    CASE 
        WHEN COUNT(p.performance_id) > 0 THEN 'Yes'
        ELSE 'No'
    END AS performed_in_festival
FROM 
    Artist a
    JOIN ArtistGenre ag ON a.artist_id = ag.artist_id
    JOIN Genre g ON ag.genre_id = g.genre_id
    LEFT JOIN Performance p ON a.artist_id = p.artist_id
    LEFT JOIN Event e ON p.event_id = e.event_id
    LEFT JOIN Stage s ON e.stage_id = s.stage_id
    LEFT JOIN Festival f ON s.festival_id = f.festival_id AND YEAR(f.start_date) = 2024 -- Replace with desired year
WHERE 
    g.genre_name = 'Rock'  -- Replace with desired genre
GROUP BY 
    a.artist_id, a.artist_name;