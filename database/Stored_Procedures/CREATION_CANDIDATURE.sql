DROP PROCEDURE IF EXISTS CREATION_CANDIDATURE;
DELIMITER//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_CANDIDATURE`(p_send_date DATE, p_id_progress_state INT, p_id_profile INT, p_id_offer INT)
BEGIN
insert into candidature (send_date,id_progress_state,id_profile,id_offer) values (p_send_date,p_id_progress_state,p_idprofile,p_id_offer);
END//
DELIMITER;