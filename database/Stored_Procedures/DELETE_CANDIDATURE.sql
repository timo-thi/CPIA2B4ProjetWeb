DROP PROCEDURE IF EXISTS DELETE_CANDIDATURE;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CANDIDATURE`(p_id_candidature INT)
BEGIN
delete from candidature
where id_candidature = p_id_candidature;
END//
DELIMITER;