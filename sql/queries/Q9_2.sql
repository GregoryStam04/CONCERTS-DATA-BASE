-- Query 9: Visitors who attended the same number of events in a year (more than 3), matched with others (Different output format)
SELECT 
    v1.visitor_id,
    v1.first_name,
    v1.last_name,
    v2.visitor_id AS other_visitor_id,
    v2.first_name AS other_first_name,
    v2.last_name AS other_last_name,
    YEAR(e.event_date) as event_year,
    COUNT(DISTINCT t1.event_id) AS event_count
FROM 
    Visitor v1
JOIN 
    Ticket t1 ON v1.visitor_id = t1.visitor_id
JOIN 
    Event e ON t1.event_id = e.event_id,
    Visitor v2
JOIN 
    Ticket t2 ON v2.visitor_id = t2.visitor_id
WHERE 
    v1.visitor_id < v2.visitor_id
    AND YEAR(e.event_date) = 2017
    AND t1.is_used = TRUE
    AND t2.is_used = TRUE
GROUP BY 
    v1.visitor_id, v1.first_name, v1.last_name, 
    v2.visitor_id, v2.first_name, v2.last_name
HAVING 
    event_count >= 3
    AND event_count = (
        SELECT COUNT(DISTINCT t3.event_id)
        FROM Ticket t3
        JOIN Event e2 ON t3.event_id = e2.event_id
        WHERE t3.visitor_id = v2.visitor_id
        AND YEAR(e2.event_date) = 2017
        AND t3.is_used = TRUE
    )
ORDER BY 
    event_count DESC, v1.last_name, v2.last_name;
