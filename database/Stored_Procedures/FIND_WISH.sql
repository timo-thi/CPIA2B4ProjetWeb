DROP PROCEDURE IF EXISTS FIND_WISH;

DELIMITER //

CREATE PROCEDURE FIND_WISH(p_id_profile INT)
BEGIN
	SELECT wish.id_offer, name, company, city, zipcode
	FROM profile
		LEFT JOIN wish ON profile.id_profile = wish.id_profile
		LEFT JOIN VIEW_OFFER ON VIEW_OFFER.id_offer = wish.id_offer
	where profile.id_profile = p_id_profile;
END //

DELIMITER ;
