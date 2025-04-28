-- Load script for Pulse University Festival Database
-- This will populate the database with sample data

USE pulse_university;

-- Insert locations (continents, countries, cities)
INSERT INTO Location (address, latitude, longitude, city, country, continent) VALUES
('123 Park Avenue', 40.7128, -74.0060, 'New York', 'USA', 'North America'),
('456 Oxford Street', 51.5074, -0.1278, 'London', 'UK', 'Europe'),
('789 Shibuya Crossing', 35.6762, 139.6503, 'Tokyo', 'Japan', 'Asia'),
('101 Copacabana Beach', -22.9068, -43.1729, 'Rio de Janeiro', 'Brazil', 'South America'),
('202 Bondi Beach', -33.8688, 151.2093, 'Sydney', 'Australia', 'Oceania'),
('303 Serengeti Park', -2.3333, 34.8333, 'Arusha', 'Tanzania', 'Africa'),
('404 Red Square', 55.7539, 37.6208, 'Moscow', 'Russia', 'Europe'),
('505 Champs-Élysées', 48.8566, 2.3522, 'Paris', 'France', 'Europe'),
('606 La Rambla', 41.3851, 2.1734, 'Barcelona', 'Spain', 'Europe'),
('707 Acropolis Hill', 37.9715, 23.7267, 'Athens', 'Greece', 'Europe'),
('808 Victoria Harbour', 22.3193, 114.1694, 'Hong Kong', 'China', 'Asia'),
('909 Marina Bay', 1.2849, 103.8577, 'Singapore', 'Singapore', 'Asia');

-- Insert festivals (past and future)
INSERT INTO Festival (festival_name, start_date, end_date, location_id, description, poster_image) VALUES
('Pulse University 2015', '2015-07-15', '2015-07-18', 1, 'The inaugural Pulse University festival', 'posters/2015.jpg'),
('Pulse University 2016', '2016-07-20', '2016-07-24', 2, 'The second annual music gathering', 'posters/2016.jpg'),
('Pulse University 2017', '2017-06-10', '2017-06-15', 3, 'The Asian edition of Pulse', 'posters/2017.jpg'),
('Pulse University 2018', '2018-08-01', '2018-08-05', 4, 'The South American Pulse experience', 'posters/2018.jpg'),
('Pulse University 2019', '2019-07-12', '2019-07-14', 5, 'Pulse comes to Australia', 'posters/2019.jpg'),
('Pulse University 2020', '2020-08-20', '2020-08-23', 6, 'The African Pulse edition', 'posters/2020.jpg'),
('Pulse University 2021', '2021-07-15', '2021-07-19', 7, 'Eastern European Pulse experience', 'posters/2021.jpg'),
('Pulse University 2022', '2022-06-25', '2022-06-30', 8, 'Parisian summer of music', 'posters/2022.jpg'),
('Pulse University 2024', '2024-08-01', '2024-08-04', 9, 'The Spanish flavor of Pulse', 'posters/2024.jpg'),
('Pulse University 2025', '2025-07-10', '2025-07-15', 10, 'Anniversary edition in Greece', 'posters/2025.jpg'),
('Pulse University 2026', '2026-06-20', '2026-06-25', 11, 'Future Asian expansion', 'posters/2026.jpg');

-- Insert musical genres
INSERT INTO Genre (genre_name, parent_genre_id) VALUES
('Rock', NULL),
('Pop', NULL),
('Electronic', NULL),
('Hip Hop', NULL),
('Jazz', NULL),
('Classical', NULL),
('Folk', NULL),
('R&B', NULL),
('Metal', NULL),
('Reggae', NULL),
('Alternative Rock', 1),
('Indie Rock', 1),
('Hard Rock', 1),
('Pop Rock', 2),
('Dance Pop', 2),
('EDM', 3),
('Techno', 3),
('House', 3),
('Trap', 4),
('Gangsta Rap', 4),
('Bebop', 5),
('Smooth Jazz', 5),
('Symphony', 6),
('Chamber Music', 6),
('Traditional Folk', 7),
('Contemporary Folk', 7),
('Soul', 8),
('Heavy Metal', 9),
('Death Metal', 9),
('Dub', 10);

-- Insert stages/venues (for multiple festivals)
-- For each festival, create 3 stages
-- Festival 1 (2015)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Liberty Stage', 'Main outdoor stage with full production setup', 5000, 'Full PA system, LED walls, moving lights', 1, 'stages/liberty.jpg'),
('Innovation Dome', 'Covered dome structure with immersive audio', 2000, 'Surround sound system, laser projectors', 1, 'stages/innovation.jpg'),
('Underground', 'Intimate basement venue for emerging artists', 500, 'Basic sound system, mood lighting', 1, 'stages/underground.jpg');

-- Festival 2 (2016)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Royal Main', 'Massive main stage with side screens', 8000, 'Line array speakers, video mapping, pyrotechnics', 2, 'stages/royal.jpg'),
('Thames Tent', 'Large tent structure with excellent acoustics', 3000, 'Custom sound system, LED ceiling', 2, 'stages/thames.jpg'),
('Hyde Corner', 'Cozy stage for acoustic performances', 800, 'Vintage microphones, analog equipment', 2, 'stages/hyde.jpg');

-- Festival 3 (2017)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Sakura Main', 'Cherry blossom themed main stage', 6000, 'High-end sound system, holographic capabilities', 3, 'stages/sakura.jpg'),
('Tokyo Beat Box', 'Electronic music focused indoor venue', 2500, 'Club-quality sound system, smart lighting', 3, 'stages/tokyo.jpg'),
('Zen Garden', 'Peaceful outdoor setting for relaxed performances', 1200, 'Spatial audio system, natural acoustics', 3, 'stages/zen.jpg');

-- Continuing Festival 4 (2018) stages
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Carnival Stage', 'Colorful main stage inspired by Brazilian carnival', 7000, 'Powerful sound system, confetti cannons', 4, 'stages/carnival.jpg'),
('Samba Tent', 'Indoor venue with vibrant atmosphere', 2800, 'Dynamic lighting system, acoustic panels', 4, 'stages/samba.jpg'),
('Ipanema Lounge', 'Beachside stage with relaxed vibe', 900, 'Solar-powered sound system, natural lighting', 4, 'stages/ipanema.jpg');

-- Now let's insert more stage data for remaining festivals
-- Festival 5 (2019)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Outback Main', 'Desert-themed main stage', 6500, 'Weather-resistant sound system, LED screens', 5, 'stages/outback.jpg'),
('Sydney Harbor', 'Waterfront secondary stage', 3200, 'Floating platform with surround sound', 5, 'stages/harbor.jpg'),
('Koala Corner', 'Intimate forest setting stage', 1100, 'Eco-friendly equipment, natural acoustics', 5, 'stages/koala.jpg');

-- Festival 9 (2024)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Barcelona Main', 'Massive stage with Gaudi-inspired design', 8500, 'State-of-the-art sound and lighting', 9, 'stages/barcelona.jpg'),
('Catalonia Dome', 'Modern dome with perfect acoustics', 4000, 'Immersive audio-visual system', 9, 'stages/catalonia.jpg'),
('Tapas Terrace', 'Outdoor terrace with city views', 1500, 'Wireless sound system, ambient lighting', 9, 'stages/tapas.jpg');

-- Festival 10 (2025)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image) VALUES
('Olympus', 'Grand main stage with Greek temple aesthetic', 10000, 'Advanced sound system with spatial audio', 10, 'stages/olympus.jpg'),
('Parthenon Plaza', 'Classical architecture-inspired venue', 5000, '360-degree sound, marble acoustics', 10, 'stages/parthenon.jpg'),
('Aegean Amphitheater', 'Traditional amphitheater with sea views', 3000, 'Natural acoustics with digital enhancements', 10, 'stages/aegean.jpg');

-- Insert artists
INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram, artist_image) VALUES
('Jessica Miller', 'JSMIL', '1990-05-12', 'www.jessicamiller.com', '@jsmil', 'artists/jessica.jpg'),
('Marcus Johnson', 'MJ Electric', '1985-02-28', 'www.mjelectric.com', '@mjelectric', 'artists/marcus.jpg'),
('Sofia Rodriguez', 'SofiR', '1992-11-04', 'www.sofir.com', '@sofir_music', 'artists/sofia.jpg'),
('David Kim', 'DJ Kimbap', '1988-07-15', 'www.djkimbap.com', '@djkimbap', 'artists/david.jpg'),
('Aisha Patel', 'Aisha P', '1993-03-22', 'www.aishap.com', '@aisha.p', 'artists/aisha.jpg'),
('Thomas Wright', 'Tommy Beats', '1982-09-10', 'www.tommybeats.com', '@tommybeats', 'artists/thomas.jpg'),
('Emma Chen', 'Emma C', '1995-01-30', 'www.emmac.com', '@emma_c_music', 'artists/emma.jpg'),
('Jamal Wilson', 'J-Wil', '1987-12-05', 'www.jwil.com', '@j_wil', 'artists/jamal.jpg'),
('Luisa Fernandez', 'Lu Fer', '1991-08-18', 'www.lufer.com', '@lufer', 'artists/luisa.jpg'),
('Hiroshi Tanaka', 'Hiro', '1984-04-25', 'www.hirotanaka.com', '@hiro_music', 'artists/hiroshi.jpg');

-- Insert bands
INSERT INTO Band (band_name, formation_date, website, instagram, band_image) VALUES
('Midnight Echo', '2012-06-15', 'www.midnightecho.com', '@midnight_echo', 'bands/midnight.jpg'),
('Stellar Harmony', '2015-03-20', 'www.stellarharmony.com', '@stellar_harmony', 'bands/stellar.jpg'),
('Electric Dreams', '2010-11-08', 'www.electricdreams.com', '@electric_dreams', 'bands/electric.jpg'),
('Urban Pulse', '2014-05-12', 'www.urbanpulse.com', '@urban_pulse', 'bands/urban.jpg'),
('Neon Horizon', '2013-07-30', 'www.neonhorizon.com', '@neon_horizon', 'bands/neon.jpg'),
('Velvet Thunder', '2016-02-14', 'www.velvetthunder.com', '@velvet_thunder', 'bands/velvet.jpg'),
('Crystal Wolves', '2011-09-05', 'www.crystalwolves.com', '@crystal_wolves', 'bands/crystal.jpg'),
('Desert Rose', '2017-04-22', 'www.desertrose.com', '@desert_rose', 'bands/desert.jpg'),
('Sonic Wave', '2012-12-10', 'www.sonicwave.com', '@sonic_wave', 'bands/sonic.jpg'),
('Lunar Eclipse', '2015-08-17', 'www.lunareclipse.com', '@lunar_eclipse', 'bands/lunar.jpg');

-- Connect artists to bands
INSERT INTO ArtistBand (artist_id, band_id, join_date) VALUES
(1, 1, '2012-06-15'),
(2, 1, '2013-02-01'),
(3, 2, '2015-03-20'),
(4, 2, '2015-03-20'),
(5, 2, '2016-05-12'),
(6, 3, '2010-11-08'),
(7, 3, '2011-04-15'),
(8, 4, '2014-05-12'),
(9, 4, '2014-05-12'),
(10, 5, '2013-07-30'),
(1, 6, '2016-02-14'),
(5, 6, '2016-02-14'),
(8, 7, '2011-09-05'),
(9, 7, '2011-09-05'),
(10, 7, '2012-03-01'),
(3, 8, '2017-04-22'),
(6, 9, '2012-12-10'),
(7, 9, '2013-01-15'),
(2, 10, '2015-08-17'),
(4, 10, '2015-08-17');

-- Connect artists to genres
INSERT INTO ArtistGenre (artist_id, genre_id) VALUES
(1, 2), (1, 14), (1, 15),
(2, 3), (2, 16), (2, 17),
(3, 8), (3, 27),
(4, 3), (4, 16), (4, 18),
(5, 7), (5, 25), (5, 26),
(6, 4), (6, 19), (6, 20),
(7, 5), (7, 21), (7, 22),
(8, 1), (8, 11), (8, 12),
(9, 10), (9, 30),
(10, 9), (10, 28), (10, 29);

-- Connect bands to genres
INSERT INTO BandGenre (band_id, genre_id) VALUES
(1, 1), (1, 11), (1, 12),
(2, 2), (2, 14), (2, 15),
(3, 3), (3, 16), (3, 17),
(4, 4), (4, 19), (4, 20),
(5, 3), (5, 16), (5, 18),
(6, 8), (6, 27),
(7, 9), (7, 28),
(8, 7), (8, 25), (8, 26),
(9, 1), (9, 12), (9, 13),
(10, 5), (10, 21), (10, 22);

-- Create events for Festival 9 (2024)
INSERT INTO Event (event_name, event_date, stage_id, start_time, end_time, description) VALUES
('Opening Night', '2024-08-01', 19, '18:00:00', '23:00:00', 'Festival opening ceremony'),
('Electronic Day', '2024-08-02', 19, '16:00:00', '23:00:00', 'A full day of electronic music'),
('Rock Showcase', '2024-08-02', 20, '17:00:00', '22:00:00', 'The best of rock music'),
('World Music', '2024-08-03', 21, '15:00:00', '21:00:00', 'Global music showcase'),
('Festival Finale', '2024-08-04', 19, '17:00:00', '23:59:00', 'Grand closing event');

-- Create events for Festival 10 (2025)
INSERT INTO Event (event_name, event_date, stage_id, start_time, end_time, description) VALUES
('Anniversary Opening', '2025-07-10', 22, '19:00:00', '23:30:00', '10th anniversary celebration'),
('DJ Marathon', '2025-07-11', 22, '16:00:00', '23:00:00', '7 hours of non-stop DJ sets'),
('Acoustic Afternoon', '2025-07-12', 24, '14:00:00', '19:00:00', 'Unplugged performances'),
('Rock Gods', '2025-07-13', 22, '18:00:00', '23:00:00', 'Legendary rock performances'),
('Classical Fusion', '2025-07-14', 23, '19:00:00', '22:00:00', 'Classical meets modern'),
('Grand Finale', '2025-07-15', 22, '18:00:00', '23:59:00', 'Spectacular closing event');

-- Insert staff
INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level, staff_image) VALUES
('John', 'Smith', '1980-03-15', 'technical', 'Sound Engineer', 'expert', 'staff/john.jpg'),
('Sarah', 'Johnson', '1992-07-22', 'security', 'Security Lead', 'experienced', 'staff/sarah.jpg'),
('Michael', 'Wong', '1985-11-09', 'technical', 'Lighting Technician', 'expert', 'staff/michael.jpg'),
('Emily', 'Garcia', '1994-02-28', 'support', 'Guest Services', 'intermediate', 'staff/emily.jpg'),
('James', 'Wilson', '1988-05-17', 'security', 'Security Officer', 'experienced', 'staff/james.jpg'),
('Laura', 'Martinez', '1990-09-03', 'technical', 'Stage Manager', 'expert', 'staff/laura.jpg'),
('Robert', 'Taylor', '1982-12-11', 'security', 'Security Officer', 'experienced', 'staff/robert.jpg'),
('Anna', 'Kim', '1991-08-05', 'support', 'Information Desk', 'intermediate', 'staff/anna.jpg'),
('David', 'Brown', '1984-06-19', 'technical', 'Audio Engineer', 'expert', 'staff/david.jpg'),
('Lisa', 'Anderson', '1993-10-30', 'security', 'Security Officer', 'intermediate', 'staff/lisa.jpg'),
('Daniel', 'Lopez', '1987-04-14', 'support', 'First Aid', 'experienced', 'staff/daniel.jpg'),
('Karen', 'Miller', '1989-01-25', 'technical', 'Video Technician', 'expert', 'staff/karen.jpg');

-- Insert performances for Festival 9 (2024)
INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id) VALUES
(1, 'headline', '21:00:00', '23:00:00', NULL, 1),
(1, 'warm up', '18:00:00', '19:00:00', 1, NULL),
(1, 'regular', '19:30:00', '20:30:00', NULL, 2),
(2, 'headline', '21:00:00', '23:00:00', 2, NULL),
(2, 'special guest', '19:00:00', '20:30:00', 4, NULL),
(2, 'warm up', '16:00:00', '17:30:00', NULL, 3),
(3, 'headline', '20:00:00', '22:00:00', NULL, 9),
(3, 'warm up', '17:00:00', '18:30:00', 8, NULL),
(4, 'headline', '19:00:00', '21:00:00', NULL, 8),
(4, 'warm up', '15:00:00', '16:30:00', 5, NULL),
(4, 'regular', '17:00:00', '18:30:00', 9, NULL),
(5, 'headline', '22:00:00', '23:59:00', NULL, 1),
(5, 'special guest', '20:00:00', '21:30:00', NULL, 4),
(5, 'warm up', '17:00:00', '18:30:00', 7, NULL);

-- Insert staff assignments
INSERT INTO StaffAssignment (staff_id, event_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(1, 2), (2, 2), (3, 2), (5, 2), (7, 2), (9, 2), (10, 2),
(3, 3), (4, 3), (6, 3), (8, 3), (9, 3), (11, 3), (12, 3),
(1, 4), (2, 4), (5, 4), (7, 4), (10, 4), (11, 4),
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5), (11, 5), (12, 5);

-- Insert ticket categories
INSERT INTO TicketCategory (category_name) VALUES
('general'),
('vip'),
('backstage');

-- Insert visitors
INSERT INTO Visitor (first_name, last_name, email, phone, birth_date) VALUES
('Alex', 'Johnson', 'alex@example.com', '555-1234', '1990-05-15'),
('Maria', 'Garcia', 'maria@example.com', '555-2345', '1988-09-22'),
('Liam', 'Smith', 'liam@example.com', '555-3456', '1995-02-10'),
('Sophia', 'Kim', 'sophia@example.com', '555-4567', '1992-11-28'),
('Noah', 'Williams', 'noah@example.com', '555-5678', '1985-07-04'),
('Olivia', 'Brown', 'olivia@example.com', '555-6789', '1993-03-17'),
('Ethan', 'Davis', 'ethan@example.com', '555-7890', '1987-12-09'),
('Emma', 'Wilson', 'emma@example.com', '555-8901', '1994-08-23'),
('William', 'Martinez', 'william@example.com', '555-9012', '1991-01-05'),
('Ava', 'Anderson', 'ava@example.com', '555-0123', '1989-06-11');

-- Insert tickets (mostly for Festival 9)
INSERT INTO Ticket (event_id, visitor_id, category_id, purchase_date, price, payment_method, ean_code, is_used) VALUES
(1, 1, 1, '2024-05-15 10:30:00', 50.00, 'credit_card', '1234567890123', TRUE),
(1, 2, 2, '2024-05-16 12:45:00', 120.00, 'debit_card', '2345678901234', TRUE),
(1, 3, 1, '2024-05-17 09:15:00', 50.00, 'credit_card', '3456789012345', TRUE),
(2, 1, 1, '2024-05-18 14:20:00', 55.00, 'credit_card', '4567890123456', TRUE),
(2, 4, 2, '2024-05-19 11:30:00', 125.00, 'bank_transfer', '5678901234567', TRUE),
(2, 5, 1, '2024-05-20 13:45:00', 55.00, 'debit_card', '6789012345678', TRUE),
(3, 6, 1, '2024-05-21 10:00:00', 45.00, 'credit_card', '7890123456789', TRUE),
(3, 7, 1, '2024-05-22 16:15:00', 45.00, 'debit_card', '8901234567890', TRUE),
(4, 8, 1, '2024-05-23 09:30:00', 40.00, 'credit_card', '9012345678901', TRUE),
(4, 9, 2, '2024-05-24 12:00:00', 110.00, 'bank_transfer', '0123456789012', TRUE),
(5, 1, 1, '2024-05-25 11:45:00', 60.00, 'credit_card', '1234567890124', FALSE),
(5, 2, 1, '2024-05-26 14:30:00', 60.00, 'debit_card', '2345678901235', FALSE),
(5, 3, 2, '2024-05-27 10:15:00', 130.00, 'credit_card', '3456789012346', FALSE),
(5, 4, 1, '2024-05-28 13:00:00', 60.00, 'credit_card', '4567890123457', FALSE),
(5, 5, 1, '2024-05-29 15:45:00', 60.00, 'bank_transfer', '5678901234568', FALSE);

-- Insert ratings
INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression) VALUES
(1, 1, 5, 4, 5, 4, 5),
(1, 2, 4, 5, 4, 4, 4),
(1, 3, 3, 4, 3, 4, 3),
(2, 1, 5, 5, 5, 5, 5),
(2, 2, 4, 4, 5, 5, 4),
(2, 3, 4, 5, 4, 5, 4),
(3, 1, 5, 3, 5, 4, 4),
(3, 2, 3, 4, 4, 4, 4),
(3, 3, 4, 3, 4, 4, 4),
(4, 4, 5, 5, 5, 4, 5),
(4, 5, 5, 4, 5, 4, 5),
(4, 6, 4, 5, 4, 4, 4),
(5, 4, 5, 5, 5, 5, 5),
(5, 5, 5, 5, 5, 5, 5),
(5, 6, 4, 5, 5, 5, 5);

-- Insert resale buyer queue
INSERT INTO ResaleBuyerQueue (visitor_id, event_id, category_id, request_date, is_fulfilled) VALUES
(6, 5, 1, '2024-06-01 10:30:00', FALSE),
(7, 5, 2, '2024-06-02 12:45:00', FALSE),
(8, 5, 1, '2024-06-03 09:15:00', FALSE);

-- Insert entity images
INSERT INTO EntityImage (entity_type, entity_id, image_path, description) VALUES
('festival', 9, 'festivals/2024/main.jpg', 'Main promotional image for 2024 festival'),
('festival', 9, 'festivals/2024/crowd.jpg', 'Crowd at opening night'),
('festival', 10, 'festivals/2025/promo.jpg', 'Promotional image for 2025 festival'),
('artist', 1, 'artists/jessica/live.jpg', 'Jessica Miller performing live'),
('artist', 2, 'artists/marcus/stage.jpg', 'Marcus Johnson on stage'),
('band', 1, 'bands/midnight/concert.jpg', 'Midnight Echo in concert'),
('band', 2, 'bands/stellar/backstage.jpg', 'Stellar Harmony backstage');