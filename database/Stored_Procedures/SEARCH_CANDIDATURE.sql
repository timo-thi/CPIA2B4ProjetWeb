DROP PROCEDURE IF EXISTS FIND_CANDIDATURE;

DELIMITER //

CREATE PROCEDURE FIND_CANDIDATURE(p_id_profile INT)
BEGIN
	SELECT id_progress_state, send_date, candidature.id_offer, name, company, city, zipcode
	FROM profile
		LEFT JOIN candidature ON profile.id_profile = candidature.id_profile
		LEFT JOIN VIEW_OFFER ON VIEW_OFFER.id_offer = candidature.id_offer
	where profile.id_profile = p_id_profile;
END //

DELIMITER ;
