-- Query 9: Visitors who attended the same number of events in a year (more than 3), matched with others
SELECT
    v1.visitor_id,
    v1.first_name,
    v1.last_name,
    v1.event_year,
    v1.events_attended
FROM (
    SELECT 
        v.visitor_id,
        v.first_name,
        v.last_name,
        YEAR(e.event_date) AS event_year,
        COUNT(DISTINCT t.event_id) AS events_attended
    FROM 
        Visitor v
        JOIN Ticket t ON v.visitor_id = t.visitor_id
        JOIN Event e ON t.event_id = e.event_id
    WHERE 
        t.is_used = TRUE
    GROUP BY 
        v.visitor_id, v.first_name, v.last_name, YEAR(e.event_date)
) v1
JOIN (
    SELECT 
        visitor_id,
        YEAR(e.event_date) AS event_year,
        COUNT(DISTINCT t.event_id) AS events_attended
    FROM 
        Ticket t
        JOIN Event e ON t.event_id = e.event_id
    WHERE 
        t.is_used = TRUE
    GROUP BY 
        visitor_id, YEAR(e.event_date)
) v2
ON v1.event_year = v2.event_year
   AND v1.events_attended = v2.events_attended
   AND v1.visitor_id <> v2.visitor_id
WHERE 
    v1.events_attended > 3
ORDER BY 
    v1.event_year, v1.events_attended DESC;