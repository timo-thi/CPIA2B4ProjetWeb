DROP PROCEDURE IF EXISTS CREATION_CANDIDATURE;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_CANDIDATURE`(p_send_date DATE, p_id_progress_state INT, p_id_profile INT, p_id_offer INT)
BEGIN
if exists (select * from candidature where id_profile = p_id_profile and id_offer = p_id_offer) then
	update candidature
    set send_date = p_send_date;
else
	insert into candidature (send_date,id_progress_state,id_profile,id_offer) values (p_send_date,p_id_progress_state,p_id_profile,p_id_offer);
end if;
END//
DELIMITER;