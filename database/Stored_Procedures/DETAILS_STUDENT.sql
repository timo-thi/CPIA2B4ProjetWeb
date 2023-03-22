DROP PROCEDURE IF EXISTS DETAILS_STUDENT;

DELIMITER //

CREATE PROCEDURE DETAILS_STUDENT(p_id_profile INT)
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END //

DELIMITER ;