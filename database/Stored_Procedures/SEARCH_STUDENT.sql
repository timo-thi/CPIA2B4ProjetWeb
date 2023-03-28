DROP PROCEDURE IF EXISTS SEARCH_STUDENT;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_STUDENT`(p_offset INT, p_limit INT)
BEGIN
	SELECT distinct id_profile, fname, lname, id_person, prom, email, accepted, id_roles, photo
	FROM view_student
    LIMIT p_offset, p_limit;
END //

DELIMITER ;
