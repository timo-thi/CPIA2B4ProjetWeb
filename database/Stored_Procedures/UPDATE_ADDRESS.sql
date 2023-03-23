DROP PROCEDURE IF EXISTS UPDATE_ADDRESS;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_ADDRESS`(p_id_address INT, p_name VARCHAR(255), p_number INT, p_comment VARCHAR(255),p_id_city INT)
BEGIN
update address
set name = p_name, number = p_number, comment = p_comment, id_city = p_id_city;
where id_address = p_id_address;
END//
DELIMITER;