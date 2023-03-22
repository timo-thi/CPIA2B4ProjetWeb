CREATE DEFINER=`root`@`localhost` PROCEDURE `DETAILS_PROFILE`(p_id_profile INT)
BEGIN
SELECT profile.id_profile, profile.fname, profile.lname, roles.id_roles, roles.name as role, prom.id_prom, prom.name as promo, campus.id_campus, campus.name as campus, city.name as city
FROM profile
INNER JOIN affiliated ON profile.id_profile = affiliated.id_profile
INNER JOIN prom ON affiliated.id_prom = prom.id_prom
INNER JOIN campus ON prom.id_campus = campus.id_campus
INNER JOIN address ON campus.id_address = address.id_address
INNER JOIN city ON address.id_city = city.id_city
inner join roles on profile.id_roles = roles.id_roles
WHERE profile.id_profile = p_id_profile;
END