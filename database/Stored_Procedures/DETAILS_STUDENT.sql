DROP PROCEDURE IF EXISTS DETAILS_STUDENT;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_STUDENT`(`p_id_profile` INT)
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, id_prom, prom, email, accepted, id_roles
	FROM view_student
	WHERE id_profile = p_id_profile;
END //

DELIMITER ;