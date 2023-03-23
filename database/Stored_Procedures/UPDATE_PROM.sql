DROP PROCEDURE IF EXISTS UPDATE_PROM;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROM`(p_id_prom INT, p_name VARCHAR(255), p_id_campus INT)
BEGIN
UPDATE prom
set name = p_name, id_campus = p_id_campus
where id_prom = p_id_prom;
END//
DELIMITER;