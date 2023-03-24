DROP VIEW IF EXISTS view_offer;

create view view_offer
AS
select offer.id_offer, offer.name, offer.link, company.name as company, city.name as city, city.zipcode
	from offer
		inner join localities on offer.id_localities = localities.id_localities
		inner join company on localities.id_company = company.id_company
		inner join address on localities.id_address = address.id_address
		inner join city on address.id_city = city.id_city;