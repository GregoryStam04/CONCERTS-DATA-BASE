-- Query 9: Visitors who attended the same number of events in a year (more than 3)
SELECT 
    v.visitor_id,
    v.first_name,
    v.last_name,
    COUNT(DISTINCT t.event_id) AS events_attended,
    YEAR(e.event_date) AS event_year
FROM 
    Visitor v
    JOIN Ticket t ON v.visitor_id = t.visitor_id
    JOIN Event e ON t.event_id = e.event_id
WHERE 
    t.is_used = TRUE
GROUP BY 
    v.visitor_id, v.first_name, v.last_name, YEAR(e.event_date)
HAVING 
    events_attended > 3
    AND EXISTS (
        SELECT 1
        FROM (
            SELECT 
                other_v.visitor_id,
                COUNT(DISTINCT other_t.event_id) AS other_events_count
            FROM 
                Visitor other_v
                JOIN Ticket other_t ON other_v.visitor_id = other_t.visitor_id
                JOIN Event other_e ON other_t.event_id = other_e.event_id
            WHERE 
                other_v.visitor_id <> v.visitor_id
                AND other_t.is_used = TRUE
                AND YEAR(other_e.event_date) = YEAR(e.event_date)
            GROUP BY 
                other_v.visitor_id
            HAVING 
                other_events_count = events_attended
        ) AS same_count_visitors
    );