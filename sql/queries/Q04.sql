SET profiling = 1;

-- Query 4: Average ratings for a specific artist
SELECT 
    a.artist_id,
    a.artist_name,
    AVG(r.artist_performance) AS avg_artist_performance,
    AVG(r.overall_impression) AS avg_overall_impression
FROM 
    Artist a
    JOIN Performance p ON a.artist_id = p.artist_id
    JOIN Rating r ON p.performance_id = r.performance_id
WHERE 
    a.artist_id = 4  -- Replace with specific artist ID
GROUP BY 
    a.artist_id, a.artist_name;

-- Query 4 Alternative with force index:
SELECT 
    a.artist_id,
    a.artist_name,
    AVG(r.artist_performance) AS avg_artist_performance,
    AVG(r.overall_impression) AS avg_overall_impression
FROM 
    Artist a
    JOIN Performance p FORCE INDEX (idx_performance_artist) ON a.artist_id = p.artist_id
    JOIN Rating r FORCE INDEX (idx_rating_ticket) ON p.performance_id = r.performance_id
WHERE 
    a.artist_id = 4
GROUP BY 
    a.artist_id, a.artist_name;

SHOW PROFILES;