-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: graphics
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'ASUS'),(2,'MSi'),(3,'Gigabyte'),(4,'PowerColor'),(5,'Sapphire'),(6,'XFX'),(7,'HIS'),(8,'VisionTek'),(9,'ASRock'),(10,'Diamond'),(11,'Colorful');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codename`
--

DROP TABLE IF EXISTS `codename`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codename` (
  `code_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codename`
--

LOCK TABLES `codename` WRITE;
/*!40000 ALTER TABLE `codename` DISABLE KEYS */;
INSERT INTO `codename` VALUES (1,'Polaris 30 XT'),(2,'Polaris 20 XT'),(3,'Polaris 20 XL'),(4,'Baffin'),(5,'Lexa');
/*!40000 ALTER TABLE `codename` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `series_id` (`series_id`),
  KEY `brand_id` (`brand_id`),
  KEY `code_id` (`code_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`),
  CONSTRAINT `model_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `model_ibfk_3` FOREIGN KEY (`code_id`) REFERENCES `codename` (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,1,1,'RX 590','ROG-STRIX-RX590-8G-GAMING'),(2,1,1,2,'RX 580','ROG-STRIX-RX580-O8G-GAMING'),(3,1,1,2,'RX 580','ROG-STRIX-RX580-T8G-GAMING'),(4,1,1,2,'RX 580','ROG-STRIX-RX580-8G-GAMING'),(5,1,2,2,'RX 580','AREZ-STRIX-RX580-O8G-GAMING'),(6,1,2,2,'RX 580','AREZ-STRIX-RX580-T8G-GAMING'),(7,1,2,2,'RX 580','AREZ-STRIX-RX580-8G-GAMING'),(8,1,3,2,'RX 580','DUAL-RX580-O8G'),(9,1,3,2,'RX 580','DUAL-RX580-8G'),(10,1,3,2,'RX 580','DUAL-RX580-O4G'),(11,1,3,2,'RX 580','DUAL-RX580-4G'),(12,1,4,2,'RX 580','AREZ-RX580-O8G'),(13,1,4,2,'RX 580','AREZ-RX580-8G'),(14,1,4,2,'RX 580','AREZ-RX580-O4G'),(15,1,4,2,'RX 580','AREZ-RX580-4G');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,'ROG Strix'),(2,1,'AREZ Strix'),(3,1,'Dual'),(4,1,'AREZ Dual'),(5,1,'Expedition'),(6,1,'AREZ Expedition'),(7,1,'(Default)'),(8,1,'AREZ (Default)'),(9,1,'Phoenix'),(10,1,'AREZ Phoenix');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs`
--

DROP TABLE IF EXISTS `specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs` (
  `specs_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `process` varchar(10) DEFAULT NULL,
  `memory` int(5) DEFAULT NULL,
  `memory_type` varchar(6) DEFAULT NULL,
  `render_units` int(3) DEFAULT NULL,
  `shader_units` int(3) DEFAULT NULL,
  `directx` varchar(4) DEFAULT NULL,
  `shader` varchar(3) DEFAULT NULL,
  `opengl` varchar(3) DEFAULT NULL,
  `wattage` int(3) DEFAULT NULL,
  PRIMARY KEY (`specs_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `specs_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs`
--

LOCK TABLES `specs` WRITE;
/*!40000 ALTER TABLE `specs` DISABLE KEYS */;
INSERT INTO `specs` VALUES (1,1,'12nm',8192,'GDDR5',32,2304,'12.0','6.0','4.6',175);
/*!40000 ALTER TABLE `specs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 21:32:57
