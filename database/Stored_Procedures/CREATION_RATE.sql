DROP PROCEDURE IF EXISTS CREATION_RATE;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_RATE`(p_id_profile INT, p_id_company INT, p_rating INT, p_comment VARCHAR(500))
BEGIN
insert into rate (id_profile,id_company,rating,comment) values (p_id_profile,p_id_company,p_rating,p_comment);
END//
DELIMITER;