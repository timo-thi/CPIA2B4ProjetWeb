DROP PROCEDURE IF EXISTS AUTH;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH`(p_email VARCHAR(255))
BEGIN
	SELECT id_person, email, password, id_profile FROM person
	where email = p_email;
END //

DELIMITER ;