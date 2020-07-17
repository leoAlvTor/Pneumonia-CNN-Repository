-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: 34.68.13.196    Database: practica03
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
-- Table structure for table `BODEGA`
--

DROP TABLE IF EXISTS `BODEGA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BODEGA` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `CIUDAD_CODIGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_BODEGA_CIUDAD_CODIGO` (`CIUDAD_CODIGO`),
  CONSTRAINT `FK_BODEGA_CIUDAD_CODIGO` FOREIGN KEY (`CIUDAD_CODIGO`) REFERENCES `CIUDAD` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BODEGA`
--

LOCK TABLES `BODEGA` WRITE;
/*!40000 ALTER TABLE `BODEGA` DISABLE KEYS */;
INSERT INTO `BODEGA` VALUES (1,'BODEGA_EL_ARENAL','CUE'),(2,'BODEGA_EL_MILENIO','QUI'),(3,'BODEGA_NORTE','GUQ'),(1502,'BODEDIT','BALSAS'),(1551,'BODEGA-IBA','CANTON JUNIN'),(1701,'BODEGA ESPERANZAG','ATACAMES'),(1751,'NEWBODEGA','CANTON ELOY ALFARO'),(1801,'NEW2BODEGA','LA MANA');
/*!40000 ALTER TABLE `BODEGA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIA` (
  `CODIGO` int(11) NOT NULL,
  `IMAGEN` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
INSERT INTO `CATEGORIA` VALUES (1,'https://images.ctfassets.net/3s5io6mnxfqz/5GlOYuzg0nApcehTPlbJMy/140abddf0f3f93fa16568f4d035cd5e6/AdobeStock_175165460.jpeg','CARNICOS'),(2,'https://drknews.com/wp-content/uploads/2017/12/vegetables-400.jpg','VERDURAS'),(3,'https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/set-of-different-fruits-on-table-victor-torres.jpg','FRUTAS');
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CIUDAD`
--

DROP TABLE IF EXISTS `CIUDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CIUDAD` (
  `CODIGO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PROVINCIA_CODIGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_CIUDAD_PROVINCIA_CODIGO` (`PROVINCIA_CODIGO`),
  CONSTRAINT `FK_CIUDAD_PROVINCIA_CODIGO` FOREIGN KEY (`PROVINCIA_CODIGO`) REFERENCES `PROVINCIA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CIUDAD`
--

LOCK TABLES `CIUDAD` WRITE;
/*!40000 ALTER TABLE `CIUDAD` DISABLE KEYS */;
INSERT INTO `CIUDAD` VALUES ('','',''),('ATACAMES','ATACAMES','PROVINCIA DE ESMERALDAS'),('BALSAS','BALSAS','PROVINCIA DE EL ORO'),('CANTON CALVAS','CANTON CALVAS','PROVINCIA DE LOJA'),('CANTON ELOY ALFARO','CANTON ELOY ALFARO','PROVINCIA DE ESMERALDAS'),('CANTON ESPINDOLA','CANTON ESPINDOLA','PROVINCIA DE LOJA'),('CANTON GUABO','CANTON GUABO','PROVINCIA DE EL ORO'),('CANTON JUNIN','CANTON JUNIN','PROVINCIA DE MANABI'),('CANTON MONTECRISTI','CANTON MONTECRISTI','PROVINCIA DE MANABI'),('CANTON PUYANGO','CANTON PUYANGO','PROVINCIA DE LOJA'),('CANTON SARAGURO','CANTON SARAGURO','PROVINCIA DE LOJA'),('CAY','CAYAMBE','UI'),('CUE','CUENCA','AZ'),('GIR','GIRON','AZ'),('GUQ','GUAYAQUIL','GY'),('IBARRA','IBARRA','PROVINCIA DE IMBABURA'),('LA MANA','LA MANA','PROVINCIA DE COTOPAXI'),('MOCACHE','MOCACHE','PROVINCIA DE LOS RIOS'),('MONTALVO','MONTALVO','PROVINCIA DE LOS RIOS'),('QUI','QUITO','UI'),('SANTIAGO','SANTIAGO','PROVINCIA DE MORONA'),('SNB','SAN BORONDON','GY');
/*!40000 ALTER TABLE `CIUDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURACABECERA`
--

DROP TABLE IF EXISTS `FACTURACABECERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURACABECERA` (
  `CODIGO` int(11) NOT NULL,
  `ANULADO` char(1) DEFAULT NULL,
  `DESCUENTO` double DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `IVA_TOTAL` double DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `PERSONA_CEDULA` varchar(255) DEFAULT NULL,
  `PEDIDO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURACABECERA_PERSONA_CEDULA` (`PERSONA_CEDULA`),
  KEY `FK_FACTURACABECERA_PEDIDO_CODIGO` (`PEDIDO_CODIGO`),
  CONSTRAINT `FK_FACTURACABECERA_PEDIDO_CODIGO` FOREIGN KEY (`PEDIDO_CODIGO`) REFERENCES `PEDIDO` (`CODIGO`),
  CONSTRAINT `FK_FACTURACABECERA_PERSONA_CEDULA` FOREIGN KEY (`PERSONA_CEDULA`) REFERENCES `PERSONA` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURACABECERA`
--

LOCK TABLES `FACTURACABECERA` WRITE;
/*!40000 ALTER TABLE `FACTURACABECERA` DISABLE KEYS */;
INSERT INTO `FACTURACABECERA` VALUES (2051,'N',0,'2020-07-11',3.432,25.168000000000003,28.6,'0105652747',8);
/*!40000 ALTER TABLE `FACTURACABECERA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURADETALLE`
--

DROP TABLE IF EXISTS `FACTURADETALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURADETALLE` (
  `CODIGO` int(11) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `FACTURACABECERA_CODIGO` int(11) DEFAULT NULL,
  `PRODUCTO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_FACTURADETALLE_PRODUCTO_CODIGO` (`PRODUCTO_CODIGO`),
  KEY `FK_FACTURADETALLE_FACTURACABECERA_CODIGO` (`FACTURACABECERA_CODIGO`),
  CONSTRAINT `FK_FACTURADETALLE_FACTURACABECERA_CODIGO` FOREIGN KEY (`FACTURACABECERA_CODIGO`) REFERENCES `FACTURACABECERA` (`CODIGO`),
  CONSTRAINT `FK_FACTURADETALLE_PRODUCTO_CODIGO` FOREIGN KEY (`PRODUCTO_CODIGO`) REFERENCES `PRODUCTO` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURADETALLE`
--

LOCK TABLES `FACTURADETALLE` WRITE;
/*!40000 ALTER TABLE `FACTURADETALLE` DISABLE KEYS */;
INSERT INTO `FACTURADETALLE` VALUES (2052,2,5,2051,551),(2053,4,19.6,2051,651),(2054,8,4,2051,701);
/*!40000 ALTER TABLE `FACTURADETALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIS`
--

DROP TABLE IF EXISTS `PAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAIS` (
  `CODIGO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIS`
--

LOCK TABLES `PAIS` WRITE;
/*!40000 ALTER TABLE `PAIS` DISABLE KEYS */;
INSERT INTO `PAIS` VALUES ('EC','ECUADOR');
/*!40000 ALTER TABLE `PAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEDIDO` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA_EMISION` datetime DEFAULT NULL,
  `PERSONA_CEDULA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PEDIDO_PERSONA_CEDULA` (`PERSONA_CEDULA`),
  CONSTRAINT `FK_PEDIDO_PERSONA_CEDULA` FOREIGN KEY (`PERSONA_CEDULA`) REFERENCES `PERSONA` (`CEDULA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO`
--

LOCK TABLES `PEDIDO` WRITE;
/*!40000 ALTER TABLE `PEDIDO` DISABLE KEYS */;
INSERT INTO `PEDIDO` VALUES (8,'ENVIADO','2020-07-11 05:00:00','0105652747');
/*!40000 ALTER TABLE `PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONA`
--

DROP TABLE IF EXISTS `PERSONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONA` (
  `CEDULA` varchar(255) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `ANULADO` char(1) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONA`
--

LOCK TABLES `PERSONA` WRITE;
/*!40000 ALTER TABLE `PERSONA` DISABLE KEYS */;
INSERT INTO `PERSONA` VALUES ('0101130862','Torres','Uncovia','Leonardo','0998072563','F','leo@leo.com','leo123'),('0105652747','Alvarado','Checa-Centro','Leo','0979395837','F','torres@leo.com','leo.com');
/*!40000 ALTER TABLE `PERSONA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `CODIGO` int(11) NOT NULL,
  `IMAGEN` varchar(255) DEFAULT NULL,
  `IVA` char(1) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PRECIOCOMPRA` double DEFAULT NULL,
  `PRECIOVENTA` double DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL,
  `CATEGORIA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PRODUCTO_CATEGORIA_CODIGO` (`CATEGORIA_CODIGO`),
  CONSTRAINT `FK_PRODUCTO_CATEGORIA_CODIGO` FOREIGN KEY (`CATEGORIA_CODIGO`) REFERENCES `CATEGORIA` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (401,'https://static3.abc.es/media/familia/2018/04/03/kiwi-kC0--1240x698@abc-kyDF--1240x698@abc.jpg','\0','Docena de kiwis',0,0,0,3),(451,'https://www.tutareaescolar.com/wp-content/uploads/Tutarea/tipos/Clases%20de%20uvas%20-%20Clasificaciones%20y%20concepto.jpg','\0','Libra de Uva',3.5,4,0,3),(501,'https://cdn.britannica.com/68/143268-050-917048EA/Beef-loin.jpg','S','Carne de res',3.4,5,10,1),(551,'https://www.grupolucas.net/wp-content/uploads/2019/12/El-br%C3%B3coli-y-sus-prote%C3%ADnas-1024x792.jpg','S','Brocoli',2,2.5,5,2),(651,'https://i2.wp.com/marketclick.com.ec/wp-content/uploads/2019/05/cebolla2.jpg','S','Cebolla',3.15,4.9,10,2),(701,'https://ecocosas.com/wp-content/uploads/2018/08/cilantro.jpg','S','Cilantro',0.25,0.5,20,2),(751,'https://viprecetas.com/wp-content/uploads/2020/01/aguacate.png','S','aguacate',0.25,0.5,10,2),(801,'https://www.ecestaticos.com/image/clipping/6f8b131b4a60e540f498d804d76350e4/mortadela-de-bolonia-el-embutido-gourmet-de-italia.jpg','S','Mortadela',2.1,2.99,20,1),(851,'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/imj/otramedicina/1/147704221.jpg','S','Col',0.6,0.8,6,2),(901,'https://www.laprensagrafica.com/__export/1508186157976/sites/prensagrafica/img/2017/10/16/pepinos_2.jpg_1902800913.jpg','S','Pepino',0.5,0.75,10,2),(951,'https://www.mercadoflotante.com/blog/wp-content/uploads/2016/04/Arveja.jpg','S','arveja',100,150,10,2),(1001,'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/m/manzana.jpg','N','Manzana',0.15,0.2,4,3),(1201,'https://us.123rf.com/450wm/yvdavyd/yvdavyd1506/yvdavyd150600119/40902782-peach-aislados-en-fondo-blanco-.jpg?ver=6','N','Durazno',0.12,0.25,20,3),(1251,'https://media.mercola.com/assets/images/foodfacts/pear-nutrition-facts.jpg','N','Pera',0.25,0.3,10,3),(1601,'https://www.comefrisk.com/wp-content/uploads/2020/03/Papaya-01.png','S','Papaya',1,1.25,10,3),(1651,'https://www.consorfrut.com/wp-content/uploads/2017/05/cereza-fruta-mes-mayo-consorfrut.jpg','N','rabanos',1.2,1.45,100,2),(1652,'https://www.consorfrut.com/wp-content/uploads/2017/05/cereza-fruta-mes-mayo-consorfrut.jpg','N','Libra de cereza',1.2,1.45,100,3);
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_BODEGA`
--

DROP TABLE IF EXISTS `PRODUCTO_BODEGA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_BODEGA` (
  `bodegasList_CODIGO` int(11) NOT NULL,
  `productosList_CODIGO` int(11) NOT NULL,
  PRIMARY KEY (`bodegasList_CODIGO`,`productosList_CODIGO`),
  KEY `FK_PRODUCTO_BODEGA_productosList_CODIGO` (`productosList_CODIGO`),
  CONSTRAINT `FK_PRODUCTO_BODEGA_bodegasList_CODIGO` FOREIGN KEY (`bodegasList_CODIGO`) REFERENCES `BODEGA` (`CODIGO`),
  CONSTRAINT `FK_PRODUCTO_BODEGA_productosList_CODIGO` FOREIGN KEY (`productosList_CODIGO`) REFERENCES `PRODUCTO` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_BODEGA`
--

LOCK TABLES `PRODUCTO_BODEGA` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_BODEGA` DISABLE KEYS */;
INSERT INTO `PRODUCTO_BODEGA` VALUES (1,401),(1502,401),(1701,401),(1,451),(2,451),(1502,451),(1801,451),(1,501),(2,501),(1502,501),(1801,501),(1,551),(2,551),(1551,551),(1751,551),(1,651),(2,651),(1502,651),(1551,651),(1,701),(2,701),(1551,701),(1701,701),(1801,701),(1,751),(2,751),(1701,751),(1,801),(2,801),(1551,801),(1701,801),(1,851),(2,851),(1,901),(2,901),(1,951),(2,951),(1,1001),(2,1001),(1751,1001),(1,1201),(2,1201),(3,1201),(1801,1201),(1,1251),(3,1251),(1,1601),(3,1601),(1,1651),(3,1651),(1,1652),(1502,1652),(1551,1652),(1701,1652);
/*!40000 ALTER TABLE `PRODUCTO_BODEGA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVINCIA`
--

DROP TABLE IF EXISTS `PROVINCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVINCIA` (
  `CODIGO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PAIS_CODIGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PROVINCIA_PAIS_CODIGO` (`PAIS_CODIGO`),
  CONSTRAINT `FK_PROVINCIA_PAIS_CODIGO` FOREIGN KEY (`PAIS_CODIGO`) REFERENCES `PAIS` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVINCIA`
--

LOCK TABLES `PROVINCIA` WRITE;
/*!40000 ALTER TABLE `PROVINCIA` DISABLE KEYS */;
INSERT INTO `PROVINCIA` VALUES ('','','EC'),('AZ','AZUAY','EC'),('GY','GUAYAS','EC'),('PROVINCIA DE COTOPAXI','PROVINCIA DE COTOPAXI','EC'),('PROVINCIA DE EL ORO','PROVINCIA DE EL ORO','EC'),('PROVINCIA DE ESMERALDAS','PROVINCIA DE ESMERALDAS','EC'),('PROVINCIA DE IMBABURA','PROVINCIA DE IMBABURA','EC'),('PROVINCIA DE LOJA','PROVINCIA DE LOJA','EC'),('PROVINCIA DE LOS RIOS','PROVINCIA DE LOS RIOS','EC'),('PROVINCIA DE MANABI','PROVINCIA DE MANABI','EC'),('PROVINCIA DE MORONA','PROVINCIA DE MORONA','EC'),('UI','PICHINCHA','EC');
/*!40000 ALTER TABLE `PROVINCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROL` (
  `NOMBRE` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NOMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL`
--

LOCK TABLES `ROL` WRITE;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
INSERT INTO `ROL` VALUES ('Administrador','Rol para el admin'),('Leo','Rol para el admin'),('Secretaria','Rol para la secretaria');
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
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',2100);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOCK`
--

DROP TABLE IF EXISTS `STOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `STOCK` int(11) DEFAULT NULL,
  `BODEGA_CODIGO` int(11) DEFAULT NULL,
  `PRODUCTO_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_STOCK_PRODUCTO_CODIGO` (`PRODUCTO_CODIGO`),
  KEY `FK_STOCK_BODEGA_CODIGO` (`BODEGA_CODIGO`),
  CONSTRAINT `FK_STOCK_BODEGA_CODIGO` FOREIGN KEY (`BODEGA_CODIGO`) REFERENCES `BODEGA` (`CODIGO`),
  CONSTRAINT `FK_STOCK_PRODUCTO_CODIGO` FOREIGN KEY (`PRODUCTO_CODIGO`) REFERENCES `PRODUCTO` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOCK`
--

LOCK TABLES `STOCK` WRITE;
/*!40000 ALTER TABLE `STOCK` DISABLE KEYS */;
INSERT INTO `STOCK` VALUES (1,45,1,951),(2,69,2,1001),(3,10,3,1001),(4,20,1,1251),(5,10,3,1601),(6,10,1,1601),(7,100,1551,1651),(8,100,1502,1651),(9,100,1,1651),(10,100,2,1651),(11,100,3,1651),(12,100,2,1652),(13,100,1,1652),(14,100,1502,1652),(15,100,1551,1652),(16,100,3,1652);
/*!40000 ALTER TABLE `STOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `CODIGO` int(11) NOT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROL_NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_USUARIO_ROL_NOMBRE` (`ROL_NOMBRE`),
  CONSTRAINT `FK_USUARIO_ROL_NOMBRE` FOREIGN KEY (`ROL_NOMBRE`) REFERENCES `ROL` (`NOMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'kronos@g.com','12345678','Administrador');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 15:36:41
