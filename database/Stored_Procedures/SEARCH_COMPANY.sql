CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_COMPANY`(p_id_company INT)
BEGIN
select company.name, COUNT(candidature.id_progress_state) as 'recu'
from candidature 
inner join postulate_progress_steps as p on candidature.id_progress_state = p.id_progress_state 
inner join offer on candidature.id_offer = offer.id_offer
inner join localities on offer.id_localities = localities.id_localities 
inner join company on localities.id_company = company.id_company
WHERE p.name ='Acceptée' and company.id_company = p_id_company;
END