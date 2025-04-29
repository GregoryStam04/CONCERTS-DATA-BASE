-- Use the pulse_university database
USE pulse_university;

-- Clear all existing data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ResaleBuyerQueue;
TRUNCATE TABLE ResaleSellerQueue;
TRUNCATE TABLE Rating;
TRUNCATE TABLE Ticket;
TRUNCATE TABLE TicketCategory;
TRUNCATE TABLE Visitor;
TRUNCATE TABLE StaffAssignment;
TRUNCATE TABLE Staff;
TRUNCATE TABLE Performance;
TRUNCATE TABLE Event;
TRUNCATE TABLE ArtistBand;
TRUNCATE TABLE BandGenre;
TRUNCATE TABLE ArtistGenre;
TRUNCATE TABLE Band;
TRUNCATE TABLE Artist;
TRUNCATE TABLE Genre;
TRUNCATE TABLE Stage;
TRUNCATE TABLE Festival;
TRUNCATE TABLE Location;
TRUNCATE TABLE EntityImage;
SET FOREIGN_KEY_CHECKS = 1;

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
(1, 9, '/images/festivals/pulse2023.jpg', 'Pulse Festival 2023 Poster', 'https://pulse-university.com/images/2023/poster'),
(1, 10, '/images/festivals/pulse2024.jpg', 'Pulse Festival 2024 Poster', 'https://pulse-university.com/images/2024/poster'),
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
('Pulse University 2024', '2024-08-15', '2024-08-19', 9, 'Celebrating a decade of music with all-star lineup'),
('Pulse University 2025', '2025-07-16', '2025-07-20', 10, 'Future festival with cutting-edge technology integration');

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
(1, 1), (1, 16), -- Rock, Hard Rock
(2, 2), (2, 19), -- Pop, Electro Pop
(3, 3), (3, 21), -- Electronic, Techno
(4, 4), (4, 24), -- Jazz, Bebop
(5, 5), (5, 26), -- Hip Hop, Trap
(6, 6), (6, 27), -- Folk, Contemporary Folk
(7, 7), (7, 28), -- Classical, Chamber Music
(8, 8), (8, 29), -- R&B, Neo Soul
(9, 9), (9, 30), -- Metal, Death Metal
(10, 10), -- Country
(11, 11), -- Indie
(12, 12), -- Alternative
(13, 13), -- Reggae
(14, 14), -- Blues
(15, 15), -- Punk
(16, 1), (16, 17), -- Rock, Soft Rock
(17, 2), (17, 20), -- Pop, Synth Pop
(18, 3), (18, 22), -- Electronic, House
(19, 4), (19, 25), -- Jazz, Smooth Jazz
(20, 5), -- Hip Hop
(21, 6), -- Folk
(22, 7), -- Classical
(23, 8), -- R&B
(24, 9), -- Metal
(25, 10), -- Country
(26, 11), -- Indie
(27, 12), -- Alternative
(28, 13), -- Reggae
(29, 14), -- Blues
(30, 15), -- Punk
(31, 1), (31, 18), -- Rock, Progressive Rock
(32, 2), -- Pop
(33, 3), (33, 23), -- Electronic, Trance
(34, 4), -- Jazz
(35, 5), -- Hip Hop
(36, 6), -- Folk
(37, 7), -- Classical
(38, 8), -- R&B
(39, 9), -- Metal
(40, 10), -- Country
(41, 11), -- Indie
(42, 12), -- Alternative
(43, 13), -- Reggae
(44, 14), -- Blues
(45, 15), -- Punk
(46, 1), -- Rock
(47, 2), -- Pop
(48, 3), -- Electronic
(49, 4), -- Jazz
(50, 5); -- Hip Hop

-- Insert BandGenre (band-genre relationships)
INSERT INTO BandGenre (band_id, genre_id) VALUES
(1, 1), (1, 12), -- Rock, Alternative
(2, 2), (2, 11), -- Pop, Indie
(3, 3), (3, 21), -- Electronic, Techno
(4, 4), (4, 25), -- Jazz, Smooth Jazz
(5, 5), (5, 26), -- Hip Hop, Trap
(6, 6), (6, 27), -- Folk, Contemporary Folk
(7, 7), (7, 28), -- Classical, Chamber Music
(8, 8), (8, 29), -- R&B, Neo Soul
(9, 9), (9, 30), -- Metal, Death Metal
(10, 10), -- Country
(11, 11), -- Indie
(12, 12), -- Alternative
(13, 13), -- Reggae
(14, 14), -- Blues
(15, 15), -- Punk
(16, 1), (16, 16), -- Rock, Hard Rock
(17, 2), (17, 19), -- Pop, Electro Pop
(18, 1), (18, 12), -- Rock, Alternative
(19, 1), (19, 14), -- Rock, Blues
(20, 1), (20, 12); -- Rock, Alternative

-- Insert Stages (venues)
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id) VALUES
('Main Stage', 'Primary venue with state-of-the-art sound system', 25000, 'Advanced lighting, 6 speaker towers, LED screens', 1),
('Electronica Dome', 'Indoor venue for electronic music', 8000, 'DJ equipment, laser lights, fog machines', 1),
('Acoustic Haven', 'Intimate setting for acoustic performances', 3000, 'Minimal setup, acoustic-friendly environment', 1),
('Rock Arena', 'Open-air venue for rock bands', 15000, 'Heavy-duty sound system, pyrotechnics', 2),
('Jazz Corner', 'Elegant space for jazz performances', 2000, 'Vintage microphones, subtle lighting', 2),
('Hip Hop Square', 'Urban-styled venue', 10000, 'Bass-heavy sound system, graffiti backdrop', 2),
('Tokyo Main', 'Large venue in the center of festival grounds', 20000, 'High-tech lighting, surround sound', 3),
('Anime Stage', 'Japanese pop culture themed stage', 5000, 'Visual displays, animated backdrops', 3),
('Sydney Harbor Stage', 'Waterfront main venue', 18000, 'Weather-resistant equipment, boat accessibility', 4),
('Outback Stage', 'Australian-themed venue', 7500, 'Rustic setup, natural acoustics', 4),
('Red Square', 'Central Moscow venue', 22000, 'Historic setting, advanced sound', 5),
('Winter Palace', 'Elegant indoor venue', 6000, 'Classical architecture, perfect acoustics', 5),
('Copacabana Stage', 'Beachfront main venue', 30000, 'Sand-resistant equipment, beach party setup', 6),
('Samba Arena', 'Brazilian carnival atmosphere', 12000, 'Parade floats, festive lighting', 6),
('Montreal Main', 'Central festival grounds', 25000, 'Bilingual displays, maple leaf motifs', 7),
('Quebec Stage', 'French-Canadian themed', 9000, 'Cultural decor, local sound engineers', 7),
('Desert Oasis', 'Main stage in Dubai', 20000, 'Heat-resistant equipment, cooling systems', 8),
('Gold Pavilion', 'Luxury-themed venue', 5000, 'Premium sound, VIP areas', 8),
('Central Park Stage', 'New York's iconic location', 35000, 'Urban backdrop', city skyline views', 9),
('Brooklyn Arena', 'Industrial-styled venue', 15000, 'Warehouse aesthetics, graffiti art', 9),
('Victoria Harbor', 'Hong Kong waterfront', 28000, 'Light show capabilities, harbor views', 10),
('Kowloon Stage', 'Cultural fusion venue', 12000, 'East meets West design, traditional elements', 10);

-- Insert additional stages to reach 30 total
INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id) VALUES
('Alternative Grounds', 'Venue for alternative and indie bands', 8000, 'Vintage amps, indie aesthetic', 1),
('Electronic Wonderland', 'Immersive experience for electronic music', 10000, '3D mapping, interactive elements', 3),
('Classical Pavilion', 'Venue designed for orchestral performances', 4000, 'Perfect acoustics, orchestra pit', 5),
('Reggae Bay', 'Caribbean-themed stage for reggae artists', 7000, 'Island decor, specialized bass equipment', 7),
('Metal Forge', 'Heavy metal dedicated stage', 9000, 'Fire effects, dark atmosphere', 2),
('Folk Forest', 'Nature-inspired venue for folk music', 3500, 'Natural amphitheater, woodland setting', 4),
('Urban Beat Box', 'Street culture inspired stage', 6000, 'Graffiti walls, street dance floor', 6),
('Sunset Stage', 'Western-facing stage for evening performances', 5000, 'Special sunset lighting, golden hour effects', 8);

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

-- Festival 9 events (2024 - Future)
('New York Opening', '2024-08-15', 19, '18:00:00', '23:00:00', 'Big Apple welcome night'),
('Brooklyn Beats', '2024-08-16', 20, '19:00:00', '01:00:00', 'Hip hop and urban music'),
('Central Park Day', '2024-08-17', 19, '14:00:00', '22:00:00', 'All-day music festival'),
('Urban Sounds', '2024-08-18', 20, '16:00:00', '23:00:00', 'City-inspired performances'),
('Anniversary Closing', '2024-08-19', 19, '17:00:00', '00:00:00', 'Special 10-year celebration'),

-- Festival 10 events (2025 - Future)
('Hong Kong Harmony', '2025-07-16', 21, '19:00:00', '00:00:00', 'Opening night by the harbor'),
('East Meets West', '2025-07-17', 22, '18:00:00', '23:00:00', 'Cultural fusion performances'),
('Asian Showcase', '2025-07-18', 21, '17:00:00', '23:00:00', 'Top Asian artists'),
('Electronic Asia', '2025-07-19', 22, '20:00:00', '02:00:00', 'Modern electronic music'),
('Farewell from Hong Kong', '2025-07-20', 21, '18:00:00', '00:00:00', 'Final celebration');

-- Insert Staff
INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level) VALUES
-- Technical staff
('James', 'Williams', '1985-05-15', 'technical', 'Sound Engineer', 'expert'),
('Maria', 'Garcia', '1990-07-22', 'technical', 'Lighting Technician', 'experienced'),
('Robert', 'Johnson', '1988-03-10', 'technical', 'Stage Manager', 'expert'),
('Lisa', 'Chen', '1993-09-18', 'technical', 'Audio Technician', 'intermediate'),
('David', 'Smith', '1987-11-30', 'technical', 'Visual Effects', 'experienced'),
('Emily', 'Taylor', '1995-02-25', 'technical', 'Equipment Manager', 'intermediate'),
('Michael', 'Brown', '1982-06-14', 'technical', 'Production Manager', 'expert'),
('Sophia', 'Lee', '1991-04-09', 'technical', 'Camera Operator', 'intermediate'),
('Daniel', 'Martinez', '1989-08-12', 'technical', 'Sound Assistant', 'beginner'),
('Olivia', 'Wilson', '1997-01-28', 'technical', 'Lighting Assistant', 'trainee'),
('Thomas', 'Anderson', '1984-12-03', 'technical', 'Technical Director', 'expert'),
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
('Rebecca', 'Perry', '1988-11-30', 'support', 'Customer Service', 'experienced');

-- Insert Staff Assignments
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

-- Insert Performances
-- We need to create at least 100 performances across various events
INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id) VALUES
-- Opening Night (Event 1, Festival 1)
(1, 'warm up', '18:30:00', '19:30:00', 1, NULL), -- John Smith as warm up
(1, 'regular', '19:45:00', '20:45:00', NULL, 2), -- Midnight Owls
(1, 'special guest', '21:00:00', '22:00:00', 5, NULL), -- David Brown
(1, 'headline', '22:15:00', '23:00:00', NULL, 1), -- Cosmic Rays

-- Electronic Friday (Event 2, Festival 1)
(2, 'warm up', '19:30:00', '20:30:00', 3, NULL), -- Michael Johnson
(2, 'regular', '20:45:00', '21:45:00', NULL, 3), -- Neon Dreams
(2, 'headline', '22:00:00', '23:30:00', 6, NULL), -- Lisa Chen
(2, 'special guest', '23:45:00', '01:30:00', NULL, 6), -- Crystal Skies

-- Acoustic Saturday (Event 3, Festival 1)
(3, 'warm up', '14:30:00', '15:30:00', 10, NULL), -- Patricia Lopez
(3, 'regular', '15:45:00', '16:45:00', 7, NULL), -- James Taylor
(3, 'headline', '17:00:00', '18:30:00', NULL, 8), -- Silver Lining
(3, 'special guest', '18:45:00', '19:45:00', 12, NULL), -- Sophia Lee

-- Closing Party (Event 4, Festival 1)
(4, 'warm up', '16:30:00', '17:30:00', NULL, 4), -- Electric Echo
(4, 'regular', '17:45:00', '18:45:00', 8, NULL), -- Anna Martinez
(4, 'special guest', '19:00:00', '20:30:00', NULL, 5), -- Velvet Thunder
(4, 'headline', '20:45:00', '22:45:00', 4, NULL), -- Sarah Wilson

-- Rock Opening (Event 5, Festival 2)
(5, 'warm up', '17:30:00', '18:30:00', NULL, 9), -- Rhythm Junction
(5, 'regular', '18:45:00', '19:45:00', 15, NULL), -- Daniel Garcia
(5, 'special guest', '20:00:00', '21:00:00', NULL, 10), -- Quantum Beat
(5, 'headline', '21:15:00', '22:45:00', 9, NULL), -- Robert Kim

-- Jazz Night (Event 6, Festival 2)
(6, 'warm up', '18:30:00', '19:30:00', 19, NULL), -- Marcos Rodriguez
(6, 'regular', '19:45:00', '20:45:00', NULL, 11), -- Northern Lights
(6, 'headline', '21:00:00', '22:30:00', 4, NULL), -- Sarah Wilson
(6, 'special guest', '22:45:00', '23:45:00', 20, NULL), -- Grace Kim

-- Hip Hop Showcase (Event 7, Festival 2)
(7, 'warm up', '20:30:00', '21:30:00', 5, NULL), -- David Brown
(7, 'regular', '21:45:00', '22:45:00', NULL, 7), -- Urban Pulse
(7, 'special guest', '23:00:00', '00:00:00', 21, NULL), -- Victor Nguyen
(7, 'headline', '00:15:00', '01:45:00', NULL, 12), -- Desert Storm

-- Alternative Day (Event 8, Festival 2)
(8, 'warm up', '15:30:00', '16:30:00', NULL, 13), -- Ocean Wave
(8, 'regular', '16:45:00', '17:45:00', 11, NULL), -- Thomas Wright
(8, 'special guest', '18:00:00', '19:00:00', NULL, 14), -- Mountain Echo
(8, 'headline', '19:15:00', '21:15:00', 12, NULL), -- Sophia Lee

-- Grand Finale (Event 9, Festival 2)
(9, 'warm up', '16:30:00', '17:30:00', NULL, 15), -- Jungle Fever
(9, 'regular', '17:45:00', '18:45:00', 2, NULL), -- Emily Davis
(9, 'special guest', '19:00:00', '20:30:00', NULL, 1), -- Cosmic Rays
(9, 'headline', '20:45:00', '22:45:00', 1, NULL), -- John Smith

-- Tokyo Lights (Event 10, Festival 3)
(10, 'warm up', '19:30:00', '20:30:00', 13, NULL), -- Kevin Wang
(10, 'regular', '20:45:00', '21:45:00', NULL, 16), -- Metro Pulse
(10, 'special guest', '22:00:00', '23:00:00', 14, NULL), -- Alexandra Adams

-- J-Pop Explosion (Event 11, Festival 3)
(11, 'warm up', '18:30:00', '19:30:00', NULL, 17), -- Sunset Boulevard
(11, 'headline', '19:45:00', '21:15:00', 16, NULL), -- Olivia Nelson
(11, 'special guest', '21:30:00', '22:30:00', 22, NULL), -- Natalie Patel

-- Global Beats (Event 12, Festival 3)
(12, 'warm up', '17:30:00', '18:30:00', NULL, 3), -- Neon Dreams
(12, 'regular', '18:45:00', '19:45:00', 17, NULL), -- Nicholas Carter
(12, 'special guest', '20:00:00', '21:00:00', NULL, 4), -- Electric Echo
(12, 'headline', '21:15:00', '22:00:00', 18, NULL), -- Emma White

-- Electronic Dreams (Event 13, Festival 3)
(13, 'warm up', '20:30:00', '21:30:00', 3, NULL), -- Michael Johnson
(13, 'regular', '21:45:00', '22:45:00', NULL, 6), -- Crystal Skies
(13, 'headline', '23:00:00', '00:30:00', 6, NULL), -- Lisa Chen
(13, 'special guest', '00:45:00', '01:45:00', NULL, 3), -- Neon Dreams

-- Sayonara Party (Event 14, Festival 3)
(14, 'warm up', '18:30:00', '19:30:00', NULL, 9), -- Rhythm Junction
(14, 'regular', '19:45:00', '20:45:00', 23, NULL), -- Brandon Wilson
(14, 'special guest', '21:00:00', '22:00:00', NULL, 11), -- Northern Lights
(14, 'headline', '22:15:00', '23:45:00', 24, NULL), -- Michelle Park

-- Sydney Calling (Event 15, Festival 4)
(15, 'warm up', '18:30:00', '19:30:00', 25, NULL), -- Timothy Scott
(15, 'regular', '19:45:00', '20:45:00', NULL, 12), -- Desert Storm
(15, 'special guest', '21:00:00', '22:00:00', 26, NULL), -- Rebecca Allen
(15, 'headline', '22:15:00', '23:00:00', NULL, 13), -- Ocean Wave

-- Down Under Rock (Event 16, Festival 4)
(16, 'warm up', '17:30:00', '18:30:00', NULL, 14), -- Mountain Echo
(16, 'regular', '18:45:00', '19:45:00', 27, NULL), -- Jacob Moore
(16, 'special guest', '20:00:00', '21:00:00', NULL, 15), -- Jungle Fever
(16, 'headline', '21:15:00', '22:00:00', 28, NULL), -- Samantha Torres

-- Beach Party (Event 17, Festival 4)
(17, 'warm up', '15:30:00', '16:30:00', 29, NULL), -- Ethan Lewis
(17, 'regular', '16:45:00', '17:45:00', NULL, 16), -- Metro Pulse
(17, 'special guest', '18:00:00', '19:30:00', 30, NULL), -- Isabella Clark
(17, 'headline', '19:45:00', '21:45:00', NULL, 17), -- Sunset Boulevard
(17, 'special guest', '22:00:00', '23:00:00', 1, NULL), -- John Smith

-- Indie Day (Event 18, Festival 4)
(18, 'warm up', '14:30:00', '15:30:00', NULL, 18), -- Arctic Monkeys
(18, 'regular', '15:45:00', '16:45:00', 2, NULL), -- Emily Davis
(18, 'special guest', '17:00:00', '18:30:00', NULL, 19), -- The Black Keys
(18, 'headline', '18:45:00', '20:45:00', 3, NULL), -- Michael Johnson

-- Final Wave (Event 19, Festival 4)
(19, 'warm up', '16:30:00', '17:30:00', 31, NULL), -- Christopher Reed
(19, 'regular', '17:45:00', '18:45:00', NULL, 20), -- Imagine Dragons
(19, 'special guest', '19:00:00', '20:30:00', 32, NULL), -- Ava Mitchell
(19, 'headline', '20:45:00', '22:45:00', NULL, 1), -- Cosmic Rays
(19, 'special guest', '23:00:00', '23:30:00', 4, NULL), -- Sarah Wilson

-- Moscow Nights (Event 20, Festival 5)
(20, 'warm up', '19:30:00', '20:30:00', NULL, 2), -- Midnight Owls
(20, 'regular', '20:45:00', '21:45:00', 33, NULL), -- Jonathan Kelly
(20, 'special guest', '22:00:00', '23:00:00', NULL, 3), -- Neon Dreams
(20, 'headline', '23:15:00', '00:00:00', 34, NULL), -- Maria Gonzalez

-- Classical Revival (Event 21, Festival 5)
(21, 'warm up', '18:30:00', '19:30:00', 7, NULL), -- James Taylor
(21, 'headline', '19:45:00', '21:45:00', NULL, 4), -- Electric Echo
(21, 'special guest', '22:00:00', '22:00:00', 35, NULL), -- Andrew Phillips

-- European Beats (Event 22, Festival 5)
(22, 'warm up', '17:30:00', '18:30:00', NULL, 5), -- Velvet Thunder
(22, 'regular', '18:45:00', '19:45:00', 36, NULL), -- Zoe Campbell
(22, 'special guest', '20:00:00', '21:30:00', NULL, 6), -- Crystal Skies
(22, 'headline', '21:45:00', '23:00:00', 8, NULL), -- Anna Martinez

-- Festival Finale (Event 23, Festival 5)
(23, 'warm up', '16:30:00', '17:30:00', 37, NULL), -- Benjamin Foster
(23, 'regular', '17:45:00', '18:45:00', NULL, 7), -- Urban Pulse
(23, 'special guest', '19:00:00', '20:00:00', 38, NULL), -- Chloe Murphy
(23, 'headline', '20:15:00', '22:15:00', NULL, 8), -- Silver Lining
(23, 'special guest', '22:30:00', '23:30:00', 9, NULL), -- Robert Kim

-- Rio Carnival (Event 24, Festival 6)
(24, 'warm up', '18:30:00', '19:30:00', NULL, 9), -- Rhythm Junction
(24, 'regular', '19:45:00', '20:45:00', 39, NULL), -- Gabriel Rivera
(24, 'special guest', '21:00:00', '22:30:00', NULL, 10), -- Quantum Beat
(24, 'headline', '22:45:00', '00:00:00', 40, NULL), -- Lily Cooper

-- Samba Night (Event 25, Festival 6)
(25, 'warm up', '19:30:00', '20:30:00', 10, NULL), -- Patricia Lopez
(25, 'regular', '20:45:00', '21:45:00', NULL, 11), -- Northern Lights
(25, 'headline', '22:00:00', '23:30:00', 11, NULL), -- Thomas Wright
(25, 'special guest', '23:45:00', '01:45:00', NULL, 12), -- Desert Storm

-- Latin Fusion (Event 26, Festival 6)
(26, 'warm up', '17:30:00', '18:30:00', 41, NULL), -- Mason Wood
(26, 'regular', '18:45:00', '19:45:00', NULL, 13), -- Ocean Wave
(26, 'special guest', '20:00:00', '21:00:00', 42, NULL), -- Aubrey Jenkins
(26, 'headline', '21:15:00', '23:00:00', NULL, 14), -- Mountain Echo

-- Beach Closing (Event 27, Festival 6)
(27, 'warm up', '16:30:00', '17:30:00', 43, NULL), -- Oscar Thompson
(27, 'regular', '17:45:00', '18:45:00', NULL, 15), -- Jungle Fever
(27, 'special guest', '19:00:00', '20:30:00', 44, NULL), -- Ruby Brooks
(27, 'headline', '20:45:00', '22:45:00', NULL, 16), -- Metro Pulse
(27, 'special guest', '23:00:00', '23:30:00', 12, NULL), -- Sophia Lee

-- Montreal Welcome (Event 28, Festival 7)
(28, 'warm up', '18:30:00', '19:30:00', NULL, 17), -- Sunset Boulevard
(28, 'regular', '19:45:00', '20:45:00', 13, NULL), -- Kevin Wang
(28, 'special guest', '21:00:00', '22:00:00', NULL, 18), -- Arctic Monkeys
(28, 'headline', '22:15:00', '23:00:00', 14, NULL), -- Alexandra Adams

-- Francophone Sounds (Event 29, Festival 7)
(29, 'warm up', '19:30:00', '20:30:00', 45, NULL), -- Henry Dixon
(29, 'regular', '20:45:00', '21:45:00', NULL, 19), -- The Black Keys
(29, 'headline', '22:00:00', '23:30:00', 15, NULL), -- Daniel Garcia
(29, 'special guest', '23:45:00', '00:00:00', NULL, 20), -- Imagine Dragons

-- North American Showcase (Event 30, Festival 7)
(30, 'warm up', '17:30:00', '18:30:00', 16, NULL), -- Olivia Nelson
(30, 'regular', '18:45:00', '19:45:00', NULL, 1), -- Cosmic Rays
(30, 'special guest', '20:00:00', '21:00:00', 17, NULL), -- Nicholas Carter
(30, 'headline', '21:15:00', '23:00:00', NULL, 2), -- Midnight Owls

-- Cultural Fusion (Event 31, Festival 7)
(31, 'warm up', '15:30:00', '16:30:00', 46, NULL), -- Scarlett Coleman
(31, 'regular', '16:45:00', '17:45:00', NULL, 3), -- Neon Dreams
(31, 'special guest', '18:00:00', '19:00:00', 47, NULL), -- Leo Bennett
(31, 'headline', '19:15:00', '21:15:00', NULL, 4), -- Electric Echo

-- Farewell Concert (Event 32, Festival 7)
(32, 'warm up', '16:30:00', '17:30:00', 18, NULL), -- Emma White
(32, 'regular', '17:45:00', '18:45:00', NULL, 5), -- Velvet Thunder
(32, 'special guest', '19:00:00', '20:30:00', 19, NULL), -- Marcos Rodriguez
(32, 'headline', '20:45:00', '22:45:00', NULL, 6), -- Crystal Skies
(32, 'special guest', '23:00:00', '23:30:00', 20, NULL), -- Grace Kim

-- Desert Welcome (Event 33, Festival 8)
(33, 'warm up', '19:30:00', '20:30:00', NULL, 7), -- Urban Pulse
(33, 'regular', '20:45:00', '21:45:00', 48, NULL), -- Luna Martinez
(33, 'special guest', '22:00:00', '23:00:00', NULL, 8), -- Silver Lining
(33, 'headline', '23:15:00', '00:00:00', 21, NULL), -- Victor Nguyen

-- Arabian Nights (Event 34, Festival 8)
(34, 'warm up', '20:30:00', '21:30:00', 49, NULL), -- Noah Parker
(34, 'regular', '21:45:00', '22:45:00', NULL, 9), -- Rhythm Junction
(34, 'headline', '23:00:00', '01:00:00', 22, NULL), -- Natalie Patel

-- Global Oasis (Event 35, Festival 8)
(35, 'warm up', '18:30:00', '19:30:00', NULL, 10), -- Quantum Beat
(35, 'regular', '19:45:00', '20:45:00', 50, NULL), -- Aurora James
(35, 'special guest', '21:00:00', '22:00:00', NULL, 11), -- Northern Lights
(35, 'headline', '22:15:00', '23:00:00', 23, NULL), -- Brandon Wilson

-- Electronic Sands (Event 36, Festival 8)
(36, 'warm up', '21:30:00', '22:30:00', 3, NULL), -- Michael Johnson
(36, 'regular', '22:45:00', '23:45:00', NULL, 12), -- Desert Storm
(36, 'special guest', '00:00:00', '01:30:00', 6, NULL), -- Lisa Chen
(36, 'headline', '01:45:00', '03:00:00', NULL, 3), -- Neon Dreams

-- Golden Finale (Event 37, Festival 8)
(37, 'warm up', '18:30:00', '19:30:00', 24, NULL), -- Michelle Park
(37, 'regular', '19:45:00', '20:45:00', NULL, 13), -- Ocean Wave
(37, 'special guest', '21:00:00', '22:00:00', 25, NULL), -- Timothy Scott
(37, 'headline', '22:15:00', '00:00:00', NULL, 14), -- Mountain Echo

-- New York Opening (Event 38, Festival 9 - Future)
(38, 'warm up', '18:30:00', '19:30:00', NULL, 15), -- Jungle Fever
(38, 'regular', '19:45:00', '20:45:00', 1, NULL), -- John Smith
(38, 'special guest', '21:00:00', '22:00:00', NULL, 16), -- Metro Pulse
(38, 'headline', '22:15:00', '23:00:00', 2, NULL), -- Emily Davis

-- Brooklyn Beats (Event 39, Festival 9 - Future)
(39, 'warm up', '19:30:00', '20:30:00', 5, NULL), -- David Brown
(39, 'regular', '20:45:00', '21:45:00', NULL, 17), -- Sunset Boulevard
(39, 'headline', '22:00:00', '23:30:00', 26, NULL), -- Rebecca Allen
(39, 'special guest', '23:45:00', '01:00:00', NULL, 18), -- Arctic Monkeys

-- Central Park Day (Event 40, Festival 9 - Future)
(40, 'warm up', '14:30:00', '15:30:00', 27, NULL), -- Jacob Moore
(40, 'regular', '15:45:00', '16:45:00', NULL, 19), -- The Black Keys
(40, 'special guest', '17:00:00', '18:30:00', 4, NULL), -- Sarah Wilson
(40, 'special guest', '18:45:00', '19:45:00', NULL, 20), -- Imagine Dragons
(40, 'headline', '20:00:00', '22:00:00', 7, NULL), -- James Taylor

-- Urban Sounds (Event 41, Festival 9 - Future)
(41, 'warm up', '16:30:00', '17:30:00', NULL, 1), -- Cosmic Rays
(41, 'regular', '17:45:00', '18:45:00', 28, NULL), -- Samantha Torres
(41, 'special guest', '19:00:00', '20:30:00', NULL, 2), -- Midnight Owls
(41, 'headline', '20:45:00', '23:00:00', 8, NULL), -- Anna Martinez

-- Anniversary Closing (Event 42, Festival 9 - Future)
(42, 'warm up', '17:30:00', '18:30:00', 29, NULL), -- Ethan Lewis
(42, 'regular', '18:45:00', '19:45:00', NULL, 3), -- Neon Dreams
(42, 'special guest', '20:00:00', '21:30:00', 9, NULL), -- Robert Kim
(42, 'headline', '21:45:00', '00:00:00', NULL, 4), -- Electric Echo

-- Future Festival Events (Festival 10)
(43, 'warm up', '19:30:00', '20:30:00', NULL, 5), -- Velvet Thunder
(43, 'regular', '20:45:00', '21:45:00', 10, NULL), -- Patricia Lopez
(43, 'special guest', '22:00:00', '23:00:00', NULL, 6), -- Crystal Skies
(43, 'headline', '23:15:00', '00:00:00', 11, NULL), -- Thomas Wright

(44, 'warm up', '18:30:00', '19:30:00', 12, NULL), -- Sophia Lee
(44, 'regular', '19:45:00', '20:45:00', NULL, 7), -- Urban Pulse
(44, 'headline', '21:00:00', '22:30:00', 13, NULL), -- Kevin Wang
(44, 'special guest', '22:45:00', '23:00:00', NULL, 8), -- Silver Lining

(45, 'warm up', '17:30:00', '18:30:00', NULL, 9), -- Rhythm Junction
(45, 'regular', '18:45:00', '19:45:00', 14, NULL), -- Alexandra Adams
(45, 'special guest', '20:00:00', '21:00:00', NULL, 10), -- Quantum Beat
(45, 'headline', '21:15:00', '23:00:00', 15, NULL), -- Daniel Garcia

(46, 'warm up', '20:30:00', '21:30:00', 16, NULL), -- Olivia Nelson
(46, 'regular', '21:45:00', '22:45:00', NULL, 11), -- Northern Lights
(46, 'special guest', '23:00:00', '00:30:00', 17, NULL), -- Nicholas Carter
(46, 'headline', '00:45:00', '02:00:00', NULL, 12), -- Desert Storm

(47, 'warm up', '18:30:00', '19:30:00', NULL, 13), -- Ocean Wave
(47, 'regular', '19:45:00', '20:45:00', 18, NULL), -- Emma White
(47, 'special guest', '21:00:00', '22:00:00', NULL, 14), -- Mountain Echo
(47, 'headline', '22:15:00', '00:00:00', 19, NULL); -- Marcos Rodriguez

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

-- Insert Tickets (at least 200 tickets)
-- First, let's create a procedure to generate the tickets with proper EAN codes
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

(5, 3, 1, '2016-06-15', 80.00, 'debit_card', '0000000000301', TRUE, FALSE),
(6, 3, 1, '2016-06-15', 80.00, 'debit_card', '0000000000302', TRUE, FALSE),
(7, 3, 1, '2016-06-15', 80.00, 'debit_card', '0000000000303', TRUE, FALSE),
(9, 3, 1, '2016-06-15', 80.00, 'debit_card', '0000000000304', TRUE, FALSE),

-- Visitor 4 and 5 will have the same number of tickets (different from 2 and 3)
(10, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000401', TRUE, FALSE),
(11, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000402', TRUE, FALSE),
(12, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000403', TRUE, FALSE),
(13, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000404', TRUE, FALSE),
(14, 4, 1, '2017-06-15', 85.00, 'bank_transfer', '0000000000405', TRUE, FALSE),

(15, 5, 1, '2018-06-15', 90.00, 'credit_card', '0000000000501', TRUE, FALSE),
(16, 5, 1, '2018-06-15', 90.00, 'credit_card', '0000000000502', TRUE, FALSE),
(17, 5, 1, '2018-06-15', 90.00, 'credit_card', '0000000000503', TRUE, FALSE),
(18, 5, 1, '2018-06-15', 90.00, 'credit_card', '0000000000504', TRUE, FALSE),
(19, 5, 1, '2018-06-15', 90.00, 'credit_card', '0000000000505', TRUE, FALSE);

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
DROP PROCEDURE IF EXISTS GenerateTickets;
DROP PROCEDURE IF EXISTS GenerateRatings;-- Use the pulse_university database