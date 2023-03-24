DROP PROCEDURE IF EXISTS CREATION_REQUIRES;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_REQUIRES`(p_id_offer INT,p_id_skill INT, p_level INT)
BEGIN
insert into requires (id_offer,id_skill,level) values (p_id_offer,p_id_skill,p_level);
END//
DELIMITER;