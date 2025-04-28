-- Query 12: Staff required for each day of the festival, by category
SELECT 
    e.event_date,
    s.staff_type,
    COUNT(DISTINCT s.staff_id) AS staff_count
FROM 
    Event e
    JOIN StaffAssignment sa ON e.event_id = sa.event_id
    JOIN Staff s ON sa.staff_id = s.staff_id
    JOIN Stage st ON e.stage_id = st.stage_id
    JOIN Festival f ON st.festival_id = f.festival_id
WHERE 
    f.festival_id = 9  -- Replace with specific festival ID
GROUP BY 
    e.event_date, s.staff_type
ORDER BY 
    e.event_date, s.staff_type;