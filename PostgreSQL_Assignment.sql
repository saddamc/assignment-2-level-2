-- Active: 1747496095661@@127.0.0.1@5432@conservation_db@public
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
)

INSERT INTO rangers(name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Stone', 'Western Forest'),
('Ella Brooks', 'Savannah Edge'),
('Frank Doyle', 'Coastal Plains'),
('Grace Lee', 'Highland Peaks'),
('Henry Cole', 'Sunset Valley'),
('Ivy Chen', 'Rainforest Core'),
('Jack Nolan', 'Canyon Rim');

DROP TABLE rangers;  -- this line need delete when submitting the assignment

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_data DATE NOT NULL,
    conservation_status VARCHAR(100) NOT NULL
)

INSERT INTO species(common_name, scientific_name, discovery_data, conservation_status) VALUES
('Shadow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Golden Langur', 'Trachypithecus geei', '1953-01-01', 'Endangered'),
('Snowy Owl', 'Bubo scandiacus', '1758-01-01', 'Least Concern'),
('Blackbuck', 'Antilope cervicapra', '1758-01-01', 'Near Threatened'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern')

SELECT * FROM species; -- this line need delete when submitting the assignment
DROP TABLE species; -- this line need delete when submitting the assignment

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES species(species_id),
    ranger_id INT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    location TEXT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
)


DROP TABLE sightings; -- this line need delete when submitting the assignment

INSERT INTO sightings (ranger_id, species_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL),
(4, 4, 'Forest Bend',       '2024-05-19 06:50:00', 'Seen in small herd'),
(5, 5, 'River Bend',        '2024-05-20 14:05:00', 'Tracks found near water'),
(6, 6, 'Western Cliff',     '2024-05-21 08:00:00', 'Solo adult observed'),
(7, 7, 'Eastern Plains',    '2024-05-22 12:45:00', 'Running with group'),
(8, 8, 'Hilltop Trail',     '2024-05-23 17:30:00', 'Dug burrow'),
(9, 9, 'Lowland Marsh',     '2024-05-24 10:15:00', 'Visible for 2 minutes')


-- 1
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains')


-- 2
SELECT count(*) as upique_species_count FROM species;

-- 3
SELECT * FROM sightings 
    WHERE location LIKE '%Pass%';

-- 4
SELECT name, count(*) as total_sightings FROM rangers 
    JOIN sightings ON rangers.ranger_id = sightings.ranger_id 
    GROUP BY name;

 -- 5
SELECT common_name FROM species
    FULL JOIN sightings ON species.species_id = sightings.species_id
    WHERE sightings.sighting_id IS NULL;


-- 6
SELECT common_name, sighting_time, name FROM sightings
    JOIN species ON sightings.species_id = species.species_id
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
    ORDER BY sighting_time DESC
    LIMIT 2;

-- 7
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_data) < 1800;

-- 8
SELECT sighting_id,
    CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE  'Evening'
    END as time_of_day
    FROM sightings
    ORDER BY sighting_time;

-- 9 
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);

-- 10






SELECT * from rangers; -- this line need delete when submitting the assignment
SELECT * from species; -- this line need delete when submitting the assignment
SELECT * from sightings; -- this line need delete when submitting the assignment



