DROP PROCEDURE IF EXISTS SEARCH_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_OFFER`()
BEGIN
	select * from VIEW_OFFER;
END //

DELIMITER ;
