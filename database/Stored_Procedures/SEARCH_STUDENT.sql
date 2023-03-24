DROP PROCEDURE IF EXISTS SEARCH_STUDENT;

DELIMITER //

CREATE PROCEDURE SEARCH_STUDENT()
BEGIN
	SELECT id_profile, fname, lname, id_person, prom, email, accepted, id_roles, photo
	FROM view_student
	group by id_profile;
END //

DELIMITER ;
