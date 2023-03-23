DROP PROCEDURE IF EXISTS DELETE_ACTIVITY;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_ACTIVITY`(p_id_activity INT)
BEGIN
DELETE from activity
where id_activity = p_id_activity;
END //

DELIMITER;