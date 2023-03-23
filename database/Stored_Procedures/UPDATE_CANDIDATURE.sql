DROP PROCEDURE IF EXISTS UPDATE_CANDIDATURE;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_CANDIDATURE`(p_id_candidature INT, p_send_date DATE, p_id_progress_state INT, p_id_profile INT, p_id_offer INT)
BEGIN
update candidature
set send_date = p_send_date ,id_progress_state = p_id_progress_state, id_profile = p_id_profile, id_offer = p_id_offer
where id_candidature = p_id_candidature;
END//
DELIMITER;