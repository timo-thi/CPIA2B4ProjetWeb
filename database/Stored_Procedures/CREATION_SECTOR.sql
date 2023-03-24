DROP PROCEDURE IF EXISTS CREATION_SECTOR;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_SECTOR`(p_id_company INT, p_id_activity INT)
BEGIN
insert into sector (id_company,id_activity) values (p_id_company,p_id_activity);
END//
DELIMITER;