DROP PROCEDURE IF EXISTS DETAILS_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_OFFER`(p_id_offer INT)
BEGIN
    select offer.name, offer.telephone, offer.contact_mail, offer.comment, offer.amount, company.name as company, company.link, city.name as city, city.zipcode, address.name as address, address.number, address.comment, activity.name as activity
    from offer
    inner join localities on offer.id_localities = localities.id_localities
    inner join company on localities.id_company = company.id_company
    inner join address on localities.id_address = address.id_address
    inner join city on address.id_city = city.id_city
    inner join activity on offer.id_activity = activity.id_activity
    where offer.id_offer = p_id_offer;
END //

DELIMITER ;
