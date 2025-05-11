-- Query 1: Festival yearly revenue by payment method
SELECT
    YEAR(f.start_date) AS festival_year,
    SUM(CASE WHEN t.payment_method = 'credit_card'   THEN t.price ELSE 0 END) AS credit_card_revenue,
    SUM(CASE WHEN t.payment_method = 'debit_card'    THEN t.price ELSE 0 END) AS debit_card_revenue,
    SUM(CASE WHEN t.payment_method = 'bank_transfer' THEN t.price ELSE 0 END) AS bank_transfer_revenue,
    SUM(t.price) AS total_revenue
FROM Ticket t
    JOIN Event e ON t.event_id = e.event_id
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN Festival f ON s.festival_id = f.festival_id
GROUP BY 
    YEAR(f.start_date)
ORDER BY 
    festival_year DESC;