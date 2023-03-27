drop view if exists VIEW_STUDENT;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_student` AS
    SELECT 
        `profile`.`id_profile` AS `id_profile`,
        `profile`.`fname` AS `fname`,
        `profile`.`lname` AS `lname`,
        `profile`.`photo` AS `photo`,
        `person`.`id_person` AS `id_person`,
        `prom`.`name` AS `prom`,
        `prom`.`id_prom` AS `id_prom`,
        `person`.`email` AS `email`,
        IF((`accepted`.`cnt` IS NULL), 'n', 'y') AS `accepted`,
        `profile`.`id_roles` AS `id_roles`,
        `step`.`id_offer` AS `id_offer`,
        `step`.`offer` AS `offer`,
        `step`.`id_progress_state` AS `id_progress_state`,
        `step`.`state` AS `state`,
        `step`.`startdate` AS `startdate`,
        `step`.`company` AS `company`
    FROM
        (((((`profile`
        LEFT JOIN `affiliated` ON ((`profile`.`id_profile` = `affiliated`.`id_profile`)))
        LEFT JOIN `prom` ON ((`affiliated`.`id_prom` = `prom`.`id_prom`)))
        LEFT JOIN `person` ON ((`profile`.`id_profile` = `person`.`id_profile`)))
        LEFT JOIN (SELECT 
            `profile`.`id_profile` AS `id_profile`,
                `candidature`.`id_offer` AS `id_offer`,
                `offer`.`name` AS `offer`,
                `offer`.`startdate` AS `startdate`,
                `company`.`name` AS `company`,
                `candidature`.`id_progress_state` AS `id_progress_state`,
                `postulate_progress_steps`.`name` AS `state`
        FROM
            (((((`profile`
        JOIN `candidature` ON ((`candidature`.`id_profile` = `profile`.`id_profile`)))
        JOIN `offer` ON ((`candidature`.`id_offer` = `offer`.`id_offer`)))
        JOIN `localities` ON ((`offer`.`id_localities` = `localities`.`id_localities`)))
        JOIN `company` ON ((`localities`.`id_company` = `company`.`id_company`)))
        JOIN `postulate_progress_steps` ON ((`candidature`.`id_progress_state` = `postulate_progress_steps`.`id_progress_state`)))
        ORDER BY `profile`.`id_profile`) `step` ON ((`step`.`id_profile` = `profile`.`id_profile`)))
        LEFT JOIN (SELECT 
            `profile`.`id_profile` AS `id_profile`,
                COUNT(`candidature`.`id_progress_state`) AS `cnt`
        FROM
            (`profile`
        JOIN `candidature` ON ((`candidature`.`id_profile` = `profile`.`id_profile`)))
        WHERE
            (`candidature`.`id_progress_state` = 6)
        GROUP BY `profile`.`id_profile`) `accepted` ON ((`accepted`.`id_profile` = `profile`.`id_profile`)))
    WHERE
        (`profile`.`id_roles` = 3)