DROP PROCEDURE IF EXISTS CERATION_WISH;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_WISH`(p_id_profile INT, p_id_offer INT)
BEGIN
insert into wish (id_profile,id_offer) values (p_id_profile,p_id_offer);
END//
DELIMITER;