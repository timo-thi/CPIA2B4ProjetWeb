CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATION_ACTIVITY`(p_name VARCHAR(255))
BEGIN
insert into activity (name) values (p_name);
END