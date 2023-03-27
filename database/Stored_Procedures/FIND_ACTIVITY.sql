DROP PROCEDURE IF EXISTS FIND_ACTIVITY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_ACTIVITY`(p_id_company INT)
BEGIN
	select activity.id_activity, activity.name
	from activity
		inner join sector on activity.id_activity = sector.id_activity
		inner join company on sector.id_company = company.id_company
	where company.id_company = p_id_company;
END //

DELIMITER ;
