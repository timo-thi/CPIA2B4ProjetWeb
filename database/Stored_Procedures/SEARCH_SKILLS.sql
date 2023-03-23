DROP PROCEDURE IF EXISTS SEARCH_SKILLS;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_SKILLS`(p_id_offer INT)
BEGIN
	select skills.name 
	from skills
	inner join requires on skills.id_skill = requires.id_skill
	where requires.id_offer = p_id_offer;
END //

DELIMITER ;
