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
    profile(
        id_profile INT AUTO_INCREMENT,
        fname VARCHAR(50),
        lname VARCHAR(50),
        role VARCHAR(50),
        PRIMARY KEY(id_profile)
    );

CREATE TABLE
    company(
        id_company INT AUTO_INCREMENT,
        name VARCHAR(50),
        active BOOLEAN,
        link VARCHAR(500),
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
        zipcode VARCHAR(20),
        PRIMARY KEY(id_city)
    );

CREATE TABLE
    address(
        id_address INT AUTO_INCREMENT,
        name VARCHAR(200),
        number VARCHAR(20),
        comment VARCHAR(300),
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
    skills(
        id_skill INT AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        PRIMARY KEY(id_skill)
    );

CREATE TABLE
    postulate_progress_steps(
        id_progress_state INT AUTO_INCREMENT,
        name VARCHAR(50),
        PRIMARY KEY(id_progress_state),
        UNIQUE(name)
    );

CREATE TABLE
    person(
        id_person INT AUTO_INCREMENT,
        email VARCHAR(100),
        password VARCHAR (100),
        id_profile INT,
        PRIMARY KEY(id_person),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile)
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
        amount VARCHAR(50),
        wage VARCHAR(50),
        comment VARCHAR(500),
        contact_mail VARCHAR(100),
        telphone VARCHAR(15),
        id_localities INT NOT NULL,
        id_activity INT NOT NULL,
        PRIMARY KEY(id_offer),
        FOREIGN KEY(id_localities) REFERENCES localities(id_localities),
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity)
    );

CREATE TABLE
    candidature(
        id_candidature INT AUTO_INCREMENT,
        send_date DATETIME,
        id_progress_state INT NOT NULL,
        id_profile INT NOT NULL,
        id_offer INT NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY(id_progress_state) REFERENCES postulate_progress_steps(id_progress_state),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer)
    );

CREATE TABLE
    affiliated(
        id_profile INT AUTO_INCREMENT,
        id_prom INT,
        PRIMARY KEY(id_profile, id_prom),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile),
        FOREIGN KEY(id_prom) REFERENCES prom(id_prom)
    );

CREATE TABLE
    sector(
        id_company INT AUTO_INCREMENT,
        id_activity INT,
        PRIMARY KEY(id_company, id_activity),
        FOREIGN KEY(id_company) REFERENCES company(id_company),
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity)
    );

CREATE TABLE
    wish(
        id_profile INT AUTO_INCREMENT,
        id_offer INT,
        PRIMARY KEY(id_profile, id_offer),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer)
    );

CREATE TABLE
    rate(
        id_profile INT AUTO_INCREMENT,
        id_company INT,
        rating INT,
        comment VARCHAR(500),
        PRIMARY KEY(id_profile, id_company),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile),
        FOREIGN KEY(id_company) REFERENCES company(id_company)
    );

CREATE TABLE
    require(
        id_offer INT AUTO_INCREMENT,
        id_skill INT,
        level INT NOT NULL,
        PRIMARY KEY(id_offer, id_skill),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer),
        FOREIGN KEY(id_skill) REFERENCES skills(id_skill)
    );

-- Insertion des données dans la table profile

INSERT INTO
    profile (fname, lname, role)
VALUES ('John', 'Doe', 'Developer'), ('Jane', 'Doe', 'Designer'), ('Bob', 'Smith', 'Manager'), (
        'Alice',
        'Johnson',
        'Salesperson'
    );

-- Insertion des données dans la table company

INSERT INTO
    company (name, active, link)
VALUES (
        'ABC Corp',
        true,
        'https://www.abccorp.com'
    ), (
        'XYZ Inc',
        true,
        'https://www.xyzinc.com'
    ), (
        '123 Industries',
        false,
        'https://www.123industries.com'
    );

-- Insertion des données dans la table activity

INSERT INTO activity (name)
VALUES ('Software Development'), ('Graphic Design'), ('Sales and Marketing');

-- Insertion des données dans la table city

INSERT INTO
    city (name, zipcode)
VALUES ('New York', '10001'), ('Los Angeles', '90001'), ('Chicago', '60601');

-- Insertion des données dans la table address

INSERT INTO
    address (name, number, comment, id_city)
VALUES (
        '123 Main St',
        'Suite 100',
        'Office building',
        1
    ), (
        '456 Oak Ave',
        'Floor 2',
        'Creative studio',
        2
    ), (
        '789 Maple Blvd',
        'Unit B',
        'Industrial park',
        3
    );

-- Insertion des données dans la table localities

INSERT INTO
    localities (id_address, id_company)
VALUES (1, 1), (2, 2), (3, 3);

-- Insertion des données dans la table campus

INSERT INTO
    campus (name, id_address)
VALUES ('Main Campus', 1), ('Downtown Campus', 2), ('West Campus', 3);

-- Insertion des données dans la table skills

INSERT INTO skills (name)
VALUES ('Java'), ('Python'), ('SQL'), ('Photoshop'), ('InDesign'), ('Salesforce');

-- Insertion des données dans la table postulate_progress_steps

INSERT INTO
    postulate_progress_steps (name)
VALUES ('New'), ('Reviewed'), ('Interview Scheduled'), ('Interviewed'), ('Offered'), ('Rejected');

-- Insertion des données dans la table person

INSERT INTO
    person (email, password, id_profile)
VALUES (
        'johndoe@example.com',
        'password1',
        1
    ), (
        'janedoe@example.com',
        'password2',
        2
    ), (
        'bobsmith@example.com',
        'password3',
        3
    ), (
        'alicejohnson@example.com',
        'password4',
        4
    );

-- Insertion des données dans la table prom

INSERT INTO
    prom (name, id_campus)
VALUES ('Class of 2022', 1), ('Class of 2023', 2), ('Class of 2024', 3);

-- Insertion de données dans la table "offer"

INSERT INTO
    offer(
        name,
        active,
        startdate,
        period,
        amount,
        wage,
        comment,
        contact_mail,
        telphone,
        id_localities,
        id_activity
    )
VALUES (
        'Développeur Full Stack',
        true,
        '2023-01-01',
        '3 mois',
        '1500€',
        '35k€',
        'Poste à pourvoir dès maintenant',
        'contact@entreprise1.com',
        '+33 6 12 34 56 78',
        1,
        1
    ), (
        'Assistant Chef de projet',
        true,
        '2023-02-01',
        '6 mois',
        '1000€',
        '28k€',
        'Poste à pourvoir dès septembre',
        'contact@entreprise2.com',
        '+33 6 98 76 54 32',
        2,
        2
    ), (
        'Responsable Marketing Digital',
        false,
        '2023-03-01',
        '12 mois',
        '2500€',
        '50k€',
        'Poste à pourvoir dans 3 mois',
        'contact@entreprise3.com',
        '+33 6 55 44 33 22',
        3,
        3
    );

-- Vérification des données dans la table "offer"

SELECT * FROM offer;