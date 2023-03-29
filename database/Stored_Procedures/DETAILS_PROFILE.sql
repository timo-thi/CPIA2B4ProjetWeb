DROP PROCEDURE IF EXISTS DETAILS_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PROFILE`(`p_id_profile` INT)
BEGIN
	SELECT profile.id_profile, profile.fname, profile.lname, roles.id_roles, roles.name as role, prom.id_prom, prom.name as promo, campus.id_campus, campus.name as campus, city.name as city
	FROM profile
	left JOIN affiliated ON profile.id_profile = affiliated.id_profile
	left JOIN prom ON affiliated.id_prom = prom.id_prom
	left JOIN campus ON prom.id_campus = campus.id_campus
	left JOIN address ON campus.id_address = address.id_address
	left JOIN city ON address.id_city = city.id_city
	left join roles on profile.id_roles = roles.id_roles
	WHERE profile.id_profile = p_id_profile;
END//

DELIMITER ;
