CREATE DATABASE alien_data;

USE alien_data;

CREATE TABLE ufo_sightings (
    id INT NOT NULL AUTO_INCREMENT,
    state_long VARCHAR(40) NULL,
    state_short VARCHAR(2) NULL,
    city_state VARCHAR(50) NULL,
    mj_legal VARCHAR(3) NULL,
    latitude DECIMAL(10, 8) NULL,
    longitude DECIMAL(11,9) NULL,
    sighting_date DATE NULL,
    short_description VARCHAR(250) NULL,
    PRIMARY KEY (id)
);

SELECT * FROM ufo_sightings;