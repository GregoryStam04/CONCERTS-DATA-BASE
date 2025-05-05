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

-- For each event, assign appropriate staff (at least 5% security and 2% support based on venue capacity)
INSERT INTO StaffAssignment (staff_id, event_id) VALUES
-- Opening Night (Festival 1, 2015) - Main Stage (25,000 capacity)
-- Need at least 1250 security and 500 support staff
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), -- Technical staff
(16, 1), (17, 1), (18, 1), (19, 1), (20, 1), (21, 1), (22, 1), (23, 1), (24, 1), (25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1), -- Security staff (15)
(31, 1), (32, 1), (33, 1), (34, 1), (35, 1), (36, 1), (37, 1), (38, 1), -- Support staff (8)

-- Electronic Friday (Festival 1, 2015) - Electronica Dome (8,000 capacity)
-- Need at least 400 security and 160 support staff
(6, 2), (7, 2), (8, 2), (9, 2), -- Technical staff
(16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), -- Security staff (6)
(31, 2), (32, 2), (33, 2), -- Support staff (3)

-- Acoustic Saturday (Festival 1, 2015) - Acoustic Haven (3,000 capacity)
-- Need at least 150 security and 60 support staff
(10, 3), (11, 3), (12, 3), -- Technical staff
(22, 3), (23, 3), (24, 3), -- Security staff (3)
(34, 3), (35, 3), -- Support staff (2)

-- Closing Party (Festival 1, 2015) - Main Stage (25,000 capacity)
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), -- Technical staff
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), (23, 4), (24, 4), (25, 4), (26, 4), (27, 4), (28, 4), (29, 4), (30, 4), -- Security staff (15)
(31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), -- Support staff (8)

-- Rock Opening (Festival 2, 2016) - Rock Arena (15,000 capacity)
-- Need at least 750 security and 300 support staff
(1, 5), (2, 5), (3, 5), (4, 5), -- Technical staff
(16, 5), (17, 5), (18, 5), (19, 5), (20, 5), (21, 5), (22, 5), (23, 5), (24, 5), -- Security staff (9)
(31, 5), (32, 5), (33, 5), (34, 5), -- Support staff (4)

-- Jazz Night (Festival 2, 2016) - Jazz Corner (2,000 capacity)
-- Need at least 100 security and 40 support staff
(5, 6), (6, 6), -- Technical staff
(25, 6), (26, 6), -- Security staff (2)
(35, 6), -- Support staff (1)

-- Hip Hop Showcase (Festival 2, 2016) - Hip Hop Square (10,000 capacity)
-- Need at least 500 security and 200 support staff
(7, 7), (8, 7), (9, 7), -- Technical staff
(16, 7), (17, 7), (18, 7), (19, 7), (20, 7), (21, 7), -- Security staff (6)
(36, 7), (37, 7), (38, 7), -- Support staff (3)

-- Tokyo Lights (Festival 3, 2017) - Tokyo Main (20,000 capacity)
-- Need at least 1000 security and 400 support staff
(1, 11), (2, 11), (3, 11), (4, 11), (5, 11), -- Technical staff
(16, 11), (17, 11), (18, 11), (19, 11), (20, 11), (21, 11), (22, 11), (23, 11), (24, 11), (25, 11), -- Security staff (10)
(31, 11), (32, 11), (33, 11), (34, 11), (35, 11), (36, 11), -- Support staff (6)

-- J-Pop Explosion (Festival 3, 2017) - Anime Stage (5,000 capacity)
-- Need at least 250 security and 100 support staff
(6, 12), (7, 12), -- Technical staff
(26, 12), (27, 12), (28, 12), -- Security staff (3)
(37, 12), (38, 12), -- Support staff (2)

-- Grand Finale (Festival 2, 2016) - Hip Hop Square (10,000 capacity)
(10, 10), (11, 10), (12, 10), -- Technical staff
(16, 10), (17, 10), (18, 10), (19, 10), (20, 10), (21, 10), -- Security staff (6)
(31, 10), (32, 10), (33, 10), -- Support staff (3)

-- Desert Welcome (Festival 8, 2022) - Desert Oasis (20,000 capacity)
(1, 36), (2, 36), (3, 36), (4, 36), (5, 36), -- Technical staff
(16, 36), (17, 36), (18, 36), (19, 36), (20, 36), (21, 36), (22, 36), (23, 36), (24, 36), (25, 36), -- Security staff (10)
(31, 36), (32, 36), (33, 36), (34, 36), (35, 36), (36, 36), -- Support staff (6)

-- Golden Finale (Festival 8, 2022) - Desert Oasis (20,000 capacity)
(6, 40), (7, 40), (8, 40), (9, 40), (10, 40), -- Technical staff
(16, 40), (17, 40), (18, 40), (19, 40), (20, 40), (21, 40), (22, 40), (23, 40), (24, 40), (25, 40), -- Security staff (10)
(31, 40), (32, 40), (33, 40), (34, 40), (35, 40), (36, 40); -- Support staff (6)

-- First, let's check which events don't have enough security staff (5% of max capacity)
SELECT e.event_id, e.event_name, s.stage_name, s.max_capacity, 
       CEILING(s.max_capacity * 0.05) AS required_security,
       COUNT(DISTINCT sa.staff_id) AS current_security
FROM Event e
JOIN Stage s ON e.stage_id = s.stage_id
LEFT JOIN StaffAssignment sa ON e.event_id = sa.event_id
LEFT JOIN Staff st ON sa.staff_id = st.staff_id AND st.staff_type = 'security'
GROUP BY e.event_id, e.event_name, s.stage_name, s.max_capacity
HAVING COUNT(DISTINCT sa.staff_id) < CEILING(s.max_capacity * 0.05)
ORDER BY e.event_id;

-- Check which events don't have enough support staff (2% of max capacity)
SELECT e.event_id, e.event_name, s.stage_name, s.max_capacity, 
       CEILING(s.max_capacity * 0.02) AS required_support,
       COUNT(DISTINCT sa.staff_id) AS current_support
FROM Event e
JOIN Stage s ON e.stage_id = s.stage_id
LEFT JOIN StaffAssignment sa ON e.event_id = sa.event_id
LEFT JOIN Staff st ON sa.staff_id = st.staff_id AND st.staff_type = 'support'
GROUP BY e.event_id, e.event_name, s.stage_name, s.max_capacity
HAVING COUNT(DISTINCT sa.staff_id) < CEILING(s.max_capacity * 0.02)
ORDER BY e.event_id;