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
set name = p_name, number = p_number, comment = p_comment, id_city = p_id_city;
where id_address = p_id_address;
END//
DELIMITER ;
