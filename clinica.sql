-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: 34.68.13.196    Database: clinica
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ASCIENTOCONTABLE`
--

DROP TABLE IF EXISTS `ASCIENTOCONTABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASCIENTOCONTABLE` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `CUENTA` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `LIBRODIARIO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_ASCIENTOCONTABLE_LIBRODIARIO_CODIGO` (`LIBRODIARIO_CODIGO`),
  CONSTRAINT `FK_ASCIENTOCONTABLE_LIBRODIARIO_CODIGO` FOREIGN KEY (`LIBRODIARIO_CODIGO`) REFERENCES `LIBRODIARIO` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASCIENTOCONTABLE`
--

LOCK TABLES `ASCIENTOCONTABLE` WRITE;
/*!40000 ALTER TABLE `ASCIENTOCONTABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASCIENTOCONTABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAJA`
--

DROP TABLE IF EXISTS `CAJA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAJA` (
  `CODIGO` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAJA`
--

LOCK TABLES `CAJA` WRITE;
/*!40000 ALTER TABLE `CAJA` DISABLE KEYS */;
INSERT INTO `CAJA` VALUES (1,'cierre','2020-07-13'),(2,'Cierre de caja','2020-07-14'),(3,'Cierre de caja','2020-07-14'),(4,'Cierre de caja','2020-07-17');
/*!40000 ALTER TABLE `CAJA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CERTIFICADO`
--

DROP TABLE IF EXISTS `CERTIFICADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CERTIFICADO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL,
  `MEDICO_CODIGO` int(11) DEFAULT NULL,
  `PACIENTE_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_CERTIFICADO_MEDICO_CODIGO` (`MEDICO_CODIGO`),
  KEY `FK_CERTIFICADO_PACIENTE_CODIGO` (`PACIENTE_CODIGO`),
  CONSTRAINT `FK_CERTIFICADO_MEDICO_CODIGO` FOREIGN KEY (`MEDICO_CODIGO`) REFERENCES `MEDICO` (`CODIGO`),
  CONSTRAINT `FK_CERTIFICADO_PACIENTE_CODIGO` FOREIGN KEY (`PACIENTE_CODIGO`) REFERENCES `PACIENTE` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CERTIFICADO`
--

LOCK TABLES `CERTIFICADO` WRITE;
/*!40000 ALTER TABLE `CERTIFICADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `CERTIFICADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CITA`
--

DROP TABLE IF EXISTS `CITA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CITA` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DISPONIBILIDAD` char(1) DEFAULT NULL,
  `FEC_HORA` datetime DEFAULT NULL,
  `MEDICO_CODIGO` int(11) DEFAULT NULL,
  `PACIENTE_CODIGO` int(11) DEFAULT NULL,
  `FECHA` varchar(45) DEFAULT NULL,
  `HORA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_CITA_MEDICO_CODIGO` (`MEDICO_CODIGO`),
  KEY `FK_CITA_PACIENTE_CODIGO` (`PACIENTE_CODIGO`),
  CONSTRAINT `FK_CITA_MEDICO_CODIGO` FOREIGN KEY (`MEDICO_CODIGO`) REFERENCES `MEDICO` (`CODIGO`),
  CONSTRAINT `FK_CITA_PACIENTE_CODIGO` FOREIGN KEY (`PACIENTE_CODIGO`) REFERENCES `PACIENTE` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITA`
--

LOCK TABLES `CITA` WRITE;
/*!40000 ALTER TABLE `CITA` DISABLE KEYS */;
INSERT INTO `CITA` VALUES (1,'1','2020-07-11 09:46:00',1,1,'e','y'),(2,'1','2020-07-11 10:46:00',2,2,'u','y'),(3,'1','2020-07-11 12:46:00',2,1,'u','j'),(4,'1','2020-07-11 12:50:00',2,2,'h','i'),(5,'S',NULL,NULL,3,'Mon Jul 13 2020','8:30'),(6,'S',NULL,NULL,3,'Mon Jul 13 2020','12:30'),(7,'S',NULL,NULL,3,'Mon Jul 13 2020','10:30'),(8,'S',NULL,NULL,3,'Mon Jul 13 2020','15:30'),(9,'D',NULL,NULL,3,'Mon Jul 13 2020','11:00');
/*!40000 ALTER TABLE `CITA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLABORADOR`
--

DROP TABLE IF EXISTS `COLABORADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLABORADOR` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CEDULA` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROL_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_COLABORADOR_ROL_CODIGO` (`ROL_CODIGO`),
  CONSTRAINT `FK_COLABORADOR_ROL_CODIGO` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `ROL` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLABORADOR`
--

LOCK TABLES `COLABORADOR` WRITE;
/*!40000 ALTER TABLE `COLABORADOR` DISABLE KEYS */;
INSERT INTO `COLABORADOR` VALUES (1,'ZHU','239485703','lore@zhu','LORENA','lore',2),(2,'DELEG','23948570','natu96@del','NATALYA','natu',3);
/*!40000 ALTER TABLE `COLABORADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURACABECERA`
--

DROP TABLE IF EXISTS `FACTURACABECERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURACABECERA` (
  `CODIGO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTAL_IVA` double DEFAULT NULL,
  `CAJA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURACABECERA_CAJA_CODIGO` (`CAJA_CODIGO`),
  CONSTRAINT `FK_FACTURACABECERA_CAJA_CODIGO` FOREIGN KEY (`CAJA_CODIGO`) REFERENCES `CAJA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURACABECERA`
--

LOCK TABLES `FACTURACABECERA` WRITE;
/*!40000 ALTER TABLE `FACTURACABECERA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FACTURACABECERA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURADETALLE`
--

DROP TABLE IF EXISTS `FACTURADETALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURADETALLE` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int(11) DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `FACTURAEGRESO_CODIGO` int(11) DEFAULT NULL,
  `FACTURAINGRESO_CODIGO` int(11) DEFAULT NULL,
  `MEDICAMENTO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURADETALLE_FACTURAINGRESO_CODIGO` (`FACTURAINGRESO_CODIGO`),
  KEY `FK_FACTURADETALLE_FACTURAEGRESO_CODIGO` (`FACTURAEGRESO_CODIGO`),
  KEY `FK_FACTURADETALLE_MEDICAMENTO_CODIGO` (`MEDICAMENTO_CODIGO`),
  CONSTRAINT `FK_FACTURADETALLE_FACTURAEGRESO_CODIGO` FOREIGN KEY (`FACTURAEGRESO_CODIGO`) REFERENCES `FACTURAEGRESO` (`CODIGO`),
  CONSTRAINT `FK_FACTURADETALLE_FACTURAINGRESO_CODIGO` FOREIGN KEY (`FACTURAINGRESO_CODIGO`) REFERENCES `FACTURAINGRESO` (`CODIGO`),
  CONSTRAINT `FK_FACTURADETALLE_MEDICAMENTO_CODIGO` FOREIGN KEY (`MEDICAMENTO_CODIGO`) REFERENCES `MEDICAMENTO` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURADETALLE`
--

LOCK TABLES `FACTURADETALLE` WRITE;
/*!40000 ALTER TABLE `FACTURADETALLE` DISABLE KEYS */;
INSERT INTO `FACTURADETALLE` VALUES (4,2,5.6,NULL,1901,1),(5,2,1,NULL,1901,2),(6,1,50,NULL,1901,4);
/*!40000 ALTER TABLE `FACTURADETALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURAEGRESO`
--

DROP TABLE IF EXISTS `FACTURAEGRESO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURAEGRESO` (
  `CODIGO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTAL_IVA` double DEFAULT NULL,
  `CAJA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURAEGRESO_CAJA_CODIGO` (`CAJA_CODIGO`),
  CONSTRAINT `FK_FACTURAEGRESO_CAJA_CODIGO` FOREIGN KEY (`CAJA_CODIGO`) REFERENCES `CAJA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURAEGRESO`
--

LOCK TABLES `FACTURAEGRESO` WRITE;
/*!40000 ALTER TABLE `FACTURAEGRESO` DISABLE KEYS */;
/*!40000 ALTER TABLE `FACTURAEGRESO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURAINGRESO`
--

DROP TABLE IF EXISTS `FACTURAINGRESO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURAINGRESO` (
  `CODIGO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTAL_IVA` double DEFAULT NULL,
  `CAJA_CODIGO` int(11) DEFAULT NULL,
  `PACIENTE_CODIGO` int(11) DEFAULT NULL,
  `CITA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURAINGRESO_PACIENTE_CODIGO` (`PACIENTE_CODIGO`),
  KEY `FK_FACTURAINGRESO_CAJA_CODIGO` (`CAJA_CODIGO`),
  KEY `FK_FACTURAINGRESO_CITA_CODIGO` (`CITA_CODIGO`),
  CONSTRAINT `FK_FACTURAINGRESO_CAJA_CODIGO` FOREIGN KEY (`CAJA_CODIGO`) REFERENCES `CAJA` (`CODIGO`),
  CONSTRAINT `FK_FACTURAINGRESO_CITA_CODIGO` FOREIGN KEY (`CITA_CODIGO`) REFERENCES `CITA` (`CODIGO`),
  CONSTRAINT `FK_FACTURAINGRESO_PACIENTE_CODIGO` FOREIGN KEY (`PACIENTE_CODIGO`) REFERENCES `PACIENTE` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURAINGRESO`
--

LOCK TABLES `FACTURAINGRESO` WRITE;
/*!40000 ALTER TABLE `FACTURAINGRESO` DISABLE KEYS */;
INSERT INTO `FACTURAINGRESO` VALUES (1901,'2020-07-17',62.2,85.168,3.48,3,1,1);
/*!40000 ALTER TABLE `FACTURAINGRESO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORIACLINICA`
--

DROP TABLE IF EXISTS `HISTORIACLINICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISTORIACLINICA` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` datetime DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL,
  `HISTORIALCLINICO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_HISTORIACLINICA_HISTORIALCLINICO_CODIGO` (`HISTORIALCLINICO_CODIGO`),
  CONSTRAINT `FK_HISTORIACLINICA_HISTORIALCLINICO_CODIGO` FOREIGN KEY (`HISTORIALCLINICO_CODIGO`) REFERENCES `HISTORIALCLINICO` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORIACLINICA`
--

LOCK TABLES `HISTORIACLINICA` WRITE;
/*!40000 ALTER TABLE `HISTORIACLINICA` DISABLE KEYS */;
/*!40000 ALTER TABLE `HISTORIACLINICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORIALCLINICO`
--

DROP TABLE IF EXISTS `HISTORIALCLINICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISTORIALCLINICO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `PACIENTE_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_HISTORIALCLINICO_PACIENTE_CODIGO` (`PACIENTE_CODIGO`),
  CONSTRAINT `FK_HISTORIALCLINICO_PACIENTE_CODIGO` FOREIGN KEY (`PACIENTE_CODIGO`) REFERENCES `PACIENTE` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORIALCLINICO`
--

LOCK TABLES `HISTORIALCLINICO` WRITE;
/*!40000 ALTER TABLE `HISTORIALCLINICO` DISABLE KEYS */;
/*!40000 ALTER TABLE `HISTORIALCLINICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRODIARIO`
--

DROP TABLE IF EXISTS `LIBRODIARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIBRODIARIO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRODIARIO`
--

LOCK TABLES `LIBRODIARIO` WRITE;
/*!40000 ALTER TABLE `LIBRODIARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIBRODIARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICAMENTO`
--

DROP TABLE IF EXISTS `MEDICAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICAMENTO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_CADUCIDAD` date DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `REGISTRO_SANITARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAMENTO`
--

LOCK TABLES `MEDICAMENTO` WRITE;
/*!40000 ALTER TABLE `MEDICAMENTO` DISABLE KEYS */;
INSERT INTO `MEDICAMENTO` VALUES (1,'2021-07-31','Paracetamol',2.8,98765678),(2,'2021-07-24','Aspirina',0.5,98765628),(3,'2021-07-17','Dexamestason',200,98765679),(4,'2020-07-24','Cita',50,9843222),(5,'2020-07-14','Atromicina',40,12);
/*!40000 ALTER TABLE `MEDICAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICO`
--

DROP TABLE IF EXISTS `MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CEDULA` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `ESPECIALIDAD` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROL_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_MEDICO_ROL_CODIGO` (`ROL_CODIGO`),
  CONSTRAINT `FK_MEDICO_ROL_CODIGO` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `ROL` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICO`
--

LOCK TABLES `MEDICO` WRITE;
/*!40000 ALTER TABLE `MEDICO` DISABLE KEYS */;
INSERT INTO `MEDICO` VALUES (1,'Alvarracin','0102030405','jgullan@gmail.com','Medico','Julian','j12345678',5),(2,'CALLE','2348593479','juan@calle','CIRUJANO','JUAN','juan',5),(3,'NIEVES','2345834','diego@nieves','MEDICO GENERAL','DIEGO','diego',5);
/*!40000 ALTER TABLE `MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDENMEDICA`
--

DROP TABLE IF EXISTS `ORDENMEDICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDENMEDICA` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `SERVICIO` varchar(255) DEFAULT NULL,
  `HISTORIACLINICA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_ORDENMEDICA_HISTORIACLINICA_CODIGO` (`HISTORIACLINICA_CODIGO`),
  CONSTRAINT `FK_ORDENMEDICA_HISTORIACLINICA_CODIGO` FOREIGN KEY (`HISTORIACLINICA_CODIGO`) REFERENCES `HISTORIACLINICA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDENMEDICA`
--

LOCK TABLES `ORDENMEDICA` WRITE;
/*!40000 ALTER TABLE `ORDENMEDICA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDENMEDICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTE`
--

DROP TABLE IF EXISTS `PACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTE` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CEDULA` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROL_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PACIENTE_ROL_CODIGO` (`ROL_CODIGO`),
  CONSTRAINT `FK_PACIENTE_ROL_CODIGO` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `ROL` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
INSERT INTO `PACIENTE` VALUES (1,'chuchuca','0106330145','bchuchucaa@gmail.com','Isra','12345678',5),(2,'RUIZ','2394857349','pepe@ruiz','PEPE','pepe',5),(3,'FERNANDEZ','192853712','jose@fer','JOSE','jose',5);
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONA`
--

DROP TABLE IF EXISTS `PERSONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONA` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(31) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CEDULA` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROL_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PERSONA_ROL_CODIGO` (`ROL_CODIGO`),
  CONSTRAINT `FK_PERSONA_ROL_CODIGO` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `ROL` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONA`
--

LOCK TABLES `PERSONA` WRITE;
/*!40000 ALTER TABLE `PERSONA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESCRIPCION`
--

DROP TABLE IF EXISTS `PRESCRIPCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIPCION` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `OBSERVACION` varchar(255) DEFAULT NULL,
  `HISTORIACLINICA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PRESCRIPCION_HISTORIACLINICA_CODIGO` (`HISTORIACLINICA_CODIGO`),
  CONSTRAINT `FK_PRESCRIPCION_HISTORIACLINICA_CODIGO` FOREIGN KEY (`HISTORIACLINICA_CODIGO`) REFERENCES `HISTORIACLINICA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIPCION`
--

LOCK TABLES `PRESCRIPCION` WRITE;
/*!40000 ALTER TABLE `PRESCRIPCION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESCRIPCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROL` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL`
--

LOCK TABLES `ROL` WRITE;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` VALUES (1,'ROL DE CONTADOR','CONTADOR'),(2,'ROL DE SECRETARIA','SECRETARIA'),(3,'ROL DE ASISTENTE','ASISTENTE'),(4,'ROL DE PACIENTE','PACIENTE'),(5,'ROL DE MEDICO','MEDICO'),(6,'ADMINISTRA EL SISTEMA','ADMINISTRADOR');
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',1950);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 15:36:07
