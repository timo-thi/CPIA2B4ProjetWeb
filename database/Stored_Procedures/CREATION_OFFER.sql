DROP PROCEDURE IF EXISTS CREATION_OFFER;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_OFFER`(
    `p_name` VARCHAR(50),
    `p_active` BOOL,
    `p_startdate` DATE,
    `p_period` VARCHAR(50),
    `p_amount` VARCHAR(50),
    `p_wage` VARCHAR(50),
    `p_comment` VARCHAR(500),
    `p_contact_mail` VARCHAR(100),
    `p_telephone` VARCHAR(15),
    `id_localities` INT,
    `id_activity` INT
)
BEGIN
	INSERT INTO offer (name,active,startdate,period,amount,wage,comment,contact_mail,telephone,id_localities,id_activity) VALUES (p_name,p_active,p_startdate,p_period,p_amount,p_wage,p_comment,p_contact_mail,p_telephone,id_localities,id_activity);
END //

DELIMITER ;
