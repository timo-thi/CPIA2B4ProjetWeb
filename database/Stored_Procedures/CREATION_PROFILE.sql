DROP PROCEDURE IF EXISTS CREATION_PROFILE;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_PROFILE`(p_fname VARCHAR(50),p_lname VARCHAR(50),p_role VARCHAR(50),p_email VARCHAR(255),
p_password VARCHAR(255), p_name VARCHAR(50))
BEGIN
	INSERT INTO profile (fname,lname,role) VALUES (p_fname,p_lname,p_role);
	SET @temp=last_insert_id();
	INSERT INTO person (email,password,id_profile) VALUES (p_email,p_password,@temp);
	SET @temp2 = (select id_prom from prom where name = p_name);
INSERT INTO affiliated (id_profile,id_prom) VALUES (@temp,@temp2);
END//

DELIMITER ;
