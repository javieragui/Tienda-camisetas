-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_camisetas
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Manga corta'),(2,'Tirantes'),(3,'Manga larga'),(4,'Sudaderas'),(5,'Pantalones');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas_pedidos`
--

DROP TABLE IF EXISTS `lineas_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas_pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  `unidades` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_linea_pedido` (`pedido_id`),
  KEY `fk_linea_producto` (`producto_id`),
  CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas_pedidos`
--

LOCK TABLES `lineas_pedidos` WRITE;
/*!40000 ALTER TABLE `lineas_pedidos` DISABLE KEYS */;
INSERT INTO `lineas_pedidos` VALUES (1,9,4,2),(2,9,1,1),(3,10,5,4),(4,11,5,5),(5,12,4,1),(6,13,4,2),(7,13,1,3);
/*!40000 ALTER TABLE `lineas_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario` (`usuario_id`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,2,'Baleares','Mallorca','C/ Conquistador Nº 11',150.00,'confirm','2020-12-18','12:15:45'),(2,2,'Madrid','Madrid','Plaza',150.00,'confirm','2020-12-18','12:51:27'),(3,2,'Madrid','Madrid','Plaza',150.00,'ready','2020-12-18','12:52:16'),(4,2,'Madrid','Madrid','Calle Alcala Nº12',21.00,'confirm','2020-12-18','13:00:05'),(5,2,'Madrid','Madrid','Calle Alcala Nº12',21.00,'confirm','2020-12-18','13:05:25'),(6,2,'Madrid','Madrid','Calle Alcala Numero 12',21.00,'confirm','2020-12-18','13:07:00'),(7,2,'Madrid','Madrid','Calle Alcala Numero 12',21.00,'confirm','2020-12-18','13:09:47'),(8,2,'Madrid','Madrid','Calle Alcala Numero 12',21.00,'confirm','2020-12-18','13:10:31'),(9,2,'Cataluña','Barcelona','Las Ramblas Nº20',124.00,'confirm','2020-12-18','13:14:16'),(10,2,'Extremadura','Plasencia','Calle la consigna Numero 22',28.00,'confirm','2020-12-18','13:15:47'),(11,2,'Valencia','Alicante','C/ Aragon Nº11',35.00,'ready','2020-12-18','14:35:24'),(12,2,'Extremadura','Plasencia','Calle margarita Numero12',12.00,'preparation','2020-12-21','19:27:45'),(13,6,'Barcelona','El prat','Calle Gran via Numero 8',324.00,'confirm','2020-12-22','12:48:02');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` float(100,2) NOT NULL,
  `stock` int(255) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`categoria_id`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Box Supreme','Box logo Supreme ultra ajustado',100.00,20,NULL,'2020-12-14',NULL),(4,1,'Camiseta Rayas','Camiseta corta de Rayas',12.00,5,NULL,'2020-12-16','camiseta_rayas.jpg'),(5,2,'Camiseta Rayas 4','                                                                                    Camiseta Rayas 4 con descripción                                                                                           ',7.00,3,NULL,'2020-12-16','Dados.png'),(6,5,'Pantalones Dados','Pantalones de dados 3D                                   ',25.00,7,NULL,'2020-12-16','Dados.png');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin','Admin','admin@admin.com','contraseña','admin',NULL),(2,'Javier','Aguilar','javier.aguilararribas7@gmail.com','$2y$04$pPbOAjT7rNii0AsKSl/hheM1B3XQ/P3yyCbMho16bDJe6FpYzeQNa','admin',NULL),(3,'Antonio','Gonzalez','antonio@gmail.com','$2y$04$K0PAd7UXm5MjFEzLwzDNF.M/9OpeZBzco2LG27mO0ZFyjtpJrvXgK','user',NULL),(4,'Jaime','Cascada','jaime@hotmail.com','$2y$04$9FqWR3kFF9XMOMubcj8XB.NTfDWTXjF5pcst.CsAYZXFBQ5qwfIpS','user',NULL),(5,'Mauricio','Hidalgo','mauri@mauri.com','$2y$04$xO4mThN8rKUvYe/uZ4yJ3euiPLMLZYIxQYRbhSwnDqx.yMEwCOYI.','user',NULL),(6,'David','Lopez','david@david.com','$2y$04$psFaKJLfxh0AkwNd0O68P.i/uf6gDqxYim0njFPU733Fb63BMk/5.','user',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 12:55:53
