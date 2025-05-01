# install.sql :

DELIMITER //
CREATE TRIGGER check_security_staff AFTER INSERT ON Event
FOR EACH ROW
BEGIN
    DECLARE stage_capacity INT;
    DECLARE support_count INT DEFAULT 0;
    DECLARE required_staff INT;
    
    -- Get stage capacity
    SELECT max_capacity INTO stage_capacity
    FROM Stage
    WHERE stage_id = NEW.stage_id;
    
    -- Calculate required security staff (at least 5% of capacity)
    SET required_staff = CEILING(stage_capacity * 0.02);
    
    -- Count security staff for this event
    SELECT COUNT(*) INTO support_count
    FROM StaffAssignment sa
    JOIN Staff s ON sa.staff_id = s.staff_id
    WHERE sa.event_id = NEW.event_id AND s.staff_type = 'support';
    
    -- Insert warning into a log table if security staff is insufficient
    IF support_count < required_staff THEN
        INSERT INTO EventWarnings (event_id, warning_type, warning_message, created_at)
        VALUES (NEW.event_id, 'SUPPORT', CONCAT('Support staff insufficient: ', support_count, ' of ', required_staff, ' required'), NOW());
    END IF;
END//
DELIMITER ;


" DELIMITER //
CREATE TRIGGER update_performance_ratings AFTER INSERT ON Rating
FOR EACH ROW
BEGIN
    -- Update performance averages
    UPDATE Performance p
    SET 
        p.avg_artist_performance = (
            SELECT AVG(r.artist_performance) 
            FROM Rating r 
            WHERE r.performance_id = NEW.performance_id
        ),
        p.avg_overall_impression = (
            SELECT AVG(r.overall_impression) 
            FROM Rating r 
            WHERE r.performance_id = NEW.performance_id
        )
    WHERE p.performance_id = NEW.performance_id;
END//
DELIMITER ; " 


# load.sql :

-- Ensure we have artists who have performed in multiple continents (for query 13)
-- Artist 1 (John Smith) has already performed in different continents
-- Let's ensure they have performances in at least 3 continents
-- First, let's check current performances
-- Since we can't do this in pure SQL easily, we'll just add performances to events in different continents
-- Add some performances for him in the remaining continents if needed
INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id)
VALUES 
-- Adding performances in Australia, Africa and additional continents as needed
(15, 'special guest', '20:00:00', '21:00:00', 1, NULL), -- Sydney (Australia)
(27, 'special guest', '21:30:00', '22:30:00', 1, NULL), -- Rio (South America)
(33, 'headline', '23:30:00', '00:30:00', 1, NULL); -- Dubai (Asia)

-- Ensure we have music genres with the same number of performances in consecutive years (query 14)
-- First, let's add some specific performances for Rock genre in consecutive years
INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id)
VALUES 
-- Rock performances (Genre 1) in 2016
(5, 'special guest', '19:00:00', '20:00:00', 31, NULL), -- Rock artist in 2016
(5, 'warm up', '16:30:00', '17:30:00', 46, NULL), -- Rock artist in 2016
(8, 'special guest', '17:00:00', '18:00:00', 16, NULL), -- Rock artist in 2016

-- Rock performances (Genre 1) in 2017
(12, 'special guest', '19:00:00', '20:00:00', 31, NULL), -- Rock artist in 2017
(12, 'warm up', '16:30:00', '17:30:00', 46, NULL), -- Rock artist in 2017
(14, 'special guest', '20:00:00', '21:00:00', 16, NULL); -- Rock artist in 2017

-- Finalize the database by removing any stored procedures we might have used






-- -- Query 2: Artists in a specific genre, indicating if they performed in a given year
-- SELECT 
--     a.artist_id,
--     a.artist_name,
--     CASE 
--         WHEN COUNT(p.performance_id) > 0 THEN 'Yes'
--         ELSE 'No'
--     END AS performed_in_festival
-- FROM 
--     Artist a
--     JOIN ArtistGenre ag ON a.artist_id = ag.artist_id
--     JOIN Genre g ON ag.genre_id = g.genre_id
--     LEFT JOIN Performance p ON a.artist_id = p.artist_id
--     LEFT JOIN Event e ON p.event_id = e.event_id
--     LEFT JOIN Stage s ON e.stage_id = s.stage_id
--     JOIN Festival f ON s.festival_id = f.festival_id AND YEAR(f.start_date) = 2022 -- Replace with desired year
-- WHERE 
--     g.genre_name = 'Pop'  -- Replace with desired genre
-- GROUP BY 
--     a.artist_id, a.artist_name;