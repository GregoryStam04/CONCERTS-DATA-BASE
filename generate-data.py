import random
import mysql.connector
from datetime import datetime, timedelta, date
import string

# Database connection
db_config = {
    'host': 'localhost3306',
    'user': 'root',
    'password': '',  # Change this to your MySQL password
    'database': 'pulse_university'
}

# Connect to the database
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Connected to database successfully!")
except mysql.connector.Error as err:
    print(f"Error: {err}")
    exit(1)

# Helper functions
def random_date(start_date, end_date):
    """Generate a random date between start_date and end_date"""
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    return start_date + timedelta(days=random_number_of_days)

def random_time(start_hour=10, end_hour=23):
    """Generate a random time between start_hour and end_hour"""
    hour = random.randint(start_hour, end_hour)
    minute = random.choice([0, 15, 30, 45])
    return f"{hour:02d}:{minute:02d}:00"

def random_end_time(start_time, min_duration=30, max_duration=180):
    """Generate a random end time after start_time with duration between min and max minutes"""
    h, m, s = map(int, start_time.split(':'))
    start_minutes = h * 60 + m
    duration = random.randint(min_duration, max_duration)
    end_minutes = start_minutes + duration
    
    end_hour = end_minutes // 60
    if end_hour > 23:
        end_hour = 23
        end_minute = 59
    else:
        end_minute = end_minutes % 60
    
    return f"{end_hour:02d}:{end_minute:02d}:00"

def random_ean13():
    """Generate random EAN-13 code"""
    digits = [str(random.randint(0, 9)) for _ in range(12)]
    ean = ''.join(digits)
    # Calculate check digit (simplified implementation)
    total = sum(int(digit) * (1 if i % 2 == 0 else 3) for i, digit in enumerate(ean))
    check_digit = (10 - (total % 10)) % 10
    return ean + str(check_digit)

def insert_and_get_id(query, values):
    """Insert data and return the last inserted ID"""
    cursor.execute(query, values)
    conn.commit()
    return cursor.lastrowid

# Clear all tables before inserting new data
tables = [
    "Rating", "ResaleSellerQueue", "ResaleBuyerQueue", "Ticket", 
    "TicketCategory", "Visitor", "StaffAssignment", "Staff", 
    "Performance", "BandGenre", "ArtistGenre", "ArtistBand", 
    "Band", "Artist", "Genre", "Event", "Stage", "Festival", 
    "Location", "EntityImage"
]

for table in tables:
    try:
        cursor.execute(f"SET FOREIGN_KEY_CHECKS = 0")
        cursor.execute(f"TRUNCATE TABLE {table}")
        cursor.execute(f"SET FOREIGN_KEY_CHECKS = 1")
        print(f"Truncated table: {table}")
    except mysql.connector.Error as err:
        print(f"Error truncating {table}: {err}")

# Seed data for Locations
continents = ["Europe", "North America", "South America", "Asia", "Africa", "Australia"]
countries = {
    "Europe": ["United Kingdom", "Germany", "France", "Spain", "Italy", "Netherlands", "Belgium", "Greece"],
    "North America": ["United States", "Canada", "Mexico"],
    "South America": ["Brazil", "Argentina", "Chile", "Colombia"],
    "Asia": ["Japan", "South Korea", "China", "India", "Thailand"],
    "Africa": ["South Africa", "Morocco", "Egypt", "Nigeria"],
    "Australia": ["Australia", "New Zealand"]
}

cities = {
    "United Kingdom": ["London", "Manchester", "Edinburgh", "Glasgow"],
    "Germany": ["Berlin", "Munich", "Hamburg", "Cologne"],
    "France": ["Paris", "Lyon", "Marseille", "Nice"],
    "Spain": ["Madrid", "Barcelona", "Valencia", "Seville"],
    "Italy": ["Rome", "Milan", "Naples", "Florence"],
    "Netherlands": ["Amsterdam", "Rotterdam", "The Hague", "Utrecht"],
    "Belgium": ["Brussels", "Antwerp", "Ghent", "Bruges"],
    "Greece": ["Athens", "Thessaloniki", "Patras", "Heraklion"],
    "United States": ["New York", "Los Angeles", "Chicago", "Austin", "Miami", "Seattle"],
    "Canada": ["Toronto", "Vancouver", "Montreal", "Calgary"],
    "Mexico": ["Mexico City", "Guadalajara", "Monterrey", "Cancun"],
    "Brazil": ["Rio de Janeiro", "São Paulo", "Salvador", "Brasília"],
    "Argentina": ["Buenos Aires", "Córdoba", "Rosario", "Mendoza"],
    "Chile": ["Santiago", "Valparaíso", "Concepción", "Viña del Mar"],
    "Colombia": ["Bogotá", "Medellín", "Cali", "Barranquilla"],
    "Japan": ["Tokyo", "Osaka", "Kyoto", "Yokohama"],
    "South Korea": ["Seoul", "Busan", "Incheon", "Daegu"],
    "China": ["Beijing", "Shanghai", "Guangzhou", "Shenzhen"],
    "India": ["Mumbai", "Delhi", "Bangalore", "Chennai"],
    "Thailand": ["Bangkok", "Chiang Mai", "Phuket", "Pattaya"],
    "South Africa": ["Cape Town", "Johannesburg", "Durban", "Pretoria"],
    "Morocco": ["Marrakesh", "Casablanca", "Fez", "Tangier"],
    "Egypt": ["Cairo", "Alexandria", "Luxor", "Sharm El Sheikh"],
    "Nigeria": ["Lagos", "Abuja", "Kano", "Ibadan"],
    "Australia": ["Sydney", "Melbourne", "Brisbane", "Perth"],
    "New Zealand": ["Auckland", "Wellington", "Christchurch", "Queenstown"]
}

locations = []
location_ids = []

print("Creating locations...")
for _ in range(30):
    continent = random.choice(continents)
    country = random.choice(countries[continent])
    city = random.choice(cities[country])
    
    # Generate realistic coordinates
    latitude = random.uniform(-90, 90)
    longitude = random.uniform(-180, 180)
    
    address = f"{random.randint(1, 999)} {random.choice(['Main', 'Park', 'Oak', 'Pine', 'Maple', 'Cedar'])} {random.choice(['Street', 'Avenue', 'Road', 'Boulevard', 'Lane'])}"
    
    query = """
    INSERT INTO Location (address, latitude, longitude, city, country, continent)
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    values = (address, latitude, longitude, city, country, continent)
    
    location_id = insert_and_get_id(query, values)
    location_ids.append(location_id)
    locations.append((location_id, city, country, continent))
    print(f"Created location {location_id}: {city}, {country}")

# Seed data for Festivals
print("Creating festivals...")
festivals = []
festival_ids = []
festival_names = [
    "Pulse Universe", "Rhythm Galaxy", "Sonic Dimensions", "Harmonic Convergence", 
    "Melody Cosmos", "Beat Continuum", "Echo Sphere", "Vibrant Frequency",
    "Sound Fusion", "Resonance Collective"
]

current_year = datetime.now().year
for year in range(current_year - 8, current_year + 3):
    # Create 10 festivals, 8 in the past and 2 in the future
    if year < current_year:
        # Past festivals
        for i in range(min(8, len(festival_names))):
            festival_name = f"{festival_names[i]} {year}"
            location_id = random.choice(location_ids)
            
            # Festival dates (3-5 days in the summer)
            start_month = random.choice([6, 7, 8])  # June, July, August
            start_day = random.randint(1, 25)
            duration = random.randint(3, 5)
            
            start_date = date(year, start_month, start_day)
            end_date = start_date + timedelta(days=duration - 1)
            
            description = f"The {year} edition of {festival_names[i]}, showcasing the best in music from around the world."
            poster_image = f"festivals/poster_{year}_{i}.jpg"
            poster_description = f"Official poster for {festival_name}"
            
            query = """
            INSERT INTO Festival (festival_name, start_date, end_date, location_id, description, poster_image, poster_description)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            values = (festival_name, start_date, end_date, location_id, description, poster_image, poster_description)
            
            festival_id = insert_and_get_id(query, values)
            festival_ids.append(festival_id)
            festivals.append((festival_id, festival_name, start_date, end_date, year))
            print(f"Created festival {festival_id}: {festival_name} ({start_date} to {end_date})")
    else:
        # Future festivals (only create 2)
        for i in range(2):
            festival_name = f"{festival_names[i]} {year}"
            location_id = random.choice(location_ids)
            
            # Festival dates (3-5 days in the summer)
            start_month = random.choice([6, 7, 8])  # June, July, August
            start_day = random.randint(1, 25)
            duration = random.randint(3, 5)
            
            start_date = date(year, start_month, start_day)
            end_date = start_date + timedelta(days=duration - 1)
            
            description = f"The upcoming {year} edition of {festival_names[i]}, showcasing the best in music from around the world."
            poster_image = f"festivals/poster_{year}_{i}.jpg"
            poster_description = f"Official poster for {festival_name}"
            
            query = """
            INSERT INTO Festival (festival_name, start_date, end_date, location_id, description, poster_image, poster_description)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            values = (festival_name, start_date, end_date, location_id, description, poster_image, poster_description)
            
            festival_id = insert_and_get_id(query, values)
            festival_ids.append(festival_id)
            festivals.append((festival_id, festival_name, start_date, end_date, year))
            print(f"Created festival {festival_id}: {festival_name} ({start_date} to {end_date})")

# Seed data for Stages
print("Creating stages...")
stages = []
stage_ids = []
stage_names = [
    "Main Stage", "Eclipse Arena", "Nebula Pavilion", "Stellar Dome", "Cosmic Theatre",
    "Horizon Platform", "Zenith Amphitheater", "Aurora Venue", "Orbit Stage", "Infinity Hall"
]

for festival_id, festival_name, _, _, _ in festivals:
    # Create 3-4 stages per festival
    num_stages = random.randint(3, 4)
    for i in range(num_stages):
        stage_name = stage_names[i % len(stage_names)]
        description = f"{stage_name} at {festival_name}"
        max_capacity = random.choice([500, 1000, 2000, 5000, 10000, 15000])
        
        technical_equipment = "Sound system: JBL, Microphones: Shure, Lighting: Martin, Mixing Console: Allen & Heath"
        stage_image = f"stages/{festival_id}_{i}.jpg"
        stage_image_description = f"{stage_name} setup for {festival_name}"
        
        query = """
        INSERT INTO Stage (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image, stage_image_description)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (stage_name, description, max_capacity, technical_equipment, festival_id, stage_image, stage_image_description)
        
        stage_id = insert_and_get_id(query, values)
        stage_ids.append(stage_id)
        stages.append((stage_id, stage_name, festival_id, max_capacity))
        print(f"Created stage {stage_id}: {stage_name} (capacity: {max_capacity})")

# Seed data for Events
print("Creating events...")
events = []
event_ids = []

for festival_id, _, start_date, end_date, _ in festivals:
    festival_stages = [s for s in stages if s[2] == festival_id]
    
    # Generate events for each day of the festival
    current_date = start_date
    while current_date <= end_date:
        for stage_id, stage_name, _, _ in festival_stages:
            event_name = f"{stage_name} - Day {(current_date - start_date).days + 1}"
            start_time = random_time(14, 16)  # Events start between 2 PM and 4 PM
            end_time = random_time(22, 23)    # Events end between 10 PM and 11 PM
            
            description = f"Full day of performances at {stage_name}"
            
            query = """
            INSERT INTO Event (event_name, event_date, stage_id, start_time, end_time, description)
            VALUES (%s, %s, %s, %s, %s, %s)
            """
            values = (event_name, current_date, stage_id, start_time, end_time, description)
            
            event_id = insert_and_get_id(query, values)
            event_ids.append(event_id)
            events.append((event_id, event_name, current_date, stage_id, start_time, end_time))
            print(f"Created event {event_id}: {event_name} on {current_date}")
        
        current_date += timedelta(days=1)

# Seed data for Genres
print("Creating music genres...")
genre_map = {}

# Main genres
main_genres = ["Rock", "Pop", "Electronic", "Hip Hop", "Jazz", "Classical", "Metal", "Folk", "Reggae", "Blues"]
for genre in main_genres:
    query = "INSERT INTO Genre (genre_name, parent_genre_id) VALUES (%s, NULL)"
    values = (genre,)
    genre_id = insert_and_get_id(query, values)
    genre_map[genre] = genre_id
    print(f"Created main genre {genre_id}: {genre}")

# Subgenres with parent genres
subgenres = {
    "Rock": ["Alternative Rock", "Indie Rock", "Hard Rock", "Progressive Rock", "Punk Rock"],
    "Pop": ["Synth Pop", "Power Pop", "Indie Pop", "K-Pop", "J-Pop"],
    "Electronic": ["Techno", "House", "Drum and Bass", "Dubstep", "Ambient"],
    "Hip Hop": ["Trap", "Mumble Rap", "Conscious Hip Hop", "Old School Hip Hop", "Gangsta Rap"],
    "Jazz": ["Bebop", "Smooth Jazz", "Fusion", "Cool Jazz", "Free Jazz"],
    "Classical": ["Baroque", "Romantic", "Contemporary Classical", "Opera", "Symphony"],
    "Metal": ["Heavy Metal", "Death Metal", "Black Metal", "Thrash Metal", "Nu Metal"],
    "Folk": ["Traditional Folk", "Folk Rock", "Contemporary Folk", "Celtic", "American Folk"],
    "Reggae": ["Dancehall", "Dub", "Roots Reggae", "Ska", "Rocksteady"],
    "Blues": ["Delta Blues", "Chicago Blues", "Electric Blues", "Country Blues", "Rhythm and Blues"]
}

for parent, children in subgenres.items():
    parent_id = genre_map[parent]
    for child in children:
        query = "INSERT INTO Genre (genre_name, parent_genre_id) VALUES (%s, %s)"
        values = (child, parent_id)
        genre_id = insert_and_get_id(query, values)
        genre_map[child] = genre_id
        print(f"Created subgenre {genre_id}: {child} (parent: {parent})")

all_genres = list(genre_map.items())

# Seed data for Artists
print("Creating artists...")
artist_ids = []
artists = []

first_names = ["Alex", "Jamie", "Jordan", "Casey", "Taylor", "Morgan", "Riley", "Quinn", "Avery", "Blake", 
               "Charlie", "Dakota", "Elliot", "Frankie", "Harper", "Kai", "Logan", "Marley", "Nico", "Parker", 
               "Reese", "Sage", "Tatum", "Val", "Winter", "Zion", "Ash", "Bailey", "Corey", "Drew", "Emma", 
               "Finn", "Grace", "Henry", "Isabella", "Jack", "Kate", "Liam", "Mia", "Noah", "Olivia", "Peyton", 
               "Quinn", "Ryan", "Sophia", "Tyler", "Uma", "Victor", "Wendy", "Xander", "Yara", "Zoe"]

last_names = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", 
              "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", 
              "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "King", "Wright", "Scott", 
              "Green", "Baker", "Adams", "Nelson", "Hill", "Ramirez", "Campbell", "Mitchell", "Roberts", "Carter", 
              "Phillips", "Evans", "Turner", "Torres", "Parker", "Collins", "Edwards", "Stewart", "Flores", "Morris"]

stage_names = ["DJ", "Lil", "MC", "The", "Young", "Big", "Sir", "Lady", "Queen", "King", "Prince", "Princess", 
               "Doctor", "Professor", "Captain", "Major", "Saint", "Baby", "Madame", "Mister", "Monsieur", "Miss", 
               "Mistress", "Lord", "Master", "Chief", "Don", "Donna", "Duchess", "Duke"]

def random_instagram():
    return f"@{random.choice(['official', 'real', 'the', 'dj', 'mc', 'lil', 'big', ''])}{random.choice(first_names).lower()}{random.choice(['', '_', '.'])}{random.choice(last_names).lower()}{random.choice(['', str(random.randint(1, 99))])}"

# Generate 50 artists as required
for i in range(50):
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    artist_name = f"{first_name} {last_name}"
    
    # Some artists have stage names, some don't
    if random.random() < 0.7:
        prefix = random.choice(stage_names)
        stage_name = f"{prefix} {first_name}"
    else:
        stage_name = None
    
    # Generate birth date (18-45 years old)
    age = random.randint(18, 45)
    birth_year = datetime.now().year - age
    birth_month = random.randint(1, 12)
    birth_day = random.randint(1, 28)  # Simplified to avoid month length issues
    birth_date = date(birth_year, birth_month, birth_day)
    
    # Some have websites and social media, some don't
    if random.random() < 0.8:
        website = f"https://www.{first_name.lower()}{last_name.lower()}.com"
    else:
        website = None
    
    if random.random() < 0.9:
        instagram = random_instagram()
    else:
        instagram = None
    
    artist_image = f"artists/{i+1}.jpg"
    artist_description = f"{artist_name} is a talented musician known for their unique style and captivating performances."
    
    query = """
    INSERT INTO Artist (artist_name, stage_name, birth_date, website, instagram, artist_image, artist_description)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    values = (artist_name, stage_name, birth_date, website, instagram, artist_image, artist_description)
    
    artist_id = insert_and_get_id(query, values)
    artist_ids.append(artist_id)
    artists.append((artist_id, artist_name, stage_name, birth_date, age))
    print(f"Created artist {artist_id}: {artist_name}")
    
    # Assign 2-4 genres to each artist
    num_genres = random.randint(2, 4)
    artist_genres = random.sample(all_genres, num_genres)
    
    for genre_name, genre_id in artist_genres:
        query = "INSERT INTO ArtistGenre (artist_id, genre_id) VALUES (%s, %s)"
        values = (artist_id, genre_id)
        cursor.execute(query, values)
        print(f"Assigned genre {genre_name} to artist {artist_name}")
    
    conn.commit()

# Seed data for Bands
print("Creating bands...")
band_ids = []
bands = []

band_prefixes = ["The", ""]
band_names = ["Dragons", "Wolves", "Phoenix", "Ravens", "Tigers", "Eagles", "Falcons", "Lions", 
              "Vipers", "Cobras", "Panthers", "Sharks", "Bears", "Foxes", "Owls", "Hawks"]
band_suffixes = ["Collective", "Ensemble", "Band", "Orchestra", "Quartet", "Quintet", "Trio", "Duo", 
                "Project", "Experience", "Experiment", "Fusion", "Connection", "Alliance", "Syndicate", "Coalition"]

band_adjectives = ["Electric", "Sonic", "Cosmic", "Atomic", "Neon", "Stellar", "Lunar", "Solar", 
                  "Mystic", "Psychedelic", "Digital", "Analog", "Virtual", "Quantum", "Crystal", "Laser"]

# Generate 20 bands
for i in range(20):
    if random.random() < 0.5:
        band_name = f"{random.choice(band_prefixes)} {random.choice(band_adjectives)} {random.choice(band_names)}"
    else:
        band_name = f"{random.choice(band_prefixes)} {random.choice(band_names)} {random.choice(band_suffixes)}"
    
    # Formation date (1-20 years ago)
    years_ago = random.randint(1, 20)
    formation_year = datetime.now().year - years_ago
    formation_month = random.randint(1, 12)
    formation_day = random.randint(1, 28)  # Simplified
    formation_date = date(formation_year, formation_month, formation_day)
    
    # Some have websites and social media, some don't
    if random.random() < 0.9:
        website = f"https://www.{band_name.lower().replace(' ', '')}.com"
    else:
        website = None
    
    if random.random() < 0.95:
        instagram = f"@{band_name.lower().replace(' ', '')}"
    else:
        instagram = None
    
    band_image = f"bands/{i+1}.jpg"
    band_description = f"{band_name} is a dynamic musical group known for their energetic performances and innovative sound."
    
    query = """
    INSERT INTO Band (band_name, formation_date, website, instagram, band_image, band_description)
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    values = (band_name, formation_date, website, instagram, band_image, band_description)
    
    band_id = insert_and_get_id(query, values)
    band_ids.append(band_id)
    bands.append((band_id, band_name, formation_date))
    print(f"Created band {band_id}: {band_name}")
    
    # Assign 2-4 genres to each band
    num_genres = random.randint(2, 4)
    band_genres = random.sample(all_genres, num_genres)
    
    for genre_name, genre_id in band_genres:
        query = "INSERT INTO BandGenre (band_id, genre_id) VALUES (%s, %s)"
        values = (band_id, genre_id)
        cursor.execute(query, values)
        print(f"Assigned genre {genre_name} to band {band_name}")
    
    # Assign 2-5 artists to each band
    num_artists = random.randint(2, 5)
    band_artists = random.sample(artist_ids, num_artists)
    
    for artist_id in band_artists:
        # Join date (after band formation but before now)
        days_after_formation = random.randint(0, (datetime.now().date() - formation_date).days)
        join_date = formation_date + timedelta(days=days_after_formation)
        
        query = "INSERT INTO ArtistBand (artist_id, band_id, join_date) VALUES (%s, %s, %s)"
        values = (artist_id, band_id, join_date)
        cursor.execute(query, values)
        print(f"Added artist {artist_id} to band {band_name}")
    
    conn.commit()

# Seed data for Staff
print("Creating staff...")
staff_ids = []
staff = []

staff_types = ["technical", "security", "support"]
technical_roles = ["Sound Engineer", "Lighting Technician", "Stage Manager", "Equipment Manager", "Video Technician"]
security_roles = ["Security Guard", "Access Control", "Crowd Manager", "Security Supervisor", "Emergency Response"]
support_roles = ["Usher", "Information Desk", "Merchandise", "Food Service", "Cleaning Crew"]

experience_levels = ["trainee", "beginner", "intermediate", "experienced", "expert"]

# Generate 100 staff members
for i in range(100):
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    
    # Birth date (20-60 years old)
    age = random.randint(20, 60)
    birth_year = datetime.now().year - age
    birth_month = random.randint(1, 12)
    birth_day = random.randint(1, 28)  # Simplified
    birth_date = date(birth_year, birth_month, birth_day)
    
    staff_type = random.choice(staff_types)
    
    if staff_type == "technical":
        role = random.choice(technical_roles)
    elif staff_type == "security":
        role = random.choice(security_roles)
    else:
        role = random.choice(support_roles)
    
    experience_level = random.choice(experience_levels)
    
    staff_image = f"staff/{i+1}.jpg"
    staff_description = f"{first_name} {last_name} is a {experience_level} {role}."
    
    query = """
    INSERT INTO Staff (first_name, last_name, birth_date, staff_type, role, experience_level, staff_image, staff_description)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (first_name, last_name, birth_date, staff_type, role, experience_level, staff_image, staff_description)
    
    staff_id = insert_and_get_id(query, values)
    staff_ids.append(staff_id)
    staff.append((staff_id, first_name, last_name, staff_type, role, experience_level))
    print(f"Created staff {staff_id}: {first_name} {last_name} ({staff_type}, {role})")

# Assign staff to events - we need to maintain minimum requirements based on capacity
print("Assigning staff to events...")
for event_id, event_name, event_date, stage_id, _, _ in events:
    # Find stage capacity
    stage_capacity = 0
    for s_id, _, _, capacity in stages:
        if s_id == stage_id:
            stage_capacity = capacity
            break
    
    # Determine required staff counts
    required_security = max(1, int(stage_capacity * 0.05))  # At least 5% of capacity
    required_support = max(1, int(stage_capacity * 0.02))   # At least 2% of capacity
    required_technical = random.randint(3, 8)  # Technical staff varies less with capacity
    
    # Filter staff by type
    security_staff = [s for s in staff if s[3] == "security"]
    support_staff = [s for s in staff if s[3] == "support"]
    technical_staff = [s for s in staff if s[3] == "technical"]
    
    # Select the required number of each type, with randomness but ensuring we meet minimums
    selected_security = random.sample(security_staff, min(required_security, len(security_staff)))
    selected_support = random.sample(support_staff, min(required_support, len(support_staff)))
    selected_technical = random.sample(technical_staff, min(required_technical, len(technical_staff)))
    
    # Make sure we meet minimums by adding more if needed
    while len(selected_security) < required_security and len(security_staff) > len(selected_security):
        additional = random.choice([s for s in security_staff if s not in selected_security])
        selected_security.append(additional)
    
    while len(selected_support) < required_support and len(support_staff) > len(selected_support):
        additional = random.choice([s for s in support_staff if s not in selected_support])
        selected_support.append(additional)
    
    # Assign all selected staff to the event
    for staff_member in selected_security + selected_support + selected_technical:
        staff_id = staff_member[0]
        
        query = "INSERT INTO StaffAssignment (staff_id, event_id) VALUES (%s, %s)"
        values = (staff_id, event_id)
        
        try:
            cursor.execute(query, values)
            print(f"Assigned staff {staff_id} to event {event_id}")
        except mysql.connector.Error as err:
            print(f"Error assigning staff: {err}")
    
    conn.commit()

# Create ticket categories
print("Creating ticket categories...")
ticket_categories = ["general", "vip", "backstage"]
category_ids = {}

for category in ticket_categories:
    query = "INSERT INTO TicketCategory (category_name) VALUES (%s)"
    values = (category,)
    
    category_id = insert_and_get_id(query, values)
    category_ids[category] = category_id
    print(f"Created ticket category {category_id}: {category}")

# Seed data for Visitors
print("Creating visitors...")
visitor_ids = []
visitors = []

# Generate 100 visitors
for i in range(100):
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    
    email = f"{first_name.lower()}.{last_name.lower()}@{random.choice(['gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com'])}"
    phone = f"+{random.randint(1, 99)}{random.randint(100000000, 999999999)}"
    
    # Birth date (18-70 years old)
    age = random.randint(18, 70)
    birth_year = datetime.now().year - age
    birth_month = random.randint(1, 12)
    birth_day = random.randint(1, 28)  # Simplified
    birth_date = date(birth_year, birth_month, birth_day)
    
    query = """
    INSERT INTO Visitor (first_name, last_name, email, phone, birth_date)
    VALUES (%s, %s, %s, %s, %s)
    """
    values = (first_name, last_name, email, phone, birth_date)
    
    visitor_id = insert_and_get_id(query, values)
    visitor_ids.append(visitor_id)
    visitors.append((visitor_id, first_name, last_name, email, birth_date))
    print(f"Created visitor {visitor_id}: {first_name} {last_name}")

# Create Performances
print("Creating performances...")
performance_ids = []
performances = []
performance_types = ["warm up", "headline", "special guest", "regular"]

# Only create performances for past events
past_events = [e for e in events if e[2] < datetime.now().date()]

for event_id, event_name, event_date, stage_id, event_start, event_end in past_events:
    # Generate 3-6 performances for each event
    num_performances = random.randint(3, 6)
    
    # Determine the order of performances
    performance_order = []
    
    # Always have one headline
    performance_order.append("headline")
    
    # Maybe have a warm up
    if random.random() < 0.7:
        performance_order.insert(0, "warm up")
    
    # Maybe have a special guest
    if random.random() < 0.5:
        # Insert special guest either before or after headline
        if random.random() < 0.5:
            position = performance_order.index("headline")
            performance_order.insert(position, "special guest")
        else:
            position = performance_order.index("headline") + 1
            if position < len(performance_order):
                performance_order.insert(position, "special guest")
            else:
                performance_order.append("special guest")
    
    # Fill the rest with regular performances
    while len(performance_order) < num_performances:
        # Add regular performances after warm up (if exists) and before headline
        headline_pos = performance_order.index("headline")
        warm_up_pos = performance_order.index("warm up") if "warm up" in performance_order else -1
        
        # Place regular performance after warm up (if any) and before headline
        insert_pos = warm_up_pos + 1 if warm_up_pos >= 0 else 0
        if insert_pos >= headline_pos:
            insert_pos = headline_pos
        
        performance_order.insert(insert_pos, "regular")
    
    # Convert event times to minutes for easier calculation
    h_start, m_start, _ = map(int, event_start.split(':'))
    h_end, m_end, _ = map(int, event_end.split(':'))
    
    event_start_minutes = h_start * 60 + m_start
    event_end_minutes = h_end * 60 + m_end
    
    # Calculate available minutes for performances
    available_minutes = event_end_minutes - event_start_minutes
    
    # Allocate time for performances with breaks
    performance_minutes = []
    
    # Headline gets more time
    if "headline" in performance_order:
        headline_minutes = min(180, int(available_minutes * 0.4))  # Maximum 3 hours, about 40% of available time
        available_minutes -= headline_minutes
        performance_minutes.append(headline_minutes)
    
    # Special guest gets second most time
    if "special guest" in performance_order:
        special_guest_minutes = min(120, int(available_minutes * 0.35))  # Maximum 2 hours
        available_minutes -= special_guest_minutes
        performance_minutes.append(special_guest_minutes)
    
    # Warm up gets less time
    if "warm up" in performance_order:
        warm_up_minutes = min(60, int(available_minutes * 0.25))  # Maximum 1 hour
        available_minutes -= warm_up_minutes
        performance_minutes.append(warm_up_minutes)
    
    # Divide remaining time among regular performances
    regular_count = performance_order.count("regular")
    if regular_count > 0:
        regular_minutes_each = min(90, int(available_minutes / regular_count))  # Maximum 1.5 hours each
        for _ in range(regular_count):
            performance_minutes.append(regular_minutes_each)
    
    # Need to match performance_minutes with performance_order
    final_performance_minutes = []
    for perf_type in performance_order:
        if perf_type == "headline":
            final_performance_minutes.append(performance_minutes[0])
            performance_minutes.pop(0)
        elif perf_type == "special guest":
            final_performance_minutes.append(performance_minutes[1 if "headline" in performance_order else 0])
            performance_minutes.pop(0 if "headline" not in performance_order else 1)
        elif perf_type == "warm up":
            final_performance_minutes.append(performance_minutes[-1])
            performance_minutes.pop(-1)
        else:  # regular
            final_performance_minutes.append(performance_minutes[-1])
            performance_minutes.pop(-1)
    
    # Determine start and end times
    current_minutes = event_start_minutes
    performance_times = []
    
    for i, minutes in enumerate(final_performance_minutes):
        start_time_minutes = current_minutes
        end_time_minutes = start_time_minutes + minutes
        
        start_hour = start_time_minutes // 60
        start_minute = start_time_minutes % 60
        end_hour = end_time_minutes // 60
        end_minute = end_time_minutes % 60
        
        start_time = f"{start_hour:02d}:{start_minute:02d}:00"
        end_time = f"{end_hour:02d}:{end_minute:02d}:00"
        
        performance_times.append((start_time, end_time))
        
        # Add break time (5-30 minutes) before next performance
        if i < len(final_performance_minutes) - 1:
            break_minutes = random.randint(5, 30)
            current_minutes = end_time_minutes + break_minutes
    
    # Create performances
    for i, (perf_type, (start_time, end_time)) in enumerate(zip(performance_order, performance_times)):
        # Alternately assign to artists or bands
        if random.random() < 0.6:  # 60% chance it's an artist
            artist_id = random.choice(artist_ids)
            band_id = None
        else:  # 40% chance it's a band
            artist_id = None
            band_id = random.choice(band_ids)
        
        query = """
        INSERT INTO Performance (event_id, performance_type, start_time, end_time, artist_id, band_id)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        values = (event_id, perf_type, start_time, end_time, artist_id, band_id)
        
        try:
            performance_id = insert_and_get_id(query, values)
            performances.append((performance_id, event_id, perf_type, start_time, end_time, artist_id, band_id))
            print(f"Created performance {performance_id}: {perf_type} at event {event_id} ({start_time}-{end_time})")
            performance_ids.append(performance_id)
        except mysql.connector.Error as err:
            print(f"Error creating performance: {err}")
    
    conn.commit()

# Create Tickets
print("Creating tickets...")
ticket_ids = []
tickets = []

payment_methods = ["credit_card", "debit_card", "bank_transfer"]

# Create 200 tickets as required
num_tickets = 200
tickets_created = 0

while tickets_created < num_tickets:
    # Choose a random event (past events only)
    event_id, event_name, event_date, stage_id, _, _ = random.choice(past_events)
    
    # Find stage capacity
    stage_capacity = 0
    for s_id, _, _, capacity in stages:
        if s_id == stage_id:
            stage_capacity = capacity
            break
    
    # Count existing tickets for this event
    cursor.execute("SELECT COUNT(*) FROM Ticket WHERE event_id = %s", (event_id,))
    existing_tickets = cursor.fetchone()[0]
    
    # Skip if the event is at capacity
    if existing_tickets >= stage_capacity:
        continue
    
    # Count existing VIP tickets
    cursor.execute(
        "SELECT COUNT(*) FROM Ticket WHERE event_id = %s AND category_id = %s", 
        (event_id, category_ids["vip"])
    )
    existing_vip = cursor.fetchone()[0]
    
    # Choose a random visitor
    visitor_id = random.choice(visitor_ids)
    
    # Check if visitor already has a ticket for this event
    cursor.execute(
        "SELECT COUNT(*) FROM Ticket WHERE event_id = %s AND visitor_id = %s", 
        (event_id, visitor_id)
    )
    has_ticket = cursor.fetchone()[0] > 0
    
    if has_ticket:
        continue
    
    # Choose a category (with VIP limit)
    category_weights = [70, 20, 10]  # General, VIP, Backstage
    
    # Adjust weights if VIP is at capacity (10% limit)
    if existing_vip >= (stage_capacity * 0.1):
        category_weights[1] = 0
    
    # Normalize weights
    total_weight = sum(category_weights)
    normalized_weights = [w/total_weight for w in category_weights]
    
    # Choose category
    category = random.choices(list(category_ids.keys()), weights=normalized_weights, k=1)[0]
    category_id = category_ids[category]
    
    # Set price based on category
    if category == "general":
        price = random.randint(50, 100)
    elif category == "vip":
        price = random.randint(150, 300)
    else:  # backstage
        price = random.randint(350, 500)
    
    # Generate purchase date (between event announcement and event date)
    festival_id = 0
    for _, _, _, s_id in stages:
        if s_id == stage_id:
            festival_id = s_id
            break
    
    # Find festival start date (as announcement date)
    announcement_date = None
    for f_id, _, start_date, _, _ in festivals:
        if f_id == festival_id:
            # Assume announcement 3 months before
            announcement_date = start_date - timedelta(days=90)
            break
    
    if not announcement_date:
        announcement_date = event_date - timedelta(days=90)
    
    # Random time between announcement and event
    purchase_date = random_date(announcement_date, event_date)
    purchase_time = random_time()
    purchase_datetime = datetime.combine(purchase_date, datetime.strptime(purchase_time, "%H:%M:%S").time())
    
    # Other ticket details
    payment_method = random.choice(payment_methods)
    ean_code = random_ean13()
    is_used = random.random() < 0.9  # 90% of tickets are used
    is_for_resale = False  # Default is not for resale
    
    query = """
    INSERT INTO Ticket (event_id, visitor_id, category_id, purchase_date, price, payment_method, ean_code, is_used, is_for_resale)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (event_id, visitor_id, category_id, purchase_datetime, price, payment_method, ean_code, is_used, is_for_resale)
    
    try:
        ticket_id = insert_and_get_id(query, values)
        ticket_ids.append(ticket_id)
        tickets.append((ticket_id, event_id, visitor_id, category_id, price, is_used))
        print(f"Created ticket {ticket_id} for event {event_id}, visitor {visitor_id}, category {category}")
        tickets_created += 1
    except mysql.connector.Error as err:
        print(f"Error creating ticket: {err}")
    
    conn.commit()

# Add some tickets for resale
for i in range(10):
    ticket_id = random.choice(ticket_ids)
    
    # Only unused tickets can be for resale
    cursor.execute("SELECT is_used FROM Ticket WHERE ticket_id = %s", (ticket_id,))
    is_used = cursor.fetchone()[0]
    
    if not is_used:
        cursor.execute("UPDATE Ticket SET is_for_resale = TRUE WHERE ticket_id = %s", (ticket_id,))
        print(f"Marked ticket {ticket_id} for resale")
        
        # Add to resale queue
        request_date = datetime.now() - timedelta(days=random.randint(1, 30))
        
        query = "INSERT INTO ResaleSellerQueue (ticket_id, request_date, is_sold) VALUES (%s, %s, %s)"
        values = (ticket_id, request_date, False)
        
        cursor.execute(query, values)
        print(f"Added ticket {ticket_id} to resale queue")

# Add some buyers to the resale queue
for i in range(15):
    visitor_id = random.choice(visitor_ids)
    
    # Find an event with sold-out tickets
    cursor.execute("""
    SELECT e.event_id, s.max_capacity, tc.category_id 
    FROM Event e
    JOIN Stage s ON e.stage_id = s.stage_id
    JOIN TicketCategory tc
    WHERE e.event_date > CURDATE()
    LIMIT 1
    """)
    
    result = cursor.fetchone()
    if result:
        event_id, max_capacity, category_id = result
        
        request_date = datetime.now() - timedelta(days=random.randint(1, 15))
        
        query = """
        INSERT INTO ResaleBuyerQueue (visitor_id, event_id, category_id, request_date, is_fulfilled)
        VALUES (%s, %s, %s, %s, %s)
        """
        values = (visitor_id, event_id, category_id, request_date, False)
        
        cursor.execute(query, values)
        print(f"Added visitor {visitor_id} to resale buyer queue for event {event_id}")

# Create Ratings
print("Creating ratings...")
rating_scores = [1, 2, 3, 4, 5]  # Likert scale 1-5

# Only used tickets can rate performances
for ticket_id, event_id, visitor_id, category_id, price, is_used in tickets:
    if not is_used:
        continue
    
    # Find performances for this event
    performances_for_event = [p for p in performances if p[1] == event_id]
    
    if not performances_for_event:
        continue
    
    # Rate 1-3 random performances from the event
    num_ratings = random.randint(1, min(3, len(performances_for_event)))
    rated_performances = random.sample(performances_for_event, num_ratings)
    
    for performance in rated_performances:
        performance_id = performance[0]
        
        # Generate random ratings for each category
        artist_performance = random.choice(rating_scores)
        sound_lighting = random.choice(rating_scores)
        stage_presence = random.choice(rating_scores)
        organization = random.choice(rating_scores)
        overall_impression = random.choice(rating_scores)
        
        query = """
        INSERT INTO Rating (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (ticket_id, performance_id, artist_performance, sound_lighting, stage_presence, organization, overall_impression)
        
        try:
            cursor.execute(query, values)
            print(f"Created rating for ticket {ticket_id}, performance {performance_id}")
        except mysql.connector.Error as err:
            print(f"Error creating rating: {err}")
    
    conn.commit()

# Create Entity Images (additional images for various entities)
print("Creating entity images...")
entity_types = ["Festival", "Stage", "Artist", "Band", "Staff"]

for entity_type in entity_types:
    # Get IDs based on entity type
    if entity_type == "Festival":
        entity_ids = festival_ids
    elif entity_type == "Stage":
        entity_ids = stage_ids
    elif entity_type == "Artist":
        entity_ids = artist_ids
    elif entity_type == "Band":
        entity_ids = band_ids
    else:  # Staff
        entity_ids = staff_ids
    
    # Add 1-3 additional images for some entities
    for entity_id in random.sample(entity_ids, min(len(entity_ids), 20)):
        num_images = random.randint(1, 3)
        
        for i in range(num_images):
            image_path = f"additional/{entity_type.lower()}/{entity_id}_{i+1}.jpg"
            description = f"Additional image {i+1} for {entity_type} ID {entity_id}"
            
            query = """
            INSERT INTO EntityImage (entity_type, entity_id, image_path, description)
            VALUES (%s, %s, %s, %s)
            """
            values = (entity_type, entity_id, image_path, description)
            
            cursor.execute(query, values)
            print(f"Created additional image for {entity_type} {entity_id}")
        
        conn.commit()

print("Data generation complete!")

# Close database connection
cursor.close()
conn.close()