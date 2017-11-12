USE `heroku_06209a6566df5df`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: saes
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `academico`
--

DROP TABLE IF EXISTS `academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academico` (
  `RFC` varchar(13) NOT NULL,
  `Numempleado` varchar(10) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`RFC`),
  KEY `fk_Academico_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Academico_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academico`
--

LOCK TABLES `academico` WRITE;
/*!40000 ALTER TABLE `academico` DISABLE KEYS */;
INSERT INTO `academico` VALUES ('ABAJ850330LK9','1346985249',33),('ALPE970215VF5','1215451212',5),('ARAS800425GB8','3164895713',34),('MOGI850316RT4','3541',3),('RUGS890921JG8','1978546315',32);
/*!40000 ALTER TABLE `academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `Boleta` varchar(10) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`Boleta`),
  KEY `fk_Alumno_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Alumno_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('2013630111',15,'Irregular'),('2013631320',19,'Irregular'),('2014630320',14,'Irregular'),('2014631212',18,'Irregular'),('2015630005',17,'Irregular'),('2015630052',21,'Irregular'),('2015631008',13,'Regular'),('2016630001',16,'Regular'),('2016630184',35,'Regular'),('2016630194',12,'Regular'),('2016630521',20,'Regular');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_has_clase`
--

DROP TABLE IF EXISTS `alumno_has_clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_has_clase` (
  `Alumno_Boleta` varchar(10) NOT NULL,
  `Clase_idClase` int(11) NOT NULL,
  PRIMARY KEY (`Alumno_Boleta`,`Clase_idClase`),
  KEY `fk_Alumno_has_Clase_Clase1_idx` (`Clase_idClase`),
  KEY `fk_Alumno_has_Clase_Alumno1_idx` (`Alumno_Boleta`),
  CONSTRAINT `fk_Alumno_has_Clase_Alumno1` FOREIGN KEY (`Alumno_Boleta`) REFERENCES `alumno` (`Boleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Alumno_has_Clase_Clase1` FOREIGN KEY (`Clase_idClase`) REFERENCES `clase` (`idClase`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_has_clase`
--

LOCK TABLES `alumno_has_clase` WRITE;
/*!40000 ALTER TABLE `alumno_has_clase` DISABLE KEYS */;
INSERT INTO `alumno_has_clase` VALUES ('2016630194',47),('2015630052',52),('2016630194',53),('2016630194',54),('2016630521',54),('2016630194',55),('2016630521',55),('2015630052',56),('2015630052',58),('2015630052',59),('2015630052',60),('2016630521',84),('2016630194',109),('2016630521',109),('2016630521',111),('2016630194',117),('2016630521',117);
/*!40000 ALTER TABLE `alumno_has_clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_quiere_clase`
--

DROP TABLE IF EXISTS `alumno_quiere_clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno_quiere_clase` (
  `Alumno_Boleta` varchar(10) NOT NULL,
  `Clase_idClase` int(11) NOT NULL,
  `Nombre_horario` varchar(100) NOT NULL,
  PRIMARY KEY (`Alumno_Boleta`,`Clase_idClase`),
  KEY `fk_Alumno_has_Clase1_Clase1_idx` (`Clase_idClase`),
  KEY `fk_Alumno_has_Clase1_Alumno1_idx` (`Alumno_Boleta`),
  CONSTRAINT `fk_Alumno_has_Clase1_Alumno1` FOREIGN KEY (`Alumno_Boleta`) REFERENCES `alumno` (`Boleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_has_Clase1_Clase1` FOREIGN KEY (`Clase_idClase`) REFERENCES `clase` (`idClase`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_quiere_clase`
--

LOCK TABLES `alumno_quiere_clase` WRITE;
/*!40000 ALTER TABLE `alumno_quiere_clase` DISABLE KEYS */;
INSERT INTO `alumno_quiere_clase` VALUES ('2016630194',25,'Horario dos'),('2016630194',26,'Horario dos'),('2016630194',27,'Horario dos'),('2016630194',28,'Horario dos'),('2016630194',29,'Horario dos'),('2016630194',30,'Horario dos'),('2016630194',46,'Horario Prueba'),('2016630194',47,'Horario Prueba'),('2016630194',48,'Horario Prueba'),('2016630194',49,'Horario Prueba'),('2016630194',50,'Horario Prueba'),('2016630194',117,'Horario Prueba');
/*!40000 ALTER TABLE `alumno_quiere_clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_materias`
--

DROP TABLE IF EXISTS `area_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_materias` (
  `idArea_Materias` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idArea_Materias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_materias`
--

LOCK TABLES `area_materias` WRITE;
/*!40000 ALTER TABLE `area_materias` DISABLE KEYS */;
INSERT INTO `area_materias` VALUES (1,'Formación Institucional'),(2,'Formación Científica-Básica'),(3,'Formación Profesional'),(4,'Formación Terminal e Integración');
/*!40000 ALTER TABLE `area_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_reinscripcion`
--

DROP TABLE IF EXISTS `cita_reinscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita_reinscripcion` (
  `idCita_reinscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Alumno_Boleta` varchar(10) NOT NULL,
  PRIMARY KEY (`idCita_reinscripcion`),
  KEY `fk_Cita_reinscripcion_Alumno1_idx` (`Alumno_Boleta`),
  CONSTRAINT `fk_Cita_reinscripcion_Alumno1` FOREIGN KEY (`Alumno_Boleta`) REFERENCES `alumno` (`Boleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_reinscripcion`
--

LOCK TABLES `cita_reinscripcion` WRITE;
/*!40000 ALTER TABLE `cita_reinscripcion` DISABLE KEYS */;
INSERT INTO `cita_reinscripcion` VALUES (3,'2017-11-04 10:00:00','2017-11-06 10:00:00','2016630194'),(4,'2017-11-07 10:00:00','2017-11-08 10:00:00','2016630001'),(5,'2017-11-06 10:00:00','2017-11-07 10:00:00','2015631008'),(6,'2017-11-04 10:00:00','2017-11-05 10:00:00','2014631212');
/*!40000 ALTER TABLE `cita_reinscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase` (
  `idClase` int(11) NOT NULL AUTO_INCREMENT,
  `Grupo_idGrupo` int(11) NOT NULL,
  `Materias_idMaterias` varchar(4) NOT NULL,
  `Profesor_RFC` varchar(13) NOT NULL,
  `Tipo_Horario_idTipo_Horario` varchar(2) NOT NULL,
  `Cupo` int(11) NOT NULL,
  PRIMARY KEY (`idClase`),
  KEY `fk_Clase_Grupo1_idx` (`Grupo_idGrupo`),
  KEY `fk_Clase_Materias1_idx` (`Materias_idMaterias`),
  KEY `fk_Clase_Profesor1_idx` (`Profesor_RFC`),
  KEY `fk_Clase_Tipo_Horario1_idx` (`Tipo_Horario_idTipo_Horario`),
  CONSTRAINT `fk_Clase_Grupo1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Clase_Materias1` FOREIGN KEY (`Materias_idMaterias`) REFERENCES `materias` (`idMaterias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Clase_Profesor1` FOREIGN KEY (`Profesor_RFC`) REFERENCES `profesor` (`RFC`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Clase_Tipo_Horario1` FOREIGN KEY (`Tipo_Horario_idTipo_Horario`) REFERENCES `tipo_horario` (`idTipo_Horario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (3,10,'C111','SEMA650207EP7','E',30),(7,10,'C101','ROLH650207E10','D',30),(8,10,'C103','MOGI821218984','B',30),(10,10,'C104','RUMM680615E27','A',30),(11,10,'C105','MUSL810319Q44','C',30),(12,10,'C106','SEMA650207EP7','F',30),(13,11,'C101','GOTM851118NT4','B',30),(14,11,'C102','VIVK720629B83','C',30),(15,11,'C103','DOVC7103061H9','A',30),(16,11,'C104','JUMG840306SK4','H',30),(17,11,'C105','MUSL810319Q44','F',30),(18,11,'C106','AAGM700719BW0','D',30),(19,12,'C102','JIVM880306HF4','E',30),(20,12,'C103','JICE6803061TA','D',30),(21,12,'C104','SUCM730306SR2','A',30),(22,12,'C105','GUAF730306HX1','C',30),(23,12,'C106','MAAL730306A14','F',30),(24,12,'C111','FETJ730306779','B',30),(25,25,'C213','RITI710418N23','F',30),(26,25,'C214','TOGE8204178J8','C',30),(27,25,'C215','CODN8204179HA','B',30),(28,25,'C216','DASR8104176Z7','G',30),(29,25,'C217','OORN8104177T5','A',30),(30,25,'C218','GASJ810417PB4','D',30),(31,25,'C219','CACS8104179J2','E',30),(32,26,'C213','HEYC810417FE7','D',30),(33,26,'C214','TOGE8204178J8','F',30),(34,26,'C215','AUSF810417S47','C',30),(35,26,'C216','AUGR810417MA7','A',30),(36,26,'C217','OORN8104177T5','E',30),(37,26,'C218','CUGD810417LU4','G',30),(38,26,'C219','CACS8104179J2','B',30),(39,27,'C213','RITI710418N23','G',30),(40,27,'C214','RATR810417HQ6','D',30),(41,27,'C215','AUSF810417S47','F',30),(42,27,'C216','AUGR810417MA7','E',30),(43,27,'C217','OABF8104174A6','B',30),(44,27,'C218','TEPR810417AV9','A',30),(45,27,'C219','MADJ810417GP3','C',30),(46,40,'C328','CACG8104179I2','B',30),(47,40,'C331','MACI7502174IA','C',29),(48,40,'C332','VEAD1610751DX','G',30),(49,40,'C333','MADJ810417GP3','F',30),(50,40,'C329','GAMC750416TI7','E',30),(51,41,'C328','CACG8104179I2','C',30),(52,41,'C331','LERJ810417JP3','D',30),(53,41,'C332','ROFE810417JDA','F',29),(54,41,'C333','OEGR8104177G5','E',29),(55,41,'C329','GAMC750416TI7','B',29),(56,42,'C328','CACG8104179I2','F',30),(57,42,'C331','DOGM810417JE2','D',30),(58,42,'C332','SACV8104173X3','B',30),(59,42,'C333','GUAA810417TD2','G',30),(60,42,'C329','FAME810417GR8','C',30),(61,55,'C443','SACV8104173X3','A',30),(62,55,'C444','PEVM810417RK3','C',30),(63,55,'C442','GUAE810417T18','B',30),(64,55,'C441','COCU810417425','E',30),(65,56,'C443','MAMM810417341','C',30),(66,56,'C444','FETJ730306779','B',30),(67,56,'C442','MARR8104178RA','E',30),(68,56,'C441','COCU810417425','F',30),(69,57,'C443','SACV8104173X3','F',30),(70,57,'C444','PEVM810417RK3','D',30),(71,57,'C442','PEMT8104172P0','B',30),(72,57,'C441','COCU810417425','C',30),(73,13,'C102','VIVK720629B83','B',30),(74,13,'C103','REBT8805114N2','A',30),(75,13,'C104','SUCM730306SR2','E',30),(76,13,'C105','HEYC810417FE7','F',30),(77,13,'C106','SEMA650207EP7','D',30),(78,13,'C111','AAGM700719BW0','C',30),(79,14,'C102','GOTM851118NT4','C',30),(80,14,'C103','AISC750219TXA','E',30),(81,14,'C104','DALJ810417NH7','B',30),(82,14,'C105','MUSL810319Q44','D',30),(83,14,'C106','VEHG770302TP3','A',30),(84,14,'C111','TERM770302UG8','F',30),(85,15,'C102','JIVM880306HF4','A',30),(86,15,'C103','REBT8805114N2','B',30),(87,15,'C104','DALJ810417NH7','C',30),(88,15,'C105','GUAF730306HX1','F',30),(89,15,'C106','CEDA770302VE0','E',30),(90,15,'C111','PEVS770302UW0','D',30),(91,16,'C102','SOPJ7703025M7','E',30),(92,16,'C103','SEPM710217H89','C',30),(93,16,'C104','LUCR770302G55','F',30),(94,16,'C105','OEGD7507074G7','D',30),(95,16,'C106','VEHG770302TP3','B',30),(96,16,'C111','TERM770302UG8','A',30),(97,17,'C102','SOPJ7703025M7','A',30),(98,17,'C103','GOCA770302162','F',30),(99,17,'C104','DALJ810417NH7','D',30),(100,17,'C105','MOGA770302NK6','B',30),(101,17,'C106','VEHG770302TP3','C',30),(102,17,'C111','PEVS770302UW0','E',30),(103,18,'C101','OEAM770302QR6','A',30),(104,18,'C107','SEVP740508PB5','F',30),(105,18,'C108','SEVP740508PB5','D',30),(106,18,'C109','RULE790615E42','B',30),(107,18,'C110','FOMY770302493','C',30),(108,18,'C112','DUCE7703022E9','E',30),(109,43,'C328','GAOV691003824','D',29),(110,43,'C331','MESL8010175V3','G',30),(111,43,'C332','VEAD1610751DX','C',30),(112,43,'C333','MADJ810417GP3','B',30),(114,43,'C329','SAGL801017CV5','F',30),(115,44,'C338','SADR850416NB1','E',30),(116,44,'C334','FEVA801017199','G',30),(117,44,'C335','MOCA8309068M7','A',29),(118,44,'C337','PEPJ801017M22','B',30),(119,44,'C336','CAMJ801017MD1','C',30),(120,45,'C338','SADR850416NB1','B',30),(121,45,'C334','GUAE810417T18','A',30),(122,45,'C335','MOCA8309068M7','E',30),(123,45,'C337','PEPJ801017M22','C',30),(124,45,'C336','LERA681014LGA','F',30),(125,46,'C338','TEPR810417AV9','C',30),(126,46,'C334','GUAE810417T18','E',30),(127,46,'C335','SAQG8010175C6','B',30),(128,46,'C337','PEPJ801017M22','F',30),(129,46,'C336','MAPJ801017GH2','D',30),(130,47,'C338','TEPR810417AV9','F',30),(131,47,'C334','MUAC801017K74','B',30),(132,47,'C337','AUSF810417S47','D',30),(133,47,'C336','CAMJ801017MD1','G',30),(134,48,'C336','CAMJ801017MD1','B',30),(135,19,'C102','VAOM6207197H4','C',0),(136,75,'C442','CRTB760815JG6','P',30),(137,75,'C441','CRTB760815JG6','Q',30),(138,75,'C444','GOAG801020JG0','S',30),(139,75,'C445','HECE800316JG6','R',20),(140,75,'C443','VINS821102GJ7','T',30),(141,74,'C214','ESES801202GJ1','O',30),(142,74,'C219','HEAJ781003DJ5','T',30),(143,74,'C216','LUBB810415JH7','P',30),(144,74,'C218','SADR850416NB1','H',30),(145,74,'C215','JIRR801212HI7','S',30),(146,76,'C213','BAJM741025JH7','O',30),(147,76,'C218','DETS821212MK9','M',30),(148,76,'C214','ESES801202GJ1','T',30),(149,76,'C219','PARH800615YU8','Q',30),(150,76,'C216','SAGL801017CV5','H',30);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_evaluacion`
--

DROP TABLE IF EXISTS `forma_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_evaluacion` (
  `idForma_Evaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `Forma_Evaluacion` varchar(45) NOT NULL,
  PRIMARY KEY (`idForma_Evaluacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_evaluacion`
--

LOCK TABLES `forma_evaluacion` WRITE;
/*!40000 ALTER TABLE `forma_evaluacion` DISABLE KEYS */;
INSERT INTO `forma_evaluacion` VALUES (1,'Ordinario'),(2,'Extraordinario'),(3,'Examen a Título de Suficiencia'),(4,'Recursamiento');
/*!40000 ALTER TABLE `forma_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion` (
  `RFC` varchar(13) NOT NULL,
  `Numempleado` varchar(10) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`RFC`),
  KEY `fk_Gestion_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Gestion_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES ('CAGM700215GS7','2154146581',1,2),('GUMO7702172S8','4812564364',2,29),('LEDC680812RS7','8266058462',2,26),('MABF3606192K0','4614331971',2,24),('MEPR730719G58','6653906807',2,30),('MOMM710615GH1','6462',2,4),('MUPA8701024F6','6541530842',2,23),('OOCM650604DV3','4054123616',2,25),('PEPX9111116D5','9997555072',2,27),('PEVJ801210GF6','1478932569',2,10),('QUET690305AB6','3703335541',2,22),('RIVM5610057Q4','6837671652',2,28),('SEMH761017GH7','4276487427',2,31);
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `Turno` varchar(45) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(5) NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (10,'Matutino',1,1,'1CM1'),(11,'Matutino',1,2,'1CM2'),(12,'Matutino',1,3,'1CM3'),(13,'Matutino',1,4,'1CM4'),(14,'Matutino',1,5,'1CM5'),(15,'Matutino',1,6,'1CM6'),(16,'Matutino',1,7,'1CM7'),(17,'Matutino',1,8,'1CM8'),(18,'Matutino',1,9,'1CM9'),(19,'Matutino',1,10,'1CM10'),(20,'Matutino',1,11,'1CM11'),(21,'Matutino',1,12,'1CM12'),(22,'Matutino',1,13,'1CM13'),(23,'Matutino',1,14,'1CM14'),(24,'Matutino',1,15,'1CM15'),(25,'Matutino',2,1,'2CM1'),(26,'Matutino',2,2,'2CM2'),(27,'Matutino',2,3,'2CM3'),(28,'Matutino',2,4,'2CM4'),(29,'Matutino',2,5,'2CM5'),(30,'Matutino',2,6,'2CM6'),(31,'Matutino',2,7,'2CM7'),(32,'Matutino',2,8,'2CM8'),(33,'Matutino',2,9,'2CM9'),(34,'Matutino',2,10,'2CM10'),(35,'Matutino',2,11,'2CM11'),(36,'Matutino',2,12,'2CM12'),(37,'Matutino',2,13,'2CM13'),(38,'Matutino',2,14,'2CM14'),(39,'Matutino',2,15,'2CM15'),(40,'Matutino',3,1,'3CM1'),(41,'Matutino',3,2,'3CM2'),(42,'Matutino',3,3,'3CM3'),(43,'Matutino',3,4,'3CM4'),(44,'Matutino',3,5,'3CM5'),(45,'Matutino',3,6,'3CM6'),(46,'Matutino',3,7,'3CM7'),(47,'Matutino',3,8,'3CM8'),(48,'Matutino',3,9,'3CM9'),(49,'Matutino',3,10,'3CM10'),(50,'Matutino',3,11,'3CM11'),(51,'Matutino',3,12,'3CM12'),(52,'Matutino',3,13,'3CM13'),(53,'Matutino',3,14,'3CM14'),(54,'Matutino',3,15,'3CM15'),(55,'Matutino',4,1,'4CM1'),(56,'Matutino',4,2,'4CM2'),(57,'Matutino',4,3,'4CM3'),(58,'Matutino',4,4,'4CM4'),(59,'Matutino',4,5,'4CM5'),(60,'Matutino',4,6,'4CM6'),(61,'Matutino',4,7,'4CM7'),(62,'Matutino',4,8,'4CM8'),(63,'Matutino',4,9,'4CM9'),(64,'Matutino',4,10,'4CM10'),(65,'Matutino',4,11,'4CM11'),(66,'Matutino',4,12,'4CM12'),(67,'Matutino',4,13,'4CM13'),(68,'Matutino',4,14,'4CM14'),(69,'Matutino',4,15,'4CM15'),(70,'Vespertino',1,1,'1CV1'),(71,'Vespertino',1,2,'1CV2'),(72,'Matutino',4,2,'4CM2'),(73,'Matutino',4,2,'4CM2'),(74,'Vespertino',2,2,'2CV2'),(75,'Vespertino',4,1,'4CV1'),(76,'Vespertino',2,1,'2CV1');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horas` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `Dia` varchar(45) NOT NULL,
  `Hora` varchar(45) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES (1,'Lunes','07:00-08:30'),(2,'Jueves','07:00-08:30'),(3,'Viernes','08:30-10:00'),(4,'Lunes','08:30-10:00'),(5,'Miercoles','08:30-10:00'),(6,'Jueves','08:30-10:00'),(7,'Lunes','10:30-12:00'),(8,'Martes','08:30-10:00'),(9,'Jueves','10:30-12:00'),(10,'Lunes','12:00-13:30'),(11,'Miercoles','12:00-13:30'),(12,'Jueves','12:00-13:30'),(13,'Martes','07:00-08:30'),(14,'Miercoles','07:00-08:30'),(15,'Viernes','07:00-08:30'),(16,'Martes','10:30-12:00'),(17,'Miercoles','10:30-12:00'),(18,'Viernes','10:30-12:00'),(19,'Martes','12:00-13:30'),(20,'Miercoles','13:30-15:00'),(21,'Viernes','12:00-13:30'),(22,'Lunes','13:30-15:00'),(23,'Martes','13:30-15:00'),(24,'Jueves','13:30-15:00'),(25,'Lunes','15:00-16:30'),(26,'Jueves','15:00-16:30'),(27,'Viernes','16:30-18:00'),(28,'Lunes','16:30-18:00'),(29,'Miercoles','16:30-18:00'),(30,'Jueves','16:30-18:00'),(31,'Lunes','18:30-20:00'),(32,'Martes','16:30-18:00'),(33,'Viernes','18:30-20:00'),(34,'Lunes','20:00-21:30'),(35,'Miercoles','20:00-21:30'),(36,'Jueves','20:00-21:30'),(37,'Martes','15:00-16:30'),(38,'Miercoles','15:00-16:30'),(39,'Viernes','15:00-16:30'),(40,'Martes','18:30-20:00'),(41,'Miercoles','18:30-20:00'),(42,'Viernes','20:00-21:30'),(43,'Martes','20:00-21:30'),(44,'Jueves','18:30-20:00'),(45,'Viernes','13:30-15:00');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `Alumno_Boleta` varchar(10) NOT NULL,
  `Materias_idMaterias` varchar(4) NOT NULL,
  `Periodo` varchar(45) NOT NULL,
  `Calificacion` int(11) NOT NULL,
  `Forma_Evaluacion_idForma_Evaluacion` int(11) NOT NULL,
  PRIMARY KEY (`Alumno_Boleta`,`Materias_idMaterias`),
  KEY `fk_Alumno_has_Materias_Materias1_idx` (`Materias_idMaterias`),
  KEY `fk_Alumno_has_Materias_Alumno1_idx` (`Alumno_Boleta`),
  KEY `fk_Kardex_Forma_Evaluacion1_idx` (`Forma_Evaluacion_idForma_Evaluacion`),
  CONSTRAINT `fk_Alumno_has_Materias_Alumno1` FOREIGN KEY (`Alumno_Boleta`) REFERENCES `alumno` (`Boleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Alumno_has_Materias_Materias1` FOREIGN KEY (`Materias_idMaterias`) REFERENCES `materias` (`idMaterias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Kardex_Forma_Evaluacion1` FOREIGN KEY (`Forma_Evaluacion_idForma_Evaluacion`) REFERENCES `forma_evaluacion` (`idForma_Evaluacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES ('2015630052','C101','15/2',8,1),('2015630052','C102','15/2',7,1),('2015630052','C103','15/2',9,1),('2015630052','C104','15/2',9,1),('2015630052','C105','15/2',10,1),('2015630052','C106','15/2',10,1),('2015630052','C107','16/1',8,1),('2015630052','C108','16/1',3,4),('2015630052','C109','16/1',9,1),('2015630052','C110','16/1',8,1),('2015630052','C111','16/1',6,2),('2015630052','C112','16/1',10,1),('2015630052','C213','16/2',5,4),('2015630052','C214','16/2',9,1),('2015630052','C215','16/2',9,1),('2015630052','C216','16/2',8,2),('2015630052','C217','16/2',5,4),('2015630052','C218','17/1',7,1),('2015630052','C219','17/1',7,1),('2015630052','C220','17/1',6,2),('2015630052','C221','17/1',6,1),('2015630052','C222','17/2',9,1),('2015630052','C223','17/2',4,4),('2015630052','C224','17/2',8,1),('2015630052','C225','17/2',6,3),('2015631008','C101','15/1',6,1),('2015631008','C102','15/1',9,1),('2015631008','C103','15/1',7,1),('2015631008','C104','15/1',6,2),('2015631008','C105','15/1',8,1),('2015631008','C106','15/1',8,1),('2015631008','C107','16/1',7,4),('2015631008','C108','15/2',6,2),('2015631008','C109','15/2',8,3),('2015631008','C110','15/2',8,1),('2015631008','C111','15/2',7,1),('2015631008','C112','15/2',9,1),('2015631008','C213','16/2',6,4),('2015631008','C214','16/1',7,1),('2015631008','C215','16/1',6,3),('2015631008','C216','16/1',8,1),('2015631008','C217','16/1',9,2),('2015631008','C218','16/1',10,1),('2015631008','C219','16/2',8,1),('2015631008','C220','16/2',7,1),('2015631008','C221','16/2',6,1),('2015631008','C222','16/2',6,2),('2015631008','C223','16/2',10,1),('2015631008','C224','17/1',10,1),('2015631008','C225','17/2',5,3),('2015631008','C226','17/1',9,2),('2015631008','C327','17/1',7,3),('2015631008','C329','17/1',9,1),('2015631008','C330','17/2',6,2),('2015631008','C331','17/2',8,1),('2015631008','C332','17/2',9,1),('2015631008','C333','17/2',5,3),('2015631008','C334','17/2',7,1),('2016630001','C101','16/2',3,4),('2016630001','C102','16/2',6,2),('2016630001','C103','16/2',8,1),('2016630001','C104','16/2',8,1),('2016630001','C105','16/2',8,1),('2016630001','C106','16/2',9,1),('2016630001','C107','17/1',4,3),('2016630001','C108','17/1',6,2),('2016630001','C109','17/1',8,1),('2016630001','C110','17/1',7,1),('2016630001','C111','17/1',9,1),('2016630001','C112','17/1',8,1),('2016630001','C213','17/2',6,2),('2016630001','C214','17/2',7,1),('2016630001','C215','17/2',8,2),('2016630001','C216','17/2',10,1),('2016630001','C217','17/2',10,1),('2016630194','C101','16/1',7,1),('2016630194','C102','16/1',9,1),('2016630194','C103','16/1',8,1),('2016630194','C104','16/1',9,1),('2016630194','C105','16/1',10,1),('2016630194','C106','16/1',10,1),('2016630194','C107','16/2',6,1),('2016630194','C108','16/2',10,1),('2016630194','C109','16/2',9,1),('2016630194','C110','16/2',8,1),('2016630194','C111','16/2',9,1),('2016630194','C112','16/2',7,1),('2016630194','C213','17/1',10,2),('2016630194','C214','17/1',8,1),('2016630194','C215','17/1',9,1),('2016630194','C216','17/1',9,1),('2016630194','C217','17/1',9,1),('2016630194','C218','17/1',8,1),('2016630194','C219','17/2',10,2),('2016630194','C220','17/2',9,1),('2016630194','C221','17/2',8,1),('2016630194','C223','17/2',10,1),('2016630194','C224','17/2',10,1),('2016630194','C225','17/2',6,1),('2016630194','C226','17/2',8,1),('2016630521','C101','16/2',7,3),('2016630521','C102','16/1',6,1),('2016630521','C103','16/1',8,1),('2016630521','C104','16/1',9,1),('2016630521','C105','16/1',10,1),('2016630521','C106','16/1',9,1),('2016630521','C107','16/2',6,2),('2016630521','C108','16/2',7,1),('2016630521','C109','16/2',8,1),('2016630521','C110','16/2',10,1),('2016630521','C112','16/2',9,1),('2016630521','C213','17/1',6,3),('2016630521','C214','17/1',8,1),('2016630521','C215','17/1',10,1),('2016630521','C216','17/1',10,1),('2016630521','C217','17/1',10,1),('2016630521','C218','17/2',9,1),('2016630521','C219','17/2',9,1),('2016630521','C220','17/2',10,1),('2016630521','C221','17/2',8,1),('2016630521','C223','17/2',6,1);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `idMaterias` varchar(4) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Creditos` float NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Cupo` int(11) NOT NULL,
  `Area_Materias_idArea_Materias` int(11) NOT NULL,
  `Materia_anterior` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idMaterias`),
  KEY `fk_Materias_Area_Materias_idx` (`Area_Materias_idArea_Materias`),
  KEY `fk_Materias_Materias1_idx` (`Materia_anterior`),
  CONSTRAINT `fk_Materias_Area_Materias` FOREIGN KEY (`Area_Materias_idArea_Materias`) REFERENCES `area_materias` (`idArea_Materias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Materias_Materias1` FOREIGN KEY (`Materia_anterior`) REFERENCES `materias` (`idMaterias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES ('C101','Análisis Vectorial',4.39,1,30,2,NULL),('C102','Cálculo',4.45,1,30,2,NULL),('C103','Matemáticas Discretas',5.85,1,30,2,NULL),('C104','Algoritmia y Programación Estructurada',4.45,1,30,3,NULL),('C105','Física',4.39,1,30,1,NULL),('C106','Ingeniería, Ética y Sociedad',4.39,1,30,1,NULL),('C107','Ecuaciones diferenciales',4.39,1,30,2,NULL),('C108','Álgebra Lineal',4.39,1,30,2,NULL),('C109','Cálculo Aplicado',4.44,1,30,2,NULL),('C110','Estructuras de Datos',4.39,1,30,3,NULL),('C111','Comunicación Oral y Escrita',4.39,1,30,1,NULL),('C112','Análisis Fundamental de Circuitos',4.33,1,30,3,NULL),('C213','Matemáticas Avanzadas para la Ingeniería',4.46,2,30,2,'C107'),('C214','Fundamentos Económicos',4.33,2,30,3,NULL),('C215','Fundamentos de Diseño Digital',4.48,2,30,3,'C103'),('C216','Teoría Computacional',4.3,2,30,2,'C103'),('C217','Bases de Datos',4.44,2,30,3,NULL),('C218','Programación Orientada a Objetos',4.34,2,30,3,NULL),('C219','Electrónica Analógica',4.35,2,30,3,'C112'),('C220','Redes de Computadoras',4.46,2,30,3,NULL),('C221','Diseño de Sistemas Digitales',4.5,2,30,3,NULL),('C222','Probabilidad y Estadísitca',4.39,2,30,2,'C103'),('C223','Sistemas Operativos',4.39,2,30,3,'C110'),('C224','Análisis y Diseño Orientado a Objetos',4.39,2,30,3,NULL),('C225','Tecnologías para la Web',4.49,2,30,3,NULL),('C226','Administración Financiera',4.36,2,30,3,NULL),('C327','Optativa A',4.39,3,30,3,NULL),('C328','Arquitectura de Computadoras',4.39,3,30,3,'C221'),('C329','Análisis de Algoritmos',4.39,3,30,2,NULL),('C330','Optativa B',4.39,3,30,3,NULL),('C331','Ingeniería de Software',4.39,3,30,3,'C224'),('C332','Administración de Proyectos',4.39,3,30,3,'C226'),('C333','Instrumentación',4.39,3,30,3,'C219'),('C334','Teoría de Comunicaciones y Señales',4.39,3,30,3,'C213'),('C335','Aplicaciones para Comunicaciones en Red',4.39,3,30,3,'C220'),('C336','Mets. Cuantitv. para la Toma de Desiciones',4.39,3,30,2,'C108'),('C337','Introducción a los Microcontroladores',4.39,3,30,3,NULL),('C338','Compiladores',4.39,3,30,3,NULL),('C339','Optativa C',4.39,3,30,3,NULL),('C340','Optativa D',4.39,3,30,3,NULL),('C441','Desarrollo de Sistemas Distribuidos',4.39,4,30,4,'C220'),('C442','Administración de Servicios en Red',4.39,4,30,4,NULL),('C443','Gestión Empresarial',4.39,4,30,4,NULL),('C444','Liderazgo y Desarrollo Profesional',4.39,4,30,1,NULL),('C445','Trabajo Terminal I',11.25,4,20,4,NULL);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `RFC` varchar(13) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Paterno` varchar(50) NOT NULL,
  `Materno` varchar(50) NOT NULL,
  `Numempleado` varchar(10) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Contra` varchar(45) NOT NULL,
  PRIMARY KEY (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('AAFR720507EV8','Rocío','Almazán','Farfán','9823050566','farfan@gmail.com','Farfan1'),('AAGM700719BW0','Maribel','Aragón','García','5324348509','maribel@gmail.com','Maribel1'),('AISC750219TXA','Cristhian Alejandro','Ávila','Sánchez','7755903531','crisas@gmail.com','Cristhian1'),('AUGR810417MA7','Rafael','Aguilar','García','4584103677','rafaag@gmail.com','Rafael1'),('AUSF810417S47','Fernando','Aguilar','Sánchez','4584103678','fas@gmail.com','Fernando1'),('BAJM741025JH7','Marco Antonio','Barranco','Jiménez','4789312584','barrancojimenez@gmail.com','BarrancoJ12'),('CACG8104179I2','Gelacio','Castillo','Cabrera','4584103671','gelacio@gmail.com','Gelacio1'),('CACS8104179J2','Sergio','Cancino','Calderón','4584103679','cancino@gmail.com','Sergio1'),('CAJJ600618FN9','Juan Manuel','Carballo','Jiménez','3898223925','jmcj6@gmail.com','EcuaDif123'),('CAMJ801017MD1','Juan Antonio','Castillo','Marrufo','4584103642','juancm@gmail.com','Juancm1'),('CASL600602PGA','Leticia','Cañedo','Suárez','2185410584','lcs@gmail.com','Proba1'),('CEDA770302VE0','Adriana Berenice','Celis','Domínguez','4584103654','celisd@gmail.com','Adriana1'),('CEEL740911G32','Luis Moctezuma','Cervantes','Espinoza','2786731825','moctezuma@gmail.com','Moctezuma1'),('COCU810417425','Ukranio','Coronilla','Contreras','4584103661','ucc@gmail.com','Ukranio1'),('CODN8204179HA','Nidia Asunción','Cortéz','Duarte','4584103683','nidia@gmail.com','Nidia1'),('CRTB760815JG6','Benjamín','Cruz','Torres','1954865321','benjamintorres@gmail.com','Benjamin123'),('CUGD810417LU4','Daniel','Cruz','García','4584103676','danielcruz@gmail.com','Daniel1'),('DALJ810417NH7','José Carlos','Dávalos','López','4584103657','jcdavalos@gmail.com','Davalos1'),('DASR8104176Z7','Ricardo Felipe','Díaz','Santiago','4584103682','ricardofelipe@gmail.com','Ricardo1'),('DETS821212MK9','Saúl','De la O','Torres','4781235695','delaosaul@gmail.com','DelaO12'),('DOGM810417JE2','Marco Antonio','Dorantes','González','4584103667','dorantesma@gmail.com','Marco1'),('DOVC7103061H9','Claudia Jisela','Dorantes','Villa','4685113698','claudiadorantes@gmail.com','Dorantes1'),('DUCE7703022E9','Edmundo René','Durán','Camarillo','4584103646','edrenedc@gmail.com','Edmundo1'),('ESES801202GJ1','Serafin','Estrada','Elizalde','1649785235','serafin2@gmail.com','Serafin2'),('FAME810417GR8','Edgardo Adrián','Franco','Martínez','4584103664','edgardofm@gmail.com','Edgardo1'),('FETJ730306779','Jorge','Ferrer','Tenorio','4584103685','jorgeferrer@gmail.com','Jorge1'),('FEVA801017199','Alfonso','Fernández','Vázquez','4584103643','alfonsofv@gmail.com','Alfonso1'),('FIPF700316FR9','Felipe de Jesús','Figueroa','Del Prado','8178659327','felipe@gmail.com','Felipe1'),('FOMY770302493','Yaxkin','Flores','Mendoza','4584103647','yaxkinfm@gmail.com','Yaxkin1'),('GAMC750416TI7','Consuelo Varinia','García','Mendoza','8603404929','cgm@gmail.com','Algoritmos1'),('GAOV691003824','Víctor Hugo','García','Ortega','6228208031','vhgo@gmail.com','Arqui1'),('GASJ810417PB4','Juan Vicente','García','Sales','4584103680','juanvi@gmail.com','Juanvi1'),('GOAG801020JG0','Gisela','González','Albarran','4798932581','giselagoa@gmail.com','Gisela22'),('GOCA770302162','Alejandro','González','Cisneros','4584103650','alecisneros@gmail.com','Alejandro1'),('GOTM851118NT4','Miguel','González','Trujillo','4785123698','miguelgt@gmail.com','Miguel1'),('GUAA810417TD2','Alfonso','Gutiérrez','Aldana','4584103665','aldana@gmail.com','Alfonso1'),('GUAE810417T18','Eduardo','Gutiérrez','Aldana','4584103662','eduga@gmail.com','Eduardo1'),('GUAF730306HX1','Florencio','Guzmán','Aguilar','4584103687','florencio@gmail.com','Florencio1'),('HEAJ781003DJ5','Jose Luis','Hernández','Aguilar','1346798214','joselh@gmail.com','JoseLuis12'),('HECE800316JG6','Euler','Hernández','Contreras','1346798525','eulahernandez@gmail.com','Eula31415'),('HEYC810417FE7','Crispin','Herrera','Yáñez','4584103679','crispin@gmail.com','Crispin1'),('JICE6803061TA','Edith Adriana','Jiménez','Contreras','4684103688','edithjimenez@gmail.com','Edith1'),('JIRR801212HI7','Rene Baltazar','Jiménez','Ruiz','1326598745','jimenezrene@gmail.com','Jimenez123'),('JIVM880306HF4','Martha Patricia','Jiménez','Villanueva','4685103688','patyjimenez@gmail.com','Patricia1'),('JUMG840306SK4','Genaro','Juárez','Martínez','4685113688','genaroautomatas@gmail.com','Genaro1'),('LERA681014LGA','Ariel','López','Rojas','5079354506','alr@gmail.com','Metodos1'),('LERJ810417JP3','José Jaime','López','Rabadán','4584103670','rabadan@gmail.com','Rabadan1'),('LUBB810415JH7','Benjamín','Luna','Benoso','1793465826','lunabenja@gmail.com','BenjaminL123'),('LUCR770302G55','Roberto','De Luna','Caballero','4584103651','delunac@gmail.com','Roberto1'),('MAAL730306A14','Lilian','Martínez','Acosta','4584103686','lilianma@gmail.com','Lilian1'),('MACI7502174IA','Idalia','Maldonado','Castillo','1244954783','mencimc@gmail.com','IngSoft1'),('MADJ810417GP3','Juan Carlos','Martínez','Díaz','4584103672','juancarlos@gmail.com','JuanCarlos1'),('MAGH750218UX2','Héctor Manuel','Manzanilla','Granados','1428109620','hectormg@gmail.com','Hector1'),('MAMM810417341','Miguel Angel','Maldonado','Muñoz','4584103660','maldonadoma@gmail.com','Miguel1'),('MAPJ801017GH2','José Cruz','Martínez','Perales','4584103640','perales@gmail.com','Perales1'),('MARR8104178RA','Ricardo','Martínez','Rosales','4584103659','ricardoms@gmail.com','Ricardo1'),('MESL8010175V3','Laura','Méndez','Segundo','4584103645','laurams@gmail.com','Laura1'),('MOCA8309068M7','Axel Ernesto','Moreno','Cervantes','4628332107','aemcj@gmail.com','Redes2'),('MOGA770302NK6','Ángel','Morales','González','4584103649','angelm@gmail.com','Angel1'),('MOGI821218984','Iván Giovanny','Mosso','García','6886226767','mossog@gmail.com','Mosso1'),('MUAC801017K74','César','Mujíca','Ascencio','4584103639','cesarmujica@gmail.com','Cesar1'),('MUSL810319Q44','Laura','Muñoz','Salazar','1718693176','laurams@gmail.com','Laura1'),('OABF8104174A6','Fabiola','Ocampo','Botello','4584103674','fabiola@gmail.com','Fabiola1'),('OEAM770302QR6','Miguel','Olvera','Aldana','4584103648','olverita@gmail.com','Miguel1'),('OEGD7507074G7','Didier','Ojeda','Guillen','5676440247','didiog@gmail.com','Didier1'),('OEGR8104177G5','Rubén','Ortega','González','4584103668','rubenog@gmail.com','Ruben1'),('OMJ600519A69','Juan José','Torres','Manríquez','9844676493','jjtorres@gmail.com','JuanJo1'),('OORN8104177T5','Nancy','Ocotitla','Rojas','4584103681','ocotitla@gmail.com','Nancy1'),('PARH800615YU8','Hector Manuel','Paz','Rodríguez','9764815236','pazhecman@gmail.com','PazRodri12'),('PEMT8104172P0','Tanibet','Pérez de los Santos','Mondragón','4584103658','tanibet@gmail.com','Tanibet1'),('PEPJ801017M22','José Juan','Pérez','Pérez','4584103643','jjpp@gmail.com','Josejuan1'),('PEVM810417RK3','Monserrat Gabriela','Pérez','Vera','4584103663','mgabypv@gmail.com','Monserrat1'),('PEVS770302UW0','Sandra Mercedes','Pérez','Vera','4584103653','sandrapv@gmail.com','Sandra1'),('RATR810417HQ6','Rafael','Ramírez','Tenorio','4584103675','rafatenorio@gmail.com','Rafael1'),('REBT8805114N2','Tlatoani de Jesús','Reyes','Bermejo','9773388761','tlatoani@gmail.com','Tlatoani1'),('RIRM7502153K1','Mónica','Rivera','De la Rosa','9662313856','rrm@gmail.com','TecWeb1'),('RITI710418N23','Ignacio','Ríos','De la Torre','6153231122','ignaciort@gmail.com','Ignacio1'),('ROFE810417JDA','Eduardo','Rodríguez','Flores','4584103669','eduardorf@gmail.com','Eduardo1'),('ROLH650207E10','Héctor','Rojas','Luna','5253017177','rlh@gmail.com','Hector1'),('RULE790615E42','Elena Fabiola','Ruíz','Ledesma','8334857492','elenarl@gmail.com','Elena1'),('RUMM680615E27','Marco Antonio','Rueda','Meléndez','8523169747','marcorm@gmail.com','Marco1'),('SACV8104173X3','Virginia','Sánchez','Cruz','4584103666','vicky@gmail.com','Virginia1'),('SADR850416NB1','Rafael Norman','Saucedo','Delgado','6508772470','norman@gmail.com','Norman1'),('SAGL801017CV5','Luz María','Sánchez','García','4584103644','luzma@gmail.com','Luzma1'),('SAQG8010175C6','Gilberto','Sánchez','Quintanilla','4584103641','quintanilla@gmail.com','Gilberto1'),('SEMA650207EP7','Adriana de la Paz','Sánchez','Moreno','2660281241','asm@gmail.com','ComOE1'),('SEPM710217H89','María Susana','Sánchez','Palacios','6105853433','mariasp@gmail.com','Maria1'),('SEVP740508PB5','Perla Rebeca','Sánchez','Vargas','2944927319','rebecasv@gmail.com','Perla1'),('SIMJ850806CL0','Jorge Javier','Silva','Martínez','9961159672','jjsilva@gmail.com','Jorge1'),('SOPJ7703025M7','José Francisco','Solano','Pérez','4584103652','solano@gmail.com','Solano1'),('SUCM730306SR2','Miguel Santiago','Suárez','Castañón','4584103688','santi@gmail.com','Santiago1'),('TEPR810417AV9','Roberto','Tecla','Parra','4584103673','tecla@gmail.com','Tecla1'),('TERM770302UG8','María del Socorro','Tellez','Reyes','4584103655','mdstr@gmail.com','Maria1'),('TOGE8204178J8','Enrique','Torres','González','4584103684','enriquetorres@gmail.com','Enrique1'),('VAOM6207197H4','Mijail','Vázquez','Ortíz','8607079240','mijail@gmail.com','Mijail1'),('VEAD1610751DX','Verónica ','Agustín','Dominguez','9812342091','vad.profesor@yahoo.com.mx','Vero27'),('VEHG770302TP3','Gumersindo','Vera','Hernández','4584103656','gumersindo@gmail.com','Gumersindo1'),('VINS821102GJ7','Sonia','Villegas','Navarrete','1349527894','soniavill@gmail.com','SoniaV123'),('VIVK720629B83','Karina','Viveros','Vela','4785113698','karinaviveros@gmail.com','Karina1'),('YAHC800324GB8','Crispin','Yáñez','Hernández','2192849908','yanezh@ipn.mx','Contra1!');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_horario`
--

DROP TABLE IF EXISTS `tipo_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_horario` (
  `idTipo_Horario` varchar(2) NOT NULL,
  PRIMARY KEY (`idTipo_Horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_horario`
--

LOCK TABLES `tipo_horario` WRITE;
/*!40000 ALTER TABLE `tipo_horario` DISABLE KEYS */;
INSERT INTO `tipo_horario` VALUES ('A'),('AA'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('L'),('M'),('O'),('P'),('Q'),('R'),('S'),('T');
/*!40000 ALTER TABLE `tipo_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_horario_has_horas`
--

DROP TABLE IF EXISTS `tipo_horario_has_horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_horario_has_horas` (
  `Tipo_Horario_idTipo_Horario` varchar(2) NOT NULL,
  `Horas_idHorario` int(11) NOT NULL,
  PRIMARY KEY (`Tipo_Horario_idTipo_Horario`,`Horas_idHorario`),
  KEY `fk_Tipo_Horario_has_Horas_Horas1_idx` (`Horas_idHorario`),
  KEY `fk_Tipo_Horario_has_Horas_Tipo_Horario1_idx` (`Tipo_Horario_idTipo_Horario`),
  CONSTRAINT `fk_Tipo_Horario_has_Horas_Horas1` FOREIGN KEY (`Horas_idHorario`) REFERENCES `horas` (`idHorario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Tipo_Horario_has_Horas_Tipo_Horario1` FOREIGN KEY (`Tipo_Horario_idTipo_Horario`) REFERENCES `tipo_horario` (`idTipo_Horario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_horario_has_horas`
--

LOCK TABLES `tipo_horario_has_horas` WRITE;
/*!40000 ALTER TABLE `tipo_horario_has_horas` DISABLE KEYS */;
INSERT INTO `tipo_horario_has_horas` VALUES ('A',1),('A',2),('A',3),('B',4),('B',5),('B',6),('C',7),('C',8),('C',9),('D',10),('D',11),('D',12),('E',13),('E',14),('E',15),('F',16),('F',17),('F',18),('AA',19),('G',19),('G',20),('R',20),('G',21),('H',22),('H',23),('H',24),('P',25),('P',26),('P',27),('T',28),('AA',29),('T',29),('T',30),('L',31),('S',31),('L',32),('S',32),('AA',33),('L',33),('O',33),('M',34),('M',35),('M',36),('Q',37),('Q',38),('Q',39),('O',40),('O',41),('S',44),('R',45);
/*!40000 ALTER TABLE `tipo_horario_has_horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Paterno` varchar(50) NOT NULL,
  `Materno` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Contra` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'María Guadalupe','Caro','García','sescolaresescom@ipn.mx','Escom1234'),(3,'Iván Giovanny','Mosso','García','sub_academica_escom@ipn.mx','Mosso123'),(4,'Marisol','Mora','Mesa','mmoramesa@ipn.mx','Mar1sol'),(5,'Estaban','Alanis','Paredes','estebanp@ipn.mx','Esteban123'),(10,'Juan Raul','Pérez','Vivas','jperezv@ipn.mx','JuanRPV1'),(12,'Gabriel Alejandro','Huitrón','Rizo','gabihr@hotmail.com','Gabriel12'),(13,'Juan','Gutiérrez','Hernández','juanito@hotmail.com','Juanito1'),(14,'Alberto','Paredes','Rivas','filiberto@hotmail.com','Alberto1'),(15,'Miguel Angel','Hernández','Pineda','mirreyp@hotmail.com','Miguel1p1'),(16,'Emiliano','Osornio','Díaz','emilio@hotmail.com','Emiliano1'),(17,'Cristian Leví','Huitrón','Rizo','crishr@hotmail.com','Cristian1'),(18,'Paola Berenice','González','Abarca','paog@hotmail.com','Paola1'),(19,'América Berenice','Monzalvo','Fuentes','ame@hotmail.com','America1'),(20,'Yahir','Trejo','Granados','trejo@hotmail.com','Trejo1'),(21,'Carolina','Gasca','Manzanilla','carogm@hotmail.com','Carolina1'),(22,'Tatiano','Quiñones','Escobar','tatiano@hotmail.com','Tatiano1'),(23,'Alem','Muñoz','Pineda','alem@hotmail.com','Alemm1'),(24,'Fernando','Marín','Botello','ferbotello@hotmail.com','Fernando1'),(25,'Miguel Angel','Osorio','Chong','chinochong@hotmail.com','Miguel1'),(26,'Cristina','López','Díaz','cristina@hotmail.com','Cristina1'),(27,'Ximena','Pérez','Pérez','ximepp@hotmail.com','Ximena1'),(28,'Mónica Ivette','Rizo','Villanueva','mirv@hotmail.com','Monica1'),(29,'Oscar','Guzmán','Martínez','oscar@hotmail.com','Oscar1'),(30,'Roberto','Meléndez','Penilla','boberto@hotmail.com','Roberto1'),(31,'Humberto','Sánchez','Martínez','beto@hotmail.com','Humberto12'),(32,'Sebastian','Ruli','Gómez','sebas@ipn.mx','Sebas30'),(33,'Juan Manuel','Abalos','Abad','abaj5@ipn.mx','AbadJM1'),(34,'Inoue','Aros','Aroyo','inoueaaros@ipn.mx','Inou80'),(35,'Daniel','Trejo','Granados','danieltg@hotmail.com','Escom1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 19:32:51
