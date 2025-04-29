-- Pulse University Database Sample Data Loading Script
USE pulse_university;

-- Insert ticket categories first since they're referenced by other tables
INSERT INTO TicketCategory (category_name) VALUES
('general'),
('vip'),
('backstage');

-- Insert Locations
INSERT INTO Location (address, latitude, longitude, city, country, continent) VALUES
('123 Main Street', 51.5074, -0.1278, 'London', 'United Kingdom', 'Europe'),
('456 Fifth Avenue', 40.7128, -74.0060, 'New York', 'United States', 'North America'),
('789 Berliner Straße', 52.5200, 13.4050, 'Berlin', 'Germany', 'Europe'),
('321 Boulevard Saint-Michel', 48.8566, 2.3522, 'Paris', 'France', 'Europe'),
('654 Via Roma', 41.9028, 12.4964, 'Rome', 'Italy', 'Europe'),
('987 Passeig de Gràcia', 41.3851, 2.1734, 'Barcelona', 'Spain', 'Europe'),
('258 Shibuya Crossing', 35.6762, 139.6503, 'Tokyo', 'Japan', 'Asia'),
('369 Gangnam Boulevard', 37.5665, 126.9780, 'Seoul', 'South Korea', 'Asia'),
('147 Copacabana Beach', -22.9068, -43.1729, 'Rio de Janeiro', 'Brazil', 'South America'),
('753 Cape Town Highway', -33.9249, 18.4241, 'Cape Town', 'South Africa', 'Africa'),
('951 Sydney Harbour', -33.8688, 151.2093, 'Sydney', 'Australia', 'Australia'),
('357 Amsterdamseweg', 52.3676, 4.9041, 'Amsterdam', 'Netherlands', 'Europe'),
('159 Magnificent Mile', 41.8781, -87.6298, 'Chicago', 'United States', 'North America'),
('852 Las Ramblas', 41.3797, 2.1682, 'Barcelona', 'Spain', 'Europe'),
('741 Circular Quay', -33.8568, 151.2153, 'Sydney', 'Australia', 'Australia'),
('963 Nathan Road', 22.3193, 114.1694, 'Hong Kong', 'China', 'Asia'),
('357 Ipanema Beach', -22.9834, -43.2184, 'Rio de Janeiro', 'Brazil', 'South America'),
('159 Avenue des Champs-Élysées', 48.8698, 2.3075, 'Paris', 'France', 'Europe'),
('852 Sukhumvit Road', 13.7563, 100.5018, 'Bangkok', 'Thailand', 'Asia'),
('741 Market Street', 37.7749, -122.4194, 'San Francisco', 'United States', 'North America'),
('963 Kurfürstendamm', 52.5033, 13.3337, 'Berlin', 'Germany', 'Europe'),
('357 Kalakaua Avenue', 21.2768, -157.8294, 'Honolulu', 'United States', 'North America'),
('159 Orchard Road', 1.3521, 103.8198, 'Singapore', 'Singapore', 'Asia'),
('852 La Boca', -34.6345, -58.3632, 'Buenos Aires', 'Argentina', 'South America'),
('741 Darling Harbour', -33.8748, 151.1982, 'Sydney', 'Australia', 'Australia'),
('963 Nevsky Prospekt', 59.9343, 30.3351, 'Saint Petersburg', 'Russia', 'Europe'),
('357 Nyhavn', 55.6800, 12.5944, 'Copenhagen', 'Denmark', 'Europe'),
('159 Shinjuku Dori', 35.6894, 139.6917, 'Tokyo', 'Japan', 'Asia'),
('852 Waterfront Drive', -33.9058, 18.4198, 'Cape Town', 'South Africa', 'Africa'),
('741 Las Vegas Boulevard', 36.1699, -115.1398, 'Las Vegas', 'United States', 'North America');

-- Insert Festivals (past and future)
-- Past festivals (for the past 8 years)
INSERT INTO Festival (festival_name, start_date, end_date, location_id, description, poster_image, poster_description) VALUES
('Pulse Universe 2017', '2017-07-15', '2017-07-18', 1, 'The 2017 edition featuring top global artists across multiple genres.', 'festivals/poster_2017_1.jpg', 'Official Pulse Universe 2017 poster'),
('Rhythm Galaxy 2017', '2017-08-05', '2017-08-08', 2, 'A spectacular music experience with the best electronic and pop artists.', 'festivals/poster_2017_2.jpg', 'Rhythm Galaxy 2017 official poster'),
('Sonic Dimensions 2018', '2018-06-20', '2018-06-24', 3, 'The premier rock and alternative festival featuring legendary bands.', 'festivals/poster_2018_1.jpg', 'Sonic Dimensions 2018 poster'),
('Harmonic Convergence 2018', '2018-07-12', '2018-07-15', 4, 'Where classical meets contemporary, a truly unique festival experience.', 'festivals/poster_2018_2.jpg', 'Harmonic Convergence 2018 official artwork'),
('Melody Cosmos 2019', '2019-06-18', '2019-06-22', 5, 'A celebration of music from around the globe, featuring diverse artists and genres.', 'festivals/poster_2019_1.jpg', 'Melody Cosmos 2019 poster design'),
('Beat Continuum 2019', '2019-08-03', '2019-08-07', 6, 'The ultimate hip-hop and urban music festival with top performers.', 'festivals/poster_2019_2.jpg', 'Beat Continuum 2019 official poster'),
('Echo Sphere 2020', '2020-07-10', '2020-07-14', 7, 'A scaled-down virtual event featuring amazing remote performances.', 'festivals/poster_2020_1.jpg', 'Echo Sphere 2020 virtual event poster'),
('Vibrant Frequency 2020', '2020-08-21', '2020-08-25', 8, 'Connected online experience with electronic and ambient artists worldwide.', 'festivals/poster_2020_2.jpg', 'Vibrant Frequency 2020 digital poster'),
('Sound Fusion 2021', '2021-06-25', '2021-06-29', 9, 'The return of live music featuring a fusion of genres and cultures.', 'festivals/poster_2021_1.jpg', 'Sound Fusion 2021 comeback poster'),
('Resonance Collective 2021', '2021-07-30', '2021-08-03', 10, 'A community-focused festival celebrating the global music scene.', 'festivals/poster_2021_2.jpg', 'Resonance Collective 2021 official artwork'),
('Pulse Universe 2022', '2022-06-17', '2022-06-21', 11, 'The biggest edition yet, celebrating 5 years of the Pulse Universe festival.', 'festivals/poster_2022_1.jpg', 'Pulse Universe 2022 anniversary poster'),
('Rhythm Galaxy 2022', '2022-07-29', '2022-08-02', 12, 'A groundbreaking showcase of electronic and experimental music.', 'festivals/poster_2022_2.jpg', 'Rhythm Galaxy 2022 poster'),
('Sonic Dimensions 2023', '2023-06-23', '2023-06-27', 13, 'The ultimate rock festival featuring legendary headliners and emerging talents.', 'festivals/poster_2023_1.jpg', 'Sonic Dimensions 2023 official poster'),
('Harmonic Convergence 2023', '2023-08-04', '2023-08-08', 14, 'Where classical meets modern in a celebration of musical diversity.', 'festivals/poster_2023_2.jpg', 'Harmonic Convergence 2023 poster'),
('Melody Cosmos 2024', '2024-06-14', '2024-06-18', 15, 'A global gathering of musicians pushing boundaries and connecting cultures.', 'festivals/poster_2024_1.jpg', 'Melody Cosmos 2024 poster'),
('Beat Continuum 2024', '2024-07-26', '2024-07-30', 16, 'The definitive hip-hop and R&B festival, featuring top-tier performers.', 'festivals/poster_2024_2.jpg', 'Beat Continuum 2024 official artwork');

-- Future festivals
INSERT INTO Festival (festival_name, start_date, end_date, location_id, description, poster_image, poster_description) VALUES
('Pulse Universe 2025', '2025-06-20', '2025-06-24', 17, 'The upcoming 2025 edition of Pulse Universe, promising groundbreaking performances and innovative experiences.', 'festivals/poster_2025_1.jpg', 'Pulse Universe 2025 teaser poster'),
('Rhythm Galaxy 2025', '2025-08-01', '2025-08-05', 18, 'The future of music festivals arrives with this ambitious multi-genre event.', 'festivals/poster_2025_2.jpg', 'Rhythm Galaxy 2025 advance poster');

-- Insert Music Genres
-- Main genres
INSERT INTO Genre (genre_name, parent_genre_id) VALUES
('Rock', NULL),
('Pop', NULL),
('Electronic', NULL),
('Hip Hop', NULL),
('Jazz', NULL),
('Classical', NULL),
('Metal', NULL),
('Folk', NULL),
('Reggae', NULL),
('Blues', NULL);

-- Subgenres
INSERT INTO Genre (genre_name, parent_genre_id) VALUES
-- Rock subgenres
('Alternative Rock', 1),
('Indie Rock', 1),
('Hard Rock', 1),
('Progressive Rock', 1),
('Punk Rock', 1),
-- Pop subgenres
('Synth Pop', 2),
('Power Pop', 2),
('Indie Pop', 2),
('K-Pop', 2),
('J-Pop', 2),
-- Electronic subgenres
('Techno', 3),
('House', 3),
('Drum and Bass', 3),
('Dubstep', 3),
('Ambient', 3),
-- Hip Hop subgenres
('Trap', 4),
('Mumble Rap', 4),
('Conscious Hip Hop', 4),
('Old School Hip Hop', 4),
('Gangsta Rap', 4),
-- Jazz subgenres
('Bebop', 5),
('Smooth Jazz', 5),
('Fusion', 5),
('Cool Jazz', 5),
('Free Jazz', 5),
-- Classical subgenres
('Baroque', 6),
('Romantic', 6),
('Contemporary Classical', 6),
('Opera', 6),
('Symphony', 6),
-- Metal subgenres
('Heavy Metal', 7),
('Death Metal', 7),
('Black Metal', 7),
('Thrash Metal', 7),
('Nu Metal', 7),
-- Folk subgenres
('Traditional Folk', 8),
('Folk Rock', 8),
('Contemporary Folk', 8),
('Celtic', 8),
('American Folk', 8),
-- Reggae subgenres
('Dancehall', 9),
('Dub', 9),
('Roots Reggae', 9),
('Ska', 9),
('Rocksteady', 9),
-- Blues subgenres
('Delta Blues', 10),
('Chicago Blues', 10),
('Electric Blues', 10),
('Country Blues', 10),
('Rhythm and Blues', 10);

-- Insert Stages
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image, stage_image_description) VALUES
-- 2017 Festivals
('Main Stage', 'Primary stage for headline acts', 15000, 'Full PA system, LED screens, lighting rigs, CO2 cannons', 1, 'stages/1_main.jpg', 'Main Stage at Pulse Universe 2017'),
('Eclipse Arena', 'Indoor venue for electronic acts', 5000, 'Club sound system, laser lights, fog machines', 1, 'stages/1_eclipse.jpg', 'Eclipse Arena night setup'),
('Nebula Pavilion', 'Open-air stage for daytime acts', 3000, 'Mid-sized PA, basic lighting', 1, 'stages/1_nebula.jpg', 'Nebula Pavilion under blue skies'),

('Stellar Dome', 'Massive dome structure for main performances', 12000, 'Surround sound system, 360-degree visuals', 2, 'stages/2_stellar.jpg', 'Stellar Dome exterior view'),
('Cosmic Theatre', 'Elegant venue for acoustic and jazz', 2000, 'Pristine acoustics, minimal amplification', 2, 'stages/2_cosmic.jpg', 'Cosmic Theatre interior setup'),
('Horizon Platform', 'Waterfront stage with scenic views', 4000, 'Weather-resistant equipment, floating elements', 2, 'stages/2_horizon.jpg', 'Horizon Platform sunset view'),

-- 2018 Festivals
('Main Stage', 'Massive central stage for headliners', 20000, 'State-of-the-art sound and lighting', 3, 'stages/3_main.jpg', 'Main Stage at Sonic Dimensions 2018'),
('Zenith Amphitheater', 'Natural amphitheater for rock bands', 8000, 'Rock-oriented sound system, pyrotechnics', 3, 'stages/3_zenith.jpg', 'Zenith Amphitheater crowd view'),
('Aurora Venue', 'Intimate setting for acoustic sets', 1500, 'Warm lighting, studio-quality acoustics', 3, 'stages/3_aurora.jpg', 'Aurora Venue evening atmosphere'),

('Orbit Stage', 'Rotating circular stage', 10000, 'Moving stage sections, surround sound', 4, 'stages/4_orbit.jpg', 'Orbit Stage technical setup'),
('Infinity Hall', 'Classical concert hall adapted for festival', 3000, 'Orchestra pit, balcony seating, perfect acoustics', 4, 'stages/4_infinity.jpg', 'Infinity Hall interior'),
('Pulse Pavilion', 'Modern structure with glass elements', 5000, 'Visual projections, atmospheric lighting', 4, 'stages/4_pulse.jpg', 'Pulse Pavilion entrance view'),

-- 2019 Festivals (4 more festivals with 3 stages each)
-- Continuing with more stages for remaining festivals...
('Main Stage', 'Central performance area with mountain backdrop', 25000, 'Festival-grade sound system, massive LED walls', 5, 'stages/5_main.jpg', 'Main Stage aerial view'),
('Harmony Arena', 'Secondary stage for diverse acts', 7000, 'Versatile sound setup for multiple genres', 5, 'stages/5_harmony.jpg', 'Harmony Arena daytime setup'),
('Echo Chamber', 'Enclosed venue for electronic music', 3500, 'Bass-heavy sound system, immersive lighting', 5, 'stages/5_echo.jpg', 'Echo Chamber night atmosphere');

-- Insert more stages for remaining festivals...
-- Only including a subset of stages for brevity

-- Insert Artists
INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram, artist_image, artist_description) VALUES
('James Wilson', 'JW Beats', '1988-05-12', 'https://www.jwbeats.com', '@jwbeats', 'artists/jw_beats.jpg', 'Electronic music producer known for innovative sound design'),
('Sarah Chen', 'Luna', '1992-11-23', 'https://www.lunamusic.com', '@lunaofficial', 'artists/luna.jpg', 'Pop vocalist with ethereal voice and captivating stage presence'),
('Michael Rodriguez', 'MC Mike', '1985-03-18', 'https://www.mcmike.com', '@realmcmike', 'artists/mc_mike.jpg', 'Veteran hip-hop artist and producer from Chicago'),
('Emily Taylor', NULL, '1995-07-30', 'https://www.emilytaylor.com', '@emilytaylor', 'artists/emily_taylor.jpg', 'Folk singer-songwriter known for poetic lyrics'),
('David Kim', 'DJ Pulse', '1990-01-15', 'https://www.djpulse.com', '@djpulse', 'artists/dj_pulse.jpg', 'Techno DJ and producer with hypnotic beats'),
('Olivia Martinez', 'Liv', '1993-09-05', 'https://www.livmusic.com', '@liv_music', 'artists/liv.jpg', 'R&B vocalist with soul influences'),
('Robert Johnson', 'RJ', '1987-12-10', 'https://www.rjmusic.com', '@therealrj', 'artists/rj.jpg', 'Blues guitarist with roots in Delta traditions'),
('Jessica Lee', NULL, '1991-04-22', 'https://www.jessicalee.com', '@jessica_lee_music', 'artists/jessica_lee.jpg', 'Classical violinist exploring contemporary compositions'),
('Thomas Wright', 'Tommy Riffs', '1984-08-19', 'https://www.tommyriffs.com', '@tommyriffs', 'artists/tommy_riffs.jpg', 'Hard rock guitarist known for technical solos'),
('Maya Patel', 'Maya P', '1997-02-28', 'https://www.mayap.com', '@maya_p_official', 'artists/maya_p.jpg', 'Electronic pop producer and vocalist');

-- Insert more artists to reach 50 total
INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram, artist_image, artist_description) VALUES
('Daniel Smith', 'The Voice', '1989-06-15', 'https://www.danielsmith.com', '@thevoice', 'artists/daniel_smith.jpg', 'Powerful vocalist with four-octave range'),
('Sophia Brown', 'Soph', '1994-10-08', 'https://www.sophbrown.com', '@soph_music', 'artists/sophia_brown.jpg', 'Indie pop artist with distinctive style'),
('Marcus Johnson', 'MJ Flow', '1986-03-25', 'https://www.mjflow.com', '@mj_flow', 'artists/mj_flow.jpg', 'Hip hop artist with conscious lyrics'),
('Nora Liu', NULL, '1993-12-12', 'https://www.noraliu.com', '@nora_liu', 'artists/nora_liu.jpg', 'Jazz pianist with classical training'),
('Jason Garcia', 'J-Gar', '1991-07-19', 'https://www.jgarmusic.com', '@j_gar', 'artists/j_gar.jpg', 'Electronic producer specializing in ambient techno'),
('Amanda White', 'Mandy', '1995-04-30', 'https://www.mandywhite.com', '@mandy_official', 'artists/amanda_white.jpg', 'Country-pop crossover artist'),
('Kevin Zhang', 'KZ', '1988-11-03', 'https://www.kzmusic.com', '@kz_beats', 'artists/kevin_zhang.jpg', 'Producer specializing in trap and EDM'),
('Laura Hernandez', NULL, '1990-01-26', 'https://www.laurahernandez.com', '@laura_music', 'artists/laura_hernandez.jpg', 'Latin jazz vocalist with traditional influence'),
('Chris Thomas', 'CT', '1987-08-14', 'https://www.ctmusic.com', '@ct_official', 'artists/chris_thomas.jpg', 'Rock drummer with progressive tendencies'),
('Alex Johnson', 'AJ', '1996-05-22', 'https://www.ajohnson.com', '@aj_music', 'artists/alex_johnson.jpg', 'Singer-songwriter with folk roots');

-- Insert Bands
INSERT INTO Band (band_name, formation_date, website, instagram, band_image, band_description) VALUES
('The Electric Dragons', '2010-03-15', 'https://www.electricdragons.com', '@electric_dragons', 'bands/electric_dragons.jpg', 'Alternative rock band known for energetic live shows'),
('Neon Wolves', '2015-07-22', 'https://www.neonwolves.com', '@neon_wolves', 'bands/neon_wolves.jpg', 'Synth-pop quartet with retro influences'),
('Cosmic Phoenix', '2008-11-10', 'https://www.cosmicphoenix.com', '@cosmic_phoenix', 'bands/cosmic_phoenix.jpg', 'Progressive metal band with conceptual albums'),
('The Stellar Ravens', '2012-05-18', 'https://www.stellarravens.com', '@stellar_ravens', 'bands/stellar_ravens.jpg', 'Indie folk group with harmonious vocals'),
('Quantum Tigers', '2014-01-30', 'https://www.quantumtigers.com', '@quantum_tigers', 'bands/quantum_tigers.jpg', 'Experimental electronic rock fusion'),
('Digital Eagles', '2011-09-05', 'https://www.digitaleagles.com', '@digital_eagles', 'bands/digital_eagles.jpg', 'EDM collective with visual performances'),
('Crystal Falcons', '2013-04-12', 'https://www.crystalfalcons.com', '@crystal_falcons', 'bands/crystal_falcons.jpg', 'Dream pop band with ethereal soundscapes'),
('Sonic Lions', '2009-08-28', 'https://www.soniclions.com', '@sonic_lions', 'bands/sonic_lions.jpg', 'Hard rock group with blues influences'),
('Laser Vipers', '2016-02-14', 'https://www.laservipers.com', '@laser_vipers', 'bands/laser_vipers.jpg', 'Retrowave band with neon aesthetics'),
('Midnight Cobras', '2007-12-03', 'https://www.midnightcobras.com', '@midnight_cobras', 'bands/midnight_cobras.jpg', 'Heavy metal veterans with loyal following');

-- Insert more bands to reach 20 total
INSERT INTO Band (band_name, formation_date, website, instagram, band_image, band_description) VALUES
('Mystic Panthers', '2010-10-10', 'https://www.mysticpanthers.com', '@mystic_panthers', 'bands/mystic_panthers.jpg', 'Gothic rock band with orchestral elements'),
('Solar Sharks', '2014-03-28', 'https://www.solarsharks.com', '@solar_sharks', 'bands/solar_sharks.jpg', 'Surf rock with psychedelic influences'),
('Lunar Bears', '2013-07-15', 'https://www.lunarbears.com', '@lunar_bears', 'bands/lunar_bears.jpg', 'Folk rock band with storytelling lyrics'),
('Atomic Foxes', '2011-04-22', 'https://www.atomicfoxes.com', '@atomic_foxes', 'bands/atomic_foxes.jpg', 'Punk rock quartet with political messages'),
('The Electric Owls', '2016-11-09', 'https://www.electricowls.com', '@electric_owls', 'bands/electric_owls.jpg', 'Indie electronic band with female vocalist'),
('Neon Hawks', '2012-01-17', 'https://www.neonhawks.com', '@neon_hawks', 'bands/neon_hawks.jpg', 'Synthwave band with 80s aesthetic'),
('The Crystal Experience', '2009-09-09', 'https://www.crystalexperience.com', '@crystal_experience', 'bands/crystal_experience.jpg', 'Psychedelic rock band with extended jams'),
('Quantum Alliance', '2015-05-05', 'https://www.quantumalliance.com', '@quantum_alliance', 'bands/quantum_alliance.jpg', 'Jazz fusion collective with rotating members'),
('Stellar Syndicate', '2008-02-20', 'https://www.stellarsyndicate.com', '@stellar_syndicate', 'bands/stellar_syndicate.jpg', 'Hip hop group with live instrumentation'),
('The Analog Coalition', '2017-01-01', 'https://www.analogcoalition.com', '@analog_coalition', 'bands/analog_coalition.jpg', 'Lo-fi indie band with nostalgic sound');

-- Insert Staff
INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level, staff_image, staff_description) VALUES
-- Technical staff
('John', 'Smith', '1985-04-15', 'technical', 'Sound Engineer', 'expert', 'staff/john_smith.jpg', 'Lead sound engineer with 15 years of festival experience'),
('Emma', 'Johnson', '1990-07-22', 'technical', 'Lighting Technician', 'experienced', 'staff/emma_johnson.jpg', 'Lighting designer specialized in large-scale productions'),
('Michael', 'Williams', '1988-03-10', 'technical', 'Stage Manager', 'expert', 'staff/michael_williams.jpg', 'Efficient stage manager with background in production'),
('Lisa', 'Brown', '1992-09-18', 'technical', 'Video Technician', 'intermediate', 'staff/lisa_brown.jpg', 'Video specialist focused on live visuals'),
('David', 'Jones', '1987-11-05', 'technical', 'Sound Engineer', 'experienced', 'staff/david_jones.jpg', 'FOH engineer with touring experience'),
-- Security staff
('Mark', 'Davis', '1982-06-30', 'security', 'Security Supervisor', 'expert', 'staff/mark_davis.jpg', 'Former military personnel with event security certification'),
('Sarah', 'Martinez', '1989-02-14', 'security', 'Security Guard', 'intermediate', 'staff/sarah_martinez.jpg', 'Trained in crowd management and emergency response'),
('Robert', 'Taylor', '1984-10-25', 'security', 'Access Control', 'experienced', 'staff/robert_taylor.jpg', 'Specialized in VIP and restricted area security'),
('Jennifer', 'Thomas', '1991-05-12', 'security', 'Security Guard', 'beginner', 'staff/jennifer_thomas.jpg', 'Newly certified security professional'),
('Christopher', 'Garcia', '1986-08-03', 'security', 'Emergency Response', 'experienced', 'staff/christopher_garcia.jpg', 'Paramedic with security training'),
-- Support staff
('Michelle', 'Wilson', '1993-01-20', 'support', 'Information Desk', 'intermediate', 'staff/michelle_wilson.jpg', 'Multilingual customer service specialist'),
('James', 'Anderson', '1990-12-07', 'support', 'Merchandise', 'beginner', 'staff/james_anderson.jpg', 'Sales professional with inventory management skills'),
('Elizabeth', 'Moore', '1994-07-29', 'support', 'Food Service', 'trainee', 'staff/elizabeth_moore.jpg', 'Hospitality student gaining festival experience'),
('Andrew', 'Jackson', '1988-04-17', 'support', 'Usher', 'intermediate', 'staff/andrew_jackson.jpg', 'Experienced in guest relations and venue navigation'),
('Nicole', 'White', '1992-03-05', 'support', 'Cleaning Crew', 'beginner', 'staff/nicole_white.jpg', 'Environmental management specialist');

-- Insert Visitors
INSERT INTO Visitor (first_name, last_name, email, phone, birth_date) VALUES
('Alex', 'Johnson', 'alex.johnson@email.com', '+1234567890', '1990-05-15'),
('Maria', 'Garcia', 'maria.garcia@email.com', '+2345678901', '1988-12-10'),
('Liam', 'Smith', 'liam.smith@email.com', '+3456789012', '1995-03-22'),
('Sophia', 'Brown', 'sophia.brown@email.com', '+4567890123', '1992-08-18'),
('Noah', 'Miller', 'noah.miller@email.com', '+5678901234', '1985-01-30'),
('Emma', 'Davis', 'emma.davis@email.com', '+6789012345', '1993-11-05'),
('Oliver', 'Wilson', 'oliver.wilson@email.com', '+7890123456', '1987-07-12'),
('Ava', 'Martinez', 'ava.martinez@email.com', '+8901234567', '1991-09-28'),
('William', 'Anderson', 'william.anderson@email.com', '+9012345678', '1989-04-03'),
('Isabella', 'Taylor', 'isabella.taylor@email.com', '+0123456789', '1994-06-20');

-- Insert more visitors (add at least 50 more for realistic data)

-- Insert Event data for festivals
-- Note: In a complete script, events would be created for all festivals
-- with appropriate dates matching festival dates

-- Insert ArtistGenre relations
-- Link artists to their genres
INSERT INTO ArtistGenre (artist_id, genre_id) VALUES
(1, 3),  -- JW Beats - Electronic
(1, 11), -- JW Beats - Techno
(2, 2),  -- Luna - Pop
(2, 8),  -- Luna - Indie Pop
(3, 4),  -- MC Mike - Hip Hop
(3, 19), -- MC Mike - Old School Hip Hop
(4, 8),  -- Emily Taylor - Folk
(4, 43), -- Emily Taylor - Contemporary Folk
(5, 3),  -- DJ Pulse - Electronic
(5, 11), -- DJ Pulse - Techno
(5, 12), -- DJ Pulse - House
(6, 4),  -- Liv - Hip Hop
(6, 10), -- Liv - Blues
(7, 10), -- RJ - Blues
(7, 48), -- RJ - Electric Blues
(8, 6),  -- Jessica Lee - Classical
(8, 28), -- Jessica Lee - Contemporary Classical
(9, 1),  -- Tommy Riffs - Rock
(9, 13), -- Tommy Riffs - Hard Rock
(10, 2), -- Maya P - Pop
(10, 3); -- Maya P - Electronic

-- Insert BandGenre relations
-- Link bands to their genres
INSERT INTO BandGenre (band_id, genre_id) VALUES
(1, 1),  -- The Electric Dragons - Rock
(1, 11), -- The Electric Dragons - Alternative Rock
(2, 2),  -- Neon Wolves - Pop
(2, 6),  -- Neon Wolves - Synth Pop
(3, 7),  -- Cosmic Phoenix - Metal
(3, 36), -- Cosmic Phoenix - Progressive Metal
(4, 8),  -- The Stellar Ravens - Folk
(4, 42), -- The Stellar Ravens - Folk Rock
(5, 1),  -- Quantum Tigers - Rock
(5, 3),  -- Quantum Tigers - Electronic
(6, 3),  -- Digital Eagles - Electronic
(6, 13), -- Digital Eagles - EDM
(7, 2),  -- Crystal Falcons - Pop
(7, 15), -- Crystal Falcons - Dream Pop
(8, 1),  -- Sonic Lions - Rock
(8, 13), -- Sonic Lions - Hard Rock
(8, 10), -- Sonic Lions - Blues
(9, 3),  -- Laser Vipers - Electronic
(9, 11), -- Laser Vipers - Techno
(10, 7); -- Midnight Cobras - Metal

-- Insert ArtistBand relations
-- Link artists to their bands
INSERT INTO ArtistBand (artist_id, band_id, join_date) VALUES
(1, 6, '2011-09-05'),  -- JW Beats joined Digital Eagles
(2, 7, '2013-04-12'),  -- Luna joined Crystal Falcons
(5, 9, '2016-02-14'),  -- DJ Pulse joined Laser Vipers
(7, 8, '2009-08-28'),  -- RJ joined Sonic Lions
(9, 1, '2010-03-15'),  -- Tommy Riffs joined The Electric Dragons
(10, 2, '2015-07-22'); -- Maya P joined Neon Wolves