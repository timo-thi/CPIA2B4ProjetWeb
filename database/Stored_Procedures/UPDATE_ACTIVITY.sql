CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ACTIVITY`(p_id_activity INT, p_name VARCHAR(255))
BEGIN
UPDATE activity 
set name = p_name
where id_activity = p_id_activity;
END