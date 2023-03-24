-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 24 mars 2023 à 10:28
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `web`
--
CREATE DATABASE IF NOT EXISTS `web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `web`;

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `AUTH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH` ()   BEGIN
	SELECT email, password FROM person;
END$$

DROP PROCEDURE IF EXISTS `CREATE_COMPANY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_COMPANY` (`p_name` VARCHAR(255), `p_active` BOOL, `p_link` VARCHAR(255), `p_city` VARCHAR(255), `p_zipcode` VARCHAR(20), `p_address` VARCHAR(255), `p_number` VARCHAR(20), `p_comment` VARCHAR(300))   BEGIN
	insert into company (name,active,link) VALUES (p_name,p_active,p_link);
	set @temp = last_insert_id();
	insert into city (name,zipcode) VALUES (p_city,p_zipcode);
	set @temp2 = last_insert_id();
	insert into address (name,number,comment,id_city) VALUES (p_address,p_number,p_comment,@temp2);
	set @temp3 = last_insert_id();
	insert into localities (id_address,id_company) VALUES (@temp3,@temp);
END$$

DROP PROCEDURE IF EXISTS `CREATION_ACTIVITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ACTIVITY` (`p_name` VARCHAR(255))   BEGIN
insert into activity (name) values (p_name);
END$$

DROP PROCEDURE IF EXISTS `CREATION_ADDRESS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ADDRESS` (`p_name` VARCHAR(255), `p_number` INT, `p_comment` VARCHAR(255), `p_id_city` INT)   BEGIN
insert into address (name,number,comment,id_city) values (p_name,p_number,p_comment,p_id_city);
END$$

DROP PROCEDURE IF EXISTS `CREATION_CANDIDATURE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_CANDIDATURE` (`p_send_date` DATE, `p_id_progress_state` INT, `p_id_profile` INT, `p_id_offer` INT)   BEGIN
insert into candidature (send_date,id_progress_state,id_profile,id_offer) values (p_send_date,p_id_progress_state,p_idprofile,p_id_offer);
END$$

DROP PROCEDURE IF EXISTS `CREATION_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_OFFER` (`p_name` VARCHAR(50), `p_active` BOOL, `p_period` VARCHAR(50), `p_amount` VARCHAR(50), `p_wage` VARCHAR(50), `p_comment` VARCHAR(500), `p_contact_mail` VARCHAR(100), `p_telephone` VARCHAR(15), `id_localities` INT, `id_activity` INT)   BEGIN
        INSERT INTO offer (name,active,startdate,period,amount,wage,comment,contact_mail,telephone,id_localities,id_activity) VALUES (p_name,p_active,p_period,p_amount,p_wage,p_comment,p_contact_mail,p_telephone,id_localities,id_activity);
END$$

DROP PROCEDURE IF EXISTS `CREATION_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROFILE` (`p_fname` VARCHAR(50), `p_lname` VARCHAR(50), `p_id_roles` INT, `p_email` VARCHAR(255), `p_password` VARCHAR(255), `p_name` VARCHAR(50))   BEGIN
	INSERT INTO profile (fname,lname,id_roles) VALUES (p_fname,p_lname,p_id_roles);
	SET @temp=last_insert_id();
	INSERT INTO person (email,password,id_profile) VALUES (p_email,p_password,@temp);
	SET @temp2 = (select id_prom from prom where name = p_name);
INSERT INTO affiliated (id_profile,id_prom) VALUES (@temp,@temp2);
END$$

DROP PROCEDURE IF EXISTS `CREATION_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROM` (`p_name` VARCHAR(255), `p_id_campus` INT)   BEGIN
insert into prom (name,id_campus) values (p_name,p_id_campus);
END$$

DROP PROCEDURE IF EXISTS `CREATION_RATE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_RATE` (`p_id_profile` INT, `p_id_company` INT, `p_rating` INT, `p_comment` VARCHAR(500))   BEGIN
insert into rate (id_profile,id_company,rating,comment) values (p_id_profile,p_id_company,p_rating,p_comment);
END$$

DROP PROCEDURE IF EXISTS `CREATION_REQUIRES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_REQUIRES` (`p_id_offer` INT, `p_id_skill` INT, `p_level` INT)   BEGIN
insert into requires (id_offer,id_skill,level) values (p_id_offer,p_id_skill,p_level);
END$$

DROP PROCEDURE IF EXISTS `CREATION_SECTOR`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_SECTOR` (`p_id_company` INT, `p_id_activity` INT)   BEGIN
insert into sector (id_company,id_activity) values (p_id_company,p_id_activity);
END$$

DROP PROCEDURE IF EXISTS `CREATION_SKILLS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_SKILLS` (`p_name` VARCHAR(255))   BEGIN
insert into skills (name) values (p_name);
END$$

DROP PROCEDURE IF EXISTS `CREATION_WISH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_WISH` (`p_id_profile` INT, `p_id_offer` INT)   BEGIN
insert into wish (id_profile,id_offer) values (p_id_profile,p_id_offer);
END$$

DROP PROCEDURE IF EXISTS `DELETE_ACTIVITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ACTIVITY` (`p_id_activity` INT)   BEGIN
DELETE from activity
where id_activity = p_id_activity;
END$$

DROP PROCEDURE IF EXISTS `DELETE_ADDRESS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ADDRESS` (`p_id_address` INT)   BEGIN
DELETE FROM address
	WHERE id_address = p_id_address;
END$$

DROP PROCEDURE IF EXISTS `DELETE_CAMPUS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CAMPUS` (`p_id_campus` INT)   BEGIN
DELETE FROM campus
	WHERE id_campus = p_id_campus;
END$$

DROP PROCEDURE IF EXISTS `DELETE_CANDIDATURE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CANDIDATURE` (`p_id_candidature` INT)   BEGIN
delete from candidature
where id_candidature = p_id_candidature;
END$$

DROP PROCEDURE IF EXISTS `DELETE_COMPANY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_COMPANY` (`p_id_company` INT)   BEGIN
DELETE FROM company
	WHERE id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `DELETE_LOCALITIES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_LOCALITIES` (`p_id_localities` INT)   BEGIN
DELETE FROM localities
	WHERE id_localities = p_id_localities;
END$$

DROP PROCEDURE IF EXISTS `DELETE_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_OFFER` (`p_id_offer` INT)   BEGIN
	DELETE FROM offer
	WHERE id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `DELETE_POSTULATE_PROGRESS_STEPS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_POSTULATE_PROGRESS_STEPS` (`p_id_progress_state` INT)   BEGIN
DELETE FROM postulate_progress_steps
	WHERE id_progress_state = p_id_progress_state;
END$$

DROP PROCEDURE IF EXISTS `DELETE_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_PROFILE` (`p_id_profile` INT)   BEGIN
DELETE FROM profile
	WHERE id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `DELETE_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_PROM` (`p_id_prom` INT)   BEGIN
DELETE FROM prom
	WHERE id_prom = p_id_prom;
END$$

DROP PROCEDURE IF EXISTS `DELETE_ROLES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ROLES` (`p_id_roles` INT)   BEGIN
DELETE FROM roles
	WHERE id_roles = p_id_roles;

END$$

DROP PROCEDURE IF EXISTS `DELETE_SKILLS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_SKILLS` (`p_id_skill` INT)   BEGIN
DELETE FROM skills
	WHERE id_skill = p_id_skill;
END$$

DROP PROCEDURE IF EXISTS `DELETE_WISH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_WISH` (`p_id_profile` INT, `p_id_offer` INT)   BEGIN
delete from wish
where id_profile = p_id_profile and id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `DETAILS_COMPANY`$$
CREATE DEFINER=`inge-tim`@`localhost` PROCEDURE `DETAILS_COMPANY` (`p_id_company` INT)   begin
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
END$$

DROP PROCEDURE IF EXISTS `DETAILS_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_OFFER` (`p_id_offer` INT)   BEGIN
    select offer.name, offer.telephone, offer.contact_mail, offer.comment, offer.amount, company.name as company, company.link, city.name as city, city.zipcode, address.name as address, address.number, address.comment, activity.name as activity
    from offer
    inner join localities on offer.id_localities = localities.id_localities
    inner join company on localities.id_company = company.id_company
    inner join address on localities.id_address = address.id_address
    inner join city on address.id_city = city.id_city
    inner join activity on offer.id_activity = activity.id_activity
    where offer.id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `DETAILS_PILOTS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PILOTS` (`p_id_profile` INT)   BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `DETAILS_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PROFILE` (`p_id_profile` INT)   BEGIN
	SELECT profile.id_profile, profile.fname, profile.lname, roles.id_roles, roles.name as role, prom.id_prom, prom.name as promo, campus.id_campus, campus.name as campus, city.name as city
	FROM profile
	INNER JOIN affiliated ON profile.id_profile = affiliated.id_profile
	INNER JOIN prom ON affiliated.id_prom = prom.id_prom
	INNER JOIN campus ON prom.id_campus = campus.id_campus
	INNER JOIN address ON campus.id_address = address.id_address
	INNER JOIN city ON address.id_city = city.id_city
	inner join roles on profile.id_roles = roles.id_roles
	WHERE profile.id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `DETAILS_STUDENT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_STUDENT` (`p_id_profile` INT)   BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `FIND_CANDIDATURE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_CANDIDATURE` (`p_id_profile` INT)   BEGIN
	SELECT distinct id_offer, offer, id_progress_state, state, startdate, company
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `FIND_LOCALITIES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_LOCALITIES` (`p_id_company` INT)   BEGIN
	select city.name as city, city.zipcode, address.name as street, address.number, address.comment
	from city
	inner join address on city.id_city = address.id_city
	inner join localities on address.id_address = localities.id_address
	inner join company on localities.id_company = company.id_company
	where company.id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `FIND_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_PROM` (`p_id_profile` INT)   BEGIN
	select id_profile,id_roles,prom, student_count,id_campus, campus,id_address, address, number, comment, city
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `FIND_WISH`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_WISH` (`p_id_profile` INT)   BEGIN
	SELECT wish.id_offer, name, company, city, zipcode
	FROM profile
		LEFT JOIN wish ON profile.id_profile = wish.id_profile
		LEFT JOIN VIEW_OFFER ON VIEW_OFFER.id_offer = wish.id_offer
	where profile.id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_ACTIVITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_ACTIVITY` (`p_id_company` INT)   BEGIN
	select activity.name
	from activity
		inner join sector on activity.id_activity = sector.id_activity
		inner join company on sector.id_company = company.id_company
	where company.id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_COMPANY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_COMPANY` ()   BEGIN
SELECT  company.id_company, company.name, company.link, IFNULL(cesi_accepted, 0) as cesi_accepted FROM company
    LEFT JOIN
	(SELECT localities.id_company, count(*) as cesi_accepted FROM candidature
	inner join offer on candidature.id_offer = offer.id_offer
	inner join postulate_progress_steps on postulate_progress_steps.id_progress_state = candidature.id_progress_state
	inner join localities on localities.id_localities = offer.id_localities
	left join company on company.id_company = localities.id_company
	WHERE postulate_progress_steps.name = "Acceptée"
	GROUP BY localities.id_company) as CESICOUNT ON CESICOUNT.id_company = company.id_company;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_FIRM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_FIRM` (`p_id_company` INT)   BEGIN
select company.name, COUNT(candidature.id_progress_state) as 'recu'
from candidature 
inner join postulate_progress_steps as p on candidature.id_progress_state = p.id_progress_state 
inner join offer on candidature.id_offer = offer.id_offer
inner join localities on offer.id_localities = localities.id_localities 
inner join company on localities.id_company = company.id_company
WHERE p.name ='Acceptée' and company.id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_LOCALITIES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_LOCALITIES` (`p_id_company` INT)   BEGIN
select city.name as city, city.zipcode, address.name as street, address.number, address.comment
from city
inner join address on city.id_city = address.id_city
inner join localities on address.id_address = localities.id_address
inner join company on localities.id_company = company.id_company
where company.id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_OFFER` ()   BEGIN
	select * from VIEW_OFFER;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_PILOTS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PILOTS` ()   BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROFILE` ()   BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `SEARCH_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROM` (`p_id_profile` INT)   BEGIN
select prom.id_prom,prom.name,campus.id_campus,campus.name as campus,address.id_address
from prom
inner join affiliated on prom.id_prom = affiliated.id_prom
inner join campus on prom.id_campus = campus.id_campus
inner join address on campus.id_address = address.id_address
where affiliated.id_profile = p_id_profile;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_RATE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_RATE` (`p_id_company` INT)   BEGIN
	select rate.comment, rate.rating
	from rate
	inner join company on rate.id_company = company.id_company
	where company.id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_SKILL`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_SKILL` (`p_id_offer` INT)   BEGIN
select skills.name 
from skills
inner join requires on skills.id_skill = requires.id_skill
where requires.id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_SKILLS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_SKILLS` (`p_id_offer` INT)   BEGIN
	select skills.name
	from skills
	inner join requires on skills.id_skill = requires.id_skill
	where requires.id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `SEARCH_STUDENT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_STUDENT` ()   BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT;
END$$

DROP PROCEDURE IF EXISTS `SELECT`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT` (`p_table` VARCHAR(255))   BEGIN
select * from p_table;
END$$

DROP PROCEDURE IF EXISTS `SELECT_ACTIVITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ACTIVITY` ()   BEGIN
	select * from activity;
END$$

DROP PROCEDURE IF EXISTS `SELECT_ADDRESS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ADDRESS` ()   BEGIN
	select * from address;
END$$

DROP PROCEDURE IF EXISTS `SELECT_CAMPUS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CAMPUS` ()   BEGIN
	select * from campus;
END$$

DROP PROCEDURE IF EXISTS `SELECT_CANDIDATURE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CANDIDATURE` ()   BEGIN
	select * from candidature;
END$$

DROP PROCEDURE IF EXISTS `SELECT_CITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_CITY` ()   BEGIN
	select * from city;
END$$

DROP PROCEDURE IF EXISTS `SELECT_COMPANY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_COMPANY` ()   BEGIN
	select * from company;
END$$

DROP PROCEDURE IF EXISTS `SELECT_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_OFFER` ()   BEGIN
	select * from offer;
END$$

DROP PROCEDURE IF EXISTS `SELECT_PERSON`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PERSON` ()   BEGIN
	select * from person;
END$$

DROP PROCEDURE IF EXISTS `SELECT_POSTULATE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_POSTULATE` ()   BEGIN
select * from postulate_progress_steps;
END$$

DROP PROCEDURE IF EXISTS `SELECT_POSTULATE_PROGRESS_STEPS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_POSTULATE_PROGRESS_STEPS` ()   BEGIN
	select * from postulate_progress_steps;
END$$

DROP PROCEDURE IF EXISTS `SELECT_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PROFILE` ()   BEGIN
	select * from profile;
END$$

DROP PROCEDURE IF EXISTS `SELECT_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PROM` ()   BEGIN
	select * from prom;
END$$

DROP PROCEDURE IF EXISTS `SELECT_RATE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_RATE` ()   BEGIN
	select * from rate;
END$$

DROP PROCEDURE IF EXISTS `SELECT_ROLES`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ROLES` ()   BEGIN
	select * from roles;
END$$

DROP PROCEDURE IF EXISTS `SELECT_RPOM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_RPOM` ()   BEGIN
select * from prom;
END$$

DROP PROCEDURE IF EXISTS `SELECT_SKILLS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_SKILLS` ()   BEGIN
	select * from skills;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_ACTIVITY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ACTIVITY` (`p_id_activity` INT, `p_name` VARCHAR(255))   BEGIN
	UPDATE activity
	set name = p_name
	where id_activity = p_id_activity;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_ADDRESS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ADDRESS` (`p_id_address` INT, `p_name` VARCHAR(255), `p_number` INT, `p_comment` VARCHAR(255), `p_id_city` INT)   BEGIN
update address
set name = p_name, number = p_number, comment = p_comment, id_city = p_id_city
where id_address = p_id_address;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_CANDIDATURE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_CANDIDATURE` (`p_id_candidature` INT, `p_send_date` DATE, `p_id_progress_state` INT, `p_id_profile` INT, `p_id_offer` INT)   BEGIN
update candidature
set send_date = p_send_date ,id_progress_state = p_id_progress_state, id_profile = p_id_profile, id_offer = p_id_offer
where id_candidature = p_id_candidature;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_COMPANY`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_COMPANY` (`p_id_company` INT, `p_name` VARCHAR(255), `p_active` BOOL, `p_link` VARCHAR(255))   BEGIN
UPDATE company
set name = p_name, active = p_active, link = p_link
where id_company = p_id_company;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_OFFER`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_OFFER` (`p_id_offer` INT, `p_name` VARCHAR(50), `p_active` BOOLEAN, `p_startdate` DATE, `p_period` VARCHAR(50), `p_amount` VARCHAR(50), `p_wage` VARCHAR(50), `p_comment` VARCHAR(500), `p_contact_mail` VARCHAR(100), `p_telephone` VARCHAR(15), `p_id_localities` INT, `p_id_activity` INT)   BEGIN
	UPDATE offer
	SET name = p_name, active = p_active, startdate = p_startdate , period = p_period, amount = p_amount, wage = p_wage,
	comment = p_comment, contact_mail = p_contact_mail, telephone = p_telephone, id_localities = p_id_localities,
	id_activity = p_id_activity
	WHERE id_offer = p_id_offer;
END$$

DROP PROCEDURE IF EXISTS `UPDATE_PROFILE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROFILE` (`p_fname` VARCHAR(50), `p_lname` VARCHAR(50), `p_id_roles` INT, `p_email` VARCHAR(255), `p_password` VARCHAR(255), `p_id_profile` INT, `p_name` VARCHAR(50))   BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `UPDATE_PROM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROM` (`p_id_prom` INT, `p_name` VARCHAR(255), `p_id_campus` INT)   BEGIN
UPDATE prom
set name = p_name, id_campus = p_id_campus
where id_prom = p_id_prom;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id_activity` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`id_activity`, `name`) VALUES
(1, 'Python'),
(2, 'PHP'),
(3, 'HTML/CSS'),
(4, 'Javascript'),
(5, 'Réseau'),
(6, 'Cybersécurité'),
(7, 'C++'),
(8, 'C#'),
(9, 'C#'),
(10, 'C#'),
(11, 'C#'),
(12, 'C#'),
(13, 'C#'),
(14, 'C#'),
(15, 'C Arduino');

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id_address` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id_address`, `name`, `number`, `comment`, `id_city`) VALUES
(1, 'Avenue de l\'opéra', '38', NULL, 1),
(2, 'rue de Londres', '8', NULL, 1),
(3, 'quai du Pr\ésident Roosevelt', 37, NULL, 2),
(4, 'place d\'Iéna', 7, NULL, 1),
(5, 'rue M\énars', 6, NULL, 1),
(6, 'rue de la Paix', 10, NULL, 1),
(7, 'Avenue Edmund Halley Rouen Madrillet Innovation', 80, NULL, 3),
(8, 'Boulevard Louis XIV', 8, NULL, 4),
(9, 'Boulevard Louis XIV', 8, NULL, 4),
(10, 'Boulevard Louis XIV', 8, NULL, 4),
(11, 'Boulevard Louis XIV', 8, NULL, 4),
(12, 'Boulevard Louis XIV', 8, NULL, 4),
(13, 'Boulevard Louis XIV', 8, NULL, 4),
(14, 'Boulevard de la Seine', 93, NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `affiliated`
--

DROP TABLE IF EXISTS `affiliated`;
CREATE TABLE `affiliated` (
  `id_profile` int(11) NOT NULL,
  `id_prom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `affiliated`
--

INSERT INTO `affiliated` (`id_profile`, `id_prom`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `id_campus` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id_campus`, `name`, `id_address`) VALUES
(1, 'Rouen', 3),
(2, 'Lille', 4),
(3, 'Nanterre', 5),
(4, 'Lille', 4),
(5, 'Lille', 4),
(6, 'Lille', 4),
(7, 'Lille', 4),
(8, 'Lille', 4),
(9, 'Lille', 4),
(10, 'Lille', 4),
(11, 'Lille', 4),
(12, 'Lille', 4);

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

DROP TABLE IF EXISTS `candidature`;
CREATE TABLE `candidature` (
  `id_candidature` int(11) NOT NULL,
  `send_date` date DEFAULT NULL,
  `id_progress_state` int(11) DEFAULT NULL,
  `id_profile` int(11) NOT NULL,
  `id_offer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidature`
--

INSERT INTO `candidature` (`id_candidature`, `send_date`, `id_progress_state`, `id_profile`, `id_offer`) VALUES
(1, '2022-02-20', 1, 1, 1),
(2, '2022-02-22', 1, 2, 1),
(3, '2022-02-25', 2, 3, 1),
(4, '2022-03-01', 1, 4, 1),
(5, '2022-03-03', 2, 5, 1),
(6, '2022-03-06', 1, 6, 1),
(7, '2022-03-10', 3, 7, 1),
(8, '2022-03-12', 1, 8, 1),
(9, '2022-03-14', 2, 9, 1),
(10, '2022-02-23', 1, 2, 2),
(11, '2022-02-28', 2, 3, 2),
(12, '2022-03-06', 1, 4, 2),
(13, '2022-03-08', 1, 5, 2),
(14, '2022-03-12', 2, 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id_city`, `name`, `zipcode`) VALUES
(1, 'Paris', '75001'),
(2, 'Issy-les-Moulineaux', '92130'),
(3, 'Saint-Étienne-du-Rouvray', '76800'),
(4, 'Lille', '59000'),
(5, 'Nanterre', '92000'),
(6, 'Lille', '59000'),
(7, 'Lille', '59000'),
(8, 'Lille', '59000'),
(9, 'Lille', '59000'),
(10, 'Lille', '59000'),
(11, 'Lille', '59000'),
(12, 'Lille', '59000'),

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id_company` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id_company`, `name`, `active`, `link`) VALUES
(1, 'Youtube', 1, 'https://www.youtube.com/'),
(2, 'Google', 1, 'https://www.google.com/'),
(3, 'Microsoft', 1, 'https://www.microsoft.com/'),
(4, 'Apple', 1, 'https://www.apple.com/'),
(5, 'Facebook', 1, 'https://www.facebook.com/'),
(6, 'Twitter', 0, 'https://www.twitter.com/'),
(7, 'Instagram', 0, 'https://www.instagram.com/'),
(8, 'Twitter', 0, 'https://www.twitter.com/'),
(9, 'Twitter', 0, 'https://www.twitter.com/'),
(10, 'Twitter', 0, 'https://www.twitter.com/'),
(11, 'Twitter', 0, 'https://www.twitter.com/'),
(12, 'Twitter', 0, 'https://www.twitter.com/'),
(13, 'Twitter', 0, 'https://www.twitter.com/'),
(14, 'Twitter', 0, 'https://www.twitter.com/');
-- --------------------------------------------------------

--
-- Structure de la table `localities`
--

DROP TABLE IF EXISTS `localities`;
CREATE TABLE `localities` (
  `id_localities` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `id_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `localities`
--

INSERT INTO `localities` (`id_localities`, `id_address`, `id_company`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 5, 7),
(8, 6, 6),
(9, 6, 6),
(10, 6, 6),
(11, 6, 6),
(12, 6, 6),
(13, 6, 6),
(14, 6, 6),

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `id_offer` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `period` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `wage` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `contact_mail` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `id_localities` int(11) DEFAULT NULL,
  `id_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offer`
--

INSERT INTO `offer` (`id_offer`, `name`, `active`, `startdate`, `period`, `amount`, `wage`, `comment`, `contact_mail`, `telephone`, `link`, `id_localities`, `id_activity`) VALUES
(1, 'Développeur Web', 1, '2022-05-01', '6 mois', '4000 €', '35 €/h', 'CDI après la période d\'essai', 'contact@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 1, 1),
(2, 'Assistant RH', 1, '2022-04-15', '3 mois', '2200 €', NULL, NULL, 'rh@entreprise.com', '0607080910', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 2, 2),
(3, 'Chargé de communication', 0, '2022-06-01', '6 mois', '3800 €', '30 €/h', 'CDD pour remplacement maladie', 'communication@entreprise.com', '0504030201', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 3, 3),
(4, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(5, 'Architecte logiciel', 1, '2022-05-01', '18 mois', '6000 €', '50 €/h', 'Mission chez un client important', 'contact@entreprise.com', '0607080910', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 1, 1),
(6, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(7, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(8, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(9, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(10, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(11, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4),
(12, 'Chef de projet', 1, '2022-03-15', '12 mois', '5000 €', '40 €/h', NULL, 'projet@entreprise.com', '0102030405', 'https://discord.com/channels/1021334122209235036/1072440528026738688/1088414479504654378', 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id_person` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_profile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id_person`, `email`, `password`, `id_profile`) VALUES
(1, 'timothee.thienpont@viacesi.fr', 'alice123', 1),
(2, 'bob.martin@example.com', 'bob123', 2),
(3, 'camille.lefebvre@example.com', 'camille123', 3),
(4, 'david.garcia@example.com', 'david123', 4),
(5, 'david.garcia@example.com', 'david123', 5),
(6, 'david.garcia@example.com', 'david123', 6),
(7, 'david.garcia@example.com', 'david123', 7),
(8, 'david.garcia@example.com', 'david123', 8),
(9, 'david.garcia@example.com', 'david123', 9),
(10, 'david.garcia@example.com', 'david123', 10),
(11, 'david.garcia@example.com', 'david123', 11),
(12, 'david.garcia@example.com', 'david123', 12),
(13, 'emilie.dujardin@example.com', 'emilie123', 13);

-- --------------------------------------------------------

--
-- Structure de la table `postulate_progress_steps`
--

DROP TABLE IF EXISTS `postulate_progress_steps`;
CREATE TABLE `postulate_progress_steps` (
  `id_progress_state` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `postulate_progress_steps`
--

INSERT INTO `postulate_progress_steps` (`id_progress_state`, `name`) VALUES
(6, 'Acceptée'),
(1, 'CV reçu'),
(4, 'Entretien en personne'),
(3, 'Entretien téléphonique'),
(5, 'Offre faite'),
(2, 'Présélection'),
(7, 'Refusée');

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `id_roles` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id_profile`, `fname`, `lname`, `id_roles`, `photo`) VALUES
(1, 'Timothée', 'THIENPONT', 1, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416535422439476/image.png'),
(2, 'Damian', 'LAROCHE-RIBERT', 1, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416604963995688/image.png'),
(3, 'Baptiste', 'DELAVENNE', 1, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416755052978186/image.png'),
(4, 'Léandro', 'DE BARROS BARBOSA', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416880332636160/image.png'),
(5, 'Aniss', 'SEJEAN', 2, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(6, 'Clyde', 'BARULL', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(7, 'Quentin', 'CAMBUZAT', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(8, 'Florian', 'MAILLARD', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(9, 'Clément', 'REYDEL', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(10, 'Paul', 'BREON', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(11, 'Luc', 'MARTEN', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(12, 'Lilia', 'ABBA', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png'),
(13, 'Pierre', 'LEJEUNE', 3, 'https://cdn.discordapp.com/attachments/1088413788342071388/1088416946426499102/image.png');


-- --------------------------------------------------------

--
-- Structure de la table `prom`
--

DROP TABLE IF EXISTS `prom`;
CREATE TABLE `prom` (
  `id_prom` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_campus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prom`
--

INSERT INTO `prom` (`id_prom`, `name`, `id_campus`) VALUES
(1, 'Promo 2022', 1),
(2, 'Promo 2023', 2),
(3, 'Promo 2024', 3),
(4, 'Promo 2023', 4),
(5, 'Promo 2023', 5),
(6, 'Promo 2023', 6),
(7, 'Promo 2023', 7),
(8, 'Promo 2023', 8),
(9, 'Promo 2023', 9),
(10, 'Promo 2023', 10);

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate` (
  `id_profile` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rate`
--

INSERT INTO `rate` (`id_profile`, `id_company`, `rating`, `comment`) VALUES
(4, 1, 4, 'Bonne entreprise'),
(4, 2, 5, 'Très bonne entreprise'),
(4, 3, 3, 'Assez bonne entreprise'),
(5, 3, 4, 'Entreprise exceptionnelle, je suis très satisfait(e) de mon expérience'),
(6, 3, 3, 'Assez bonne entreprise'),
(7, 3, 3, 'Assez bonne entreprise'),
(8, 3, 3, 'Assez bonne entreprise'),
(9, 3, 3, 'Assez bonne entreprise'),
(10, 3, 3, 'Assez bonne entreprise'),
(11, 3, 3, 'Assez bonne entreprise');

-- --------------------------------------------------------

--
-- Structure de la table `requires`
--

DROP TABLE IF EXISTS `requires`;
CREATE TABLE `requires` (
  `id_offer` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `requires`
--

INSERT INTO `requires` (`id_offer`, `id_skill`, `level`) VALUES
(1, 1, 3),
(1, 3, 2),
(2, 2, 1),
(2, 3, 3),
(3, 1, 2),
(3, 2, 1),
(4, 2, 2),
(4, 4, 3),
(5, 1, 1),
(6, 5, 2),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1),
(11, 1, 1),
(12, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id_roles`, `name`) VALUES
(1, 'admin'),
(2, 'pilote'),
(3, 'etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE `sector` (
  `id_company` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sector`
--

INSERT INTO `sector` (`id_company`, `id_activity`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(4, 4),
(3, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id_skill` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skills`
--

INSERT INTO `skills` (`id_skill`, `name`) VALUES
(1, 'Java'),
(2, 'Photoshop'),
(3, 'Leadership'),
(4, 'SEO'),
(5, 'Java'),
(6, 'Python'),
(7, 'SQL'),
(8, 'Marketing digital'),
(9, 'Gestion de projet'),
(10, 'Anglais');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_offer`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_offer`;
CREATE TABLE `view_offer` (
`id_offer` int(11)
,`name` varchar(50)
,`company` varchar(50)
,`city` varchar(50)
,`zipcode` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_pilots`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_pilots`;
CREATE TABLE `view_pilots` (
`id_profile` int(11)
,`fname` varchar(50)
,`lname` varchar(50)
,`email` varchar(255)
,`id_roles` int(11)
,`prom` varchar(50)
,`student_count` bigint(21)
,`id_campus` int(11)
,`campus` varchar(50)
,`id_address` int(11)
,`address` varchar(200)
,`number` varchar(20)
,`comment` varchar(300)
,`city` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `view_student`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `view_student`;
CREATE TABLE `view_student` (
`id_profile` int(11)
,`fname` varchar(50)
,`lname` varchar(50)
,`id_person` int(11)
,`prom` varchar(50)
,`email` varchar(255)
,`accepted` varchar(1)
,`id_roles` int(11)
,`id_offer` int(11)
,`offer` varchar(50)
,`id_progress_state` int(11)
,`state` varchar(50)
,`startdate` date
,`company` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `wish`
--

DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish` (
  `id_profile` int(11) NOT NULL,
  `id_offer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wish`
--

INSERT INTO `wish` (`id_profile`, `id_offer`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2);

-- --------------------------------------------------------

--
-- Structure de la vue `view_offer`
--
DROP TABLE IF EXISTS `view_offer`;

DROP VIEW IF EXISTS `view_offer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_offer`  AS SELECT `offer`.`id_offer` AS `id_offer`, `offer`.`name` AS `name`, `company`.`name` AS `company`, `city`.`name` AS `city`, `city`.`zipcode` AS `zipcode` FROM ((((`offer` join `localities` on(`offer`.`id_localities` = `localities`.`id_localities`)) join `company` on(`localities`.`id_company` = `company`.`id_company`)) join `address` on(`localities`.`id_address` = `address`.`id_address`)) join `city` on(`address`.`id_city` = `city`.`id_city`))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `view_pilots`
--
DROP TABLE IF EXISTS `view_pilots`;

DROP VIEW IF EXISTS `view_pilots`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pilots`  AS SELECT `profile`.`id_profile` AS `id_profile`, `profile`.`fname` AS `fname`, `profile`.`lname` AS `lname`, `person`.`email` AS `email`, `profile`.`id_roles` AS `id_roles`, `prom`.`name` AS `prom`, `number`.`num` AS `student_count`, `campus`.`id_campus` AS `id_campus`, `campus`.`name` AS `campus`, `address`.`id_address` AS `id_address`, `address`.`name` AS `address`, `address`.`number` AS `number`, `address`.`comment` AS `comment`, `city`.`name` AS `city` FROM (((((((`profile` left join `person` on(`profile`.`id_profile` = `person`.`id_profile`)) left join `affiliated` on(`profile`.`id_profile` = `affiliated`.`id_profile`)) left join `prom` on(`affiliated`.`id_prom` = `prom`.`id_prom`)) left join `campus` on(`prom`.`id_campus` = `campus`.`id_campus`)) left join `address` on(`campus`.`id_address` = `address`.`id_address`)) left join `city` on(`address`.`id_city` = `city`.`id_city`)) left join (select `affiliated`.`id_prom` AS `id_prom`,count(`affiliated`.`id_profile`) AS `num` from (`profile` join `affiliated` on(`profile`.`id_profile` = `affiliated`.`id_profile`)) group by `affiliated`.`id_prom`) `number` on(`prom`.`id_prom` = `number`.`id_prom`)) WHERE `profile`.`id_roles` = 2 ORDER BY `profile`.`id_profile` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `view_student`
--
DROP TABLE IF EXISTS `view_student`;

DROP VIEW IF EXISTS `view_student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_student`  AS SELECT `profile`.`id_profile` AS `id_profile`, `profile`.`fname` AS `fname`, `profile`.`lname` AS `lname`, `person`.`id_person` AS `id_person`, `prom`.`name` AS `prom`, `person`.`email` AS `email`, if(`accepted`.`cnt` is null,'n','y') AS `accepted`, `profile`.`id_roles` AS `id_roles`, `step`.`id_offer` AS `id_offer`, `step`.`offer` AS `offer`, `step`.`id_progress_state` AS `id_progress_state`, `step`.`state` AS `state`, `step`.`startdate` AS `startdate`, `step`.`company` AS `company` FROM (((((`profile` left join `affiliated` on(`profile`.`id_profile` = `affiliated`.`id_profile`)) left join `prom` on(`affiliated`.`id_prom` = `prom`.`id_prom`)) left join `person` on(`profile`.`id_profile` = `person`.`id_profile`)) left join (select `profile`.`id_profile` AS `id_profile`,`candidature`.`id_offer` AS `id_offer`,`offer`.`name` AS `offer`,`offer`.`startdate` AS `startdate`,`company`.`name` AS `company`,`candidature`.`id_progress_state` AS `id_progress_state`,`postulate_progress_steps`.`name` AS `state` from (((((`profile` join `candidature` on(`candidature`.`id_profile` = `profile`.`id_profile`)) join `offer` on(`candidature`.`id_offer` = `offer`.`id_offer`)) join `localities` on(`offer`.`id_localities` = `localities`.`id_localities`)) join `company` on(`localities`.`id_company` = `company`.`id_company`)) join `postulate_progress_steps` on(`candidature`.`id_progress_state` = `postulate_progress_steps`.`id_progress_state`)) order by `profile`.`id_profile`) `step` on(`step`.`id_profile` = `profile`.`id_profile`)) left join (select `profile`.`id_profile` AS `id_profile`,count(`candidature`.`id_progress_state`) AS `cnt` from (`profile` join `candidature` on(`candidature`.`id_profile` = `profile`.`id_profile`)) where `candidature`.`id_progress_state` = 6 group by `profile`.`id_profile`) `accepted` on(`accepted`.`id_profile` = `profile`.`id_profile`)) WHERE `profile`.`id_roles` = 33  ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id_activity`);

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_city` (`id_city`);

--
-- Index pour la table `affiliated`
--
ALTER TABLE `affiliated`
  ADD PRIMARY KEY (`id_profile`,`id_prom`),
  ADD KEY `id_prom` (`id_prom`);

--
-- Index pour la table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id_campus`),
  ADD KEY `id_address` (`id_address`);

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`id_candidature`),
  ADD KEY `id_progress_state` (`id_progress_state`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_offer` (`id_offer`);

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Index pour la table `localities`
--
ALTER TABLE `localities`
  ADD PRIMARY KEY (`id_localities`),
  ADD KEY `id_address` (`id_address`),
  ADD KEY `id_company` (`id_company`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id_offer`),
  ADD KEY `id_localities` (`id_localities`),
  ADD KEY `id_activity` (`id_activity`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Index pour la table `postulate_progress_steps`
--
ALTER TABLE `postulate_progress_steps`
  ADD PRIMARY KEY (`id_progress_state`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Index pour la table `prom`
--
ALTER TABLE `prom`
  ADD PRIMARY KEY (`id_prom`),
  ADD KEY `id_campus` (`id_campus`);

--
-- Index pour la table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id_profile`,`id_company`),
  ADD KEY `id_company` (`id_company`);

--
-- Index pour la table `requires`
--
ALTER TABLE `requires`
  ADD PRIMARY KEY (`id_offer`,`id_skill`),
  ADD KEY `id_skill` (`id_skill`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Index pour la table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id_company`,`id_activity`),
  ADD KEY `id_activity` (`id_activity`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id_skill`);

--
-- Index pour la table `wish`
--
ALTER TABLE `wish`
  ADD PRIMARY KEY (`id_profile`,`id_offer`),
  ADD KEY `id_offer` (`id_offer`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity`
--
ALTER TABLE `activity`
  MODIFY `id_activity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `campus`
--
ALTER TABLE `campus`
  MODIFY `id_campus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `candidature`
--
ALTER TABLE `candidature`
  MODIFY `id_candidature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `localities`
--
ALTER TABLE `localities`
  MODIFY `id_localities` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `offer`
--
ALTER TABLE `offer`
  MODIFY `id_offer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `id_person` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `postulate_progress_steps`
--
ALTER TABLE `postulate_progress_steps`
  MODIFY `id_progress_state` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `prom`
--
ALTER TABLE `prom`
  MODIFY `id_prom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id_skill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE CASCADE;

--
-- Contraintes pour la table `affiliated`
--
ALTER TABLE `affiliated`
  ADD CONSTRAINT `affiliated_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE,
  ADD CONSTRAINT `affiliated_ibfk_2` FOREIGN KEY (`id_prom`) REFERENCES `prom` (`id_prom`) ON DELETE CASCADE;

--
-- Contraintes pour la table `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `campus_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE SET NULL;

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`id_progress_state`) REFERENCES `postulate_progress_steps` (`id_progress_state`) ON DELETE SET NULL,
  ADD CONSTRAINT `candidature_ibfk_2` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidature_ibfk_3` FOREIGN KEY (`id_offer`) REFERENCES `offer` (`id_offer`) ON DELETE CASCADE;

--
-- Contraintes pour la table `localities`
--
ALTER TABLE `localities`
  ADD CONSTRAINT `localities_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE CASCADE,
  ADD CONSTRAINT `localities_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE;

--
-- Contraintes pour la table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`id_localities`) REFERENCES `localities` (`id_localities`) ON DELETE SET NULL,
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id_activity`) ON DELETE SET NULL;

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE;

--
-- Contraintes pour la table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`) ON DELETE SET NULL;

--
-- Contraintes pour la table `prom`
--
ALTER TABLE `prom`
  ADD CONSTRAINT `prom_ibfk_1` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id_campus`);

--
-- Contraintes pour la table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE,
  ADD CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE;

--
-- Contraintes pour la table `requires`
--
ALTER TABLE `requires`
  ADD CONSTRAINT `requires_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offer` (`id_offer`) ON DELETE CASCADE,
  ADD CONSTRAINT `requires_ibfk_2` FOREIGN KEY (`id_skill`) REFERENCES `skills` (`id_skill`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE CASCADE,
  ADD CONSTRAINT `sector_ibfk_2` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id_activity`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wish`
--
ALTER TABLE `wish`
  ADD CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE,
  ADD CONSTRAINT `wish_ibfk_2` FOREIGN KEY (`id_offer`) REFERENCES `offer` (`id_offer`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
