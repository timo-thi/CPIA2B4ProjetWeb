DROP IF EXISTS CREATE_COMPANY;

DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_COMPANY`(`p_name` VARCHAR(255), `p_active` BOOL, `p_link` VARCHAR(255), `p_city` VARCHAR(255), `p_zipcode` VARCHAR(20), `p_address` VARCHAR(255), `p_number` VARCHAR(20), `p_comment` VARCHAR(300))
BEGIN
	insert into company (name,active,link) VALUES (p_name,p_active,p_link);
    set @temp = last_insert_id();
    IF (p_city IN (select name FROM city) AND p_zipcode IN (SELECT zipcode from city)) then
        set @temp2 = (select id_city from city where p_city = name);
        insert into address (name,number,comment,id_city) VALUES (p_address,p_number,p_comment,@temp2);
        set @temp3 = last_insert_id();
    else 
        insert into city (name,zipcode) VALUES (p_city,p_zipcode);
        set @temp2 = last_insert_id();
        insert into address (name,number,comment,id_city) VALUES (p_address,p_number,p_comment,@temp2);
        set @temp3 = last_insert_id();
    end if;
    
    insert into localities (id_address,id_company) VALUES (@temp3,@temp);
    select @temp as id_company;
END //

DELIMITER ;
