DROP PROCEDURE IF EXISTS SEARCH_PROM;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROM`(p_id_profile INT)
BEGIN
select prom.id_prom,prom.name,campus.id_campus,campus.name as campus,address.id_address
from prom
inner join affiliated on prom.id_prom = affiliated.id_prom
inner join campus on prom.id_campus = campus.id_campus
inner join address on campus.id_address = address.id_address
where affiliated.id_profile = p_id_profile;
END//
DELIMITER;