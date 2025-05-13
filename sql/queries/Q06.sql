SET profiling = 1;

-- Query 6: Events attended by a specific visitor and their average ratings
SELECT 
    v.visitor_id,
    v.first_name,
    v.last_name,
    e.event_id,
    e.event_name,
    AVG(r.overall_impression) AS avg_overall_rating
FROM 
    Visitor v
    JOIN Ticket t ON v.visitor_id = t.visitor_id
    JOIN Event e ON t.event_id = e.event_id
    LEFT JOIN Performance p ON e.event_id = p.event_id
    LEFT JOIN Rating r ON p.performance_id = r.performance_id AND t.ticket_id = r.ticket_id
WHERE 
    v.visitor_id = 1  -- Replace with specific visitor ID
GROUP BY 
    v.visitor_id, v.first_name, v.last_name, e.event_id, e.event_name;

-- Query 6 Alternative with force index:
SELECT 
    v.visitor_id,
    v.first_name,
    v.last_name,
    e.event_id,
    e.event_name,
    AVG(r.overall_impression) AS avg_overall_rating
FROM 
    Visitor v
    JOIN Ticket t FORCE INDEX (idx_ticket_visitor) ON v.visitor_id = t.visitor_id
    JOIN Event e ON t.event_id = e.event_id
    LEFT JOIN Performance p FORCE INDEX (idx_performance_event) ON e.event_id = p.event_id
    LEFT JOIN Rating r FORCE INDEX (idx_rating_ticket) ON p.performance_id = r.performance_id AND t.ticket_id = r.ticket_id
WHERE 
    v.visitor_id = 1  -- Replace with specific visitor ID
GROUP BY 
    v.visitor_id, v.first_name, v.last_name, e.event_id, e.event_name;

-- Query 6 Alternative with Nested Loop Join:
SELECT /*+ JOIN_ORDER(v,t,e,p,r) JOIN_PREFIX(v,t,e USING(nested_loop)*/
    v.visitor_id,
    v.first_name,
    v.last_name,
    e.event_id,
    e.event_name,
    AVG(r.overall_impression) AS avg_overall_rating
FROM
    Visitor v
    JOIN Ticket t ON v.visitor_id = t.visitor_id
    JOIN Event e ON t.event_id = e.event_id
    LEFT JOIN Performance p ON e.event_id = p.event_id
    LEFT JOIN Rating r ON p.performance_id = r.performance_id AND t.ticket_id = r.ticket_id
WHERE
    v.visitor_id = 1
GROUP BY
    v.visitor_id, v.first_name, v.last_name, e.event_id, e.event_name;

-- Query 6 Alternative with Hash Join:
SELECT /*+ HASH_JOIN(v t e p r) */
    v.visitor_id,
    v.first_name,
    v.last_name,
    e.event_id,
    e.event_name,
    AVG(r.overall_impression) AS avg_overall_rating
FROM
    Visitor v
    JOIN Ticket t ON v.visitor_id = t.visitor_id
    JOIN Event e ON t.event_id = e.event_id
    LEFT JOIN Performance p ON e.event_id = p.event_id
    LEFT JOIN Rating r ON p.performance_id = r.performance_id AND t.ticket_id = r.ticket_id
WHERE
    v.visitor_id = 1
GROUP BY
    v.visitor_id, v.first_name, v.last_name, e.event_id, e.event_name;

SHOW PROFILES;