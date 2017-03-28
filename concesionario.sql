-- MySQL dump 10.13  Distrib 5.7.17, for osx10.11 (x86_64)
--
-- Host: localhost    Database: concesionario
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Current Database: `concesionario`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `concesionario` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `concesionario`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Victor','Salgado','5 DE MAYO 1038','91287-51634','vsalgado@mail.com'),(2,'Armando ','Garcia','CALLE IGNACIO MATIAS NO.6','01 287 5 36 65','agarcia@mail.com'),(3,'Maria','Aguilar','CALLE MORELOS NO. 72-B','91-( 287 )5-23-0','maguilar@mail.com'),(4,'Alfredo','Trejo','AV. 20 DE NOVIEMBRE NO. 963','01 287 5 18 02 - 5 32 59','atrejo@mail.com'),(5,'Ruben','Hernandez','BLVD. FRANCISCO FERNANDEZ ARTEAGA NO.1984','91-(287)- 5-19-86','rhernadez@mail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionario`
--

DROP TABLE IF EXISTS `concesionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionario` (
  `concesionario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`concesionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionario`
--

LOCK TABLES `concesionario` WRITE;
/*!40000 ALTER TABLE `concesionario` DISABLE KEYS */;
INSERT INTO `concesionario` VALUES (1,'Concesionario nissan','CALLE AGUSTIN LARA NO. 69-B'),(2,'Concesionario hyundai','CARRETERA A LOMA ALTA S/N.'),(3,'Concesionario toyota','AV. 20 DE NOVIEMBRE ESQ. JUAREZ');
/*!40000 ALTER TABLE `concesionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultor`
--

DROP TABLE IF EXISTS `consultor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultor` (
  `consultor_id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionario_id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`consultor_id`),
  KEY `concesionario_id` (`concesionario_id`),
  CONSTRAINT `consultor_ibfk_1` FOREIGN KEY (`concesionario_id`) REFERENCES `concesionario` (`concesionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultor`
--

LOCK TABLES `consultor` WRITE;
/*!40000 ALTER TABLE `consultor` DISABLE KEYS */;
INSERT INTO `consultor` VALUES (1,1,'Arnold','Paye','apaye','123'),(2,1,'Mauricio','Rojas','mrojas','123'),(3,2,'Juan','Perez','jperez','123'),(4,3,'Raul','Gutierrez','rgutierrez','123'),(5,2,'Pedro','Torrez','ptorrez','123');
/*!40000 ALTER TABLE `consultor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspeccion`
--

DROP TABLE IF EXISTS `inspeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspeccion` (
  `inspeccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultor_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `pagado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`inspeccion_id`),
  KEY `consultor_id` (`consultor_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `inspeccion_ibfk_1` FOREIGN KEY (`consultor_id`) REFERENCES `consultor` (`consultor_id`),
  CONSTRAINT `inspeccion_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspeccion`
--

LOCK TABLES `inspeccion` WRITE;
/*!40000 ALTER TABLE `inspeccion` DISABLE KEYS */;
INSERT INTO `inspeccion` VALUES (1,1,3,'2017-03-02 08:30:00',1),(2,1,5,'2017-03-20 14:00:00',0),(3,2,6,'2017-03-20 17:00:00',1),(4,3,4,'2017-03-19 10:00:00',0),(5,3,6,'2017-03-24 13:00:00',0),(6,4,9,'2017-03-27 09:30:00',0),(7,3,7,'2017-03-22 15:00:00',1),(8,3,8,'2017-03-23 11:20:00',0),(9,5,1,'2017-03-22 10:30:00',1);
/*!40000 ALTER TABLE `inspeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspeccion_servicio`
--

DROP TABLE IF EXISTS `inspeccion_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspeccion_servicio` (
  `inspeccion_servicio_id` int(11) NOT NULL AUTO_INCREMENT,
  `inspeccion_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`inspeccion_servicio_id`),
  KEY `inspeccion_id` (`inspeccion_id`),
  KEY `servicio_id` (`servicio_id`),
  CONSTRAINT `inspeccion_servicio_ibfk_1` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspeccion` (`inspeccion_id`),
  CONSTRAINT `inspeccion_servicio_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`servicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspeccion_servicio`
--

LOCK TABLES `inspeccion_servicio` WRITE;
/*!40000 ALTER TABLE `inspeccion_servicio` DISABLE KEYS */;
INSERT INTO `inspeccion_servicio` VALUES (1,1,1),(2,1,3),(3,1,6),(4,2,1),(5,2,2),(6,3,1),(7,3,3),(8,4,1),(9,4,2),(10,4,3),(11,4,4),(12,5,1),(13,5,6),(14,6,1),(15,6,6),(16,7,1),(17,7,2),(18,8,2),(19,8,3),(20,8,5),(21,9,1),(22,9,2),(23,9,3),(24,9,4);
/*!40000 ALTER TABLE `inspeccion_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `servicio_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `duracion` int(11) DEFAULT '0',
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`servicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Diagnostico de luces ABS',60,690.00),(2,'Diagnostico del sistema de frenos',60,600.00),(3,'Balanceo de ruedas (4 ruedas)',120,300.00),(4,'Diagnostico de la luz del motor',50,400.00),(5,'Diagnostico del motor (ruidos, fugas, otros)',60,700.00),(6,'Diagnostico de la calefaccion o aire acondicionado',30,500.00);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `vehiculo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vehiculo_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,1,'MURANO','NISSAN',2006,500,'rojo'),(2,1,'JETTA','VOLKSWAGEN',2007,850,'azul'),(3,2,'MAXIMA','NISSAN',2009,1050,'negro'),(4,3,'FRONTIER','NISSAN',2003,2000,'azul'),(5,4,'SENTRA','NISSAN',2013,450,'negro'),(6,4,'300','CHRYSLER',2006,1030,'rojo'),(7,4,'ROGUE','NISSAN',2015,200,'verde'),(8,5,'ALTIMA','NISSAN',2015,250,'rojo'),(9,5,'COROLLA','TOYOTA',2012,720,'azul'),(10,1,'CAMRY','TOYOTA',2011,1200,'verde'),(11,2,'BEETLE','VOLKSWAGEN',2013,820,'rojo');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-28  8:32:44
