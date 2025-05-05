SET profiling = 1;

-- Nested Loop Join
SELECT /*+ JOIN_ORDER(a, p, r) JOIN_PREFIX(a, p USING(nested_loop)) */
    a.artist_id,
    a.artist_name,
    AVG(r.artist_performance) AS avg_artist_performance,
    AVG(r.overall_impression) AS avg_overall_impression
FROM 
    Artist a
    INNER JOIN Performance p ON a.artist_id = p.artist_id
    INNER JOIN Rating r ON p.performance_id = r.performance_id
WHERE 
    a.artist_id = 4
GROUP BY 
    a.artist_id, a.artist_name;

-- Hash Join
SELECT /*+ HASH_JOIN(p) HASH_JOIN(r)*/
    a.artist_id,
    a.artist_name,
    AVG(r.artist_performance) AS avg_artist_performance,
    AVG(r.overall_impression) AS avg_overall_impression
FROM 
    Artist a
    INNER JOIN Performance p ON a.artist_id = p.artist_id
    INNER JOIN Rating r ON p.performance_id = r.performance_id
WHERE 
    a.artist_id = 4
GROUP BY 
    a.artist_id, a.artist_name;

SHOW PROFILES;