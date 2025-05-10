import random
from faker import Faker
from datetime import datetime, timedelta, date

# Initialize Faker
fake = Faker()

# Configuration/constraints
NUM_FESTIVALS = 10  # 8 past, 2 future
NUM_ARTISTS = 50
NUM_BANDS = 20
NUM_STAGES = 30
NUM_PERFORMANCES = 100
NUM_VISITORS = 50
NUM_TICKETS = 200
NUM_STAFF = 100  # 15 technical, 30 security, 30 support
NUM_EVENTS = 47

# Output file
output_file = "load.sql"

def generate_entity_images():
    """Generate random images for entities"""
    sql = "-- Entity Images\n"
    sql += "INSERT INTO EntityImage (entity_type, entity_id, image_path, description, url) VALUES\n"
    
    values = []
    entity_types = {
        1: "festival",
        2: "artist",
        3: "band",
        4: "stage",
        5: "staff",
        6: "performance"
    }
    
    # Generate 50 random images across different entity types
    image_id = 1
    for entity_type, type_name in entity_types.items():
        # Number of images per entity type
        count = 10 if entity_type == 1 else 5
        
        for entity_id in range(1, count + 1):
            path = f"/images/{type_name}s/{type_name}_{entity_id}.jpg"
            description = fake.sentence(nb_words=5)
            url = f"https://pulse-university.com/images/{type_name}s/{type_name}_{entity_id}"
            
            values.append(f"({entity_type}, {entity_id}, '{path}', '{description}', '{url}')")
            image_id += 1
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_locations():
    """Generate random global locations"""
    sql = "-- Locations\n"
    sql += "INSERT INTO Location (address, latitude, longitude, city, country, continent) VALUES\n"
    
    continents = ["North America", "Europe", "Asia", "Africa", "South America", "Australia"]
    
    values = []
    for i in range(15):
        address = fake.street_address()
        latitude = float(fake.latitude())
        longitude = float(fake.longitude())
        city = fake.city()
        country = fake.country()
        continent = random.choice(continents)
        
        values.append(f"('{address}', {latitude}, {longitude}, '{city}', '{country}', '{continent}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_festivals():
    """Generate festivals (8 past, 2 future)"""
    sql = "-- Festivals\n"
    sql += "INSERT INTO Festival (festival_name, start_date, end_date, location_id, description) VALUES\n"
    
    values = []
    
    # Past festivals (2015-2022)
    for i in range(8):
        year = 2015 + i
        month = random.randint(6, 8)  # Summer festivals
        start_day = random.randint(1, 25)
        
        # Festival duration 3-5 days
        duration = random.randint(3, 5)
        start_date = f"{year}-{month:02d}-{start_day:02d}"
        
        # Calculate end date
        end_day = start_day + duration - 1
        end_date = f"{year}-{month:02d}-{end_day:02d}"
        
        location_id = i + 1
        name = f"Pulse University {year}"
        description = fake.paragraph(nb_sentences=2)
        
        values.append(f"('{name}', '{start_date}', '{end_date}', {location_id}, '{description}')")
    
    # Future festivals (2026, 2027)
    for i in range(2):
        year = 2026 + i
        month = random.randint(6, 8)
        start_day = random.randint(1, 25)
        
        duration = random.randint(3, 5)
        start_date = f"{year}-{month:02d}-{start_day:02d}"
        
        end_day = start_day + duration - 1
        end_date = f"{year}-{month:02d}-{end_day:02d}"
        
        location_id = 9 + i
        name = f"Pulse University {year}"
        description = fake.paragraph(nb_sentences=2)
        
        values.append(f"('{name}', '{start_date}', '{end_date}', {location_id}, '{description}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_genres():
    """Generate music genres and subgenres"""
    sql = "-- Musical Genres\n"
    sql += "INSERT INTO Genre (genre_name, parent_genre_id) VALUES\n"
    
    # Main genres
    main_genres = [
        "Rock", "Pop", "Electronic", "Jazz", "Hip Hop", 
        "Folk", "Classical", "R&B", "Metal", "Country", 
        "Indie", "Alternative", "Reggae", "Blues", "Punk"
    ]
    
    # Subgenres with parent genre mapping
    subgenres = {
        "Rock": ["Hard Rock", "Soft Rock", "Progressive Rock"],
        "Pop": ["Electro Pop", "Synth Pop"],
        "Electronic": ["Techno", "House", "Trance"],
        "Jazz": ["Bebop", "Smooth Jazz"],
        "Hip Hop": ["Trap"],
        "Folk": ["Contemporary Folk"],
        "Classical": ["Chamber Music"],
        "R&B": ["Neo Soul"],
        "Metal": ["Death Metal"]
    }
    
    values = []
    genre_id = 1
    
    # Insert main genres
    for genre in main_genres:
        values.append(f"('{genre}', NULL)")
        genre_id += 1
    
    # Insert subgenres
    for parent, subs in subgenres.items():
        parent_id = main_genres.index(parent) + 1
        for subgenre in subs:
            values.append(f"('{subgenre}', {parent_id})")
            genre_id += 1
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_artists():
    """Generate random artists"""
    sql = "-- Artists\n"
    sql += "INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram) VALUES\n"
    
    values = []
    for i in range(NUM_ARTISTS):
        first_name = fake.first_name()
        last_name = fake.last_name()
        full_name = f"{first_name} {last_name}"
        
        # Generate stage name options
        stage_options = [
            f"{first_name[0]}-{last_name}",
            f"{first_name[:3]}",
            f"{first_name}",
            f"DJ {first_name}",
            f"The {last_name}"
        ]
        stage_name = random.choice(stage_options)
        
        # Birth date (between 1975-2000)
        birth_year = random.randint(1975, 2000)
        birth_month = random.randint(1, 12)
        birth_day = random.randint(1, 28)
        birth_date = f"{birth_year}-{birth_month:02d}-{birth_day:02d}"
        
        # Website and social media
        name_slug = f"{first_name.lower()}{last_name.lower()}"
        website = f"www.{name_slug}.com"
        instagram = f"@{name_slug}"
        
        values.append(f"('{full_name}', '{stage_name}', '{birth_date}', '{website}', '{instagram}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_bands():
    """Generate random bands"""
    sql = "-- Bands\n"
    sql += "INSERT INTO Band (band_name, formation_date, website, instagram) VALUES\n"
    
    band_name_parts = {
        'adjectives': ["Cosmic", "Electric", "Velvet", "Crystal", "Urban", "Silver", "Rhythm", "Quantum", 
                      "Northern", "Desert", "Ocean", "Mountain", "Jungle", "Metro", "Sunset", "Arctic", 
                      "Midnight", "Neon", "Golden", "Rising"],
        'nouns': ["Rays", "Owls", "Dreams", "Echo", "Thunder", "Skies", "Pulse", "Lining", "Junction", 
                 "Beat", "Lights", "Storm", "Wave", "Echo", "Fever", "Pulse", "Boulevard", "Monkeys", 
                 "Keys", "Dragons"]
    }
    
    values = []
    for i in range(NUM_BANDS):
        # Generate unique band name
        if i < len(band_name_parts['adjectives']):
            # Use predefined combinations for first 20 bands
            name = f"{band_name_parts['adjectives'][i]} {band_name_parts['nouns'][i]}"
        else:
            # Generate random combination for any additional bands
            adj = random.choice(band_name_parts['adjectives'])
            noun = random.choice(band_name_parts['nouns'])
            name = f"{adj} {noun}"
        
        # Formation date (2001-2016)
        formation_year = random.randint(2001, 2016)
        formation_month = random.randint(1, 12)
        formation_day = random.randint(1, 28)
        formation_date = f"{formation_year}-{formation_month:02d}-{formation_day:02d}"
        
        # Generate website and social media
        name_slug = name.lower().replace(' ', '')
        website = f"www.{name_slug}.com"
        instagram = f"@{name_slug}"
        
        values.append(f"('{name}', '{formation_date}', '{website}', '{instagram}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_artist_band_relationships():
    """Generate artist-band relationships"""
    sql = "-- Artist-Band Relationships\n"
    sql += "INSERT INTO ArtistBand (artist_id, band_id, join_date) VALUES\n"
    
    values = []
    # Each band has 2-4 members
    for band_id in range(1, NUM_BANDS + 1):
        # Number of members in this band
        num_members = random.randint(2, 4)
        
        # Assign artists to band
        band_members = random.sample(range(1, NUM_ARTISTS + 1), num_members)
        
        for artist_id in band_members:
            # Join date (around band formation, 2001-2017)
            join_year = random.randint(2001, 2017)
            join_month = random.randint(1, 12)
            join_day = random.randint(1, 28)
            join_date = f"{join_year}-{join_month:02d}-{join_day:02d}"
            
            values.append(f"({artist_id}, {band_id}, '{join_date}')")
    
    # Some artists in multiple bands (5 artists)
    multi_band_artists = random.sample(range(1, NUM_ARTISTS + 1), 5)
    for i, artist_id in enumerate(multi_band_artists):
        # Find a band this artist isn't already in
        existing_bands = [int(v.split(',')[1]) for v in values if v.startswith(f"({artist_id},")]
        available_bands = [b for b in range(1, NUM_BANDS + 1) if b not in existing_bands]
        
        if available_bands:
            band_id = random.choice(available_bands)
            # Join date for second band (2014-2017)
            join_year = random.randint(2014, 2017)
            join_month = random.randint(1, 12)
            join_day = random.randint(1, 28)
            join_date = f"{join_year}-{join_month:02d}-{join_day:02d}"
            
            values.append(f"({artist_id}, {band_id}, '{join_date}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_artist_genres():
    """Generate artist-genre mappings"""
    sql = "-- Artist-Genre Relationships\n"
    sql += "INSERT INTO ArtistGenre (artist_id, genre_id) VALUES\n"
    
    values = []
    # Give each artist 1-2 genres
    for artist_id in range(1, NUM_ARTISTS + 1):
        # Number of genres for this artist
        num_genres = random.randint(1, 2)
        
        # Select random genres
        artist_genres = random.sample(range(1, 30 + 1), num_genres)
        for genre_id in artist_genres:
            values.append(f"({artist_id}, {genre_id})")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_band_genres():
    """Generate band-genre mappings"""
    sql = "-- Band-Genre Relationships\n"
    sql += "INSERT INTO BandGenre (band_id, genre_id) VALUES\n"
    
    values = []
    # Give each band 1-2 genres
    for band_id in range(1, NUM_BANDS + 1):
        # Number of genres for this band
        num_genres = random.randint(1, 2)
        
        # Select random genres
        band_genres = random.sample(range(1, 30 + 1), num_genres)
        for genre_id in band_genres:
            values.append(f"({band_id}, {genre_id})")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_stages():
    """Generate stages for festivals"""
    sql = "-- Stages\n"
    sql += "INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id) VALUES\n"
    
    # Stage name prefixes and suffixes
    prefixes = ["Main", "Electro", "Rock", "Jazz", "Hip Hop", "Folk", "Classical", "Indie", "Metal", 
               "Reggae", "Urban", "Beach", "Desert", "Forest", "Mountain"]
    suffixes = ["Stage", "Arena", "Dome", "Pavilion", "Square", "Tent", "Platform", "Theater", "Hall"]
    
    # Technical equipment options
    equipment_options = [
        "Advanced lighting, multiple speaker towers, LED screens",
        "DJ equipment, laser lights, fog machines",
        "Vintage microphones, subtle lighting, acoustic panels",
        "Heavy-duty sound system, pyrotechnics, smoke effects",
        "Surround sound system, visual projectors, video walls",
        "Minimal setup, acoustic-friendly environment",
        "Heat-resistant equipment, cooling systems, dust protection",
        "Weather-resistant equipment, waterproof coverings",
        "Premium sound system, VIP areas, private booths"
    ]
    
    values = []
    stage_id = 1
    
    # Create 3-4 stages for each festival
    for festival_id in range(1, NUM_FESTIVALS + 1):
        # Number of stages for this festival
        num_stages = random.randint(3, 4) if festival_id <= 8 else 2
        
        for i in range(num_stages):
            # Generate unique stage name
            prefix = random.choice(prefixes)
            suffix = random.choice(suffixes)
            name = f"{prefix} {suffix}"
            
            # Description
            description = fake.sentence(nb_words=10)
            
            # Capacity (300-10000)
            capacity = random.choice([300, 500, 700, 1000, 2000, 3000, 5000, 8000, 10000])
            
            # Technical equipment
            equipment = random.choice(equipment_options)
            
            values.append(f"('{name}', '{description}', {capacity}, '{equipment}', {festival_id})")
            stage_id += 1
            
            # Don't exceed NUM_STAGES
            if stage_id > NUM_STAGES:
                break
        
        if stage_id > NUM_STAGES:
            break
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_staff():
    """Generate staff members"""
    sql = "-- Staff\n"
    sql += "INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level) VALUES\n"
    
    # Staff roles by type
    roles = {
        "technical": ["Sound Engineer", "Lighting Technician", "Stage Manager", "Audio Technician",
                     "Visual Effects", "Equipment Manager", "Production Manager", "Camera Operator"],
        "security": ["Security Chief", "Security Supervisor", "Entrance Guard", "Stage Security",
                    "VIP Security", "Perimeter Security", "Crowd Control", "Emergency Response"],
        "support": ["Guest Relations", "Information Desk", "First Aid", "Lost and Found",
                   "Hospitality", "Transportation", "Artist Liaison", "Volunteer Coordinator"]
    }
    
    experience_levels = ["trainee", "beginner", "intermediate", "experienced", "expert"]
    
    values = []
    
    # Technical staff (15)
    for i in range(15):
        first_name = fake.first_name()
        last_name = fake.last_name()
        birth_date = fake.date_of_birth(minimum_age=25, maximum_age=55).strftime("%Y-%m-%d")
        role = random.choice(roles["technical"])
        experience = random.choice(experience_levels)
        
        values.append(f"('{first_name}', '{last_name}', '{birth_date}', 'technical', '{role}', '{experience}')")
    
    # Security staff (30)
    for i in range(30):
        first_name = fake.first_name()
        last_name = fake.last_name()
        birth_date = fake.date_of_birth(minimum_age=25, maximum_age=50).strftime("%Y-%m-%d")
        role = random.choice(roles["security"])
        experience = random.choice(experience_levels)
        
        values.append(f"('{first_name}', '{last_name}', '{birth_date}', 'security', '{role}', '{experience}')")
    
    # Support staff (30)
    for i in range(30):
        first_name = fake.first_name()
        last_name = fake.last_name()
        birth_date = fake.date_of_birth(minimum_age=22, maximum_age=45).strftime("%Y-%m-%d")
        role = random.choice(roles["support"])
        experience = random.choice(experience_levels)
        
        values.append(f"('{first_name}', '{last_name}', '{birth_date}', 'support', '{role}', '{experience}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_events():
    """Generate events for each festival"""
    sql = "-- Events\n"
    sql += "INSERT INTO Event (event_name, event_date, stage_id, start_time, end_time, description) VALUES\n"
    
    values = []
    event_id = 1
    
    # Dictionary to track stages per festival
    festival_stages = {}
    for festival_id in range(1, NUM_FESTIVALS + 1):
        festival_stages[festival_id] = []
    
    # First, gather all stages by festival_id
    for stage_id in range(1, NUM_STAGES + 1):
        festival_id = (stage_id - 1) // 3 + 1
        if festival_id <= NUM_FESTIVALS:
            festival_stages[festival_id].append(stage_id)
    
    # Event name templates
    event_names = [
        "Opening Night", "Electronic Showcase", "Rock Extravaganza", "Jazz Evening", 
        "Hip Hop Explosion", "Folk Festival", "Classical Night", "Indie Experience",
        "Metal Mayhem", "Reggae Vibes", "Grand Finale", "Acoustic Session",
        "Drum & Bass Special", "Alternative Showcase", "Punk Rock Night"
    ]
    
    # Generate events for each festival
    for festival_id in range(1, NUM_FESTIVALS + 1):
        # Get festival dates
        year = 2014 + festival_id if festival_id <= 8 else (2025 + festival_id - 8)
        festival_start = date(year, 7, 15)  # Example start date
        festival_end = date(year, 7, 15 + random.randint(3, 5))  # 3-5 day festival
        
        # For each day of the festival
        current_date = festival_start
        while current_date <= festival_end:
            # For each stage in this festival
            for stage_id in festival_stages[festival_id]:
                # May not have an event every day on every stage
                if random.random() < 0.8:  # 80% chance of an event
                    event_name = f"{random.choice(event_names)} {current_date.strftime('%A')}"
                    
                    # Event times (evening events more common)
                    hour_start = random.randint(14, 19)  # 2pm - 7pm start
                    event_duration = random.randint(4, 6)  # 4-6 hours
                    
                    start_time = f"{hour_start:02d}:00:00"
                    end_time = f"{(hour_start + event_duration):02d}:00:00"
                    
                    event_date = current_date.strftime("%Y-%m-%d")
                    description = fake.sentence(nb_words=10)
                    
                    values.append(f"('{event_name}', '{event_date}', {stage_id}, '{start_time}', '{end_time}', '{description}')")
                    event_id += 1
                    
                    # Don't exceed NUM_EVENTS
                    if event_id > NUM_EVENTS:
                        break
            
            if event_id > NUM_EVENTS:
                break
                
            current_date += timedelta(days=1)
        
        if event_id > NUM_EVENTS:
            break
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_performances():
    """Generate performances for events"""
    sql = "-- Performances\n"
    sql += "INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id) VALUES\n"
    
    values = []
    performance_id = 1
    
    # Performance types and their typical durations (in minutes)
    performance_types = {
        "warm up": (45, 60),       # 45-60 minutes
        "regular": (60, 90),       # 60-90 minutes
        "special guest": (60, 90), # 60-90 minutes
        "headline": (90, 120)      # 90-120 minutes
    }
    
    # For each event, create 2-4 performances
    for event_id in range(1, NUM_EVENTS + 1):
        # Number of performances in this event
        num_performances = random.randint(2, 4)
        
        # Event start time (assuming format like "18:00:00")
        event_start = datetime.strptime("18:00:00", "%H:%M:%S")  # Default
        
        # Create performances sequence
        for i in range(num_performances):
            # Performance type based on position
            if i == 0:
                perf_type = "warm up"
            elif i == num_performances - 1:
                perf_type = "headline"
            elif i == num_performances - 2:
                perf_type = "special guest"
            else:
                perf_type = "regular"
            
            # Performance duration
            min_duration, max_duration = performance_types[perf_type]
            duration_minutes = random.randint(min_duration, max_duration)
            
            # Start and end times
            if i == 0:
                # First performance starts at event start time
                start_time = event_start
            else:
                # Add break time (5-30 minutes) after previous performance
                break_minutes = random.randint(5, 30)
                start_time = end_time + timedelta(minutes=break_minutes)
            
            end_time = start_time + timedelta(minutes=duration_minutes)
            
            # Format times as strings
            start_time_str = start_time.strftime("%H:%M:%S")
            end_time_str = end_time.strftime("%H:%M:%S")
            
            # Artist or band (50/50 chance)
            if random.random() < 0.5:
                # Artist performance
                artist_id = random.randint(1, NUM_ARTISTS)
                band_id = "NULL"
            else:
                # Band performance
                artist_id = "NULL"
                band_id = random.randint(1, NUM_BANDS)
            
            values.append(f"({event_id}, '{perf_type}', '{start_time_str}', '{end_time_str}', {artist_id}, {band_id})")
            performance_id += 1
            
            # Don't exceed NUM_PERFORMANCES
            if performance_id > NUM_PERFORMANCES:
                break
        
        if performance_id > NUM_PERFORMANCES:
            break
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_visitors():
    """Generate festival visitors"""
    sql = "-- Visitors\n"
    sql += "INSERT INTO Visitor (first_name, last_name, email, phone, birth_date) VALUES\n"
    
    values = []
    for i in range(NUM_VISITORS):
        first_name = fake.first_name()
        last_name = fake.last_name()
        email = fake.email()
        phone = fake.phone_number()
        birth_date = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime("%Y-%m-%d")
        
        values.append(f"('{first_name}', '{last_name}', '{email}', '{phone}', '{birth_date}')")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_ticket_categories():
    """Generate ticket categories"""
    sql = "-- Ticket Categories\n"
    sql += "INSERT INTO TicketCategory (category_name) VALUES\n"
    
    categories = ["general", "vip", "backstage"]
    values = [f"('{category}')" for category in categories]
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_tickets():
    """Generate tickets for visitors"""
    sql = "-- Tickets\n"
    sql += "INSERT INTO Ticket (event_id, visitor_id, category_id, purchase_date, price, payment_method, ean_code, is_used) VALUES\n"
    
    values = []
    
    # Payment methods
    payment_methods = ["credit card", "debit card", "bank transfer", "paypal"]
    
    # Price ranges by category
    price_ranges = {
        1: (50, 100),    # general: $50-100
        2: (150, 300),   # vip: $150-300
        3: (350, 500)    # backstage: $350-500
    }
    
    # Generate random tickets
    for i in range(NUM_TICKETS):
        event_id = random.randint(1, NUM_EVENTS)
        visitor_id = random.randint(1, NUM_VISITORS)
        
        # Category with distribution: 80% general, 15% VIP, 5% backstage
        category_rand = random.random()
        if category_rand < 0.8:
            category_id = 1  # general
        elif category_rand < 0.95:
            category_id = 2  # vip
        else:
            category_id = 3  # backstage
        
        # Purchase date (1-60 days before event)
        purchase_date = fake.date_time_between(start_date="-60d", end_date="now").strftime("%Y-%m-%d %H:%M:%S")
        
        # Price based on category
        min_price, max_price = price_ranges[category_id]
        price = round(random.uniform(min_price, max_price), 2)
        
        # Payment method
        payment_method = random.choice(payment_methods)
        
        # Generate unique EAN-13 code
        ean_code = ''.join([str(random.randint(0, 9)) for _ in range(13)])
        
        # 75% chance ticket is used
        is_used = random.random() < 0.75
        
        values.append(f"({event_id}, {visitor_id}, {category_id}, '{purchase_date}', {price}, '{payment_method}', '{ean_code}', {1 if is_used else 0})")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_staff_assignments():
    """Generate staff assignments for events"""
    sql = "-- Staff Assignments\n"
    sql += "INSERT INTO StaffAssignment (staff_id, event_id) VALUES\n"
    
    values = []
    
    # For each event, assign appropriate staff
    for event_id in range(1, NUM_EVENTS + 1):
        # Technical staff (2-4 per event)
        tech_count = random.randint(2, 4)
        tech_staff = random.sample(range(1, 16), tech_count)
        
        # Security staff (5-10 per event)
        security_count = random.randint(5, 10)
        security_staff = random.sample(range(16, 46), security_count)
        
        # Support staff (3-6 per event)
        support_count = random.randint(3, 6)
        support_staff = random.sample(range(46, 76), support_count)
        
        # Combine all staff for this event
        event_staff = tech_staff + security_staff + support_staff
        
        for staff_id in event_staff:
            values.append(f"({staff_id}, {event_id})")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_ratings():
    """Generate ratings for performances"""
    sql = "-- Ratings\n"
    sql += "INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression) VALUES\n"
    
    values = []
    
    # Only used tickets can submit ratings
    for ticket_id in range(1, NUM_TICKETS + 1):
        # 30% chance a ticket holder submits ratings
        if random.random() < 0.3:
            # Find a valid performance for this ticket's event
            performance_id = random.randint(1, NUM_PERFORMANCES)
            
            # Generate ratings (1-5 scale)
            artist_rating = random.randint(1, 5)
            sound_rating = random.randint(1, 5)
            stage_rating = random.randint(1, 5)
            org_rating = random.randint(1, 5)
            overall_rating = random.randint(1, 5)
            
            values.append(f"({ticket_id}, {performance_id}, {artist_rating}, {sound_rating}, {stage_rating}, {org_rating}, {overall_rating})")
    
    return sql + ",\n".join(values) + ";\n\n"

def generate_resale_queues():
    """Generate resale queue data"""
    sql = "-- Resale Buyer Queue\n"
    sql += "INSERT INTO ResaleBuyerQueue (visitor_id, event_id, category_id, request_date, is_fulfilled) VALUES\n"
    
    buyer_values = []
    # Generate 20 buyer requests
    for i in range(20):
        visitor_id = random.randint(1, NUM_VISITORS)
        event_id = random.randint(1, NUM_EVENTS)
        category_id = random.randint(1, 3)
        request_date = fake.date_time_between(start_date="-30d", end_date="now").strftime("%Y-%m-%d %H:%M:%S")
        is_fulfilled = random.random() < 0.3  # 30% fulfilled
        
        buyer_values.append(f"({visitor_id}, {event_id}, {category_id}, '{request_date}', {1 if is_fulfilled else 0})")
    
    sql_buyer = sql + ",\n".join(buyer_values) + ";\n\n"
    
    sql_seller = "-- Resale Seller Queue\n"
    sql_seller += "INSERT INTO ResaleSellerQueue (ticket_id, request_date, is_sold) VALUES\n"
    
    seller_values = []
    # Generate 15 seller requests
    for i in range(15):
        ticket_id = random.randint(1, NUM_TICKETS)
        request_date = fake.date_time_between(start_date="-30d", end_date="now").strftime("%Y-%m-%d %H:%M:%S")
        is_sold = random.random() < 0.4  # 40% sold
        
        seller_values.append(f"({ticket_id}, '{request_date}', {1 if is_sold else 0})")
    
    sql_seller = sql_seller + ",\n".join(seller_values) + ";\n\n"
    
    return sql_buyer + sql_seller

def main():
    # Generate data for each table
    sql_data = ""
    sql_data += "-- Use the pulse_university database\n"
    sql_data += "USE pulse_university;\n\n"
    
    # Add generated data for each table
    sql_data += generate_entity_images()
    sql_data += generate_locations()
    sql_data += generate_festivals()
    sql_data += generate_genres()
    sql_data += generate_artists()
    sql_data += generate_bands()
    sql_data += generate_artist_band_relationships()
    sql_data += generate_artist_genres()
    sql_data += generate_band_genres()
    sql_data += generate_stages()
    sql_data += generate_staff()
    sql_data += generate_events()
    sql_data += generate_performances()
    sql_data += generate_visitors()
    sql_data += generate_ticket_categories()
    sql_data += generate_tickets()
    sql_data += generate_staff_assignments()
    sql_data += generate_ratings()
    sql_data += generate_resale_queues()
    
    # Write to output file
    with open("fake_data.sql", "w") as f:
        f.write(sql_data)
    
    print(f"Data generated and saved to fake_data.sql")

if __name__ == "__main__":
    main()