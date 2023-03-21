CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_COMPANY`(p_name VARCHAR(255),p_active bool,p_link VARCHAR(255),p_city VARCHAR(255),p_zipcode VARCHAR(20),p_address VARCHAR(255),p_number VARCHAR(20),p_comment VARCHAR(300))
BEGIN
insert into company (name,active,link) VALUES (p_name,p_active,p_link);
set @temp = last_insert_id();
insert into city (name,zipcode) VALUES (p_city,p_zipcode);
set @temp2 = last_insert_id();
insert into address (name,number,comment,id_city) VALUES (p_address,p_number,p_comment,@temp2);
set @temp3 = last_insert_id();
insert into localities (id_address,id_company) VALUES (@temp3,@temp);
END