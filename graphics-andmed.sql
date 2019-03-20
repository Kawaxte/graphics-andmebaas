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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'MSI'),(2,'ASUS'),(3,'XFX'),(4,'Sapphire'),(5,'PowerColor');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,1,'RX 590','RX 590 ARMOR 8G OC'),(2,1,1,'RX 590','RX 590 ARMOR 8G'),(3,1,1,'RX 580','RX 580 ARMOR 8G OC'),(4,1,1,'RX 580','RX 580 ARMOR 8G'),(5,1,1,'RX 580','RX 580 ARMOR 4G OC'),(6,1,1,'RX 580','RX 580 ARMOR 4G'),(7,1,1,'RX 570','RX 570 ARMOR 8G OC'),(8,1,1,'RX 570','RX 570 ARMOR 8G'),(9,1,1,'RX 570','RX 570 ARMOR 4G OC'),(10,1,1,'RX 570','RX 570 ARMOR 4G');
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
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,'ARMOR'),(2,1,'ARMOR MK2'),(3,1,'MECH 2'),(4,1,'AERO ITX'),(5,1,'LP'),(6,2,'ROG STRIX'),(7,2,'Expedition'),(8,2,'DUAL'),(9,2,'Phoenix'),(10,3,'Fatboy'),(11,3,'GTS XXX'),(12,3,'GTS Black Core'),(13,3,'GTS Black'),(14,3,'GTR-S Black'),(15,3,'GTR-S'),(16,3,'GTR XXX'),(17,3,'GTR Black'),(18,3,'Core'),(19,3,'RS XXX'),(20,3,'RS Black'),(21,3,'LP'),(22,3,'Slim'),(23,4,'NITRO+'),(24,4,'NITRO'),(25,4,'PULSE'),(26,4,'PULSE LP'),(27,4,'PULSE SP LP'),(28,5,'Red Devil'),(29,5,'Red Dragon'),(30,5,'NANO'),(31,5,'Red Devil Golden');
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
  `core` int(4) DEFAULT NULL,
  `memory` int(5) DEFAULT NULL,
  `memory_type` varchar(6) DEFAULT NULL,
  `render_units` int(3) DEFAULT NULL,
  `shader_units` int(5) DEFAULT NULL,
  `directx` varchar(4) DEFAULT NULL,
  `shader` varchar(3) DEFAULT NULL,
  `opengl` varchar(3) DEFAULT NULL,
  `wattage` int(3) DEFAULT NULL,
  PRIMARY KEY (`specs_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `specs_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs`
--

LOCK TABLES `specs` WRITE;
/*!40000 ALTER TABLE `specs` DISABLE KEYS */;
INSERT INTO `specs` VALUES (1,1,'12nm',1565,8000,'GDDR5',32,2304,'12.0','6.0','4.6',220),(2,2,'12nm',1545,8000,'GDDR5',32,2304,'12.0','6.0','4.6',220),(3,3,'14nm',1366,8000,'GDDR5',32,2304,'12.0','6.0','4.6',185),(4,4,'14nm',1340,8000,'GDDR5',32,2304,'12.0','6.0','4.6',185),(5,5,'14nm',1368,8000,'GDDR5',32,2304,'12.0','6.0','4.6',185),(6,6,'14nm',1340,8000,'GDDR5',32,2304,'12.0','6.0','4.6',185),(7,7,'14nm',1268,7000,'GDDR5',32,2048,'12.0','6.0','4.6',150),(8,8,'14nm',1244,7000,'GDDR5',32,2048,'12.0','6.0','4.6',150),(9,9,'14nm',1268,7000,'GDDR5',32,2048,'12.0','6.0','4.6',150),(10,10,'14nm',1244,7000,'GDDR5',32,2048,'12.0','6.0','4.6',150);
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

-- Dump completed on 2019-03-20 20:42:26
