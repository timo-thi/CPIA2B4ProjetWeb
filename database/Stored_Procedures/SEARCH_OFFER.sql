DROP PROCEDURE IF EXISTS SEARCH_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_OFFER`(p_offset INT, p_limit INT)
BEGIN
	select * from view_offer
    where active = '1'
    group by id_offer
    LIMIT p_offset, p_limit;
END //

DELIMITER ;
