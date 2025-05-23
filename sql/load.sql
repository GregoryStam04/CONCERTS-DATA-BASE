-- Use the pulse_university database
USE pulse_university;

-- Populate EntityImage table first since it's referenced by other tables
INSERT INTO EntityImage (entity_type, entity_id, image_path, description, url) VALUES
(1, 1, '/images/festivals/pulse2015.jpg', 'Pulse Festival 2015 Poster', 'https://pulse-university.com/images/2015/poster'),
(1, 2, '/images/festivals/pulse2016.jpg', 'Pulse Festival 2016 Poster', 'https://pulse-university.com/images/2016/poster'),
(1, 3, '/images/festivals/pulse2017.jpg', 'Pulse Festival 2017 Poster', 'https://pulse-university.com/images/2017/poster'),
(1, 4, '/images/festivals/pulse2018.jpg', 'Pulse Festival 2018 Poster', 'https://pulse-university.com/images/2018/poster'),
(1, 5, '/images/festivals/pulse2019.jpg', 'Pulse Festival 2019 Poster', 'https://pulse-university.com/images/2019/poster'),
(1, 6, '/images/festivals/pulse2020.jpg', 'Pulse Festival 2020 Poster', 'https://pulse-university.com/images/2020/poster'),
(1, 7, '/images/festivals/pulse2021.jpg', 'Pulse Festival 2021 Poster', 'https://pulse-university.com/images/2021/poster'),
(1, 8, '/images/festivals/pulse2022.jpg', 'Pulse Festival 2022 Poster', 'https://pulse-university.com/images/2022/poster'),
(1, 9, '/images/festivals/pulse2026.jpg', 'Pulse Festival 2026 Poster', 'https://pulse-university.com/images/2026/poster'),
(1, 10, '/images/festivals/pulse2027.jpg', 'Pulse Festival 2027 Poster', 'https://pulse-university.com/images/2027/poster'),
(2, 1, '/images/artists/john_doe.jpg', 'John Doe portrait', 'https://pulse-university.com/images/artists/john_doe'),
(2, 2, '/images/artists/jane_smith.jpg', 'Jane Smith portrait', 'https://pulse-university.com/images/artists/jane_smith'),
(2, 3, '/images/artists/mike_johnson.jpg', 'Mike Johnson portrait', 'https://pulse-university.com/images/artists/mike_johnson'),
(3, 1, '/images/bands/cosmic_rays.jpg', 'Cosmic Rays band photo', 'https://pulse-university.com/images/bands/cosmic_rays'),
(3, 2, '/images/bands/midnight_owls.jpg', 'Midnight Owls band photo', 'https://pulse-university.com/images/bands/midnight_owls'),
(4, 1, '/images/stages/main_stage.jpg', 'Main Stage panorama', 'https://pulse-university.com/images/stages/main_stage'),
(4, 2, '/images/stages/electro_dome.jpg', 'Electro Dome interior', 'https://pulse-university.com/images/stages/electro_dome'),
(5, 1, '/images/staff/technician1.jpg', 'Lead technician John', 'https://pulse-university.com/images/staff/technician1'),
(5, 2, '/images/staff/security1.jpg', 'Security team leader Sarah', 'https://pulse-university.com/images/staff/security1'),
(6, 1, '/images/performances/cosmic_rays_2022.jpg', 'Cosmic Rays performance 2022', 'https://pulse-university.com/images/performances/cosmic_rays_2022');

-- Insert Locations
INSERT INTO Location (address, latitude, longitude, city, country, continent) VALUES
('123 Festival Park', 37.7749, -122.4194, 'San Francisco', 'USA', 'North America'),
('456 Music Avenue', 51.5074, -0.1278, 'London', 'UK', 'Europe'),
('789 Concert Road', 35.6762, 139.6503, 'Tokyo', 'Japan', 'Asia'),
('101 Show Street', -33.8688, 151.2093, 'Sydney', 'Australia', 'Australia'),
('202 Festival Plaza', 55.7558, 37.6173, 'Moscow', 'Russia', 'Europe'),
('303 Beach Road', -22.9068, -43.1729, 'Rio de Janeiro', 'Brazil', 'South America'),
('404 Mountain View', 45.5017, -73.5673, 'Montreal', 'Canada', 'North America'),
('505 Desert Lane', 25.2048, 55.2708, 'Dubai', 'UAE', 'Asia'),
('606 Central Park', 40.7128, -74.0060, 'New York', 'USA', 'North America'),
('707 Harbor View', 22.3193, 114.1694, 'Hong Kong', 'China', 'Asia'),
('808 Riverside Drive', -1.2921, 36.8219, 'Nairobi', 'Kenya', 'Africa'),
('909 Lake Shore', 41.8781, -87.6298, 'Chicago', 'USA', 'North America'),
('1010 Royal Mile', 55.9533, -3.1883, 'Edinburgh', 'UK', 'Europe'),
('1111 Vineyard Road', -33.9249, 18.4241, 'Cape Town', 'South Africa', 'Africa'),
('1212 Nordic Way', 59.9139, 10.7522, 'Oslo', 'Norway', 'Europe');

-- Insert Festivals (8 past, 2 future)
INSERT INTO Festival (festival_name, start_date, end_date, location_id, description) VALUES
('Pulse University 2015', '2015-07-15', '2015-07-18', 1, 'The inaugural Pulse University festival featuring top artists from around the world'),
('Pulse University 2016', '2016-07-20', '2016-07-24', 2, 'Second annual Pulse festival with expanded stages and lineup'),
('Pulse University 2017', '2017-07-15', '2017-07-19', 3, 'First Asian edition of Pulse featuring a mix of Western and Eastern artists'),
('Pulse University 2018', '2018-07-10', '2018-07-14', 4, 'Australian debut of Pulse with focus on electronic and indie music'),
('Pulse University 2019', '2019-07-18', '2019-07-21', 5, 'European edition with expanded technical capabilities'),
('Pulse University 2020', '2020-07-16', '2020-07-19', 6, 'South American debut featuring many local talents'),
('Pulse University 2021', '2021-07-14', '2021-07-18', 7, 'Post-pandemic comeback with record attendance'),
('Pulse University 2022', '2022-07-20', '2022-07-24', 8, 'Middle Eastern edition with cultural fusion themes'),
('Pulse University 2026', '2026-08-15', '2026-08-19', 9, 'Celebrating a decade of music with all-star lineup'),
('Pulse University 2027', '2027-07-16', '2027-07-20', 10, 'Future festival with cutting-edge technology integration');

-- Insert Musical Genres
INSERT INTO Genre (genre_name, parent_genre_id) VALUES
('Rock', NULL),
('Pop', NULL),
('Electronic', NULL),
('Jazz', NULL),
('Hip Hop', NULL),
('Folk', NULL),
('Classical', NULL),
('R&B', NULL),
('Metal', NULL),
('Country', NULL),
('Indie', NULL),
('Alternative', NULL),
('Reggae', NULL),
('Blues', NULL),
('Punk', NULL),
('Hard Rock', 1),
('Soft Rock', 1),
('Progressive Rock', 1),
('Electro Pop', 2),
('Synth Pop', 2),
('Techno', 3),
('House', 3),
('Trance', 3),
('Bebop', 4),
('Smooth Jazz', 4),
('Trap', 5),
('Contemporary Folk', 6),
('Chamber Music', 7),
('Neo Soul', 8),
('Death Metal', 9);

-- Insert Artists
INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram) VALUES
('John Smith', 'JSmith', '1985-05-15', 'www.johnsmith.com', '@johnsmith'),
('Emily Davis', 'Em-D', '1990-03-22', 'www.emilydavis.net', '@emilydavis'),
('Michael Johnson', 'MJ', '1978-11-08', 'www.michaeljohnson.com', '@mjohnson'),
('Sarah Wilson', 'Sarawils', '1992-07-01', 'www.sarahwilson.com', '@sarahwilson'),
('David Brown', 'DB', '1988-04-30', 'www.davidbrown.net', '@davidbrown'),
('Lisa Chen', 'LC', '1995-09-12', 'www.lisachen.com', '@lisachen'),
('James Taylor', 'JT', '1982-02-27', 'www.jamestaylor.org', '@jamestaylor'),
('Anna Martinez', 'AM', '1989-12-05', 'www.annamartinez.com', '@annamartinez'),
('Robert Kim', 'RK', '1991-08-19', 'www.robertkim.com', '@robertkim'),
('Patricia Lopez', 'Patty', '1987-06-24', 'www.patricialopez.net', '@patricialopez'),
('Thomas Wright', 'TomW', '1984-01-31', 'www.thomaswright.com', '@thomaswright'),
('Sophia Lee', 'SoLee', '1993-10-09', 'www.sophialee.com', '@sophialee'),
('Kevin Wang', 'KW', '1998-05-28', 'www.kevinwang.org', '@kevinwang'),
('Alexandra Adams', 'Alex', '1997-07-15', 'www.alexandraadams.com', '@alexandraadams'),
('Daniel Garcia', 'DG', '1986-11-22', 'www.danielgarcia.net', '@danielgarcia'),
('Olivia Nelson', 'Liv', '1994-03-08', 'www.olivianelson.com', '@olivianelson'),
('Nicholas Carter', 'Nick C', '1980-09-17', 'www.nicholascarter.com', '@nicholascarter'),
('Emma White', 'Em-White', '1996-02-14', 'www.emmawhite.net', '@emmawhite'),
('Marcos Rodriguez', 'MR', '1981-12-30', 'www.marcosrodriguez.com', '@marcosrodriguez'),
('Grace Kim', 'GK', '1990-06-11', 'www.gracekim.org', '@gracekim'),
('Victor Nguyen', 'VN', '1988-08-29', 'www.victornguyen.com', '@victornguyen'),
('Natalie Patel', 'Nat', '1997-01-18', 'www.nataliepatel.net', '@nataliepatel'),
('Brandon Wilson', 'BWilson', '1985-04-07', 'www.brandonwilson.com', '@brandonwilson'),
('Michelle Park', 'MP', '1993-11-24', 'www.michellepark.org', '@michellepark'),
('Timothy Scott', 'Tim', '1982-05-19', 'www.timothyscott.com', '@timothyscott'),
('Rebecca Allen', 'Becca', '1996-07-04', 'www.rebeccaallen.net', '@rebeccaallen'),
('Jacob Moore', 'Jake', '1989-02-10', 'www.jacobmoore.com', '@jacobmoore'),
('Samantha Torres', 'Sam T', '1991-10-26', 'www.samanthatorres.org', '@samanthatorres'),
('Ethan Lewis', 'E-Lewis', '1987-08-15', 'www.ethanlewis.com', '@ethanlewis'),
('Isabella Clark', 'Bella', '1998-03-05', 'www.isabellaclark.net', '@isabellaclark');

-- Insert more artists to reach 50 (adding 20 more to the 30 above)
INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram) VALUES
('Christopher Reed', 'Chris R', '1983-09-12', 'www.chrisreed.com', '@chrisreed'),
('Ava Mitchell', 'Ava M', '1995-11-30', 'www.avamitchell.net', '@avamitchell'),
('Jonathan Kelly', 'JK', '1979-04-25', 'www.jonathankelly.org', '@jonathankelly'),
('Maria Gonzalez', 'MariaG', '1992-01-16', 'www.mariagonzalez.com', '@mariagonzalez'),
('Andrew Phillips', 'Drew', '1986-07-08', 'www.andrewphillips.net', '@andrewphillips'),
('Zoe Campbell', 'ZC', '1997-12-19', 'www.zoecampbell.com', '@zoecampbell'),
('Benjamin Foster', 'Ben F', '1984-03-27', 'www.benjaminfoster.org', '@benjaminfoster'),
('Chloe Murphy', 'CMurph', '1999-05-09', 'www.chloemurphy.com', '@chloemurphy'),
('Gabriel Rivera', 'Gabe', '1980-10-14', 'www.gabrielrivera.net', '@gabrielrivera'),
('Lily Cooper', 'Lily C', '1993-06-23', 'www.lilycooper.com', '@lilycooper'),
('Mason Wood', 'MWood', '1981-02-07', 'www.masonwood.org', '@masonwood'),
('Aubrey Jenkins', 'AJ', '1996-08-31', 'www.aubreyjenkins.com', '@aubreyjenkins'),
('Oscar Thompson', 'OT', '1987-01-05', 'www.oscarthompson.net', '@oscarthompson'),
('Ruby Brooks', 'Ruby B', '1994-04-12', 'www.rubybrooks.com', '@rubybrooks'),
('Henry Dixon', 'HDix', '1983-12-28', 'www.henrydixon.org', '@henrydixon'),
('Scarlett Coleman', 'Scar', '1998-07-06', 'www.scarlettcoleman.com', '@scarlettcoleman'),
('Leo Bennett', 'LB', '1985-09-17', 'www.leobennett.net', '@leobennett'),
('Luna Martinez', 'Luna M', '1992-11-02', 'www.lunamartinez.com', '@lunamartinez'),
('Noah Parker', 'NP', '1988-03-21', 'www.noahparker.org', '@noahparker'),
('Aurora James', 'Aurora J', '1997-05-29', 'www.aurorajames.com', '@aurorajames');

-- Insert Bands
INSERT INTO Band (band_name, formation_date, website, instagram) VALUES
('Cosmic Rays', '2010-03-15', 'www.cosmicrays.com', '@cosmicrays'),
('Midnight Owls', '2012-09-22', 'www.midnightowls.net', '@midnightowls'),
('Neon Dreams', '2014-05-11', 'www.neondreams.com', '@neondreams'),
('Electric Echo', '2011-11-08', 'www.electricecho.org', '@electricecho'),
('Velvet Thunder', '2008-07-19', 'www.velvetthunder.com', '@velvetthunder'),
('Crystal Skies', '2015-02-26', 'www.crystalskies.net', '@crystalskies'),
('Urban Pulse', '2013-08-14', 'www.urbanpulse.com', '@urbanpulse'),
('Silver Lining', '2009-04-30', 'www.silverlining.org', '@silverlining'),
('Rhythm Junction', '2016-10-05', 'www.rhythmjunction.com', '@rhythmjunction'),
('Quantum Beat', '2012-01-17', 'www.quantumbeat.net', '@quantumbeat'),
('Northern Lights', '2014-06-29', 'www.northernlights.com', '@northernlights'),
('Desert Storm', '2010-12-11', 'www.desertstorm.org', '@desertstorm'),
('Ocean Wave', '2013-03-24', 'www.oceanwave.com', '@oceanwave'),
('Mountain Echo', '2011-05-07', 'www.mountainecho.net', '@mountainecho'),
('Jungle Fever', '2015-09-01', 'www.junglefever.com', '@junglefever'),
('Metro Pulse', '2009-11-14', 'www.metropulse.org', '@metropulse'),
('Sunset Boulevard', '2012-07-08', 'www.sunsetblvd.com', '@sunsetblvd'),
('Arctic Monkeys', '2002-06-22', 'www.arcticmonkeys.com', '@arcticmonkeys'),
('The Black Keys', '2001-09-04', 'www.theblackkeys.com', '@theblackkeys'),
('Imagine Dragons', '2008-02-14', 'www.imaginedragons.com', '@imaginedragons');

-- Insert ArtistBand (artist-band relationships)
INSERT INTO ArtistBand (artist_id, band_id, join_date) VALUES
(1, 1, '2010-03-15'),
(2, 1, '2010-03-15'),
(3, 1, '2011-05-20'),
(4, 2, '2012-09-22'),
(5, 2, '2012-09-22'),
(6, 3, '2014-05-11'),
(7, 3, '2014-05-11'),
(8, 3, '2015-08-30'),
(9, 4, '2011-11-08'),
(10, 4, '2011-11-08'),
(11, 5, '2008-07-19'),
(12, 5, '2009-02-14'),
(13, 6, '2015-02-26'),
(14, 6, '2015-02-26'),
(15, 7, '2013-08-14'),
(16, 7, '2013-08-14'),
(17, 8, '2009-04-30'),
(18, 8, '2010-10-15'),
(19, 9, '2016-10-05'),
(20, 9, '2016-10-05'),
(21, 10, '2012-01-17'),
(22, 10, '2012-01-17'),
(23, 10, '2013-06-29'),
(24, 11, '2014-06-29'),
(25, 11, '2014-06-29'),
(26, 12, '2010-12-11'),
(27, 12, '2010-12-11'),
(28, 13, '2013-03-24'),
(29, 13, '2013-03-24'),
(30, 14, '2011-05-07'),
(31, 14, '2011-05-07'),
(32, 15, '2015-09-01'),
(33, 15, '2015-09-01'),
(34, 16, '2009-11-14'),
(35, 16, '2009-11-14'),
(36, 17, '2012-07-08'),
(37, 17, '2012-07-08'),
(38, 18, '2002-06-22'),
(39, 18, '2002-06-22'),
(40, 19, '2001-09-04'),
(41, 19, '2001-09-04'),
(42, 20, '2008-02-14'),
(43, 20, '2008-02-14'),
-- Artists in multiple bands
(1, 8, '2016-04-18'),
(7, 12, '2016-07-25'),
(15, 4, '2017-01-30'),
(23, 17, '2015-11-12'),
(28, 5, '2014-03-27');

-- Insert ArtistGenre (artist-genre relationships)
INSERT INTO ArtistGenre (artist_id, genre_id) VALUES
(1, 1), (1, 16), 
(2, 2), (2, 19), 
(3, 3), (3, 21), 
(4, 4), (4, 24), 
(5, 5), (5, 26), 
(6, 6), (6, 27), 
(7, 7), (7, 28), 
(8, 8), (8, 29),
(9, 9), (9, 30), 
(10, 10),
(11, 11), 
(12, 12), 
(13, 13), 
(14, 14), 
(15, 15), 
(16, 1), (16, 17), 
(17, 2), (17, 20), 
(18, 3), (18, 22),
(19, 4), (19, 25), 
(20, 5), 
(21, 6),
(22, 7),
(23, 8), 
(24, 9), 
(25, 10), 
(26, 11), 
(27, 12), 
(28, 13), 
(29, 14), 
(30, 15), 
(31, 1), (31, 18), 
(32, 2), 
(33, 3), (33, 23), 
(34, 4), 
(35, 5), 
(36, 6),
(37, 7), 
(38, 8), 
(39, 9), 
(40, 10),
(41, 11), 
(42, 12), 
(43, 13), 
(44, 14), 
(45, 15), 
(46, 1),
(47, 2),
(48, 3), 
(49, 4), 
(50, 5); 

-- Insert BandGenre (band-genre relationships)
INSERT INTO BandGenre (band_id, genre_id) VALUES
(1, 1), (1, 12), 
(2, 2), (2, 11), 
(3, 3), (3, 21), 
(4, 4), (4, 25), 
(5, 5), (5, 26), 
(6, 6), (6, 27), 
(7, 7), (7, 28),
(8, 8), (8, 29), 
(9, 9), (9, 30), 
(10, 10),
(11, 11),
(12, 12), 
(13, 13),
(14, 14),
(15, 15), 
(16, 1), (16, 16),
(17, 2), (17, 19), 
(18, 1), (18, 12), 
(19, 1), (19, 14),
(20, 1), (20, 12);

-- Insert Stages (venues)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id) VALUES
('Main Stage', 'Primary venue with state-of-the-art sound system', 500, 'Advanced lighting, 6 speaker towers, LED screens', 1),
('Electronica Dome', 'Indoor venue for electronic music', 800, 'DJ equipment, laser lights, fog machines', 1),
('Acoustic Haven', 'Intimate setting for acoustic performances', 1000, 'Minimal setup, acoustic-friendly environment', 1),
('Rock Arena', 'Open-air venue for rock bands', 1000, 'Heavy-duty sound system, pyrotechnics', 2),
('Jazz Corner', 'Elegant space for jazz performances', 2000, 'Vintage microphones, subtle lighting', 2),
('Hip Hop Square', 'Urban-styled venue', 10000, 'Bass-heavy sound system, graffiti backdrop', 2),
('Tokyo Main', 'Large venue in the center of festival grounds', 2000, 'High-tech lighting, surround sound', 3),
('Anime Stage', 'Japanese pop culture themed stage', 300, 'Visual displays, animated backdrops', 3),
('Sydney Harbor Stage', 'Waterfront main venue', 500, 'Weather-resistant equipment, boat accessibility', 4),
('Outback Stage', 'Australian-themed venue', 750, 'Rustic setup, natural acoustics', 4),
('Red Square', 'Central Moscow venue', 300, 'Historic setting, advanced sound', 5),
('Winter Palace', 'Elegant indoor venue', 600, 'Classical architecture, perfect acoustics', 5),
('Copacabana Stage', 'Beachfront main venue', 300, 'Sand-resistant equipment, beach party setup', 6),
('Samba Arena', 'Brazilian carnival atmosphere', 1200, 'Parade floats, festive lighting', 6),
('Montreal Main', 'Central festival grounds', 2000, 'Bilingual displays, maple leaf motifs', 7),
('Quebec Stage', 'French-Canadian themed', 3000, 'Cultural decor, local sound engineers', 7),
('Desert Oasis', 'Main stage in Dubai', 2000, 'Heat-resistant equipment, cooling systems', 8),
('Gold Pavilion', 'Luxury-themed venue', 520, 'Premium sound, VIP areas', 8),
('Central Park Stage', 'New Yorks iconic location', 400, 'Urban backdrop , city skyline views', 9),
('Brooklyn Arena', 'Industrial-styled venue', 1500, 'Warehouse aesthetics, graffiti art', 9),
('Victoria Harbor', 'Hong Kong waterfront', 280, 'Light show capabilities, harbor views', 10),
('Kowloon Stage', 'Cultural fusion venue', 600, 'East meets West design, traditional elements', 10),
('Alternative Grounds', 'Venue for alternative and indie bands', 700, 'Vintage amps, indie aesthetic', 1),
('Electronic Wonderland', 'Immersive experience for electronic music', 200, '3D mapping, interactive elements', 3),
('Classical Pavilion', 'Venue designed for orchestral performances', 400, 'Perfect acoustics, orchestra pit', 5),
('Reggae Bay', 'Caribbean-themed stage for reggae artists', 700, 'Island decor, specialized bass equipment', 7),
('Metal Forge', 'Heavy metal dedicated stage', 900, 'Fire effects, dark atmosphere', 2),
('Folk Forest', 'Nature-inspired venue for folk music', 350, 'Natural amphitheater, woodland setting', 4),
('Urban Beat Box', 'Street culture inspired stage', 600, 'Graffiti walls, street dance floor', 6),
('Sunset Stage', 'Western-facing stage for evening performances', 500, 'Special sunset lighting, golden hour effects', 8);

-- Insert Staff
INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level) VALUES
-- Technical staff
('James', 'Williams', '1985-05-15', 'technical', 'Sound Engineer', 'expert'),
('Maria', 'Garcia', '1990-07-22', 'technical', 'Lighting Technician', 'experienced'),
('Robert', 'Johnson', '1988-03-10', 'technical', 'Stage Manager', 'expert'),
('Lisa', 'Chen', '1993-09-18', 'technical', 'Audio Technician', 'beginner'),
('David', 'Smith', '1987-11-30', 'technical', 'Visual Effects', 'beginner'),
('Emily', 'Taylor', '1995-02-25', 'technical', 'Equipment Manager', 'intermediate'),
('Michael', 'Brown', '1982-06-14', 'technical', 'Production Manager', 'expert'),
('Sophia', 'Lee', '1991-04-09', 'technical', 'Camera Operator', 'intermediate'),
('Daniel', 'Martinez', '1989-08-12', 'technical', 'Sound Assistant', 'beginner'),
('Olivia', 'Wilson', '1997-01-28', 'technical', 'Lighting Assistant', 'trainee'),
('Thomas', 'Anderson', '1984-12-03', 'technical', 'Technical Director', 'beginner'),
('Emma', 'Lopez', '1992-05-17', 'technical', 'LED Screen Technician', 'intermediate'),
('William', 'Harris', '1986-10-20', 'technical', 'Pyrotechnics Specialist', 'experienced'),
('Ava', 'Clark', '1994-03-15', 'technical', 'Rigging Technician', 'beginner'),
('Joseph', 'Lewis', '1983-07-28', 'technical', 'Backline Technician', 'experienced'),

-- Security staff
('John', 'Walker', '1980-04-22', 'security', 'Security Chief', 'expert'),
('Samantha', 'King', '1988-09-14', 'security', 'Security Supervisor', 'experienced'),
('Christopher', 'Wright', '1984-11-30', 'security', 'Entrance Guard', 'intermediate'),
('Jessica', 'Scott', '1990-06-17', 'security', 'Stage Security', 'experienced'),
('Matthew', 'Green', '1982-03-25', 'security', 'VIP Security', 'expert'),
('Elizabeth', 'Baker', '1987-08-09', 'security', 'Perimeter Security', 'intermediate'),
('Anthony', 'Adams', '1991-01-12', 'security', 'Crowd Control', 'intermediate'),
('Ashley', 'Nelson', '1986-05-20', 'security', 'Emergency Response', 'experienced'),
('Alexander', 'Hill', '1993-10-04', 'security', 'Security Patrol', 'beginner'),
('Sarah', 'Rivera', '1989-12-18', 'security', 'Backstage Security', 'intermediate'),
('Ryan', 'Mitchell', '1985-02-23', 'security', 'Asset Protection', 'experienced'),
('Megan', 'Carter', '1992-07-15', 'security', 'Security Coordinator', 'intermediate'),
('Kevin', 'Phillips', '1981-11-08', 'security', 'Security Analyst', 'expert'),
('Rachel', 'Evans', '1994-04-29', 'security', 'Security Assistant', 'trainee'),
('Brian', 'Turner', '1983-09-06', 'security', 'Access Control', 'experienced'),
('Marcus', 'Reynolds', '1990-06-15', 'security', 'Security Officer', 'intermediate'),
('Vanessa', 'Hughes', '1988-09-22', 'security', 'Security Coordinator', 'experienced'),
('Terrence', 'Watson', '1991-03-11', 'security', 'Security Personnel', 'beginner'),
('Natalie', 'Brooks', '1987-12-05', 'security', 'Crowd Control', 'experienced'),
('Derek', 'Morgan', '1989-07-18', 'security', 'Security Guard', 'intermediate'),
('Olivia', 'Bennett', '1993-02-09', 'security', 'Entrance Security', 'beginner'),
('Gabriel', 'Kim', '1985-11-27', 'security', 'Security Supervisor', 'expert'),
('Sophie', 'Patel', '1992-08-14', 'security', 'Emergency Response', 'intermediate'),
('Julian', 'Rodriguez', '1986-04-22', 'security', 'Perimeter Security', 'experienced'),
('Hannah', 'Thompson', '1994-01-08', 'security', 'Security Assistant', 'trainee'),
('Kyle', 'Richardson', '1987-10-19', 'security', 'Asset Protection', 'intermediate'),
('Zoe', 'Anderson', '1990-05-30', 'security', 'Security Officer', 'experienced'),
('Calvin', 'Mitchell', '1992-11-16', 'security', 'Security Patrol', 'beginner'),
('Eva', 'Collins', '1988-07-25', 'security', 'Security Analyst', 'experienced'),
('Nolan', 'Garcia', '1991-03-04', 'security', 'Backstage Security', 'intermediate'),

-- Support staff
('Jennifer', 'Cooper', '1989-05-12', 'support', 'Guest Relations Manager', 'experienced'),
('Nicholas', 'Peterson', '1991-08-24', 'support', 'Information Desk', 'intermediate'),
('Amanda', 'Reed', '1986-03-17', 'support', 'First Aid Attendant', 'expert'),
('Jacob', 'Bailey', '1993-11-09', 'support', 'Lost and Found', 'beginner'),
('Stephanie', 'Bell', '1988-07-31', 'support', 'Hospitality Coordinator', 'experienced'),
('Andrew', 'Gomez', '1990-02-14', 'support', 'Transportation Coordinator', 'intermediate'),
('Melissa', 'Kelly', '1985-06-26', 'support', 'Artist Liaison', 'experienced'),
('Joshua', 'Price', '1994-09-03', 'support', 'Volunteer Coordinator', 'beginner'),
('Heather', 'Wood', '1987-12-19', 'support', 'Food Service Manager', 'experienced'),
('Brandon', 'Barnes', '1992-04-11', 'support', 'Merchandise Manager', 'intermediate'),
('Nicole', 'Ross', '1984-10-27', 'support', 'Accessibility Coordinator', 'expert'),
('Tyler', 'Henderson', '1995-01-08', 'support', 'Information Guide', 'trainee'),
('Amy', 'Coleman', '1986-08-15', 'support', 'VIP Host', 'experienced'),
('Eric', 'Jenkins', '1990-05-23', 'support', 'Ticketing Manager', 'intermediate'),
('Rebecca', 'Perry', '1988-11-30', 'support', 'Customer Service', 'experienced'),
('Ava', 'Michaels', '1994-09-17', 'support', 'Guest Relations', 'intermediate'),
('Lucas', 'Stewart', '1989-04-28', 'support', 'Information Assistant', 'beginner'),
('Mia', 'Patterson', '1992-11-06', 'support', 'Hospitality Staff', 'intermediate'),
('Ethan', 'Cooper', '1987-06-15', 'support', 'Customer Service', 'experienced'),
('Isabella', 'Foster', '1995-01-22', 'support', 'Transportation Aide', 'trainee'),
('Benjamin', 'Wright', '1990-08-11', 'support', 'Merchandise Assistant', 'beginner'),
('Charlotte', 'Hayes', '1988-03-19', 'support', 'Food Service', 'intermediate'),
('Mason', 'Gibson', '1993-05-07', 'support', 'Accessibility Support', 'experienced'),
('Harper', 'Dixon', '1991-12-14', 'support', 'Lost and Found', 'beginner'),
('Jack', 'Wagner', '1986-09-25', 'support', 'Information Guide', 'intermediate'),
('Lily', 'Warren', '1994-02-03', 'support', 'First Aid Assistant', 'experienced'),
('Owen', 'Boyd', '1989-10-31', 'support', 'VIP Host', 'intermediate'),
('Chloe', 'Fuller', '1992-07-29', 'support', 'Volunteer Coordinator', 'beginner'),
('Samuel', 'Mills', '1987-04-18', 'support', 'Artist Liaison', 'experienced'),
('Grace', 'Webb', '1990-11-09', 'support', 'Ticketing Assistant', 'intermediate');

-- Insert Events
INSERT INTO Event (event_name, event_date, stage_id, start_time, end_time, description) VALUES
-- Festival 1 events (2015)
('Opening Night', '2015-07-15', 1, '18:00:00', '23:00:00', 'Inaugural opening of Pulse University Festival'),
('Electronic Friday', '2015-07-16', 2, '19:00:00', '02:00:00', 'All night electronic music showcase'),
('Acoustic Saturday', '2015-07-17', 3, '14:00:00', '20:00:00', 'Relaxing day of acoustic performances'),
('Closing Party', '2015-07-18', 1, '16:00:00', '23:00:00', 'Final night celebration'),

-- Festival 2 events (2016)
('Rock Opening', '2016-07-20', 4, '17:00:00', '23:00:00', 'Rock-themed opening night'),
('Jazz Night', '2016-07-21', 5, '18:00:00', '00:00:00', 'Evening of smooth jazz'),
('Hip Hop Showcase', '2016-07-22', 6, '20:00:00', '02:00:00', 'Top hip hop artists perform'),
('Alternative Day', '2016-07-23', 4, '15:00:00', '22:00:00', 'Day of alternative and indie music'),
('Grand Finale', '2016-07-24', 6, '16:00:00', '23:30:00', 'Closing event with special performances'),

-- Festival 3 events (2017)
('Tokyo Lights', '2017-07-15', 7, '19:00:00', '23:00:00', 'Opening night in Tokyo'),
('J-Pop Explosion', '2017-07-16', 8, '18:00:00', '23:00:00', 'Featuring top Japanese artists'),
('Global Beats', '2017-07-17', 7, '17:00:00', '22:00:00', 'International artists showcase'),
('Electronic Dreams', '2017-07-18', 8, '20:00:00', '02:00:00', 'Night of electronic music'),
('Sayonara Party', '2017-07-19', 7, '18:00:00', '00:00:00', 'Closing night celebration'),

-- Festival 4 events (2018)
('Sydney Calling', '2018-07-10', 9, '18:00:00', '23:00:00', 'Australian opening night'),
('Down Under Rock', '2018-07-11', 10, '17:00:00', '22:00:00', 'Featuring Australian rock bands'),
('Beach Party', '2018-07-12', 9, '15:00:00', '23:00:00', 'Waterfront music celebration'),
('Indie Day', '2018-07-13', 10, '14:00:00', '21:00:00', 'Day of independent music'),
('Final Wave', '2018-07-14', 9, '16:00:00', '23:30:00', 'Closing event by the harbor'),

-- Festival 5 events (2019)
('Moscow Nights', '2019-07-18', 11, '19:00:00', '00:00:00', 'Russian opening celebration'),
('Classical Revival', '2019-07-19', 12, '18:00:00', '22:00:00', 'Classical music showcase'),
('European Beats', '2019-07-20', 11, '17:00:00', '23:00:00', 'Top European artists'),
('Festival Finale', '2019-07-21', 11, '16:00:00', '23:30:00', 'Grand closing night'),

-- Festival 6 events (2020)
('Rio Carnival', '2020-07-16', 13, '18:00:00', '00:00:00', 'Brazilian-style opening'),
('Samba Night', '2020-07-17', 14, '19:00:00', '02:00:00', 'Night of traditional samba'),
('Latin Fusion', '2020-07-18', 13, '17:00:00', '23:00:00', 'Mix of Latin music styles'),
('Beach Closing', '2020-07-19', 13, '16:00:00', '23:30:00', 'Final celebration on the beach'),

-- Festival 7 events (2021)
('Montreal Welcome', '2021-07-14', 15, '18:00:00', '23:00:00', 'Canadian opening night'),
('Francophone Sounds', '2021-07-15', 16, '19:00:00', '00:00:00', 'French-language artists'),
('North American Showcase', '2021-07-16', 15, '17:00:00', '23:00:00', 'Artists from across the continent'),
('Cultural Fusion', '2021-07-17', 16, '15:00:00', '22:00:00', 'Multicultural music day'),
('Farewell Concert', '2021-07-18', 15, '16:00:00', '23:30:00', 'Final night celebration'),

-- Festival 8 events (2022)
('Desert Welcome', '2022-07-20', 17, '19:00:00', '00:00:00', 'Middle Eastern opening night'),
('Arabian Nights', '2022-07-21', 18, '20:00:00', '01:00:00', 'Traditional and modern Arabic music'),
('Global Oasis', '2022-07-22', 17, '18:00:00', '23:00:00', 'International artists in Dubai'),
('Electronic Sands', '2022-07-23', 18, '21:00:00', '03:00:00', 'Electronic music showcase'),
('Golden Finale', '2022-07-24', 17, '18:00:00', '00:00:00', 'Closing celebration'),

-- Festival 9 events (2026 - Future)
('New York Opening', '2026-08-15', 19, '18:00:00', '23:00:00', 'Big Apple welcome night'),
('Brooklyn Beats', '2026-08-16', 20, '19:00:00', '01:00:00', 'Hip hop and urban music'),
('Central Park Day', '2026-08-17', 19, '14:00:00', '22:00:00', 'All-day music festival'),
('Urban Sounds', '2026-08-18', 20, '16:00:00', '23:00:00', 'City-inspired performances'),
('Anniversary Closing', '2026-08-19', 19, '17:00:00', '00:00:00', 'Special 10-year celebration'),

-- Festival 10 events (2027 - Future)
('Hong Kong Harmony', '2027-07-16', 21, '19:00:00', '00:00:00', 'Opening night by the harbor'),
('East Meets West', '2027-07-17', 22, '18:00:00', '23:00:00', 'Cultural fusion performances'),
('Asian Showcase', '2027-07-18', 21, '17:00:00', '23:00:00', 'Top Asian artists'),
('Electronic Asia', '2027-07-19', 22, '20:00:00', '02:00:00', 'Modern electronic music'),
('Farewell from Hong Kong', '2027-07-20', 21, '18:00:00', '00:00:00', 'Final celebration');

-- Insert Performances
-- We need to create at least 100 performances across various events
INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id) VALUES
-- Opening Night (Event 1, Festival 1)
(1, 'warm up', '18:30:00', '19:30:00', 1, NULL), 
(1, 'regular', '19:45:00', '20:45:00', NULL, 2), 
(1, 'special guest', '21:00:00', '22:00:00', 5, NULL), 
(1, 'headline', '22:15:00', '23:00:00', NULL, 1), 

-- Electronic Friday (Event 2, Festival 1)
(2, 'warm up', '19:30:00', '20:30:00', 1, NULL), 
(2, 'regular', '20:45:00', '21:45:00', NULL, 3), 
(2, 'headline', '22:00:00', '23:30:00', 6, NULL),
(2, 'special guest', '23:45:00', '01:30:00', NULL, 6),

-- Acoustic Saturday (Event 3, Festival 1)
(3, 'warm up', '14:30:00', '15:30:00', 10, NULL), 
(3, 'regular', '15:45:00', '16:45:00', 7, NULL), 
(3, 'headline', '17:00:00', '18:30:00', NULL, 8),
(3, 'special guest', '18:45:00', '19:45:00', 12, NULL),

-- Closing Party (Event 4, Festival 1)
(4, 'warm up', '16:30:00', '17:30:00', 1, NULL), 
(4, 'regular', '17:45:00', '18:45:00', 8, NULL), 
(4, 'special guest', '19:00:00', '20:30:00', NULL, 5), 
(4, 'headline', '20:45:00', '22:45:00', 4, NULL), 

-- Rock Opening (Event 5, Festival 2)
(5, 'warm up', '17:30:00', '18:30:00', NULL, 9), 
(5, 'regular', '18:45:00', '19:45:00', 15, NULL), 
(5, 'special guest', '20:00:00', '21:00:00', NULL, 10), 
(5, 'headline', '21:15:00', '22:45:00', 9, NULL), 

-- Jazz Night (Event 6, Festival 2)
(6, 'warm up', '18:30:00', '19:30:00', NULL, 15), 
(6, 'regular', '19:45:00', '20:45:00', NULL, 11), 
(6, 'headline', '21:00:00', '22:30:00', 4, NULL), 
(6, 'special guest', '22:45:00', '23:45:00', 20, NULL), 

-- Hip Hop Showcase (Event 7, Festival 2)
(7, 'warm up', '20:30:00', '21:30:00', NULL, 15), 
(7, 'regular', '21:45:00', '22:45:00', NULL, 7), 
(7, 'special guest', '23:00:00', '00:00:00', 21, NULL), 
(7, 'headline', '00:15:00', '01:45:00', NULL, 12), 

-- Alternative Day (Event 8, Festival 2)
(8, 'warm up', '15:30:00', '16:30:00', NULL, 15), 
(8, 'regular', '16:45:00', '17:45:00', 11, NULL), 
(8, 'special guest', '18:00:00', '19:00:00', NULL, 14), 
(8, 'headline', '19:15:00', '21:15:00', 12, NULL), 

-- Grand Finale (Event 9, Festival 2)
(9, 'warm up', '16:30:00', '17:30:00', NULL, 15), 
(9, 'regular', '17:45:00', '18:45:00', 2, NULL), 
(9, 'special guest', '19:00:00', '20:30:00', NULL, 1), 
(9, 'headline', '20:45:00', '22:45:00', 1, NULL),

-- Tokyo Lights (Event 10, Festival 3)
(10, 'warm up', '19:30:00', '20:30:00', 13, NULL),
(10, 'regular', '20:45:00', '21:45:00', NULL, 16), 
(10, 'special guest', '22:00:00', '23:00:00', 14, NULL), 

-- J-Pop Explosion (Event 11, Festival 3)
(11, 'warm up', '18:30:00', '19:30:00', NULL, 17),
(11, 'headline', '19:45:00', '21:15:00', 16, NULL),
(11, 'special guest', '21:30:00', '22:30:00', 22, NULL), 

-- Global Beats (Event 12, Festival 3)
(12, 'warm up', '17:30:00', '18:30:00', NULL, 3),
(12, 'regular', '18:45:00', '19:45:00', 17, NULL),
(12, 'special guest', '20:00:00', '21:00:00', NULL, 4), 
(12, 'headline', '21:15:00', '22:00:00', 18, NULL), 

-- Electronic Dreams (Event 13, Festival 3)
(13, 'warm up', '20:30:00', '21:30:00', 3, NULL), 
(13, 'regular', '21:45:00', '22:45:00', NULL, 6), 
(13, 'headline', '23:00:00', '00:30:00', 6, NULL), 
(13, 'special guest', '00:45:00', '01:45:00', NULL, 3),

-- Sayonara Party (Event 14, Festival 3)
(14, 'warm up', '18:30:00', '19:30:00', NULL, 9), 
(14, 'regular', '19:45:00', '20:45:00', 23, NULL), 
(14, 'special guest', '21:00:00', '22:00:00', NULL, 11), 
(14, 'headline', '22:15:00', '23:45:00', 24, NULL), 

-- Sydney Calling (Event 15, Festival 4)
(15, 'warm up', '18:30:00', '19:30:00', 25, NULL),
(15, 'regular', '19:45:00', '20:45:00', NULL, 12),
(15, 'special guest', '21:00:00', '22:00:00', 26, NULL),
(15, 'headline', '22:15:00', '23:00:00', NULL, 13),

-- Down Under Rock (Event 16, Festival 4)
(16, 'warm up', '17:30:00', '18:30:00', NULL, 14),
(16, 'regular', '18:45:00', '19:45:00', 27, NULL),
(16, 'special guest', '20:00:00', '21:00:00', NULL, 15),
(16, 'headline', '21:15:00', '22:00:00', 28, NULL), 

-- Beach Party (Event 17, Festival 4)
(17, 'warm up', '15:30:00', '16:30:00', 29, NULL),
(17, 'regular', '16:45:00', '17:45:00', NULL, 16),
(17, 'special guest', '18:00:00', '19:30:00', 30, NULL), 
(17, 'headline', '19:45:00', '21:45:00', NULL, 17), 
(17, 'special guest', '22:00:00', '23:00:00', 1, NULL), 

-- Indie Day (Event 18, Festival 4)
(18, 'warm up', '14:30:00', '15:30:00', NULL, 18), 
(18, 'regular', '15:45:00', '16:45:00', 2, NULL), 
(18, 'special guest', '17:00:00', '18:30:00', NULL, 19), 
(18, 'headline', '18:45:00', '20:45:00', 3, NULL), 

-- Final Wave (Event 19, Festival 4)
(19, 'warm up', '16:30:00', '17:30:00', 31, NULL), 
(19, 'regular', '17:45:00', '18:45:00', NULL, 20),
(19, 'special guest', '19:00:00', '20:30:00', 32, NULL), 
(19, 'headline', '20:45:00', '22:45:00', NULL, 1), 
(19, 'special guest', '23:00:00', '23:30:00', 4, NULL), 

-- Moscow Nights (Event 20, Festival 5)
(20, 'warm up', '19:30:00', '20:30:00', NULL, 2), 
(20, 'regular', '20:45:00', '21:45:00', 33, NULL), 
(20, 'special guest', '22:00:00', '23:00:00', NULL, 3), 
(20, 'headline', '23:15:00', '00:00:00', 34, NULL), 

-- Classical Revival (Event 21, Festival 5)
(21, 'warm up', '18:30:00', '19:30:00', 7, NULL), 
(21, 'headline', '19:45:00', '21:45:00', NULL, 4), 
(21, 'special guest', '22:00:00', '22:00:00', 1, NULL), 

-- European Beats (Event 22, Festival 5)
(22, 'warm up', '17:30:00', '18:30:00', NULL, 5), 
(22, 'regular', '18:45:00', '19:45:00', 36, NULL), 
(22, 'special guest', '20:00:00', '21:30:00', NULL, 6), 
(22, 'headline', '21:45:00', '23:00:00', 8, NULL), 

-- Festival Finale (Event 23, Festival 5)
(23, 'warm up', '16:30:00', '17:30:00', 37, NULL), 
(23, 'regular', '17:45:00', '18:45:00', NULL, 7), 
(23, 'special guest', '19:00:00', '20:00:00', 38, NULL), 
(23, 'headline', '20:15:00', '22:15:00', NULL, 8), 
(23, 'special guest', '22:30:00', '23:30:00', 9, NULL), 

-- Rio Carnival (Event 24, Festival 6)
(24, 'warm up', '18:30:00', '19:30:00', NULL, 9),
(24, 'regular', '19:45:00', '20:45:00', 39, NULL),
(24, 'special guest', '21:00:00', '22:30:00', NULL, 10), 
(24, 'headline', '22:45:00', '00:00:00', 40, NULL),

-- Samba Night (Event 25, Festival 6)
(25, 'warm up', '19:30:00', '20:30:00', 10, NULL),
(25, 'regular', '20:45:00', '21:45:00', NULL, 11),
(25, 'headline', '22:00:00', '23:30:00', 11, NULL), 
(25, 'special guest', '23:45:00', '01:45:00', NULL, 12), 

-- Latin Fusion (Event 26, Festival 6)
(26, 'warm up', '17:30:00', '18:30:00', 41, NULL), 
(26, 'regular', '18:45:00', '19:45:00', NULL, 13),
(26, 'special guest', '20:00:00', '21:00:00', 42, NULL), 
(26, 'headline', '21:15:00', '23:00:00', NULL, 14), 

-- Beach Closing (Event 27, Festival 6)
(27, 'warm up', '16:30:00', '17:30:00', 43, NULL), 
(27, 'regular', '17:45:00', '18:45:00', NULL, 15), 
(27, 'special guest', '19:00:00', '20:30:00', 44, NULL),
(27, 'headline', '20:45:00', '22:45:00', NULL, 16), 
(27, 'special guest', '23:00:00', '23:30:00', 12, NULL), 

-- Montreal Welcome (Event 28, Festival 7)
(28, 'warm up', '18:30:00', '19:30:00', NULL, 17), 
(28, 'regular', '19:45:00', '20:45:00', 13, NULL), 
(28, 'special guest', '21:00:00', '22:00:00', NULL, 18), 
(28, 'headline', '22:15:00', '23:00:00', 14, NULL), 

-- Francophone Sounds (Event 29, Festival 7)
(29, 'warm up', '19:30:00', '20:30:00', 45, NULL), 
(29, 'regular', '20:45:00', '21:45:00', NULL, 19), 
(29, 'headline', '22:00:00', '23:30:00', 15, NULL), 
(29, 'special guest', '23:45:00', '00:00:00', NULL, 20), 

-- North American Showcase (Event 30, Festival 7)
(30, 'warm up', '17:30:00', '18:30:00', 16, NULL), 
(30, 'regular', '18:45:00', '19:45:00', NULL, 1), 
(30, 'special guest', '20:00:00', '21:00:00', 17, NULL), 
(30, 'headline', '21:15:00', '23:00:00', NULL, 2), 

-- Cultural Fusion (Event 31, Festival 7)
(31, 'warm up', '15:30:00', '16:30:00', 46, NULL), 
(31, 'regular', '16:45:00', '17:45:00', NULL, 3), 
(31, 'special guest', '18:00:00', '19:00:00', 47, NULL), 
(31, 'headline', '19:15:00', '21:15:00', NULL, 4),

-- Farewell Concert (Event 32, Festival 7)
(32, 'warm up', '16:30:00', '17:30:00', 18, NULL),
(32, 'regular', '17:45:00', '18:45:00', NULL, 5), 
(32, 'special guest', '19:00:00', '20:30:00', 19, NULL), 
(32, 'headline', '20:45:00', '22:45:00', NULL, 6), 
(32, 'special guest', '23:00:00', '23:30:00', 20, NULL), 

-- Desert Welcome (Event 33, Festival 8)
(33, 'warm up', '19:30:00', '20:30:00', NULL, 7),
(33, 'regular', '20:45:00', '21:45:00', 48, NULL), 
(33, 'special guest', '22:00:00', '23:00:00', NULL, 8), 
(33, 'headline', '23:15:00', '00:00:00', 21, NULL),

-- Arabian Nights (Event 34, Festival 8)
(34, 'warm up', '20:30:00', '21:30:00', 49, NULL), 
(34, 'regular', '21:45:00', '22:45:00', NULL, 9), 
(34, 'headline', '23:00:00', '01:00:00', 22, NULL), 

-- Global Oasis (Event 35, Festival 8)
(35, 'warm up', '18:30:00', '19:30:00', NULL, 10), 
(35, 'regular', '19:45:00', '20:45:00', 50, NULL), 
(35, 'special guest', '21:00:00', '22:00:00', NULL, 11), 
(35, 'headline', '22:15:00', '23:00:00', 23, NULL),

-- Electronic Sands (Event 36, Festival 8)
(36, 'warm up', '21:30:00', '22:30:00', 3, NULL), 
(36, 'regular', '22:45:00', '23:45:00', NULL, 12), 
(36, 'special guest', '00:00:00', '01:30:00', 6, NULL),
(36, 'headline', '01:45:00', '03:00:00', NULL, 3), 

-- Golden Finale (Event 37, Festival 8)
(37, 'warm up', '18:30:00', '19:30:00', 24, NULL), 
(37, 'regular', '19:45:00', '20:45:00', NULL, 13),
(37, 'special guest', '21:00:00', '22:00:00', 25, NULL), 
(37, 'headline', '22:15:00', '00:00:00', NULL, 14), 

-- New York Opening (Event 38, Festival 9 - Future)
(38, 'warm up', '18:30:00', '19:30:00', NULL, 15), 
(38, 'regular', '19:45:00', '20:45:00', 1, NULL),
(38, 'special guest', '21:00:00', '22:00:00', NULL, 16), 
(38, 'headline', '22:15:00', '23:00:00', 2, NULL),

-- Brooklyn Beats (Event 39, Festival 9 - Future)
(39, 'warm up', '19:30:00', '20:30:00', 5, NULL), 
(39, 'regular', '20:45:00', '21:45:00', NULL, 17), 
(39, 'headline', '22:00:00', '23:30:00', 26, NULL), 
(39, 'special guest', '23:45:00', '01:00:00', NULL, 18), 

-- Central Park Day (Event 40, Festival 9 - Future)
(40, 'warm up', '14:30:00', '15:30:00', 27, NULL), 
(40, 'regular', '15:45:00', '16:45:00', NULL, 19), 
(40, 'special guest', '17:00:00', '18:30:00', 4, NULL), 
(40, 'special guest', '18:45:00', '19:45:00', NULL, 20),
(40, 'headline', '20:00:00', '22:00:00', 7, NULL),

-- Urban Sounds (Event 41, Festival 9 - Future)
(41, 'warm up', '16:30:00', '17:30:00', NULL, 1), 
(41, 'regular', '17:45:00', '18:45:00', 28, NULL), 
(41, 'special guest', '19:00:00', '20:30:00', NULL, 2), 
(41, 'headline', '20:45:00', '23:00:00', 8, NULL), 

-- Anniversary Closing (Event 42, Festival 9 - Future)
(42, 'warm up', '17:30:00', '18:30:00', 29, NULL),
(42, 'regular', '18:45:00', '19:45:00', NULL, 3), 
(42, 'special guest', '20:00:00', '21:30:00', 9, NULL), 
(42, 'headline', '21:45:00', '00:00:00', NULL, 4), 

-- Future Festival Events (Festival 10)
(43, 'warm up', '19:30:00', '20:30:00', NULL, 5),
(43, 'regular', '20:45:00', '21:45:00', 10, NULL), 
(43, 'special guest', '22:00:00', '23:00:00', NULL, 6), 
(43, 'headline', '23:15:00', '00:00:00', 11, NULL), 

(44, 'warm up', '18:30:00', '19:30:00', 12, NULL), 
(44, 'regular', '19:45:00', '20:45:00', NULL, 7), 
(44, 'headline', '21:00:00', '22:30:00', 13, NULL), 
(44, 'special guest', '22:45:00', '23:00:00', NULL, 8), 

(45, 'warm up', '17:30:00', '18:30:00', NULL, 9), 
(45, 'regular', '18:45:00', '19:45:00', 14, NULL), 
(45, 'special guest', '20:00:00', '21:00:00', NULL, 10),
(45, 'headline', '21:15:00', '23:00:00', 15, NULL), 

(46, 'warm up', '20:30:00', '21:30:00', 16, NULL),
(46, 'regular', '21:45:00', '22:45:00', NULL, 11), 
(46, 'special guest', '23:00:00', '00:30:00', 17, NULL), 
(46, 'headline', '00:45:00', '02:00:00', NULL, 12),

(47, 'warm up', '18:30:00', '19:30:00', NULL, 13),
(47, 'regular', '19:45:00', '20:45:00', 18, NULL), 
(47, 'special guest', '21:00:00', '22:00:00', NULL, 14), 
(47, 'headline', '22:15:00', '00:00:00', 19, NULL); 

-- Insert Visitors (festival attendees)
INSERT INTO Visitor (first_name, last_name, email, phone, birth_date) VALUES
('Alex', 'Johnson', 'alex.johnson@example.com', '+12025550101', '1990-04-12'),
('Sophia', 'Williams', 'sophia.williams@example.com', '+12025550102', '1988-09-23'),
('Ethan', 'Brown', 'ethan.brown@example.com', '+12025550103', '1995-06-30'),
('Olivia', 'Jones', 'olivia.jones@example.com', '+12025550104', '1992-11-15'),
('Noah', 'Garcia', 'noah.garcia@example.com', '+12025550105', '1985-02-28'),
('Emma', 'Miller', 'emma.miller@example.com', '+12025550106', '1993-07-19'),
('William', 'Davis', 'william.davis@example.com', '+12025550107', '1987-12-04'),
('Ava', 'Rodriguez', 'ava.rodriguez@example.com', '+12025550108', '1991-03-22'),
('James', 'Martinez', 'james.martinez@example.com', '+12025550109', '1986-08-11'),
('Isabella', 'Hernandez', 'isabella.hernandez@example.com', '+12025550110', '1997-01-25'),
('Benjamin', 'Lopez', 'benjamin.lopez@example.com', '+12025550111', '1989-05-16'),
('Mia', 'Gonzalez', 'mia.gonzalez@example.com', '+12025550112', '1994-10-09'),
('Lucas', 'Wilson', 'lucas.wilson@example.com', '+12025550113', '1983-04-03'),
('Charlotte', 'Anderson', 'charlotte.anderson@example.com', '+12025550114', '1996-09-27'),
('Mason', 'Thomas', 'mason.thomas@example.com', '+12025550115', '1990-12-18'),
('Amelia', 'Taylor', 'amelia.taylor@example.com', '+12025550116', '1988-07-07'),
('Elijah', 'Moore', 'elijah.moore@example.com', '+12025550117', '1993-02-14'),
('Harper', 'Jackson', 'harper.jackson@example.com', '+12025550118', '1986-05-29'),
('Logan', 'Martin', 'logan.martin@example.com', '+12025550119', '1995-11-11'),
('Evelyn', 'Lee', 'evelyn.lee@example.com', '+12025550120', '1992-03-06'),
('Aiden', 'Perez', 'aiden.perez@example.com', '+12025550121', '1984-08-22'),
('Abigail', 'Thompson', 'abigail.thompson@example.com', '+12025550122', '1991-01-17'),
('Jackson', 'White', 'jackson.white@example.com', '+12025550123', '1987-06-08'),
('Emily', 'Harris', 'emily.harris@example.com', '+12025550124', '1996-10-30'),
('Grayson', 'Sanchez', 'grayson.sanchez@example.com', '+12025550125', '1989-12-25'),
('Elizabeth', 'Clark', 'elizabeth.clark@example.com', '+12025550126', '1993-05-21'),
('Leo', 'Ramirez', 'leo.ramirez@example.com', '+12025550127', '1985-09-14'),
('Avery', 'Lewis', 'avery.lewis@example.com', '+12025550128', '1997-04-02'),
('Daniel', 'Robinson', 'daniel.robinson@example.com', '+12025550129', '1990-11-27'),
('Sofia', 'Walker', 'sofia.walker@example.com', '+12025550130', '1988-02-19'),
('Matthew', 'Young', 'matthew.young@example.com', '+12025550131', '1994-07-13'),
('Camila', 'Allen', 'camila.allen@example.com', '+12025550132', '1986-03-08'),
('David', 'King', 'david.king@example.com', '+12025550133', '1992-08-31'),
('Aria', 'Wright', 'aria.wright@example.com', '+12025550134', '1985-01-24'),
('Joseph', 'Scott', 'joseph.scott@example.com', '+12025550135', '1995-06-09'),
('Scarlett', 'Torres', 'scarlett.torres@example.com', '+12025550136', '1989-10-15'),
('John', 'Nguyen', 'john.nguyen@example.com', '+12025550137', '1991-04-28'),
('Victoria', 'Hill', 'victoria.hill@example.com', '+12025550138', '1987-09-02'),
('Samuel', 'Flores', 'samuel.flores@example.com', '+12025550139', '1996-02-13'),
('Madison', 'Green', 'madison.green@example.com', '+12025550140', '1993-12-07'),
('Henry', 'Adams', 'henry.adams@example.com', '+12025550141', '1984-05-31'),
('Penelope', 'Nelson', 'penelope.nelson@example.com', '+12025550142', '1992-10-20'),
('Owen', 'Baker', 'owen.baker@example.com', '+12025550143', '1988-03-25'),
('Layla', 'Hall', 'layla.hall@example.com', '+12025550144', '1995-08-16'),
('Sebastian', 'Rivera', 'sebastian.rivera@example.com', '+12025550145', '1986-01-05'),
('Riley', 'Campbell', 'riley.campbell@example.com', '+12025550146', '1990-06-29'),
('Nora', 'Mitchell', 'nora.mitchell@example.com', '+12025550147', '1997-11-14'),
('Wyatt', 'Carter', 'wyatt.carter@example.com', '+12025550148', '1989-04-19'),
('Zoey', 'Roberts', 'zoey.roberts@example.com', '+12025550149', '1993-09-08'),
('Julian', 'Gomez', 'julian.gomez@example.com', '+12025550150', '1985-02-27');

-- Insert Ticket Categories
INSERT INTO TicketCategory (category_name) VALUES
('general'),
('vip'),
('backstage');

-- Assign Staff to Events
-- Create a procedure to automatically assign staff to events based on the requirements
DELIMITER //

CREATE PROCEDURE AssignStaffToEvents()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE event_id_var INT;
    DECLARE capacity_var INT;
    DECLARE required_security INT;
    DECLARE required_support INT;
    DECLARE required_technical INT; 
    DECLARE current_security INT;
    DECLARE current_support INT;
    DECLARE current_technical INT;
    DECLARE security_to_add INT;
    DECLARE support_to_add INT;
    DECLARE technical_to_add INT;
    DECLARE staff_counter INT;
    
    -- Cursor for events
    DECLARE event_cursor CURSOR FOR 
        SELECT e.event_id, s.max_capacity
        FROM Event e
        JOIN Stage s ON e.stage_id = s.stage_id
        ORDER BY e.event_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN event_cursor;
    
    read_loop: LOOP
        FETCH event_cursor INTO event_id_var, capacity_var;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Calculate required staff
        SET required_security = CEILING(capacity_var * 0.05);
        SET required_support = CEILING(capacity_var * 0.02);
        SET required_technical = CEILING(capacity_var * 0.03); -- Assume 3% technical staff requirement
        
        -- Get current staff count
        SELECT COUNT(*) INTO current_security
        FROM StaffAssignment sa
        JOIN Staff s ON sa.staff_id = s.staff_id
        WHERE sa.event_id = event_id_var AND s.staff_type = 'security';
        
        SELECT COUNT(*) INTO current_support
        FROM StaffAssignment sa
        JOIN Staff s ON sa.staff_id = s.staff_id
        WHERE sa.event_id = event_id_var AND s.staff_type = 'support';

        SELECT COUNT(*) INTO current_technical
        FROM StaffAssignment sa
        JOIN Staff s ON sa.staff_id = s.staff_id
        WHERE sa.event_id = event_id_var AND s.staff_type = 'technical';
        
        -- Calculate how many staff to add
        SET security_to_add = GREATEST(0, required_security - current_security);
        SET support_to_add = GREATEST(0, required_support - current_support);
        SET technical_to_add = GREATEST(0, required_technical - current_technical);
        
        -- Add security staff
        IF security_to_add > 0 THEN
            SET staff_counter = 0;
            
            INSERT INTO StaffAssignment (staff_id, event_id)
            SELECT s.staff_id, event_id_var
            FROM Staff s
            WHERE s.staff_type = 'security'
            AND NOT EXISTS (SELECT 1 FROM StaffAssignment sa WHERE sa.staff_id = s.staff_id AND sa.event_id = event_id_var)
            LIMIT security_to_add;
        END IF;
        
        -- Add support staff
        IF support_to_add > 0 THEN
            SET staff_counter = 0;
            
            INSERT INTO StaffAssignment (staff_id, event_id)
            SELECT s.staff_id, event_id_var
            FROM Staff s
            WHERE s.staff_type = 'support'
            AND NOT EXISTS (SELECT 1 FROM StaffAssignment sa WHERE sa.staff_id = s.staff_id AND sa.event_id = event_id_var)
            LIMIT support_to_add;
        END IF;

        -- Add technical staff
        IF technical_to_add > 0 THEN
            SET staff_counter = 0;
            
            INSERT INTO StaffAssignment (staff_id, event_id)
            SELECT s.staff_id, event_id_var
            FROM Staff s
            WHERE s.staff_type = 'technical'
            AND NOT EXISTS (SELECT 1 FROM StaffAssignment sa WHERE sa.staff_id = s.staff_id AND sa.event_id = event_id_var)
            LIMIT technical_to_add;
        END IF;
    END LOOP;
    
    CLOSE event_cursor;
END //

DELIMITER ;

-- Call the procedure to assign staff
CALL AssignStaffToEvents();

-- If after assigning all available staff, there are still events without enough staff,
-- adjust the stage capacities to meet the requirements
UPDATE Stage s
JOIN (
    SELECT s.stage_id, s.max_capacity,
           COUNT(DISTINCT sa.staff_id) AS security_count
    FROM Stage s
    JOIN Event e ON s.stage_id = e.stage_id
    LEFT JOIN StaffAssignment sa ON e.event_id = sa.event_id
    LEFT JOIN Staff st ON sa.staff_id = st.staff_id AND st.staff_type = 'security'
    GROUP BY s.stage_id, s.max_capacity
    HAVING COUNT(DISTINCT sa.staff_id) < CEILING(s.max_capacity * 0.05)
) AS subq ON s.stage_id = subq.stage_id
SET s.max_capacity = FLOOR(subq.security_count / 0.05);

-- Also adjust for support staff requirements
UPDATE Stage s
JOIN (
    SELECT s.stage_id, s.max_capacity,
           COUNT(DISTINCT sa.staff_id) AS support_count
    FROM Stage s
    JOIN Event e ON s.stage_id = e.stage_id
    LEFT JOIN StaffAssignment sa ON e.event_id = sa.event_id
    LEFT JOIN Staff st ON sa.staff_id = st.staff_id AND st.staff_type = 'support'
    GROUP BY s.stage_id, s.max_capacity
    HAVING COUNT(DISTINCT sa.staff_id) < CEILING(s.max_capacity * 0.02)
) AS subq ON s.stage_id = subq.stage_id
SET s.max_capacity = FLOOR(subq.support_count / 0.02);

-- Cleanup - drop the procedure
DROP PROCEDURE IF EXISTS AssignStaffToEvents;

-- Insert Tickets (at least 200 tickets)
-- First, create a procedure to generate the tickets with proper EAN codes
DELIMITER //
CREATE PROCEDURE GenerateTickets()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE event_count INT;
    DECLARE visitor_count INT;
    DECLARE category_id INT;
    DECLARE price DECIMAL(10,2);
    DECLARE payment_method VARCHAR(20);
    DECLARE ean VARCHAR(13);
    DECLARE curr_event_id INT;
    DECLARE curr_visitor_id INT;
    DECLARE used BOOLEAN;
    DECLARE resale BOOLEAN;
    
    -- Get counts
    SELECT COUNT(*) INTO event_count FROM Event;
    SELECT COUNT(*) INTO visitor_count FROM Visitor;
    
    -- Generate 200 tickets
    WHILE i <= 200 DO
        -- Select event
        SET curr_event_id = (i % event_count) + 1;
        
        -- Select visitor
        SET curr_visitor_id = (i % visitor_count) + 1;
        
        -- Select category (mostly general, some VIP, few backstage)
        IF i % 10 = 0 THEN 
            SET category_id = 2; -- VIP
        ELSEIF i % 50 = 0 THEN
            SET category_id = 3; -- Backstage
        ELSE
            SET category_id = 1; -- General
        END IF;
        
        -- Set price based on category
        IF category_id = 1 THEN
            SET price = 50.00 + (RAND() * 50);
        ELSEIF category_id = 2 THEN
            SET price = 150.00 + (RAND() * 100);
        ELSE
            SET price = 300.00 + (RAND() * 200);
        END IF;
        
        -- Set payment method
        IF i % 3 = 0 THEN
            SET payment_method = 'credit_card';
        ELSEIF i % 3 = 1 THEN
            SET payment_method = 'debit_card';
        ELSE
            SET payment_method = 'bank_transfer';
        END IF;
        
        -- Generate EAN code (simple for demonstration)
        SET ean = LPAD(i, 13, '0');
        
        -- Set used flag (tickets for past events are used)
        SELECT IF(event_date < CURDATE(), TRUE, FALSE) INTO used 
        FROM Event WHERE event_id = curr_event_id;
        
        -- Set resale flag (small chance)
        SET resale = IF(i % 40 = 0, TRUE, FALSE);
        
        -- Create ticket
        INSERT INTO Ticket (event_id, visitor_id, category_id, purchase_date, price, payment_method, ean_code, is_used, is_for_resale)
        VALUES (
            curr_event_id, 
            curr_visitor_id, 
            category_id, 
            DATE_SUB(CURDATE(), INTERVAL (365 - i) DAY), 
            ROUND(price, 2), 
            payment_method, 
            ean, 
            used, 
            resale
        );
        
        SET i = i + 1;
    END WHILE;
    
    -- Add some buyers to resale queue
    WHILE j <= 20 DO
        INSERT INTO ResaleBuyerQueue (visitor_id, event_id, category_id, request_date, is_fulfilled)
        VALUES (
            (j % visitor_count) + 1,
            (j % event_count) + 1,
            IF(j % 5 = 0, 2, 1),  -- Mix of general and VIP
            DATE_SUB(CURDATE(), INTERVAL j DAY),
            FALSE
        );
        
        SET j = j + 1;
    END WHILE;
    
    -- Add some tickets to seller queue for those marked for resale
    INSERT INTO ResaleSellerQueue (ticket_id, request_date, is_sold)
    SELECT ticket_id, DATE_SUB(CURDATE(), INTERVAL RAND()*30 DAY), FALSE
    FROM Ticket
    WHERE is_for_resale = TRUE;
END //
DELIMITER ;

-- Call the procedure to generate tickets
CALL GenerateTickets();

-- Drop the procedure (cleanup)
DROP PROCEDURE IF EXISTS GenerateTickets;

-- Insert Ratings
-- Let's create a procedure to generate ratings for used tickets
DELIMITER //
CREATE PROCEDURE GenerateRatings()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE t_id INT;
    DECLARE e_id INT;
    DECLARE p_id INT;
    DECLARE rating1 INT;
    DECLARE rating2 INT;
    DECLARE rating3 INT;
    DECLARE rating4 INT;
    DECLARE rating5 INT;
    
    -- Cursor for used tickets
    DECLARE ticket_cursor CURSOR FOR 
        SELECT t.ticket_id, t.event_id
        FROM Ticket t
        WHERE t.is_used = TRUE;
    
    -- Continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN ticket_cursor;
    
    read_loop: LOOP
        FETCH ticket_cursor INTO t_id, e_id;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- About 70% of used tickets have ratings
        IF RAND() < 0.7 THEN
            -- Get a random performance for this event
            SELECT performance_id INTO p_id
            FROM Performance
            WHERE event_id = e_id
            ORDER BY RAND()
            LIMIT 1;
            
            IF p_id IS NOT NULL THEN
                -- Generate random ratings between 1 and 5
                SET rating1 = FLOOR(1 + RAND() * 5);
                SET rating2 = FLOOR(1 + RAND() * 5);
                SET rating3 = FLOOR(1 + RAND() * 5);
                SET rating4 = FLOOR(1 + RAND() * 5);
                SET rating5 = FLOOR(1 + RAND() * 5);
                
                -- Insert the rating
                INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression)
                VALUES (t_id, p_id, rating1, rating2, rating3, rating4, rating5);
            END IF;
        END IF;
    END LOOP;
    
    CLOSE ticket_cursor;
END //
DELIMITER ;

-- Call the procedure to generate ratings
CALL GenerateRatings();

-- Drop the procedure (cleanup)
DROP PROCEDURE IF EXISTS GenerateRatings;

-- Add some more focused ratings for specific queries
-- Let's ensure artist with ID 1 (John Smith) has several ratings
INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression)
SELECT t.ticket_id, p.performance_id, 
       FLOOR(3 + RAND() * 3), -- Higher ratings (3-5) for artist performance
       FLOOR(1 + RAND() * 5), 
       FLOOR(1 + RAND() * 5), 
       FLOOR(1 + RAND() * 5), 
       FLOOR(3 + RAND() * 3) -- Higher ratings (3-5) for overall impression
FROM Ticket t
JOIN Event e ON t.event_id = e.event_id
JOIN Performance p ON e.event_id = p.event_id
WHERE p.artist_id = 1 AND t.is_used = TRUE AND NOT EXISTS (
    SELECT 1 FROM Rating r WHERE r.ticket_id = t.ticket_id AND r.performance_id = p.performance_id
)
LIMIT 20;

-- Ensure visitor 1 has rated several performances to test query 6
INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression)
SELECT t.ticket_id, p.performance_id, 
       FLOOR(1 + RAND() * 5),
       FLOOR(1 + RAND() * 5), 
       FLOOR(1 + RAND() * 5), 
       FLOOR(1 + RAND() * 5), 
       FLOOR(1 + RAND() * 5)
FROM Ticket t
JOIN Event e ON t.event_id = e.event_id
JOIN Performance p ON e.event_id = p.event_id
WHERE t.visitor_id = 1 AND t.is_used = TRUE AND NOT EXISTS (
    SELECT 1 FROM Rating r WHERE r.ticket_id = t.ticket_id AND r.performance_id = p.performance_id
)
LIMIT 10;

-- Ensure some visitors have exactly the same number of attended performances (for query 9)
INSERT INTO Ticket (event_id, visitor_id, category_id, purchase_date, price, payment_method, ean_code, is_used, is_for_resale)
VALUES 
-- Visitor 2 and 3 will have the same number of tickets
(1, 2, 1, '2015-06-15', 75.00, 'credit_card', '0000000000201', TRUE, FALSE),
(2, 2, 1, '2015-06-15', 75.00, 'credit_card', '0000000000202', TRUE, FALSE),
(3, 2, 1, '2015-06-15', 75.00, 'credit_card', '0000000000203', TRUE, FALSE),
(4, 2, 1, '2015-06-15', 75.00, 'credit_card', '0000000000204', TRUE, FALSE),

(1, 3, 1, '2015-06-15', 80.00, 'debit_card', '0000000000301', TRUE, FALSE),
(2, 3, 1, '2015-06-15', 80.00, 'debit_card', '0000000000302', TRUE, FALSE),
(3, 3, 1, '2015-06-15', 80.00, 'debit_card', '0000000000303', TRUE, FALSE),
(4, 3, 1, '2015-06-15', 80.00, 'debit_card', '0000000000304', TRUE, FALSE),

-- Visitor 4 and 5 will have the same number of tickets (different from 2 and 3)
(10, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000401', TRUE, FALSE),
(11, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000402', TRUE, FALSE),
(12, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000403', TRUE, FALSE),
(13, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000404', TRUE, FALSE),
(14, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000405', TRUE, FALSE),

(10, 5, 1, '2017-06-15', 90.00, 'credit_card', '0000000000501', TRUE, FALSE),
(11, 5, 1, '2017-06-15', 90.00, 'credit_card', '0000000000502', TRUE, FALSE),
(12, 5, 1, '2017-06-15', 90.00, 'credit_card', '0000000000503', TRUE, FALSE),
(13, 5, 1, '2017-06-15', 90.00, 'credit_card', '0000000000504', TRUE, FALSE),
(14, 5, 1, '2017-06-15', 90.00, 'credit_card', '0000000000505', TRUE, FALSE);