DROP PROCEDURE IF EXISTS FIND_LOCALITIES;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_LOCALITIES`(p_id_company INT)
BEGIN
	select city.name as city, city.zipcode, address.name as street, address.number, address.comment
	from city
	inner join address on city.id_city = address.id_city
	inner join localities on address.id_address = localities.id_address
	inner join company on localities.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;
