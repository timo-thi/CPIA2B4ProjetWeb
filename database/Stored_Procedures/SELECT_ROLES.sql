CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_ROLES`()
BEGIN
select * from roles;
END