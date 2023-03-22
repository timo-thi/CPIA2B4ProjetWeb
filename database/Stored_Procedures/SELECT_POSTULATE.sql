CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_POSTULATE`()
BEGIN
select * from postulate_progress_steps;
END