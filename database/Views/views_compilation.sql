DROP VIEW IF EXISTS VIEW_OFFER;

create view VIEW_OFFER
AS
select offer.id_offer, offer.name, offer.link, company.name as company, city.name as city, city.zipcode
	from offer
		inner join localities on offer.id_localities = localities.id_localities
		inner join company on localities.id_company = company.id_company
		inner join address on localities.id_address = address.id_address
		inner join city on address.id_city = city.id_city;
DROP VIEW IF EXISTS VIEW_PILOTS;

CREATE VIEW VIEW_PILOTS
AS
	select profile.id_profile, profile.fname, profile.lname, person.email, profile.id_roles,prom.name as prom, number.num as student_count,campus.id_campus, campus.name as campus,address.id_address, address.name as address, address.number, address.comment, city.name as city
	from profile
		left join person on profile.id_profile = person.id_profile
		left join affiliated on profile.id_profile = affiliated.id_profile
		left join prom on affiliated.id_prom = prom.id_prom
		left join campus on prom.id_campus = campus.id_campus
		left join address on campus.id_address = address.id_address
		left join city on address.id_city = city.id_city
		left join (select affiliated.id_prom, count(affiliated.id_profile) as num
	from profile
		inner join affiliated on profile.id_profile = affiliated.id_profile
	group by affiliated.id_prom) as number on prom.id_prom = number.id_prom
	where profile.id_roles = 2
	order by profile.id_profile;
drop view if exists VIEW_STUDENT;

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
