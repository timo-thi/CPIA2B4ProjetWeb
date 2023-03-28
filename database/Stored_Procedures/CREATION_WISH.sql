DROP PROCEDURE IF EXISTS CERATION_WISH;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_WISH`(`p_id_profile` INT, `p_id_offer` INT)
BEGIN
	if exists(select id_profile, id_offer FROM wish WHERE id_profile = p_id_profile AND id_offer = p_id_offer )
    then
		select true; delete from wish where id_profile = p_id_profile AND id_offer = p_id_offer;
	else
		select false; insert into wish (id_profile,id_offer) values (p_id_profile,p_id_offer);
	end if;
END //

DELIMITER ;
