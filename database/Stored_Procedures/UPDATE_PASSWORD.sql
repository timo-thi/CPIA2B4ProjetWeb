DROP procedure IF EXISTS `UPDATE_PASSWORD`;

DELIMITER $$

CREATE PROCEDURE `UPDATE_PASSWORD` (p_id_user VARCHAR(255), p_password VARCHAR(255))
BEGIN
	UPDATE person
		SET password = p_password
	WHERE id_person = p_id_user;
END$$

DELIMITER ;
