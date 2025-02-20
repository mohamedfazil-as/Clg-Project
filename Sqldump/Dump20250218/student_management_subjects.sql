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
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subjectcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subjectname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partno` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `cia_markmax` int NOT NULL,
  `se_markmax` int NOT NULL,
  `credit` int NOT NULL,
  PRIMARY KEY (`subjectcode`),
  UNIQUE KEY `subjectcode_UNIQUE` (`subjectcode`),
  UNIQUE KEY `subjectname_UNIQUE` (`subjectname`),
  KEY `idx_subjects_subjectcode_partno` (`subjectcode`,`partno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  0:32:48
INSERT INTO subjects (subjectcode, subjectname, partno, cia_markmax, se_markmax, credit) VALUES
-- English Literature
('ENG101', 'Introduction to English Literature', 'I', 25, 75, 4),
('ENG102', 'Poetry and Drama', 'II', 25, 75, 4),
-- Sociology
('SOC101', 'Fundamentals of Sociology', 'I', 25, 75, 4),
('SOC102', 'Social Change and Development', 'II', 25, 75, 4),
-- Psychology
('PSY101', 'General Psychology', 'I', 25, 75, 4),
('PSY102', 'Developmental Psychology', 'II', 25, 75, 4),
-- History
('HIS101', 'Ancient Indian History', 'I', 25, 75, 4),
('HIS102', 'World History', 'II', 25, 75, 4),
-- Political Science
('POL101', 'Political Theories', 'I', 25, 75, 4),
('POL102', 'Indian Constitution', 'II', 25, 75, 4),
-- Social Work
('SWK101', 'Introduction to Social Work', 'I', 25, 75, 4),
('SWK102', 'Human Behavior in Society', 'II', 25, 75, 4),
-- Business Administration
('BBA101', 'Principles of Management', 'I', 25, 75, 4),
('BBA102', 'Financial Accounting', 'II', 25, 75, 4),
-- Commerce
('COM101', 'Business Economics', 'I', 25, 75, 4),
('COM102', 'Corporate Accounting', 'II', 25, 75, 4),
-- Computer Applications
('BCA101', 'Programming in C', 'I', 25, 75, 4),
('BCA102', 'Data Structures', 'II', 25, 75, 4),
-- Information Technology
('IT101', 'Computer Networks', 'I', 25, 75, 4),
('IT102', 'Database Management Systems', 'II', 25, 75, 4),
-- Mathematics
('MATH101', 'Calculus', 'I', 25, 75, 4),
('MATH102', 'Algebra', 'II', 25, 75, 4),
-- Statistics
('STAT101', 'Probability Theory', 'I', 25, 75, 4),
('STAT102', 'Applied Statistics', 'II', 25, 75, 4),
-- Botany
('BOT101', 'Plant Anatomy', 'I', 25, 75, 4),
('BOT102', 'Plant Physiology', 'II', 25, 75, 4),
-- Chemistry
('CHEM101', 'Organic Chemistry', 'I', 25, 75, 4),
('CHEM102', 'Inorganic Chemistry', 'II', 25, 75, 4),
-- Physics
('PHY101', 'Classical Mechanics', 'I', 25, 75, 4),
('PHY102', 'Electromagnetism', 'II', 25, 75, 4),
-- Zoology
('ZOO101', 'Animal Biology', 'I', 25, 75, 4),
('ZOO102', 'Genetics', 'II', 25, 75, 4),
-- Environmental Science
('ENV101', 'Ecology and Biodiversity', 'I', 25, 75, 4),
('ENV102', 'Environmental Pollution', 'II', 25, 75, 4),
-- MBA
('MBA101', 'Marketing Management', 'I', 25, 75, 4),
('MBA102', 'Human Resource Management', 'II', 25, 75, 4),
-- MCA
('MCA101', 'Advanced Java Programming', 'I', 25, 75, 4),
('MCA102', 'Machine Learning', 'II', 25, 75, 4);
