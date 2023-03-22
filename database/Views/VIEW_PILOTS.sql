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