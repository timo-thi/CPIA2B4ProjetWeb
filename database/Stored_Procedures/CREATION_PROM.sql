DROP PROCEDURE IF EXISTS CREATION_PROM;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROM`(p_name VARCHAR(255),p_id_campus INT)
BEGIN
insert into prom (name,id_campus) values (p_name,p_id_campus);
END//
DELIMITER;