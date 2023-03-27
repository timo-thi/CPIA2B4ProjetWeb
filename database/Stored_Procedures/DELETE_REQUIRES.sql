DROP PROCEDURE IF EXISTS `DELETE_REQUIRES`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_REQUIRES`(`p_id_offer` INT, `p_id_skill` INT)
BEGIN
	insert into requires (id_offer,id_skill) values (p_id_offer,p_id_skill);
    select last_insert_id() as id_offer;
END $$

DELIMITER ;
