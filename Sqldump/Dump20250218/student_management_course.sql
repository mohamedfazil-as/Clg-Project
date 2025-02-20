-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student_management
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `coursecode` varchar(20) NOT NULL,
  `coursename` varchar(200) NOT NULL,
  `imple_date` date NOT NULL,
  `isActive` char(1) DEFAULT 'Y',
  `discont_date` date DEFAULT NULL,
  PRIMARY KEY (`coursecode`),
  UNIQUE KEY `coursecode_UNIQUE` (`coursecode`),
  UNIQUE KEY `coursename_UNIQUE` (`coursename`),
  KEY `idx_course_code_nm` (`coursecode`,`coursename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  0:32:49
INSERT INTO course (coursecode, coursename, imple_date, isActive, discont_date) VALUES
('BAE101', 'Bachelor of Arts in English Literature', '2020-06-01', 'Y', NULL),
('BAS101', 'Bachelor of Arts in Sociology', '2021-07-01', 'Y', NULL),
('BAP101', 'Bachelor of Arts in Psychology', '2019-06-01', 'Y', NULL),
('BAH101', 'Bachelor of Arts in History', '2018-06-01', 'Y', NULL),
('BAPO101', 'Bachelor of Arts in Political Science', '2020-08-01', 'Y', NULL),
('BASW101', 'Bachelor of Arts in Social Work', '2017-06-01', 'Y', NULL),
('BBA101', 'Bachelor of Business Administration', '2021-07-01', 'Y', NULL),
('BBM101', 'Bachelor of Business Management', '2018-06-01', 'Y', NULL),
('BCO101', 'Bachelor of Commerce', '2019-07-01', 'Y', NULL),
('BCA101', 'Bachelor of Computer Applications', '2020-06-01', 'Y', NULL),
('BSCIT101', 'Bachelor of Science in Information Technology', '2019-06-01', 'Y', NULL),
('BSCM101', 'Bachelor of Science in Mathematics', '2021-06-01', 'Y', NULL),
('BSCST101', 'Bachelor of Science in Statistics', '2020-07-01', 'Y', NULL),
('BSCB101', 'Bachelor of Science in Botany', '2019-06-01', 'Y', NULL),
('BSCC101', 'Bachelor of Science in Chemistry', '2021-06-01', 'Y', NULL),
('BSCP101', 'Bachelor of Science in Physics', '2022-07-01', 'Y', NULL),
('BSCZ101', 'Bachelor of Science in Zoology', '2021-06-01', 'Y', NULL),
('BSCE101', 'Bachelor of Science in Environmental Science', '2020-06-01', 'Y', NULL),
('MCA101', 'Master of Computer Applications', '2019-06-01', 'Y', NULL),
('MSCIT101', 'Master of Science in Information Technology', '2020-07-01', 'Y', NULL),
('MSCST101', 'Master of Science in Statistics', '2021-06-01', 'Y', NULL),
('MSCM101', 'Master of Science in Mathematics', '2019-06-01', 'Y', NULL),
('MSCC101', 'Master of Science in Chemistry', '2018-06-01', 'Y', NULL),
('MSCB101', 'Master of Science in Botany', '2020-07-01', 'Y', NULL),
('MSCP101', 'Master of Science in Physics', '2019-06-01', 'Y', NULL),
('MSCZ101', 'Master of Science in Zoology', '2021-06-01', 'Y', NULL),
('MBA101', 'Master of Business Administration', '2021-07-01', 'Y', NULL),
('MCOM101', 'Master of Commerce', '2018-06-01', 'Y', NULL),
('MAE101', 'Master of Arts in English Literature', '2020-06-01', 'Y', NULL),
('MAS101', 'Master of Arts in Sociology', '2019-06-01', 'Y', NULL);
