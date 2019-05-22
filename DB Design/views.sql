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

-- Dumping structure for view yvs_job_search.view_agency_last_update
DROP VIEW IF EXISTS `view_agency_last_update`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_agency_last_update` (
	`agency_id` INT(11) NOT NULL,
	`agency_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`comment_text` TEXT NULL COLLATE 'utf8_general_ci',
	`last_updated` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_agency_names
DROP VIEW IF EXISTS `view_agency_names`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_agency_names` (
	`agency_id` INT(11) NOT NULL,
	`agency_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_agent_names
DROP VIEW IF EXISTS `view_agent_names`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_agent_names` (
	`agency_id` INT(11) NULL,
	`agent_id` INT(11) NOT NULL,
	`agent_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_application_comments
DROP VIEW IF EXISTS `view_application_comments`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_application_comments` (
	`application_id` INT(11) NOT NULL,
	`comment_date` DATE NULL,
	`comment_id` INT(11) NOT NULL,
	`comment_text` TEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_full_application_info
DROP VIEW IF EXISTS `view_full_application_info`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_full_application_info` (
	`agency_id` INT(11) NULL,
	`agency_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`agency_refference` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`agency_site` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`agent_email` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`agent_id` INT(11) NULL,
	`agent_mobile` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`agent_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`agent_phone` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`application_id` INT(11) NOT NULL,
	`default_number` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`job_description` TEXT NULL COLLATE 'utf8_general_ci',
	`position_location` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`position_name` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`progress_id` INT(11) NULL,
	`progress_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`type_id` INT(11) NULL,
	`type_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`wage` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`wage_id` INT(11) NULL,
	`wage_name` VARCHAR(15) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_short_application_info
DROP VIEW IF EXISTS `view_short_application_info`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_short_application_info` (
	`agency_id` INT(11) NOT NULL,
	`agency_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`agent_id` INT(11) NOT NULL,
	`agent_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`application_id` INT(11) NOT NULL,
	`comment_text` TEXT NULL COLLATE 'utf8_general_ci',
	`position_name` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`progress_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_single_agent_info
DROP VIEW IF EXISTS `view_single_agent_info`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_single_agent_info` (
	`agency_id` INT(11) NULL,
	`agency_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`agent_email` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`agent_id` INT(11) NOT NULL,
	`agent_mobile` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`agent_name` VARCHAR(250) NOT NULL COLLATE 'utf8_general_ci',
	`agent_phone` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`default_number` VARCHAR(25) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view yvs_job_search.view_agency_last_update
DROP VIEW IF EXISTS `view_agency_last_update`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_agency_last_update`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_agency_last_update` AS select `yvs_job_search_agency`.`agency_id` AS `agency_id`,`yvs_job_search_agency`.`agency_name` AS `agency_name`,`yvs_job_search_comments`.`comment_date` AS `last_updated`,`yvs_job_search_comments`.`comment_text` AS `comment_text` from (((`yvs_job_search_agency` join `yvs_job_search_application` on(((`yvs_job_search_application`.`agency_id` = `yvs_job_search_agency`.`agency_id`) and (`yvs_job_search_application`.`application_id` = (select max(`yvs_job_search_application`.`application_id`) from `yvs_job_search_application` where (`yvs_job_search_application`.`agency_id` = `yvs_job_search_agency`.`agency_id`)))))) join `yvs_job_search_comments_conector` on((`yvs_job_search_comments_conector`.`guest_id` = `yvs_job_search_application`.`application_id`))) join `yvs_job_search_comments` on(((`yvs_job_search_comments`.`comment_id` = `yvs_job_search_comments_conector`.`comment_id`) and (`yvs_job_search_comments`.`comment_id` = (select max(`yvs_job_search_comments_conector`.`comment_id`) from `yvs_job_search_comments_conector` where (`yvs_job_search_comments_conector`.`guest_id` = `yvs_job_search_application`.`application_id`)))))) order by `yvs_job_search_agency`.`agency_name` asc;

-- Dumping structure for view yvs_job_search.view_agency_names
DROP VIEW IF EXISTS `view_agency_names`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_agency_names`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_agency_names` AS select `yvs_job_search_agency`.`agency_id` AS `agency_id`,`yvs_job_search_agency`.`agency_name` AS `agency_name` from `yvs_job_search_agency` order by `yvs_job_search_agency`.`agency_name`;

-- Dumping structure for view yvs_job_search.view_agent_names
DROP VIEW IF EXISTS `view_agent_names`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_agent_names`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_agent_names` AS select `yvs_job_search_agent`.`agent_id` AS `agent_id`,`yvs_job_search_agent`.`agent_name` AS `agent_name`,`yvs_job_search_agent`.`agency_id` AS `agency_id` from `yvs_job_search_agent` order by `yvs_job_search_agent`.`agent_name`;

-- Dumping structure for view yvs_job_search.view_application_comments
DROP VIEW IF EXISTS `view_application_comments`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_application_comments`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_application_comments` AS select `yvs_job_search_application`.`application_id` AS `application_id`,`yvs_job_search_comments`.`comment_id` AS `comment_id`,`yvs_job_search_comments`.`comment_text` AS `comment_text`,`yvs_job_search_comments`.`comment_date` AS `comment_date` from ((`yvs_job_search_application` join `yvs_job_search_comments_conector` on(((`yvs_job_search_application`.`application_id` = `yvs_job_search_comments_conector`.`guest_id`) and (`yvs_job_search_comments_conector`.`connections_id` = 3)))) join `yvs_job_search_comments` on((`yvs_job_search_comments_conector`.`comment_id` = `yvs_job_search_comments`.`comment_id`))) order by `yvs_job_search_comments`.`comment_id` desc;

-- Dumping structure for view yvs_job_search.view_full_application_info
DROP VIEW IF EXISTS `view_full_application_info`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_full_application_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_full_application_info` AS select `yvs_job_search_application`.`application_id` AS `application_id`,`yvs_job_search_application`.`progress_id` AS `progress_id`,`yvs_job_search_application_progress`.`progress_name` AS `progress_name`,`yvs_job_search_application`.`type_id` AS `type_id`,`yvs_job_search_application_type`.`type_name` AS `type_name`,`yvs_job_search_application`.`wage` AS `wage`,`yvs_job_search_application`.`wage_id` AS `wage_id`,`yvs_job_search_wage_type`.`wage_name` AS `wage_name`,`yvs_job_search_application`.`position_name` AS `position_name`,`yvs_job_search_application`.`agency_refference` AS `agency_refference`,`yvs_job_search_application`.`position_location` AS `position_location`,`yvs_job_search_application`.`job_description` AS `job_description`,`yvs_job_search_application`.`agency_id` AS `agency_id`,`yvs_job_search_agency`.`agency_name` AS `agency_name`,`yvs_job_search_agency`.`default_number` AS `default_number`,`yvs_job_search_agency`.`agency_site` AS `agency_site`,`yvs_job_search_application`.`agent_id` AS `agent_id`,`yvs_job_search_agent`.`agent_name` AS `agent_name`,`yvs_job_search_agent`.`agent_email` AS `agent_email`,`yvs_job_search_agent`.`agent_phone` AS `agent_phone`,`yvs_job_search_agent`.`agent_mobile` AS `agent_mobile` from (((((`yvs_job_search_application` join `yvs_job_search_application_progress` on((`yvs_job_search_application`.`progress_id` = `yvs_job_search_application_progress`.`progress_id`))) join `yvs_job_search_application_type` on((`yvs_job_search_application`.`type_id` = `yvs_job_search_application_type`.`type_id`))) join `yvs_job_search_wage_type` on((`yvs_job_search_application`.`wage_id` = `yvs_job_search_wage_type`.`wage_id`))) join `yvs_job_search_agency` on((`yvs_job_search_application`.`agency_id` = `yvs_job_search_agency`.`agency_id`))) join `yvs_job_search_agent` on((`yvs_job_search_application`.`agent_id` = `yvs_job_search_agent`.`agent_id`)));

-- Dumping structure for view yvs_job_search.view_short_application_info
DROP VIEW IF EXISTS `view_short_application_info`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_short_application_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_short_application_info` AS select `yvs_job_search_application`.`application_id` AS `application_id`,`yvs_job_search_application_progress`.`progress_name` AS `progress_name`,`yvs_job_search_application`.`position_name` AS `position_name`,`yvs_job_search_agency`.`agency_name` AS `agency_name`,`yvs_job_search_agent`.`agent_name` AS `agent_name`,`yvs_job_search_comments`.`comment_text` AS `comment_text`,`yvs_job_search_agency`.`agency_id` AS `agency_id`,`yvs_job_search_agent`.`agent_id` AS `agent_id` from ((((`yvs_job_search_application` join `yvs_job_search_application_progress` on((`yvs_job_search_application_progress`.`progress_id` = `yvs_job_search_application`.`progress_id`))) join `yvs_job_search_agency` on((`yvs_job_search_agency`.`agency_id` = `yvs_job_search_application`.`agency_id`))) join `yvs_job_search_agent` on((`yvs_job_search_agent`.`agent_id` = `yvs_job_search_application`.`agent_id`))) left join `yvs_job_search_comments` on((`yvs_job_search_comments`.`comment_id` = (select max(`yvs_job_search_comments_conector`.`comment_id`) from `yvs_job_search_comments_conector` where (`yvs_job_search_comments_conector`.`guest_id` = `yvs_job_search_application`.`application_id`))))) order by `yvs_job_search_application`.`application_id` desc;

-- Dumping structure for view yvs_job_search.view_single_agent_info
DROP VIEW IF EXISTS `view_single_agent_info`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_single_agent_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_single_agent_info` AS select `yvs_job_search_agent`.`agent_id` AS `agent_id`,`yvs_job_search_agent`.`agent_name` AS `agent_name`,`yvs_job_search_agent`.`agent_email` AS `agent_email`,`yvs_job_search_agent`.`agent_phone` AS `agent_phone`,`yvs_job_search_agent`.`agent_mobile` AS `agent_mobile`,`yvs_job_search_agent`.`agency_id` AS `agency_id`,`yvs_job_search_agency`.`agency_name` AS `agency_name`,`yvs_job_search_agency`.`default_number` AS `default_number` from (`yvs_job_search_agent` join `yvs_job_search_agency` on((`yvs_job_search_agent`.`agency_id` = `yvs_job_search_agency`.`agency_id`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
