DROP PROCEDURE IF EXISTS UPDATE_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PROFILE`(`p_fname` VARCHAR(50), `p_lname` VARCHAR(50), `p_id_roles` INT, `p_email` VARCHAR(255), `p_password` VARCHAR(255), `p_id_profile` INT, `p_id_prom` INT)
BEGIN
	UPDATE profile
		SET fname = p_fname, lname = p_lname, id_roles = p_id_roles
	WHERE profile.id_profile = p_id_profile;
	UPDATE person
		SET email = p_email, password = p_password
	WHERE person.id_profile = p_id_profile;
		SET @temp = (select id_prom from prom
	WHERE id_prom = p_id_prom);
	UPDATE affiliated
		SET id_prom = @temp
	WHERE affiliated.id_profile=p_id_profile;
END //

DELIMITER ;
