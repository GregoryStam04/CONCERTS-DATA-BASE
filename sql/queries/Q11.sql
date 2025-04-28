-- Query 11: Artists who performed at least 5 fewer times than the most active artist
WITH MaxPerformances AS (
    SELECT 
        COUNT(p.performance_id) AS performance_count
    FROM 
        Artist a
        JOIN Performance p ON a.artist_id = p.artist_id
    GROUP BY 
        a.artist_id
    ORDER BY 
        performance_count DESC
    LIMIT 1
)
SELECT 
    a.artist_id,
    a.artist_name,
    COUNT(p.performance_id) AS performance_count,
    (SELECT performance_count FROM MaxPerformances) - COUNT(p.performance_id) AS difference
FROM 
    Artist a
    JOIN Performance p ON a.artist_id = p.artist_id
GROUP BY 
    a.artist_id, a.artist_name
HAVING 
    difference >= 5
ORDER BY 
    performance_count DESC;