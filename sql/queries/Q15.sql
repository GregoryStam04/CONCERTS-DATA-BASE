-- Query 15: Top 5 visitors who gave highest total ratings to an artist
SELECT 
    v.visitor_id,
    v.first_name,
    v.last_name,
    a.artist_id,
    a.artist_name,
    SUM(r.artist_performance + r.sound_lighting + r.stage_presence + r.organization + r.overall_impression) AS total_rating
FROM 
    Visitor v
    JOIN Ticket t ON v.visitor_id = t.visitor_id
    JOIN Rating r ON t.ticket_id = r.ticket_id
    JOIN Performance p ON r.performance_id = p.performance_id
    JOIN Artist a ON p.artist_id = a.artist_id
GROUP BY 
    v.visitor_id, v.first_name, v.last_name, a.artist_id, a.artist_name
ORDER BY 
    total_rating DESC
LIMIT 5;