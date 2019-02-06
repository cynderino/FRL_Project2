USE alien_data;

CREATE TABLE states (
    id INT NOT NULL AUTO_INCREMENT,
    state_long VARCHAR(40) NULL,
    state_short VARCHAR(2) NULL,
    PRIMARY KEY (id)
);

SELECT * FROM states;