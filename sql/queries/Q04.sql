SET profiling = 1;
SET join_cache_level = 2;
-- Query 4: Average ratings for a specific artist
EXPLAIN
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
EXPLAIN
SELECT 
    a.artist_id,
    a.artist_name,
    AVG(r.artist_performance) AS avg_artist_performance,
    AVG(r.overall_impression) AS avg_overall_impression
FROM 
    Artist a
    JOIN Performance p FORCE INDEX (idx_performance_artist) ON a.artist_id = p.artist_id
    JOIN Rating r FORCE INDEX (idx_rating_performance) ON p.performance_id = r.performance_id
WHERE 
    a.artist_id = 4
GROUP BY 
    a.artist_id, a.artist_name;

-- Nested Loop Join
EXPLAIN
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

-- Hash Join BNLH
SET join_cache_level = 4;
SET SESSION optimizer_switch = 'join_cache_hashed=on,join_cache_bka=off';
EXPLAIN /*+ HASH_JOIN(p) HASH_JOIN(r)*/
SELECT 
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

--Hash Join BKAH
SET join_cache_level = 8;
SET SESSION optimizer_switch = 'join_cache_hashed=on,join_cache_bka=off';
EXPLAIN /*+ HASH_JOIN(p) HASH_JOIN(r)*/
SELECT 
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