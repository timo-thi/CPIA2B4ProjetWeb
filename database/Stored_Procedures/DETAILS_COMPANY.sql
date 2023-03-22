DROP procedure if exists DETAILS_COMPANY;

DELIMITER //

CREATE DEFINER=`inge-tim`@`localhost` PROCEDURE `DETAILS_COMPANY`(p_id_company INT)
begin
	SELECT  company.id_company, company.name, company.link, IFNULL(cesi_accepted, 0) as cesi_accepted FROM company
    LEFT JOIN
	(SELECT localities.id_company, count(*) as cesi_accepted FROM candidature
	inner join offer on candidature.id_offer = offer.id_offer
	inner join postulate_progress_steps on postulate_progress_steps.id_progress_state = candidature.id_progress_state
	inner join localities on localities.id_localities = offer.id_localities
	left join company on company.id_company = localities.id_company
	WHERE postulate_progress_steps.name = "Acceptée" and localities.id_company = p_id_company
	GROUP BY localities.id_company) as CESICOUNT ON CESICOUNT.id_company = company.id_company
    WHERE company.id_company = p_id_company;
END //

DELIMITER ;
