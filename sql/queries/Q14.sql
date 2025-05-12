-- QUERY 14: Music genres that had the same amount of appearances in two consequent years, with at least 3 appearances
WITH PerfGenre AS (
  -- all artist-genre performances
  SELECT 
    ag.genre_id,
    g.genre_name,
    YEAR(e.event_date) AS performance_year
  FROM Performance p
  JOIN Event e      ON p.event_id   = e.event_id
  JOIN Artist a     ON p.artist_id = a.artist_id
  JOIN ArtistGenre ag ON a.artist_id = ag.artist_id
  JOIN Genre g      ON ag.genre_id   = g.genre_id

  UNION ALL

  -- all band-genre performances
  SELECT 
    bg.genre_id,
    g.genre_name,
    YEAR(e.event_date) AS performance_year
  FROM Performance p
  JOIN Event e       ON p.event_id   = e.event_id
  JOIN Band b        ON p.band_id   = b.band_id
  JOIN BandGenre bg  ON b.band_id   = bg.band_id
  JOIN Genre g       ON bg.genre_id  = g.genre_id
),
GenreYearCount AS (
  SELECT 
    genre_id,
    genre_name,
    performance_year,
    COUNT(*) AS performance_count
  FROM PerfGenre
  GROUP BY genre_id, genre_name, performance_year
  HAVING performance_count >= 3
)
SELECT 
  g1.genre_name,
  g1.performance_year AS year1,
  g2.performance_year AS year2,
  g1.performance_count
FROM GenreYearCount g1
JOIN GenreYearCount g2 
  ON g1.genre_id       = g2.genre_id
 AND g2.performance_year = g1.performance_year + 1
 AND g1.performance_count = g2.performance_count
ORDER BY g1.genre_name, g1.performance_year;