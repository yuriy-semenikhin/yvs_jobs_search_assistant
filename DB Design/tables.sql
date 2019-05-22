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


-- Dumping database structure for yvs_job_search
DROP DATABASE IF EXISTS `yvs_job_search`;
CREATE DATABASE IF NOT EXISTS `yvs_job_search` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yvs_job_search`;

-- Dumping structure for table yvs_job_search.yvs_job_search_agency
DROP TABLE IF EXISTS `yvs_job_search_agency`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_agency` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(250) NOT NULL,
  `default_number` varchar(25) DEFAULT NULL,
  `agency_site` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`agency_id`,`agency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_agent
DROP TABLE IF EXISTS `yvs_job_search_agent`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(250) NOT NULL,
  `agent_email` varchar(250) DEFAULT NULL,
  `agent_phone` varchar(25) DEFAULT NULL,
  `agent_mobile` varchar(25) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`agent_id`,`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_application
DROP TABLE IF EXISTS `yvs_job_search_application`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `progress_id` int(11) DEFAULT NULL,
  `wage` varchar(50) DEFAULT NULL,
  `wage_id` int(11) DEFAULT NULL,
  `position_name` varchar(250) DEFAULT NULL,
  `position_location` varchar(250) DEFAULT NULL,
  `agency_refference` varchar(250) DEFAULT NULL,
  `job_description` text,
  `date_submited` datetime DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_application_comments
DROP TABLE IF EXISTS `yvs_job_search_application_comments`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_application_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `comment_text` text,
  `comment_date` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_application_progress
DROP TABLE IF EXISTS `yvs_job_search_application_progress`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_application_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `progress_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_application_type
DROP TABLE IF EXISTS `yvs_job_search_application_type`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_application_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_comments
DROP TABLE IF EXISTS `yvs_job_search_comments`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` text,
  `comment_date` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_comments_conector
DROP TABLE IF EXISTS `yvs_job_search_comments_conector`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_comments_conector` (
  `guest_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `connections_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_connections
DROP TABLE IF EXISTS `yvs_job_search_connections`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_connections` (
  `connections_id` int(11) NOT NULL AUTO_INCREMENT,
  `connections_name` varchar(50) NOT NULL,
  PRIMARY KEY (`connections_id`),
  UNIQUE KEY `connections_name` (`connections_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table yvs_job_search.yvs_job_search_wage_type
DROP TABLE IF EXISTS `yvs_job_search_wage_type`;
CREATE TABLE IF NOT EXISTS `yvs_job_search_wage_type` (
  `wage_id` int(11) NOT NULL AUTO_INCREMENT,
  `wage_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`wage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- Dumping data for table yvs_job_search.yvs_job_search_connections: ~3 rows (approximately)
DELETE FROM `yvs_job_search_connections`;
/*!40000 ALTER TABLE `yvs_job_search_connections` DISABLE KEYS */;
INSERT INTO `yvs_job_search_connections` (`connections_id`, `connections_name`) VALUES
	(1, 'Agency'),
	(2, 'Agent'),
	(3, 'Application');
/*!40000 ALTER TABLE `yvs_job_search_connections` ENABLE KEYS */;

-- Dumping data for table yvs_job_search.yvs_job_search_wage_type: ~4 rows (approximately)
DELETE FROM `yvs_job_search_wage_type`;
/*!40000 ALTER TABLE `yvs_job_search_wage_type` DISABLE KEYS */;
INSERT INTO `yvs_job_search_wage_type` (`wage_id`, `wage_name`) VALUES
	(1, 'Per Day'),
	(2, 'Per Hour'),
	(3, 'Per Month'),
	(4, 'Per Year');
/*!40000 ALTER TABLE `yvs_job_search_wage_type` ENABLE KEYS */;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
