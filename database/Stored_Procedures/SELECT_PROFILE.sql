DROP PROCEDURE IF EXISTS SELECT_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PROFILE`()
BEGIN
	select * from profile;
END //

DELIMITER ;