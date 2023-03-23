DROP PROCEDURE IF EXISTS DELETE_WISH;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_WISH`(p_id_profile INT, p_id_offer INT)
BEGIN
delete from wish
where id_profile = p_id_profile and id_offer = p_id_offer;
END//
DELIMITER;