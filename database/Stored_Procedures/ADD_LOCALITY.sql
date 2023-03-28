DROP PROCEDURE IF EXISTS ADD_LOCALITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_LOCALITY`(p_name VARCHAR(255), p_number VARCHAR(20), p_comment VARCHAR(255), p_id_company INT, p_city VARCHAR(50), p_zipcode VARCHAR(20))
BEGIN
	IF exists(select id_city from city where name = p_city and zipcode = p_zipcode) then
		set @temp = (select id_city from city where name = p_city and zipcode = p_zipcode LIMIT 0, 1);
	else 
		insert into city (name,zipcode) VALUES (p_city,p_zipcode);
		set @temp = last_insert_id();
	end if;
	CALL CREATION_ADDRESS(p_name , p_number, p_comment , @temp );
	insert into localities (id_address, id_company) VALUES (last_insert_id(), p_id_company);
END //

DELIMITER ;