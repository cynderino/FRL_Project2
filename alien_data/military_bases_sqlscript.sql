USE alien_data;

CREATE TABLE military_bases (
    id INT NOT NULL AUTO_INCREMENT,
    state_long VARCHAR(40) NULL,
    state_short VARCHAR(2) NULL,
    mil_base_name VARCHAR(100) NULL,
    operational_status VARCHAR(10) NULL,
    component VARCHAR(50) NULL,
    latitude DECIMAL(10, 8) NULL,
    longitude DECIMAL(11,9) NULL,
    country VARCHAR(15) NULL,    
    PRIMARY KEY (id)
);

SELECT * FROM military_bases;

