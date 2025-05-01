-- Query 8: Support staff not scheduled for a specific date
SELECT 
    s.staff_id,
    s.first_name,
    s.last_name,
    s.role
FROM 
    Staff s
WHERE 
    s.staff_type = 'support'
    AND s.staff_id NOT IN (
        SELECT sa.staff_id
        FROM StaffAssignment sa
        JOIN Event e ON sa.event_id = e.event_id
        WHERE e.event_date = '2016-07-20'  -- Replace with specific date
    );