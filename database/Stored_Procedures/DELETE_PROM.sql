DROP PROCEDURE IF EXISTS DELETE_PROM;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_PROM`(p_id_prom INT)
BEGIN
DELETE FROM prom
	WHERE id_prom = p_id_prom;
END//
DELIMITER;