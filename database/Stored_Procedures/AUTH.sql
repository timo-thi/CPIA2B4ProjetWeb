CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH`()
BEGIN
SELECT email, password FROM person;
END