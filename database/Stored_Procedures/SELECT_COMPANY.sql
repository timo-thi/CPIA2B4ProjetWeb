DROP PROCEDURE IF EXISTS SELECT_COMPANY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_COMPANY`()
BEGIN
	select * from company;
END //

DELIMITER ;
