USE FRL_Project2_db;

CREATE TABLE ufo_sightings (
    id MEDIUMINT NOT NULL AUTO_INCREMENT,
    date_submitted DATE NOT NULL,
    date_of_sighting DATE NOT NULL,
    city VARCHAR(50) NULL,
    state VARCHAR(2) Null,
    short_description VARCHAR(250),
    PRIMARY KEY (id)
);



SELECT * FROM ufo_sightings;