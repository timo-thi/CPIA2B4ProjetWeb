CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_PERSON`()
BEGIN
select * from person;
END