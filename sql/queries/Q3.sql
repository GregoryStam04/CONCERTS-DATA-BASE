-- Query 3: Artists who appeared as "warm up" more than 2 times in the same festival
SELECT 
    a.artist_id,
    a.artist_name,
    f.festival_name,
    COUNT(*) AS warm_up_count
FROM 
    Performance p
    JOIN Artist a ON p.artist_id = a.artist_id
    JOIN Event e ON p.event_id = e.event_id
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN Festival f ON s.festival_id = f.festival_id
WHERE 
    p.performance_type = 'warm up'
GROUP BY 
    a.artist_id, a.artist_name, f.festival_id, f.festival_name
HAVING 
    COUNT(*) > 2;
