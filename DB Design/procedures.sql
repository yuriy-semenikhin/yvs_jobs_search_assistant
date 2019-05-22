-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.11 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for procedure yvs_job_search.procedure_add_new_agency
DROP PROCEDURE IF EXISTS `procedure_add_new_agency`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_new_agency`(IN $agency_name varchar(250), IN $default_number varchar(25), 
		IN $default_email varchar(250), OUT new_id INT)
BEGIN

IF exists (select agency_id from yvs_job_search_agency where agency_name = $agency_name)
	THEN
	select agency_id from yvs_job_search_agency where agency_name = $agency_name into new_id;
	
	ELSE
	insert into yvs_job_search_agency values (NULL, $agency_name, $default_number, $default_email);
	select last_insert_id() into new_id;
END IF;

END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_add_new_agent
DROP PROCEDURE IF EXISTS `procedure_add_new_agent`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_new_agent`(IN `$agent_name` varchar(250), IN `$agent_email` varchar(250), IN `$agent_phone` varchar(25), IN `$agent_mobile` varchar(25), IN `$agency_id` int, OUT `new_agent` int)
BEGIN

IF exists (select agent_id from yvs_job_search_agent where agent_name = $agent_name and agency_id = $agency_id)
	THEN
	select agent_id from yvs_job_search_agent where agent_name = $agent_name and agency_id = $agency_id into new_agent;
	
	ELSE
	insert into yvs_job_search_agent values (NULL, $agent_name, $agent_email, $agent_phone, $agent_mobile, $agency_id);
	select last_insert_id() into new_agent;
END IF;

END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_add_new_comment
DROP PROCEDURE IF EXISTS `procedure_add_new_comment`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_new_comment`(IN `$comment_text` text, IN `$guest_id` int, IN `$connection_type_name` VARCHAR(50), OUT `new_comment_id` int)
BEGIN

DECLARE $comment_id int;
DECLARE $connection_type int;

select connections_id from yvs_job_search_connections 
	where 
	connections_name = $connection_type_name 
	into $connection_type ;

insert into yvs_job_search_comments values (NULL, $comment_text, NOW());

select last_insert_id() into $comment_id;

insert into yvs_job_search_comments_conector values ($guest_id, $comment_id, $connection_type); 

END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_add_new_position
DROP PROCEDURE IF EXISTS `procedure_add_new_position`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_new_position`(
	in $agency_id INT   ,
	in $agent_id INT   ,
	in $type_id INT   ,
	in $progress_id INT   ,
	in $wage VARCHAR(50)   ,
	in $wage_id INT   ,
	in $position_name VARCHAR(250)   ,
	in $position_location VARCHAR(250)   ,
	in $agency_refference VARCHAR(250)   ,
	in $job_description TEXT ,
	out new_application_id INT )
BEGIN


	insert into yvs_job_search_application values (NULL , $agency_id, $agent_id, $type_id, $progress_id, $wage, $wage_id , $position_name , 
			$position_location , $agency_refference , $job_description , NOW());
	select last_insert_id() into new_application_id;


END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_edit_agency
DROP PROCEDURE IF EXISTS `procedure_edit_agency`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_edit_agency`(IN $agency_id INT, IN $agency_name varchar(250), 
			IN $default_number varchar(25), IN $agency_site varchar(250), OUT out_result varchar(50))
BEGIN

	update yvs_job_search_agency
	set 	
		agency_name = $agency_name,
		default_number = $default_number,
		agency_site = $agency_site

	where 
		agency_id = $agency_id;

set out_result = 'Done';

END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_edit_agent
DROP PROCEDURE IF EXISTS `procedure_edit_agent`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_edit_agent`(IN $agent_id INT, IN $agent_name varchar(250), 
			IN $agent_email varchar(250), IN $agent_phone varchar(25), IN $agent_mobile varchar(25),
			IN $agency_id int, OUT out_result varchar(50))
BEGIN

	update yvs_job_search_agent
	set 	
		agency_name = $agency_name,
		agent_email = $agent_email,
		agent_phone = $agent_phone,
		agent_mobile = $agent_mobile,
		agency_id = $agency_id

	where 
		agent_id = $agent_id;

set out_result = 'Done';

END//
DELIMITER ;

-- Dumping structure for procedure yvs_job_search.procedure_edit_position
DROP PROCEDURE IF EXISTS `procedure_edit_position`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_edit_position`(IN `$application_id` INT	, IN `$agency_id` INT   , IN `$agent_id` INT   , IN `$type_id` INT   , IN `$progress_id` INT   , IN `$wage` VARCHAR(50)   , IN `$wage_id` INT   , IN `$position_name` VARCHAR(250)   , IN `$position_location` VARCHAR(250)   , IN `$agency_refference` VARCHAR(250)   , IN `$job_description` TEXT , OUT `out_id` INT)
BEGIN


	update yvs_job_search_application  
	set 
		agency_id = $agency_id, 
		agent_id = $agent_id, 
		type_id = $type_id, 
		progress_id = $progress_id, 
		wage = $wage, 
		wage_id = $wage_id , 
		position_name = $position_name , 
		position_location = $position_location , 
		agency_refference = $agency_refference , 
		job_description = $job_description 
	where 
		application_id = $application_id;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
