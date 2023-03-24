

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

DROP PROCEDURE IF EXISTS AUTH;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH`()
BEGIN
	SELECT email, password FROM person;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_WISH;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_WISH`(p_id_profile INT, p_id_offer INT)
BEGIN
delete from wish
where id_profile = p_id_profile and id_offer = p_id_offer;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_PILOTS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PILOTS`()
BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS FIND_CANDIDATURE;

DELIMITER //

CREATE PROCEDURE FIND_CANDIDATURE(p_id_profile INT)
BEGIN
	SELECT id_progress_state, send_date, candidature.id_offer, name, company, city, zipcode
	FROM profile
		LEFT JOIN candidature ON profile.id_profile = candidature.id_profile
		LEFT JOIN VIEW_OFFER ON VIEW_OFFER.id_offer = candidature.id_offer
	where profile.id_profile = p_id_profile;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_PROM;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_PROM`(p_id_prom INT)
BEGIN
DELETE FROM prom
	WHERE id_prom = p_id_prom;
END//
DELIMITER ;
DROP PROCEDURE if EXISTS UPDATE_COMPANY;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_COMPANY`(p_id_company INT, p_name VARCHAR(255), p_active BOOL, p_link VARCHAR(255))
BEGIN
UPDATE company
set name = p_name, active = p_active, link = p_link
where id_company = p_id_company;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS CREATION_WISH;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_WISH`(p_id_profile INT, p_id_offer INT)
BEGIN
insert into wish (id_profile,id_offer) values (p_id_profile,p_id_offer);
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SELECT_PROM;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PROM`()
BEGIN
	select * from prom;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_SKILLS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_SKILLS`(p_id_skill INT)
BEGIN
DELETE FROM skills
	WHERE id_skill = p_id_skill;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS UPDATE_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_OFFER`(
	p_id_offer INT,
	p_name VARCHAR(50),
	p_active BOOLEAN,
	p_startdate DATE,
	p_period VARCHAR(50),
	p_amount VARCHAR(50),
	p_wage VARCHAR(50),
	p_comment VARCHAR(500),
	p_contact_mail VARCHAR(100),
	p_telephone VARCHAR(15),
	p_id_localities INT,
	p_id_activity INT)
BEGIN
	UPDATE offer
	SET name = p_name, active = p_active, startdate = p_startdate , period = p_period, amount = p_amount, wage = p_wage,
	comment = p_comment, contact_mail = p_contact_mail, telephone = p_telephone, id_localities = p_id_localities,
	id_activity = p_id_activity
	WHERE id_offer = p_id_offer;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_CANDIDATURE;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_CANDIDATURE`(p_id_candidature INT, p_send_date DATE, p_id_progress_state INT, p_id_profile INT, p_id_offer INT)
BEGIN
update candidature
set send_date = p_send_date ,id_progress_state = p_id_progress_state, id_profile = p_id_profile, id_offer = p_id_offer
where id_candidature = p_id_candidature;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS DETAILS_STUDENT;

DELIMITER //

CREATE PROCEDURE DETAILS_STUDENT(p_id_profile INT)
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS DETAILS_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PROFILE`(p_id_profile INT)
BEGIN
	SELECT profile.id_profile, profile.fname, profile.lname, roles.id_roles, roles.name as role, prom.id_prom, prom.name as promo, campus.id_campus, campus.name as campus, city.name as city
	FROM profile
	INNER JOIN affiliated ON profile.id_profile = affiliated.id_profile
	INNER JOIN prom ON affiliated.id_prom = prom.id_prom
	INNER JOIN campus ON prom.id_campus = campus.id_campus
	INNER JOIN address ON campus.id_address = address.id_address
	INNER JOIN city ON address.id_city = city.id_city
	inner join roles on profile.id_roles = roles.id_roles
	WHERE profile.id_profile = p_id_profile;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_CAMPUS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CAMPUS`(p_id_campus INT)
BEGIN
DELETE FROM campus
	WHERE id_campus = p_id_campus;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROFILE`()
BEGIN
SELECT profile.id_profile, profile.fname, profile.lname, person.id_person, person.email, prom.id_prom, prom.name as prom, if(accepted.cnt is null, 'n', 'y') as accepted FROM profile
    left join affiliated on profile.id_profile = affiliated.id_profile
    left join prom on affiliated.id_prom = prom.id_prom
    left join person on profile.id_profile = person.id_profile
    LEFT JOIN (
        select profile.id_profile, count(candidature.id_progress_state) as cnt from profile
            inner join candidature on candidature.id_profile = profile.id_profile
        where candidature.id_progress_state = 6
        group by profile.id_profile)
            as accepted on accepted.id_profile = profile.id_profile;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PROFILE`()
BEGIN
	select * from profile;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SEARCH_PROM;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROM`(p_id_profile INT)
BEGIN
select prom.id_prom,prom.name,campus.id_campus,campus.name as campus,address.id_address
from prom
inner join affiliated on prom.id_prom = affiliated.id_prom
inner join campus on prom.id_campus = campus.id_campus
inner join address on campus.id_address = address.id_address
where affiliated.id_profile = p_id_profile;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_ACTIVITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ACTIVITY`()
BEGIN
	select * from activity;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_SKILLS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_SKILLS`()
BEGIN
	select * from skills;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_POSTULATE_PROGRESS_STEPS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_POSTULATE_PROGRESS_STEPS`()
BEGIN
	select * from postulate_progress_steps;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS FIND_WISH;

DELIMITER //

CREATE PROCEDURE FIND_WISH(p_id_profile INT)
BEGIN
	SELECT wish.id_offer, name, company, city, zipcode
	FROM profile
		LEFT JOIN wish ON profile.id_profile = wish.id_profile
		LEFT JOIN VIEW_OFFER ON VIEW_OFFER.id_offer = wish.id_offer
	where profile.id_profile = p_id_profile;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROFILE`(
	p_fname VARCHAR(50),
	p_lname VARCHAR(50),
	p_id_roles INT,
	p_email VARCHAR(255),
	p_password VARCHAR(255),
	p_id_profile INT,
	p_name VARCHAR(50)
)
BEGIN
	UPDATE profile
		SET fname = p_fname, lname = p_lname, id_roles = p_id_roles
	WHERE profile.id_profile = p_id_profile;
	UPDATE person
		SET email = p_email, password = p_password
	WHERE person.id_profile = p_id_profile;
		SET @temp = (select id_prom from prom
	WHERE name = p_name);
	UPDATE affiliated
		SET id_prom = @temp
	WHERE affiliated.id_profile=p_id_profile;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_SECTOR;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_SECTOR`(p_id_company INT, p_id_activity INT)
BEGIN
insert into sector (id_company,id_activity) values (p_id_company,p_id_activity);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_STUDENT;

DELIMITER //

CREATE PROCEDURE SEARCH_STUDENT()
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_LOCALITIES;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_LOCALITIES`(p_id_localities INT)
BEGIN
DELETE FROM localities
	WHERE id_localities = p_id_localities;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_ADDRESS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ADDRESS`(p_id_address INT)
BEGIN
DELETE FROM address
	WHERE id_address = p_id_address;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS DETAILS_PILOTS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PILOTS`(p_id_profile INT)
BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_CAMPUS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CAMPUS`()
BEGIN
	select * from campus;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_POSTULATE_PROGRESS_STEPS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_POSTULATE_PROGRESS_STEPS`(p_id_progress_state INT)
BEGIN
DELETE FROM postulate_progress_steps
	WHERE id_progress_state = p_id_progress_state;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_ROLES;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ROLES`(p_id_roles INT)
BEGIN
DELETE FROM roles
	WHERE id_roles = p_id_roles;

END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_RATE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_RATE`(p_id_company INT)
BEGIN
	select rate.comment, rate.rating
	from rate
	inner join company on rate.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_ADDRESS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ADDRESS`(p_name VARCHAR(255), p_number INT, p_comment VARCHAR(255), p_id_city INT)
BEGIN
insert into address (name,number,comment,id_city) values (p_name,p_number,p_comment,p_id_city);
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS CREATION_RATE;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_RATE`(p_id_profile INT, p_id_company INT, p_rating INT, p_comment VARCHAR(500))
BEGIN
insert into rate (id_profile,id_company,rating,comment) values (p_id_profile,p_id_company,p_rating,p_comment);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_SKILLS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_SKILLS`(p_id_offer INT)
BEGIN
	select skills.name
	from skills
	inner join requires on skills.id_skill = requires.id_skill
	where requires.id_offer = p_id_offer;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_CANDIDATURE;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_CANDIDATURE`(p_send_date DATE, p_id_progress_state INT, p_id_profile INT, p_id_offer INT)
BEGIN
insert into candidature (send_date,id_progress_state,id_profile,id_offer) values (p_send_date,p_id_progress_state,p_idprofile,p_id_offer);
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SEARCH_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_OFFER`()
BEGIN
	select * from VIEW_OFFER;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS FIND_PROM;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_PROM`(p_id_profile INT)
BEGIN
	select id_profile,id_roles,prom, student_count,id_campus, campus,id_address, address, number, comment, city
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END//

DELIMITER ;
DROP PROCEDURE IF EXISTS CREATION_REQUIRES;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_REQUIRES`(p_id_offer INT,p_id_skill INT, p_level INT)
BEGIN
insert into requires (id_offer,id_skill,level) values (p_id_offer,p_id_skill,p_level);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_ACTIVITY;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ACTIVITY`(p_id_activity INT)
BEGIN
DELETE from activity
where id_activity = p_id_activity;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_OFFER`(p_id_offer INT)
BEGIN
	DELETE FROM offer
	WHERE id_offer = p_id_offer;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_ACTIVITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ACTIVITY`(p_id_activity INT, p_name VARCHAR(255))
BEGIN
	UPDATE activity
	set name = p_name
	where id_activity = p_id_activity;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_ADDRESS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ADDRESS`()
BEGIN
	select * from address;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SEARCH_COMPANY;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_COMPANY`()
BEGIN
SELECT  company.id_company, company.name, company.link, IFNULL(cesi_accepted, 0) as cesi_accepted FROM company
    LEFT JOIN
	(SELECT localities.id_company, count(*) as cesi_accepted FROM candidature
	inner join offer on candidature.id_offer = offer.id_offer
	inner join postulate_progress_steps on postulate_progress_steps.id_progress_state = candidature.id_progress_state
	inner join localities on localities.id_localities = offer.id_localities
	left join company on company.id_company = localities.id_company
	WHERE postulate_progress_steps.name = "Acceptée"
	GROUP BY localities.id_company) as CESICOUNT ON CESICOUNT.id_company = company.id_company;
END//

DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_PROFILE;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_PROFILE`(p_id_profile INT)
BEGIN
DELETE FROM profile
	WHERE id_profile = p_id_profile;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS DETAILS_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_OFFER`(p_id_offer INT)
BEGIN
    select offer.name, offer.telephone, offer.contact_mail, offer.comment, offer.amount, company.name as company, company.link, city.name as city, city.zipcode, address.name as address, address.number, address.comment, activity.name as activity
    from offer
    inner join localities on offer.id_localities = localities.id_localities
    inner join company on localities.id_company = company.id_company
    inner join address on localities.id_address = address.id_address
    inner join city on address.id_city = city.id_city
    inner join activity on offer.id_activity = activity.id_activity
    where offer.id_offer = p_id_offer;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SEARCH_ACTIVITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_ACTIVITY`(p_id_company INT)
BEGIN
	select activity.name
	from activity
		inner join sector on activity.id_activity = sector.id_activity
		inner join company on sector.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_RATE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_RATE`()
BEGIN
	select * from rate;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_ROLES;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ROLES`()
BEGIN
	select * from roles;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_PERSON;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PERSON`()
BEGIN
	select * from person;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_PROM;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROM`(p_id_prom INT, p_name VARCHAR(255), p_id_campus INT)
BEGIN
UPDATE prom
set name = p_name, id_campus = p_id_campus
where id_prom = p_id_prom;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS CREATE_COMPANY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_COMPANY`(p_name VARCHAR(255),p_active bool,p_link VARCHAR(255),p_city VARCHAR(255),p_zipcode VARCHAR(20),p_address VARCHAR(255),p_number VARCHAR(20),p_comment VARCHAR(300))
BEGIN
	insert into company (name,active,link) VALUES (p_name,p_active,p_link);
	set @temp = last_insert_id();
	insert into city (name,zipcode) VALUES (p_city,p_zipcode);
	set @temp2 = last_insert_id();
	insert into address (name,number,comment,id_city) VALUES (p_address,p_number,p_comment,@temp2);
	set @temp3 = last_insert_id();
	insert into localities (id_address,id_company) VALUES (@temp3,@temp);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROFILE`(p_fname VARCHAR(50),p_lname VARCHAR(50),p_id_roles INT,p_email VARCHAR(255),
p_password VARCHAR(255), p_name VARCHAR(50))
BEGIN
	INSERT INTO profile (fname,lname,id_roles) VALUES (p_fname,p_lname,p_id_roles);
	SET @temp=last_insert_id();
	INSERT INTO person (email,password,id_profile) VALUES (p_email,p_password,@temp);
	SET @temp2 = (select id_prom from prom where name = p_name);
INSERT INTO affiliated (id_profile,id_prom) VALUES (@temp,@temp2);
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_COMPANY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_COMPANY`()
BEGIN
	select * from company;
END //

DELIMITER ;

DROP procedure if exists DETAILS_COMPANY;

DELIMITER //

CREATE DEFINER=`inge-tim`@`localhost` PROCEDURE `DETAILS_COMPANY`(p_id_company INT)
begin
	SELECT  company.id_company, company.name, company.link, IFNULL(cesi_accepted, 0) as cesi_accepted FROM company
    LEFT JOIN
	(SELECT localities.id_company, count(*) as cesi_accepted FROM candidature
	inner join offer on candidature.id_offer = offer.id_offer
	inner join postulate_progress_steps on postulate_progress_steps.id_progress_state = candidature.id_progress_state
	inner join localities on localities.id_localities = offer.id_localities
	left join company on company.id_company = localities.id_company
	WHERE postulate_progress_steps.name = "Acceptée" and localities.id_company = p_id_company
	GROUP BY localities.id_company) as CESICOUNT ON CESICOUNT.id_company = company.id_company
    WHERE company.id_company = p_id_company;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_OFFER`(p_name varchar(50), p_active bool, p_period VARCHAR(50), p_amount VARCHAR(50), p_wage VARCHAR(50),
        p_comment VARCHAR(500), p_contact_mail VARCHAR(100), p_telephone VARCHAR(15),id_localities INT,id_activity INT)
BEGIN
        INSERT INTO offer (name,active,startdate,period,amount,wage,comment,contact_mail,telephone,id_localities,id_activity) VALUES (p_name,p_active,p_period,p_amount,p_wage,p_comment,p_contact_mail,p_telephone,id_localities,id_activity);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_ACTIVITY;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ACTIVITY`(p_name VARCHAR(255))
BEGIN
insert into activity (name) values (p_name);
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS SELECT_CITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CITY`()
BEGIN
	select * from city;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_SKILLS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_SKILLS`(p_name VARCHAR(255))
BEGIN
insert into skills (name) values (p_name);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS DELETE_CANDIDATURE;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CANDIDATURE`(p_id_candidature INT)
BEGIN
delete from candidature
where id_candidature = p_id_candidature;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SELECT_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_OFFER`()
BEGIN
	select * from offer;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DELETE_COMPANY;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_COMPANY`(p_id_company INT)
BEGIN
DELETE FROM company
	WHERE id_company = p_id_company;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS SELECT_CANDIDATURE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CANDIDATURE`()
BEGIN
	select * from candidature;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS CREATION_PROM;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROM`(p_name VARCHAR(255),p_id_campus INT)
BEGIN
insert into prom (name,id_campus) values (p_name,p_id_campus);
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS FIND_CANDIDATURE;

DELIMITER //

CREATE PROCEDURE FIND_CANDIDATURE(p_id_profile INT)
BEGIN
	SELECT distinct id_offer, offer, id_progress_state, state, startdate, company
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS FIND_LOCALITIES;
	
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_LOCALITIES`(p_id_company INT)
BEGIN
	select city.name as city, city.zipcode, address.name as street, address.number, address.comment
	from city
	inner join address on city.id_city = address.id_city
	inner join localities on address.id_address = localities.id_address
	inner join company on localities.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_ADDRESS;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ADDRESS`(p_id_address INT, p_name VARCHAR(255), p_number INT, p_comment VARCHAR(255),p_id_city INT)
BEGIN
update address
set name = p_name, number = p_number, comment = p_comment, id_city = p_id_city
where id_address = p_id_address;
END//
DELIMITER ;
