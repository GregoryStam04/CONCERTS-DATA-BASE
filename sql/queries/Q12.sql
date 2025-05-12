-- Query 12: Staff required for each day of the festival, by category
SELECT 
    e.event_date,
    SUM(CASE WHEN s.staff_type = 'security' THEN 1 ELSE 0 END) AS security_count,
    SUM(CASE WHEN s.staff_type = 'technical' THEN 1 ELSE 0 END) AS technical_count,
    SUM(CASE WHEN s.staff_type = 'support' THEN 1 ELSE 0 END) AS support_count,
    COUNT(DISTINCT s.staff_id) AS total_count
FROM 
    Event e
    JOIN StaffAssignment sa ON e.event_id = sa.event_id
    JOIN Staff s ON sa.staff_id = s.staff_id
    JOIN Stage st ON e.stage_id = st.stage_id
    JOIN Festival f ON st.festival_id = f.festival_id
WHERE 
    f.festival_id = 9  -- Replace with specific festival ID
GROUP BY 
    e.event_date
ORDER BY 
    e.event_date;