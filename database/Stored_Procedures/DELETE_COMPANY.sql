DROP PROCEDURE IF EXISTS DELETE_COMPANY;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_COMPANY`(p_id_company INT)
BEGIN
DELETE FROM company
	WHERE id_company = p_id_company;
END//
DELIMITER;