DROP PROCEDURE IF EXISTS SELECT_POSTULATE_PROGRESS_STEPS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_POSTULATE_PROGRESS_STEPS`()
BEGIN
	select * from postulate_progress_steps;
END //

DELIMITER ;
