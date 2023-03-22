DROP PROCEDURE IF EXISTS SEARCH_PILOTS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PILOTS`()
BEGIN
	select distinct id_profile, fname, lname, email, id_roles
	from VIEW_PILOTS;
END//

DELIMITER ;
