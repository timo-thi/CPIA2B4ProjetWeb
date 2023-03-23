

use web;


-- Drop tables if exists

drop table if exists wish;

drop table if exists requires;

drop table if exists rate;

drop table if exists sector;

drop table if exists candidature;

drop table if exists postulate_progress_steps;

drop table if exists offer;

drop table if exists skills;

drop table if exists localities;

drop table if exists company;

drop table if exists activity;

drop table if exists affiliated;

drop table if exists person;

drop table if exists profile;

drop table if exists prom;

drop table if exists campus;

drop table if exists address;

drop table if exists city;

drop table if exists roles;

-- Create table roles

CREATE TABLE
    roles(
        id_roles INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100)
    );

-- Create table profile

CREATE TABLE
    profile (
        id_profile INT AUTO_INCREMENT PRIMARY KEY,
        fname VARCHAR(50),
        lname VARCHAR(50),
        id_roles INT,
        photo VARCHAR(255),
        FOREIGN KEY(id_roles) REFERENCES roles(id_roles) ON DELETE SET NULL
    );

-- Create table company

CREATE TABLE
    company (
        id_company INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        active BOOLEAN,
        link VARCHAR(500)
    );

-- Create table activity

CREATE TABLE
    activity (
        id_activity INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50)
    );

-- Create table city

CREATE TABLE
    city (
        id_city INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        zipcode VARCHAR(20)
    );

-- Create table address

CREATE TABLE
    address (
        id_address INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(200),
        number VARCHAR(20),
        comment VARCHAR(300),
        id_city INT,
        FOREIGN KEY(id_city) REFERENCES city(id_city) ON DELETE CASCADE
    );

-- Create table localities

CREATE TABLE
    localities (
        id_localities INT AUTO_INCREMENT PRIMARY KEY,
        id_address INT NOT NULL,
        id_company INT NOT NULL,
        FOREIGN KEY(id_address) REFERENCES address(id_address) ON DELETE CASCADE,
        FOREIGN KEY(id_company) REFERENCES company(id_company) ON DELETE CASCADE
    );

-- Create table campus

CREATE TABLE
    campus (
        id_campus INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        id_address INT,
        FOREIGN KEY(id_address) REFERENCES address(id_address) ON DELETE SET NULL
    );

-- Create table skills

CREATE TABLE
    skills (
        id_skill INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );

-- Create table postulate progress steps

CREATE TABLE
    postulate_progress_steps(
        id_progress_state INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        UNIQUE(name)
    );

-- Create table person

CREATE TABLE
    person(
        id_person INT AUTO_INCREMENT PRIMARY KEY,
        email VARCHAR(255),
        password VARCHAR(255),
        id_profile INT NOT NULL,
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile) ON DELETE CASCADE
    );

-- Create table prom

CREATE TABLE
    prom(
        id_prom INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        id_campus INT,
        FOREIGN KEY(id_campus) REFERENCES campus(id_campus)
    );

-- Create table offer

CREATE TABLE
    offer(
        id_offer INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        active BOOLEAN,
        startdate DATE,
        period VARCHAR(50),
        amount VARCHAR(50),
        wage VARCHAR(50),
        comment VARCHAR(500),
        contact_mail VARCHAR(100),
        telephone VARCHAR(15),
        link VARCHAR(1024),
        id_localities INT,
        id_activity INT,
        FOREIGN KEY(id_localities) REFERENCES localities(id_localities) ON DELETE SET NULL,
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity) ON DELETE SET NULL
    );

-- Create table candidature

CREATE TABLE
    candidature(
        id_candidature INT AUTO_INCREMENT PRIMARY KEY,
        send_date DATE,
        id_progress_state INT,
        id_profile INT NOT NULL,
        id_offer INT,
        FOREIGN KEY(id_progress_state) REFERENCES postulate_progress_steps(id_progress_state) ON DELETE SET NULL,
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile) ON DELETE CASCADE,
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer) ON DELETE CASCADE
    );

-- Create table affiliated

CREATE TABLE
    affiliated(
        id_profile INT,
        id_prom INT,
        PRIMARY KEY(id_profile,id_prom),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile) ON DELETE CASCADE,
        FOREIGN KEY(id_prom) REFERENCES prom(id_prom) ON DELETE CASCADE
    );

-- Create table sector

CREATE TABLE
    sector(
        id_company INT,
        id_activity INT,
        PRIMARY KEY(id_company,id_activity),
        FOREIGN KEY(id_company) REFERENCES company(id_company) ON DELETE CASCADE,
        FOREIGN KEY(id_activity) REFERENCES activity(id_activity) ON DELETE CASCADE
    );

-- Create table wish

CREATE TABLE
    wish(
        id_profile INT,
        id_offer INT,
        PRIMARY KEY(id_profile,id_offer),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile) ON DELETE CASCADE,
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer) ON DELETE CASCADE
    );

-- Create table rate

CREATE TABLE
    rate(
        id_profile INT,
        id_company INT,
        rating INT,
        comment VARCHAR(500),
        PRIMARY KEY(id_profile,id_company),
        FOREIGN KEY(id_profile) REFERENCES profile(id_profile) ON DELETE CASCADE,
        FOREIGN KEY(id_company) REFERENCES company(id_company) ON DELETE CASCADE
    );

-- Create table requires

CREATE TABLE
    requires(
        id_offer INT,
        id_skill INT,
        level INT NOT NULL,
        PRIMARY KEY(id_offer,id_skill),
        FOREIGN KEY(id_offer) REFERENCES offer(id_offer) ON DELETE CASCADE,
        FOREIGN KEY(id_skill) REFERENCES skills(id_skill) ON DELETE CASCADE
    );

-- Insert data into roles

INSERT INTO
	roles (name)
VALUES ('admin'), ('pilote'), ('etudiant');


-- Insert data into profile

INSERT INTO
    profile (fname, lname, id_roles, photo)
VALUES ('John', 'Doe', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416535422439476/image.png'), 
    ('Jane', 'Doe', 2,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416604963995688/image.png'), 
    ('Bob', 'Smith', 3,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416755052978186/image.png'), 
    ('Alice', 'Johnson', 3,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416880332636160/image.png'), 
    ('Baptiste', 'Quiadelavenne', 2,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'), 
    ('Timothee', 'Quiestduboncote', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416367771918427/image.png'), 
    ('Damian', 'Roulant', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088419274667864064/image.png'), 
    ('Elza', 'Quiestduboncote', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088419363301883934/image.png'), 
    ('Miriam', 'Tienpond', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088419553874300958/image.png'), 
    ('Hubert', 'Lereal', 1,'https://cdn.discordapp.com/attachments/1088413788342071388/1088416604963995688/image.png');

-- Insert data into activity

INSERT INTO activity (name)
VALUES ('Software Development'), ('Graphic Design'), ('Human Resources'), ('Marketing');

-- Insert data into city

INSERT INTO
    city (name, zipcode)
VALUES ('New York', '10001'), ('San Francisco', '94103'), ('Los Angeles', '90001'), ('Seattle', '98101');

-- Insert data into company

INSERT INTO
    company (name, active, link)
VALUES (
        'Google',
        TRUE,
        'https://www.google.com/'
    ), (
        'Microsoft',
        TRUE,
        'https://www.microsoft.com/'
    ), (
        'Amazon',
        FALSE,
        'https://www.amazon.com/'
    ), (
        'Apple',
        TRUE,
        'https://www.apple.com/'
    );

-- Insert data into address

INSERT INTO
    address (name, number, comment, id_city)
VALUES (
        '123 Main St',
        'Suite 100',
        'Headquarters',
        1
    ), (
        '456 1st Ave',
        'Floor 2',
        NULL,
        2
    ), ('789 Broadway', NULL, NULL, 3), (
        '1010 2nd St',
        NULL,
        'Office',
        4
    );

-- Insert data into localities

INSERT INTO
    localities (id_address, id_company)
VALUES (1, 1), (2, 2), (3, 3), (4, 4);

-- Insert data into campus

INSERT INTO
    campus (name, id_address)
VALUES ('NYC Campus', 1), ('SF Campus', 2), ('LA Campus', 3), ('Seattle Campus', 4);

-- Insert data into skills

INSERT INTO skills (name)
VALUES ('Java'), ('Photoshop'), ('Leadership'), ('SEO');

--

-- Insertion des données dans la table activity

INSERT INTO activity (name)
VALUES ('Informatique'), ('Marketing'), ('Finance'), ('Ressources Humaines'), ('Vente');

-- Insertion des données dans la table city

INSERT INTO
    city (name, zipcode)
VALUES ('Paris', '75001'), ('Lyon', '69001'), ('Marseille', '13001');

-- Insertion des données dans la table address

INSERT INTO
    address (name, number, comment, id_city)
VALUES (
        '1 Rue de Rivoli',
        '2ème étage',
        'Bâtiment A',
        1
    ), (
        '12 Rue Victor Hugo',
        NULL,
        'Entrée C',
        2
    ), (
        '8 Avenue du Prado',
        NULL,
        'Bâtiment B',
        3
    );

-- Insertion des données dans la table localities

INSERT INTO
    localities (id_address, id_company)
VALUES (1, 1), (2, 2), (3, 3);

-- Insertion des données dans la table campus

INSERT INTO
    campus (name, id_address)
VALUES ('Campus Paris', 1), ('Campus Lyon', 2), ('Campus Marseille', 3);

-- Insertion des données dans la table skills

INSERT INTO skills (name)
VALUES ('Java'), ('Python'), ('SQL'), ('Marketing digital'), ('Gestion de projet'), ('Anglais');

-- Insertion des données dans la table postulate_progress_steps

INSERT INTO
    postulate_progress_steps (name)
VALUES ('CV reçu'), ('Présélection'), ('Entretien téléphonique'), ('Entretien en personne'), ('Offre faite'), ('Acceptée'), ('Refusée');

-- Insertion des données dans la table person

INSERT INTO
    person (email, password, id_profile)
VALUES (
        'alice.dupont@example.com',
        'alice123',
        1
    ), (
        'bob.martin@example.com',
        'bob123',
        2
    ), (
        'camille.lefebvre@example.com',
        'camille123',
        3
    ), (
        'david.garcia@example.com',
        'david123',
        4
    ), (
        'emilie.dujardin@example.com',
        'emilie123',
        5
    );

-- Insertion des données dans la table prom

INSERT INTO
    prom (name, id_campus)
VALUES ('Promo 2022', 1), ('Promo 2023', 2), ('Promo 2024', 3);

-- Insertion des données dans la table company

INSERT INTO
    company (name, active, link)
VALUES (
        'Google',
        true,
        'https://www.google.com/'
    ), (
        'Facebook',
        true,
        'https://www.facebook.com/'
    ), (
        'Microsoft',
        false,
        'https://www.microsoft.com/'
    );

-- Insertion des données dans la table offer

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
        telephone,
        link,
        id_localities,
        id_activity
    )
VALUES (
        'Développeur Web',
        true,
        '2022-05-01',
        '6 mois',
        '4000 €',
        '35 €/h',
        'CDI après la période d''essai',
        'contact@entreprise.com',
        '0102030405',
        'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378',
        1,
        1
    ), (
        'Assistant RH',
        true,
        '2022-04-15',
        '3 mois',
        '2200 €',
        null,
        null,
        'rh@entreprise.com',
        '0607080910',
        'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378',
        2,
        2
    ), (
        'Chargé de communication',
        false,
        '2022-06-01',
        '6 mois',
        '3800 €',
        '30 €/h',
        'CDD pour remplacement maladie',
        'communication@entreprise.com',
        '0504030201',
        'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378',
        3,
        3
    ), (
        'Chef de projet',
        true,
        '2022-03-15',
        '12 mois',
        '5000 €',
        '40 €/h',
        null,
        'projet@entreprise.com',
        '0102030405',
        'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378',
        4,
        4
    ), (
        'Architecte logiciel',
        true,
        '2022-05-01',
        '18 mois',
        '6000 €',
        '50 €/h',
        'Mission chez un client important',
        'contact@entreprise.com',
        '0607080910',
        'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378',
        1,
        1
    );

-- Insertion des données dans la table candidature

INSERT INTO
    candidature(
        send_date,
        id_progress_state,
        id_profile,
        id_offer
    )
VALUES ('2022-02-20', 1, 1, 1), ('2022-02-22', 1, 2, 1), ('2022-02-25', 2, 3, 1), ('2022-03-01', 1, 4, 1), ('2022-03-03', 2, 5, 1), ('2022-03-06', 1, 6, 1), ('2022-03-10', 3, 7, 1), ('2022-03-12', 1, 8, 1), ('2022-03-14', 2, 9, 1), ('2022-02-23', 1, 2, 2), ('2022-02-28', 2, 3, 2), ('2022-03-06', 1, 4, 2), ('2022-03-08', 1, 5, 2), ('2022-03-12', 2, 6, 2);

-- Insertion des données dans la table affiliated

INSERT INTO
    affiliated (id_profile, id_prom)
VALUES (1, 1), (2, 1), (3, 1), (4, 2), (5, 2);

-- Insertion des données dans la table sector

INSERT INTO
    sector (id_company, id_activity)
VALUES (1, 1), (1, 3), (2, 2), (2, 4), (3, 1), (3, 2), (4, 4);

-- Insertion des données dans la table wish

INSERT INTO
    wish (id_profile, id_offer)
VALUES (1, 2), (2, 1), (3, 3), (4, 5);

-- Insertion des données dans la table rate

INSERT INTO
    rate (
        id_profile,
        id_company,
        rating,
        comment
    )
VALUES (1, 1, 4, 'Bonne entreprise'), (
        2,
        1,
        4,
        'Très bonne entreprise, j\'ai apprécié travailler ici'
    ), (
        3,
        2,
        5,
        'Très bonne entreprise'
    ), (
        4,
        3,
        3,
        'Assez bonne entreprise'
    ), (
        5,
        3,
        4,
        'Entreprise exceptionnelle, je suis très satisfait(e) de mon expérience'
    );

-- Insertion de données dans la table `requires`

INSERT INTO
    requires (id_offer, id_skill, level)
VALUES (1, 1, 3), (1, 3, 2), (2, 2, 1), (2, 3, 3), (3, 1, 2), (3, 2, 1), (4, 4, 3), (4, 2, 2), (5, 1, 1), (5, 5, 2);
