-- Query 13: Artists who performed in festivals on at least 3 different continents
SELECT 
    a.artist_id,
    a.artist_name,
    COUNT(DISTINCT l.continent) AS continent_count
FROM 
    Artist a
    JOIN Performance p ON a.artist_id = p.artist_id
    JOIN Event e ON p.event_id = e.event_id
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN Festival f ON s.festival_id = f.festival_id
    JOIN Location l ON f.location_id = l.location_id
GROUP BY 
    a.artist_id, a.artist_name
HAVING 
    continent_count >= 3
ORDER BY 
    continent_count DESC, a.artist_name;