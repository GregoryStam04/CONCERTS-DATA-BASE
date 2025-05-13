-- Database creation
DROP DATABASE IF EXISTS pulse_university;
CREATE DATABASE pulse_university;
USE pulse_university;

-- Images for various entities table
CREATE TABLE EntityImage (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    description TEXT,
    url TEXT,
    INDEX (entity_type, entity_id)
);

-- Location table
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    continent VARCHAR(50) NOT NULL,
    CHECK (latitude BETWEEN -90 AND 90),
    CHECK (longitude BETWEEN -180 AND 180)
);

-- Festival table
CREATE TABLE Festival (
    festival_id INT AUTO_INCREMENT PRIMARY KEY,
    festival_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    location_id INT NOT NULL,
    image_id INT NULL,
    description TEXT,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (end_date >= start_date)
);

-- Stage/Venue table
CREATE TABLE Stage (
    stage_id INT AUTO_INCREMENT PRIMARY KEY,
    stage_name VARCHAR(100) NOT NULL,
    description TEXT,
    max_capacity INT NOT NULL,
    technical_equipment TEXT,
    festival_id INT NOT NULL,
    image_id INT NULL,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (festival_id) REFERENCES Festival(festival_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (max_capacity > 0)
);

-- Event table
CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    stage_id INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    description TEXT,
    FOREIGN KEY (stage_id) REFERENCES Stage(stage_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (stage_id, event_date, start_time, end_time)
);

-- Musical Genre table
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL,
    parent_genre_id INT NULL,
    FOREIGN KEY (parent_genre_id) REFERENCES Genre(genre_id) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (genre_name)
);

-- Artist table
CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    stage_name VARCHAR(255) NULL,
    birth_date DATE NOT NULL,
    website VARCHAR(255) NULL,
    instagram VARCHAR(255) NULL,
    image_id INT NULL,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (artist_name, birth_date)
);

-- Band table
CREATE TABLE Band (
    band_id INT AUTO_INCREMENT PRIMARY KEY,
    band_name VARCHAR(255) NOT NULL,
    formation_date DATE NOT NULL,
    website VARCHAR(255) NULL,
    instagram VARCHAR(255) NULL,
    image_id INT NULL,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (band_name)
);

-- Artist-Band relationship (Many-to-Many)
CREATE TABLE ArtistBand (
    artist_id INT NOT NULL,
    band_id INT NOT NULL,
    join_date DATE NOT NULL,
    PRIMARY KEY (artist_id, band_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (band_id) REFERENCES Band(band_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Artist-Genre relationship (Many-to-Many)
CREATE TABLE ArtistGenre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Band-Genre relationship (Many-to-Many)
CREATE TABLE BandGenre (
    band_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (band_id, genre_id),
    FOREIGN KEY (band_id) REFERENCES Band(band_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Performance table
CREATE TABLE Performance (
    performance_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    performance_type VARCHAR(50) NOT NULL CHECK (performance_type IN ('warm up', 'headline', 'special guest', 'regular')),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    artist_id INT NULL,
    band_id INT NULL,
    image_id INT NULL,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (band_id) REFERENCES Band(band_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE,
    CHECK ((artist_id IS NULL AND band_id IS NOT NULL) OR (artist_id IS NOT NULL AND band_id IS NULL)),
    CHECK (TIMEDIFF(end_time, start_time) <= '03:00:00')
);

-- Staff table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    staff_type VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    experience_level VARCHAR(100) NOT NULL,
    image_id INT NULL,
    FOREIGN KEY (image_id) REFERENCES EntityImage(image_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Staff Assignment table
CREATE TABLE StaffAssignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (staff_id, event_id)
);

-- Visitor table
CREATE TABLE Visitor (
    visitor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    UNIQUE (email)
);

-- Ticket Category table
CREATE TABLE TicketCategory (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL CHECK (category_name IN ('general', 'vip', 'backstage')),
    UNIQUE (category_name)
);

-- Ticket table
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    visitor_id INT NOT NULL,
    category_id INT NOT NULL,
    purchase_date DATETIME NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(100) NOT NULL,
    ean_code CHAR(13) NOT NULL,
    is_used BOOLEAN DEFAULT FALSE,
    is_for_resale BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitor_id) REFERENCES Visitor(visitor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES TicketCategory(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (ean_code),
    CHECK (price > 0)
);

-- Resale Queue (for buyers)
CREATE TABLE ResaleBuyerQueue (
    queue_id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_id INT NOT NULL,
    event_id INT NOT NULL,
    category_id INT NOT NULL,
    request_date DATETIME NOT NULL,
    is_fulfilled BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (visitor_id) REFERENCES Visitor(visitor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES TicketCategory(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Resale Queue (for sellers)
CREATE TABLE ResaleSellerQueue (
    queue_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    request_date DATETIME NOT NULL,
    is_sold BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (ticket_id)
);

-- Rating table
CREATE TABLE Rating (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    performance_id INT NOT NULL,
    artist_performance INT CHECK (artist_performance BETWEEN 1 AND 5),
    sound_lighting INT CHECK (sound_lighting BETWEEN 1 AND 5),
    stage_presence INT CHECK (stage_presence BETWEEN 1 AND 5),
    organization INT CHECK (organization BETWEEN 1 AND 5),
    overall_impression INT CHECK (overall_impression BETWEEN 1 AND 5),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (performance_id) REFERENCES Performance(performance_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (ticket_id, performance_id)
);

CREATE TABLE EventWarnings (
    warning_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    warning_type VARCHAR(100) NOT NULL,
    warning_message TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    resolved BOOLEAN DEFAULT FALSE,
    resolved_at DATETIME,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create indexes for the most frequently used queries

-- For festival revenue reports
CREATE INDEX idx_ticket_event_category ON Ticket (event_id, category_id);
CREATE INDEX idx_ticket_payment ON Ticket (payment_method);
CREATE INDEX idx_event_festival ON Event (stage_id);
CREATE INDEX idx_stage_festival ON Stage (festival_id);

-- For artist performance searches
CREATE INDEX idx_performance_artist ON Performance (artist_id);
CREATE INDEX idx_performance_band ON Performance (band_id); 
CREATE INDEX idx_performance_type ON Performance (performance_type);
CREATE INDEX idx_performance_event ON Performance (event_id);

-- For visitor-related queries
CREATE INDEX idx_ticket_visitor ON Ticket (visitor_id);
CREATE INDEX idx_rating_ticket ON Rating (ticket_id);

-- For location-based queries
CREATE INDEX idx_festival_location ON Festival (location_id);
CREATE INDEX idx_location_continent ON Location (continent);

-- For staff queries
CREATE INDEX idx_staff_type ON Staff (staff_type);
CREATE INDEX idx_staff_experience ON Staff (experience_level);

-- For date-based queries
CREATE INDEX idx_festival_dates ON Festival (start_date, end_date);
CREATE INDEX idx_event_date ON Event (event_date);

-- Add this index to optimize Query 5 (young artists)
CREATE INDEX idx_artist_birth_date ON Artist (birth_date);
CREATE INDEX idx_rating_performance ON Rating (performance_id);


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
                                -- TRIGGERS --
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------     


-- Trigger to ensure break times between performances (5-30 min)
DELIMITER //
CREATE TRIGGER check_performance_break_time BEFORE INSERT ON Performance
FOR EACH ROW
BEGIN
    DECLARE prev_end TIME;
    
    SELECT MAX(end_time) INTO prev_end
    FROM Performance
    WHERE event_id = NEW.event_id AND end_time < NEW.start_time;
    
    IF prev_end IS NOT NULL THEN
        IF TIMEDIFF(NEW.start_time, prev_end) < '00:05:00' OR 
           TIMEDIFF(NEW.start_time, prev_end) > '00:30:00' THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Break between performances must be between 5 and 30 minutes';
        END IF;
    END IF;
END//
DELIMITER ;

-- Trigger to check maximum VIP tickets (10% of capacity)
DELIMITER //
CREATE TRIGGER check_vip_tickets BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    DECLARE vip_category_id INT;
    DECLARE stage_capacity INT;
    DECLARE current_vip_count INT;
    DECLARE event_stage_id INT;
    
    -- Get the VIP category ID
    SELECT category_id INTO vip_category_id FROM TicketCategory WHERE category_name = 'vip';
    
    IF NEW.category_id = vip_category_id THEN
        -- Get the stage ID for this event
        SELECT s.stage_id, s.max_capacity INTO event_stage_id, stage_capacity
        FROM Event e
        JOIN Stage s ON e.stage_id = s.stage_id
        WHERE e.event_id = NEW.event_id;
        
        -- Count current VIP tickets
        SELECT COUNT(*) INTO current_vip_count
        FROM Ticket
        WHERE event_id = NEW.event_id AND category_id = vip_category_id;
        
        -- Check if adding one more VIP ticket would exceed 10%
        IF (current_vip_count + 1) > (stage_capacity * 0.1) THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'VIP tickets cannot exceed 10% of stage capacity';
        END IF;
    END IF;
END//
DELIMITER ;

-- Trigger to check total tickets vs capacity
DELIMITER //
CREATE TRIGGER check_capacity BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    DECLARE stage_capacity INT;
    DECLARE current_ticket_count INT;
    
    -- Get the stage capacity for this event
    SELECT s.max_capacity INTO stage_capacity
    FROM Event e
    JOIN Stage s ON e.stage_id = s.stage_id
    WHERE e.event_id = NEW.event_id;
    
    -- Count current tickets
    SELECT COUNT(*) INTO current_ticket_count
    FROM Ticket
    WHERE event_id = NEW.event_id;
    
    -- Check if adding one more ticket would exceed capacity
    IF (current_ticket_count + 1) > stage_capacity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot sell more tickets than stage capacity';
    END IF;
END//
DELIMITER ;

-- Trigger to prevent duplicate tickets for same visitor, day and event
DELIMITER //
CREATE TRIGGER check_duplicate_ticket BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    DECLARE ticket_count INT;
    DECLARE event_date DATE;
    
    -- Get the event date
    SELECT event_date INTO event_date
    FROM Event
    WHERE event_id = NEW.event_id;
    
    -- Check if visitor already has a ticket for an event on the same day
    SELECT COUNT(*) INTO ticket_count
    FROM Ticket t
    JOIN Event e ON t.event_id = e.event_id
    WHERE t.visitor_id = NEW.visitor_id 
    AND e.event_date = event_date
    AND t.event_id = NEW.event_id;
    
    IF ticket_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Visitor already has a ticket for this event on this day';
    END IF;
END//
DELIMITER ;

-- Trigger to check artist/band can't perform at two stages simultaneously
DELIMITER //
CREATE TRIGGER check_artist_simultaneous_performances BEFORE INSERT ON Performance
FOR EACH ROW
BEGIN
    DECLARE event_date DATE;
    DECLARE conflict_count INT DEFAULT 0;
    
    -- Get event date
    SELECT event_date INTO event_date FROM Event WHERE event_id = NEW.event_id;
    
    -- Check for artist conflicts
    IF NEW.artist_id IS NOT NULL THEN
        SELECT COUNT(*) INTO conflict_count
        FROM Performance p
        JOIN Event e ON p.event_id = e.event_id
        WHERE p.artist_id = NEW.artist_id
        AND e.event_date = event_date
        AND ((NEW.start_time BETWEEN p.start_time AND p.end_time) OR 
             (NEW.end_time BETWEEN p.start_time AND p.end_time) OR
             (p.start_time BETWEEN NEW.start_time AND NEW.end_time));
    ELSE
        -- Check for band conflicts
        SELECT COUNT(*) INTO conflict_count
        FROM Performance p
        JOIN Event e ON p.event_id = e.event_id
        WHERE p.band_id = NEW.band_id
        AND e.event_date = event_date
        AND ((NEW.start_time BETWEEN p.start_time AND p.end_time) OR 
             (NEW.end_time BETWEEN p.start_time AND p.end_time) OR
             (p.start_time BETWEEN NEW.start_time AND NEW.end_time));
    END IF;
    
    IF conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Artist/Band cannot perform at two stages simultaneously';
    END IF;
END//
DELIMITER ;

-- Trigger to ensure an artist/band doesn't perform for more than 3 consecutive years
DELIMITER //
CREATE TRIGGER check_artist_consecutive_years BEFORE INSERT ON Performance
FOR EACH ROW
BEGIN
    DECLARE consecutive_years INT DEFAULT 0;
    DECLARE festival_year INT;
    
    -- Get the festival year
    SELECT YEAR(event_date) INTO festival_year
    FROM Event
    WHERE event_id = NEW.event_id;
    
    -- Check for artist
    IF NEW.artist_id IS NOT NULL THEN
        SELECT COUNT(DISTINCT YEAR(e.event_date)) INTO consecutive_years
        FROM Performance p
        JOIN Event e ON p.event_id = e.event_id
        WHERE p.artist_id = NEW.artist_id
        AND YEAR(e.event_date) BETWEEN (festival_year - 3) AND (festival_year - 1);
    ELSE
        -- Check for band
        SELECT COUNT(DISTINCT YEAR(e.event_date)) INTO consecutive_years
        FROM Performance p
        JOIN Event e ON p.event_id = e.event_id
        WHERE p.band_id = NEW.band_id
        AND YEAR(e.event_date) BETWEEN (festival_year - 3) AND (festival_year - 1);
    END IF;
    
    IF consecutive_years >= 3 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Artist/Band cannot perform for more than 3 consecutive years';
    END IF;
END//
DELIMITER ;

-- Trigger to ensure security staff is at least 5% of capacity
DELIMITER //
CREATE TRIGGER check_security_staff AFTER INSERT ON Event
FOR EACH ROW
BEGIN
    DECLARE stage_capacity INT;
    DECLARE security_count INT DEFAULT 0;
    DECLARE required_staff INT;
    
    -- Get stage capacity
    SELECT max_capacity INTO stage_capacity
    FROM Stage
    WHERE stage_id = NEW.stage_id;
    
    -- Calculate required security staff (at least 5% of capacity)
    SET required_staff = CEILING(stage_capacity * 0.05);
    
    -- Count security staff for this event
    SELECT COUNT(*) INTO security_count
    FROM StaffAssignment sa
    JOIN Staff s ON sa.staff_id = s.staff_id
    WHERE sa.event_id = NEW.event_id AND s.staff_type = 'security';
    
    -- Insert warning into a log table if security staff is insufficient
    IF security_count < required_staff THEN
        INSERT INTO EventWarnings (event_id, warning_type, warning_message, created_at)
        VALUES (NEW.event_id, 'SECURITY', CONCAT('Security staff insufficient: ', security_count, ' of ', required_staff, ' required'), NOW());
    END IF;
END//
DELIMITER ;



-- Trigger to ensure support staff is at least 2% of capacity
DELIMITER //
CREATE TRIGGER check_support_staff AFTER INSERT ON Event
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

-- Trigger to process ticket resale when a match is found
DELIMITER //
CREATE TRIGGER process_ticket_resale AFTER UPDATE ON Ticket
FOR EACH ROW
BEGIN
    -- If a ticket was flagged for resale
    IF NEW.is_for_resale = TRUE AND OLD.is_for_resale = FALSE THEN
        INSERT INTO ResaleSellerQueue (ticket_id, request_date, is_sold)
        VALUES (NEW.ticket_id, NOW(), FALSE);
        
        -- Check if there are buyers waiting for this ticket category and event
        CALL ProcessResaleQueue(NEW.ticket_id);
    END IF;
END//
DELIMITER ;

-- Procedure to process the resale queue (FIFO)
DELIMITER //
CREATE PROCEDURE ProcessResaleQueue(IN p_ticket_id INT)
BEGIN
    DECLARE v_event_id INT;
    DECLARE v_category_id INT;
    DECLARE v_buyer_id INT;
    DECLARE v_buyer_queue_id INT;
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_seller_id INT;
    
    -- Get ticket details
    SELECT event_id, category_id, price, visitor_id INTO v_event_id, v_category_id, v_price, v_seller_id
    FROM Ticket
    WHERE ticket_id = p_ticket_id;
    
    -- Find the earliest buyer in the queue matching event and category
    SELECT queue_id, visitor_id INTO v_buyer_queue_id, v_buyer_id
    FROM ResaleBuyerQueue
    WHERE event_id = v_event_id 
    AND category_id = v_category_id 
    AND is_fulfilled = FALSE
    ORDER BY request_date ASC
    LIMIT 1;
    
    -- If we found a buyer
    IF v_buyer_id IS NOT NULL THEN
        -- Update the ticket owner
        UPDATE Ticket 
        SET visitor_id = v_buyer_id, 
            is_for_resale = FALSE 
        WHERE ticket_id = p_ticket_id;
        
        -- Mark buyer's request as fulfilled
        UPDATE ResaleBuyerQueue 
        SET is_fulfilled = TRUE 
        WHERE queue_id = v_buyer_queue_id;
        
        -- Mark seller's request as completed
        UPDATE ResaleSellerQueue 
        SET is_sold = TRUE 
        WHERE ticket_id = p_ticket_id;
    END IF;
END//
DELIMITER ;

-- Trigger to check ratings only from ticket users
DELIMITER //
CREATE TRIGGER check_rating_validity BEFORE INSERT ON Rating
FOR EACH ROW
BEGIN
    DECLARE is_ticket_used BOOLEAN;
    DECLARE correct_event BOOLEAN DEFAULT FALSE;
    
    -- Check if ticket is used
    SELECT is_used INTO is_ticket_used
    FROM Ticket
    WHERE ticket_id = NEW.ticket_id;
    
    IF NOT is_ticket_used THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Only used tickets can submit ratings';
    END IF;
    
    -- Check if performance belongs to the ticket's event
    SELECT COUNT(*) > 0 INTO correct_event
    FROM Performance p
    JOIN Ticket t ON p.event_id = t.event_id
    WHERE p.performance_id = NEW.performance_id AND t.ticket_id = NEW.ticket_id;
    
    IF NOT correct_event THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Rating must be for a performance the visitor attended';
    END IF;
END//
DELIMITER ;