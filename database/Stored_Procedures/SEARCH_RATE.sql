DROP PROCEDURE IF EXISTS SEARCH_RATE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_RATE`(p_id_company INT)
BEGIN
	select rate.comment, rate.rating
	from rate
	inner join company on rate.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;
