-- Query 7: Festival with lowest average technical staff experience level
SELECT 
    f.festival_id,
    f.festival_name,
    AVG(CASE 
        WHEN s.experience_level = 'trainee' THEN 1
        WHEN s.experience_level = 'beginner' THEN 2
        WHEN s.experience_level = 'intermediate' THEN 3
        WHEN s.experience_level = 'experienced' THEN 4
        WHEN s.experience_level = 'expert' THEN 5
    END) AS avg_experience_level
FROM 
    Festival f
    JOIN Stage st ON f.festival_id = st.festival_id
    JOIN Event e ON st.stage_id = e.stage_id
    JOIN StaffAssignment sa ON e.event_id = sa.event_id
    JOIN Staff s ON sa.staff_id = s.staff_id
WHERE 
    s.staff_type = 'technical'
GROUP BY 
    f.festival_id, f.festival_name
ORDER BY 
    avg_experience_level ASC
LIMIT 1;