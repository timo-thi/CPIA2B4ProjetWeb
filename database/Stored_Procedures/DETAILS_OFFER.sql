DROP PROCEDURE IF EXISTS DETAILS_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_OFFER`(`p_id_offer` INT)
BEGIN
    select offer.id_offer, offer.active as visibility, offer.name, offer.period, offer.startdate, offer.telephone, offer.contact_mail, offer.comment as descr, offer.amount, offer.wage, company.id_company as id_company, company.name as company, company.link, localities.id_localities, city.name as city, city.zipcode, address.name as address, address.number, address.comment, activity.id_activity, activity.name as activity
    from offer
    inner join localities on offer.id_localities = localities.id_localities
    inner join company on localities.id_company = company.id_company
    inner join address on localities.id_address = address.id_address
    inner join city on address.id_city = city.id_city
    inner join activity on offer.id_activity = activity.id_activity
    where offer.id_offer = p_id_offer;
END //

DELIMITER ;
