DROP VIEW IF EXISTS view_pilots;

CREATE VIEW `view_pilots` AS
    SELECT 
        `profile`.`id_profile` AS `id_profile`,
        `profile`.`fname` AS `fname`,
        `profile`.`lname` AS `lname`,
        `profile`.`photo` AS `photo`,
        `person`.`email` AS `email`,
        `profile`.`id_roles` AS `id_roles`,
        `prom`.`name` AS `prom`,
        `number`.`num` AS `student_count`,
        `campus`.`id_campus` AS `id_campus`,
        `campus`.`name` AS `campus`,
        `address`.`id_address` AS `id_address`,
        `address`.`name` AS `address`,
        `address`.`number` AS `number`,
        `address`.`comment` AS `comment`,
        `city`.`name` AS `city`
    FROM
        (((((((`profile`
        LEFT JOIN `person` ON ((`profile`.`id_profile` = `person`.`id_profile`)))
        LEFT JOIN `affiliated` ON ((`profile`.`id_profile` = `affiliated`.`id_profile`)))
        LEFT JOIN `prom` ON ((`affiliated`.`id_prom` = `prom`.`id_prom`)))
        LEFT JOIN `campus` ON ((`prom`.`id_campus` = `campus`.`id_campus`)))
        LEFT JOIN `address` ON ((`campus`.`id_address` = `address`.`id_address`)))
        LEFT JOIN `city` ON ((`address`.`id_city` = `city`.`id_city`)))
        LEFT JOIN (SELECT 
            `affiliated`.`id_prom` AS `id_prom`,
                COUNT(`affiliated`.`id_profile`) AS `num`
        FROM
            (`profile`
        JOIN `affiliated` ON ((`profile`.`id_profile` = `affiliated`.`id_profile`)))
        GROUP BY `affiliated`.`id_prom`) `number` ON ((`prom`.`id_prom` = `number`.`id_prom`)))
    WHERE
        (`profile`.`id_roles` = 2)
    ORDER BY `profile`.`id_profile`