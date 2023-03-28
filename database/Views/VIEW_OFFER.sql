DROP VIEW IF EXISTS view_offer;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_offer` AS
    SELECT 
        `offer`.`id_offer` AS `id_offer`,
        `offer`.`name` AS `name`,
        `offer`.`link` AS `link`,
        `offer`.`active` AS `active`,
        `company`.`name` AS `company`,
        `city`.`name` AS `city`,
        `city`.`zipcode` AS `zipcode`
    FROM
        ((((`offer`
        JOIN `localities` ON ((`offer`.`id_localities` = `localities`.`id_localities`)))
        JOIN `company` ON ((`localities`.`id_company` = `company`.`id_company`)))
        JOIN `address` ON ((`localities`.`id_address` = `address`.`id_address`)))
        JOIN `city` ON ((`address`.`id_city` = `city`.`id_city`)))