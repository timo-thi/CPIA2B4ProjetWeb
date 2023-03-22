DROP PROCEDURE IF EXISTS FIND_CANDIDATURE;

DELIMITER //

CREATE PROCEDURE FIND_CANDIDATURE(p_id_profile INT)
BEGIN
	SELECT distinct id_offer, offer, id_progress_state, state, startdate, company
	FROM VIEW_STUDENT
	WHERE id_profile = p_id_profile;
END //

DELIMITER ;