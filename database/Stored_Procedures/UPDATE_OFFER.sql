DROP PROCEDURE IF EXISTS UPDATE_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_OFFER`(`p_id_offer` INT, `p_name` VARCHAR(50), `p_active` BOOLEAN, `p_startdate` DATE, `p_period` VARCHAR(50), `p_amount` VARCHAR(50), `p_wage` VARCHAR(50), `p_comment` VARCHAR(500), `p_contact_mail` VARCHAR(100), `p_telephone` VARCHAR(15), `p_id_localities` INT, `p_id_activity` INT)
BEGIN
	UPDATE offer
	SET name = p_name, active = p_active, startdate = p_startdate , period = p_period, amount = p_amount, wage = p_wage,
	comment = p_comment, contact_mail = p_contact_mail, telephone = p_telephone, id_localities = p_id_localities,
	id_activity = p_id_activity
	WHERE id_offer = p_id_offer;
END //

DELIMITER ;
