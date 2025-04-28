-- Query 5: Young artists (under 30) with most festival appearances
SELECT 
    a.artist_id,
    a.artist_name,
    TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
    COUNT(DISTINCT f.festival_id) AS festival_count
FROM 
    Artist a
    JOIN Performance p ON a.artist_id = p.artist_id
    JOIN Event e ON p.event_id = e.event_id
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN Festival f ON s.festival_id = f.festival_id
WHERE 
    TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) < 30
GROUP BY 
    a.artist_id, a.artist_name
ORDER BY 
    festival_count DESC;