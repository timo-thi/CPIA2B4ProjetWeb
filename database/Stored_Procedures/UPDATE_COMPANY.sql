DROP PROCEDURE if EXISTS UPDATE_COMPANY;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_COMPANY`(p_id_company INT, p_name VARCHAR(255), p_active BOOL, p_link VARCHAR(255))
BEGIN
UPDATE company
set name = p_name, active = p_active, link = p_link
where id_company = p_id_company;
END//
DELIMITER;