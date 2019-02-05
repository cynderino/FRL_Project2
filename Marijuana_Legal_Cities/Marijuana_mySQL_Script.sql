USE FRL_Project2_db;

CREATE TABLE mj_legalstates (
    id MEDIUMINT NOT NULL AUTO_INCREMENT,
    state VARCHAR(15) Null,
    marijuana_legal VARCHAR(3),
    PRIMARY KEY (id)
);

SELECT * FROM mj_legalstates