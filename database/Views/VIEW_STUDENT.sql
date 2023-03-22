create view VIEW_STUDENT
AS
select profile.id_profile, profile.fname, profile.lname, person.id_person,prom.name as prom, person.email,if(accepted.cnt is null, 'n', 'y') as accepted, profile.id_roles, step.id_offer,step.offer, step.id_progress_state, step.state, step.startdate, step.company
from profile
left join affiliated on profile.id_profile = affiliated.id_profile
    left join prom on affiliated.id_prom = prom.id_prom
    left join person on profile.id_profile = person.id_profile
left join (select  profile.id_profile, candidature.id_offer, offer.name as offer,offer.startdate, company.name as company, candidature.id_progress_state, postulate_progress_steps.name as state
from profile
	inner join candidature on candidature.id_profile = profile.id_profile
	inner join offer on candidature.id_offer = offer.id_offer
	inner join localities on offer.id_localities = localities.id_localities
	inner join company on localities.id_company = company.id_company
	inner join postulate_progress_steps on candidature.id_progress_state = postulate_progress_steps.id_progress_state
	order by profile.id_profile) as step on step.id_profile = profile.id_profile
	left JOIN (
        select profile.id_profile, count(candidature.id_progress_state) as cnt from profile
            inner join candidature on candidature.id_profile = profile.id_profile
        where candidature.id_progress_state = 6
        group by profile.id_profile)
	as accepted on accepted.id_profile = profile.id_profile
	where profile.id_roles = 3;
