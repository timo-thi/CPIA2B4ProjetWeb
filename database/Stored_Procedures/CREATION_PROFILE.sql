DROP PROCEDURE IF EXISTS CREATION_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROFILE`(`p_fname` VARCHAR(50), `p_lname` VARCHAR(50), `p_id_roles` INT, `p_email` VARCHAR(255), `p_password` VARCHAR(255), `p_id_prom` INT)
BEGIN
	INSERT INTO profile (fname,lname,id_roles) VALUES (p_fname,p_lname,p_id_roles);
	SET @temp=last_insert_id();
	INSERT INTO person (email,password,id_profile) VALUES (p_email,p_password,@temp);
	INSERT INTO affiliated (id_profile,id_prom) VALUES (@temp, p_id_prom);
END//

DELIMITER ;
