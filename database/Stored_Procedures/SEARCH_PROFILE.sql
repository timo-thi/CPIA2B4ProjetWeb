CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_PROFILE`()
BEGIN
SELECT profile.id_profile, profile.fname, profile.lname, person.id_person, person.email, prom.id_prom, prom.name as prom, if(accepted.cnt is null, 'n', 'y') as accepted FROM profile
    left join affiliated on profile.id_profile = affiliated.id_profile
    left join prom on affiliated.id_prom = prom.id_prom
    left join person on profile.id_profile = person.id_profile
    LEFT JOIN (
        select profile.id_profile, count(candidature.id_progress_state) as cnt from profile
            inner join candidature on candidature.id_profile = profile.id_profile
        where candidature.id_progress_state = 6
        group by profile.id_profile)
            as accepted on accepted.id_profile = profile.id_profile;
END