DROP PROCEDURE IF EXISTS SEARCH_ACTIVITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_ACTIVITY`(p_id_company INT)
BEGIN
	select activity.name
	from activity
		inner join sector on activity.id_activity = sector.id_activity
		inner join company on sector.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;
