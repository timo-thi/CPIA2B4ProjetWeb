DROP PROCEDURE IF EXISTS SEARCH_STUDENT;

DELIMITER //

CREATE PROCEDURE SEARCH_STUDENT()
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles
	FROM VIEW_STUDENT;
END //

DELIMITER ;
