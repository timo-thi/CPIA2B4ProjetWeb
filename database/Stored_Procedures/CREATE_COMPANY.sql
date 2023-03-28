DROP IF EXISTS CREATE_COMPANY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_COMPANY`(`p_name` VARCHAR(255), `p_active` BOOL, `p_link` VARCHAR(255))
BEGIN
	insert into company (name,active,link) VALUES (p_name,p_active,p_link);
    select last_insert_id() as id_company;
END //

DELIMITER ;
