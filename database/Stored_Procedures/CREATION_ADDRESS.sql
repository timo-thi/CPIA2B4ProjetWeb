DROP PROCEDURE IF EXISTS CREATION_ADDRESS;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ADDRESS`(p_name VARCHAR(255), p_number INT, p_comment VARCHAR(255), p_id_city INT)
BEGIN
insert into address (name,number,comment,id_city) values (p_name,p_number,p_comment,p_id_city);
END//
DELIMITER;