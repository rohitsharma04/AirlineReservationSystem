-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ars
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `AdminDetails`
--

DROP TABLE IF EXISTS `AdminDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminDetails` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminDetails`
--

LOCK TABLES `AdminDetails` WRITE;
/*!40000 ALTER TABLE `AdminDetails` DISABLE KEYS */;
INSERT INTO `AdminDetails` VALUES (1,'rohit','ED0gxzcsRbaceSB/eZSlwQ=='),(2,'sakshi','wWbOaKPWPKi/QFc9GY7wsw==');
/*!40000 ALTER TABLE `AdminDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AerodrumMaster`
--

DROP TABLE IF EXISTS `AerodrumMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AerodrumMaster` (
  `aerodrumId` int(11) NOT NULL,
  `aerodrumName` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aerodrumId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AerodrumMaster`
--

LOCK TABLES `AerodrumMaster` WRITE;
/*!40000 ALTER TABLE `AerodrumMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `AerodrumMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClassMaster`
--

DROP TABLE IF EXISTS `ClassMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClassMaster` (
  `classId` int(11) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassMaster`
--

LOCK TABLES `ClassMaster` WRITE;
/*!40000 ALTER TABLE `ClassMaster` DISABLE KEYS */;
INSERT INTO `ClassMaster` VALUES (1,'Business'),(2,'Economic'),(3,'First');
/*!40000 ALTER TABLE `ClassMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyMaster`
--

DROP TABLE IF EXISTS `CompanyMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyMaster` (
  `companyId` int(11) NOT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyMaster`
--

LOCK TABLES `CompanyMaster` WRITE;
/*!40000 ALTER TABLE `CompanyMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerDetails`
--

DROP TABLE IF EXISTS `CustomerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerDetails` (
  `pnrNumber` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contactNumber` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `passportId` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `flightNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`pnrNumber`),
  KEY `FK_tqjwiir3w0vldr99siiy8o8dg` (`classId`),
  KEY `FK_h67yksb0ial7h27dpb18dlk1m` (`flightNumber`),
  CONSTRAINT `FK_h67yksb0ial7h27dpb18dlk1m` FOREIGN KEY (`flightNumber`) REFERENCES `FlightMaster` (`flightNumber`),
  CONSTRAINT `FK_tqjwiir3w0vldr99siiy8o8dg` FOREIGN KEY (`classId`) REFERENCES `ClassMaster` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DayMaster`
--

DROP TABLE IF EXISTS `DayMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DayMaster` (
  `dayId` int(11) NOT NULL,
  `dayName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dayId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DayMaster`
--

LOCK TABLES `DayMaster` WRITE;
/*!40000 ALTER TABLE `DayMaster` DISABLE KEYS */;
INSERT INTO `DayMaster` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `DayMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightDayMap`
--

DROP TABLE IF EXISTS `FlightDayMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightDayMap` (
  `flightNumber` int(11) NOT NULL,
  `dayId` int(11) NOT NULL,
  KEY `FK_737doakaq27a6xociadmxnms2` (`dayId`),
  KEY `FK_h081ysilgw9p8hfkd1yl0axnb` (`flightNumber`),
  CONSTRAINT `FK_h081ysilgw9p8hfkd1yl0axnb` FOREIGN KEY (`flightNumber`) REFERENCES `FlightMaster` (`flightNumber`),
  CONSTRAINT `FK_737doakaq27a6xociadmxnms2` FOREIGN KEY (`dayId`) REFERENCES `DayMaster` (`dayId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightDayMap`
--

LOCK TABLES `FlightDayMap` WRITE;
/*!40000 ALTER TABLE `FlightDayMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `FlightDayMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightFareMap`
--

DROP TABLE IF EXISTS `FlightFareMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightFareMap` (
  `ffid` int(11) NOT NULL,
  `fare` int(11) NOT NULL,
  `numberOfSeats` int(11) NOT NULL,
  `classId` int(11) DEFAULT NULL,
  `flightNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`ffid`),
  KEY `FK_boimtybhc58pb9i00ma1plm0x` (`classId`),
  KEY `FK_5tdwtm58g6yc2y2diwske1xrh` (`flightNumber`),
  CONSTRAINT `FK_5tdwtm58g6yc2y2diwske1xrh` FOREIGN KEY (`flightNumber`) REFERENCES `FlightMaster` (`flightNumber`),
  CONSTRAINT `FK_boimtybhc58pb9i00ma1plm0x` FOREIGN KEY (`classId`) REFERENCES `ClassMaster` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightFareMap`
--

LOCK TABLES `FlightFareMap` WRITE;
/*!40000 ALTER TABLE `FlightFareMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `FlightFareMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightMaster`
--

DROP TABLE IF EXISTS `FlightMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightMaster` (
  `flightNumber` int(11) NOT NULL,
  `arrivalTime` bigint(20) NOT NULL,
  `departureTime` bigint(20) NOT NULL,
  `flightName` varchar(255) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `destinationId` int(11) DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`),
  KEY `FK_cxguqo813j91od22h71rbjuv` (`companyId`),
  KEY `FK_8wx21iu6dk7cr3gxw8t0762pr` (`destinationId`),
  KEY `FK_nlk6xjfnf11qw42tsvcoj9wft` (`fare`),
  KEY `FK_l6verq6kaw54rlby0dyg668nb` (`sourceId`),
  CONSTRAINT `FK_l6verq6kaw54rlby0dyg668nb` FOREIGN KEY (`sourceId`) REFERENCES `AerodrumMaster` (`aerodrumId`),
  CONSTRAINT `FK_8wx21iu6dk7cr3gxw8t0762pr` FOREIGN KEY (`destinationId`) REFERENCES `AerodrumMaster` (`aerodrumId`),
  CONSTRAINT `FK_cxguqo813j91od22h71rbjuv` FOREIGN KEY (`companyId`) REFERENCES `CompanyMaster` (`companyId`),
  CONSTRAINT `FK_nlk6xjfnf11qw42tsvcoj9wft` FOREIGN KEY (`fare`) REFERENCES `FlightFareMap` (`ffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightMaster`
--

LOCK TABLES `FlightMaster` WRITE;
/*!40000 ALTER TABLE `FlightMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `FlightMaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-05  1:30:59
