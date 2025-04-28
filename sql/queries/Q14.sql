-- Query 14: Genres with the same number of appearances in two consecutive years (at least 3 per year)
WITH GenreYearCount AS (
    SELECT 
        g.genre_id,
        g.genre_name,
        YEAR(e.event_date) AS performance_year,
        COUNT(DISTINCT p.performance_id) AS performance_count
    FROM 
        Genre g
        JOIN ArtistGenre ag ON g.genre_id = ag.genre_id
        JOIN Artist a ON ag.artist_id = a.artist_id
        JOIN Performance p ON a.artist_id = p.artist_id
        JOIN Event e ON p.event_id = e.event_id
    GROUP BY 
        g.genre_id, g.genre_name, performance_year
    HAVING 
        performance_count >= 3
)
SELECT 
    g1.genre_name,
    g1.performance_year AS year1,
    g2.performance_year AS year2,
    g1.performance_count
FROM 
    GenreYearCount g1
    JOIN GenreYearCount g2 ON g1.genre_id = g2.genre_id 
        AND g1.performance_count = g2.performance_count 
        AND g2.performance_year = g1.performance_year + 1
ORDER BY 
    g1.genre_name, g1.performance_year;
