CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_OFFER`(p_id_offer INT)
BEGIN
DELETE FROM offer
WHERE id_offer = p_id_offer;
END