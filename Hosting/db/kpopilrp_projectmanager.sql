-- MySQL dump 10.19  Distrib 10.3.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: kpopilrp_projectmanager
-- ------------------------------------------------------
-- Server version	10.3.36-MariaDB-log-cll-lve

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT 0,
  `changes` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT 0,
  `log_for2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for_id2` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` (`id`, `created_at`, `created_by`, `action`, `log_type`, `log_type_title`, `log_type_id`, `changes`, `log_for`, `log_for_id`, `log_for2`, `log_for_id2`, `deleted`) VALUES (1,'2019-08-14 16:42:20',1,'created','task','clonar y condicionar sistema de alerta de marino a terrestre',1,NULL,'project',1,'',0,0),(2,'2019-08-14 16:50:07',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(3,'2019-08-14 16:50:13',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(4,'2019-08-14 19:45:26',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(5,'2019-08-14 19:45:28',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(6,'2019-08-14 20:09:39',1,'created','task','Apoyo para  el manual del sistema maritimo y terrestre',2,NULL,'project',2,'',0,0),(7,'2019-08-14 20:09:48',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',2,'',0,0),(8,'2019-08-14 20:16:58',1,'created','milestone','modelacion de base de datos',1,NULL,'project',1,'',0,0),(9,'2019-08-14 20:37:53',1,'created','task','agregar la opcion de poner  el maximo de velocidad por vehiculo',3,NULL,'project',1,'',0,0),(10,'2019-08-14 20:40:09',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-08-14\";}}','project',1,'',0,0),(11,'2019-08-14 20:40:23',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9999500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',2,'',0,0),(12,'2019-08-14 20:40:28',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(13,'2019-08-14 20:45:08',1,'created','task_comment','modificando velocidad  del mobil parte:https://i.imgur.com/WSHieQJ.png',1,NULL,'project',1,'task',1,0),(14,'2019-08-15 17:50:38',1,'created','task','reunion con italo para ver tema de ipd',4,NULL,'project',2,'',0,0),(15,'2019-08-16 16:48:44',1,'created','task','creación de manuales de usuario para el sistema',5,NULL,'project',2,'',0,0),(16,'2019-08-16 16:49:06',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:8:\"10099500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(17,'2019-08-20 20:11:29',1,'created','task','reporte de 2017 CRUZ_CARGO_646 ',6,NULL,'project',1,'',0,0),(18,'2019-08-22 19:28:19',1,'created','task','Solicitud de Tracking - CRUZ_CARGO_646',7,NULL,'project',1,'',0,0),(19,'2019-08-22 19:31:11',1,'updated','task','reporte de 2017 CRUZ_CARGO_646 ',6,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:6:\"100005\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(20,'2019-08-22 19:31:13',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:6:\"200005\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"2\";}}','project',2,'',0,0),(21,'2019-08-22 19:31:27',1,'updated','task','reporte de 2017 CRUZ_CARGO_646 ',6,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:6:\"100005\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(22,'2019-08-22 19:31:29',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:6:\"200005\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(23,'2019-08-26 14:48:13',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10050000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(24,'2019-08-26 14:48:42',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(25,'2019-08-26 14:48:47',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10099500\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(26,'2019-08-26 16:42:56',1,'created','task','Mejoras de diseño de manual - Maritimo',8,NULL,'project',2,'',0,0),(27,'2019-08-26 16:44:07',1,'updated','task','Mejoras de diseño de manual - Maritimo',8,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',2,'',0,0),(28,'2019-08-26 16:44:16',1,'updated','task','Solicitud de Tracking - CRUZ_CARGO_646',7,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10200000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(29,'2019-08-28 09:59:35',1,'created','task','actualizacion de framework plataforma gspterrestre',9,NULL,'project',1,'',0,0),(30,'2019-08-28 09:59:55',1,'updated','task','Mejoras de diseño de manual - Maritimo',8,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:8:\"10025000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(31,'2019-08-28 10:55:02',1,'created','task','Mejora del manual terrestre',10,NULL,'project',2,'',0,0),(32,'2019-08-28 10:55:16',1,'updated','task','Mejora del manual terrestre',10,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9999000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(33,'2019-08-28 10:55:21',1,'updated','task','actualizacion de framework plataforma gspterrestre',9,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9998500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(34,'2019-08-28 15:16:49',1,'created','task','Alerta de somnolencia',11,NULL,'project',2,'',0,0),(35,'2019-09-04 17:21:14',1,'created','task','agregar alerta de no transmision',12,NULL,'project',1,'',0,0),(36,'2019-09-04 17:21:33',1,'updated','task','agregar la opcion de poner  el maximo de velocidad por vehiculo',3,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(37,'2019-09-04 17:21:38',1,'updated','task','agregar alerta de no transmision',12,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10050000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(38,'2019-09-16 12:30:40',1,'created','task','revision de reporte anglo american',13,NULL,'project',1,'',0,0),(39,'2019-09-16 12:30:57',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9999000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(40,'2019-09-16 12:31:04',1,'updated','task','agregar alerta de no transmision',12,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10050000\";s:2:\"to\";s:7:\"9999250\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(41,'2019-09-23 10:48:46',1,'created','task','Actualización de aplicación de alertas terrestre',14,NULL,'project',1,'',0,0),(42,'2019-09-23 10:58:23',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9998500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(43,'2019-09-23 10:58:34',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999500\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(44,'2019-09-23 10:58:38',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10050000\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(45,'2019-09-23 10:58:42',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:8:\"10200000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(46,'2019-09-23 11:09:27',1,'created','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,NULL,'project',1,'',0,0),(47,'2019-09-23 11:18:04',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9999500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(48,'2019-09-23 11:34:45',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-09-23\";}}','project',1,'',0,0),(49,'2019-09-25 10:05:11',1,'created','task','quitar alertas de velocidad en aplicativo',16,NULL,'project',1,'',0,0),(50,'2019-09-25 10:21:02',1,'created','task_comment','lo que se realizara es enviar un correo a cada  cliente con un reporte de exesos de velocidad panico de un dia  anterior',2,NULL,'project',1,'task',16,0),(51,'2019-09-25 12:31:17',1,'created','task','reporte de las unidades 7358 y 7366',17,NULL,'project',1,'',0,0),(52,'2019-10-07 11:55:48',1,'updated','task','agregar la opcion de poner  el maximo de velocidad por vehiculo',3,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:9:\"4999258.5\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(53,'2019-10-07 11:55:56',1,'updated','task','revision de reporte anglo american',13,'a:1:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}}','project',1,'',0,0),(54,'2019-10-07 11:55:58',1,'updated','task','revision de reporte anglo american',13,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9998750\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(55,'2019-10-07 11:56:05',1,'updated','task','Alerta de somnolencia',11,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"-483\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(56,'2019-10-07 11:56:09',1,'updated','task','quitar alertas de velocidad en aplicativo',16,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(57,'2019-10-07 11:56:11',1,'updated','task','quitar alertas de velocidad en aplicativo',16,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:4:\"-983\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(58,'2019-10-07 11:56:53',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(59,'2019-10-07 11:56:55',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(60,'2019-10-07 11:57:23',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(61,'2019-10-07 11:57:25',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(62,'2019-10-07 11:57:34',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(63,'2019-10-07 11:57:36',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(64,'2019-10-07 11:57:39',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(65,'2019-10-07 11:57:59',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(66,'2019-10-07 11:58:00',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',2,'',0,0),(67,'2019-10-07 11:58:01',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(68,'2019-10-23 17:16:10',1,'created','task','Reunion 4pm',18,NULL,'project',2,'',0,0),(69,'2019-10-25 14:30:12',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999500\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(70,'2019-10-25 14:30:18',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:5:\"-1483\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(71,'2019-10-25 14:30:25',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:5:\"-1983\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(72,'2019-10-28 16:02:07',1,'created','task','agregar tipos de alertas en terreste',19,NULL,'project',1,'',0,0),(73,'2019-10-30 11:58:07',1,'created','task','problema de sistema de alertas',20,NULL,'project',2,'',0,0),(74,'2019-11-04 09:50:47',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:5:\"-1983\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(75,'2019-11-04 09:50:48',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:5:\"-1483\";s:2:\"to\";s:7:\"9999500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(76,'2019-11-04 09:50:50',1,'updated','task','quitar alertas de velocidad en aplicativo',16,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:4:\"-983\";s:2:\"to\";s:7:\"9999000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(77,'2019-11-04 09:50:51',1,'updated','task','reporte de las unidades 7358 y 7366',17,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9998500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(78,'2019-11-04 09:50:52',1,'updated','task','Reunion 4pm',18,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9998000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(79,'2019-11-04 09:50:53',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9998500\";s:2:\"to\";s:7:\"9997500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(80,'2019-11-04 09:50:53',1,'updated','task','revision de reporte anglo american',13,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9998750\";s:2:\"to\";s:7:\"9997000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(81,'2019-11-04 09:50:54',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999000\";s:2:\"to\";s:7:\"9996500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(82,'2019-11-04 09:50:55',1,'updated','task','agregar alerta de no transmision',12,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999250\";s:2:\"to\";s:7:\"9996000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(83,'2019-11-04 09:50:56',1,'updated','task','reporte de 2017 CRUZ_CARGO_646 ',6,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9995500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(84,'2019-11-04 09:50:57',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:7:\"9995000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(85,'2019-11-04 09:50:57',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10200000\";s:2:\"to\";s:7:\"9994500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(86,'2019-11-04 10:12:52',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9994500\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(87,'2019-11-04 10:12:55',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9995000\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(88,'2019-11-04 10:12:57',1,'updated','task','reporte de 2017 CRUZ_CARGO_646 ',6,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9995500\";s:2:\"to\";s:8:\"10200000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(89,'2019-11-04 10:12:58',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9996500\";s:2:\"to\";s:8:\"10300000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(90,'2019-11-04 10:12:58',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:1:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9997500\";s:2:\"to\";s:7:\"9998250\";}}','project',1,'',0,0),(91,'2019-11-04 10:13:00',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9998250\";s:2:\"to\";s:8:\"10400000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(92,'2019-11-04 10:13:01',1,'updated','task','quitar alertas de velocidad en aplicativo',16,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999000\";s:2:\"to\";s:8:\"10500000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(93,'2019-11-04 10:13:02',1,'updated','task','reporte de las unidades 7358 y 7366',17,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9998500\";s:2:\"to\";s:8:\"10600000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(94,'2019-11-04 10:13:06',1,'updated','task','agregar alerta de no transmision',12,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9996000\";s:2:\"to\";s:8:\"10050000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(95,'2019-11-04 10:13:08',1,'updated','task','Reunion 4pm',18,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9998000\";s:2:\"to\";s:8:\"10025000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(96,'2019-11-04 10:13:09',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9999500\";s:2:\"to\";s:8:\"10037500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(97,'2019-11-04 10:13:11',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:8:\"10031250\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(98,'2019-11-04 10:13:12',1,'updated','task','revision de reporte anglo american',13,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:7:\"9997000\";s:2:\"to\";s:8:\"10700000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(99,'2019-11-04 10:40:30',1,'updated','task','problema de sistema de alertas',20,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',2,'',0,0),(100,'2019-11-04 10:40:54',1,'updated','task','agregar tipos de alertas en terreste',19,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-11-01\";s:2:\"to\";s:10:\"2019-11-08\";}}','project',1,'',0,0),(101,'2019-11-04 10:44:15',1,'created','task','registros duplicados de terreste',21,NULL,'project',1,'',0,0),(102,'2019-11-04 10:45:09',1,'updated','task','registros duplicados de terreste',21,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(103,'2019-11-04 10:45:10',1,'updated','task','reunion con italo para ver tema de ipd',4,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9999500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(104,'2019-11-04 10:45:11',1,'updated','task','Reunion 4pm',18,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10025000\";s:2:\"to\";s:7:\"9999000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(105,'2019-11-04 10:45:12',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:1:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10031250\";s:2:\"to\";s:8:\"10800000\";}}','project',2,'',0,0),(106,'2019-11-04 10:45:14',1,'updated','task','se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',15,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10037500\";s:2:\"to\";s:7:\"9999250\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(107,'2019-11-04 10:45:15',1,'updated','task','creación de manuales de usuario para el sistema',5,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:7:\"9999125\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(108,'2019-11-04 10:45:16',1,'updated','task','agregar alerta de no transmision',12,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10050000\";s:2:\"to\";s:7:\"9998500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(109,'2019-11-04 10:45:17',1,'updated','task','reporte de 2017 CRUZ_CARGO_646 ',6,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10200000\";s:2:\"to\";s:7:\"9998000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(110,'2019-11-04 10:45:18',1,'updated','task','clonar y condicionar sistema de alerta de marino a terrestre',1,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10300000\";s:2:\"to\";s:7:\"9997500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(111,'2019-11-04 10:45:19',1,'updated','task','Actualización de aplicación de alertas terrestre',14,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10400000\";s:2:\"to\";s:7:\"9997000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(112,'2019-11-04 10:45:20',1,'updated','task','quitar alertas de velocidad en aplicativo',16,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10500000\";s:2:\"to\";s:7:\"9996500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(113,'2019-11-04 10:45:23',1,'updated','task','reporte de las unidades 7358 y 7366',17,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10600000\";s:2:\"to\";s:7:\"9996000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(114,'2019-11-04 10:45:23',1,'updated','task','revision de reporte anglo american',13,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10700000\";s:2:\"to\";s:7:\"9995500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(115,'2019-11-04 10:45:24',1,'updated','task','Apoyo para  el manual del sistema maritimo y terrestre',2,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10800000\";s:2:\"to\";s:7:\"9995000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(116,'2019-11-04 10:45:35',1,'updated','task','registros duplicados de terreste',21,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"4\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(117,'2019-11-04 11:01:09',1,'updated','task','problema de sistema de alertas',20,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(118,'2019-11-04 11:02:11',1,'created','task','agregar sistema de alertas por sms',22,NULL,'project',1,'',0,0),(119,'2019-11-04 11:53:18',1,'created','task','Creation de prototypo de la nueva  plataforma de telemetria linkan',23,NULL,'project',2,'',0,0),(120,'2019-11-04 12:23:59',1,'updated','task','agregar tipos de alertas en terreste',19,'a:1:{s:11:\"description\";a:2:{s:4:\"from\";s:84:\"se debe  agregar tipo de alerta para separa alerats de panico y alerta sd  velocidad\";s:2:\"to\";s:279:\"(este  proceso implica realizar varios cambios en los módulos, cambios  en al base de datos, servicios en el servidor amazon)  tiempo desarrollo 2 semanas , con la base de datos y  servidor amazon que realizaba italo tejada lo realizare este pudiese tomar 2 o tres  días  mas.\n\";}}','project',1,'',0,0),(121,'2019-11-08 12:49:27',1,'updated','task','agregar tipos de alertas en terreste',19,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-11-08\";s:2:\"to\";s:10:\"2019-11-12\";}}','project',1,'',0,0),(122,'2019-11-08 12:51:13',1,'created','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,NULL,'project',1,'',0,0),(123,'2019-11-08 12:51:37',1,'updated','task','agregar tipos de alertas en terreste',19,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(124,'2019-11-11 09:57:58',1,'updated','task','agregar tipos de alertas en terreste',19,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(125,'2019-11-11 09:58:37',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2019-11-08\";s:2:\"to\";N;}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-11-11\";s:2:\"to\";N;}}','project',1,'',0,0),(126,'2019-11-11 10:05:04',1,'updated','task','Creation de prototypo de la nueva  plataforma de telemetria linkan',23,'a:1:{s:11:\"assigned_to\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(127,'2019-11-18 10:35:56',1,'updated','task','agregar tipos de alertas en terreste',19,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"-480\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(128,'2019-11-18 11:00:28',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(129,'2019-11-18 11:02:51',1,'updated','task','agregar sistema de alertas por sms',22,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(130,'2019-11-18 11:03:21',1,'updated','task','agregar sistema de alertas por sms',22,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-11-15\";}s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-11-21\";}}','project',1,'',0,0),(131,'2019-11-21 17:00:08',1,'created','task','problema al querer agregar un usuario en a plataforma',25,NULL,'project',1,'',0,0),(132,'2019-11-21 17:34:42',1,'updated','task','problema al querer agregar un usuario en a plataforma',25,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(133,'2019-11-27 10:53:19',1,'updated','task','agregar sistema de alertas por sms',22,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"-980\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(134,'2019-11-27 10:53:24',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(135,'2019-12-06 11:22:27',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-11-25\";}s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-12-05\";}}','project',1,'',0,0),(136,'2019-12-06 11:25:02',1,'updated','task','registros duplicados de terreste',21,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:7:\"9994500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(137,'2019-12-06 11:25:18',1,'updated','task','problema de sistema de alertas',20,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9994000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(138,'2019-12-06 11:28:57',1,'created','task','Actualizar venta de ultimos reportes',26,NULL,'project',1,'',0,0),(139,'2019-12-06 11:29:10',1,'updated','task','Actualizar venta de ultimos reportes',26,'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:36:\"Actualizar venta de ultimos reportes\";s:2:\"to\";s:38:\"Actualizar ventana de ultimos reportes\";}}','project',1,'',0,0),(140,'2019-12-06 11:29:54',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:5:\"-1480\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(141,'2019-12-06 11:30:19',1,'updated','task','Actualizar ventana de ultimos reportes',26,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(142,'2019-12-06 11:34:25',1,'updated','task','Actualizar ventana de ultimos reportes',26,'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2019-12-06\";s:2:\"to\";s:10:\"2019-12-05\";}}','project',1,'',0,0),(143,'2019-12-06 11:37:36',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2019-11-25\";s:2:\"to\";s:10:\"2019-11-28\";}}','project',1,'',0,0),(144,'2019-12-06 11:37:55',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2019-11-28\";s:2:\"to\";s:10:\"2019-11-26\";}}','project',1,'',0,0),(145,'2019-12-06 12:26:54',1,'created','task','Implementar Opcion de alertas sms para Plataforma terreste',27,NULL,'project',2,'',0,0),(146,'2019-12-06 12:31:36',1,'created','task','Implementar alertas panico por sms en plataforma marino',28,NULL,'project',4,'',0,0),(147,'2019-12-06 12:32:55',1,'updated','task','Actualizar ventana de ultimos reportes',26,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(148,'2019-12-06 12:33:26',1,'updated','task','Actualizar ventana de ultimos reportes',26,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2019-12-05\";s:2:\"to\";N;}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-12-13\";s:2:\"to\";N;}}','project',1,'',0,0),(149,'2019-12-12 11:39:43',1,'created','task','revision de CONCYTEC ',29,NULL,'project',2,'',0,0),(150,'2019-12-12 11:40:08',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',4,'',0,0),(151,'2019-12-13 16:19:20',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:4:\"-471\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',4,'',0,0),(152,'2019-12-13 16:24:50',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-12-16\";s:2:\"to\";s:10:\"2019-12-18\";}}','project',4,'',0,0),(153,'2019-12-19 10:54:54',1,'created','task','En la unidad cruz_cargo_1006  SOS observacion',30,NULL,'project',1,'',0,0),(154,'2019-12-19 13:07:36',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2019-12-18\";s:2:\"to\";s:10:\"2019-12-19\";}}','project',4,'',0,0),(155,'2019-12-19 13:08:26',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:4:\"-471\";s:2:\"to\";s:5:\"-1980\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',4,'',0,0),(156,'2019-12-19 13:13:21',1,'created','task','Actualizacion de aplicacion de monitoreo con vista sms ',31,NULL,'project',4,'',0,0),(157,'2019-12-19 13:13:48',1,'updated','task','En la unidad cruz_cargo_1006  SOS observacion',30,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(158,'2019-12-19 13:13:49',1,'updated','task','En la unidad cruz_cargo_1006  SOS observacion',30,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(159,'2019-12-19 13:14:49',1,'updated','task','Actualizacion de aplicacion de monitoreo con vista sms ',31,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:6:\"100029\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',4,'',0,0),(160,'2019-12-19 13:16:29',1,'updated','task','Actualizacion de aplicacion de monitoreo con vista sms ',31,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-12-19\";}s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2019-12-25\";}}','project',4,'',0,0),(161,'2020-01-23 16:32:02',1,'updated','task','revision de CONCYTEC ',29,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"-470\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"1\";}}','project',2,'',0,0),(162,'2020-01-23 16:32:09',1,'updated','task','Actualizacion de aplicacion de monitoreo con vista sms ',31,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:6:\"100029\";s:2:\"to\";s:5:\"-2480\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',4,'',0,0),(163,'2020-01-23 16:32:14',1,'updated','task','En la unidad cruz_cargo_1006  SOS observacion',30,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9993500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(164,'2020-01-23 16:32:26',1,'updated','task','revision de CONCYTEC ',29,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:4:\"-470\";s:2:\"to\";s:7:\"9993000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(165,'2020-01-23 16:34:40',1,'created','task','Prototipo de aplicacion Telemetria',32,NULL,'project',5,'',0,0),(166,'2020-01-23 16:34:47',1,'updated','task','Prototipo de aplicacion Telemetria',32,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',5,'',0,0),(167,'2020-01-23 16:35:29',1,'created','task','Creacion de Modulo de  mantenimiento',33,NULL,'project',1,'',0,0),(168,'2020-01-23 16:36:12',1,'updated','task','Actualizar ventana de ultimos reportes',26,'a:1:{s:6:\"labels\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:10:\"postergado\";}}','project',1,'',0,0),(169,'2020-01-23 16:37:46',1,'updated','task','Actualizacion de aplicacion de monitoreo con vista sms ',31,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:5:\"-2480\";s:2:\"to\";s:7:\"9992500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',4,'',0,0),(170,'2020-01-23 16:37:47',1,'updated','task','Implementar alertas panico por sms en plataforma marino',28,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:5:\"-1980\";s:2:\"to\";s:7:\"9992000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',4,'',0,0),(171,'2020-01-23 16:37:48',1,'updated','task','agregar opcion para  silenciar alertas en aplicacion centro control',24,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:5:\"-1480\";s:2:\"to\";s:7:\"9991500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(172,'2020-01-23 16:37:49',1,'updated','task','agregar sistema de alertas por sms',22,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:4:\"-980\";s:2:\"to\";s:7:\"9991000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(173,'2020-01-23 16:37:50',1,'updated','task','agregar tipos de alertas en terreste',19,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:4:\"-480\";s:2:\"to\";s:7:\"9990500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(174,'2020-01-23 16:37:51',1,'updated','task','problema al querer agregar un usuario en a plataforma',25,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9990000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"4\";}}','project',1,'',0,0),(175,'2020-01-23 16:38:46',1,'created','task','Ayuda a restablecer Correo zimbra',34,NULL,'project',1,'',0,0),(176,'2020-01-23 16:51:09',1,'updated','task','Creacion de Modulo de  mantenimiento',33,'a:1:{s:11:\"description\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:50:\"modulo de  mantenimiento\n\n-- revision tecnica\n-- \n\";}}','project',1,'',0,0),(177,'2020-01-29 11:12:46',1,'created','task','Reportes de alertas personalizadas Anglo american',35,NULL,'project',1,'',0,0),(178,'2020-01-30 10:45:18',1,'created','task_comment','tener en cuenta dev:\n//-------------------------------------------------\n $hourMin=$date_report.\" 05:30:00\";\n $hourMax=$date_report.\" 18:30:00\";\n//-------------------------------------------------\n\n   if ($obj->fecha &lt; $hourMin or $obj->fecha > $hourMax) {\n                        $temp_driving_off_schedule[]=$obj->fecha;\n                    }\n',4,NULL,'project',1,'task',35,0),(179,'2020-01-31 10:47:02',1,'updated','task','Reportes de alertas personalizadas Anglo american',35,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10100000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}}','project',1,'',0,0),(180,'2020-01-31 17:57:25',1,'created','task','hacer un listado en texto de los servicios que tenemos y hemos realizado en las plataforma de lo que tenemos y lo que nos  falta',36,NULL,'project',2,'',0,0),(181,'2020-01-31 17:57:35',1,'updated','task','Prototipo de aplicacion Telemetria',32,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10000000\";s:2:\"to\";s:4:\"-466\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',5,'',0,0),(182,'2020-02-04 16:58:31',1,'created','task','Añadir la opcion de enviar reporte de ubicacion por correo.solicitado por contratacion CORPAC',37,NULL,'project',1,'',0,0),(183,'2020-02-11 15:37:18',1,'created','task','reporte para ver unidades y los telefonos asignados  a ellos',38,NULL,'project',1,'',0,0),(184,'2020-02-18 12:38:07',1,'created','task','Crear super usuario Admin',39,NULL,'project',1,'',0,0),(185,'2020-02-18 15:44:45',1,'updated','','',3,'a:1:{s:18:\"whapssap[:1,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:11:\"995 738 573\";}}','',0,NULL,NULL,0),(186,'2020-02-25 10:18:46',1,'created','task','Modificar Formulario para crear TRAMARSA',40,NULL,'project',1,'',0,0),(187,'2020-02-25 14:10:36',1,'created','task','Añadir Campos a la  tabla data_canbus_hoy',41,NULL,'project',1,'',0,0),(188,'2020-02-26 10:05:08',1,'updated','task','Modificar Formulario para crear TRAMARSA',40,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"-966\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(189,'2020-02-26 10:05:24',1,'updated','task','Modificar Formulario para crear TRAMARSA',40,'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2020-02-25\";}s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2020-02-25\";}}','project',1,'',0,0),(190,'2020-02-26 10:05:32',1,'updated','task','Reportes de alertas personalizadas Anglo american',35,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:8:\"10100000\";s:2:\"to\";s:5:\"-1466\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(191,'2020-02-26 10:05:47',1,'updated','task','Reportes de alertas personalizadas Anglo american',35,'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"2020-02-26\";}}','project',1,'',0,0),(192,'2020-02-26 10:09:06',1,'created','task','Implementacion de Geocerca',42,NULL,'project',1,'',0,0),(193,'2020-02-28 17:32:11',1,'created','task','Implementacion de Gestion de Rutas',43,NULL,'project',1,'',0,0),(194,'2020-02-28 17:32:45',1,'updated','task','hacer un listado en texto de los servicios que tenemos y hemos realizado en las plataforma de lo que tenemos y lo que nos  falta',36,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9990250\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"4\";}}','project',2,'',0,0),(195,'2020-02-28 17:32:58',1,'updated','task','reporte para ver unidades y los telefonos asignados  a ellos',38,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:5:\"-1216\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(196,'2020-03-12 11:23:06',1,'created','task','Modificar plataforma satsensores',44,NULL,'project',2,'',0,0),(197,'2020-03-12 11:24:27',1,'created','task','arreglar error de plataforma factugsp',45,NULL,'project',2,'',0,0),(198,'2020-04-19 15:15:05',1,'created','task','Realizar un backup de la Base de datos Aws',46,NULL,'project',2,'',0,0),(199,'2020-04-19 15:17:57',1,'created','task_comment','- lunes  information para una buena importacion de bases de datos en : https://www.postgresql.org/docs/',6,NULL,'project',2,'task',46,0),(200,'2020-04-19 15:18:36',1,'created','task_comment','- martes realizando pruebas locales para hacer backups',7,NULL,'project',2,'task',46,0),(201,'2020-04-19 15:19:47',1,'created','task_comment','- miercoles revisando y analizando esquemas y tablas de la base de datos marino y terrestre',8,NULL,'project',2,'task',46,0),(202,'2020-04-19 15:21:01',1,'created','task_comment','-jueves realizando un backup de tablas menos pesadas',9,NULL,'project',2,'task',46,0),(203,'2020-04-19 15:22:06',1,'created','task_comment','- jueves realizando backup de esquemas y tablas marino',10,NULL,'project',2,'task',46,0),(204,'2020-04-19 15:23:24',1,'created','task_comment','- viernes se importaron la inforacion pero da errrores revisando aplicacion y base de datos marino',11,NULL,'project',2,'task',46,0),(205,'2020-04-20 16:00:54',1,'created','task_comment','---LUNES 20 DE ABRIL\nse comenzó a realizar el backup de la base de datos marino desde el día 7 del presente mes\nen esos días se realizo.\n- información para una buena importación de bases de datos en : https://www.postgresql.org/docs/\n- realizando pruebas locales para hacer backups\n- revisando y analizando esquemas y tablas de la base de datos marino\n- realizando un backup de tablas menos pesadas\n- realizando backup de esquemas y tablas marino\n- importaron la información, pero da errores revisando aplicación y base de datos marino\n- corrección de errores de importación de base de datos\n\ndía de hoy 20 de abril\nbackup de toda la base de datos y corrección de errores en la aplicación de https://gspmarino.geosupply.com.pe/\n\nmañana 21 de abril\nse comenzará a realizar pruebas con las tablas exportadas\n',12,NULL,'project',2,'task',46,0),(206,'2020-04-21 17:19:59',1,'updated','task','Realizar un backup de la Base de datos Aws',46,'a:1:{s:11:\"assigned_to\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"1\";}}','project',2,'',0,0),(207,'2020-04-21 17:20:44',1,'created','task_comment','---MARTES 21 DE ABRIL\n\n---- día de hoy 21 de abril\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :datos\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :dessarrollo\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :tiger\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :tiger_data\nschema \n\n------mañana 22 de abril\nbackup de tablas livianas de base de datos terrestre esquema :datos',13,NULL,'project',2,'task',46,0),(208,'2020-06-27 23:45:30',1,'updated','','',6,'a:1:{s:18:\"facebook[:3,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:38:\"https://www.facebook.com/perci.acero.3\";}}','',0,NULL,NULL,0),(209,'2020-06-28 00:00:50',1,'created','project_file','_file5ef824021aabd-E9pDN5FdY6.jpg',1,NULL,'project',8,'',0,0),(210,'2020-06-29 19:42:49',1,'updated','','',6,'a:1:{s:18:\"whapssap[:1,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:9:\"990002905\";}}','',0,NULL,NULL,0),(211,'2020-06-29 19:45:53',1,'updated','','',7,'a:1:{s:18:\"facebook[:3,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:44:\"https://www.facebook.com/inversiones.letich/\";}}','',0,NULL,NULL,0),(212,'2020-06-29 20:09:55',1,'updated','','',7,'a:1:{s:18:\"whapssap[:1,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:9:\"963827207\";}}','',0,NULL,NULL,0),(213,'2020-07-22 11:03:00',1,'created','task','crear diagrma para  willian geocerca',47,NULL,'project',1,'',0,0),(214,'2020-07-22 16:04:24',1,'updated','task','Implementacion de Gestion de Rutas',43,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',1,'',0,0),(215,'2020-07-22 16:04:28',1,'updated','task','Implementacion de Gestion de Rutas',43,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"3\";s:2:\"to\";s:1:\"1\";}}','project',1,'',0,0),(216,'2020-07-22 16:05:21',1,'deleted','task','Implementacion de Gestion de Rutas',43,NULL,'project',1,NULL,NULL,0),(217,'2020-07-22 16:05:25',1,'deleted','task','Implementacion de Geocerca',42,NULL,'project',1,NULL,NULL,0),(218,'2020-07-22 16:06:41',1,'deleted','task','Actualizar ventana de ultimos reportes',26,NULL,'project',1,NULL,NULL,0),(219,'2020-07-22 16:06:48',1,'deleted','task','En la unidad cruz_cargo_1006  SOS observacion',30,NULL,'project',1,NULL,NULL,0),(220,'2020-07-22 16:06:55',1,'deleted','task','Añadir la opcion de enviar reporte de ubicacion por correo.solicitado por contratacion CORPAC',37,NULL,'project',1,NULL,NULL,0),(221,'2020-07-22 16:06:59',1,'deleted','task','Creacion de Modulo de  mantenimiento',33,NULL,'project',1,NULL,NULL,0),(222,'2020-07-22 17:57:50',1,'created','task','generar esquema de geocerca',48,NULL,'project',1,'',0,0),(223,'2020-07-24 11:13:36',1,'created','task','restaurar backup de noviembre del 2017',49,NULL,'project',1,'',0,0),(224,'2020-07-24 11:14:35',1,'created','task','Cordinacion de essalud',50,NULL,'project',1,'',0,0),(225,'2020-07-24 18:58:12',1,'updated','task','Realizar un backup de la Base de datos Aws',46,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(226,'2020-07-24 18:58:17',1,'updated','task','Modificar plataforma satsensores',44,'a:1:{s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',2,'',0,0),(227,'2020-07-24 18:59:33',1,'created','task','Arreglar reportes de canbus sale error al sacar reporte por fechas',51,NULL,'project',1,'',0,0),(228,'2020-07-27 15:51:13',1,'created','task','Arreglando errores de Canbus',52,NULL,'project',1,'',0,0),(229,'2020-07-30 10:56:10',1,'created','task','Resolver problema que un usuario normal no visualiza canbus',53,NULL,'project',1,'',0,0),(230,'2021-10-06 15:22:08',1,'created','task','Crear Repositorios',54,NULL,'project',16,'',0,0),(231,'2021-10-07 17:14:30',1,'created','task','Subir Repositorios',55,NULL,'project',16,'',0,0),(232,'2021-10-07 17:14:35',1,'updated','task','Subir Repositorios',55,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:8:\"10000000\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"3\";}}','project',16,'',0,0),(233,'2021-10-07 17:14:37',1,'updated','task','Crear Repositorios',54,'a:2:{s:4:\"sort\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:7:\"9999500\";}s:9:\"status_id\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"3\";}}','project',16,'',0,0),(234,'2022-09-08 15:07:11',1,'updated','','',13,'a:1:{s:18:\"whapssap[:1,text:]\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:15:\"+51 949 150 550\";}}','',0,NULL,NULL,0);
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `files` text COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` (`id`, `title`, `description`, `start_date`, `end_date`, `created_by`, `share_with`, `created_at`, `files`, `read_by`, `deleted`) VALUES (1,'ads solu','<p>Ads creacion de soluciones system peru</p>','2019-08-20','2019-08-31',1,'all_members,all_clients','2019-08-20 20:56:13','a:0:{}','0,2,1',0);
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('incomplete','pending','approved','rejected','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` (`id`, `status`, `user_id`, `in_time`, `out_time`, `checked_by`, `note`, `checked_at`, `reject_reason`, `deleted`) VALUES (1,'pending',1,'2019-08-20 14:00:00','2019-08-20 23:00:00',NULL,'',NULL,NULL,0);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_items`
--

DROP TABLE IF EXISTS `checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `is_checked` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_items`
--

LOCK TABLES `checklist_items` WRITE;
/*!40000 ALTER TABLE `checklist_items` DISABLE KEYS */;
INSERT INTO `checklist_items` (`id`, `title`, `is_checked`, `task_id`, `sort`, `deleted`) VALUES (1,'creacion de tutorial de sistema amritimo ',0,2,0,1),(2,'creacion de tutorial de sistema terrestre',0,2,0,0),(3,'creacion de tutorial de sistema maritimo ',0,2,0,0),(4,'agregar opcion de poner velocidad a un mobil en el sistema',0,1,0,0),(5,'creación de tutorial de sistema terrestre',1,5,0,0),(6,'creación de tutorial de sistema maritimo',0,5,0,0),(7,'implementacion de alerta sms - al cliente',0,28,0,1),(8,'implementacion y visualizacion de la vista del sistema',0,28,0,1);
/*!40000 ALTER TABLE `checklist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_groups`
--

DROP TABLE IF EXISTS `client_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_groups`
--

LOCK TABLES `client_groups` WRITE;
/*!40000 ALTER TABLE `client_groups` DISABLE KEYS */;
INSERT INTO `client_groups` (`id`, `title`, `deleted`) VALUES (1,'Clientes Vip',0),(2,'Clientes empleo',0),(3,'Clientes por Servicio',0),(4,'Clientes Web',0),(5,'Reparación de Computadoras',0),(6,'Clases de Computación',0);
/*!40000 ALTER TABLE `client_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `group_ids` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `vat_number` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `company_name`, `address`, `city`, `state`, `zip`, `country`, `created_date`, `website`, `phone`, `currency_symbol`, `starred_by`, `group_ids`, `deleted`, `vat_number`, `currency`, `disable_online_payment`) VALUES (1,'Geo Supply','av camninos del inca','LIMA','Lima','18','Perú','2019-08-14','','989892778','','','',0,'','',0),(2,'Corporación pacifico','su  direccion','Lima','Lima','18','Perú','0000-00-00','','995738573','','','4',1,'','',0),(3,'Corporación pacifico','Dirección Legal: Cal. 18 de Enero Nro. 159\nUrbanización: Villa Hiper (a Espalda de Clínica Ricardo Palma)','Lima','Lima','18','Peru','2020-02-18','https://corporacionpacifico.com.pe/','995 738 573','S/.','','',0,'','PEN',0),(4,'Pc byte','Av Inca Garcilaso de la Vega 1251, Tienda 243- Cercado de Lima 15001, Perú','Lima','Lima','36','Perú','2020-06-27','https://pcbyte.com.pe/','998 197 574','S/.','','3,4',0,'','PEN',0),(5,'Vacjet','su  direccion','Lima','Lima','18','Perú','2020-06-27','https://vacjet.pe','989226076','','','',0,'','',0),(6,'Inversiones Letich','jr.apurimac 274 oficina 101','Lima','Lima','18','Perú','2020-06-29','https://inversionesletich.com/','4278591','','','4',0,'','',0),(7,'Lissa Corp','su  direccion','Lima','Lima','18','Perú','2020-06-29','http://lissacorp.pe/','963827207','','','4',0,'','',0),(8,'Systec Edgar','','','','','','2020-12-03','','965 672 666','','','',0,'','',0),(9,'Shepard Cliente Web','','','','','','2020-12-03','','','','','',0,'','',0),(10,'Heavy Duty','','','','','','2021-01-12','https://hdmaquinarias.com/','','','','',0,'','',0),(11,'L D Mineria','','','','','','2021-01-21','','','','','',0,'','',0),(12,'Camicv','','','','','','2021-02-15','www.camicv.com','','','','',0,'','',0),(13,'Gino Cabina Internet','https://maps.google.com/maps?q=-12.146321296691895,-76.98493957519531&z=17&hl=es','','Peru','','','2022-01-21','','','','','3',0,'','',0),(14,'perustore21','','Lima','Lima','15096','Perú','2022-05-18','perustore21.com','+51 979 635 861','','','',0,'','',0);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_to_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
INSERT INTO `custom_field_values` (`id`, `related_to_type`, `related_to_id`, `custom_field_id`, `value`, `deleted`) VALUES (1,'clients',3,1,'995 738 573',0),(2,'contacts',6,3,'https://www.facebook.com/perci.acero.3',0),(3,'clients',6,1,'990002905',0),(4,'contacts',7,3,'https://www.facebook.com/inversiones.letich/',0),(5,'clients',7,1,'963827207',0),(6,'clients',13,1,'+51 949 150 550',0);
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_table` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_estimate` tinyint(1) NOT NULL DEFAULT 0,
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT 0,
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` (`id`, `title`, `placeholder`, `options`, `field_type`, `related_to`, `sort`, `required`, `show_in_table`, `show_in_invoice`, `show_in_estimate`, `visible_to_admins_only`, `hide_from_clients`, `deleted`) VALUES (1,'whapssap','su numero whapssap','','text','clients',1,0,0,0,0,0,0,0),(2,'Otros','otros','numeor1,numero2','select','projects',1,0,0,0,0,0,0,1),(3,'facebook','ingresa la url del facbook','','text','contacts',1,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_widgets`
--

DROP TABLE IF EXISTS `custom_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT 0,
  `show_border` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_widgets`
--

LOCK TABLES `custom_widgets` WRITE;
/*!40000 ALTER TABLE `custom_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards`
--

DROP TABLE IF EXISTS `dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards`
--

LOCK TABLES `dashboards` WRITE;
/*!40000 ALTER TABLE `dashboards` DISABLE KEYS */;
INSERT INTO `dashboards` (`id`, `user_id`, `title`, `data`, `color`, `sort`, `deleted`) VALUES (1,1,'PRUEBA','a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"columns\";a:1:{i:0;a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"widget\";s:13:\"open_projects\";s:5:\"title\";s:13:\"Open Projects\";}}}s:5:\"ratio\";s:2:\"12\";}}','#37b4e1',0,0);
/*!40000 ALTER TABLE `dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES (1,'login_info','Login details','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Detalles</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hola {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>se ah creado una cuenta para usted</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> utilice la siguiente informacion para ingresar a su tablero:</p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">www.solucionessystem.com</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>',0),(2,'reset_password','Reset password','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Cambio Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hola {ACCOUNT_HOLDER_NAME},<br><br>se ah creado una solicitud de restablecimiento de su cuenta</p>\n                    <p style=\"font-size: 14px;\"> para iniciar el proceso de restablecimiento ingrese al siguiente enlace.</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">si recibió este mensaje por erro es que alguien trato de ingresar a su cuenta por error</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">si no solicito la solicitud no realice nada déjelo así</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>',0),(3,'team_member_invitation','You are invited','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Cuenta de invitación</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hola,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> te han enviado una solicitud para unirte a un grupo</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Aceptar invitación</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">si no desea participar ignore este correo</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>',0),(4,'send_invoice','Envió de Factura','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Factura #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hola {CONTACT_FIRST_NAME},</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Gracias por solicitar nuestros servicios</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Su factura por el proyecto {PROJECT_TITLE} ah sido generado y se adjunta aqui.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Ver Factura</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">El saldo pendiente de la factura&nbsp; es {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Pague la factura dentro de {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>',0),(5,'signature','Firma','Powered By: <a href=\"http://fairsketch.com/\" target=\"_blank\">fairsketch </a>','Realizado por: <a href=\"http://solucionessystem.com\" target=\"_blank\">solucionessystem.com</a>',0),(6,'client_contact_invitation','You are invited','<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Cuenta de invitación</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hola,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> te han enviado una invitación al portal de un cliente.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Aceptar Invitacion</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">si no desea aceptar ignore la invitación</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>',0),(7,'ticket_created','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Abierto</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Ver Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Saludos,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>',0),(8,'ticket_commented','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Respuesta</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Ver Ticket</a></span></p></div></div></div>',0),(9,'ticket_closed','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">El Ticket #{TICKET_ID} a sido cerrado por&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Ver Ticket</a></span></p>   </div>  </div> </div>',0),(10,'ticket_reopened','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">El Ticket #{TICKET_ID} a sido reabierto por&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Ver Ticket</a></span></p>  </div> </div></div>',0),(11,'general_notification','{EVENT_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>','',0),(12,'invoice_payment_confirmation','Pago Revivido','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\r\n                                        <tbody><tr>\r\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\n <tbody><tr>\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n <tbody><tr>\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\n                                        <tbody><tr>\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                        <tbody>\n                                                            <tr>\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\n                                                                        <tbody><tr>\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Confirmación de pago</h2>\n                                                                                </td>\n                                                                            </tr>\n                                                                        </tbody>\n                                                                    </table>\n                                                                </td>\n                                                            </tr>\n                                                        </tbody>\n                                                    </table>\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                        <tbody>\n                                                            <tr>\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\n                                                                        <tbody><tr>\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\n                                                                                    Hola,<br>\n                                                                                    Hemos recibido su pago {PAYMENT_AMOUNT} de {INVOICE_ID} <br>\n                                                                                    Gracias por su cooperación empresarial.\n                                                                                </td>\n                                                                            </tr>\n                                                                            <tr>\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                                                        <tbody>\n                                                                                            <tr>\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                                                                        <tbody>\n                                                                                                            <tr>\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">Ver Factura</a>\n                                                                                                                </td>\n                                                                                                            </tr>\n                                                                                                        </tbody>\n                                                                                                    </table>\n                                                                                                </td>\n                                                                                            </tr>\n                                                                                        </tbody>\n                                                                                    </table>\n                                                                                </td>\n                                                                            </tr>\n                                                                            <tr>\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \n                                                                                    \n                                                                                </td>\n                                                                            </tr>\n                                                                            <tr>\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \n  {SIGNATURE}\n  </td>\n </tr>\n </tbody>\n  </table>\n  </td>\n  </tr>\n  </tbody>\n </table>\n  </td>\n </tr>\n  </tbody>\n  </table>\n  </td>\n </tr>\n </tbody>\n </table>\n </td>\n </tr>\n </tbody>\n  </table>',0),(13,'message_received','{SUBJECT}','<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','',0),(14,'invoice_due_reminder_before_due_date','Aviso de vencimiento de la factura','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Due Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that invoice {INVOICE_ID} is due on {DUE_DATE}. Please pay the invoice within due date.&nbsp;</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>If you have already submitted the payment, please ignore this email.</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Recordatorio de Factura</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hola,<br>Nos gustaría recordarle la factura {INVOICE_ID} se vence en {DUE_DATE}. Pague la factura&nbsp; dentro de la fecha de vencimiento.&nbsp;</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>Si ya envió el pago obvie este correo</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">Ver Factura</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>',0),(15,'invoice_overdue_reminder','Recordatorio de vencimiento de factura','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Overdue Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that you have an unpaid invoice {INVOICE_ID}. We kindly request you to pay the invoice as soon as possible.&nbsp;</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>If you have already submitted the payment, please ignore this email.</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Recordatorio de Factura vencida</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hola,<br>Nos gustaría recordarle que tiene una factura impagada {INVOICE_ID}. Recordamos pagar la factura lo antes posible</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>Si ya&nbsp; envió el pago obvie este&nbsp; correo electrónico.</p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">Ver factura</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>',0),(16,'recurring_invoice_creation_reminder','Recordatorio de creación de factura recurrente','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Invoice Cration Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello,<br>We would like to remind you that a recurring invoice will be created on {NEXT_RECURRING_DATE}.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">View Invoice</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Recordatorio de caja de Factura</h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hola,</p><p>Nos gustaria&nbsp; recordarlo que se creara una factura recurrente en<br>{NEXT_RECURRING_DATE}.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Ver Factura</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>',0);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_forms`
--

DROP TABLE IF EXISTS `estimate_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `enable_attachment` tinyint(4) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_forms`
--

LOCK TABLES `estimate_forms` WRITE;
/*!40000 ALTER TABLE `estimate_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimate_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_items`
--

DROP TABLE IF EXISTS `estimate_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_items`
--

LOCK TABLES `estimate_items` WRITE;
/*!40000 ALTER TABLE `estimate_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimate_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_requests`
--

DROP TABLE IF EXISTS `estimate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_requests`
--

LOCK TABLES `estimate_requests` WRITE;
/*!40000 ALTER TABLE `estimate_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT 0,
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimates`
--

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `labels` text COLLATE utf8_unicode_ci NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `recurring` int(1) NOT NULL DEFAULT 0,
  `repeat_every` int(11) NOT NULL DEFAULT 0,
  `repeat_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_cycles` int(11) NOT NULL DEFAULT 0,
  `last_start_date` date DEFAULT NULL,
  `recurring_dates` longtext COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_by` text COLLATE utf8_unicode_ci NOT NULL,
  `rejected_by` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `title`, `description`, `start_date`, `end_date`, `start_time`, `end_time`, `created_by`, `location`, `client_id`, `labels`, `share_with`, `deleted`, `color`, `recurring`, `repeat_every`, `repeat_type`, `no_of_cycles`, `last_start_date`, `recurring_dates`, `confirmed_by`, `rejected_by`) VALUES (1,'se genera prueba 1','esta prueba es para mi','2019-11-29','2019-11-29','07:05:00','15:00:00',1,' geo su pply',1,'','all',0,'#83c340',0,1,'months',0,'0000-00-00','','0','0');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
INSERT INTO `expense_categories` (`id`, `title`, `deleted`) VALUES (1,'Gastos varios',0),(2,'Gastos refrigerio',0),(3,'Pagos de hosting',0);
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` (`id`, `expense_date`, `category_id`, `description`, `amount`, `files`, `title`, `project_id`, `user_id`, `tax_id`, `tax_id2`, `deleted`) VALUES (1,'2020-02-18',2,'me  gaste por que no traje menu',12,'a:0:{}','comida menu',1,1,0,0,0);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_files`
--

DROP TABLE IF EXISTS `general_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_files`
--

LOCK TABLES `general_files` WRITE;
/*!40000 ALTER TABLE `general_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_articles`
--

DROP TABLE IF EXISTS `help_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `files` text COLLATE utf8_unicode_ci NOT NULL,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_articles`
--

LOCK TABLES `help_articles` WRITE;
/*!40000 ALTER TABLE `help_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_categories`
--

DROP TABLE IF EXISTS `help_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_categories`
--

LOCK TABLES `help_categories` WRITE;
/*!40000 ALTER TABLE `help_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
INSERT INTO `invoice_items` (`id`, `title`, `description`, `quantity`, `unit_type`, `rate`, `total`, `sort`, `invoice_id`, `deleted`) VALUES (1,'creacion de pagina web','se creo una  pagina web',1,'UNIDAD',1500,1500,0,1,0),(2,'servicio de mantenimeinto','se creo un servicio tecnico',1,'horas',70,70,0,1,0),(3,'servicio de mantenimeinto','se creo un servicio tecnico',1,'horas',110,110,0,2,0),(4,'Pago de Hosting y Dominio .pe (cat.01)','',1,'unidad',370,370,0,3,0),(5,'Diseño de tienda Virtual (cat.01)','creación de tienda Virtual',1,'unidad',500,500,0,3,0),(6,'Diseño Web Empresarial (cat.01)','',1,'unidad',500,500,0,4,0),(7,'Pago de Hosting y Dominio .pe (cat.01)','',1,'unidad',370,370,0,4,0),(8,'Dominio Temporal (S/.50)','pago por dominio - inversionesluper.com',1,'unidad',50,50,0,5,0),(9,'Pago de Hosting y Dominio .com, .net (cat.02)','Tipo empresarial - No compartido',1,'unidad',350,350,0,6,0),(10,'Pago de Hosting y Dominio .pe (cat.03) ','Hosting super economico',1,'unidad',250,250,0,7,0),(11,'Pago de Hosting y Dominio .com, .net (cat.02) -S./350','',1,'unidad',350,350,0,8,0),(12,'Pago mensual Google suit - S/.25','Pago Mensual por Google suit 1 correo corporativo',1,'1',25,25,0,9,0),(13,'Diseño Web Empresarial S./500 (cat.01)','creación de tienda Virtual',1,'unidad',500,500,0,10,0),(14,'Pago de Hosting y Dominio .com, .net (cat.02) -S./350','',1,'unidad',350,350,0,10,0),(15,'Pago mensual Google suit - S/.25','',1,'1',25,25,0,11,0),(16,'Adicional Web S/.150','Trabajo adicional para la web implemetar formulario, y agregar boton whapssap',1,'unidad',150,150,0,10,0),(17,'Pago mensual Google suit - S/.25','',2,'1',25,50,0,12,0),(18,'Mantenimiento Web S.(??)','Se Realiza  mantenimiento de Web',1,'unidad',170,170,0,14,0),(19,'creacion de pagina web','Se acordo pagar  por el Diseño',1,'unidad',720,720,0,15,0),(20,'Pago de Hosting y Dominio .com, .net (cat.02) -S./350','',1,'unidad',350,350,0,16,0),(21,'Tienda Virtual S/700','tienda',1,'unidad',700,700,0,16,0),(22,'servicio de mantenimeinto','Este  servicio es de subida  De productos ya  que son libros  virtuales y  son muchos',1,'5 horas',80,80,0,16,0),(23,'Pago mensual Google suit - S/.25','',2,'unidad',25,50,0,17,0),(24,'Pago mensual Google suit - S/.25','Pago  por correo Google Business',2,'1',25,50,0,18,0),(25,'Pagina web Económica s./280.00','Pagina Web Economica',1,'unidad',250,250,0,19,0),(26,'Hosting Económico S./250.00','',1,'unidad',250,250,0,19,0),(27,'Trabajo adicional','es un trabajo adicional para  poner un banner',1,'unidad',50,50,0,19,0),(28,'Pago de Hosting y Dominio .com, .net (cat.02) -S./350','Hoting y  dominio profesiona',1,'unidad',350,350,0,20,0),(29,'Pago mensual Google suit - S/.25','pago Enero -2021',2,'UNIDAD',25,50,0,21,0),(30,'Plataforma Virtual  S/800','Implementación de plataforma virtual',1,'unidad',800,800,0,22,0),(31,'Pago de Hosting y Dominio S./450.00 (cat.04)','Web corporativo',1,'unidad',450,450,0,22,0),(32,'Trabajo adicional','es un trabajo adicional que  costaria en 50 se  corrdino\n\nhttps://i.imgur.com/tk91Y5L.png',1,'unidad',50,50,0,22,0),(33,'Trabajo adicional','1- 50 soles por pendiente pago por configuracion de correos\n2- 50 soles  adicionales por el diseño de la pagina web\n3- 50 soles por querer  acabar la  pagina  web en  un solo dia',1,'unidad',150,150,0,23,0),(34,'Pago Renovación Web $100','Pago por  renovación de pagina web',1,'unidad',100,100,0,24,1),(35,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.721',1,'unidad',365,365,0,24,0),(36,'Trabajo adicional','es un trabajo adicional',1,'unidad',50,50,0,22,0),(37,'Pago mensual Google suit - S/.25','',2,'UNIDAD',25,50,0,25,0),(38,'Pago mensual Google suit - S/.25','',2,'UNIDAD',25,50,0,26,0),(39,'Trabajo adicional','Modicficaciones:\n1-  cambiar el  logo\n2-  quitar  el texto que  dice:  CISET, experta en informática ..... y reemplazarlo por:  Somos Prosesionales...! (en  negrita)\n3-  poner el logo arriba y el menu  abajo del logo\n4-  El menu que se a de color verde\n5-  Que el menu y el logo se quede arriba asi bajen abajo\n6-  poner el whapssap en la parte inferior y que se quede no se  mueva asi baje o suban en la  pagina\n\n7. ponerle  color verde  la  letras del menu',1,'unidad',110,110,0,15,0),(40,'Pago mensual Google suit - S/.25','Pago  por  correos',2,'1',25,50,0,27,0),(41,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 4.11',1,'unidad',400,400,0,28,0),(42,'Mantenimiento Web S.(??)','Se Realiza  mantenimiento de Web',1,'unidad',100,100,0,29,0),(43,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 4.13\n\n',1,'1',70.21,70.21,0,30,0),(44,'Trabajo adicional','es un trabajo adicional',1,'unidad',350,350,0,31,0),(45,'Renovacion de Pagina .PE ( $100 + S/.50)','Pago por renovacion e pagina web con .pe\nwww.corporacionpacifico.com.pe',1,'1',444,444,0,32,0),(46,'Renovacion de Pagina .PE ( $100 + S/.50)','Pago por renovacion e pagina web con .pe\nwww.lissacorp.pe\nA este  cliente se le  descuenta lo mas  minimo por se  amigo cercano\n\nS./260 + 46.80 del igv (Aqui se le  genero una  factura)\n',1,'UNIDAD',306.8,306.8,0,33,0),(47,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 4.08',1,'1',68.33,68.33,0,34,0),(48,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 4.07',1,'1',69.19,69.19,0,35,0),(49,'VPN - $52 anuales','implemetacion de vpn para redes y empresas',1,'1',205,205,0,36,0),(50,'Mantenimiento Web S.(??)','se actualizo algunas imagenes y contenido',1,'unidad',50,50,0,37,0),(51,'servicio de mantenimeinto','se instala el sistema en la computadora de samuel y otra pc',1,'5 horas',40,40,0,38,0),(52,'Hosting Económico S./250.00','Hosting Empresarial , manteniemento de la pagina web : www.hdmaquinarias.com',1,'unidad',250,250,0,39,0),(53,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.88',1,'unidad',388,388,0,40,0),(54,'Mantenimiento de Computo S./ 70','Licencia de ccboot 2022',0,'unidad',100,0,0,41,0),(55,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 3.81',1,'1',64,64,0,42,0),(56,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 3.81',1,'1',64,64,0,43,0),(57,'Pago de Hosting y Dominio S./450.00 (cat.04)','Web corporativo',1,'unidad',450,450,0,44,0),(58,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 4.13',1,'1',61,61,0,45,0),(59,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.721',1,'unidad',372,372,0,46,0),(60,'Hosting y dominio AWS version 001  $170','creacion de pagina web',1,'unidad',170,170,0,47,0),(61,'Tienda Virtual S/700','tienda',1,'unidad',700,700,0,48,0),(62,'Trabajo adicional','es un trabajo adicional',1,'unidad',300,300,0,49,0),(63,'Pagina web de servicios $100','Pago por  pagina web empresarial',1,'1',381,381,0,50,0),(64,'Pagina web Empresa S./500.00','',1,'unidad',500,500,0,50,0),(65,'Trabajo adicional','funciones  nuevas',1,'unidad',50,50,0,50,0),(66,'Trabajo adicional','es un trabajo adicional de boton whapssap\nimagen: https://i.imgur.com/V9lxl4e.png',1,'unidad',60,60,0,51,0),(67,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.91',1,'unidad',391,391,0,52,0),(68,'servicio de mantenimeinto','Servicio tecnicco para  instalar el softlink\n\nhttps://i.imgur.com/3lgXyMJ.png',1,'1 horas',20,20,0,53,0),(69,'Correo corporativo Google $7','Correo Corporativo Google Bussines $7 dolares',1,'1',7,7,0,54,0),(70,'Correo corporativo Google $7','Correo Corporativo Google Bussines $7 dolares',1,'1',7,7,0,55,0),(71,'Correo corporativo Google $7','Correo Corporativo Google Bussines $7 dolares',1,'1',7,7,0,56,0),(72,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.721 - para el 2023',1,'unidad',398,398,0,57,0),(73,'Hosting Económico S./250.00','hosting economico',1,'unidad',250,250,0,58,0),(74,'Diseño Web Empresarial S./500 (cat.01)','',1,'unidad',500,500,0,59,0),(75,'Renovacion de Pagina .PE ( $100 + S/.50)','Pago por renovacion e pagina web con .pe',1,'1',450,450,0,60,0),(76,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.721',1,'unidad',399,399,0,61,0),(77,'Renovacion de Pagina .PE ( $100 + S/.50)','Pago por renovacion e pagina web con .pe',1,'1',450,450,0,62,0);
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_payments`
--

DROP TABLE IF EXISTS `invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_payments`
--

LOCK TABLES `invoice_payments` WRITE;
/*!40000 ALTER TABLE `invoice_payments` DISABLE KEYS */;
INSERT INTO `invoice_payments` (`id`, `amount`, `payment_date`, `payment_method_id`, `note`, `invoice_id`, `deleted`, `transaction_id`, `created_by`, `created_at`) VALUES (1,200,'2019-08-20',1,'se  pago',1,0,NULL,1,'2019-08-20 20:39:44'),(2,870,'2020-06-19',1,'se cancelo con el ultimo deposito\n00169984',3,0,NULL,1,'2020-06-27 23:11:32'),(3,110,'2020-02-15',1,'',2,0,NULL,1,'2020-06-27 23:12:39'),(4,870,'2020-06-17',1,'',4,0,NULL,1,'2020-06-27 23:54:08'),(5,350,'2020-05-22',1,'',6,0,NULL,1,'2020-06-29 20:04:55'),(6,1,'2019-10-29',1,'',7,1,NULL,1,'2020-06-29 20:20:07'),(7,250,'2019-10-29',1,'',7,0,NULL,1,'2020-06-29 20:23:21'),(8,200,'2020-08-05',1,'https://1.bp.blogspot.com/-yVk626hUE0M/Xyt0IwWVtoI/AAAAAAAAZfs/gEeNFBiA12kWqF_xCrlKtCG3QZz2NcuKQCLcBGAsYHQ/s640/pago1.png',8,0,NULL,1,'2020-08-05 22:13:25'),(9,25,'2020-08-06',1,'',9,0,NULL,1,'2020-09-04 16:01:38'),(10,200,'2019-08-05',4,'',10,0,NULL,1,'2020-08-24 19:56:48'),(11,300,'2019-09-24',4,'',10,0,NULL,1,'2020-08-24 22:04:31'),(12,25,'2020-09-04',1,'img: https://i.imgur.com/uxT9TqL.jpg',11,0,NULL,1,'2020-09-04 16:08:12'),(13,200,'2020-09-08',4,'imagen: https://i.imgur.com/Cg81vBc.jpg',10,0,NULL,1,'2020-09-10 19:51:53'),(14,300,'2020-09-10',4,'deposito bcp https://i.imgur.com/tBLcV7x.jpg',10,0,NULL,1,'2020-09-10 19:41:06'),(15,40,'2019-10-02',1,'',12,0,NULL,1,'2020-10-02 22:33:08'),(16,170,'2020-11-20',1,'pago: https://i.imgur.com/ZUS5djL.png',14,0,NULL,1,'2020-12-03 12:43:07'),(17,200,'2020-09-09',4,'img: https://i.imgur.com/YrqwNSn.png',15,0,NULL,1,'2020-12-03 12:50:58'),(18,200,'2020-12-01',4,'img: https://i.imgur.com/3yxKmAA.png',15,0,NULL,1,'2020-12-03 12:52:15'),(19,200,'2019-10-28',4,'img: https://i.imgur.com/88XTEU0.png',16,0,NULL,1,'2020-12-03 13:05:15'),(20,200,'2020-11-11',4,'img: https://i.imgur.com/EqunAZm.png',16,0,NULL,1,'2020-12-03 13:06:15'),(21,50,'2020-12-09',4,'img: https://i.imgur.com/XQIXYf9.png',17,0,NULL,1,'2020-12-09 16:25:54'),(22,50,'2021-01-04',4,'url imagen: https://i.imgur.com/MaUFY7Q.png',18,0,NULL,1,'2021-01-05 10:10:43'),(23,200,'2020-01-03',4,'inicial\nhttps://i.imgur.com/FgS2w7G.png',19,0,NULL,1,'2021-01-12 16:39:55'),(24,150,'2020-01-12',4,'https://i.imgur.com/fa902O2.png',19,0,NULL,1,'2021-01-13 11:07:01'),(25,350,'2021-01-21',4,'imagen depos:\nhttps://i.imgur.com/TEZKeF8.png\nhttps://i.imgur.com/Oztg8yC.png',20,0,NULL,1,'2021-01-21 10:37:02'),(26,200,'2021-01-24',4,'https://i.imgur.com/BISxjtf.png',19,0,NULL,1,'2021-01-24 13:18:01'),(27,50,'2021-01-31',4,'depo: https://i.imgur.com/zHQlEHd.png',21,0,NULL,1,'2021-01-31 19:27:41'),(28,200,'2021-01-07',4,'priemr  deposito\nhttps://i.imgur.com/GIfNhfU.png\n',22,0,NULL,1,'2021-02-17 21:26:22'),(29,516,'2021-02-15',4,'deposito 525  pero  el banco me  desconto 9 soles, por que  el pago lo realizo por   otro medio de  pago\nhttps://i.imgur.com/rJH2N5V.png',22,0,NULL,1,'2021-02-17 21:31:01'),(30,200,'2021-02-28',4,'imagnen: https://i.imgur.com/0ayUG9K.png',15,0,NULL,1,'2021-02-28 18:38:35'),(31,100,'2021-03-24',1,'https://i.imgur.com/9Zmpx4H.png\n\npago',7,1,NULL,1,'2021-03-27 19:35:40'),(32,100,'2021-03-24',1,'https://i.imgur.com/9Zmpx4H.png\n\npago',23,0,NULL,1,'2021-03-27 19:36:24'),(33,200,'2021-04-06',1,'https://i.imgur.com/yFpnFfh.png',24,0,NULL,1,'2021-04-06 11:12:44'),(34,300,'2021-04-04',4,'baucher: https://i.imgur.com/rzIqZUr.png',22,0,NULL,1,'2021-04-06 11:15:31'),(35,334,'2021-04-08',4,'boaucher: https://i.imgur.com/ZFlNVtg.png',22,0,NULL,1,'2021-04-08 20:24:49'),(36,50,'2021-04-15',1,'nunca me pago por este   dominio',5,0,NULL,1,'2021-04-15 18:54:37'),(37,165,'2021-04-15',4,'deposito: https://i.imgur.com/xqgbYW6.png',24,0,NULL,1,'2021-04-15 18:56:49'),(38,50,'2021-04-14',1,'eeee',18,1,NULL,1,'2021-04-15 19:05:15'),(39,50,'2021-03-06',4,'pago: https://i.imgur.com/1gjCEur.png',25,0,NULL,1,'2021-04-15 19:18:42'),(40,50,'2021-04-10',4,'img : https://i.imgur.com/DGGPNRb.png',26,0,NULL,1,'2021-04-15 19:21:21'),(41,50,'2021-05-05',4,'imagen: https://i.imgur.com/8BOBzvn.png',27,0,NULL,1,'2021-05-05 16:21:08'),(42,150,'2021-08-04',1,'no recuerdo pero al parecer me  pago',8,0,NULL,1,'2021-08-05 10:12:07'),(43,400,'2021-08-27',4,'https://i.imgur.com/xZU56m3.png\nhttps://i.imgur.com/IIn2uLi.png',28,0,NULL,1,'2021-08-27 22:28:29'),(44,100,'2021-08-30',4,'https://i.imgur.com/7v2HJRk.png',29,0,NULL,1,'2021-08-30 22:56:00'),(45,70.21,'2021-10-06',4,'https://i.imgur.com/40aJYGC.png',30,0,NULL,1,'2021-10-06 15:14:36'),(46,350,'2021-10-06',4,'https://i.imgur.com/w8T6FGD.png',31,0,NULL,1,'2021-10-07 17:21:33'),(47,306.8,'2021-11-01',4,'https://i.imgur.com/5pFiS3D.png',33,0,NULL,1,'2021-11-06 13:31:04'),(48,68.33,'2021-11-13',5,'https://imgur.com/a/5bcUDMv',34,0,NULL,1,'2021-11-13 19:28:39'),(49,444,'2021-11-15',5,'https://i.imgur.com/Ii42wBy.png',32,0,NULL,1,'2021-11-15 21:00:34'),(50,85,'2021-12-03',7,'imagen https://i.imgur.com/z13sUMN.png',23,0,NULL,1,'2021-12-04 22:29:13'),(51,69.19,'2021-12-03',5,'https://i.imgur.com/3O6jVhz.png',35,0,NULL,1,'2021-12-04 22:19:15'),(52,205,'2021-12-27',5,'foto de pago: https://i.imgur.com/gAvCQlo.png',36,0,NULL,1,'2021-12-27 19:06:47'),(53,40,'2022-01-15',4,'imgen: https://i.imgur.com/HLJHi9A.png',38,0,NULL,1,'2022-01-15 09:46:48'),(54,388,'2022-01-20',4,'pago: https://i.imgur.com/mRwbebu.png',40,0,NULL,1,'2022-01-20 19:55:11'),(55,100,'2022-01-21',4,'https://i.imgur.com/DPOF2fj.png',41,0,NULL,1,'2022-01-21 12:13:53'),(56,255,'2022-01-24',4,'vaucher: https://i.imgur.com/vwTwCfm.png',39,0,NULL,1,'2022-01-24 15:25:54'),(57,64,'2022-02-10',5,'https://i.imgur.com/bBAIqNr.png',42,0,NULL,1,'2022-02-10 18:54:34'),(58,64,'2022-02-10',5,'https://i.imgur.com/ucyPP9M.png',43,0,NULL,1,'2022-02-10 18:56:24'),(59,450,'2022-02-17',4,'https://i.imgur.com/tFvYiXb.png',44,0,NULL,1,'2022-02-17 15:30:56'),(60,61,'2022-03-06',5,'https://i.imgur.com/0yOgtei.png',45,0,NULL,1,'2022-03-06 23:11:47'),(61,160,'2022-04-07',5,'se realizo el deposito de  $50 - https://i.imgur.com/ICkaUQv.png',46,0,NULL,1,'2022-04-07 11:00:53'),(62,212,'2022-03-24',5,'pago de $ 50 con eso se   cancelo: https://i.imgur.com/Z4la8GZ.png',46,0,NULL,1,'2022-04-28 23:13:49'),(63,170,'2022-05-12',5,'https://drive.google.com/file/d/16fIXwhUqGcwtvyf0GpbZsF8qWBnNEb-v/view?usp=drivesdk',47,0,NULL,1,'2022-10-21 13:00:42'),(64,200,'2022-05-24',5,'https://i.imgur.com/i6ohmSL.png\nhttps://i.imgur.com/4JhimCT.png\nhttps://i.imgur.com/Sk6TUk9.png',49,0,NULL,1,'2022-05-29 21:53:34'),(65,500,'2022-06-06',4,'https://i.imgur.com/B1UyfAb.png',50,0,NULL,1,'2022-06-06 20:39:32'),(66,100,'2022-05-24',4,'https://i.imgur.com/Gbmy3Br.png',50,0,NULL,1,'2022-06-06 20:43:14'),(67,100,'2022-07-17',4,'',49,0,NULL,1,'2022-07-17 14:47:35'),(68,101,'2022-08-08',4,'https://i.imgur.com/j9g1d7m.png',50,0,NULL,1,'2022-08-08 16:35:55'),(69,60,'2022-08-01',5,'https://i.imgur.com/TeZgcnB.png',51,0,NULL,1,'2022-08-17 18:43:16'),(70,50,'2022-02-28',5,'',37,0,NULL,1,'2022-08-17 18:44:36'),(71,100,'2022-08-31',5,'https://i.imgur.com/rDchqVQ.png',50,0,NULL,1,'2022-08-31 10:52:36'),(72,100,'2022-09-08',5,'https://i.imgur.com/xcqIDk0.png',50,0,NULL,1,'2022-09-08 14:43:05'),(73,7,'2022-09-08',5,'pagos: \nhttps://i.imgur.com/rjb5Yca.png\nhttps://i.imgur.com/jCcnBzB.png',54,0,NULL,1,'2022-09-08 15:06:13'),(74,7,'2022-09-08',5,'pagos: https://i.imgur.com/rjb5Yca.png https://i.imgur.com/jCcnBzB.png',55,0,NULL,1,'2022-09-08 23:10:37'),(75,4,'2022-09-08',5,'pagos: https://i.imgur.com/rjb5Yca.png https://i.imgur.com/jCcnBzB.png\n\neste  fue  el pago  acumulado',56,0,NULL,1,'2022-09-08 23:14:47'),(76,30,'2022-09-27',4,'https://i.imgur.com/Ps0IQdG.png',50,0,NULL,1,'2022-09-27 12:41:49'),(77,150,'2022-09-29',5,'https://i.imgur.com/hqWjDk5.png',52,0,NULL,1,'2022-09-29 18:22:49'),(78,150,'2022-10-04',4,'https://i.imgur.com/vNRWSCZ.png',52,0,NULL,1,'2022-10-04 15:13:23'),(79,50,'2022-10-04',4,'https://i.imgur.com/eZqbtAX.png',52,0,NULL,1,'2022-10-04 15:13:58'),(80,41,'2022-10-04',5,'https://i.imgur.com/bHb4K2t.png',52,0,NULL,1,'2022-10-04 16:13:17'),(81,700,'2022-10-26',5,'https://drive.google.com/file/d/1SBhElrxSocyFDujEelLgnsWS6w3B9v12/view?usp=drivesdk',48,0,NULL,1,'2022-10-26 17:54:04'),(82,400,'2022-11-09',5,'https://drive.google.com/file/d/1GG7C2eNTYXfXDlfLFNCjmQ4pZV8tgA2n/view?usp=drivesdk',60,0,NULL,1,'2022-11-09 14:12:26'),(83,50,'2022-11-09',4,'https://drive.google.com/file/d/1eBRlIQM12uBcEOE-0RYEQ82D7fR_GsV4/view?usp=drivesdk',60,0,NULL,1,'2022-11-09 14:13:13'),(84,730,'2022-11-10',1,'no se pago este  monto lo puse para qeu  figure como ya  pagada',16,0,NULL,1,'2022-11-10 12:41:30');
/*!40000 ALTER TABLE `invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `recurring` tinyint(4) NOT NULL DEFAULT 0,
  `recurring_invoice_id` int(11) NOT NULL DEFAULT 0,
  `repeat_every` int(11) NOT NULL DEFAULT 0,
  `repeat_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_cycles` int(11) NOT NULL DEFAULT 0,
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int(11) NOT NULL DEFAULT 0,
  `due_reminder_date` date DEFAULT NULL,
  `recurring_reminder_date` date DEFAULT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') COLLATE utf8_unicode_ci NOT NULL,
  `discount_type` enum('before_tax','after_tax') COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` (`id`, `client_id`, `project_id`, `bill_date`, `due_date`, `note`, `last_email_sent_date`, `status`, `tax_id`, `tax_id2`, `recurring`, `recurring_invoice_id`, `repeat_every`, `repeat_type`, `no_of_cycles`, `next_recurring_date`, `no_of_cycles_completed`, `due_reminder_date`, `recurring_reminder_date`, `discount_amount`, `discount_amount_type`, `discount_type`, `deleted`) VALUES (1,2,3,'2019-08-21','2019-08-22','page por favor','2020-06-27','not_paid',1,1,0,0,1,'months',0,NULL,0,NULL,NULL,10,'percentage','before_tax',0),(2,3,6,'2020-02-15','2020-02-15','pago por  servicio tecnico','2020-02-18','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(3,4,7,'2020-04-27','2020-05-27','','2020-06-27','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(4,5,8,'2020-05-15','2028-06-10','','2020-06-27','not_paid',0,0,0,0,1,'years',3,'2023-05-15',0,NULL,NULL,0,'percentage','before_tax',0),(5,6,9,'2009-04-08','2021-04-08','','2020-06-29','not_paid',0,0,0,0,1,'years',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(6,6,9,'2020-04-04','2020-05-04','factura generada para renovación de pagina web','2020-06-29','not_paid',0,0,1,0,1,'years',0,'2021-04-04',0,NULL,NULL,0,'percentage','before_tax',0),(7,7,10,'2019-10-29','2019-10-29','','2020-06-29','not_paid',0,0,1,0,1,'years',0,'2020-10-29',0,NULL,NULL,0,'percentage','before_tax',0),(8,3,11,'2020-08-04','2021-08-04','',NULL,'not_paid',0,0,1,0,1,'years',0,'2021-08-04',0,NULL,NULL,0,'percentage','before_tax',0),(9,4,0,'2020-07-30','2020-07-30','pago por google suite un correo corporativo',NULL,'not_paid',0,0,0,0,1,'months',0,'2020-08-30',0,NULL,NULL,0,'percentage','before_tax',0),(10,3,11,'2020-08-05','2020-10-30','Pagina Web Profesional',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(11,4,0,'2020-08-30','2020-08-31','',NULL,'not_paid',0,0,0,0,1,'months',9,'2020-09-30',0,NULL,NULL,0,'percentage','before_tax',0),(12,4,0,'2020-10-01','2020-10-02','',NULL,'not_paid',0,0,0,0,1,'months',2,'2020-11-01',0,NULL,NULL,10,'fixed_amount','before_tax',0),(13,4,0,'2020-10-02','2020-10-02','',NULL,'draft',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',1),(14,3,11,'2020-11-26','2020-12-01','Mantenimiento',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(15,8,12,'2020-12-24','2020-12-31','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(16,9,13,'2020-10-28','2020-12-31','No pagado totalmente',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(17,4,0,'2020-12-09','2020-12-09','',NULL,'not_paid',0,0,0,0,1,'months',0,'2021-01-09',0,NULL,NULL,0,'percentage','before_tax',0),(18,4,0,'2021-01-04','2021-01-05','',NULL,'not_paid',0,0,0,0,1,'months',0,'2021-02-04',0,NULL,NULL,0,'percentage','before_tax',0),(19,10,14,'2021-01-12','2021-01-13','Se le   desconto  por que  la  pagina no es  administrable y  el ya  tiene el dominio solo quiere el hosting',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(20,11,15,'2021-01-20','2021-02-28','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(21,4,0,'2021-02-01','2021-02-01','','2021-01-31','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(22,12,0,'2021-02-17','2021-04-30','pago web',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(23,7,0,'2021-03-25','2021-03-27','Extras por diseño y configuraciond e correo',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(24,6,9,'2021-04-05','2021-05-31','Pago por renovación de pagina Web',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(25,4,0,'2021-03-01','2021-03-03','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(26,4,0,'2021-04-01','2021-04-04','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(27,4,0,'2021-05-01','2021-05-05','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(28,3,11,'2021-08-01','2021-08-31','Pago con el tipo de cambio  $1 = S./4..08',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(29,3,11,'2021-08-31','2021-09-30','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(30,4,0,'2021-10-06','2021-10-06','Pago por Correo google Bussines',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(31,4,16,'2021-10-06','2021-10-06','Se termino el proyecto',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(32,3,23,'2021-10-19','2021-11-02','Pago renovacion de Pagina Web',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(33,7,0,'2021-10-20','2021-10-31','Renovacion de pagina web',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(34,4,17,'2021-11-13','2021-11-13','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(35,4,17,'2021-12-02','2021-12-04','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(36,4,16,'2021-12-01','2021-12-17','ya',NULL,'not_paid',0,0,1,0,1,'years',0,'2022-12-01',0,NULL,NULL,0,'percentage','before_tax',0),(37,3,11,'2022-01-04','2022-01-14','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(38,4,18,'2022-01-12','2022-01-19','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(39,10,14,'2022-01-02','2022-01-24','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(40,11,15,'2022-01-11','2022-01-20','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(41,13,19,'2022-01-01','2022-01-06','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(42,4,17,'2022-01-01','2022-01-04','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(43,4,17,'2022-02-01','2022-02-10','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(44,12,20,'2022-02-17','2022-02-17','',NULL,'not_paid',0,0,1,0,1,'years',8,'2023-02-17',0,NULL,NULL,0,'percentage','before_tax',0),(45,4,17,'2022-03-06','2022-03-06','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(46,6,9,'2022-04-04','2022-04-08','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(47,14,21,'2022-05-17','2022-06-30','creacion de web completa',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(48,14,21,'2022-05-18','2022-07-31','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(49,12,20,'2022-05-29','2022-05-30','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(50,13,0,'2022-06-06','2022-09-29','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(51,4,7,'2022-08-08','2022-08-09','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(52,3,11,'2022-08-06','2022-08-31','pago de renovacion de dominio',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(53,4,0,'2022-08-15','2022-08-18','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(54,13,22,'2022-09-08','2022-09-30','','2022-09-08','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(55,13,22,'2022-10-01','2022-10-31','','2022-09-08','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(56,13,22,'2022-11-01','2022-11-04','','2022-09-08','not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(57,11,15,'2023-01-20','2023-01-28','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(58,10,14,'2023-01-01','2023-01-13','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(59,1,5,'2022-11-06','2022-11-08','',NULL,'draft',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',1),(60,3,23,'2022-10-29','2022-11-12','',NULL,'not_paid',0,0,0,0,1,'months',0,NULL,0,NULL,NULL,0,'percentage','before_tax',0),(61,3,11,'2023-08-04','2023-08-31','',NULL,'not_paid',0,0,1,0,1,'years',9,'2024-08-04',0,NULL,NULL,0,'percentage','before_tax',0),(62,3,23,'2023-10-29','2023-11-30','',NULL,'not_paid',0,0,1,0,1,'months',9,'2023-11-29',0,NULL,NULL,0,'percentage','before_tax',0);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `title`, `description`, `unit_type`, `rate`, `deleted`) VALUES (1,'creacion de pagina web','se creo una  pagina web','1',1500,0),(2,'servicio de mantenimeinto','se creo un servicio tecnico','5 horas',70,0),(3,'Diseño de tienda Virtual S/500 (cat.01)','creación de tienda Virtual','unidad',500,0),(4,'Pago de Hosting y Dominio .pe (cat.01)','','unidad',370,0),(5,'Pago de Hosting y Dominio .com, .net (cat.02) -S./350','','unidad',350,0),(6,'Diseño Web Empresarial S./500 (cat.01)','','unidad',500,0),(7,'Pago de Hosting y Dominio .pe (cat.03) ','','unidad',250,0),(8,'Dominio Temporal (S/.50)','dominio temporal se aplica cuando uno tiene mas de un dominio a la vez','unidad',50,0),(9,'Pago mensual Google suit - S/.25','','1',25,0),(10,'Adicional Web S/.150','Trabajo adicional para la web','1',150,0),(11,'Mantenimiento Web S.(??)','Se Realiza  mantenimiento de Web','unidad',200,0),(12,'Tienda Virtual S/700','tienda','unidad',700,0),(13,'Pagina web Económica s./280.00','','unidad',280,0),(14,'Pagina web Empresa S./500.00','','unidad',500,0),(15,'Hosting Económico S./250.00','','unidad',250,0),(16,'Trabajo adicional','es un trabajo adicional','unidad',0,0),(17,'Plataforma Virtual  S/800','Implementación de plataforma virtual','unidad',800,0),(18,'Pago de Hosting y Dominio S./450.00 (cat.04)','Web corporativo','unidad',450,0),(19,'Pago Renovación Web $100','Pago por  renovación de pagina web  tipo de cambio dolar 3.721','unidad',370,0),(20,'Pagina web de servicios $100','Pago por  pagina web empresarial','1',100,0),(21,'Correo google Bussines Paquete 2 Correos $17','pago por correo google\n\ntipo de cambio: 4.13','1',70.21,0),(22,'Renovacion de Pagina .PE ( $100 + S/.50)','Pago por renovacion e pagina web con .pe','1',100,0),(23,'VPN - $52 anuales','implemetacion de vpn para redes y empresas','1',205,0),(24,'Mantenimiento de Computo S./ 70','Mantenimiento de Computo','unidad',70,0),(25,'Hosting y dominio AWS version 001  $170','creacion de pagina web','unidad',170,0),(26,'Correo corporativo Google $7','Correo Corporativo Google Bussines $7 dolares','1',7,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_applications`
--

DROP TABLE IF EXISTS `leave_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `user_id` (`applicant_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_applications`
--

LOCK TABLES `leave_applications` WRITE;
/*!40000 ALTER TABLE `leave_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` (`id`, `title`, `status`, `color`, `description`, `deleted`) VALUES (1,'Licencia ocasional','active','#83c340','',0);
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_from` (`from_user_id`),
  KEY `message_to` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
INSERT INTO `milestones` (`id`, `title`, `project_id`, `due_date`, `description`, `deleted`) VALUES (1,'modelacion de base de datos',1,'2019-12-24','',0);
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `labels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` (`id`, `created_by`, `created_at`, `title`, `description`, `project_id`, `client_id`, `user_id`, `labels`, `files`, `deleted`) VALUES (1,1,'2019-11-27 09:54:10','cotizar compra de liberia','esta es una nota de prueba',0,0,0,'prueba,nota','a:0:{}',0),(2,1,'2020-06-29 21:43:47','accesos web','sistema: https://pcbyte.com.pe/soluciones-admin\nusuario:zajani051807.sc@gmail.com\npassword: JJr&@lf6EnxgsD22108U0Ma3',0,4,0,'','a:0:{}',0),(3,1,'2020-07-31 12:17:29','depositos','\n24 julio 5ta cat\ncantidad: 710.00\n\n24 julio 5ta cat\ncantidad : 1118.00\n\n7 julio 5ta cat \ncantidad: 2002.98\n',0,0,0,'','a:0:{}',0),(4,1,'2020-09-03 23:37:30','moises','1- poner mapaa de ubicacion en la  portada enal  parte de abajo\n\n2- Falta quienes somos\n',0,0,0,'','a:0:{}',0),(5,1,'2020-09-06 13:10:52','nuevos cambios','hacer los  cambios del formulario mas pequeños',0,0,0,'','a:0:{}',1),(6,1,'2020-12-14 21:10:11','cambios 2020-12-14','1- Ordenar la pagina de  contactenos\n poner uno sobre  otro en  una  sola columna la  direccion y los  teelfonos\n y  tambien poner los iconos reemplazando los textos como telefono y correos,\ny el  mapa  que  balla  en la otra  columna\n\n2- poner un  formulario de contacto',0,9,0,'','a:0:{}',1),(7,1,'2020-12-15 10:54:11','2020-12-14','1- Ordenar la pagina de contactenos\nponer uno sobre otro en una sola columna la direccion y los teelfonos\ny tambien poner los iconos reemplazando los textos como telefono y correos,\ny el mapa que balla en la otra columna\n\n2- poner un formulario de contacto',0,8,0,'','a:0:{}',0),(8,1,'2020-12-23 20:54:34','Paginas web a Crear','# pagina  web  inmobiliaria\n## muestras:\nhttps://themeforest.net/tags/real estate?term=house#content\nlo que  escogi:\nhttps://themeforest.net/item/real-house-real-estate-html-template/19504444\nhttp://demoapus-wp1.com/landing-page/homeo/\nhttps://demoapus.com/apushome/\nhttps://demoapus.com/landing-page/apushome/',0,0,0,'','a:0:{}',0),(9,1,'2021-08-27 22:21:10','Ruc de empresas','GRUPO PACIFICO EXPRESS S.A.C.\n20606174471\n----------------------------------------------------------\n',0,3,0,'','a:0:{}',0),(10,1,'2022-05-18 22:48:13','faltantes','limpiar  db con scripts}\nlimpiar productos\nquitar  categorias y marcas\ncrear usuario paa el  cliente',0,14,0,'','a:0:{}',0),(11,1,'2022-05-29 22:41:37','ultimos  cambios','1  achicar texto de los cursos en el listado ✅\n2. en la tienda que  aya el listado de las categorias ✅\n3. cambiar tienda por libros ✅\n4. quitar el pie de  pagina solo en la  pagina  mi cuenta ✅\n5. en el pie de pagina no aparece la onexion de fand page facebook ✅\n6. boton de subir arriba tampoco aparece  ✅\n7. el logo ya no manda a la pagina de inicio ✅\n8. boton de whapssap no aparece ✅\n\n',0,12,0,'','a:0:{}',0);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT 0,
  `enable_web` int(1) NOT NULL DEFAULT 0,
  `notify_to_team` text NOT NULL,
  `notify_to_team_members` text NOT NULL,
  `notify_to_terms` text NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `event` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
INSERT INTO `notification_settings` (`id`, `event`, `category`, `enable_email`, `enable_web`, `notify_to_team`, `notify_to_team_members`, `notify_to_terms`, `sort`, `deleted`) VALUES (1,'project_created','project',0,0,'','','',1,0),(2,'project_deleted','project',0,0,'','','',2,0),(3,'project_task_created','project',0,1,'','','project_members,task_assignee',3,0),(4,'project_task_updated','project',0,1,'','','task_assignee',4,0),(5,'project_task_assigned','project',0,1,'','','task_assignee',5,0),(7,'project_task_started','project',0,0,'','','',7,0),(8,'project_task_finished','project',0,0,'','','',8,0),(9,'project_task_reopened','project',0,0,'','','',9,0),(10,'project_task_deleted','project',0,1,'','','task_assignee',10,0),(11,'project_task_commented','project',0,1,'','','task_assignee',11,0),(12,'project_member_added','project',0,1,'','','project_members',12,0),(13,'project_member_deleted','project',0,1,'','','project_members',13,0),(14,'project_file_added','project',0,1,'','','project_members',14,0),(15,'project_file_deleted','project',0,1,'','','project_members',15,0),(16,'project_file_commented','project',0,1,'','','project_members',16,0),(17,'project_comment_added','project',0,1,'','','project_members',17,0),(18,'project_comment_replied','project',0,1,'','','project_members,comment_creator',18,0),(19,'project_customer_feedback_added','project',0,1,'','','project_members',19,0),(20,'project_customer_feedback_replied','project',0,1,'','','project_members,comment_creator',20,0),(21,'client_signup','client',0,0,'','','',21,0),(22,'invoice_online_payment_received','invoice',0,0,'','','',22,0),(23,'leave_application_submitted','leave',0,0,'','','',23,0),(24,'leave_approved','leave',0,1,'','','leave_applicant',24,0),(25,'leave_assigned','leave',0,1,'','','leave_applicant',25,0),(26,'leave_rejected','leave',0,1,'','','leave_applicant',26,0),(27,'leave_canceled','leave',0,0,'','','',27,0),(28,'ticket_created','ticket',0,0,'','','',28,0),(29,'ticket_commented','ticket',0,1,'','','client_primary_contact,ticket_creator',29,0),(30,'ticket_closed','ticket',0,1,'','','client_primary_contact,ticket_creator',30,0),(31,'ticket_reopened','ticket',0,1,'','','client_primary_contact,ticket_creator',31,0),(32,'estimate_request_received','estimate',0,0,'','','',32,0),(33,'estimate_sent','estimate',0,0,'','','',33,0),(34,'estimate_accepted','estimate',0,0,'','','',34,0),(35,'estimate_rejected','estimate',0,0,'','','',35,0),(36,'new_message_sent','message',0,0,'','','',36,0),(37,'message_reply_sent','message',0,0,'','','',37,0),(38,'invoice_payment_confirmation','invoice',0,0,'','','',22,0),(39,'new_event_added_in_calendar','event',0,0,'','','',39,0),(40,'recurring_invoice_created_vai_cron_job','invoice',0,0,'','','',22,0),(41,'new_announcement_created','announcement',0,0,'','','recipient',41,0),(42,'invoice_due_reminder_before_due_date','invoice',0,0,'','','',22,0),(43,'invoice_overdue_reminder','invoice',0,0,'','','',22,0),(44,'recurring_invoice_creation_reminder','invoice',0,0,'','','',22,0);
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_comment_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_comment_id` int(11) NOT NULL,
  `project_file_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL,
  `actual_message_id` int(11) NOT NULL,
  `parent_message_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` (`id`, `user_id`, `description`, `created_at`, `notify_to`, `read_by`, `event`, `project_id`, `task_id`, `project_comment_id`, `ticket_id`, `ticket_comment_id`, `project_file_id`, `leave_id`, `post_id`, `to_user_id`, `activity_log_id`, `client_id`, `invoice_payment_id`, `invoice_id`, `estimate_id`, `estimate_request_id`, `actual_message_id`, `parent_message_id`, `event_id`, `announcement_id`, `deleted`) VALUES (1,1,'','2019-08-14 16:42:20','','','project_task_created',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,1,'','2019-08-14 16:50:08','','','project_task_updated',1,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0),(3,1,'','2019-08-14 16:50:13','','','project_task_updated',1,1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0),(4,1,'','2019-08-14 19:45:26','','','project_task_updated',1,1,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0),(5,1,'','2019-08-14 19:45:28','','','project_task_updated',1,1,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0),(6,1,'','2019-08-14 20:09:39','','','project_task_created',2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,1,'','2019-08-14 20:09:48','','','project_task_updated',2,2,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0),(8,1,'','2019-08-14 20:37:53','','','project_task_created',1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,1,'','2019-08-14 20:39:43','','','project_task_updated',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,1,'','2019-08-14 20:40:10','','','project_task_updated',1,1,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0),(11,1,'','2019-08-14 20:40:24','','','project_task_updated',2,2,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0),(12,1,'','2019-08-14 20:40:28','','','project_task_updated',1,1,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0),(13,1,'','2019-08-14 20:45:08','','','project_task_commented',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,1,'','2019-08-15 17:50:38','','','project_task_created',2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,1,'','2019-08-16 16:48:45','','','project_task_created',2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,1,'','2019-08-16 16:49:06','','','project_task_updated',1,1,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0),(17,1,'','2019-08-16 20:20:45','','','project_task_updated',2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,1,'','2019-08-20 20:11:29','','','project_task_created',1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,1,'','2019-08-20 20:21:50','2','','ticket_commented',0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,2,'','2019-08-20 20:22:16','','','ticket_commented',0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,1,'','2019-08-20 20:22:56','2','','ticket_closed',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,1,'','2019-08-21 17:47:36','','','project_task_updated',2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,1,'','2019-08-22 19:28:19','','','project_task_created',1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,1,'','2019-08-22 19:31:11','','','project_task_updated',1,6,0,0,0,0,0,0,0,19,0,0,0,0,0,0,0,0,0,0),(25,1,'','2019-08-22 19:31:13','','','project_task_updated',2,4,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0),(26,1,'','2019-08-22 19:31:27','','','project_task_updated',1,6,0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0),(27,1,'','2019-08-22 19:31:29','','','project_task_updated',2,4,0,0,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0),(28,1,'','2019-08-26 14:48:13','','','project_task_updated',2,5,0,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0,0),(29,1,'','2019-08-26 14:48:42','','','project_task_updated',2,2,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0),(30,1,'','2019-08-26 14:48:47','','','project_task_updated',1,1,0,0,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0),(31,1,'','2019-08-26 16:42:56','','','project_task_created',2,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,1,'','2019-08-26 16:44:07','','','project_task_updated',2,8,0,0,0,0,0,0,0,27,0,0,0,0,0,0,0,0,0,0),(33,1,'','2019-08-26 16:44:16','','','project_task_updated',1,7,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0),(34,1,'','2019-08-28 09:59:35','','','project_task_created',1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,1,'','2019-08-28 09:59:55','','','project_task_updated',2,8,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0),(36,1,'','2019-08-28 10:55:02','','','project_task_created',2,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,1,'','2019-08-28 10:55:16','','','project_task_updated',2,10,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0),(38,1,'','2019-08-28 10:55:22','','','project_task_updated',1,9,0,0,0,0,0,0,0,33,0,0,0,0,0,0,0,0,0,0),(39,1,'','2019-08-28 15:16:49','','','project_task_created',2,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,1,'','2019-09-04 17:21:14','','','project_task_created',1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,1,'','2019-09-04 17:21:33','','','project_task_updated',1,3,0,0,0,0,0,0,0,36,0,0,0,0,0,0,0,0,0,0),(42,1,'','2019-09-04 17:21:38','','','project_task_updated',1,12,0,0,0,0,0,0,0,37,0,0,0,0,0,0,0,0,0,0),(43,1,'','2019-09-16 12:30:40','','','project_task_created',1,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,1,'','2019-09-16 12:30:57','','','project_task_updated',1,1,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0),(45,1,'','2019-09-16 12:31:04','','','project_task_updated',1,12,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0),(46,1,'','2019-09-23 10:48:46','','','project_task_created',1,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,1,'','2019-09-23 10:58:23','','','project_task_updated',1,14,0,0,0,0,0,0,0,42,0,0,0,0,0,0,0,0,0,0),(48,1,'','2019-09-23 10:58:35','','','project_task_updated',2,2,0,0,0,0,0,0,0,43,0,0,0,0,0,0,0,0,0,0),(49,1,'','2019-09-23 10:58:38','','','project_task_updated',2,5,0,0,0,0,0,0,0,44,0,0,0,0,0,0,0,0,0,0),(50,1,'','2019-09-23 10:58:42','','','project_task_updated',2,4,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,0,0,0),(51,1,'','2019-09-23 11:09:27','','','project_task_created',1,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(52,1,'','2019-09-23 11:18:04','','','project_task_updated',1,15,0,0,0,0,0,0,0,47,0,0,0,0,0,0,0,0,0,0),(53,1,'','2019-09-23 11:34:45','','','project_task_updated',1,14,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0),(54,1,'','2019-09-25 10:05:12','','','project_task_created',1,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,1,'','2019-09-25 10:21:03','','','project_task_commented',1,16,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(56,1,'','2019-09-25 12:31:18','','','project_task_created',1,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,1,'','2019-10-07 11:55:48','','','project_task_updated',1,3,0,0,0,0,0,0,0,52,0,0,0,0,0,0,0,0,0,0),(58,1,'','2019-10-07 11:55:58','','','project_task_updated',1,13,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,0,0,0),(59,1,'','2019-10-07 11:56:05','','','project_task_updated',2,11,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0),(60,1,'','2019-10-07 11:56:09','','','project_task_updated',1,16,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,0),(61,1,'','2019-10-07 11:56:11','','','project_task_updated',1,16,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0),(62,1,'','2019-10-07 11:56:53','','','project_task_updated',1,15,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,0),(63,1,'','2019-10-07 11:56:55','','','project_task_updated',1,15,0,0,0,0,0,0,0,59,0,0,0,0,0,0,0,0,0,0),(64,1,'','2019-10-07 11:57:24','','','project_task_updated',1,1,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0),(65,1,'','2019-10-07 11:57:25','','','project_task_updated',1,1,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,0),(66,1,'','2019-10-07 11:57:34','','','project_task_updated',2,2,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0),(67,1,'','2019-10-07 11:57:36','','','project_task_updated',2,4,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,0),(68,1,'','2019-10-07 11:57:39','','','project_task_updated',2,5,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0),(69,1,'','2019-10-07 11:57:59','','','project_task_updated',1,1,0,0,0,0,0,0,0,65,0,0,0,0,0,0,0,0,0,0),(70,1,'','2019-10-07 11:58:00','','','project_task_updated',2,2,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0),(71,1,'','2019-10-07 11:58:01','','','project_task_updated',1,1,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,0),(72,1,'','2019-10-23 17:16:10','','','project_task_created',2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(73,1,'','2019-10-25 14:30:12','','','project_task_updated',1,15,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,0),(74,1,'','2019-10-25 14:30:19','','','project_task_updated',1,15,0,0,0,0,0,0,0,70,0,0,0,0,0,0,0,0,0,0),(75,1,'','2019-10-25 14:30:25','','','project_task_updated',2,2,0,0,0,0,0,0,0,71,0,0,0,0,0,0,0,0,0,0),(76,1,'','2019-10-28 16:02:07','','','project_task_created',1,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(77,1,'','2019-10-30 11:58:08','','','project_task_created',2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(78,1,'','2019-11-04 09:50:47','','','project_task_updated',2,2,0,0,0,0,0,0,0,74,0,0,0,0,0,0,0,0,0,0),(79,1,'','2019-11-04 09:50:49','','','project_task_updated',1,15,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,0),(80,1,'','2019-11-04 09:50:50','','','project_task_updated',1,16,0,0,0,0,0,0,0,76,0,0,0,0,0,0,0,0,0,0),(81,1,'','2019-11-04 09:50:51','','','project_task_updated',1,17,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0),(82,1,'','2019-11-04 09:50:52','','','project_task_updated',2,18,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,0),(83,1,'','2019-11-04 09:50:53','','','project_task_updated',1,14,0,0,0,0,0,0,0,79,0,0,0,0,0,0,0,0,0,0),(84,1,'','2019-11-04 09:50:54','','','project_task_updated',1,13,0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,0,0),(85,1,'','2019-11-04 09:50:55','','','project_task_updated',1,1,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,0),(86,1,'','2019-11-04 09:50:56','','','project_task_updated',1,12,0,0,0,0,0,0,0,82,0,0,0,0,0,0,0,0,0,0),(87,1,'','2019-11-04 09:50:56','','','project_task_updated',1,6,0,0,0,0,0,0,0,83,0,0,0,0,0,0,0,0,0,0),(88,1,'','2019-11-04 09:50:57','','','project_task_updated',2,5,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0,0,0),(89,1,'','2019-11-04 09:50:58','','','project_task_updated',2,4,0,0,0,0,0,0,0,85,0,0,0,0,0,0,0,0,0,0),(90,1,'','2019-11-04 10:12:53','','','project_task_updated',2,4,0,0,0,0,0,0,0,86,0,0,0,0,0,0,0,0,0,0),(91,1,'','2019-11-04 10:12:55','','','project_task_updated',2,5,0,0,0,0,0,0,0,87,0,0,0,0,0,0,0,0,0,0),(92,1,'','2019-11-04 10:12:57','','','project_task_updated',1,6,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,0),(93,1,'','2019-11-04 10:12:58','','','project_task_updated',1,1,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,0),(94,1,'','2019-11-04 10:13:00','','','project_task_updated',1,14,0,0,0,0,0,0,0,91,0,0,0,0,0,0,0,0,0,0),(95,1,'','2019-11-04 10:13:01','','','project_task_updated',1,16,0,0,0,0,0,0,0,92,0,0,0,0,0,0,0,0,0,0),(96,1,'','2019-11-04 10:13:03','','','project_task_updated',1,17,0,0,0,0,0,0,0,93,0,0,0,0,0,0,0,0,0,0),(97,1,'','2019-11-04 10:13:06','','','project_task_updated',1,12,0,0,0,0,0,0,0,94,0,0,0,0,0,0,0,0,0,0),(98,1,'','2019-11-04 10:13:08','','','project_task_updated',2,18,0,0,0,0,0,0,0,95,0,0,0,0,0,0,0,0,0,0),(99,1,'','2019-11-04 10:13:10','','','project_task_updated',1,15,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0),(100,1,'','2019-11-04 10:13:11','','','project_task_updated',2,2,0,0,0,0,0,0,0,97,0,0,0,0,0,0,0,0,0,0),(101,1,'','2019-11-04 10:13:12','','','project_task_updated',1,13,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,0),(102,1,'','2019-11-04 10:40:30','','','project_task_updated',2,20,0,0,0,0,0,0,0,99,0,0,0,0,0,0,0,0,0,0),(103,1,'','2019-11-04 10:40:54','','','project_task_updated',1,19,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,0),(104,1,'','2019-11-04 10:44:15','','','project_task_created',1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(105,1,'','2019-11-04 10:45:10','','','project_task_updated',1,21,0,0,0,0,0,0,0,102,0,0,0,0,0,0,0,0,0,0),(106,1,'','2019-11-04 10:45:11','','','project_task_updated',2,4,0,0,0,0,0,0,0,103,0,0,0,0,0,0,0,0,0,0),(107,1,'','2019-11-04 10:45:12','','','project_task_updated',2,18,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,0),(108,1,'','2019-11-04 10:45:14','','','project_task_updated',1,15,0,0,0,0,0,0,0,106,0,0,0,0,0,0,0,0,0,0),(109,1,'','2019-11-04 10:45:15','','','project_task_updated',2,5,0,0,0,0,0,0,0,107,0,0,0,0,0,0,0,0,0,0),(110,1,'','2019-11-04 10:45:16','','','project_task_updated',1,12,0,0,0,0,0,0,0,108,0,0,0,0,0,0,0,0,0,0),(111,1,'','2019-11-04 10:45:17','','','project_task_updated',1,6,0,0,0,0,0,0,0,109,0,0,0,0,0,0,0,0,0,0),(112,1,'','2019-11-04 10:45:18','','','project_task_updated',1,1,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,0),(113,1,'','2019-11-04 10:45:19','','','project_task_updated',1,14,0,0,0,0,0,0,0,111,0,0,0,0,0,0,0,0,0,0),(114,1,'','2019-11-04 10:45:21','','','project_task_updated',1,16,0,0,0,0,0,0,0,112,0,0,0,0,0,0,0,0,0,0),(115,1,'','2019-11-04 10:45:23','','','project_task_updated',1,17,0,0,0,0,0,0,0,113,0,0,0,0,0,0,0,0,0,0),(116,1,'','2019-11-04 10:45:24','','','project_task_updated',1,13,0,0,0,0,0,0,0,114,0,0,0,0,0,0,0,0,0,0),(117,1,'','2019-11-04 10:45:25','','','project_task_updated',2,2,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0),(118,1,'','2019-11-04 10:45:36','','','project_task_updated',1,21,0,0,0,0,0,0,0,116,0,0,0,0,0,0,0,0,0,0),(119,1,'','2019-11-04 11:01:09','','','project_task_updated',2,20,0,0,0,0,0,0,0,117,0,0,0,0,0,0,0,0,0,0),(120,1,'','2019-11-04 11:02:11','','','project_task_created',1,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(121,1,'','2019-11-04 11:53:18','','','project_task_created',2,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(122,1,'','2019-11-04 12:24:00','','','project_task_updated',1,19,0,0,0,0,0,0,0,120,0,0,0,0,0,0,0,0,0,0),(123,1,'','2019-11-08 12:49:27','','','project_task_updated',1,19,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,0),(124,1,'','2019-11-08 12:51:13','','','project_task_created',1,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(125,1,'','2019-11-08 12:51:37','','','project_task_updated',1,19,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,0),(126,1,'','2019-11-11 09:57:59','','','project_task_updated',1,19,0,0,0,0,0,0,0,124,0,0,0,0,0,0,0,0,0,0),(127,1,'','2019-11-11 09:58:37','','','project_task_updated',1,24,0,0,0,0,0,0,0,125,0,0,0,0,0,0,0,0,0,0),(128,1,'','2019-11-11 10:03:24','3','','project_member_added',1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0),(129,1,'','2019-11-11 10:04:46','3','','project_member_added',2,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0),(130,1,'','2019-11-11 10:05:05','3','','project_task_assigned',2,23,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0),(131,1,'','2019-11-18 10:35:57','','','project_task_updated',1,19,0,0,0,0,0,0,0,127,0,0,0,0,0,0,0,0,0,0),(132,1,'','2019-11-18 11:00:28','','','project_task_updated',1,24,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0),(133,1,'','2019-11-18 11:02:52','','','project_task_updated',1,22,0,0,0,0,0,0,0,129,0,0,0,0,0,0,0,0,0,0),(134,1,'','2019-11-18 11:03:21','','','project_task_updated',1,22,0,0,0,0,0,0,0,130,0,0,0,0,0,0,0,0,0,0),(135,1,'','2019-11-21 17:00:09','3','','project_task_created',1,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(136,1,'','2019-11-21 17:34:43','','','project_task_updated',1,25,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,0),(137,1,'','2019-11-27 10:53:20','','','project_task_updated',1,22,0,0,0,0,0,0,0,133,0,0,0,0,0,0,0,0,0,0),(138,1,'','2019-11-27 10:53:24','','','project_task_updated',1,24,0,0,0,0,0,0,0,134,0,0,0,0,0,0,0,0,0,0),(139,1,'','2019-12-06 11:22:27','','','project_task_updated',1,24,0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,0,0),(140,1,'','2019-12-06 11:25:02','','','project_task_updated',1,21,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,0),(141,1,'','2019-12-06 11:25:18','','','project_task_updated',2,20,0,0,0,0,0,0,0,137,0,0,0,0,0,0,0,0,0,0),(142,1,'','2019-12-06 11:28:57','3','','project_task_created',1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(143,1,'','2019-12-06 11:29:10','','','project_task_updated',1,26,0,0,0,0,0,0,0,139,0,0,0,0,0,0,0,0,0,0),(144,1,'','2019-12-06 11:29:54','','','project_task_updated',1,24,0,0,0,0,0,0,0,140,0,0,0,0,0,0,0,0,0,0),(145,1,'','2019-12-06 11:30:19','','','project_task_updated',1,26,0,0,0,0,0,0,0,141,0,0,0,0,0,0,0,0,0,0),(146,1,'','2019-12-06 11:31:28','','','project_task_updated',1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(147,1,'','2019-12-06 11:34:25','','','project_task_updated',1,26,0,0,0,0,0,0,0,142,0,0,0,0,0,0,0,0,0,0),(148,1,'','2019-12-06 11:37:03','','','project_task_updated',1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(149,1,'','2019-12-06 11:37:36','','','project_task_updated',1,24,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,0),(150,1,'','2019-12-06 11:37:55','','','project_task_updated',1,24,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,0),(151,1,'','2019-12-06 12:26:54','3','','project_task_created',2,27,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(152,1,'','2019-12-06 12:31:36','','','project_task_created',4,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(153,1,'','2019-12-06 12:32:55','','','project_task_updated',1,26,0,0,0,0,0,0,0,147,0,0,0,0,0,0,0,0,0,0),(154,1,'','2019-12-06 12:33:26','','','project_task_updated',1,26,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,0),(155,1,'','2019-12-12 11:39:43','3','','project_task_created',2,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(156,1,'','2019-12-12 11:40:08','','','project_task_updated',4,28,0,0,0,0,0,0,0,150,0,0,0,0,0,0,0,0,0,0),(157,1,'','2019-12-13 16:19:20','','','project_task_updated',4,28,0,0,0,0,0,0,0,151,0,0,0,0,0,0,0,0,0,0),(158,1,'','2019-12-13 16:24:51','','','project_task_updated',4,28,0,0,0,0,0,0,0,152,0,0,0,0,0,0,0,0,0,0),(159,1,'','2019-12-19 10:54:54','3','','project_task_created',1,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(160,1,'','2019-12-19 10:56:57','','','project_task_updated',4,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(161,1,'','2019-12-19 13:07:37','','','project_task_updated',4,28,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,0),(162,1,'','2019-12-19 13:08:27','','','project_task_updated',4,28,0,0,0,0,0,0,0,155,0,0,0,0,0,0,0,0,0,0),(163,1,'','2019-12-19 13:13:22','','','project_task_created',4,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(164,1,'','2019-12-19 13:13:48','','','project_task_updated',1,30,0,0,0,0,0,0,0,157,0,0,0,0,0,0,0,0,0,0),(165,1,'','2019-12-19 13:13:49','','','project_task_updated',1,30,0,0,0,0,0,0,0,158,0,0,0,0,0,0,0,0,0,0),(166,1,'','2019-12-19 13:14:49','','','project_task_updated',4,31,0,0,0,0,0,0,0,159,0,0,0,0,0,0,0,0,0,0),(167,1,'','2019-12-19 13:16:29','','','project_task_updated',4,31,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,0),(168,1,'','2021-10-06 15:22:08','','','project_task_created',16,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(169,1,'','2021-10-07 17:14:31','','','project_task_created',16,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(170,1,'','2021-10-07 17:14:35','','','project_task_updated',16,55,0,0,0,0,0,0,0,232,0,0,0,0,0,0,0,0,0,0),(171,1,'','2021-10-07 17:14:37','','','project_task_updated',16,54,0,0,0,0,0,0,0,233,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT 0,
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_payment_amount` double NOT NULL DEFAULT 0,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` (`id`, `title`, `type`, `description`, `online_payable`, `available_on_invoice`, `minimum_payment_amount`, `settings`, `deleted`) VALUES (1,'Cash','custom','Pagos en efectivo',0,0,0,'a:0:{}',0),(2,'Stripe','stripe','Stripe online payments',1,0,0,'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}',0),(3,'PayPal Payments Standard','paypal_payments_standard','PayPal Pagos Pagos en línea estándar',1,0,0,'a:4:{s:15:\"pay_button_text\";s:15:\"PayPal Standard\";s:5:\"email\";s:18:\"perucaos@gmail.com\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}',0),(4,'BCP SOLES: 19132190113065','custom','Nro de cuenta: 	19132190113065\nInterbancario:  00349101307554877681\nA NOMBRE: 		Cesar Auris',0,0,0,'a:0:{}',0),(5,'BCP DOL.ARES : 19103395291185','custom','Nro de cuenta: 	19103395291185\nInterbancario:  00219110339529118557\nA NOMBRE: 		Cesar Auris',0,0,0,'a:0:{}',0),(6,'INTERBANK DOLARES: 4913075548776','custom','Nro de cuenta: 	4913075548776\nInterbancario:  00349101307554877681\nA NOMBRE: 		Cesar Auris',0,0,0,'a:0:{}',0),(7,'INTERBANK SOLES: 1653095564068','custom','Nro de cuenta: 	1653095564068\nInterbancario:  00316501309556406880\nA NOMBRE: 		Cesar Auris',0,0,0,'a:0:{}',0);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipn_hash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `created_by`, `created_at`, `description`, `post_id`, `share_with`, `files`, `deleted`) VALUES (1,1,'2019-10-25 15:59:48','primera',0,'','a:0:{}',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_comments`
--

DROP TABLE IF EXISTS `project_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL DEFAULT 0,
  `customer_feedback_id` int(11) NOT NULL DEFAULT 0,
  `files` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_comments`
--

LOCK TABLES `project_comments` WRITE;
/*!40000 ALTER TABLE `project_comments` DISABLE KEYS */;
INSERT INTO `project_comments` (`id`, `created_by`, `created_at`, `description`, `project_id`, `comment_id`, `task_id`, `file_id`, `customer_feedback_id`, `files`, `deleted`) VALUES (1,1,'2019-08-14 20:45:08','modificando velocidad  del mobil parte:https://i.imgur.com/WSHieQJ.png',1,0,1,0,0,'a:0:{}',0),(2,1,'2019-09-25 10:21:02','lo que se realizara es enviar un correo a cada  cliente con un reporte de exesos de velocidad panico de un dia  anterior',1,0,16,0,0,'a:0:{}',0),(3,1,'2020-01-29 11:12:47','',1,0,35,0,0,'a:1:{i:0;a:2:{s:9:\"file_name\";s:47:\"project_comment_file5e31aeff26d4a-OUTLOOK_2.jpg\";s:9:\"file_size\";s:5:\"48046\";}}',0),(4,1,'2020-01-30 10:45:18','tener en cuenta dev:\n//-------------------------------------------------\n $hourMin=$date_report.\" 05:30:00\";\n $hourMax=$date_report.\" 18:30:00\";\n//-------------------------------------------------\n\n   if ($obj->fecha &lt; $hourMin or $obj->fecha > $hourMax) {\n                        $temp_driving_off_schedule[]=$obj->fecha;\n                    }\n',1,0,35,0,0,'a:0:{}',0),(5,1,'2020-02-04 16:58:32','',1,0,37,0,0,'a:1:{i:0;a:2:{s:9:\"file_name\";s:60:\"project_comment_file5e39e9085ba48-IMG_20200204_162635097.jpg\";s:9:\"file_size\";s:5:\"64465\";}}',0),(6,1,'2020-04-19 15:17:57','- lunes  information para una buena importacion de bases de datos en : https://www.postgresql.org/docs/',2,0,46,0,0,'a:0:{}',0),(7,1,'2020-04-19 15:18:36','- martes realizando pruebas locales para hacer backups',2,0,46,0,0,'a:0:{}',0),(8,1,'2020-04-19 15:19:47','- miercoles revisando y analizando esquemas y tablas de la base de datos marino y terrestre',2,0,46,0,0,'a:0:{}',0),(9,1,'2020-04-19 15:21:01','-jueves realizando un backup de tablas menos pesadas',2,0,46,0,0,'a:0:{}',0),(10,1,'2020-04-19 15:22:06','- jueves realizando backup de esquemas y tablas marino',2,0,46,0,0,'a:0:{}',0),(11,1,'2020-04-19 15:23:24','- viernes se importaron la inforacion pero da errrores revisando aplicacion y base de datos marino',2,0,46,0,0,'a:0:{}',0),(12,1,'2020-04-20 16:00:54','---LUNES 20 DE ABRIL\nse comenzó a realizar el backup de la base de datos marino desde el día 7 del presente mes\nen esos días se realizo.\n- información para una buena importación de bases de datos en : https://www.postgresql.org/docs/\n- realizando pruebas locales para hacer backups\n- revisando y analizando esquemas y tablas de la base de datos marino\n- realizando un backup de tablas menos pesadas\n- realizando backup de esquemas y tablas marino\n- importaron la información, pero da errores revisando aplicación y base de datos marino\n- corrección de errores de importación de base de datos\n\ndía de hoy 20 de abril\nbackup de toda la base de datos y corrección de errores en la aplicación de https://gspmarino.geosupply.com.pe/\n\nmañana 21 de abril\nse comenzará a realizar pruebas con las tablas exportadas\n',2,0,46,0,0,'a:0:{}',0),(13,1,'2020-04-21 17:20:44','---MARTES 21 DE ABRIL\n\n---- día de hoy 21 de abril\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :datos\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :dessarrollo\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :tiger\nbackup de estructuras y procedimientos y secuencias de base de datos terrestre esquema :tiger_data\nschema \n\n------mañana 22 de abril\nbackup de tablas livianas de base de datos terrestre esquema :datos',2,0,46,0,0,'a:0:{}',0);
/*!40000 ALTER TABLE `project_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
INSERT INTO `project_files` (`id`, `file_name`, `description`, `file_size`, `created_at`, `project_id`, `uploaded_by`, `deleted`) VALUES (1,'_file5ef824021aabd-E9pDN5FdY6.jpg','constancia de pago',95630,'2020-06-28 00:00:50',8,1,0);
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
INSERT INTO `project_members` (`id`, `user_id`, `project_id`, `is_leader`, `deleted`) VALUES (1,1,1,1,0),(2,1,2,1,0),(3,1,3,1,0),(4,3,1,0,0),(5,3,2,0,0),(6,1,4,1,0),(7,1,5,1,0),(8,1,6,1,0),(9,1,7,1,0),(10,1,8,1,0),(11,1,9,1,0),(12,1,10,1,0),(13,1,11,1,0),(14,1,12,1,0),(15,1,13,1,0),(16,1,14,1,0),(17,1,15,1,0),(18,1,16,1,0),(19,1,17,1,0),(20,1,18,1,0),(21,1,19,1,0),(22,1,20,1,0),(23,1,21,1,0),(24,1,22,1,0),(25,1,23,1,0);
/*!40000 ALTER TABLE `project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_settings`
--

DROP TABLE IF EXISTS `project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_settings` (
  `project_id` int(11) NOT NULL,
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `unique_index` (`project_id`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_settings`
--

LOCK TABLES `project_settings` WRITE;
/*!40000 ALTER TABLE `project_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_time`
--

DROP TABLE IF EXISTS `project_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('open','logged','approved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_time`
--

LOCK TABLES `project_time` WRITE;
/*!40000 ALTER TABLE `project_time` DISABLE KEYS */;
INSERT INTO `project_time` (`id`, `project_id`, `user_id`, `start_time`, `end_time`, `status`, `note`, `task_id`, `deleted`) VALUES (1,16,1,'2021-10-06 15:18:05','2021-10-13 18:34:31','logged','ya esta',55,0);
/*!40000 ALTER TABLE `project_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `status` enum('open','completed','hold','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `title`, `description`, `start_date`, `deadline`, `client_id`, `created_date`, `created_by`, `status`, `labels`, `price`, `starred_by`, `estimate_id`, `deleted`) VALUES (1,'Geo - Terrestre','','2019-08-14',NULL,1,'2019-08-14',1,'open','trabajo',0,'',0,0),(2,'Otros','',NULL,NULL,1,'2019-08-14',1,'open','trabajo',0,'',0,0),(3,'casa','dad','2019-08-20','2019-08-29',2,'2019-08-20',1,'completed','',1500,'',0,0),(4,'Geo - Marino','',NULL,NULL,1,'2019-12-06',1,'open','trabajo',0,'',0,0),(5,'Geo - Telemetria','',NULL,NULL,1,'2020-01-23',1,'open','trabajo',0,'',0,0),(6,'Servicio Técnico Anual','servicio de técnico de computadoras',NULL,NULL,3,'2020-02-18',1,'open','pago servicio tecnico',110,'',0,0),(7,'Creación de Pagina Web','Pago por desarrollo de pagina web tienda virtual','2020-04-27','2020-05-27',4,'2020-06-27',1,'completed','',500,'',0,0),(8,'Creacion de Pagina Web - Vacjet.pe','','2020-05-20','2020-06-25',5,'2020-06-27',1,'open','',500,'',0,0),(9,'Creacion de Pagina Web - inversionesletich.com','','2020-06-29','2020-06-29',6,'2020-06-29',1,'open','',0,'',0,0),(10,'Creacion de Pagina Web - lissacorp.pe','','2020-10-29','2020-06-29',7,'2020-06-29',1,'open','',0,'',0,0),(11,'pacificobrevetes.com','','2020-08-05','2020-08-31',3,'2020-08-05',1,'open','',0,'',0,0),(12,'Creacion dePagina Web','solo esta  pagando por el diseño el ya  tiene  hosting y dominio:\n\nref de Diseños:\n\n https://www.ciset.es/\nhttps://percoms.com.pe/\n','2020-11-17',NULL,8,'2020-12-03',1,'open','',0,'',0,0),(13,'Creación de Web con Hosting y dominio','Una  web de Curso online:\n\n---este   fue  bien trabajoso\n\n-700 la  web\n- hosting y  dominio 350\n-subia  a  de curos  80\n\n','2020-10-28',NULL,9,'2020-12-03',1,'open','',0,'',0,0),(14,'Pagina web','','2021-01-07','2021-01-29',10,'2021-01-12',1,'open','',0,'',0,0),(15,'Creacion de pagina Web','ya se  configuro el correo  falat al web','2021-01-20','2021-02-28',11,'2021-01-21',1,'open','pago web',850,'',0,0),(16,'Aplicacion de sincronizacion SoftLink a Web','Este  aplicativo se instalo en el servidor para  sincronizar  el tipo de cambio el stock y los precios de los productos','2021-09-04','2021-10-06',4,'2021-10-06',1,'completed','proyecto adiconales',350,'',0,0),(17,'pago correo google bussines','',NULL,NULL,4,'2021-11-13',1,'open','',0,'',0,0),(18,'Servicio tecnicos','','2022-01-12','2022-01-19',4,'2022-01-12',1,'open','',0,'',0,0),(19,'Mantenimiento Cabina','',NULL,NULL,13,'2022-01-21',1,'open','pago servicio tecnico',0,'',0,0),(20,'Pagina web','','2022-02-17','2022-02-17',12,'2022-02-17',1,'open','',0,'',0,0),(21,'Creacion de pagina web','','2022-05-17','2022-06-30',14,'2022-05-18',1,'open','cracion pagina web',0,'',0,0),(22,'Pago de Correo Corporativo Google Bussines','','2022-09-08','2024-01-31',13,'2022-09-08',1,'open','correo corporativo google',7,'',0,0),(23,'corporacionpacifico.com.pe','creacion de pagina web','2022-11-09','2022-11-09',3,'2022-11-09',1,'open','pago web',100,'',0,0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `files` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` (`id`, `name`, `description`, `created_by`, `files`, `created_at`, `deleted`) VALUES (1,'sunat','asd',1,'','2019-08-26 22:03:27',0),(2,'','1213',1,'a:1:{i:0;a:2:{s:9:\"file_name\";s:38:\"providers_file5d6558754df4c-linux1.jpg\";s:9:\"file_size\";s:4:\"4090\";}}','2019-08-27 15:44:33',1),(3,'prov 2','sdfsdfsdfsdf',1,'a:1:{i:0;a:2:{s:9:\"file_name\";s:38:\"providers_file5d6558de8c2ea-linux3.jpg\";s:9:\"file_size\";s:5:\"12131\";}}','2019-08-27 15:44:24',1),(4,'vv11-2-3','ewrr--1',1,'a:3:{i:0;a:2:{s:9:\"file_name\";s:38:\"providers_file5d6560f56a6c9-linux1.jpg\";s:9:\"file_size\";s:4:\"4090\";}i:1;a:2:{s:9:\"file_name\";s:38:\"providers_file5d6560f56afde-linux3.jpg\";s:9:\"file_size\";s:5:\"12131\";}i:2;a:2:{s:9:\"file_name\";s:38:\"providers_file5d655e0720ed0-linux3.jpg\";s:9:\"file_size\";s:5:\"12131\";}}','2019-08-28 14:54:47',1);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` (`id`, `name`, `created_by`, `created_at`, `state`, `deleted`) VALUES (1,'report-22',1,'2019-08-26 20:23:51',1,0),(2,'reporte 2-22',1,'2019-08-26 20:22:18',1,0),(3,'reporte 3',0,'2019-08-26 14:54:07',2,0);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `title`, `permissions`, `deleted`) VALUES (1,'Administrador','a:34:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:15:\"ticket_specific\";s:0:\"\";s:12:\"announcement\";s:3:\"all\";s:23:\"help_and_knowledge_base\";s:3:\"all\";s:23:\"can_manage_all_projects\";s:1:\"1\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";s:29:\"team_member_update_permission\";s:3:\"all\";s:38:\"team_member_update_permission_specific\";s:0:\"\";s:27:\"timesheet_manage_permission\";s:3:\"all\";s:36:\"timesheet_manage_permission_specific\";s:0:\"\";s:21:\"disable_event_sharing\";s:1:\"1\";s:22:\"hide_team_members_list\";s:1:\"1\";s:28:\"can_delete_leave_application\";N;}',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'app',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`setting_name`, `setting_value`, `type`, `deleted`) VALUES ('accepted_file_formats','jpg,jpeg,doc','app',0),('allow_partial_invoice_payment_from_clients','1','app',0),('allowed_ip_addresses','','app',0),('app_title','SOLUCIONES SYSTEM - Project Manager - TELEFONO: 937516027','app',0),('company_address','Lima 18, MZ B Lote  9 Urbanización Canto Rey. San Juan de Lurigancho','app',0),('company_email','perucaos@gmail.com','app',0),('company_name','soluciones system  Peru','app',0),('company_phone','937516027','app',0),('company_vat_number','','app',0),('company_website','solucionessytem.com','app',0),('currency_position','left','app',0),('currency_symbol','S/.','app',0),('date_format','Y-m-d','app',0),('decimal_separator','.','app',0),('default_currency','PEN','app',0),('email_protocol','smtp','app',0),('email_sent_from_address','ventas@solucionessystem.com','app',0),('email_sent_from_name','Soluciones System','app',0),('email_smtp_host','smtp.gmail.com','app',0),('email_smtp_pass','cinqdsgwsjmlmybn','app',0),('email_smtp_port','465','app',0),('email_smtp_security_type','ssl','app',0),('email_smtp_user','ventas@solucionessystem.com','app',0),('first_day_of_week','0','app',0),('invoice_color','','app',0),('invoice_footer','<p><br></p>','app',0),('invoice_logo','_file5ff4857382a2d-invoice-logo.png','app',0),('invoice_prefix','','app',0),('invoice_style','style_1','app',0),('item_purchase_code','234234234','app',0),('language','spanish','app',0),('module_announcement','1','app',0),('module_attendance','1','app',0),('module_chat','1','app',0),('module_estimate','1','app',0),('module_estimate_request','1','app',0),('module_event','1','app',0),('module_expense','1','app',0),('module_help','1','app',0),('module_invoice','1','app',0),('module_knowledge_base','1','app',0),('module_leave','1','app',0),('module_message','1','app',0),('module_note','1','app',0),('module_project_timesheet','1','app',0),('module_ticket','1','app',0),('module_timeline','1','app',0),('module_todo','1','app',0),('no_of_decimals','2','app',0),('re_captcha_secret_key','','app',0),('re_captcha_site_key','','app',0),('rows_per_page','10','app',0),('scrollbar','jquery','app',0),('send_bcc_to','','app',0),('send_invoice_due_after_reminder','','app',0),('send_invoice_due_pre_reminder','','app',0),('send_recurring_invoice_reminder_before_creation','','app',0),('show_background_image_in_signin_page','no','app',0),('show_logo_in_signin_page','yes','app',0),('site_logo','_file5ff48535ac8ff-site-logo.png','app',0),('time_format','small','app',0),('timezone','America/Lima','app',0),('user_1_dashboard','','user',0),('user_2_dashboard','','user',0),('user_4_dashboard','','user',0);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `digg` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pinterest` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `github` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tumblr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `vine` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` (`id`, `title`, `key_name`, `color`, `sort`, `deleted`) VALUES (1,'To Do','to_do','#F9A52D',0,0),(2,'In progress','in_progress','#1672B9',1,0),(3,'Done','done','#00B393',2,0),(4,'archivos','','#83c340',3,0);
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT 0,
  `assigned_to` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` tinyint(4) NOT NULL DEFAULT 1,
  `status` enum('to_do','in_progress','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `status_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `collaborators` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `title`, `description`, `project_id`, `milestone_id`, `assigned_to`, `deadline`, `labels`, `points`, `status`, `status_id`, `start_date`, `collaborators`, `sort`, `deleted`) VALUES (1,'clonar y condicionar sistema de alerta de marino a terrestre','clonar y condicionar sistema de alerta de marino a terrestre',1,0,1,NULL,'',5,'to_do',4,'2019-08-14','',9997500,0),(2,'Apoyo para  el manual del sistema maritimo y terrestre','este  apoyo es para  crear un manual para  presentarlo para  el iso 27001',2,0,1,NULL,'apoyo',5,'to_do',4,'2019-08-14','',9995000,0),(3,'agregar la opcion de poner  el maximo de velocidad por vehiculo','',1,0,0,NULL,'',1,'to_do',3,'2019-08-14','',4999259,0),(4,'reunion con italo para ver tema de ipd','nos  reunimos  con italo',2,0,1,NULL,'',1,'to_do',4,'2019-08-15','',9999500,0),(5,'creación de manuales de usuario para el sistema','por requerimiento de wilian se requiere un manual de los sistemas de  la plataforma maritima y terrestre',2,0,1,NULL,'documentacion',1,'to_do',4,'2019-08-16','',9999125,0),(6,'reporte de 2017 CRUZ_CARGO_646 ','De: Manuel Espinoza <mmespinoza> \nEnviado el: martes, 20 de agosto de 2019 09:11\nPara: cc@geosupply.com.pe; operaciones@geosupply.com.pe\nCC: icarhuaya@gibarcena.com.pe; \'Joel Varela\' <jvarela>\nAsunto: Solicitud de tracking - -Unidad 0646T\n\nSres. Geosupply,\n  Se solicita el recorrido de unidad 0646T – placa: C2Y-773  ( en formato para descargo legal ) :\n\n• Fecha : 28/12/17 00:00 y 28/12/17  10:00 horas\n\nA la espera de pronta atención.\n',1,0,1,NULL,'',1,'to_do',4,'2019-08-20','',9998000,0),(7,'Solicitud de Tracking - CRUZ_CARGO_646','a pedido de centro de control',1,0,0,NULL,'reporte',1,'to_do',3,'2019-08-22','',10200000,0),(8,'Mejoras de diseño de manual - Maritimo','por pedido del señor gabriel habra  que hacer unas mejoras al manual de usuario. haciendo referencia a linkan a todas las plataformas. lo que  es  telemetria',2,0,0,NULL,'',1,'to_do',3,'2019-08-26','',10025000,0),(9,'actualizacion de framework plataforma gspterrestre','actualizo version de codeigniter de la 2 a la 3.1.9\nhttps://i.imgur.com/C0zT2T8.png',1,0,0,NULL,'',1,'to_do',3,'2019-08-27','',9998500,0),(10,'Mejora del manual terrestre','',2,0,0,NULL,'',1,'to_do',3,'2019-08-28','',9999000,0),(11,'Alerta de somnolencia','creacion de alerta de sueño cuando el conductor se queda  dormido',2,0,0,NULL,'',1,'to_do',3,'2019-08-28','',-483,0),(12,'agregar alerta de no transmision','si un mobil deja de transmitir por un dia  que genere un alerta de no transmision',1,0,1,NULL,'',5,'to_do',4,'2019-09-04','',9998500,0),(13,'revision de reporte anglo american','revisar y averiguar que problema hay  con los reportes de angloamerican',1,0,1,NULL,'',4,'to_do',4,'2019-09-16','',9995500,0),(14,'Actualización de aplicación de alertas terrestre','por sugerencia de laura delgado se requiere actualizar la aplicacion para que los mobiles en estado inactivo no generen alertas',1,0,1,'2019-09-23','',1,'to_do',4,'2019-09-23','',9997000,0),(15,'se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web','1. se subieron los cambios de alertas generadas para  que  el cliente  pueda ver y exportar sus alertas de panico , velocidad, somnolencia desde la plataforma web',1,0,1,NULL,'',1,'to_do',4,'2019-09-12','',9999250,0),(16,'quitar alertas de velocidad en aplicativo','Buenas tardes César, \n\nPor favor tener en cuenta las observaciones de Laura y Juan Carlos, ya que en efecto, al estar activo el aplicativo en referencia, implica que en todo momento esté sonando una alerta, puesto que siempre hay unidades que exceden el límite máximo de velocidad; y como bien lo menciona Juan Carlos, en estos casos lo ideal sería que se automatice un mensaje de notificación dirigido al cliente directamente. \nEn lo que respecta a las alertas de pánico, estas son gestionadas desde la plataforma de monitoreo, y al activarse también en el aplicativo, supone tener que realizar una doble labor (desactivarlas en la plataforma y en el aplicativo). No obstante; el aplicativo podría ser útil en caso de que por algún motivo no podamos acceder a la plataforma. \n\nPor otra parte, lo que sería de gran utilidad es que todo tipo de alertas (excesos de velocidad, pánico, apertura de puerta, etc.) se almacenen en una tabla distinta, de tal manera que si un cliente requiere por ejemplo un reporte de excesos de velocidad del último mes, pueda acceder a este, sin necesidad de descargar todo el contenido de un reporte ordinario. \n',1,0,1,'2019-09-26','aplicativo',3,'to_do',4,'2019-08-25','',9996500,0),(17,'reporte de las unidades 7358 y 7366','por pedido de  joel',1,0,1,'2019-09-25','',1,'to_do',4,'2019-09-25','',9996000,0),(18,'Reunion 4pm','una  reunion en la  sala del señor gabriel',2,0,1,'2019-10-23','',2,'to_do',4,'2019-10-23','',9999000,0),(19,'agregar tipos de alertas en terreste','(este  proceso implica realizar varios cambios en los módulos, cambios  en al base de datos, servicios en el servidor amazon)  tiempo desarrollo 2 semanas , con la base de datos y  servidor amazon que realizaba italo tejada lo realizare este pudiese tomar 2 o tres  días  mas.\n',1,0,1,'2019-11-12','',4,'to_do',4,'2019-10-28','',9990500,0),(20,'problema de sistema de alertas','hay un problema con la sistema de monitoreo',2,0,1,'2019-11-30','',2,'to_do',4,'2019-10-30','',9994000,0),(21,'registros duplicados de terreste','',1,0,1,'2019-10-30','',1,'to_do',4,'2019-10-30','',9994500,0),(22,'agregar sistema de alertas por sms','',1,0,1,'2019-11-21','',1,'to_do',4,'2019-11-15','',9991000,0),(23,'Creation de prototypo de la nueva  plataforma de telemetria linkan','crear o coordinar para  realizar nuevo prototipo para  la  plataforma linkan',2,0,3,NULL,'apoyo',5,'to_do',1,NULL,'',0,0),(24,'agregar opcion para  silenciar alertas en aplicacion centro control','',1,0,1,'2019-12-05','',2,'to_do',4,'2019-11-26','',9991500,0),(25,'problema al querer agregar un usuario en a plataforma','',1,0,1,'2019-11-22','',2,'to_do',4,'2019-11-21','',9990000,0),(26,'Actualizar ventana de ultimos reportes','se requiere que  la venta de ultimos reportes se igual a la plataforma antigua con los colores y con todas las  opciones extras que  tiene ella ',1,0,1,NULL,'postergado',3,'to_do',1,NULL,'',10000000,1),(27,'Implementar Opcion de alertas sms para Plataforma terreste','se requieres implementar  que  las  alertas de panico se generen sms',2,0,0,'2019-12-16','',1,'to_do',1,'2019-12-09','',0,0),(28,'Implementar alertas panico por sms en plataforma marino','creaciond e alertas de  panico',4,0,1,'2019-12-19','',1,'to_do',4,'2019-12-06','',9992000,0),(29,'revision de CONCYTEC ','mediante  el correo que  mando el señor gabriel:\nCésar, si no estas inscrito, debes inscribirte en este directorio nacional de profesionales en el ámbito de ciencia, tecnología e innovación   que gestiona el CONCYTEC. Tu serás el técnico en este proyecto que se llamará LINKAN.',2,0,1,'2019-12-12','documentacion',1,'to_do',4,'2019-12-12','',9993000,0),(30,'En la unidad cruz_cargo_1006  SOS observacion','Buenas tardes Estimado Cesar,\n\nEn la unidad cruz_cargo_1006 esta reportando una alerta de apertura de puerta pero cuando entras a detalles de dicha unidad aparece que no hubiera esa alerta\n\nhttps://i.imgur.com/MTn2wDE.png\n\nhttps://i.imgur.com/0LiIdhD.png\n',1,0,1,NULL,'',1,'to_do',4,NULL,'',9993500,1),(31,'Actualizacion de aplicacion de monitoreo con vista sms ','se  requiere una  actualizacion de la aplicacion de monitoreo para  que  puedan visualizar las alertas de panico. ya que  en la  web si  se  puede  ver  pero en el aplicativo no se ve',4,0,1,'2019-12-25','',1,'to_do',4,'2019-12-19','',9992500,0),(32,'Prototipo de aplicacion Telemetria','se q requires un prototipo para  la plataforma',5,0,1,'2020-01-27','',1,'to_do',3,'2020-01-20','',-466,0),(33,'Creacion de Modulo de  mantenimiento','modulo de  mantenimiento\n\n-- revision tecnica\n-- \n',1,0,1,NULL,'',1,'to_do',1,NULL,'',0,1),(34,'Ayuda a restablecer Correo zimbra','',1,0,1,'2020-01-22','apoyo',1,'to_do',3,'2020-01-22','',0,0),(35,'Reportes de alertas personalizadas Anglo american','pedido con urgencias',1,0,1,'2020-02-26','anlgoamerica,pedido cliente',1,'to_do',3,NULL,'',-1466,0),(36,'hacer un listado en texto de los servicios que tenemos y hemos realizado en las plataforma de lo que tenemos y lo que nos  falta','',2,0,1,'2020-02-03','documentacion',1,'to_do',4,'2020-02-03','',9990250,0),(37,'Añadir la opcion de enviar reporte de ubicacion por correo.solicitado por contratacion CORPAC','cliente de melissa  estrada',1,0,1,NULL,'',1,'to_do',1,NULL,'',0,1),(38,'reporte para ver unidades y los telefonos asignados  a ellos','id , placa nombre del mobil y el celular del mobil\nagregarlo en la plataforma para  que  se  pueda  exportar\n',1,0,1,NULL,'jhony centro control',1,'to_do',3,NULL,'',-1216,0),(39,'Crear super usuario Admin','por requerimiento de cruz del sur. se requiere crear un usuario que pueda crear usuarios y asignar mobiles a los mismos',1,0,0,'2020-02-18','cruz del sur',1,'to_do',3,'2020-02-14','',0,0),(40,'Modificar Formulario para crear TRAMARSA','César buenas tardes,\nPor favor, modificar el formulario de creación unidad nueva (tm_mobil), se debe considerar un ítem que indique, si la unidad reportará a SIMTRAC.\n',1,0,1,'2020-02-25','',1,'to_do',3,'2020-02-25','',-966,0),(41,'Añadir Campos a la  tabla data_canbus_hoy','modificar tabla y visualizar campos. por pedido de willian perez',1,0,1,'2020-02-25','',1,'to_do',3,'2020-02-25','',0,0),(42,'Implementacion de Geocerca','implementar geocerca para  terrestre',1,0,1,NULL,'geocerca',1,'to_do',2,'2020-02-27','',0,1),(43,'Implementacion de Gestion de Rutas','',1,0,1,NULL,'',1,'to_do',1,NULL,'',0,1),(44,'Modificar plataforma satsensores','https://i.imgur.com/RgBjnNL.png',2,0,1,NULL,'apoyo',1,'to_do',3,'2020-03-12','',0,0),(45,'arreglar error de plataforma factugsp',' asunto correo: REPORTE DE CRUZ DEL SUR ',2,0,1,'2020-03-12','',1,'to_do',3,'2020-03-12','',0,0),(46,'Realizar un backup de la Base de datos Aws','',2,0,1,NULL,'',1,'to_do',3,'2020-04-17','',0,0),(47,'crear diagrma para  willian geocerca','imagen: https://i.imgur.com/2cIyP8D.png',1,0,1,'2020-07-22','',1,'to_do',3,'2020-07-22','',0,0),(48,'generar esquema de geocerca','willian perez  me solicito un modelo de esquema  para las geocercas\nhttps://i.imgur.com/Wj6dLk6.png',1,0,1,'2020-07-22','',1,'to_do',3,'2020-07-22','',0,0),(49,'restaurar backup de noviembre del 2017','el cliente pido un reporte del 23 y 24',1,0,1,'2020-07-23','',1,'to_do',3,'2020-07-23','',0,0),(50,'Cordinacion de essalud','coordinacion e essalud  envio de email y llamar por telefono',1,0,1,'2020-07-23','',1,'to_do',3,'2020-07-23','',0,0),(51,'Arreglar reportes de canbus sale error al sacar reporte por fechas','',1,0,1,'2020-07-24','',1,'to_do',3,'2020-07-24','',0,0),(52,'Arreglando errores de Canbus','aun habia errores al sacar los resultadosd e canbus',1,0,0,'2020-07-27','',1,'to_do',3,'2020-07-27','',0,0),(53,'Resolver problema que un usuario normal no visualiza canbus','',1,0,1,'2020-07-29','',1,'to_do',3,'2020-07-29','',0,0),(54,'Crear Repositorios','se creo los  repos',16,0,1,'2021-09-16','',2,'to_do',3,'2021-09-15','',9999500,0),(55,'Subir Repositorios','',16,0,1,'2021-10-07','',1,'to_do',3,'2021-10-07','',10000000,0);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` (`id`, `title`, `percentage`, `deleted`) VALUES (1,'IGV (18%)',18,0);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`id`, `title`, `members`, `deleted`) VALUES (1,'American team','1',0);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member_job_info`
--

DROP TABLE IF EXISTS `team_member_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_member_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `salary` double NOT NULL DEFAULT 0,
  `salary_term` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member_job_info`
--

LOCK TABLES `team_member_job_info` WRITE;
/*!40000 ALTER TABLE `team_member_job_info` DISABLE KEYS */;
INSERT INTO `team_member_job_info` (`id`, `user_id`, `date_of_hire`, `deleted`, `salary`, `salary_term`) VALUES (1,3,'2019-11-11',0,0,'0');
/*!40000 ALTER TABLE `team_member_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_comments`
--

DROP TABLE IF EXISTS `ticket_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_comments`
--

LOCK TABLES `ticket_comments` WRITE;
/*!40000 ALTER TABLE `ticket_comments` DISABLE KEYS */;
INSERT INTO `ticket_comments` (`id`, `created_by`, `created_at`, `description`, `ticket_id`, `files`, `deleted`) VALUES (1,2,'2019-08-20 20:20:33','tengo un problema con',1,'a:0:{}',0),(2,1,'2019-08-20 20:21:49','puedes  describir mas esto',1,'a:0:{}',0),(3,2,'2019-08-20 20:22:16','si  todo  esta  bien ya  solucionado',1,'a:0:{}',0),(4,1,'2020-06-28 00:03:23',' color del precio\n letras de los titulos mas cortos\n cambiar el boton de carrito\n ponerle color a iconos compartit',2,'a:0:{}',0);
/*!40000 ALTER TABLE `ticket_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
INSERT INTO `ticket_types` (`id`, `title`, `deleted`) VALUES (1,'General Support',0),(2,'Administrador',0);
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `ticket_type_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT 0,
  `labels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `client_id`, `project_id`, `ticket_type_id`, `title`, `created_by`, `created_at`, `status`, `last_activity_at`, `assigned_to`, `labels`, `deleted`) VALUES (1,2,0,1,'nome funcion paso1',2,'2019-08-20 20:20:33','closed','2019-08-20 20:22:16',0,'',0),(2,4,0,1,'Cambios para pcbyte',1,'2020-06-28 00:03:23','closed','2020-06-28 00:03:23',1,'ajustes pagina web',0);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_do`
--

DROP TABLE IF EXISTS `to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `to_do` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('to_do','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do`
--

LOCK TABLES `to_do` WRITE;
/*!40000 ALTER TABLE `to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `to_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('staff','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `notification_checked_at` datetime DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT 0,
  `job_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT 0,
  `note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `sticky_note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT 1,
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `last_online` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_type` (`user_type`),
  KEY `email` (`email`),
  KEY `client_id` (`client_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_type`, `is_admin`, `role_id`, `email`, `password`, `image`, `status`, `message_checked_at`, `client_id`, `notification_checked_at`, `is_primary_contact`, `job_title`, `disable_login`, `note`, `address`, `alternative_address`, `phone`, `alternative_phone`, `dob`, `ssn`, `gender`, `sticky_note`, `skype`, `enable_web_notification`, `enable_email_notification`, `created_at`, `last_online`, `deleted`) VALUES (1,'CESAR','SAGA','staff',1,0,'perucaos@gmail.com','ed3a49213011c269102264e1c73ae60f',NULL,'active','2021-08-27 22:31:34',0,'2021-01-04 18:38:40',0,'Admin',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'male',NULL,NULL,1,1,'2019-08-14 18:19:43','2022-11-10 12:54:09',0),(2,'deysi','auris','client',0,0,'casystemperu@gmail.com','e10adc3949ba59abbe56e057f20f883e',NULL,'active',NULL,2,'2019-08-20 20:25:19',1,'Untitled',0,'',NULL,NULL,'',NULL,NULL,NULL,'female',NULL,'',1,1,'2019-08-20 17:22:54','2019-08-20 21:24:50',1),(3,'Colaborador',' Externo','staff',0,0,'becker.minervaj_t825j@anom.xyz','e10adc3949ba59abbe56e057f20f883e',NULL,'active',NULL,0,NULL,0,'externo',0,NULL,'',NULL,'',NULL,NULL,NULL,'male',NULL,NULL,1,1,'2019-11-11 10:02:04',NULL,0),(4,'Reyna','Gomez','client',0,0,'rgomez@corporacionpacifico.com.pe','4461cdbbda98cb3de3c1277aeeec97a6',NULL,'active',NULL,3,NULL,1,'Administradora',0,'',NULL,NULL,'923412348',NULL,NULL,NULL,'female',NULL,'',1,1,'2020-02-18 16:52:23','2020-02-19 10:04:40',0),(5,'Jhanet ','garcia','client',0,0,'pcbyteventas@gmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,4,NULL,1,'',1,'',NULL,NULL,'',NULL,NULL,NULL,'female',NULL,'',1,1,'2020-06-27 20:24:15',NULL,0),(6,'percy','acero','client',0,0,'ventas@vacjet.pe','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,5,NULL,1,'',0,'',NULL,NULL,'989226076',NULL,NULL,NULL,'male',NULL,'',1,1,'2020-06-27 23:45:30',NULL,0),(7,'Carlos','Letich','client',0,0,'inversiones_luper@hotmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,6,NULL,1,'Administrador',0,'',NULL,NULL,'990002905',NULL,NULL,NULL,'male',NULL,'',1,1,'2020-06-29 19:45:53',NULL,0),(8,'Miguel','Simarrra','client',0,0,'miguel.simarra@lissacorp.pe','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,7,NULL,1,'Administrador',0,'',NULL,NULL,'963827207',NULL,NULL,NULL,'male',NULL,'',1,1,'2020-06-29 20:11:54',NULL,0),(9,'Edgar','Cruz Aranda ','client',0,0,'edgar.090476@gmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,8,NULL,1,'',0,'',NULL,NULL,' 965 672 666',NULL,NULL,NULL,'male',NULL,'',1,1,'2020-12-03 12:25:53',NULL,0),(10,'Moises ','Gamarra','client',0,0,'moises@gmails.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,3,NULL,0,'',0,'',NULL,NULL,'',NULL,NULL,NULL,'male',NULL,'',1,1,'2020-12-03 12:33:01',NULL,0),(11,'Shepard','Shepard','client',0,0,'shepard.ohonsi.bos@gmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,9,NULL,1,'',0,'',NULL,NULL,'',NULL,NULL,NULL,'female',NULL,'',1,1,'2020-12-03 12:56:00',NULL,0),(12,'Luis ','alfredo','client',0,0,'administracion@ldmineriayconstruccion.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,11,NULL,1,'',0,'',NULL,NULL,' 948 414 058',NULL,NULL,NULL,'male',NULL,'',1,1,'2021-01-21 10:32:25',NULL,0),(13,'Roanld','Reyes','client',0,0,'administracion@hdmaquinarias.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,10,NULL,1,'',0,'',NULL,NULL,'',NULL,NULL,NULL,'male',NULL,'',1,1,'2021-01-24 12:48:58',NULL,0),(14,'Toni','Merino','client',0,0,'toni@gmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,12,NULL,1,'',0,'',NULL,NULL,'942 492 125',NULL,NULL,NULL,'male',NULL,'',1,1,'2021-02-15 15:42:28',NULL,0),(15,'Gino','server','client',0,0,'hola@tareastore.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,13,NULL,1,'',1,'',NULL,NULL,'+51 949 150 550',NULL,NULL,NULL,'male',NULL,'',1,1,'2022-01-21 12:08:57',NULL,0),(16,'Dany','otro','client',0,0,'oreo@gmail.com','d41d8cd98f00b204e9800998ecf8427e',NULL,'active',NULL,14,NULL,1,'',0,'',NULL,NULL,'+51 979 635 861',NULL,NULL,NULL,'male',NULL,'',1,1,'2022-05-18 22:37:56',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kpopilrp_projectmanager'
--

--
-- Dumping routines for database 'kpopilrp_projectmanager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 12:54:20
