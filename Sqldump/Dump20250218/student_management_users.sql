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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  0:32:46
INSERT INTO `users` (`username`, `password`, `email`) VALUES
('arun_kumar', 'hashed_password_1', 'arun.kumar@example.com'),
('siva_prakash', 'hashed_password_2', 'siva.prakash@example.com'),
('karthik_rajan', 'hashed_password_3', 'karthik.rajan@example.com'),
('deepak_mohan', 'hashed_password_4', 'deepak.mohan@example.com'),
('muthu_krishnan', 'hashed_password_5', 'muthu.krishnan@example.com'),
('vijay_anand', 'hashed_password_6', 'vijay.anand@example.com'),
('priya_dharshini', 'hashed_password_7', 'priya.dharshini@example.com'),
('divya_shree', 'hashed_password_8', 'divya.shree@example.com'),
('naveen_kannan', 'hashed_password_9', 'naveen.kannan@example.com'),
('hari_haran', 'hashed_password_10', 'hari.haran@example.com'),
('rajkumar_senthil', 'hashed_password_11', 'rajkumar.senthil@example.com'),
('sowmya_ravi', 'hashed_password_12', 'sowmya.ravi@example.com'),
('bala_murugan', 'hashed_password_13', 'bala.murugan@example.com'),
('keerthi_vasan', 'hashed_password_14', 'keerthi.vasan@example.com'),
('gokul_nath', 'hashed_password_15', 'gokul.nath@example.com'),
('hema_latha', 'hashed_password_16', 'hema.latha@example.com'),
('senthil_kumar', 'hashed_password_17', 'senthil.kumar@example.com'),
('saranya_meena', 'hashed_password_18', 'saranya.meena@example.com'),
('anbu_selvan', 'hashed_password_19', 'anbu.selvan@example.com'),
('uma_maheswari', 'hashed_password_20', 'uma.maheswari@example.com');
