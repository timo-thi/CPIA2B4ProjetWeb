DROP PROCEDURE IF EXISTS SEARCH_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_OFFER`(p_id_offer INT)
BEGIN
	select offer.name, company.name, city.name, city.zipcode
	from offer
		inner join localities on offer.id_localities = localities.id_localities
		inner join company on localities.id_company = company.id_company
		inner join address on localities.id_address = address.id_address
		inner join city on address.id_city = city.id_city
	where id_offer = p_id_offer;
END //

DELIMITER ;
