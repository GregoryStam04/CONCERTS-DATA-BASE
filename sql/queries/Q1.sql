-- Query 1: Festival yearly revenue by payment method
SELECT 
    YEAR(f.start_date) AS year,
    t.payment_method,
    SUM(t.price) AS total_revenue
FROM 
    Ticket t
    JOIN Event e ON t.event_id = e.event_id
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN Festival f ON s.festival_id = f.festival_id
GROUP BY 
    YEAR(f.start_date),
    t.payment_method
ORDER BY 
    year DESC, 
    total_revenue DESC;