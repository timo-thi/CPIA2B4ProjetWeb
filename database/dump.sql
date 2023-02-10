-- Active: 1676037260035@@34.155.23.247@3306@webdata

SET FOREIGN_KEY_CHECKS = 0;

SET GROUP_CONCAT_MAX_LEN=32768;

SET @tables = NULL;

SELECT
    GROUP_CONCAT('', table_name, '') INTO @tables
FROM
    information_schema.tables
WHERE table_schema = (
        SELECT DATABASE()
    );

SELECT IFNULL(@tables,'dummy') INTO @tables;

SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);

PREPARE stmt FROM @tables;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE
    person(
        id_person INT AUTO_INCREMENT,
        email VARCHAR(50),
        password VARCHAR(50),
        role VARCHAR(50),
        PRIMARY KEY(id_person)
    );

CREATE TABLE
    company(
        id_company INT AUTO_INCREMENT,
        name VARCHAR(50),
        active BOOLEAN,
        PRIMARY KEY(id_company)
    );

CREATE TABLE
    activity(
        id_activity INT AUTO_INCREMENT,
        name VARCHAR(50),
        PRIMARY KEY(id_activity)
    );

CREATE TABLE
    city(
        id_city INT AUTO_INCREMENT,
        name VARCHAR(50),
        code INT,
        PRIMARY KEY(id_city)
    );

CREATE TABLE
    address(
        id_address INT AUTO_INCREMENT,
        name VARCHAR(50),
        id_city INT NOT NULL,
        PRIMARY KEY(id_address),
        FOREIGN KEY(id_city) REFERENCES city(id_city)
    );

CREATE TABLE
    localities(
        id_localities INT AUTO_INCREMENT,
        id_address INT NOT NULL,
        id_company INT NOT NULL,
        PRIMARY KEY(id_localities),
        FOREIGN KEY(id_address) REFERENCES address(id_address),
        FOREIGN KEY(id_company) REFERENCES company(id_company)
    );

CREATE TABLE
    campus(
        id_campus INT AUTO_INCREMENT,
        name VARCHAR(50),
        id_address INT NOT NULL,
        PRIMARY KEY(id_campus),
        FOREIGN KEY(id_address) REFERENCES address(id_address)
    );

CREATE TABLE
    prom(
        id_prom INT AUTO_INCREMENT,
        name VARCHAR(50),
        id_campus INT NOT NULL,
        PRIMARY KEY(id_prom),
        FOREIGN KEY(id_campus) REFERENCES campus(id_campus)
    );

CREATE TABLE
    offer(
        id_offer INT AUTO_INCREMENT,
        name VARCHAR(50),
        active BOOLEAN,
        startdate DATE,
        period VARCHAR(50),
        skills VARCHAR(50),
        amount VARCHAR(50),
        wage VARCHAR(50),
        id_localities INT NOT NULL,
        id_activity INT NOT NULL,
        PRIMARY KEY(id_offer),
        FOREIGN KEY(id_localities) REFERENCES localities(id_localities),
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity)
    );

CREATE TABLE
    affiliated(
        id_person INT,
        id_prom INT,
        PRIMARY KEY(id_person, id_prom),
        FOREIGN KEY(id_person) REFERENCES person(id_person),
        FOREIGN KEY(id_prom) REFERENCES prom(id_prom)
    );

CREATE TABLE
    sector(
        id_company INT,
        id_activity INT,
        PRIMARY KEY(id_company, id_activity),
        FOREIGN KEY(id_company) REFERENCES company(id_company),
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity)
    );

CREATE TABLE
    postulate(
        id_person INT,
        id_offer INT,
        cv VARCHAR(50),
        motivation VARCHAR(50),
        progress BOOLEAN,
        PRIMARY KEY(id_person, id_offer),
        FOREIGN KEY(id_person) REFERENCES person(id_person),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer)
    );

CREATE TABLE
    wish(
        id_person INT,
        id_offer INT,
        PRIMARY KEY(id_person, id_offer),
        FOREIGN KEY(id_person) REFERENCES person(id_person),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer)
    );

CREATE TABLE
    feedback(
        id_person INT,
        id_company INT,
        rate INT,
        comment VARCHAR(50),
        PRIMARY KEY(id_person, id_company),
        FOREIGN KEY(id_person) REFERENCES person(id_person),
        FOREIGN KEY(id_company) REFERENCES company(id_company)
    );
