-- ============================================================
-- Three tables (rangers, species, sightings) have Been created.
-- ============================================================

-- create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- create sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    location VARCHAR(150) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

-- =============================================================================
-- Sample data has been inserted into the tables (rangers, species, sightings).
-- =============================================================================

-- insert into rangers
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');
--SELECT * FROM rangers;

-- insert into species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
--SELECT * FROM species;

-- insert into sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);
--SELECT * FROM sightings;

-- ======================================
-- PostgreSQL Problems & Sample Outputs
-- ======================================

-- Problem 1
-- Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');


-- Problem 2
-- Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


-- Problem 3
-- Find all sightings where the location includes "Pass".
SELECT *
FROM sightings
WHERE location ILIKE '%Pass%';


-- Problem 4
-- List each ranger's name and their total number of sightings.
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;


-- Problem 5
-- List species that have never been sighted.
SELECT common_name
FROM species
WHERE species_id NOT IN (
    SELECT DISTINCT species_id FROM sightings
);


-- Problem 6
-- Show the most recent 2 sightings.
SELECT sc.common_name, st.sighting_time, rg.name
FROM sightings st
JOIN species sc ON st.species_id = sc.species_id
JOIN rangers rg ON st.ranger_id = rg.ranger_id
ORDER BY st.sighting_time DESC
LIMIT 2;


-- Problem 7
-- Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


-- Problem 8
-- Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


-- Problem 9
--Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);