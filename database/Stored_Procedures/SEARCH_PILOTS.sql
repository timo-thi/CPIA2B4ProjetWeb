DROP PROCEDURE IF EXISTS SEARCH_PILOTS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PILOTS`(p_offset INT, p_limit INT)
BEGIN
	select distinct id_profile, fname, lname, email, id_roles, photo
	from view_pilots
    LIMIT p_offset, p_limit;
END //

DELIMITER ;
