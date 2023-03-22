DROP PROCEDURE IF EXISTS FIND_PROM;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_PROM`(p_id_profile INT)
BEGIN
	select id_profile,id_roles,prom, student_count,id_campus, campus,id_address, address, number, comment, city
	from VIEW_PILOTS
	where id_profile = p_id_profile;
END//

DELIMITER ;