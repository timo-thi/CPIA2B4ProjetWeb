DROP PROCEDURE IF EXISTS DETAILS_PILOTS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PILOTS`(p_id_profile INT)
BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END// 

DELIMITER ;
