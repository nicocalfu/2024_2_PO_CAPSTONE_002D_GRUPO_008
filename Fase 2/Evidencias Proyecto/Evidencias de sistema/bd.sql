-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: detia_degesch_lab
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analisis_parametros_quimicos`
--

DROP TABLE IF EXISTS `analisis_parametros_quimicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_parametros_quimicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_lote` varchar(50) NOT NULL,
  `aprobada` tinyint(1) NOT NULL,
  `id_responsable` int NOT NULL,
  `fecha` date NOT NULL,
  `NH4` int NOT NULL,
  `AIP` int NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_nro_lote` (`nro_lote`),
  KEY `id_responsable` (`id_responsable`),
  CONSTRAINT `analisis_parametros_quimicos_ibfk_2` FOREIGN KEY (`nro_lote`) REFERENCES `mezcla` (`nro_lote`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_parametros_quimicos`
--

LOCK TABLES `analisis_parametros_quimicos` WRITE;
/*!40000 ALTER TABLE `analisis_parametros_quimicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis_parametros_quimicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analisis_producto_terminado`
--

DROP TABLE IF EXISTS `analisis_producto_terminado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_producto_terminado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_responsable` int NOT NULL,
  `id_turno` int NOT NULL,
  `caja_contramuestra` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsable` (`id_responsable`),
  KEY `id_turno` (`id_turno`),
  CONSTRAINT `analisis_producto_terminado_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `empleado` (`id`),
  CONSTRAINT `analisis_producto_terminado_ibfk_2` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_producto_terminado`
--

LOCK TABLES `analisis_producto_terminado` WRITE;
/*!40000 ALTER TABLE `analisis_producto_terminado` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis_producto_terminado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacion`
--

DROP TABLE IF EXISTS `autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analisis_producto_terminado` int NOT NULL,
  `numero_autorizacion` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `id_determinacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id_analisis_producto_terminado` (`id_analisis_producto_terminado`),
  KEY `fk_determinacion` (`id_determinacion`),
  CONSTRAINT `autorizacion_ibfk_1` FOREIGN KEY (`id_analisis_producto_terminado`) REFERENCES `analisis_producto_terminado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_determinacion` FOREIGN KEY (`id_determinacion`) REFERENCES `determinacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacion`
--

LOCK TABLES `autorizacion` WRITE;
/*!40000 ALTER TABLE `autorizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Alumno en práctica'),(2,'Asistente Administrativo'),(3,'Asistente Gerencia'),(4,'Asistente Ventas'),(5,'Auxiliar de Aseo'),(6,'Ayudante de operador'),(7,'Encargada de Registro y Normativa'),(8,'Encargado COMEX'),(9,'Gerente Comercial y Técnico'),(10,'Gerente de Adm. y Finanzas'),(11,'Gerente de Producción'),(12,'Gerente General'),(13,'Jefe Área Formulación'),(14,'Jefe Área Logística'),(15,'Jefe Control de Calidad'),(16,'Jefe de Planta'),(17,'Junior'),(18,'Laboratorista'),(19,'Operador'),(20,'Representante Técnico Comercial'),(21,'Supervisor Formulación'),(22,'Supervisor Síntesis');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `determinacion`
--

DROP TABLE IF EXISTS `determinacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `determinacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `determinacion`
--

LOCK TABLES `determinacion` WRITE;
/*!40000 ALTER TABLE `determinacion` DISABLE KEYS */;
INSERT INTO `determinacion` VALUES (1,'Aprobado'),(2,'Parcialmente Aprobado'),(3,'Rechazado');
/*!40000 ALTER TABLE `determinacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `id_seccion` int NOT NULL,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_seccion` (`id_seccion`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Luis','Finol',4,13),(2,'Nicolas','Calfulaf',2,18),(3,'Juan','Perez',4,19),(4,'Rodrigo','Gonzalez',4,19);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente_activo`
--

DROP TABLE IF EXISTS `ingrediente_activo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente_activo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_activo`
--

LOCK TABLES `ingrediente_activo` WRITE;
/*!40000 ALTER TABLE `ingrediente_activo` DISABLE KEYS */;
INSERT INTO `ingrediente_activo` VALUES (1,'Fosfuro de aluminio'),(2,'Fosfuro de magnesio');
/*!40000 ALTER TABLE `ingrediente_activo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote_producto_terminado_analisis`
--

DROP TABLE IF EXISTS `lote_producto_terminado_analisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote_producto_terminado_analisis` (
  `id_analisis_producto_terminado` int NOT NULL,
  `id_producto_terminado` int NOT NULL,
  PRIMARY KEY (`id_analisis_producto_terminado`,`id_producto_terminado`),
  KEY `lote_producto_terminado_analisis_ibfk_2` (`id_producto_terminado`),
  CONSTRAINT `lote_producto_terminado_analisis_ibfk_1` FOREIGN KEY (`id_analisis_producto_terminado`) REFERENCES `analisis_producto_terminado` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lote_producto_terminado_analisis_ibfk_2` FOREIGN KEY (`id_producto_terminado`) REFERENCES `producto_terminado` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_producto_terminado_analisis`
--

LOCK TABLES `lote_producto_terminado_analisis` WRITE;
/*!40000 ALTER TABLE `lote_producto_terminado_analisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote_producto_terminado_analisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (1,'Máquina 1'),(2,'Maquina 2'),(3,'Maquina 3'),(4,'Maquina 4'),(5,'Maquina 5');
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mezcla`
--

DROP TABLE IF EXISTS `mezcla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mezcla` (
  `nro_lote` varchar(50) NOT NULL,
  `nro_lote_parafinado` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `nro_receta` int NOT NULL,
  PRIMARY KEY (`nro_lote`),
  UNIQUE KEY `nro_lote` (`nro_lote`),
  KEY `mezcla_ibfk_1` (`nro_receta`),
  CONSTRAINT `mezcla_ibfk_1` FOREIGN KEY (`nro_receta`) REFERENCES `receta_mezcla` (`nro_receta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezcla`
--

LOCK TABLES `mezcla` WRITE;
/*!40000 ALTER TABLE `mezcla` DISABLE KEYS */;
/*!40000 ALTER TABLE `mezcla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestra_parametros_fisicos`
--

DROP TABLE IF EXISTS `muestra_parametros_fisicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muestra_parametros_fisicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analisis_producto_terminado` int NOT NULL,
  `polvo` float NOT NULL,
  `fracturado` int NOT NULL,
  `peso_neto` float NOT NULL,
  `nro_muestra` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `muestra_parametros_fisicos_ibfk_1` (`id_analisis_producto_terminado`),
  CONSTRAINT `muestra_parametros_fisicos_ibfk_1` FOREIGN KEY (`id_analisis_producto_terminado`) REFERENCES `analisis_producto_terminado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestra_parametros_fisicos`
--

LOCK TABLES `muestra_parametros_fisicos` WRITE;
/*!40000 ALTER TABLE `muestra_parametros_fisicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `muestra_parametros_fisicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestra_tableta`
--

DROP TABLE IF EXISTS `muestra_tableta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muestra_tableta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_muestra_parametros_fisicos` int NOT NULL,
  `peso` float NOT NULL,
  `dureza` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `muestra_tableta_ibfk_1` (`id_muestra_parametros_fisicos`),
  CONSTRAINT `muestra_tableta_ibfk_1` FOREIGN KEY (`id_muestra_parametros_fisicos`) REFERENCES `muestra_parametros_fisicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestra_tableta`
--

LOCK TABLES `muestra_tableta` WRITE;
/*!40000 ALTER TABLE `muestra_tableta` DISABLE KEYS */;
/*!40000 ALTER TABLE `muestra_tableta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador_receta`
--

DROP TABLE IF EXISTS `operador_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operador_receta` (
  `nro_receta` int NOT NULL,
  `id_operador` int NOT NULL,
  PRIMARY KEY (`nro_receta`,`id_operador`),
  KEY `id_operador` (`id_operador`),
  CONSTRAINT `operador_receta_ibfk_1` FOREIGN KEY (`nro_receta`) REFERENCES `receta_mezcla` (`nro_receta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operador_receta_ibfk_2` FOREIGN KEY (`id_operador`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador_receta`
--

LOCK TABLES `operador_receta` WRITE;
/*!40000 ALTER TABLE `operador_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `operador_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `cod_producto` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('1','RT500'),('2','RT35'),('3','RT50'),('4','RT333'),('5','RT4000'),('6','P2000'),('7','T480');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_terminado`
--

DROP TABLE IF EXISTS `producto_terminado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_terminado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_lote` varchar(50) NOT NULL,
  `observaciones` text NOT NULL,
  `cod_producto` varchar(50) NOT NULL,
  `id_turno` int NOT NULL,
  `fecha` datetime NOT NULL,
  `id_operador` int NOT NULL,
  `id_maquina` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_producto` (`cod_producto`),
  KEY `id_turno` (`id_turno`),
  KEY `id_operador` (`id_operador`),
  KEY `id_maquina` (`id_maquina`),
  KEY `producto_terminado_ibfk_1` (`nro_lote`),
  CONSTRAINT `producto_terminado_ibfk_1` FOREIGN KEY (`nro_lote`) REFERENCES `mezcla` (`nro_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_terminado_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`),
  CONSTRAINT `producto_terminado_ibfk_3` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id`),
  CONSTRAINT `producto_terminado_ibfk_4` FOREIGN KEY (`id_operador`) REFERENCES `empleado` (`id`),
  CONSTRAINT `producto_terminado_ibfk_5` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_terminado`
--

LOCK TABLES `producto_terminado` WRITE;
/*!40000 ALTER TABLE `producto_terminado` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_terminado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_mezcla`
--

DROP TABLE IF EXISTS `receta_mezcla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_mezcla` (
  `nro_receta` int NOT NULL AUTO_INCREMENT,
  `fecha_fabricacion` date NOT NULL,
  `id_ingrediente_activo` int NOT NULL,
  `cantidad_ingrediente_activo` float NOT NULL,
  `carbamato_de_amonio` float NOT NULL,
  `sulfato_de_bario` float NOT NULL,
  `grafito` float NOT NULL,
  `estearato_de_zinc` float NOT NULL,
  PRIMARY KEY (`nro_receta`),
  UNIQUE KEY `nro_receta` (`nro_receta`),
  KEY `id_ingrediente_activo` (`id_ingrediente_activo`),
  CONSTRAINT `receta_mezcla_ibfk_1` FOREIGN KEY (`id_ingrediente_activo`) REFERENCES `ingrediente_activo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_mezcla`
--

LOCK TABLES `receta_mezcla` WRITE;
/*!40000 ALTER TABLE `receta_mezcla` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_mezcla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechazo`
--

DROP TABLE IF EXISTS `rechazo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rechazo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analisis_producto_terminado` int NOT NULL,
  `numero_rechazo` int NOT NULL,
  `causa` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `id_determinacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id_analisis_producto_terminado` (`id_analisis_producto_terminado`),
  KEY `fk_determinacion_rechazo` (`id_determinacion`),
  CONSTRAINT `fk_determinacion_rechazo` FOREIGN KEY (`id_determinacion`) REFERENCES `determinacion` (`id`),
  CONSTRAINT `rechazo_ibfk_1` FOREIGN KEY (`id_analisis_producto_terminado`) REFERENCES `analisis_producto_terminado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechazo`
--

LOCK TABLES `rechazo` WRITE;
/*!40000 ALTER TABLE `rechazo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechazo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,'Administración'),(2,'CoCal y Drllo.'),(3,'Desactivado'),(4,'Formulación'),(5,'Logística'),(6,'Práctica'),(7,'Síntesis');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'Día'),(2,'Noche');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `unique_id_empleado` (`id_empleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'supervisor_formulacion','$2b$12$qCUw6EroZEPxDji2y96PBe2OHH0DzAvnXgksEcpv0nXFF9DYb3wvK',1),(2,'analista_laboratorio','$2b$12$Os6BEFbdOpHYCE.w8j0AFuafYenn.RkAayzZEh13KUnEOcW4tHAg.',2),(7,'admin','$2b$12$SZqtjTsMH3GEsTeiHY9dhOG4mZAN4jWs1RYK4DtsipFwTcT9r1g9q',NULL);
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

-- Dump completed on 2024-12-09  1:11:23
