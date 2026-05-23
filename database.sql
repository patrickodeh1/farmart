-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: farmart
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'oeRSO1ei40Bmr0JH7FclAhbAx8pBbm97',1,'2025-03-28 07:26:27','2025-03-28 07:26:26','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Top Slider Image 1','2030-03-28 00:00:00','not_set','VC2C8Q1UGCBG','promotion/1.jpg','/products',0,1,'published','2025-03-28 07:26:40','2025-03-28 07:26:40',1,NULL,NULL,NULL,NULL),(2,'Homepage middle 1','2030-03-28 00:00:00','not_set','IZ6WU8KUALYD','promotion/2.png','/products',0,2,'published','2025-03-28 07:26:40','2025-03-28 07:26:40',1,NULL,NULL,NULL,NULL),(3,'Homepage middle 2','2030-03-28 00:00:00','not_set','ILSFJVYFGCPZ','promotion/3.png','/products',0,3,'published','2025-03-28 07:26:40','2025-03-28 07:26:40',1,NULL,NULL,NULL,NULL),(4,'Homepage middle 3','2030-03-28 00:00:00','not_set','ZDOZUZZIU7FT','promotion/4.png','/products',0,4,'published','2025-03-28 07:26:40','2025-03-28 07:26:40',1,NULL,NULL,NULL,NULL),(5,'Products list 1','2030-03-28 00:00:00','not_set','ZDOZUZZIU7FZ','promotion/5.png','/products/beat-headphone',0,5,'published','2025-03-28 07:26:40','2025-03-28 07:26:40',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Aut ut dolor architecto incidunt. Maxime rem quasi hic vel nisi. Perspiciatis est non voluptatem voluptatem necessitatibus. Nulla amet ratione voluptatum eum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,'Fashion',0,'Sunt autem recusandae omnis reiciendis. Omnis enim doloremque cum eos. Sint occaecati quia ut doloribus.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(3,'Electronic',0,'Libero rerum perferendis sint. Ipsum qui assumenda et ut. Ducimus nisi modi animi perspiciatis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(4,'Commercial',0,'Voluptatem dolore ex libero vero dolorem. Sunt ut temporibus necessitatibus a soluta enim. Sint minima odit qui a rerum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Hassan Bode','ukris@example.org','+1 (702) 723-4339','26323 Abshire Islands\nElizatown, OK 52257-2374','Qui voluptatibus ut rerum.','Illo distinctio quia facere et accusamus. Inventore exercitationem aliquid at sapiente. Minus natus aut ea blanditiis quae. Pariatur quo accusantium qui. Velit recusandae in qui et. Nemo expedita vitae consequatur occaecati facilis voluptates quia. Voluptas rerum aliquam odit mollitia rerum quaerat vel. Sequi tempora aut eligendi sint et itaque qui eos.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,'Zackery Quitzon DVM','clement.robel@example.com','754.656.6772','4712 Cummerata Mill\nLake Piercechester, ID 86579-7734','At quas enim culpa et nam ipsa.','Nostrum animi adipisci nostrum id quia reprehenderit perspiciatis. Asperiores accusamus et est. Quo veniam rem magni. Eos quia iusto ad inventore. Animi maxime aliquam deleniti a voluptas eum nam. Tempore eos omnis laboriosam ratione ex. Sunt vitae mollitia illum voluptate consequatur iste optio harum. Sint earum molestiae distinctio expedita ea eaque voluptate. Id unde provident et consequatur ut hic animi animi.',NULL,'read','2025-03-28 07:26:40','2025-03-28 07:26:40'),(3,'Prof. Nestor Dickens','pryan@example.com','1-701-439-2966','7992 Tillman Ford\nGudrunside, WA 72610','Vel quas et est labore et recusandae.','Tempora est sunt architecto magnam voluptatibus. Impedit libero ut deleniti sed quisquam officia aut est. Quos voluptatum et debitis nam ex qui. Perspiciatis facilis deleniti et asperiores. In omnis sit et ea ex. Quia culpa veritatis voluptatum aut animi. Laboriosam porro corrupti eum voluptatem eligendi aliquam. Accusantium qui rerum similique voluptas. Et fuga aut omnis quia nisi aut. Praesentium voluptas numquam sint voluptatem ut fuga. Voluptate quam libero dolore qui quia officiis.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(4,'Gaston Torphy','dave61@example.net','(281) 218-6260','1835 Mariano Ramp Suite 342\nPort Rogerland, KS 33964','Vel laudantium blanditiis est quam.','Commodi quis dolor quidem quod totam laudantium impedit qui. Incidunt illum odio sit neque et quis. Et qui commodi aut in vel impedit. Dolorem ut ut unde rerum quis dicta. Consectetur consequatur et atque sed vel. Est rerum consequatur odio dolores tenetur fugit aut. Totam nihil dolore magnam quos eligendi velit culpa. Magnam molestiae non et maiores non voluptate quam.',NULL,'read','2025-03-28 07:26:40','2025-03-28 07:26:40'),(5,'Miss Loyce Aufderhar MD','eosinski@example.net','820-839-6249','17919 Baumbach Causeway\nSchambergerville, PA 40302','Tempore dolorem similique tenetur inventore.','Consequatur occaecati placeat illum esse quis velit. Iure velit et sapiente vitae. Quis nostrum itaque perspiciatis voluptatem. Quis deleniti qui in ullam. Vel ipsam fuga quae ducimus tenetur repudiandae. Eos quia voluptatem nisi fuga quidem autem sapiente. Et debitis cupiditate sequi sit recusandae magnam. Totam eaque ut porro ex autem expedita. Aut fugit repellat vel molestiae recusandae eum.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(6,'Jeramy Ullrich','alicia81@example.org','(617) 608-5625','496 Johnston Place Suite 568\nDarrinstad, WI 59851-8762','Sit consequuntur sit et fuga.','Quo repudiandae maiores corporis labore. Voluptatum illum vel molestiae ut blanditiis nihil. Quidem similique ut enim possimus aut at suscipit. Et qui est fugiat. Saepe atque dolor qui dolorum voluptatem. Magni soluta beatae magni sapiente pariatur harum ad. Voluptas qui fugit voluptatem voluptas placeat unde itaque. Recusandae sunt tempore qui repudiandae. Aspernatur numquam in consequuntur. Incidunt quidem quisquam ut fugiat et. Rem consequatur sunt consequatur optio sit.',NULL,'read','2025-03-28 07:26:40','2025-03-28 07:26:40'),(7,'Ms. Sincere Altenwerth','feil.jonathon@example.org','207-915-4107','170 Emie Throughway Suite 664\nDorrismouth, ND 87428-5998','Dolorum sapiente aut veniam tempora est.','Est nobis odit porro reiciendis est eveniet. Voluptatem assumenda pariatur tenetur et. Iusto amet et quisquam vel et. Fuga aut qui nihil laudantium ut voluptas cumque. Molestias voluptatem accusantium omnis consequatur commodi unde qui. Hic vel odio ducimus quod facilis aut quas. Ea natus error veritatis ut consequatur laborum. Nisi sint at cum alias qui quo. Est molestiae mollitia sint laudantium. Voluptatem laudantium molestiae ut eius non incidunt.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(8,'Yvonne Bednar','pedro.kiehn@example.com','1-830-449-6437','57831 Madaline Radial Suite 811\nWest Corrineside, IA 53500-6504','Est dolor ex nihil alias magnam voluptates.','Occaecati veritatis expedita exercitationem quidem tempore. Tenetur aut ea eos. Dicta aut rerum illo repellat omnis. In quia asperiores est sunt ut voluptatem omnis nihil. Voluptatem maxime consectetur aut quia similique et. Inventore qui consectetur sint. Aliquid maiores molestias est rerum consequatur. Fugit ipsum quis aut rerum culpa quia molestiae. Impedit non ducimus laboriosam. Libero fugiat vel nostrum aut. Voluptas ab modi vitae sed voluptas eum in.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(9,'Vidal Ernser','xpadberg@example.org','(678) 669-2779','186 Terrill Village Suite 710\nPadbergland, OH 20307','Iste natus est esse incidunt.','Sunt tempora non exercitationem voluptatem a. Autem quia cum sint debitis ut nisi odio. Recusandae pariatur ducimus nulla necessitatibus ut sunt cum. Sunt non commodi molestiae sint. Deserunt perspiciatis velit sed qui ab sequi provident. Hic excepturi soluta ab et vel numquam ut minima. Sunt delectus nihil voluptatum itaque quod. Perspiciatis odio voluptates a aut.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40'),(10,'Trinity Vandervort','lesly.nitzsche@example.org','920-959-9570','6571 Travis Ridge Suite 163\nNew Ernest, IN 72051','Vel et est natus voluptas laboriosam.','Fugit qui nisi vero maiores labore at veritatis. Tenetur similique incidunt qui et rem. Qui vel pariatur et velit. Ea consequatur et natus suscipit et. Omnis distinctio velit sed eum doloremque. Odio voluptatem pariatur dolorum ut animi. Vel cupiditate ut illum occaecati. Qui fugit et consectetur atque labore labore.',NULL,'unread','2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'FoodPound','New Snacks Release',NULL,'brands/1.png','published',0,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,'iTea JSC','Happy Tea 100% Organic. From $29.9',NULL,'brands/2.png','published',1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,'Soda Brand','Fresh Meat Sausage. BUY 2 GET 1!',NULL,'brands/3.png','published',2,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,'Farmart','Fresh Meat Sausage. BUY 2 GET 1!',NULL,'brands/4.png','published',3,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(5,'Soda Brand','Fresh Meat Sausage. BUY 2 GET 1!',NULL,'brands/3.png','published',4,1,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,'EUR','€',0,2,1,0,0.84,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,'VND','₫',0,0,2,0,23203,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,'NGN','₦',1,2,2,0,895.52,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Thurman Little','customer@botble.com','+17812445677','AQ','Utah','Lesleyshire','989 Florian Creek',1,1,'2025-03-28 07:26:28','2025-03-28 07:26:28','24502-5015'),(2,'Thurman Little','customer@botble.com','+18506126852','CD','Oregon','West Leafort','187 Green Loop',1,0,'2025-03-28 07:26:28','2025-03-28 07:26:28','05184'),(3,'Alexanne Krajcik','vendor@botble.com','+18726466930','PW','North Carolina','Handmouth','4994 Hettinger Circles Apt. 303',2,1,'2025-03-28 07:26:28','2025-03-28 07:26:28','49499-1517'),(4,'Alexanne Krajcik','vendor@botble.com','+12817539008','TW','Wyoming','Ericport','233 Lela Fields Apt. 582',2,0,'2025-03-28 07:26:28','2025-03-28 07:26:28','60921-5749'),(5,'Dr. Brennan Casper DVM','miracle53@example.net','+13477831013','RS','Alabama','Jeffmouth','668 Emmy Mountain',3,1,'2025-03-28 07:26:28','2025-03-28 07:26:28','14676-3383'),(6,'Sean Stamm','bergnaum.maye@example.com','+12109538172','CD','Alabama','Reichelton','905 Jordane Ridge Suite 874',4,1,'2025-03-28 07:26:28','2025-03-28 07:26:28','53476'),(7,'Lurline Mante','kole.gaylord@example.com','+14704370359','NE','Delaware','Lake Alda','344 Kuhic Ford Suite 124',5,1,'2025-03-28 07:26:29','2025-03-28 07:26:29','87759-1500'),(8,'Judy Ritchie V','kkunze@example.com','+17184729951','AU','New Jersey','New Macview','2731 Bell Mission',6,1,'2025-03-28 07:26:29','2025-03-28 07:26:29','96144'),(9,'Mittie Rosenbaum','kale47@example.org','+17753823017','NI','Missouri','South Earnestine','7589 Ruecker Bypass',7,1,'2025-03-28 07:26:29','2025-03-28 07:26:29','06640-0682'),(10,'Merritt Waelchi','alec.littel@example.org','+14174126294','SI','Oregon','New Alyssonfort','3967 Kuhn Cliff',8,1,'2025-03-28 07:26:29','2025-03-28 07:26:29','11168'),(11,'Muhammad Murazik','ddonnelly@example.org','+12606835177','TG','Wisconsin','New Libbiechester','94137 Lavonne Row Apt. 669',9,1,'2025-03-28 07:26:30','2025-03-28 07:26:30','08465'),(12,'Kennedi Oberbrunner','kmills@example.com','+19517062278','KR','South Dakota','North Tia','6852 Kenton Fords',10,1,'2025-03-28 07:26:30','2025-03-28 07:26:30','98165');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `block_reason` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  `stripe_account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Thurman Little','customer@botble.com','$2y$12$9ir.FUoE1Ukeh26dmbBkQuvtDplXmI/SMlM7le1aMkQLv9ONXkD6.','customers/10.jpg','1987-03-12','+17185744952',NULL,'2025-03-28 07:26:28','2025-03-28 07:26:28','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(2,'Alexanne Krajcik','vendor@botble.com','$2y$12$bYFMHddvj4cJam9rB8yRlORm8PdflVLxvo10uGoKwV.FYG2LMiA7a','customers/9.jpg','1999-03-13','+19364523669',NULL,'2025-03-28 07:26:28','2025-03-28 07:26:38','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(3,'Dr. Brennan Casper DVM','miracle53@example.net','$2y$12$86eK4HBuQlR/rHoc9uC1j.kM0sF1te3ebymijeki55zyZjRhYhAV6','customers/1.jpg','1985-03-22','+13345568083',NULL,'2025-03-28 07:26:28','2025-03-28 07:26:38','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(4,'Sean Stamm','bergnaum.maye@example.com','$2y$12$jnj6oK9YsDM0TtrID9wuEOUTJN3FnOeVwSRqS3B7u/iORm7HfwjKy','customers/2.jpg','1980-03-08','+16073098978',NULL,'2025-03-28 07:26:28','2025-03-28 07:26:38','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(5,'Lurline Mante','kole.gaylord@example.com','$2y$12$3oQgrpPERnErlq.MENBBBeEm9lnjyjOZAfsjkff4mUpdhAKNUz95u','customers/3.jpg','1992-03-12','+13525453098',NULL,'2025-03-28 07:26:29','2025-03-28 07:26:38','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(6,'Judy Ritchie V','kkunze@example.com','$2y$12$Zd4oCR5TiieJVNLHNsRNfObTLE5VUE0G8NriZfp6O38jwV5sJT4rG','customers/4.jpg','1975-03-14','+15204266239',NULL,'2025-03-28 07:26:29','2025-03-28 07:26:39','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(7,'Mittie Rosenbaum','kale47@example.org','$2y$12$c.zMKP4Q9b/91/pXyxQRyuhDCrILw0JHJ5YKUK3IqH8xd93aY4Lp.','customers/5.jpg','1998-03-17','+18208584281',NULL,'2025-03-28 07:26:29','2025-03-28 07:26:39','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(8,'Merritt Waelchi','alec.littel@example.org','$2y$12$sd7FUJpzT7Foez9hMefZYeGkTxIiNxVLjcnfSNxBtHSDGZCqieQYO','customers/6.jpg','1987-03-09','+16294443168',NULL,'2025-03-28 07:26:29','2025-03-28 07:26:39','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,1,'2025-03-28 14:26:38',NULL,0),(9,'Muhammad Murazik','ddonnelly@example.org','$2y$12$o672JAU0R8I954M81rjEIOhFv9kj4kscm/bdoalmz32/a7x4KqW1q','customers/7.jpg','1996-03-20','+12085503518',NULL,'2025-03-28 07:26:30','2025-03-28 07:26:39','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(10,'Kennedi Oberbrunner','kmills@example.com','$2y$12$BnuqOZaUQNbrZGFHLdxpReKzlrm26BR.BX4O6Xfv50hkd/fM/I4Wu','customers/8.jpg','1989-03-22','+15415122811',NULL,'2025-03-28 07:26:30','2025-03-28 07:26:39','2025-03-28 14:26:28',NULL,'activated',NULL,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `can_use_with_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
INSERT INTO `ec_discounts` VALUES (1,'Discount 1','NDG2RLZFZLRO','2025-03-27 14:26:37',NULL,NULL,0,377,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(2,'Discount 2','UZXLMWHGQV1P','2025-03-27 14:26:37',NULL,NULL,0,21,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(3,'Discount 3','D3GTH8JIAUTO','2025-03-27 14:26:37',NULL,NULL,0,720,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(4,'Discount 4','DQIUCSJKRXIW','2025-03-27 14:26:37','2025-04-09 14:26:37',NULL,0,834,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(5,'Discount 5','14O7ZROSLLIR','2025-03-27 14:26:37','2025-04-18 14:26:37',NULL,0,584,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(6,'Discount 6','O6BMYSAOEYZJ','2025-03-27 14:26:37','2025-04-13 14:26:37',NULL,0,899,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(7,'Discount 7','TCMYPNWMP2TF','2025-03-27 14:26:37','2025-04-09 14:26:37',NULL,0,364,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(8,'Discount 8','Y2INDJNL12MP','2025-03-27 14:26:37',NULL,NULL,0,40,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(9,'Discount 9','DBI52HEEAHZN','2025-03-27 14:26:37','2025-03-29 14:26:37',NULL,0,784,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL),(10,'Discount 10','GYEOWUW7C85N','2025-03-27 14:26:37','2025-03-30 14:26:37',NULL,0,89,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,NULL);
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,53,276.21,18,1),(1,24,403.4712,8,4),(1,45,745.82,15,2),(1,43,105.4,8,4),(1,22,396.06,13,3),(1,33,280.5,7,4),(1,12,82.44,11,2),(1,3,12.58,15,1),(1,10,715.72,6,3),(1,64,219.9528,16,1);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Winter Sale','2025-04-27 00:00:00','published','2025-03-28 07:26:37','2025-03-28 07:26:37');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'1 Year',0,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,1,'2 Year',10,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,1,'3 Year',20,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,2,'4GB',0,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(5,2,'8GB',10,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(6,2,'16GB',20,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(7,3,'Core i5',0,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(8,3,'Core i7',10,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(9,3,'Core i9',20,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(10,4,'128GB',0,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(11,4,'256GB',10,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(12,4,'512GB',20,9999,0,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT '0',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_histories`
--

DROP TABLE IF EXISTS `ec_order_return_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_return_id` bigint unsigned NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_histories`
--

LOCK TABLES `ec_order_return_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_return_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `cancellation_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2025-03-28 07:26:27','2025-03-28 07:26:27',0),(2,'Size','size','text',1,1,1,'published',1,'2025-03-28 07:26:27','2025-03-28 07:26:27',0),(3,'Weight','weight','text',1,1,1,'published',0,'2025-03-28 07:26:27','2025-03-28 07:26:27',0),(4,'Boxes','boxes','text',1,1,1,'published',1,'2025-03-28 07:26:27','2025-03-28 07:26:27',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,1,'Blue','blue','#333333',NULL,0,2,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,1,'Red','red','#DA323F',NULL,0,3,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,1,'Black','black','#2F366C',NULL,0,4,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(5,1,'Brown','brown','#87554B',NULL,0,5,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(6,2,'S','s',NULL,NULL,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(7,2,'M','m',NULL,NULL,0,2,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(8,2,'L','l',NULL,NULL,0,3,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(9,2,'XL','xl',NULL,NULL,0,4,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(10,2,'XXL','xxl',NULL,NULL,0,5,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(11,3,'1KG','1kg',NULL,NULL,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(12,3,'2KG','2kg',NULL,NULL,0,2,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(13,3,'3KG','3kg',NULL,NULL,0,3,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(14,3,'4KG','4kg',NULL,NULL,0,4,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(15,3,'5KG','5kg',NULL,NULL,0,5,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(16,4,'1 Box','1-box',NULL,NULL,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(17,4,'2 Boxes','2-boxes',NULL,NULL,0,2,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(18,4,'3 Boxes','3-boxes',NULL,NULL,0,3,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(19,4,'4 Boxes','4-boxes',NULL,NULL,0,4,'2025-03-28 07:26:27','2025-03-28 07:26:27'),(20,4,'5 Boxes','5-boxes',NULL,NULL,0,5,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Fruits & Vegetables',0,NULL,'published',0,'product-categories/1.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-star',NULL),(2,'Fruits',1,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(3,'Apples',2,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(4,'Bananas',2,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(5,'Berries',2,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(6,'Oranges & Easy Peelers',2,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(7,'Grapes',2,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(8,'Lemons & Limes',2,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(9,'Peaches & Nectarines',2,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(10,'Pears',2,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(11,'Melon',2,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(12,'Avocados',2,NULL,'published',9,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(13,'Plums & Apricots',2,NULL,'published',10,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(14,'Vegetables',1,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(15,'Potatoes',14,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(16,'Carrots & Root Vegetables',14,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(17,'Broccoli & Cauliflower',14,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(18,'Cabbage, Spinach & Greens',14,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(19,'Onions, Leeks & Garlic',14,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(20,'Mushrooms',14,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(21,'Tomatoes',14,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(22,'Beans, Peas & Sweetcorn',14,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(23,'Freshly Drink Orange Juice',14,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(24,'Breads Sweets',0,NULL,'published',1,'product-categories/2.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-bread',NULL),(25,'Crisps, Snacks & Nuts',24,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(26,'Crisps & Popcorn',25,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(27,'Nuts & Seeds',25,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(28,'Lighter Options',25,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(29,'Cereal Bars',25,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(30,'Breadsticks & Pretzels',25,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(31,'Fruit Snacking',25,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(32,'Rice & Corn Cakes',25,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(33,'Protein & Energy Snacks',25,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(34,'Toddler Snacks',25,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(35,'Meat Snacks',25,NULL,'published',9,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(36,'Beans',25,NULL,'published',10,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(37,'Lentils',25,NULL,'published',11,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(38,'Chickpeas',25,NULL,'published',12,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(39,'Tins & Cans',24,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(40,'Tomatoes',39,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(41,'Baked Beans, Spaghetti',39,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(42,'Fish',39,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(43,'Beans & Pulses',39,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(44,'Fruit',39,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(45,'Coconut Milk & Cream',39,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(46,'Lighter Options',39,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(47,'Olives',39,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(48,'Sweetcorn',39,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(49,'Carrots',39,NULL,'published',9,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(50,'Peas',39,NULL,'published',10,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(51,'Mixed Vegetables',39,NULL,'published',11,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(52,'Frozen Seafoods',0,NULL,'published',2,'product-categories/3.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-hamburger',NULL),(53,'Raw Meats',0,NULL,'published',3,'product-categories/4.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-steak',NULL),(54,'Wines & Alcohol Drinks',0,NULL,'published',4,'product-categories/5.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-glass',NULL),(55,'Ready Meals',54,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(56,'Meals for 1',55,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(57,'Meals for 2',55,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(58,'Indian',55,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(59,'Italian',55,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(60,'Chinese',55,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(61,'Traditional British',55,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(62,'Thai & Oriental',55,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(63,'Mediterranean & Moroccan',55,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(64,'Mexican & Caribbean',55,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(65,'Lighter Meals',55,NULL,'published',9,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(66,'Lunch & Veg Pots',55,NULL,'published',10,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(67,'Salad & Herbs',54,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(68,'Salad Bags',67,NULL,'published',0,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(69,'Cucumber',67,NULL,'published',1,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(70,'Tomatoes',67,NULL,'published',2,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(71,'Lettuce',67,NULL,'published',3,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(72,'Lunch Salad Bowls',67,NULL,'published',4,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(73,'Lunch Salad Bowls',67,NULL,'published',5,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(74,'Fresh Herbs',67,NULL,'published',6,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(75,'Avocados',67,NULL,'published',7,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(76,'Peppers',67,NULL,'published',8,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(77,'Coleslaw & Potato Salad',67,NULL,'published',9,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(78,'Spring Onions',67,NULL,'published',10,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(79,'Chilli, Ginger & Garlic',67,NULL,'published',11,NULL,0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,NULL),(80,'Tea & Coffee',0,NULL,'published',5,'product-categories/6.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-teacup',NULL),(81,'Milks and Dairies',0,NULL,'published',6,'product-categories/7.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-coffee-cup',NULL),(82,'Pet Foods',0,NULL,'published',7,'product-categories/8.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-hotdog',NULL),(83,'Food Cupboard',0,NULL,'published',8,'product-categories/1.png',1,'2025-03-28 07:26:27','2025-03-28 07:26:27','icon-cheese',NULL);
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,21),(1,23),(2,7),(2,22),(2,33),(2,39),(2,48),(2,62),(3,14),(3,46),(4,14),(4,19),(4,26),(4,42),(5,20),(5,48),(5,51),(6,13),(6,33),(6,36),(6,64),(8,58),(9,9),(10,63),(11,7),(11,11),(11,19),(11,30),(11,32),(11,56),(11,63),(12,4),(12,27),(12,36),(12,56),(13,2),(13,22),(13,31),(13,34),(14,22),(14,42),(14,46),(14,47),(15,37),(16,28),(16,51),(16,61),(17,53),(18,3),(19,1),(19,23),(19,24),(19,29),(19,48),(19,61),(20,16),(20,17),(20,18),(20,33),(20,40),(20,45),(20,57),(20,58),(20,62),(21,3),(21,11),(21,13),(21,25),(21,32),(22,1),(22,6),(22,19),(22,42),(23,9),(23,32),(23,60),(24,2),(25,14),(26,4),(26,25),(26,49),(27,38),(27,39),(27,43),(27,59),(27,60),(27,64),(28,8),(28,31),(28,36),(29,10),(29,26),(29,50),(29,53),(29,55),(29,65),(30,61),(31,3),(31,30),(32,4),(32,65),(33,17),(34,18),(34,50),(34,52),(35,13),(35,49),(36,9),(36,10),(36,32),(36,38),(36,43),(37,2),(37,6),(37,24),(38,5),(38,15),(39,40),(39,48),(39,52),(40,7),(40,12),(40,16),(40,26),(40,62),(41,4),(41,43),(42,5),(42,55),(42,58),(43,20),(43,36),(43,44),(43,57),(43,60),(43,63),(44,19),(44,26),(44,40),(45,16),(45,24),(45,64),(46,9),(46,15),(46,30),(46,54),(46,56),(47,5),(47,12),(47,27),(47,30),(47,59),(48,1),(48,6),(48,28),(48,45),(49,15),(49,21),(49,34),(49,43),(49,54),(50,35),(51,51),(52,18),(52,21),(52,35),(52,38),(52,42),(52,54),(52,57),(53,28),(53,34),(54,12),(54,37),(55,17),(55,33),(55,41),(55,46),(55,50),(55,55),(55,58),(56,17),(57,34),(58,20),(58,29),(58,47),(59,31),(60,8),(60,11),(60,35),(60,64),(61,10),(61,23),(61,29),(61,35),(61,63),(62,31),(62,51),(62,59),(63,10),(63,20),(63,44),(63,53),(63,60),(64,14),(65,23),(65,25),(65,39),(65,41),(66,15),(66,21),(66,27),(67,3),(67,44),(68,13),(68,18),(68,49),(68,53),(68,54),(70,6),(71,41),(71,49),(71,52),(72,7),(72,56),(73,44),(73,46),(73,47),(73,52),(74,8),(74,41),(75,1),(75,25),(75,29),(75,47),(75,55),(76,8),(76,16),(76,38),(76,57),(77,2),(77,22),(77,45),(77,62),(78,37),(78,61),(78,65),(79,12),(80,27),(80,28),(80,39),(80,40),(80,45),(80,59),(80,65),(81,37),(82,24),(82,50),(83,5),(83,11);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,4),(1,7),(1,9),(1,16),(1,17),(1,23),(1,25),(1,28),(1,30),(1,31),(1,35),(1,39),(1,40),(1,47),(1,54),(1,55),(1,56),(1,59),(1,61),(1,63),(1,64),(1,65),(2,1),(2,2),(2,5),(2,10),(2,12),(2,18),(2,19),(2,20),(2,21),(2,26),(2,27),(2,37),(2,41),(2,42),(2,49),(2,57),(2,58),(2,62),(3,3),(3,6),(3,8),(3,11),(3,13),(3,14),(3,15),(3,22),(3,24),(3,29),(3,32),(3,33),(3,34),(3,36),(3,38),(3,43),(3,44),(3,45),(3,46),(3,48),(3,50),(3,51),(3,52),(3,53),(3,60);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,3,0,0.00,'fixed',1),(1,16,0,0.00,'fixed',1),(1,38,0,0.00,'fixed',1),(1,48,0,0.00,'fixed',1),(1,50,0,0.00,'fixed',1),(1,51,0,0.00,'fixed',1),(1,65,0,0.00,'fixed',1),(2,6,0,0.00,'fixed',1),(2,19,0,0.00,'fixed',1),(2,39,0,0.00,'fixed',1),(2,45,0,0.00,'fixed',1),(2,52,0,0.00,'fixed',1),(2,64,0,0.00,'fixed',1),(2,65,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,28,0,0.00,'fixed',1),(3,40,0,0.00,'fixed',1),(3,41,0,0.00,'fixed',1),(3,51,0,0.00,'fixed',1),(3,55,0,0.00,'fixed',1),(4,18,0,0.00,'fixed',1),(4,27,0,0.00,'fixed',1),(4,30,0,0.00,'fixed',1),(4,43,0,0.00,'fixed',1),(4,44,0,0.00,'fixed',1),(4,49,0,0.00,'fixed',1),(4,58,0,0.00,'fixed',1),(5,4,0,0.00,'fixed',1),(5,8,0,0.00,'fixed',1),(5,21,0,0.00,'fixed',1),(5,30,0,0.00,'fixed',1),(5,39,0,0.00,'fixed',1),(5,43,0,0.00,'fixed',1),(5,51,0,0.00,'fixed',1),(6,5,0,0.00,'fixed',1),(6,12,0,0.00,'fixed',1),(6,22,0,0.00,'fixed',1),(6,25,0,0.00,'fixed',1),(6,28,0,0.00,'fixed',1),(6,34,0,0.00,'fixed',1),(6,62,0,0.00,'fixed',1),(7,17,0,0.00,'fixed',1),(7,18,0,0.00,'fixed',1),(7,19,0,0.00,'fixed',1),(7,23,0,0.00,'fixed',1),(7,24,0,0.00,'fixed',1),(7,30,0,0.00,'fixed',1),(7,50,0,0.00,'fixed',1),(8,1,0,0.00,'fixed',1),(8,16,0,0.00,'fixed',1),(8,23,0,0.00,'fixed',1),(8,25,0,0.00,'fixed',1),(8,32,0,0.00,'fixed',1),(8,59,0,0.00,'fixed',1),(9,13,0,0.00,'fixed',1),(9,29,0,0.00,'fixed',1),(9,38,0,0.00,'fixed',1),(9,59,0,0.00,'fixed',1),(9,60,0,0.00,'fixed',1),(9,63,0,0.00,'fixed',1),(10,2,0,0.00,'fixed',1),(10,23,0,0.00,'fixed',1),(10,25,0,0.00,'fixed',1),(10,30,0,0.00,'fixed',1),(10,37,0,0.00,'fixed',1),(10,38,0,0.00,'fixed',1),(10,41,0,0.00,'fixed',1),(11,1,0,0.00,'fixed',1),(11,13,0,0.00,'fixed',1),(11,21,0,0.00,'fixed',1),(11,24,0,0.00,'fixed',1),(11,36,0,0.00,'fixed',1),(11,47,0,0.00,'fixed',1),(11,63,0,0.00,'fixed',1),(12,18,0,0.00,'fixed',1),(12,31,0,0.00,'fixed',1),(12,32,0,0.00,'fixed',1),(12,48,0,0.00,'fixed',1),(12,50,0,0.00,'fixed',1),(12,57,0,0.00,'fixed',1),(12,61,0,0.00,'fixed',1),(13,19,0,0.00,'fixed',1),(13,22,0,0.00,'fixed',1),(13,27,0,0.00,'fixed',1),(13,31,0,0.00,'fixed',1),(13,33,0,0.00,'fixed',1),(13,37,0,0.00,'fixed',1),(13,42,0,0.00,'fixed',1),(14,11,0,0.00,'fixed',1),(14,24,0,0.00,'fixed',1),(14,35,0,0.00,'fixed',1),(14,45,0,0.00,'fixed',1),(14,53,0,0.00,'fixed',1),(14,62,0,0.00,'fixed',1),(14,63,0,0.00,'fixed',1),(15,18,0,0.00,'fixed',1),(15,20,0,0.00,'fixed',1),(15,40,0,0.00,'fixed',1),(15,45,0,0.00,'fixed',1),(15,49,0,0.00,'fixed',1),(15,53,0,0.00,'fixed',1),(15,61,0,0.00,'fixed',1),(16,2,0,0.00,'fixed',1),(16,7,0,0.00,'fixed',1),(16,35,0,0.00,'fixed',1),(16,37,0,0.00,'fixed',1),(16,38,0,0.00,'fixed',1),(16,48,0,0.00,'fixed',1),(16,63,0,0.00,'fixed',1),(17,15,0,0.00,'fixed',1),(17,22,0,0.00,'fixed',1),(17,33,0,0.00,'fixed',1),(17,37,0,0.00,'fixed',1),(17,46,0,0.00,'fixed',1),(17,47,0,0.00,'fixed',1),(18,9,0,0.00,'fixed',1),(18,19,0,0.00,'fixed',1),(18,27,0,0.00,'fixed',1),(18,29,0,0.00,'fixed',1),(18,49,0,0.00,'fixed',1),(18,54,0,0.00,'fixed',1),(18,61,0,0.00,'fixed',1),(19,1,0,0.00,'fixed',1),(19,7,0,0.00,'fixed',1),(19,13,0,0.00,'fixed',1),(19,29,0,0.00,'fixed',1),(19,42,0,0.00,'fixed',1),(19,51,0,0.00,'fixed',1),(19,59,0,0.00,'fixed',1),(20,25,0,0.00,'fixed',1),(20,29,0,0.00,'fixed',1),(20,37,0,0.00,'fixed',1),(20,58,0,0.00,'fixed',1),(20,59,0,0.00,'fixed',1),(20,63,0,0.00,'fixed',1),(21,1,0,0.00,'fixed',1),(21,16,0,0.00,'fixed',1),(21,20,0,0.00,'fixed',1),(21,35,0,0.00,'fixed',1),(21,38,0,0.00,'fixed',1),(21,39,0,0.00,'fixed',1),(21,52,0,0.00,'fixed',1),(22,6,0,0.00,'fixed',1),(22,10,0,0.00,'fixed',1),(22,25,0,0.00,'fixed',1),(22,37,0,0.00,'fixed',1),(22,44,0,0.00,'fixed',1),(22,58,0,0.00,'fixed',1),(22,61,0,0.00,'fixed',1),(23,13,0,0.00,'fixed',1),(23,17,0,0.00,'fixed',1),(23,24,0,0.00,'fixed',1),(23,28,0,0.00,'fixed',1),(23,30,0,0.00,'fixed',1),(23,33,0,0.00,'fixed',1),(23,41,0,0.00,'fixed',1),(24,2,0,0.00,'fixed',1),(24,6,0,0.00,'fixed',1),(24,7,0,0.00,'fixed',1),(24,32,0,0.00,'fixed',1),(24,37,0,0.00,'fixed',1),(24,41,0,0.00,'fixed',1),(24,51,0,0.00,'fixed',1),(25,1,0,0.00,'fixed',1),(25,26,0,0.00,'fixed',1),(25,33,0,0.00,'fixed',1),(25,45,0,0.00,'fixed',1),(25,51,0,0.00,'fixed',1),(25,63,0,0.00,'fixed',1),(25,65,0,0.00,'fixed',1),(26,16,0,0.00,'fixed',1),(26,20,0,0.00,'fixed',1),(26,22,0,0.00,'fixed',1),(26,36,0,0.00,'fixed',1),(26,40,0,0.00,'fixed',1),(26,45,0,0.00,'fixed',1),(27,13,0,0.00,'fixed',1),(27,28,0,0.00,'fixed',1),(27,29,0,0.00,'fixed',1),(27,38,0,0.00,'fixed',1),(27,40,0,0.00,'fixed',1),(27,43,0,0.00,'fixed',1),(27,53,0,0.00,'fixed',1),(28,14,0,0.00,'fixed',1),(28,16,0,0.00,'fixed',1),(28,20,0,0.00,'fixed',1),(28,37,0,0.00,'fixed',1),(28,50,0,0.00,'fixed',1),(28,62,0,0.00,'fixed',1),(29,3,0,0.00,'fixed',1),(29,11,0,0.00,'fixed',1),(29,25,0,0.00,'fixed',1),(29,35,0,0.00,'fixed',1),(29,56,0,0.00,'fixed',1),(29,59,0,0.00,'fixed',1),(30,14,0,0.00,'fixed',1),(30,15,0,0.00,'fixed',1),(30,34,0,0.00,'fixed',1),(30,43,0,0.00,'fixed',1),(30,49,0,0.00,'fixed',1),(30,52,0,0.00,'fixed',1),(30,62,0,0.00,'fixed',1),(31,12,0,0.00,'fixed',1),(31,25,0,0.00,'fixed',1),(31,27,0,0.00,'fixed',1),(31,35,0,0.00,'fixed',1),(31,42,0,0.00,'fixed',1),(31,50,0,0.00,'fixed',1),(31,61,0,0.00,'fixed',1),(32,17,0,0.00,'fixed',1),(32,33,0,0.00,'fixed',1),(32,43,0,0.00,'fixed',1),(32,50,0,0.00,'fixed',1),(32,61,0,0.00,'fixed',1),(32,64,0,0.00,'fixed',1),(33,9,0,0.00,'fixed',1),(33,25,0,0.00,'fixed',1),(33,28,0,0.00,'fixed',1),(33,43,0,0.00,'fixed',1),(33,61,0,0.00,'fixed',1),(34,4,0,0.00,'fixed',1),(34,12,0,0.00,'fixed',1),(34,26,0,0.00,'fixed',1),(34,29,0,0.00,'fixed',1),(34,52,0,0.00,'fixed',1),(34,63,0,0.00,'fixed',1),(35,3,0,0.00,'fixed',1),(35,22,0,0.00,'fixed',1),(35,25,0,0.00,'fixed',1),(35,34,0,0.00,'fixed',1),(35,41,0,0.00,'fixed',1),(35,55,0,0.00,'fixed',1),(35,61,0,0.00,'fixed',1),(36,18,0,0.00,'fixed',1),(36,20,0,0.00,'fixed',1),(36,24,0,0.00,'fixed',1),(36,25,0,0.00,'fixed',1),(36,31,0,0.00,'fixed',1),(36,40,0,0.00,'fixed',1),(36,60,0,0.00,'fixed',1),(37,1,0,0.00,'fixed',1),(37,2,0,0.00,'fixed',1),(37,4,0,0.00,'fixed',1),(37,32,0,0.00,'fixed',1),(37,33,0,0.00,'fixed',1),(37,43,0,0.00,'fixed',1),(37,57,0,0.00,'fixed',1),(38,10,0,0.00,'fixed',1),(38,18,0,0.00,'fixed',1),(38,33,0,0.00,'fixed',1),(38,49,0,0.00,'fixed',1),(38,51,0,0.00,'fixed',1),(38,52,0,0.00,'fixed',1),(38,65,0,0.00,'fixed',1),(39,6,0,0.00,'fixed',1),(39,26,0,0.00,'fixed',1),(39,27,0,0.00,'fixed',1),(39,33,0,0.00,'fixed',1),(39,57,0,0.00,'fixed',1),(39,61,0,0.00,'fixed',1),(39,65,0,0.00,'fixed',1),(40,16,0,0.00,'fixed',1),(40,17,0,0.00,'fixed',1),(40,23,0,0.00,'fixed',1),(40,25,0,0.00,'fixed',1),(40,38,0,0.00,'fixed',1),(40,46,0,0.00,'fixed',1),(40,59,0,0.00,'fixed',1),(41,21,0,0.00,'fixed',1),(41,23,0,0.00,'fixed',1),(41,35,0,0.00,'fixed',1),(41,39,0,0.00,'fixed',1),(41,40,0,0.00,'fixed',1),(41,46,0,0.00,'fixed',1),(41,55,0,0.00,'fixed',1),(42,3,0,0.00,'fixed',1),(42,4,0,0.00,'fixed',1),(42,16,0,0.00,'fixed',1),(42,23,0,0.00,'fixed',1),(42,25,0,0.00,'fixed',1),(42,64,0,0.00,'fixed',1),(43,6,0,0.00,'fixed',1),(43,18,0,0.00,'fixed',1),(43,42,0,0.00,'fixed',1),(43,45,0,0.00,'fixed',1),(43,52,0,0.00,'fixed',1),(43,56,0,0.00,'fixed',1),(43,62,0,0.00,'fixed',1),(44,10,0,0.00,'fixed',1),(44,18,0,0.00,'fixed',1),(44,26,0,0.00,'fixed',1),(44,39,0,0.00,'fixed',1),(44,41,0,0.00,'fixed',1),(44,50,0,0.00,'fixed',1),(44,61,0,0.00,'fixed',1),(45,14,0,0.00,'fixed',1),(45,15,0,0.00,'fixed',1),(45,25,0,0.00,'fixed',1),(45,33,0,0.00,'fixed',1),(45,35,0,0.00,'fixed',1),(45,55,0,0.00,'fixed',1),(45,57,0,0.00,'fixed',1),(46,15,0,0.00,'fixed',1),(46,21,0,0.00,'fixed',1),(46,24,0,0.00,'fixed',1),(46,36,0,0.00,'fixed',1),(46,53,0,0.00,'fixed',1),(46,57,0,0.00,'fixed',1),(46,62,0,0.00,'fixed',1),(47,5,0,0.00,'fixed',1),(47,8,0,0.00,'fixed',1),(47,13,0,0.00,'fixed',1),(47,15,0,0.00,'fixed',1),(47,27,0,0.00,'fixed',1),(47,50,0,0.00,'fixed',1),(47,63,0,0.00,'fixed',1),(48,7,0,0.00,'fixed',1),(48,16,0,0.00,'fixed',1),(48,18,0,0.00,'fixed',1),(48,21,0,0.00,'fixed',1),(48,32,0,0.00,'fixed',1),(48,50,0,0.00,'fixed',1),(48,55,0,0.00,'fixed',1),(49,7,0,0.00,'fixed',1),(49,9,0,0.00,'fixed',1),(49,10,0,0.00,'fixed',1),(49,23,0,0.00,'fixed',1),(49,45,0,0.00,'fixed',1),(49,52,0,0.00,'fixed',1),(49,60,0,0.00,'fixed',1),(50,1,0,0.00,'fixed',1),(50,10,0,0.00,'fixed',1),(50,14,0,0.00,'fixed',1),(50,21,0,0.00,'fixed',1),(50,56,0,0.00,'fixed',1),(50,61,0,0.00,'fixed',1),(51,1,0,0.00,'fixed',1),(51,12,0,0.00,'fixed',1),(51,30,0,0.00,'fixed',1),(51,38,0,0.00,'fixed',1),(51,47,0,0.00,'fixed',1),(51,56,0,0.00,'fixed',1),(51,60,0,0.00,'fixed',1),(52,17,0,0.00,'fixed',1),(52,23,0,0.00,'fixed',1),(52,27,0,0.00,'fixed',1),(52,38,0,0.00,'fixed',1),(52,40,0,0.00,'fixed',1),(52,48,0,0.00,'fixed',1),(52,55,0,0.00,'fixed',1),(53,4,0,0.00,'fixed',1),(53,20,0,0.00,'fixed',1),(53,35,0,0.00,'fixed',1),(53,49,0,0.00,'fixed',1),(53,50,0,0.00,'fixed',1),(53,55,0,0.00,'fixed',1),(54,1,0,0.00,'fixed',1),(54,9,0,0.00,'fixed',1),(54,14,0,0.00,'fixed',1),(54,23,0,0.00,'fixed',1),(54,28,0,0.00,'fixed',1),(54,31,0,0.00,'fixed',1),(54,64,0,0.00,'fixed',1),(55,9,0,0.00,'fixed',1),(55,16,0,0.00,'fixed',1),(55,19,0,0.00,'fixed',1),(55,22,0,0.00,'fixed',1),(55,38,0,0.00,'fixed',1),(55,45,0,0.00,'fixed',1),(56,18,0,0.00,'fixed',1),(56,19,0,0.00,'fixed',1),(56,41,0,0.00,'fixed',1),(56,58,0,0.00,'fixed',1),(56,61,0,0.00,'fixed',1),(56,65,0,0.00,'fixed',1),(57,11,0,0.00,'fixed',1),(57,19,0,0.00,'fixed',1),(57,23,0,0.00,'fixed',1),(57,33,0,0.00,'fixed',1),(57,39,0,0.00,'fixed',1),(57,41,0,0.00,'fixed',1),(57,43,0,0.00,'fixed',1),(58,15,0,0.00,'fixed',1),(58,17,0,0.00,'fixed',1),(58,32,0,0.00,'fixed',1),(58,49,0,0.00,'fixed',1),(58,54,0,0.00,'fixed',1),(58,60,0,0.00,'fixed',1),(58,64,0,0.00,'fixed',1),(59,13,0,0.00,'fixed',1),(59,26,0,0.00,'fixed',1),(59,29,0,0.00,'fixed',1),(59,54,0,0.00,'fixed',1),(59,56,0,0.00,'fixed',1),(60,1,0,0.00,'fixed',1),(60,10,0,0.00,'fixed',1),(60,12,0,0.00,'fixed',1),(60,15,0,0.00,'fixed',1),(60,16,0,0.00,'fixed',1),(60,18,0,0.00,'fixed',1),(60,47,0,0.00,'fixed',1),(61,32,0,0.00,'fixed',1),(61,42,0,0.00,'fixed',1),(61,45,0,0.00,'fixed',1),(61,47,0,0.00,'fixed',1),(61,53,0,0.00,'fixed',1),(62,4,0,0.00,'fixed',1),(62,16,0,0.00,'fixed',1),(62,23,0,0.00,'fixed',1),(62,30,0,0.00,'fixed',1),(62,49,0,0.00,'fixed',1),(62,51,0,0.00,'fixed',1),(62,57,0,0.00,'fixed',1),(63,7,0,0.00,'fixed',1),(63,9,0,0.00,'fixed',1),(63,23,0,0.00,'fixed',1),(63,40,0,0.00,'fixed',1),(63,47,0,0.00,'fixed',1),(64,11,0,0.00,'fixed',1),(64,13,0,0.00,'fixed',1),(64,22,0,0.00,'fixed',1),(64,43,0,0.00,'fixed',1),(64,52,0,0.00,'fixed',1),(64,56,0,0.00,'fixed',1),(65,5,0,0.00,'fixed',1),(65,27,0,0.00,'fixed',1),(65,37,0,0.00,'fixed',1),(65,40,0,0.00,'fixed',1),(65,42,0,0.00,'fixed',1),(65,46,0,0.00,'fixed',1),(65,59,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,4,'ecommerce/digital-product-files/4.jpg','{\"filename\":\"4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"4\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(2,4,'ecommerce/digital-product-files/4-1.jpg','{\"filename\":\"4-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"4-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(3,8,'ecommerce/digital-product-files/8.jpg','{\"filename\":\"8.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"8\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(4,8,'ecommerce/digital-product-files/8-1.jpg','{\"filename\":\"8-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"8-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(5,12,'ecommerce/digital-product-files/12.jpg','{\"filename\":\"12.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"12\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(6,12,'ecommerce/digital-product-files/12-1.jpg','{\"filename\":\"12-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"12-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(7,16,'ecommerce/digital-product-files/16.jpg','{\"filename\":\"16.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"16\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(8,20,'ecommerce/digital-product-files/20.jpg','{\"filename\":\"20.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"20\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(9,20,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(10,24,'ecommerce/digital-product-files/24.jpg','{\"filename\":\"24.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(11,24,'ecommerce/digital-product-files/24-1.jpg','{\"filename\":\"24-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(12,28,'ecommerce/digital-product-files/28.jpg','{\"filename\":\"28.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/28.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"28\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(13,28,'ecommerce/digital-product-files/28-1.jpg','{\"filename\":\"28-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/28-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"28-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(14,32,'ecommerce/digital-product-files/32.jpg','{\"filename\":\"32.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"32\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(15,32,'ecommerce/digital-product-files/32-1.jpg','{\"filename\":\"32-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"32-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(16,36,'ecommerce/digital-product-files/36.jpg','{\"filename\":\"36.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/36.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"36\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(17,36,'ecommerce/digital-product-files/36-1.jpg','{\"filename\":\"36-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/36-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"36-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(18,40,'ecommerce/digital-product-files/40.jpg','{\"filename\":\"40.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/40.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"40\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(19,40,'ecommerce/digital-product-files/40-1.jpg','{\"filename\":\"40-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/40-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"40-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(20,44,'ecommerce/digital-product-files/44.jpg','{\"filename\":\"44.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"44\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(21,44,'ecommerce/digital-product-files/44-1.jpg','{\"filename\":\"44-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"44-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(22,48,'ecommerce/digital-product-files/48.jpg','{\"filename\":\"48.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/48.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"48\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(23,48,'ecommerce/digital-product-files/48-1.jpg','{\"filename\":\"48-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/48-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"48-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(24,52,'ecommerce/digital-product-files/52.jpg','{\"filename\":\"52.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"52\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(25,52,'ecommerce/digital-product-files/52-1.jpg','{\"filename\":\"52-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"52-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(26,56,'ecommerce/digital-product-files/56.jpg','{\"filename\":\"56.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/56.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"56\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(27,56,'ecommerce/digital-product-files/56-1.jpg','{\"filename\":\"56-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/56-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"56-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(28,60,'ecommerce/digital-product-files/60.jpg','{\"filename\":\"60.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/60.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"60\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(29,60,'ecommerce/digital-product-files/60-1.jpg','{\"filename\":\"60-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/60-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"60-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(30,64,'ecommerce/digital-product-files/64.jpg','{\"filename\":\"64.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/64.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"64\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(31,64,'ecommerce/digital-product-files/64-1.jpg','{\"filename\":\"64-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/64-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"64-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(32,70,'ecommerce/digital-product-files/8-1.jpg','{\"filename\":\"8-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"8-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(33,71,'ecommerce/digital-product-files/8-2.jpg','{\"filename\":\"8-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"8-2\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(34,72,'ecommerce/digital-product-files/8-3.jpg','{\"filename\":\"8-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"8-3\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(35,81,'ecommerce/digital-product-files/24-1.jpg','{\"filename\":\"24-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(36,82,'ecommerce/digital-product-files/24-2.jpg','{\"filename\":\"24-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24-2\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(37,83,'ecommerce/digital-product-files/24.jpg','{\"filename\":\"24.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(38,84,'ecommerce/digital-product-files/24.jpg','{\"filename\":\"24.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"24\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(39,96,'ecommerce/digital-product-files/32-1.jpg','{\"filename\":\"32-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"32-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(40,100,'ecommerce/digital-product-files/36-1.jpg','{\"filename\":\"36-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/36-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"36-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(41,124,'ecommerce/digital-product-files/56-1.jpg','{\"filename\":\"56-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/56-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"56-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(42,125,'ecommerce/digital-product-files/56-2.jpg','{\"filename\":\"56-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/56-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"56-2\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(43,126,'ecommerce/digital-product-files/56.jpg','{\"filename\":\"56.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/56.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"56\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37'),(44,137,'ecommerce/digital-product-files/64-1.jpg','{\"filename\":\"64-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/64-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-03-28 14:26:37\",\"name\":\"64-1\",\"extension\":\"jpg\"}','2025-03-28 07:26:37','2025-03-28 07:26:37');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,3),(1,9),(1,15),(1,45),(1,54),(1,57),(1,60),(2,6),(2,12),(2,18),(2,21),(2,24),(2,27),(2,30),(2,33),(2,36),(2,39),(2,48),(2,63),(3,42),(3,51);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text_color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#d71e2d','published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(2,'New','#02856e','published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(3,'Sale','#fe9931','published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL);
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute` (
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute`
--

LOCK TABLES `ec_product_specification_attribute` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute` DISABLE KEYS */;
INSERT INTO `ec_product_specification_attribute` VALUES (1,1,'8.2 cm',0,0),(1,2,'46.77 cm',0,0),(1,3,'16.78 cm',0,0),(1,4,'38.85 cm',0,0),(1,5,'93.22 cm',0,0),(2,6,'47.5 cm',0,0),(2,7,'80.15 cm',0,0),(2,8,'2560x1440',0,0),(3,1,'45.61 cm',0,0),(3,2,'4.82 cm',0,0),(3,3,'84.47 cm',0,0),(3,4,'68.83 cm',0,0),(3,5,'77.51 cm',0,0),(4,1,'99.29 cm',0,0),(4,2,'66.78 cm',0,0),(4,3,'16.97 cm',0,0),(4,4,'65.18 cm',0,0),(4,5,'54.51 cm',0,0),(5,6,'88.85 cm',0,0),(5,7,'87 cm',0,0),(5,8,'3840x2160',0,0),(6,6,'60.32 cm',0,0),(6,7,'26.01 cm',0,0),(6,8,'2560x1440',0,0),(7,6,'43.93 cm',0,0),(7,7,'1.62 cm',0,0),(7,8,'1920x1080',0,0),(8,6,'69.32 cm',0,0),(8,7,'34.9 cm',0,0),(8,8,'3840x2160',0,0),(9,1,'64.95 cm',0,0),(9,2,'64.62 cm',0,0),(9,3,'59.64 cm',0,0),(9,4,'54.51 cm',0,0),(9,5,'75.66 cm',0,0),(10,1,'7.21 cm',0,0),(10,2,'18.55 cm',0,0),(10,3,'34.48 cm',0,0),(10,4,'32.48 cm',0,0),(10,5,'41.69 cm',0,0),(11,6,'36.17 cm',0,0),(11,7,'58.41 cm',0,0),(11,8,'2560x1440',0,0),(12,1,'42.35 cm',0,0),(12,2,'40.15 cm',0,0),(12,3,'31.89 cm',0,0),(12,4,'4.93 cm',0,0),(12,5,'71.91 cm',0,0),(13,1,'5.58 cm',0,0),(13,2,'57.72 cm',0,0),(13,3,'16.66 cm',0,0),(13,4,'4.55 cm',0,0),(13,5,'50.4 cm',0,0),(14,6,'95.66 cm',0,0),(14,7,'21.22 cm',0,0),(14,8,'1920x1080',0,0),(15,1,'79.48 cm',0,0),(15,2,'88.96 cm',0,0),(15,3,'20.94 cm',0,0),(15,4,'29.9 cm',0,0),(15,5,'74.21 cm',0,0),(16,1,'67.44 cm',0,0),(16,2,'40.51 cm',0,0),(16,3,'12.63 cm',0,0),(16,4,'97.22 cm',0,0),(16,5,'56.44 cm',0,0),(17,1,'24.44 cm',0,0),(17,2,'63.39 cm',0,0),(17,3,'12.09 cm',0,0),(17,4,'61.47 cm',0,0),(17,5,'45.03 cm',0,0),(18,1,'38.43 cm',0,0),(18,2,'84.29 cm',0,0),(18,3,'87.84 cm',0,0),(18,4,'39.8 cm',0,0),(18,5,'6.2 cm',0,0),(19,6,'94.92 cm',0,0),(19,7,'2 cm',0,0),(19,8,'2560x1440',0,0),(20,6,'43.48 cm',0,0),(20,7,'32.06 cm',0,0),(20,8,'3840x2160',0,0),(21,6,'90.92 cm',0,0),(21,7,'10.4 cm',0,0),(21,8,'3840x2160',0,0),(22,1,'78.46 cm',0,0),(22,2,'1.72 cm',0,0),(22,3,'45.2 cm',0,0),(22,4,'97.7 cm',0,0),(22,5,'10.13 cm',0,0),(23,6,'57.27 cm',0,0),(23,7,'85.31 cm',0,0),(23,8,'2560x1440',0,0),(24,1,'59.62 cm',0,0),(24,2,'12.03 cm',0,0),(24,3,'34.84 cm',0,0),(24,4,'9.65 cm',0,0),(24,5,'53.25 cm',0,0),(25,6,'90.06 cm',0,0),(25,7,'57.75 cm',0,0),(25,8,'1920x1080',0,0),(26,1,'70.98 cm',0,0),(26,2,'31.85 cm',0,0),(26,3,'6.68 cm',0,0),(26,4,'79.41 cm',0,0),(26,5,'16.44 cm',0,0),(27,1,'38.86 cm',0,0),(27,2,'47.35 cm',0,0),(27,3,'41.91 cm',0,0),(27,4,'85.83 cm',0,0),(27,5,'41.39 cm',0,0),(28,6,'19.46 cm',0,0),(28,7,'95.12 cm',0,0),(28,8,'3840x2160',0,0),(29,6,'23.66 cm',0,0),(29,7,'61.13 cm',0,0),(29,8,'1920x1080',0,0),(30,6,'70.25 cm',0,0),(30,7,'29.6 cm',0,0),(30,8,'3840x2160',0,0),(31,6,'54.15 cm',0,0),(31,7,'13.79 cm',0,0),(31,8,'2560x1440',0,0),(32,6,'84.01 cm',0,0),(32,7,'26.58 cm',0,0),(32,8,'1920x1080',0,0),(33,1,'77.43 cm',0,0),(33,2,'3.96 cm',0,0),(33,3,'24.33 cm',0,0),(33,4,'32.7 cm',0,0),(33,5,'65.18 cm',0,0),(34,6,'98.03 cm',0,0),(34,7,'26.89 cm',0,0),(34,8,'3840x2160',0,0),(35,6,'79.13 cm',0,0),(35,7,'98.66 cm',0,0),(35,8,'1920x1080',0,0),(36,6,'99.75 cm',0,0),(36,7,'83.93 cm',0,0),(36,8,'1920x1080',0,0),(37,6,'39.64 cm',0,0),(37,7,'8.46 cm',0,0),(37,8,'1920x1080',0,0),(38,1,'81.19 cm',0,0),(38,2,'64.42 cm',0,0),(38,3,'17.68 cm',0,0),(38,4,'14.07 cm',0,0),(38,5,'79.34 cm',0,0),(39,6,'47.11 cm',0,0),(39,7,'48.96 cm',0,0),(39,8,'2560x1440',0,0),(40,6,'35.02 cm',0,0),(40,7,'42.52 cm',0,0),(40,8,'3840x2160',0,0),(41,1,'12 cm',0,0),(41,2,'58.12 cm',0,0),(41,3,'81.11 cm',0,0),(41,4,'11.75 cm',0,0),(41,5,'41.43 cm',0,0),(42,1,'92.94 cm',0,0),(42,2,'98.86 cm',0,0),(42,3,'16.37 cm',0,0),(42,4,'14.99 cm',0,0),(42,5,'77.52 cm',0,0),(43,1,'85.43 cm',0,0),(43,2,'47.46 cm',0,0),(43,3,'76.78 cm',0,0),(43,4,'95.84 cm',0,0),(43,5,'46.83 cm',0,0),(44,6,'87.31 cm',0,0),(44,7,'8.33 cm',0,0),(44,8,'1920x1080',0,0),(45,1,'32.54 cm',0,0),(45,2,'54.74 cm',0,0),(45,3,'10.26 cm',0,0),(45,4,'40.95 cm',0,0),(45,5,'54.84 cm',0,0),(46,6,'95 cm',0,0),(46,7,'94.44 cm',0,0),(46,8,'2560x1440',0,0),(47,1,'56.38 cm',0,0),(47,2,'64.31 cm',0,0),(47,3,'33.6 cm',0,0),(47,4,'84.9 cm',0,0),(47,5,'11.37 cm',0,0),(48,6,'25.95 cm',0,0),(48,7,'48.95 cm',0,0),(48,8,'3840x2160',0,0),(49,1,'8.91 cm',0,0),(49,2,'55.42 cm',0,0),(49,3,'72.24 cm',0,0),(49,4,'63.77 cm',0,0),(49,5,'38.61 cm',0,0),(50,1,'23.83 cm',0,0),(50,2,'50.67 cm',0,0),(50,3,'80.87 cm',0,0),(50,4,'17.22 cm',0,0),(50,5,'37.27 cm',0,0),(51,1,'30.98 cm',0,0),(51,2,'54.57 cm',0,0),(51,3,'19.04 cm',0,0),(51,4,'67.87 cm',0,0),(51,5,'24.4 cm',0,0),(52,6,'94.87 cm',0,0),(52,7,'19.25 cm',0,0),(52,8,'2560x1440',0,0),(53,6,'2.64 cm',0,0),(53,7,'8.89 cm',0,0),(53,8,'1920x1080',0,0),(54,6,'60.1 cm',0,0),(54,7,'55.36 cm',0,0),(54,8,'1920x1080',0,0),(55,1,'79.7 cm',0,0),(55,2,'52.82 cm',0,0),(55,3,'58.97 cm',0,0),(55,4,'97.97 cm',0,0),(55,5,'67.26 cm',0,0),(56,1,'10.51 cm',0,0),(56,2,'69.29 cm',0,0),(56,3,'13.81 cm',0,0),(56,4,'80.25 cm',0,0),(56,5,'14.38 cm',0,0),(57,6,'66.06 cm',0,0),(57,7,'62.49 cm',0,0),(57,8,'2560x1440',0,0),(58,6,'17.39 cm',0,0),(58,7,'9.17 cm',0,0),(58,8,'2560x1440',0,0),(59,1,'50 cm',0,0),(59,2,'47.14 cm',0,0),(59,3,'24.23 cm',0,0),(59,4,'50.16 cm',0,0),(59,5,'39.02 cm',0,0),(60,1,'28.73 cm',0,0),(60,2,'81.5 cm',0,0),(60,3,'1.89 cm',0,0),(60,4,'45.61 cm',0,0),(60,5,'50.75 cm',0,0),(61,6,'12.29 cm',0,0),(61,7,'58.92 cm',0,0),(61,8,'3840x2160',0,0),(62,1,'37.84 cm',0,0),(62,2,'95.43 cm',0,0),(62,3,'5.59 cm',0,0),(62,4,'17.51 cm',0,0),(62,5,'43.29 cm',0,0),(63,6,'41.41 cm',0,0),(63,7,'82.23 cm',0,0),(63,8,'3840x2160',0,0),(64,1,'42.07 cm',0,0),(64,2,'3.79 cm',0,0),(64,3,'17.89 cm',0,0),(64,4,'15.65 cm',0,0),(64,5,'10.18 cm',0,0),(65,1,'81.61 cm',0,0),(65,2,'17.34 cm',0,0),(65,3,'44.59 cm',0,0),(65,4,'17.46 cm',0,0),(65,5,'22.3 cm',0,0);
/*!40000 ALTER TABLE `ec_product_specification_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,1),(1,5),(1,6),(2,4),(2,5),(2,6),(3,2),(3,3),(3,4),(4,2),(4,3),(4,6),(5,1),(5,3),(5,4),(6,1),(6,3),(6,4),(7,3),(7,4),(7,5),(8,3),(8,4),(8,5),(9,2),(9,5),(9,6),(10,3),(10,4),(10,6),(11,1),(11,3),(11,4),(12,2),(12,4),(12,5),(13,1),(13,2),(13,6),(14,1),(14,4),(14,5),(15,1),(15,4),(15,6),(16,1),(16,2),(16,4),(17,3),(17,4),(17,6),(18,2),(18,4),(18,6),(19,3),(19,4),(19,6),(20,1),(20,2),(20,4),(21,1),(21,3),(21,4),(22,1),(22,3),(22,4),(23,1),(23,2),(23,4),(24,4),(24,5),(24,6),(25,3),(25,5),(25,6),(26,2),(26,5),(26,6),(27,3),(27,4),(27,6),(28,3),(28,4),(28,6),(29,2),(29,5),(29,6),(30,1),(30,2),(30,4),(31,3),(31,4),(31,5),(32,3),(32,4),(32,6),(33,1),(33,3),(33,4),(34,1),(34,2),(34,4),(35,1),(35,2),(35,6),(36,4),(36,5),(36,6),(37,3),(37,5),(37,6),(38,3),(38,4),(38,6),(39,4),(39,5),(39,6),(40,2),(40,3),(40,5),(41,1),(41,2),(41,3),(42,1),(42,3),(42,6),(43,1),(43,3),(43,5),(44,1),(44,3),(44,5),(45,1),(45,3),(45,4),(46,3),(46,4),(46,5),(47,1),(47,2),(47,4),(48,2),(48,4),(48,5),(49,2),(49,4),(49,6),(50,3),(50,4),(50,5),(51,3),(51,5),(51,6),(52,2),(52,3),(52,4),(53,2),(53,3),(53,6),(54,1),(54,2),(54,4),(55,2),(55,5),(55,6),(56,3),(56,5),(56,6),(57,2),(57,3),(57,5),(58,2),(58,4),(58,5),(59,1),(59,3),(59,4),(60,3),(60,4),(60,5),(61,1),(61,5),(61,6),(62,1),(62,2),(62,6),(63,1),(63,2),(63,5),(64,2),(64,3),(64,6),(65,3),(65,4),(65,5);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(2,'Mobile',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(3,'Iphone',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(4,'Printer',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(5,'Office',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(6,'IT',NULL,'published','2025-03-28 07:26:30','2025-03-28 07:26:30');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variation_items_attribute_id_variation_id_unique` (`attribute_id`,`variation_id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (5,1,3),(9,1,5),(17,1,9),(35,1,18),(51,1,26),(1,2,1),(3,2,2),(13,2,7),(57,2,29),(7,3,4),(15,3,8),(23,3,12),(29,3,15),(39,3,20),(41,3,21),(43,3,22),(45,3,23),(55,3,28),(11,4,6),(25,4,13),(27,4,14),(31,4,16),(33,4,17),(47,4,24),(49,4,25),(53,4,27),(19,5,10),(21,5,11),(37,5,19),(59,5,30),(10,6,5),(18,6,9),(24,6,12),(32,6,16),(34,6,17),(58,6,29),(12,7,6),(14,7,7),(22,7,11),(28,7,14),(40,7,20),(46,7,23),(16,8,8),(20,8,10),(26,8,13),(38,8,19),(2,9,1),(4,9,2),(8,9,4),(42,9,21),(48,9,24),(50,9,25),(52,9,26),(6,10,3),(30,10,15),(36,10,18),(44,10,22),(54,10,27),(56,10,28),(60,10,30),(73,11,37),(99,11,50),(101,11,51),(109,11,55),(115,11,58),(119,11,60),(121,11,61),(125,11,63),(141,11,71),(67,12,34),(83,12,42),(107,12,54),(123,12,62),(135,12,68),(145,12,73),(149,12,75),(61,13,31),(63,13,32),(69,13,35),(89,13,45),(93,13,47),(97,13,49),(103,13,52),(105,13,53),(113,13,57),(117,13,59),(127,13,64),(129,13,65),(131,13,66),(137,13,69),(139,13,70),(77,14,39),(79,14,40),(85,14,43),(87,14,44),(95,14,48),(133,14,67),(143,14,72),(147,14,74),(65,15,33),(71,15,36),(75,15,38),(81,15,41),(91,15,46),(111,15,56),(74,16,37),(78,16,39),(80,16,40),(82,16,41),(94,16,47),(98,16,49),(102,16,51),(106,16,53),(122,16,61),(126,16,63),(128,16,64),(130,16,65),(134,16,67),(144,16,72),(146,16,73),(88,17,44),(92,17,46),(96,17,48),(112,17,56),(116,17,58),(124,17,62),(142,17,71),(64,18,32),(70,18,35),(84,18,42),(90,18,45),(114,18,57),(120,18,60),(132,18,66),(66,19,33),(72,19,36),(76,19,38),(108,19,54),(136,19,68),(138,19,69),(140,19,70),(148,19,74),(150,19,75),(62,20,31),(68,20,34),(86,20,43),(100,20,50),(104,20,52),(110,20,55),(118,20,59);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,66,1,1),(2,67,1,0),(3,68,1,0),(4,69,6,1),(5,70,8,1),(6,71,8,0),(7,72,8,0),(8,73,10,1),(9,74,10,0),(10,75,13,1),(11,76,13,0),(12,77,13,0),(13,78,21,1),(14,79,21,0),(15,80,22,1),(16,81,24,1),(17,82,24,0),(18,83,24,0),(19,84,24,0),(20,85,25,1),(21,86,25,0),(22,87,25,0),(23,88,25,0),(24,89,26,1),(25,90,26,0),(26,91,27,1),(27,92,27,0),(28,93,30,1),(29,94,31,1),(30,95,31,0),(31,96,32,1),(32,97,33,1),(33,98,35,1),(34,99,35,0),(35,100,36,1),(36,101,38,1),(37,102,38,0),(38,103,38,0),(39,104,38,0),(40,105,39,1),(41,106,39,0),(42,107,46,1),(43,108,46,0),(44,109,46,0),(45,110,47,1),(46,111,47,0),(47,112,47,0),(48,113,49,1),(49,114,49,0),(50,115,49,0),(51,116,50,1),(52,117,54,1),(53,118,54,0),(54,119,54,0),(55,120,54,0),(56,121,55,1),(57,122,55,0),(58,123,55,0),(59,124,56,1),(60,125,56,0),(61,126,56,0),(62,127,58,1),(63,128,58,0),(64,129,59,1),(65,130,59,0),(66,131,59,0),(67,132,59,0),(68,133,61,1),(69,134,62,1),(70,135,62,0),(71,136,62,0),(72,137,64,1),(73,138,65,1),(74,139,65,0),(75,140,65,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2025-03-28',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,0),(2,1,0),(1,6,0),(2,6,0),(1,8,0),(2,8,0),(1,10,0),(2,10,0),(1,13,0),(2,13,0),(1,21,0),(2,21,0),(1,22,0),(2,22,0),(1,24,0),(2,24,0),(1,25,0),(2,25,0),(1,26,0),(2,26,0),(1,27,0),(2,27,0),(1,30,0),(2,30,0),(1,31,0),(2,31,0),(3,32,0),(4,32,0),(3,33,0),(4,33,0),(3,35,0),(4,35,0),(3,36,0),(4,36,0),(3,38,0),(4,38,0),(3,39,0),(4,39,0),(3,46,0),(4,46,0),(3,47,0),(4,47,0),(3,49,0),(4,49,0),(3,50,0),(4,50,0),(3,54,0),(4,54,0),(3,55,0),(4,55,0),(3,56,0),(4,56,0),(3,58,0),(4,58,0),(3,59,0),(4,59,0),(3,61,0),(4,61,0),(3,62,0),(4,62,0),(3,64,0),(4,64,0),(3,65,0),(4,65,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `video_media` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double DEFAULT NULL,
  `wide` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_order_quantity` int unsigned DEFAULT '0',
  `maximum_order_quantity` int unsigned DEFAULT '0',
  `notify_attachment_updated` tinyint(1) NOT NULL DEFAULT '0',
  `specification_table_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Dual Camera 20MP','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\"]',NULL,'XE-148-A1',0,14,0,1,'in_stock',1,3,0,0,80.25,NULL,NULL,NULL,15,17,17,667,NULL,72543,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(2,'Smart Watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]',NULL,'YW-118',0,14,0,1,'in_stock',1,3,0,0,40.5,35,NULL,NULL,10,11,20,719,NULL,44185,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(3,'Beat Headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\"]',NULL,'ZL-178',0,14,0,1,'in_stock',1,4,0,0,20,17,NULL,NULL,19,15,10,698,NULL,46451,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,2,0),(4,'Red &amp; Black Headphone (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]',NULL,'IK-108',0,11,0,1,'in_stock',1,2,0,0,551,356,NULL,NULL,15,19,12,775,NULL,103642,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,6,0),(5,'Smart Watch External','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]',NULL,'GJ-133',0,16,0,1,'in_stock',1,3,0,0,749,719,NULL,NULL,19,19,18,863,NULL,86688,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,7,0),(6,'Nikon HD camera','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\"]',NULL,'TH-103-A1',0,16,0,1,'in_stock',1,4,0,0,463,NULL,NULL,NULL,12,19,13,527,NULL,22926,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,2,0),(7,'Audio Equipment','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\"]',NULL,'RI-125',0,14,0,1,'in_stock',1,1,0,0,517,51,NULL,NULL,19,17,18,699,NULL,178173,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(8,'Smart Televisions (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\",\"products\\/8-2.jpg\",\"products\\/8-3.jpg\"]',NULL,'BA-185-A1',0,14,0,1,'in_stock',1,3,0,0,1133,793.1,NULL,NULL,14,12,11,580,NULL,21090,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,6,0),(9,'Samsung Smart Phone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\",\"products\\/9-2.jpg\"]',NULL,'BN-111',0,12,0,1,'in_stock',1,1,0,0,506,375,NULL,NULL,14,18,20,640,NULL,112195,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,3,0),(10,'Herschel Leather Duffle Bag In Brown Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\",\"products\\/10-2.jpg\"]',NULL,'DW-174-A1',0,13,0,1,'in_stock',1,5,0,0,1234,NULL,NULL,NULL,16,17,17,550,NULL,72596,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,7,0),(11,'Xbox One Wireless Controller Black Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\",\"products\\/11-2.jpg\",\"products\\/11-3.jpg\"]',NULL,'PU-133',0,16,0,1,'in_stock',1,4,0,0,1223,532,NULL,NULL,14,12,18,745,NULL,63376,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,7,0),(12,'EPSION Plaster Printer (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/12-3.jpg\"]',NULL,'WE-126',0,13,0,1,'in_stock',0,2,0,0,571,229,NULL,NULL,15,10,12,774,NULL,32656,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,4,0),(13,'Sound Intone I65 Earphone White Version','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]',NULL,'CR-139-A1',0,12,0,1,'in_stock',1,3,0,0,514,NULL,NULL,NULL,20,20,10,705,NULL,42752,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,5,0),(14,'B&amp;O Play Mini Bluetooth Speaker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\"]',NULL,'EU-196',0,12,0,1,'in_stock',0,1,0,0,566,181,NULL,NULL,20,18,14,852,NULL,196405,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(15,'Apple MacBook Air Retina 13.3-Inch Laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]',NULL,'DC-117',0,14,0,1,'in_stock',0,3,0,0,591,546,NULL,NULL,16,10,16,513,NULL,37445,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,7,0),(16,'Apple MacBook Air Retina 12-Inch Laptop (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]',NULL,'EE-186',0,11,0,1,'in_stock',0,4,0,0,543,319,NULL,NULL,15,11,19,603,NULL,22187,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,3,0),(17,'Samsung Gear VR Virtual Reality Headset','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\",\"products\\/17-1.jpg\",\"products\\/17-2.jpg\",\"products\\/17-3.jpg\"]',NULL,'VC-167',0,16,0,1,'in_stock',1,3,0,0,557,258,NULL,NULL,17,13,16,823,NULL,183631,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,5,0),(18,'Aveeno Moisturizing Body Shower 450ml','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\",\"products\\/18-3.jpg\"]',NULL,'S8-183',0,18,0,1,'in_stock',1,2,0,0,1112,439,NULL,NULL,15,20,17,743,NULL,49940,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(19,'NYX Beauty Couton Pallete Makeup 12','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\",\"products\\/19-3.jpg\"]',NULL,'JE-142',0,20,0,1,'in_stock',1,3,0,0,1071,666,NULL,NULL,17,20,11,572,NULL,153367,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,1,0),(20,'NYX Beauty Couton Pallete Makeup 12 (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\",\"products\\/20-2.jpg\",\"products\\/20-3.jpg\"]',NULL,'HX-136',0,20,0,1,'in_stock',1,1,0,0,964,490,NULL,NULL,13,11,20,702,NULL,159790,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,6,0),(21,'MVMTH Classical Leather Watch In Black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\",\"products\\/21-2.jpg\"]',NULL,'4H-103-A1',0,11,0,1,'in_stock',1,4,0,0,733,NULL,NULL,NULL,14,20,10,686,NULL,62866,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(22,'Baxter Care Hair Kit For Bearded Mens','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\",\"products\\/22-2.jpg\",\"products\\/22-3.jpg\"]',NULL,'IU-116-A1',0,16,0,1,'in_stock',1,3,0,0,483,NULL,NULL,NULL,13,20,15,894,NULL,183391,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,2,0),(23,'Ciate Palemore Lipstick Bold Red Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\",\"products\\/23-2.jpg\",\"products\\/23-3.jpg\"]',NULL,'YF-143',0,13,0,1,'in_stock',0,3,0,0,677,321,NULL,NULL,17,14,19,617,NULL,120808,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,4,0),(24,'Vimto Squash Remix Apple 1.5 Litres (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/24.jpg\",\"products\\/24-1.jpg\",\"products\\/24-2.jpg\"]',NULL,'DO-198-A1',0,19,0,1,'in_stock',0,4,0,0,682,593.34,NULL,NULL,14,16,15,529,NULL,49122,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,7,0),(25,'Crock Pot Slow Cooker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/25.jpg\",\"products\\/25-1.jpg\",\"products\\/25-2.jpg\"]',NULL,'SK-119-A1',0,11,0,1,'in_stock',0,4,0,0,856,NULL,NULL,NULL,19,14,16,757,NULL,124636,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,1,0),(26,'Taylors of Harrogate Yorkshire Coffee','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/26.jpg\",\"products\\/26-1.jpg\"]',NULL,'ZS-191-A1',0,16,0,1,'in_stock',0,4,0,0,708,NULL,NULL,NULL,17,18,11,694,NULL,68829,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(27,'Soft Mochi &amp; Galeto Ice Cream','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/27.jpg\",\"products\\/27-1.jpg\"]',NULL,'WY-150-A1',0,16,0,1,'in_stock',1,4,0,0,888,NULL,NULL,NULL,18,11,10,585,NULL,138170,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,5,0),(28,'Naked Noodle Egg Noodles Singapore (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/28.jpg\",\"products\\/28-1.jpg\",\"products\\/28-2.jpg\"]',NULL,'YK-129',0,14,0,1,'in_stock',0,3,0,0,830,245,NULL,NULL,16,19,15,641,NULL,83637,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,4,0),(29,'Saute Pan Silver','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/29.jpg\",\"products\\/29-1.jpg\",\"products\\/29-2.jpg\"]',NULL,'7C-101',0,14,0,1,'in_stock',0,1,0,0,1106,507,NULL,NULL,17,19,14,717,NULL,22823,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,2,0),(30,'Bar S – Classic Bun Length Franks','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/30.jpg\",\"products\\/30-1.jpg\",\"products\\/30-2.jpg\"]',NULL,'QH-156-A1',0,18,0,1,'in_stock',1,3,0,0,515,NULL,NULL,NULL,15,10,14,602,NULL,114742,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,4,0),(31,'Broccoli Crowns','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/31.jpg\",\"products\\/31-1.jpg\"]',NULL,'TJ-136-A1',0,19,0,1,'in_stock',0,3,0,0,857,NULL,NULL,NULL,17,18,10,566,NULL,16017,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,8,0),(32,'Slimming World Vegan Mac Greens (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/32.jpg\",\"products\\/32-1.jpg\",\"products\\/32-2.jpg\"]',NULL,'SD-144-A1',0,11,0,1,'in_stock',1,2,0,0,819,630.63,NULL,NULL,16,15,13,784,NULL,156534,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,2,0),(33,'Häagen-Dazs Salted Caramel','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/33.jpg\",\"products\\/33-1.jpg\",\"products\\/33-2.jpg\"]',NULL,'OG-163-A1',0,14,0,1,'in_stock',1,4,0,0,510,NULL,NULL,NULL,14,17,11,814,NULL,129967,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(34,'Iceland 3 Solo Exotic Burst','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/34.jpg\",\"products\\/34-1.jpg\"]',NULL,'FY-123',0,18,0,1,'in_stock',1,1,0,0,526,322,NULL,NULL,14,18,19,660,NULL,42800,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(35,'Extreme Budweiser Light Can','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/35.jpg\",\"products\\/35-1.jpg\"]',NULL,'PF-161-A1',0,19,0,1,'in_stock',1,4,0,0,513,NULL,NULL,NULL,20,10,15,560,NULL,188705,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,3,0),(36,'Iceland Macaroni Cheese Traybake (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/36.jpg\",\"products\\/36-1.jpg\",\"products\\/36-2.jpg\"]',NULL,'HC-153-A1',0,10,0,1,'in_stock',1,5,0,0,561,426.36,NULL,NULL,17,11,14,656,NULL,144804,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,4,0),(37,'Dolmio Bolognese Pasta Sauce','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/37.jpg\",\"products\\/37-1.jpg\",\"products\\/37-2.jpg\"]',NULL,'HR-199',0,12,0,1,'in_stock',1,3,0,0,1194,332,NULL,NULL,17,14,11,618,NULL,90357,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,4,0),(38,'Sitema BakeIT Plastic Box','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/38.jpg\",\"products\\/38-1.jpg\",\"products\\/38-2.jpg\",\"products\\/38-3.jpg\"]',NULL,'DK-195-A1',0,15,0,1,'in_stock',0,2,0,0,686,NULL,NULL,NULL,17,17,11,751,NULL,148745,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,1,0),(39,'Wayfair Basics Dinner Plate Storage','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/39.jpg\",\"products\\/39-1.jpg\",\"products\\/39-2.jpg\"]',NULL,'LH-168-A1',0,12,0,1,'in_stock',1,4,0,0,1029,NULL,NULL,NULL,19,17,15,613,NULL,174057,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,2,0),(40,'Miko The Panda Water Bottle (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/40.jpg\",\"products\\/40-1.jpg\"]',NULL,'SO-175',0,16,0,1,'in_stock',0,3,0,0,1295,613,NULL,NULL,16,14,15,816,NULL,60126,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,3,0),(41,'Sesame Seed Bread','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/41.jpg\",\"products\\/41-1.jpg\",\"products\\/41-2.jpg\"]',NULL,'DI-193',0,15,0,1,'in_stock',1,3,0,0,813,496,NULL,NULL,17,11,14,771,NULL,6410,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(42,'Morrisons The Best Beef','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/42.jpg\",\"products\\/42-1.jpg\",\"products\\/42-2.jpg\"]',NULL,'AR-103',0,14,0,1,'in_stock',0,4,0,0,1123,18,NULL,NULL,17,13,15,870,NULL,95378,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,8,0),(43,'Avocado, Hass Large','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/43.jpg\",\"products\\/43-1.jpg\",\"products\\/43-2.jpg\"]',NULL,'SA-133',0,15,0,1,'in_stock',0,1,0,0,637,170,NULL,NULL,10,20,15,600,NULL,115139,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,1,0),(44,'Italia Beef Lasagne (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/44.jpg\",\"products\\/44-1.jpg\",\"products\\/44-2.jpg\"]',NULL,'HY-140',0,18,0,1,'in_stock',1,4,0,0,1057,383,NULL,NULL,16,13,19,687,NULL,126045,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,2,0),(45,'Maxwell House Classic Roast Mocha','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/45.jpg\",\"products\\/45-1.jpg\"]',NULL,'OV-137',0,16,0,1,'in_stock',0,4,0,0,1085,838,NULL,NULL,19,12,17,613,NULL,47574,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,8,0),(46,'Bottled Pure Water 500ml','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/46.jpg\",\"products\\/46-1.jpg\"]',NULL,'FH-155-A1',0,19,0,1,'in_stock',0,4,0,0,661,NULL,NULL,NULL,11,15,12,856,NULL,143157,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,1,0),(47,'Famart Farmhouse Soft White','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/47.jpg\",\"products\\/47-1.jpg\"]',NULL,'IZ-147-A1',0,18,0,1,'in_stock',0,2,0,0,830,NULL,NULL,NULL,16,14,17,727,NULL,193293,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,2,0),(48,'Coca-Cola Original Taste (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/48.jpg\",\"products\\/48-1.jpg\",\"products\\/48-2.jpg\"]',NULL,'RY-164',0,10,0,1,'in_stock',1,5,0,0,881,285,NULL,NULL,12,19,20,886,NULL,46266,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,7,0),(49,'Casillero Diablo Cabernet Sauvignon','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/49.jpg\",\"products\\/49-1.jpg\",\"products\\/49-2.jpg\"]',NULL,'G4-185-A1',0,10,0,1,'in_stock',0,3,0,0,548,NULL,NULL,NULL,19,18,12,627,NULL,114740,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,6,0),(50,'Arla Organic Free Range Milk','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/50.jpg\",\"products\\/50-1.jpg\"]',NULL,'ZZ-180-A1',0,10,0,1,'in_stock',1,2,0,0,793,NULL,NULL,NULL,18,14,12,659,NULL,48230,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,3,0),(51,'Aptamil Follow On Baby Milk','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/51.jpg\"]',NULL,'SC-170',0,18,0,1,'in_stock',0,4,0,0,519,7,NULL,NULL,13,10,13,685,NULL,111679,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,2,0),(52,'Cuisinart Chef’S Classic Hard-Anodized (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/52.jpg\",\"products\\/52-1.jpg\",\"products\\/52-2.jpg\"]',NULL,'NA-168',0,20,0,1,'in_stock',1,5,0,0,1159,961,NULL,NULL,18,19,16,854,NULL,196249,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,2,2,0),(53,'Corn, Yellow Sweet','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/53.jpg\",\"products\\/53-1.jpg\"]',NULL,'EK-182',0,10,0,1,'in_stock',0,2,0,0,1208,891,NULL,NULL,12,12,14,889,NULL,99387,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,6,0),(54,'Hobnobs The Nobbly Biscuit','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/54.jpg\",\"products\\/54-1.jpg\"]',NULL,'NY-147-A1',0,13,0,1,'in_stock',0,5,0,0,1250,NULL,NULL,NULL,16,18,10,872,NULL,159155,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,4,0),(55,'Honest Organic Still Lemonade','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/55.jpg\",\"products\\/55-1.jpg\",\"products\\/55-2.jpg\"]',NULL,'FW-161-A1',0,20,0,1,'in_stock',1,4,0,0,863,NULL,NULL,NULL,13,11,18,606,NULL,146852,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,3,0),(56,'Ice Beck’s Beer 350ml x 24 Pieces (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/56.jpg\",\"products\\/56-1.jpg\",\"products\\/56-2.jpg\"]',NULL,'WF-139-A1',0,14,0,1,'in_stock',1,2,0,0,618,550.02,NULL,NULL,17,10,11,679,NULL,130578,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,2,0),(57,'Iceland 6 Hot Cross Buns','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/57.jpg\",\"products\\/57-1.jpg\"]',NULL,'6Q-150',0,15,0,1,'in_stock',0,5,0,0,737,613,NULL,NULL,18,13,10,591,NULL,63086,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,2,0),(58,'Iceland Luxury 4 Panini Rolls','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/58.jpg\",\"products\\/58-1.jpg\",\"products\\/58-2.jpg\"]',NULL,'UW-116-A1',0,11,0,1,'in_stock',1,1,0,0,1295,NULL,NULL,NULL,16,15,18,827,NULL,174740,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,4,0),(59,'Iceland Soft Scoop Vanilla','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/59.jpg\",\"products\\/59-1.jpg\",\"products\\/59-2.jpg\",\"products\\/59-3.jpg\"]',NULL,'0I-101-A1',0,18,0,1,'in_stock',1,1,0,0,854,NULL,NULL,NULL,15,14,16,560,NULL,129494,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,2,0),(60,'Iceland Spaghetti Bolognese (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/60.jpg\",\"products\\/60-1.jpg\",\"products\\/60-2.jpg\"]',NULL,'IU-116',0,15,0,1,'in_stock',0,5,0,0,872,155,NULL,NULL,18,20,19,599,NULL,174249,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,5,0),(61,'Kellogg’s Coco Pops Cereal','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/61.jpg\",\"products\\/61-1.jpg\"]',NULL,'UR-137-A1',0,16,0,1,'in_stock',1,3,0,0,1266,NULL,NULL,NULL,12,19,13,550,NULL,197541,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,2,0),(62,'Kit Kat Chunky Milk Chocolate','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/62.jpg\",\"products\\/62-1.jpg\"]',NULL,'RC-118-A1',0,14,0,1,'in_stock',0,1,0,0,1031,NULL,NULL,NULL,16,20,15,552,NULL,169593,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,5,0),(63,'Large Green Bell Pepper','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/63.jpg\",\"products\\/63-1.jpg\"]',NULL,'CP-125',0,16,0,1,'in_stock',0,5,0,0,1075,442,NULL,NULL,20,17,12,900,NULL,172326,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,2,5,0),(64,'Pice 94w Beasley Journal (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/64.jpg\",\"products\\/64-1.jpg\"]',NULL,'WW-136-A1',0,17,0,1,'in_stock',0,5,0,0,599,431.28,NULL,NULL,17,17,12,646,NULL,155206,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,1,7,0),(65,'Province Piece Glass Drinking Glass','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/65.jpg\",\"products\\/65-1.jpg\",\"products\\/65-2.jpg\"]',NULL,'IS-158-A1',0,12,0,1,'in_stock',1,4,0,0,717,NULL,NULL,NULL,13,18,18,503,NULL,118657,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,1,7,0),(66,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]',NULL,'XE-148-A1',0,14,0,1,'in_stock',0,3,1,0,80.25,NULL,NULL,NULL,15,17,17,667,NULL,0,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(67,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]',NULL,'XE-148-A1-A2',0,14,0,1,'in_stock',0,3,1,0,80.25,NULL,NULL,NULL,15,17,17,667,NULL,0,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(68,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/1.jpg\"]',NULL,'XE-148-A1-A3',0,14,0,1,'in_stock',0,3,1,0,80.25,NULL,NULL,NULL,15,17,17,667,NULL,0,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(69,'Nikon HD camera',NULL,NULL,'published','[\"products\\/6.jpg\"]',NULL,'TH-103-A1',0,16,0,1,'in_stock',0,4,1,0,463,NULL,NULL,NULL,12,19,13,527,NULL,0,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(70,'Smart Televisions (Digital)',NULL,NULL,'published','[\"products\\/8-1.jpg\"]',NULL,'BA-185-A1',0,14,0,1,'in_stock',0,3,1,0,1133,793.1,NULL,NULL,14,12,11,580,NULL,0,'2025-03-28 07:26:36','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(71,'Smart Televisions (Digital)',NULL,NULL,'published','[\"products\\/8-2.jpg\"]',NULL,'BA-185-A1-A2',0,14,0,1,'in_stock',0,3,1,0,1133,929.06,NULL,NULL,14,12,11,580,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(72,'Smart Televisions (Digital)',NULL,NULL,'published','[\"products\\/8-3.jpg\"]',NULL,'BA-185-A1-A3',0,14,0,1,'in_stock',0,3,1,0,1133,861.08,NULL,NULL,14,12,11,580,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(73,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10-1.jpg\"]',NULL,'DW-174-A1',0,13,0,1,'in_stock',0,5,1,0,1234,NULL,NULL,NULL,16,17,17,550,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(74,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10-2.jpg\"]',NULL,'DW-174-A1-A2',0,13,0,1,'in_stock',0,5,1,0,1234,NULL,NULL,NULL,16,17,17,550,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(75,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13-1.jpg\"]',NULL,'CR-139-A1',0,12,0,1,'in_stock',0,3,1,0,514,NULL,NULL,NULL,20,20,10,705,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(76,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13.jpg\"]',NULL,'CR-139-A1-A2',0,12,0,1,'in_stock',0,3,1,0,514,NULL,NULL,NULL,20,20,10,705,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(77,'Sound Intone I65 Earphone White Version',NULL,NULL,'published','[\"products\\/13.jpg\"]',NULL,'CR-139-A1-A3',0,12,0,1,'in_stock',0,3,1,0,514,NULL,NULL,NULL,20,20,10,705,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(78,'MVMTH Classical Leather Watch In Black',NULL,NULL,'published','[\"products\\/21-1.jpg\"]',NULL,'4H-103-A1',0,11,0,1,'in_stock',0,4,1,0,733,NULL,NULL,NULL,14,20,10,686,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(79,'MVMTH Classical Leather Watch In Black',NULL,NULL,'published','[\"products\\/21-2.jpg\"]',NULL,'4H-103-A1-A2',0,11,0,1,'in_stock',0,4,1,0,733,NULL,NULL,NULL,14,20,10,686,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(80,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22-1.jpg\"]',NULL,'IU-116-A1',0,16,0,1,'in_stock',0,3,1,0,483,NULL,NULL,NULL,13,20,15,894,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(81,'Vimto Squash Remix Apple 1.5 Litres (Digital)',NULL,NULL,'published','[\"products\\/24-1.jpg\"]',NULL,'DO-198-A1',0,19,0,1,'in_stock',0,4,1,0,682,593.34,NULL,NULL,14,16,15,529,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(82,'Vimto Squash Remix Apple 1.5 Litres (Digital)',NULL,NULL,'published','[\"products\\/24-2.jpg\"]',NULL,'DO-198-A1-A2',0,19,0,1,'in_stock',0,4,1,0,682,613.8,NULL,NULL,14,16,15,529,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(83,'Vimto Squash Remix Apple 1.5 Litres (Digital)',NULL,NULL,'published','[\"products\\/24.jpg\"]',NULL,'DO-198-A1-A3',0,19,0,1,'in_stock',0,4,1,0,682,518.32,NULL,NULL,14,16,15,529,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(84,'Vimto Squash Remix Apple 1.5 Litres (Digital)',NULL,NULL,'published','[\"products\\/24.jpg\"]',NULL,'DO-198-A1-A4',0,19,0,1,'in_stock',0,4,1,0,682,572.88,NULL,NULL,14,16,15,529,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(85,'Crock Pot Slow Cooker',NULL,NULL,'published','[\"products\\/25-1.jpg\"]',NULL,'SK-119-A1',0,11,0,1,'in_stock',0,4,1,0,856,NULL,NULL,NULL,19,14,16,757,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(86,'Crock Pot Slow Cooker',NULL,NULL,'published','[\"products\\/25-2.jpg\"]',NULL,'SK-119-A1-A2',0,11,0,1,'in_stock',0,4,1,0,856,NULL,NULL,NULL,19,14,16,757,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(87,'Crock Pot Slow Cooker',NULL,NULL,'published','[\"products\\/25.jpg\"]',NULL,'SK-119-A1-A3',0,11,0,1,'in_stock',0,4,1,0,856,NULL,NULL,NULL,19,14,16,757,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(88,'Crock Pot Slow Cooker',NULL,NULL,'published','[\"products\\/25.jpg\"]',NULL,'SK-119-A1-A4',0,11,0,1,'in_stock',0,4,1,0,856,NULL,NULL,NULL,19,14,16,757,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(89,'Taylors of Harrogate Yorkshire Coffee',NULL,NULL,'published','[\"products\\/26-1.jpg\"]',NULL,'ZS-191-A1',0,16,0,1,'in_stock',0,4,1,0,708,NULL,NULL,NULL,17,18,11,694,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(90,'Taylors of Harrogate Yorkshire Coffee',NULL,NULL,'published','[\"products\\/26.jpg\"]',NULL,'ZS-191-A1-A2',0,16,0,1,'in_stock',0,4,1,0,708,NULL,NULL,NULL,17,18,11,694,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(91,'Soft Mochi & Galeto Ice Cream',NULL,NULL,'published','[\"products\\/27-1.jpg\"]',NULL,'WY-150-A1',0,16,0,1,'in_stock',0,4,1,0,888,NULL,NULL,NULL,18,11,10,585,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(92,'Soft Mochi & Galeto Ice Cream',NULL,NULL,'published','[\"products\\/27.jpg\"]',NULL,'WY-150-A1-A2',0,16,0,1,'in_stock',0,4,1,0,888,NULL,NULL,NULL,18,11,10,585,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(93,'Bar S – Classic Bun Length Franks',NULL,NULL,'published','[\"products\\/30-1.jpg\"]',NULL,'QH-156-A1',0,18,0,1,'in_stock',0,3,1,0,515,NULL,NULL,NULL,15,10,14,602,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(94,'Broccoli Crowns',NULL,NULL,'published','[\"products\\/31-1.jpg\"]',NULL,'TJ-136-A1',0,19,0,1,'in_stock',0,3,1,0,857,NULL,NULL,NULL,17,18,10,566,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(95,'Broccoli Crowns',NULL,NULL,'published','[\"products\\/31.jpg\"]',NULL,'TJ-136-A1-A2',0,19,0,1,'in_stock',0,3,1,0,857,NULL,NULL,NULL,17,18,10,566,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(96,'Slimming World Vegan Mac Greens (Digital)',NULL,NULL,'published','[\"products\\/32-1.jpg\"]',NULL,'SD-144-A1',0,11,0,1,'in_stock',0,2,1,0,819,630.63,NULL,NULL,16,15,13,784,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(97,'Häagen-Dazs Salted Caramel',NULL,NULL,'published','[\"products\\/33-1.jpg\"]',NULL,'OG-163-A1',0,14,0,1,'in_stock',0,4,1,0,510,NULL,NULL,NULL,14,17,11,814,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(98,'Extreme Budweiser Light Can',NULL,NULL,'published','[\"products\\/35-1.jpg\"]',NULL,'PF-161-A1',0,19,0,1,'in_stock',0,4,1,0,513,NULL,NULL,NULL,20,10,15,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(99,'Extreme Budweiser Light Can',NULL,NULL,'published','[\"products\\/35.jpg\"]',NULL,'PF-161-A1-A2',0,19,0,1,'in_stock',0,4,1,0,513,NULL,NULL,NULL,20,10,15,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(100,'Iceland Macaroni Cheese Traybake (Digital)',NULL,NULL,'published','[\"products\\/36-1.jpg\"]',NULL,'HC-153-A1',0,10,0,1,'in_stock',0,5,1,0,561,426.36,NULL,NULL,17,11,14,656,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(101,'Sitema BakeIT Plastic Box',NULL,NULL,'published','[\"products\\/38-1.jpg\"]',NULL,'DK-195-A1',0,15,0,1,'in_stock',0,2,1,0,686,NULL,NULL,NULL,17,17,11,751,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(102,'Sitema BakeIT Plastic Box',NULL,NULL,'published','[\"products\\/38-2.jpg\"]',NULL,'DK-195-A1-A2',0,15,0,1,'in_stock',0,2,1,0,686,NULL,NULL,NULL,17,17,11,751,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(103,'Sitema BakeIT Plastic Box',NULL,NULL,'published','[\"products\\/38-3.jpg\"]',NULL,'DK-195-A1-A3',0,15,0,1,'in_stock',0,2,1,0,686,NULL,NULL,NULL,17,17,11,751,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(104,'Sitema BakeIT Plastic Box',NULL,NULL,'published','[\"products\\/38.jpg\"]',NULL,'DK-195-A1-A4',0,15,0,1,'in_stock',0,2,1,0,686,NULL,NULL,NULL,17,17,11,751,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(105,'Wayfair Basics Dinner Plate Storage',NULL,NULL,'published','[\"products\\/39-1.jpg\"]',NULL,'LH-168-A1',0,12,0,1,'in_stock',0,4,1,0,1029,NULL,NULL,NULL,19,17,15,613,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(106,'Wayfair Basics Dinner Plate Storage',NULL,NULL,'published','[\"products\\/39-2.jpg\"]',NULL,'LH-168-A1-A2',0,12,0,1,'in_stock',0,4,1,0,1029,NULL,NULL,NULL,19,17,15,613,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(107,'Bottled Pure Water 500ml',NULL,NULL,'published','[\"products\\/46-1.jpg\"]',NULL,'FH-155-A1',0,19,0,1,'in_stock',0,4,1,0,661,NULL,NULL,NULL,11,15,12,856,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(108,'Bottled Pure Water 500ml',NULL,NULL,'published','[\"products\\/46.jpg\"]',NULL,'FH-155-A1-A2',0,19,0,1,'in_stock',0,4,1,0,661,NULL,NULL,NULL,11,15,12,856,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(109,'Bottled Pure Water 500ml',NULL,NULL,'published','[\"products\\/46.jpg\"]',NULL,'FH-155-A1-A3',0,19,0,1,'in_stock',0,4,1,0,661,NULL,NULL,NULL,11,15,12,856,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(110,'Famart Farmhouse Soft White',NULL,NULL,'published','[\"products\\/47-1.jpg\"]',NULL,'IZ-147-A1',0,18,0,1,'in_stock',0,2,1,0,830,NULL,NULL,NULL,16,14,17,727,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(111,'Famart Farmhouse Soft White',NULL,NULL,'published','[\"products\\/47.jpg\"]',NULL,'IZ-147-A1-A2',0,18,0,1,'in_stock',0,2,1,0,830,NULL,NULL,NULL,16,14,17,727,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(112,'Famart Farmhouse Soft White',NULL,NULL,'published','[\"products\\/47.jpg\"]',NULL,'IZ-147-A1-A3',0,18,0,1,'in_stock',0,2,1,0,830,NULL,NULL,NULL,16,14,17,727,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(113,'Casillero Diablo Cabernet Sauvignon',NULL,NULL,'published','[\"products\\/49-1.jpg\"]',NULL,'G4-185-A1',0,10,0,1,'in_stock',0,3,1,0,548,NULL,NULL,NULL,19,18,12,627,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(114,'Casillero Diablo Cabernet Sauvignon',NULL,NULL,'published','[\"products\\/49-2.jpg\"]',NULL,'G4-185-A1-A2',0,10,0,1,'in_stock',0,3,1,0,548,NULL,NULL,NULL,19,18,12,627,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(115,'Casillero Diablo Cabernet Sauvignon',NULL,NULL,'published','[\"products\\/49.jpg\"]',NULL,'G4-185-A1-A3',0,10,0,1,'in_stock',0,3,1,0,548,NULL,NULL,NULL,19,18,12,627,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(116,'Arla Organic Free Range Milk',NULL,NULL,'published','[\"products\\/50-1.jpg\"]',NULL,'ZZ-180-A1',0,10,0,1,'in_stock',0,2,1,0,793,NULL,NULL,NULL,18,14,12,659,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(117,'Hobnobs The Nobbly Biscuit',NULL,NULL,'published','[\"products\\/54-1.jpg\"]',NULL,'NY-147-A1',0,13,0,1,'in_stock',0,5,1,0,1250,NULL,NULL,NULL,16,18,10,872,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(118,'Hobnobs The Nobbly Biscuit',NULL,NULL,'published','[\"products\\/54.jpg\"]',NULL,'NY-147-A1-A2',0,13,0,1,'in_stock',0,5,1,0,1250,NULL,NULL,NULL,16,18,10,872,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(119,'Hobnobs The Nobbly Biscuit',NULL,NULL,'published','[\"products\\/54.jpg\"]',NULL,'NY-147-A1-A3',0,13,0,1,'in_stock',0,5,1,0,1250,NULL,NULL,NULL,16,18,10,872,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(120,'Hobnobs The Nobbly Biscuit',NULL,NULL,'published','[\"products\\/54.jpg\"]',NULL,'NY-147-A1-A4',0,13,0,1,'in_stock',0,5,1,0,1250,NULL,NULL,NULL,16,18,10,872,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(121,'Honest Organic Still Lemonade',NULL,NULL,'published','[\"products\\/55-1.jpg\"]',NULL,'FW-161-A1',0,20,0,1,'in_stock',0,4,1,0,863,NULL,NULL,NULL,13,11,18,606,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(122,'Honest Organic Still Lemonade',NULL,NULL,'published','[\"products\\/55-2.jpg\"]',NULL,'FW-161-A1-A2',0,20,0,1,'in_stock',0,4,1,0,863,NULL,NULL,NULL,13,11,18,606,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(123,'Honest Organic Still Lemonade',NULL,NULL,'published','[\"products\\/55.jpg\"]',NULL,'FW-161-A1-A3',0,20,0,1,'in_stock',0,4,1,0,863,NULL,NULL,NULL,13,11,18,606,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(124,'Ice Beck’s Beer 350ml x 24 Pieces (Digital)',NULL,NULL,'published','[\"products\\/56-1.jpg\"]',NULL,'WF-139-A1',0,14,0,1,'in_stock',0,2,1,0,618,550.02,NULL,NULL,17,10,11,679,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(125,'Ice Beck’s Beer 350ml x 24 Pieces (Digital)',NULL,NULL,'published','[\"products\\/56-2.jpg\"]',NULL,'WF-139-A1-A2',0,14,0,1,'in_stock',0,2,1,0,618,475.86,NULL,NULL,17,10,11,679,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(126,'Ice Beck’s Beer 350ml x 24 Pieces (Digital)',NULL,NULL,'published','[\"products\\/56.jpg\"]',NULL,'WF-139-A1-A3',0,14,0,1,'in_stock',0,2,1,0,618,550.02,NULL,NULL,17,10,11,679,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(127,'Iceland Luxury 4 Panini Rolls',NULL,NULL,'published','[\"products\\/58-1.jpg\"]',NULL,'UW-116-A1',0,11,0,1,'in_stock',0,1,1,0,1295,NULL,NULL,NULL,16,15,18,827,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(128,'Iceland Luxury 4 Panini Rolls',NULL,NULL,'published','[\"products\\/58-2.jpg\"]',NULL,'UW-116-A1-A2',0,11,0,1,'in_stock',0,1,1,0,1295,NULL,NULL,NULL,16,15,18,827,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(129,'Iceland Soft Scoop Vanilla',NULL,NULL,'published','[\"products\\/59-1.jpg\"]',NULL,'0I-101-A1',0,18,0,1,'in_stock',0,1,1,0,854,NULL,NULL,NULL,15,14,16,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(130,'Iceland Soft Scoop Vanilla',NULL,NULL,'published','[\"products\\/59-2.jpg\"]',NULL,'0I-101-A1-A2',0,18,0,1,'in_stock',0,1,1,0,854,NULL,NULL,NULL,15,14,16,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(131,'Iceland Soft Scoop Vanilla',NULL,NULL,'published','[\"products\\/59-3.jpg\"]',NULL,'0I-101-A1-A3',0,18,0,1,'in_stock',0,1,1,0,854,NULL,NULL,NULL,15,14,16,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(132,'Iceland Soft Scoop Vanilla',NULL,NULL,'published','[\"products\\/59.jpg\"]',NULL,'0I-101-A1-A4',0,18,0,1,'in_stock',0,1,1,0,854,NULL,NULL,NULL,15,14,16,560,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(133,'Kellogg’s Coco Pops Cereal',NULL,NULL,'published','[\"products\\/61-1.jpg\"]',NULL,'UR-137-A1',0,16,0,1,'in_stock',0,3,1,0,1266,NULL,NULL,NULL,12,19,13,550,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(134,'Kit Kat Chunky Milk Chocolate',NULL,NULL,'published','[\"products\\/62-1.jpg\"]',NULL,'RC-118-A1',0,14,0,1,'in_stock',0,1,1,0,1031,NULL,NULL,NULL,16,20,15,552,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(135,'Kit Kat Chunky Milk Chocolate',NULL,NULL,'published','[\"products\\/62.jpg\"]',NULL,'RC-118-A1-A2',0,14,0,1,'in_stock',0,1,1,0,1031,NULL,NULL,NULL,16,20,15,552,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(136,'Kit Kat Chunky Milk Chocolate',NULL,NULL,'published','[\"products\\/62.jpg\"]',NULL,'RC-118-A1-A3',0,14,0,1,'in_stock',0,1,1,0,1031,NULL,NULL,NULL,16,20,15,552,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(137,'Pice 94w Beasley Journal (Digital)',NULL,NULL,'published','[\"products\\/64-1.jpg\"]',NULL,'WW-136-A1',0,17,0,1,'in_stock',0,5,1,0,599,431.28,NULL,NULL,17,17,12,646,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,0,0,0,NULL,NULL,0),(138,'Province Piece Glass Drinking Glass',NULL,NULL,'published','[\"products\\/65-1.jpg\"]',NULL,'IS-158-A1',0,12,0,1,'in_stock',0,4,1,0,717,NULL,NULL,NULL,13,18,18,503,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(139,'Province Piece Glass Drinking Glass',NULL,NULL,'published','[\"products\\/65-2.jpg\"]',NULL,'IS-158-A1-A2',0,12,0,1,'in_stock',0,4,1,0,717,NULL,NULL,NULL,13,18,18,503,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0),(140,'Province Piece Glass Drinking Glass',NULL,NULL,'published','[\"products\\/65.jpg\"]',NULL,'IS-158-A1-A3',0,12,0,1,'in_stock',0,4,1,0,717,NULL,NULL,NULL,13,18,18,503,NULL,0,'2025-03-28 07:26:37','2025-03-28 07:26:41',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,9,NULL,NULL,21,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36-2.jpg\",\"products\\/42.jpg\",\"products\\/62.jpg\",\"products\\/63.jpg\"]'),(2,7,NULL,NULL,18,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\",\"products\\/37.jpg\",\"products\\/61.jpg\"]'),(3,2,NULL,NULL,9,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38.jpg\",\"products\\/53-1.jpg\"]'),(4,7,NULL,NULL,20,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/56-2.jpg\"]'),(5,9,NULL,NULL,11,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/34-1.jpg\",\"products\\/49.jpg\"]'),(6,1,NULL,NULL,19,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/18.jpg\",\"products\\/29-1.jpg\",\"products\\/38-2.jpg\"]'),(7,1,NULL,NULL,29,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9.jpg\",\"products\\/14.jpg\",\"products\\/33-1.jpg\",\"products\\/39-2.jpg\"]'),(8,6,NULL,NULL,6,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15-1.jpg\"]'),(9,10,NULL,NULL,20,1,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\"]'),(10,4,NULL,NULL,6,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/58-1.jpg\"]'),(11,1,NULL,NULL,26,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-3.jpg\",\"products\\/54.jpg\",\"products\\/61-1.jpg\"]'),(12,7,NULL,NULL,62,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\",\"products\\/36-2.jpg\",\"products\\/45-1.jpg\",\"products\\/63-1.jpg\"]'),(13,5,NULL,NULL,16,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/58.jpg\"]'),(14,4,NULL,NULL,57,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-2.jpg\",\"products\\/19.jpg\",\"products\\/37-1.jpg\",\"products\\/52.jpg\"]'),(15,2,NULL,NULL,38,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37-2.jpg\",\"products\\/38-1.jpg\"]'),(16,4,NULL,NULL,4,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\",\"products\\/35-1.jpg\",\"products\\/39-2.jpg\"]'),(17,8,NULL,NULL,14,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/21.jpg\",\"products\\/32.jpg\"]'),(18,8,NULL,NULL,49,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-2.jpg\"]'),(19,2,NULL,NULL,41,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\",\"products\\/21-2.jpg\",\"products\\/24-1.jpg\",\"products\\/31.jpg\"]'),(20,4,NULL,NULL,19,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\"]'),(21,4,NULL,NULL,7,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/9-2.jpg\",\"products\\/50-1.jpg\"]'),(22,2,NULL,NULL,13,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/43-2.jpg\"]'),(23,6,NULL,NULL,10,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/17-3.jpg\",\"products\\/56.jpg\",\"products\\/59-2.jpg\"]'),(24,10,NULL,NULL,3,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/32.jpg\"]'),(25,5,NULL,NULL,35,5,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/59.jpg\"]'),(26,7,NULL,NULL,65,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/17-2.jpg\",\"products\\/40.jpg\"]'),(27,3,NULL,NULL,40,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8.jpg\",\"products\\/39.jpg\",\"products\\/40.jpg\"]'),(28,4,NULL,NULL,51,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/58.jpg\"]'),(29,10,NULL,NULL,46,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/31-1.jpg\",\"products\\/59-1.jpg\"]'),(30,9,NULL,NULL,40,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-1.jpg\",\"products\\/31-1.jpg\",\"products\\/36-2.jpg\",\"products\\/41.jpg\"]'),(31,5,NULL,NULL,47,3,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/12.jpg\",\"products\\/19-1.jpg\",\"products\\/19.jpg\"]'),(32,9,NULL,NULL,43,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/20-1.jpg\",\"products\\/22-1.jpg\",\"products\\/47.jpg\"]'),(33,10,NULL,NULL,23,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/59-2.jpg\"]'),(34,1,NULL,NULL,62,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\",\"products\\/15.jpg\",\"products\\/25-1.jpg\"]'),(35,10,NULL,NULL,34,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9.jpg\",\"products\\/28.jpg\"]'),(36,5,NULL,NULL,37,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41.jpg\"]'),(37,4,NULL,NULL,50,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/29-2.jpg\"]'),(38,7,NULL,NULL,21,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/4-1.jpg\",\"products\\/52.jpg\",\"products\\/56.jpg\"]'),(39,7,NULL,NULL,39,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-3.jpg\",\"products\\/19-2.jpg\",\"products\\/40.jpg\",\"products\\/47-1.jpg\"]'),(40,4,NULL,NULL,13,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-1.jpg\",\"products\\/20-1.jpg\",\"products\\/36-1.jpg\"]'),(41,7,NULL,NULL,37,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/65-2.jpg\"]'),(43,9,NULL,NULL,64,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/32-2.jpg\"]'),(44,2,NULL,NULL,36,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/59-2.jpg\"]'),(45,8,NULL,NULL,43,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31.jpg\",\"products\\/39-2.jpg\"]'),(46,10,NULL,NULL,40,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/26-1.jpg\",\"products\\/27-1.jpg\",\"products\\/42.jpg\"]'),(47,2,NULL,NULL,14,1,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\",\"products\\/18-3.jpg\",\"products\\/25-1.jpg\",\"products\\/36-2.jpg\"]'),(48,6,NULL,NULL,13,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/36-1.jpg\"]'),(49,2,NULL,NULL,6,4,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/25-2.jpg\"]'),(50,2,NULL,NULL,21,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/14.jpg\",\"products\\/27-1.jpg\",\"products\\/31.jpg\"]'),(51,8,NULL,NULL,26,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18.jpg\",\"products\\/30-2.jpg\",\"products\\/54.jpg\"]'),(52,9,NULL,NULL,57,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/26-1.jpg\",\"products\\/42-2.jpg\",\"products\\/60-1.jpg\"]'),(53,3,NULL,NULL,57,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/55.jpg\"]'),(54,1,NULL,NULL,21,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/62-1.jpg\"]'),(55,10,NULL,NULL,1,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/56.jpg\",\"products\\/60-2.jpg\"]'),(56,7,NULL,NULL,1,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\",\"products\\/56-2.jpg\"]'),(57,2,NULL,NULL,31,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-1.jpg\",\"products\\/44-2.jpg\",\"products\\/47.jpg\",\"products\\/50.jpg\"]'),(58,7,NULL,NULL,46,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/35-1.jpg\"]'),(60,4,NULL,NULL,64,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4.jpg\",\"products\\/9-2.jpg\",\"products\\/36-2.jpg\",\"products\\/44-2.jpg\"]'),(61,6,NULL,NULL,21,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/33-1.jpg\"]'),(62,9,NULL,NULL,48,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52-1.jpg\"]'),(63,2,NULL,NULL,2,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33-1.jpg\",\"products\\/46.jpg\",\"products\\/48-2.jpg\",\"products\\/56-2.jpg\"]'),(65,1,NULL,NULL,28,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/13-1.jpg\",\"products\\/19-1.jpg\",\"products\\/24-2.jpg\"]'),(66,9,NULL,NULL,41,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-1.jpg\",\"products\\/52-1.jpg\"]'),(67,7,NULL,NULL,54,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31.jpg\",\"products\\/59.jpg\",\"products\\/64-1.jpg\"]'),(68,9,NULL,NULL,5,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/34.jpg\"]'),(69,9,NULL,NULL,16,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/23.jpg\"]'),(70,9,NULL,NULL,62,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33.jpg\"]'),(71,6,NULL,NULL,40,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/28-1.jpg\",\"products\\/55-1.jpg\"]'),(72,6,NULL,NULL,28,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41-1.jpg\"]'),(73,4,NULL,NULL,23,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15-1.jpg\",\"products\\/28-1.jpg\",\"products\\/34.jpg\",\"products\\/36-1.jpg\"]'),(74,6,NULL,NULL,55,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\"]'),(75,8,NULL,NULL,48,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4.jpg\",\"products\\/19.jpg\",\"products\\/58.jpg\",\"products\\/65.jpg\"]'),(76,1,NULL,NULL,53,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-3.jpg\",\"products\\/29-2.jpg\",\"products\\/34-1.jpg\"]'),(78,6,NULL,NULL,54,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\",\"products\\/29-1.jpg\",\"products\\/45.jpg\",\"products\\/65.jpg\"]'),(79,7,NULL,NULL,63,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/34-1.jpg\",\"products\\/38.jpg\",\"products\\/40-1.jpg\",\"products\\/65-2.jpg\"]'),(80,7,NULL,NULL,33,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/56-2.jpg\"]'),(81,1,NULL,NULL,15,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13.jpg\",\"products\\/17.jpg\"]'),(82,6,NULL,NULL,60,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\",\"products\\/43.jpg\"]'),(83,3,NULL,NULL,33,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-2.jpg\"]'),(84,7,NULL,NULL,9,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/17-3.jpg\",\"products\\/36-2.jpg\",\"products\\/42-2.jpg\"]'),(85,2,NULL,NULL,16,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/27-1.jpg\",\"products\\/27.jpg\"]'),(86,4,NULL,NULL,11,2,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-2.jpg\",\"products\\/60-1.jpg\",\"products\\/61-1.jpg\"]'),(87,8,NULL,NULL,38,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/9.jpg\",\"products\\/49.jpg\",\"products\\/58.jpg\"]'),(89,8,NULL,NULL,47,5,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-2.jpg\",\"products\\/17.jpg\",\"products\\/18-3.jpg\",\"products\\/19.jpg\"]'),(90,8,NULL,NULL,34,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\",\"products\\/21-1.jpg\",\"products\\/29-2.jpg\",\"products\\/30-1.jpg\"]'),(91,5,NULL,NULL,53,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/18-2.jpg\"]'),(92,6,NULL,NULL,65,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/37.jpg\",\"products\\/56-2.jpg\"]'),(93,7,NULL,NULL,15,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-2.jpg\",\"products\\/12-1.jpg\",\"products\\/45-1.jpg\",\"products\\/53.jpg\"]'),(94,4,NULL,NULL,36,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18.jpg\",\"products\\/32-1.jpg\",\"products\\/45.jpg\"]'),(95,3,NULL,NULL,8,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/28-1.jpg\",\"products\\/32.jpg\",\"products\\/45-1.jpg\"]'),(96,9,NULL,NULL,20,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-2.jpg\",\"products\\/18-1.jpg\",\"products\\/47.jpg\",\"products\\/56-1.jpg\"]'),(97,9,NULL,NULL,59,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24-1.jpg\",\"products\\/47-1.jpg\",\"products\\/52-1.jpg\"]'),(100,1,NULL,NULL,20,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/21.jpg\"]'),(101,3,NULL,NULL,36,4,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31.jpg\",\"products\\/38-1.jpg\",\"products\\/51.jpg\",\"products\\/65.jpg\"]'),(102,6,NULL,NULL,27,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/23-2.jpg\",\"products\\/60-2.jpg\"]'),(104,2,NULL,NULL,10,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37-2.jpg\",\"products\\/55.jpg\"]'),(105,7,NULL,NULL,3,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/10.jpg\",\"products\\/33-2.jpg\",\"products\\/59-1.jpg\"]'),(106,10,NULL,NULL,38,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/56-1.jpg\"]'),(107,8,NULL,NULL,3,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24.jpg\",\"products\\/27.jpg\",\"products\\/60.jpg\"]'),(108,6,NULL,NULL,61,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-2.jpg\",\"products\\/43.jpg\",\"products\\/50.jpg\"]'),(109,2,NULL,NULL,56,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12.jpg\",\"products\\/41-1.jpg\"]'),(110,5,NULL,NULL,23,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37.jpg\"]'),(111,10,NULL,NULL,62,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19.jpg\",\"products\\/26.jpg\",\"products\\/27.jpg\"]'),(112,5,NULL,NULL,38,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/43.jpg\",\"products\\/46-1.jpg\"]'),(113,9,NULL,NULL,29,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/49-1.jpg\",\"products\\/49-2.jpg\"]'),(114,4,NULL,NULL,20,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/63.jpg\"]'),(115,6,NULL,NULL,14,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29-2.jpg\",\"products\\/65-1.jpg\"]'),(116,8,NULL,NULL,51,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/9-2.jpg\",\"products\\/42-2.jpg\",\"products\\/59-2.jpg\"]'),(117,9,NULL,NULL,45,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/65-1.jpg\"]'),(119,4,NULL,NULL,62,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15-1.jpg\",\"products\\/36-2.jpg\"]'),(120,4,NULL,NULL,8,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/62-1.jpg\"]'),(121,3,NULL,NULL,28,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/34.jpg\",\"products\\/38-2.jpg\"]'),(123,7,NULL,NULL,27,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/44-1.jpg\"]'),(124,8,NULL,NULL,2,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-2.jpg\"]'),(125,8,NULL,NULL,65,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-2.jpg\",\"products\\/24-2.jpg\",\"products\\/36-2.jpg\",\"products\\/38-2.jpg\"]'),(126,1,NULL,NULL,51,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/23.jpg\",\"products\\/50-1.jpg\",\"products\\/52.jpg\"]'),(127,5,NULL,NULL,62,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33.jpg\",\"products\\/42.jpg\"]'),(128,4,NULL,NULL,53,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11.jpg\",\"products\\/12-1.jpg\",\"products\\/24-1.jpg\",\"products\\/28-2.jpg\"]'),(129,1,NULL,NULL,57,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/60-1.jpg\"]'),(130,4,NULL,NULL,38,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/18-2.jpg\",\"products\\/27.jpg\",\"products\\/40.jpg\"]'),(131,5,NULL,NULL,43,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\",\"products\\/23-2.jpg\",\"products\\/45-1.jpg\"]'),(132,3,NULL,NULL,39,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-1.jpg\",\"products\\/38-1.jpg\",\"products\\/62.jpg\"]'),(133,6,NULL,NULL,8,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31.jpg\",\"products\\/60-2.jpg\"]'),(134,4,NULL,NULL,15,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/52.jpg\"]'),(136,7,NULL,NULL,23,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\"]'),(137,3,NULL,NULL,3,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/32-1.jpg\",\"products\\/36.jpg\",\"products\\/39-2.jpg\",\"products\\/58-2.jpg\"]'),(138,5,NULL,NULL,31,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42-1.jpg\",\"products\\/55.jpg\",\"products\\/62-1.jpg\"]'),(139,2,NULL,NULL,15,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52-2.jpg\"]'),(140,1,NULL,NULL,25,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42.jpg\",\"products\\/46.jpg\"]'),(141,4,NULL,NULL,24,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-3.jpg\"]'),(142,7,NULL,NULL,32,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-2.jpg\"]'),(143,10,NULL,NULL,45,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/59-2.jpg\"]'),(144,3,NULL,NULL,55,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/28.jpg\",\"products\\/50.jpg\",\"products\\/54.jpg\"]'),(145,5,NULL,NULL,25,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/8-3.jpg\",\"products\\/50-1.jpg\"]'),(146,6,NULL,NULL,26,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\"]'),(147,6,NULL,NULL,50,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/55.jpg\"]'),(148,4,NULL,NULL,18,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\"]'),(149,9,NULL,NULL,54,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/21.jpg\",\"products\\/28.jpg\",\"products\\/41.jpg\"]'),(150,10,NULL,NULL,47,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33.jpg\",\"products\\/59-2.jpg\"]'),(151,10,NULL,NULL,35,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37-1.jpg\",\"products\\/54-1.jpg\"]'),(152,2,NULL,NULL,7,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-3.jpg\",\"products\\/24-2.jpg\",\"products\\/60-1.jpg\",\"products\\/60-2.jpg\"]'),(153,10,NULL,NULL,9,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30.jpg\"]'),(154,1,NULL,NULL,47,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\",\"products\\/19-2.jpg\",\"products\\/37-1.jpg\",\"products\\/42-2.jpg\"]'),(156,5,NULL,NULL,32,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\"]'),(157,4,NULL,NULL,45,1,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-1.jpg\"]'),(162,3,NULL,NULL,26,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52.jpg\",\"products\\/54.jpg\"]'),(163,5,NULL,NULL,54,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\"]'),(164,1,NULL,NULL,33,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/28-2.jpg\"]'),(165,10,NULL,NULL,16,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-1.jpg\",\"products\\/38-3.jpg\",\"products\\/56.jpg\",\"products\\/59-3.jpg\"]'),(166,1,NULL,NULL,43,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/45.jpg\"]'),(167,4,NULL,NULL,37,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/21-2.jpg\",\"products\\/38-1.jpg\"]'),(168,9,NULL,NULL,28,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29.jpg\",\"products\\/30-2.jpg\"]'),(169,7,NULL,NULL,29,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22-3.jpg\",\"products\\/25-2.jpg\",\"products\\/25.jpg\",\"products\\/46-1.jpg\"]'),(170,10,NULL,NULL,2,1,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9.jpg\",\"products\\/11-3.jpg\",\"products\\/60-2.jpg\"]'),(171,3,NULL,NULL,10,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42-1.jpg\",\"products\\/57.jpg\"]'),(172,10,NULL,NULL,11,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\"]'),(173,8,NULL,NULL,6,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/28-1.jpg\"]'),(174,7,NULL,NULL,8,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36-2.jpg\"]'),(175,1,NULL,NULL,8,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/57-1.jpg\"]'),(176,1,NULL,NULL,42,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\",\"products\\/30.jpg\",\"products\\/35-1.jpg\",\"products\\/56.jpg\"]'),(178,9,NULL,NULL,8,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/12-1.jpg\",\"products\\/49-2.jpg\"]'),(179,1,NULL,NULL,63,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24-2.jpg\",\"products\\/25.jpg\",\"products\\/28.jpg\"]'),(180,4,NULL,NULL,16,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29.jpg\",\"products\\/60-2.jpg\"]'),(181,10,NULL,NULL,14,3,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\"]'),(182,9,NULL,NULL,2,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/11-1.jpg\",\"products\\/26.jpg\",\"products\\/27.jpg\"]'),(183,8,NULL,NULL,9,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-2.jpg\",\"products\\/36-1.jpg\",\"products\\/37-1.jpg\"]'),(184,5,NULL,NULL,6,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\",\"products\\/10-1.jpg\",\"products\\/20-1.jpg\",\"products\\/45.jpg\"]'),(187,9,NULL,NULL,47,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-2.jpg\"]'),(188,5,NULL,NULL,65,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\"]'),(189,1,NULL,NULL,11,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22-2.jpg\",\"products\\/22-3.jpg\",\"products\\/41.jpg\",\"products\\/48-1.jpg\"]'),(190,4,NULL,NULL,40,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18.jpg\",\"products\\/26-1.jpg\",\"products\\/42-1.jpg\"]'),(191,6,NULL,NULL,52,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-3.jpg\"]'),(195,1,NULL,NULL,56,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\",\"products\\/48-2.jpg\"]'),(196,1,NULL,NULL,48,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/20-3.jpg\",\"products\\/27.jpg\"]'),(197,3,NULL,NULL,52,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-1.jpg\",\"products\\/37-1.jpg\"]'),(198,8,NULL,NULL,64,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/24-1.jpg\",\"products\\/55-1.jpg\"]'),(199,10,NULL,NULL,13,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/25-1.jpg\",\"products\\/49-1.jpg\"]'),(200,6,NULL,NULL,51,5,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\"]'),(201,2,NULL,NULL,18,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/20-2.jpg\",\"products\\/24-1.jpg\",\"products\\/59.jpg\"]'),(202,7,NULL,NULL,4,4,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/42-2.jpg\",\"products\\/42.jpg\"]'),(203,5,NULL,NULL,10,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/39-1.jpg\",\"products\\/58.jpg\"]'),(204,2,NULL,NULL,49,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-3.jpg\"]'),(205,4,NULL,NULL,46,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/38.jpg\"]'),(206,10,NULL,NULL,52,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4.jpg\",\"products\\/17-3.jpg\",\"products\\/55.jpg\"]'),(208,1,NULL,NULL,23,4,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-1.jpg\",\"products\\/48-1.jpg\",\"products\\/58-1.jpg\"]'),(209,5,NULL,NULL,59,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/14.jpg\",\"products\\/26.jpg\",\"products\\/48.jpg\",\"products\\/65-1.jpg\"]'),(210,3,NULL,NULL,60,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31-1.jpg\"]'),(211,3,NULL,NULL,53,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/39-1.jpg\"]'),(212,7,NULL,NULL,64,5,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/20-3.jpg\",\"products\\/37.jpg\",\"products\\/39-1.jpg\"]'),(214,5,NULL,NULL,33,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24.jpg\",\"products\\/52-2.jpg\"]'),(215,1,NULL,NULL,2,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/14.jpg\",\"products\\/19-3.jpg\",\"products\\/54.jpg\"]'),(217,2,NULL,NULL,44,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38.jpg\",\"products\\/50.jpg\"]'),(218,1,NULL,NULL,39,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/47-1.jpg\",\"products\\/61-1.jpg\"]'),(220,2,NULL,NULL,45,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/32-2.jpg\",\"products\\/40.jpg\",\"products\\/42-1.jpg\"]'),(221,6,NULL,NULL,23,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-1.jpg\",\"products\\/22-1.jpg\",\"products\\/49-1.jpg\",\"products\\/55-1.jpg\"]'),(223,10,NULL,NULL,51,4,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-1.jpg\",\"products\\/46-1.jpg\",\"products\\/47-1.jpg\"]'),(224,5,NULL,NULL,3,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37.jpg\",\"products\\/43.jpg\",\"products\\/48-1.jpg\"]'),(226,4,NULL,NULL,1,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-1.jpg\",\"products\\/19-3.jpg\"]'),(228,1,NULL,NULL,65,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/46.jpg\"]'),(232,1,NULL,NULL,59,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-3.jpg\",\"products\\/32-2.jpg\",\"products\\/50.jpg\",\"products\\/63.jpg\"]'),(233,5,NULL,NULL,4,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/49-2.jpg\",\"products\\/54.jpg\"]'),(234,10,NULL,NULL,54,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-2.jpg\",\"products\\/15.jpg\",\"products\\/53-1.jpg\",\"products\\/59-2.jpg\"]'),(235,2,NULL,NULL,51,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19.jpg\",\"products\\/22-2.jpg\"]'),(236,6,NULL,NULL,57,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/47.jpg\"]'),(238,3,NULL,NULL,1,1,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41-1.jpg\",\"products\\/44-1.jpg\",\"products\\/56.jpg\"]'),(239,9,NULL,NULL,6,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/58-2.jpg\"]'),(240,2,NULL,NULL,20,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42-1.jpg\",\"products\\/48-1.jpg\",\"products\\/55-2.jpg\"]'),(241,6,NULL,NULL,48,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/46-1.jpg\"]'),(242,1,NULL,NULL,64,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-1.jpg\",\"products\\/20-1.jpg\",\"products\\/24-1.jpg\",\"products\\/48-2.jpg\"]'),(244,3,NULL,NULL,41,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11.jpg\",\"products\\/23-2.jpg\",\"products\\/39.jpg\"]'),(245,8,NULL,NULL,18,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/21.jpg\",\"products\\/49-2.jpg\"]'),(247,2,NULL,NULL,19,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52.jpg\"]'),(248,3,NULL,NULL,44,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/59-3.jpg\"]'),(249,6,NULL,NULL,12,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/36.jpg\"]'),(250,5,NULL,NULL,27,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24-1.jpg\"]'),(251,3,NULL,NULL,23,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-2.jpg\",\"products\\/56.jpg\"]'),(252,8,NULL,NULL,33,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/15.jpg\",\"products\\/57-1.jpg\",\"products\\/58-1.jpg\"]'),(253,5,NULL,NULL,5,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/34-1.jpg\"]'),(255,3,NULL,NULL,20,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-3.jpg\",\"products\\/19.jpg\",\"products\\/20-2.jpg\",\"products\\/32-1.jpg\"]'),(256,1,NULL,NULL,61,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/38-1.jpg\",\"products\\/65-2.jpg\"]'),(259,7,NULL,NULL,26,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/18-3.jpg\",\"products\\/20.jpg\"]'),(261,4,NULL,NULL,52,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\"]'),(262,4,NULL,NULL,65,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42-1.jpg\"]'),(265,8,NULL,NULL,20,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29-1.jpg\"]'),(267,7,NULL,NULL,58,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/19-2.jpg\",\"products\\/22-2.jpg\",\"products\\/58-2.jpg\"]'),(270,7,NULL,NULL,41,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/2-1.jpg\",\"products\\/62.jpg\"]'),(271,2,NULL,NULL,58,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11.jpg\",\"products\\/18-3.jpg\",\"products\\/19-2.jpg\"]'),(274,6,NULL,NULL,4,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/62.jpg\"]'),(275,4,NULL,NULL,30,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/25-1.jpg\",\"products\\/30-1.jpg\",\"products\\/55-1.jpg\"]'),(276,1,NULL,NULL,49,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/9.jpg\",\"products\\/32.jpg\",\"products\\/39-1.jpg\"]'),(278,9,NULL,NULL,65,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/43-1.jpg\"]'),(283,8,NULL,NULL,22,4,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8.jpg\",\"products\\/19-2.jpg\",\"products\\/33-1.jpg\",\"products\\/41-2.jpg\"]'),(285,2,NULL,NULL,63,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\"]'),(288,6,NULL,NULL,30,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\"]'),(289,7,NULL,NULL,17,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\",\"products\\/36-2.jpg\",\"products\\/46.jpg\",\"products\\/55-2.jpg\"]'),(291,3,NULL,NULL,18,2,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22.jpg\",\"products\\/58-2.jpg\"]'),(293,1,NULL,NULL,4,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\",\"products\\/19.jpg\",\"products\\/27.jpg\",\"products\\/65-1.jpg\"]'),(294,9,NULL,NULL,12,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/15-1.jpg\",\"products\\/43-2.jpg\",\"products\\/49-2.jpg\"]'),(297,8,NULL,NULL,35,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/11-2.jpg\",\"products\\/57-1.jpg\"]'),(298,8,NULL,NULL,54,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22-2.jpg\",\"products\\/40.jpg\",\"products\\/56-1.jpg\"]'),(299,6,NULL,NULL,59,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/34.jpg\",\"products\\/35.jpg\",\"products\\/63-1.jpg\"]'),(300,4,NULL,NULL,56,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/8.jpg\",\"products\\/19-3.jpg\",\"products\\/54-1.jpg\"]'),(301,9,NULL,NULL,22,2,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/33-1.jpg\",\"products\\/35.jpg\",\"products\\/54.jpg\"]'),(304,1,NULL,NULL,3,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-2.jpg\",\"products\\/26.jpg\",\"products\\/53.jpg\",\"products\\/54.jpg\"]'),(306,2,NULL,NULL,55,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-3.jpg\"]'),(307,10,NULL,NULL,61,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33.jpg\"]'),(310,2,NULL,NULL,35,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/3.jpg\",\"products\\/24-1.jpg\"]'),(312,1,NULL,NULL,13,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\",\"products\\/33-2.jpg\",\"products\\/45.jpg\"]'),(317,2,NULL,NULL,5,3,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/54.jpg\"]'),(318,8,NULL,NULL,59,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/22.jpg\",\"products\\/36-2.jpg\"]'),(319,1,NULL,NULL,52,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-2.jpg\"]'),(321,9,NULL,NULL,1,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-3.jpg\",\"products\\/24-1.jpg\",\"products\\/25.jpg\",\"products\\/43.jpg\"]'),(322,4,NULL,NULL,25,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/40.jpg\",\"products\\/61.jpg\"]'),(323,5,NULL,NULL,34,1,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/21-1.jpg\",\"products\\/22.jpg\",\"products\\/39-1.jpg\"]'),(324,7,NULL,NULL,10,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/12-1.jpg\",\"products\\/41.jpg\"]'),(325,1,NULL,NULL,31,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/25-1.jpg\"]'),(328,8,NULL,NULL,40,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-2.jpg\",\"products\\/63-1.jpg\"]'),(330,10,NULL,NULL,59,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/61.jpg\"]'),(331,2,NULL,NULL,22,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-1.jpg\"]'),(332,4,NULL,NULL,47,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/18-2.jpg\"]'),(333,8,NULL,NULL,10,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-2.jpg\",\"products\\/53-1.jpg\"]'),(336,1,NULL,NULL,46,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-2.jpg\",\"products\\/59-3.jpg\"]'),(337,2,NULL,NULL,47,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10.jpg\"]'),(338,3,NULL,NULL,49,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/57.jpg\",\"products\\/62.jpg\"]'),(339,10,NULL,NULL,15,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-2.jpg\",\"products\\/39-2.jpg\",\"products\\/58-1.jpg\",\"products\\/64.jpg\"]'),(340,4,NULL,NULL,9,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33-1.jpg\",\"products\\/38-2.jpg\",\"products\\/49-2.jpg\",\"products\\/64.jpg\"]'),(343,3,NULL,NULL,42,2,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10.jpg\",\"products\\/33.jpg\",\"products\\/62-1.jpg\"]'),(344,1,NULL,NULL,7,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\"]'),(345,2,NULL,NULL,65,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\"]'),(348,6,NULL,NULL,46,5,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/10-2.jpg\"]'),(350,5,NULL,NULL,20,3,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/53-1.jpg\"]'),(354,3,NULL,NULL,25,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/42.jpg\",\"products\\/59-1.jpg\"]'),(356,9,NULL,NULL,19,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-2.jpg\",\"products\\/23-3.jpg\",\"products\\/29-1.jpg\",\"products\\/42.jpg\"]'),(359,5,NULL,NULL,41,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-1.jpg\"]'),(360,9,NULL,NULL,42,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/22-1.jpg\",\"products\\/59-1.jpg\"]'),(363,4,NULL,NULL,32,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/54-1.jpg\"]'),(364,7,NULL,NULL,61,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/19.jpg\",\"products\\/55-1.jpg\"]'),(365,6,NULL,NULL,2,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/25-2.jpg\"]'),(366,2,NULL,NULL,8,5,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8.jpg\"]'),(367,6,NULL,NULL,9,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/14.jpg\",\"products\\/28-1.jpg\",\"products\\/42-2.jpg\",\"products\\/50-1.jpg\"]'),(372,8,NULL,NULL,16,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37-1.jpg\",\"products\\/59-2.jpg\"]'),(373,3,NULL,NULL,54,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10.jpg\",\"products\\/57-1.jpg\",\"products\\/64-1.jpg\"]'),(374,1,NULL,NULL,1,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/27-1.jpg\",\"products\\/41-1.jpg\",\"products\\/52-2.jpg\"]'),(375,3,NULL,NULL,46,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\",\"products\\/22-3.jpg\",\"products\\/24-2.jpg\",\"products\\/26.jpg\"]'),(376,8,NULL,NULL,41,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/60.jpg\"]'),(377,4,NULL,NULL,58,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-1.jpg\",\"products\\/55.jpg\"]'),(378,7,NULL,NULL,52,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\"]'),(379,8,NULL,NULL,39,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\",\"products\\/39.jpg\",\"products\\/57.jpg\"]'),(381,5,NULL,NULL,48,5,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-3.jpg\",\"products\\/21-1.jpg\",\"products\\/33-1.jpg\"]'),(382,6,NULL,NULL,42,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-2.jpg\",\"products\\/58-1.jpg\"]'),(385,5,NULL,NULL,8,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-2.jpg\"]'),(386,5,NULL,NULL,49,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-3.jpg\",\"products\\/38.jpg\",\"products\\/41-1.jpg\",\"products\\/57-1.jpg\"]'),(390,5,NULL,NULL,12,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/32-2.jpg\",\"products\\/41-2.jpg\",\"products\\/59-2.jpg\"]'),(391,5,NULL,NULL,57,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-2.jpg\",\"products\\/20-3.jpg\",\"products\\/39-2.jpg\",\"products\\/42.jpg\"]'),(392,3,NULL,NULL,37,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-2.jpg\",\"products\\/23.jpg\",\"products\\/43-1.jpg\"]'),(393,4,NULL,NULL,63,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-3.jpg\",\"products\\/47-1.jpg\",\"products\\/50.jpg\"]'),(394,2,NULL,NULL,28,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/16.jpg\",\"products\\/17-3.jpg\",\"products\\/59-2.jpg\"]'),(395,9,NULL,NULL,33,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/23.jpg\",\"products\\/40-1.jpg\",\"products\\/48.jpg\"]'),(396,4,NULL,NULL,43,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-1.jpg\",\"products\\/21.jpg\",\"products\\/36-1.jpg\",\"products\\/42-1.jpg\"]'),(398,6,NULL,NULL,38,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-2.jpg\",\"products\\/34.jpg\",\"products\\/49-1.jpg\",\"products\\/54-1.jpg\"]'),(399,4,NULL,NULL,3,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\",\"products\\/21.jpg\",\"products\\/22.jpg\"]'),(400,4,NULL,NULL,21,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-1.jpg\"]'),(401,5,NULL,NULL,17,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-3.jpg\",\"products\\/58-2.jpg\"]'),(405,3,NULL,NULL,4,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\",\"products\\/39-2.jpg\",\"products\\/59-2.jpg\"]'),(406,10,NULL,NULL,48,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/49-1.jpg\",\"products\\/52-1.jpg\"]'),(408,9,NULL,NULL,53,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\"]'),(409,8,NULL,NULL,29,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41-2.jpg\",\"products\\/59-2.jpg\",\"products\\/65-1.jpg\"]'),(412,10,NULL,NULL,36,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29-1.jpg\"]'),(413,10,NULL,NULL,18,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-1.jpg\"]'),(415,1,NULL,NULL,34,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/15-1.jpg\",\"products\\/18.jpg\",\"products\\/23-2.jpg\"]'),(416,6,NULL,NULL,34,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/34.jpg\",\"products\\/61-1.jpg\",\"products\\/65-2.jpg\"]'),(417,8,NULL,NULL,19,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19.jpg\"]'),(418,6,NULL,NULL,64,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/58.jpg\"]'),(419,5,NULL,NULL,44,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-2.jpg\",\"products\\/37-1.jpg\",\"products\\/37-2.jpg\"]'),(420,9,NULL,NULL,13,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/8-2.jpg\",\"products\\/44.jpg\",\"products\\/65-2.jpg\"]'),(421,7,NULL,NULL,60,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4.jpg\",\"products\\/12-2.jpg\",\"products\\/44.jpg\"]'),(422,3,NULL,NULL,6,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30.jpg\"]'),(424,1,NULL,NULL,44,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/39-2.jpg\",\"products\\/50.jpg\",\"products\\/57-1.jpg\",\"products\\/59.jpg\"]'),(425,1,NULL,NULL,55,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\",\"products\\/8-1.jpg\"]'),(427,9,NULL,NULL,46,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-3.jpg\"]'),(431,4,NULL,NULL,39,4,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/24-2.jpg\",\"products\\/43-2.jpg\"]'),(432,6,NULL,NULL,39,1,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29-1.jpg\",\"products\\/29-2.jpg\",\"products\\/31-1.jpg\"]'),(434,6,NULL,NULL,29,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/57.jpg\"]'),(436,3,NULL,NULL,62,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\",\"products\\/21.jpg\",\"products\\/39-2.jpg\",\"products\\/59-2.jpg\"]'),(440,10,NULL,NULL,21,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4.jpg\",\"products\\/26.jpg\",\"products\\/38-2.jpg\",\"products\\/65.jpg\"]'),(442,8,NULL,NULL,15,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23.jpg\",\"products\\/25.jpg\",\"products\\/30-2.jpg\",\"products\\/34-1.jpg\"]'),(445,4,NULL,NULL,26,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/58.jpg\",\"products\\/61-1.jpg\"]'),(446,5,NULL,NULL,60,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/24-1.jpg\",\"products\\/31.jpg\"]'),(448,7,NULL,NULL,2,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/32-1.jpg\",\"products\\/40-1.jpg\",\"products\\/43.jpg\",\"products\\/53.jpg\"]'),(450,7,NULL,NULL,34,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/58.jpg\"]'),(452,8,NULL,NULL,17,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-3.jpg\",\"products\\/49-1.jpg\",\"products\\/58-1.jpg\",\"products\\/60-1.jpg\"]'),(454,3,NULL,NULL,13,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-2.jpg\",\"products\\/26.jpg\",\"products\\/37.jpg\",\"products\\/61.jpg\"]'),(458,8,NULL,NULL,60,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/18-1.jpg\",\"products\\/26.jpg\"]'),(459,7,NULL,NULL,51,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18.jpg\",\"products\\/59-2.jpg\"]'),(460,10,NULL,NULL,50,2,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36-1.jpg\",\"products\\/37-1.jpg\",\"products\\/50.jpg\"]'),(462,2,NULL,NULL,64,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/27.jpg\",\"products\\/39-2.jpg\"]'),(465,5,NULL,NULL,29,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/15-1.jpg\",\"products\\/53-1.jpg\",\"products\\/57.jpg\"]'),(467,5,NULL,NULL,63,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-2.jpg\",\"products\\/52-1.jpg\"]'),(470,7,NULL,NULL,45,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/55-1.jpg\"]'),(474,2,NULL,NULL,62,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-1.jpg\",\"products\\/29-2.jpg\",\"products\\/35.jpg\",\"products\\/51.jpg\"]'),(475,6,NULL,NULL,17,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\",\"products\\/12-2.jpg\",\"products\\/21.jpg\"]'),(480,7,NULL,NULL,59,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/27.jpg\"]'),(483,3,NULL,NULL,27,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-2.jpg\",\"products\\/23-1.jpg\",\"products\\/33-1.jpg\",\"products\\/54.jpg\"]'),(484,5,NULL,NULL,11,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\",\"products\\/43-2.jpg\",\"products\\/46-1.jpg\"]'),(485,6,NULL,NULL,3,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/44.jpg\"]'),(488,7,NULL,NULL,53,2,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31-1.jpg\",\"products\\/44-1.jpg\",\"products\\/60.jpg\"]'),(490,7,NULL,NULL,25,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-2.jpg\",\"products\\/15.jpg\",\"products\\/28.jpg\",\"products\\/40.jpg\"]'),(491,4,NULL,NULL,22,5,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/4-3.jpg\",\"products\\/41-1.jpg\",\"products\\/42-1.jpg\"]'),(492,1,NULL,NULL,35,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10.jpg\",\"products\\/64-1.jpg\"]'),(493,6,NULL,NULL,35,1,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/52.jpg\",\"products\\/61-1.jpg\",\"products\\/65-2.jpg\"]'),(494,4,NULL,NULL,59,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-2.jpg\",\"products\\/41-1.jpg\",\"products\\/48.jpg\",\"products\\/60-1.jpg\"]'),(495,10,NULL,NULL,44,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/8-2.jpg\",\"products\\/39.jpg\"]'),(496,4,NULL,NULL,2,1,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/49-2.jpg\",\"products\\/65-1.jpg\"]'),(497,8,NULL,NULL,56,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/20-1.jpg\",\"products\\/31-1.jpg\",\"products\\/38-2.jpg\"]'),(499,9,NULL,NULL,18,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13-1.jpg\",\"products\\/27-1.jpg\",\"products\\/28-1.jpg\",\"products\\/50.jpg\"]'),(502,8,NULL,NULL,23,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\",\"products\\/25-1.jpg\"]'),(504,7,NULL,NULL,6,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52.jpg\"]'),(506,9,NULL,NULL,27,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\"]'),(509,10,NULL,NULL,6,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22.jpg\"]'),(514,9,NULL,NULL,25,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/19-3.jpg\",\"products\\/28-2.jpg\",\"products\\/55-2.jpg\"]'),(518,9,NULL,NULL,36,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-3.jpg\",\"products\\/42.jpg\",\"products\\/46-1.jpg\"]'),(522,9,NULL,NULL,37,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\",\"products\\/46-1.jpg\",\"products\\/63.jpg\",\"products\\/64.jpg\"]'),(523,7,NULL,NULL,13,2,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-1.jpg\"]'),(524,7,NULL,NULL,14,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/37-2.jpg\"]'),(525,5,NULL,NULL,56,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/43.jpg\"]'),(526,8,NULL,NULL,24,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\"]'),(530,5,NULL,NULL,1,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/45-1.jpg\",\"products\\/58-2.jpg\"]'),(531,8,NULL,NULL,12,4,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13.jpg\",\"products\\/28-2.jpg\",\"products\\/35.jpg\"]'),(534,2,NULL,NULL,23,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/32.jpg\",\"products\\/33-1.jpg\",\"products\\/38-2.jpg\",\"products\\/41-1.jpg\"]'),(536,6,NULL,NULL,62,1,'Best ecommerce CMS online store!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/59-3.jpg\",\"products\\/64-1.jpg\"]'),(537,3,NULL,NULL,9,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41-2.jpg\",\"products\\/56-1.jpg\"]'),(539,3,NULL,NULL,5,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\"]'),(541,8,NULL,NULL,28,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/50-1.jpg\",\"products\\/63.jpg\"]'),(542,5,NULL,NULL,36,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/45-1.jpg\",\"products\\/59-1.jpg\",\"products\\/65-1.jpg\"]'),(544,2,NULL,NULL,48,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/40.jpg\"]'),(551,8,NULL,NULL,32,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-3.jpg\",\"products\\/47-1.jpg\"]'),(552,7,NULL,NULL,31,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19.jpg\",\"products\\/22-1.jpg\",\"products\\/23.jpg\",\"products\\/59-3.jpg\"]'),(555,1,NULL,NULL,38,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22-2.jpg\"]'),(556,4,NULL,NULL,10,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/59-1.jpg\",\"products\\/65-1.jpg\"]'),(557,6,NULL,NULL,36,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36.jpg\"]'),(558,10,NULL,NULL,65,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-2.jpg\",\"products\\/28-2.jpg\"]'),(560,4,NULL,NULL,42,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/26.jpg\",\"products\\/30-2.jpg\",\"products\\/55.jpg\"]'),(566,2,NULL,NULL,29,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-1.jpg\",\"products\\/58.jpg\"]'),(569,7,NULL,NULL,49,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11.jpg\",\"products\\/18-2.jpg\",\"products\\/38.jpg\"]'),(583,2,NULL,NULL,61,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/43-2.jpg\"]'),(584,9,NULL,NULL,58,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/3.jpg\",\"products\\/31-1.jpg\",\"products\\/33-2.jpg\",\"products\\/45.jpg\"]'),(587,5,NULL,NULL,61,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-2.jpg\",\"products\\/20-3.jpg\"]'),(591,3,NULL,NULL,38,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/49-2.jpg\"]'),(592,7,NULL,NULL,7,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-3.jpg\",\"products\\/17-3.jpg\",\"products\\/23.jpg\",\"products\\/54.jpg\"]'),(594,3,NULL,NULL,51,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-1.jpg\",\"products\\/48-2.jpg\",\"products\\/56-1.jpg\"]'),(598,10,NULL,NULL,64,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/23-1.jpg\",\"products\\/48.jpg\",\"products\\/53.jpg\"]'),(600,6,NULL,NULL,20,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31.jpg\",\"products\\/37-1.jpg\",\"products\\/44-1.jpg\"]'),(607,7,NULL,NULL,19,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/39-2.jpg\"]'),(608,6,NULL,NULL,37,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-2.jpg\",\"products\\/32-2.jpg\",\"products\\/44-2.jpg\",\"products\\/60-1.jpg\"]'),(609,3,NULL,NULL,16,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/50-1.jpg\",\"products\\/59-2.jpg\"]'),(613,5,NULL,NULL,26,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/46.jpg\"]'),(614,3,NULL,NULL,17,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/23-1.jpg\",\"products\\/38-2.jpg\",\"products\\/47.jpg\"]'),(615,8,NULL,NULL,63,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52-1.jpg\"]'),(618,8,NULL,NULL,13,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17.jpg\",\"products\\/19-2.jpg\",\"products\\/39-2.jpg\"]'),(623,10,NULL,NULL,8,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\"]'),(626,7,NULL,NULL,50,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/58.jpg\"]'),(628,4,NULL,NULL,5,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/29.jpg\",\"products\\/30-2.jpg\",\"products\\/38-3.jpg\",\"products\\/48.jpg\"]'),(630,9,NULL,NULL,35,4,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/22-1.jpg\"]'),(634,7,NULL,NULL,56,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/12-3.jpg\",\"products\\/20-2.jpg\",\"products\\/25-2.jpg\"]'),(636,7,NULL,NULL,16,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/36-1.jpg\"]'),(642,8,NULL,NULL,25,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/18-2.jpg\"]'),(644,8,NULL,NULL,50,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/55-2.jpg\",\"products\\/65.jpg\"]'),(645,7,NULL,NULL,30,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/40.jpg\"]'),(646,9,NULL,NULL,51,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12-3.jpg\",\"products\\/55-1.jpg\"]'),(650,9,NULL,NULL,61,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-3.jpg\",\"products\\/48-2.jpg\",\"products\\/62-1.jpg\",\"products\\/64-1.jpg\"]'),(651,8,NULL,NULL,57,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15-1.jpg\",\"products\\/19.jpg\",\"products\\/59.jpg\"]'),(653,2,NULL,NULL,46,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/48-2.jpg\"]'),(655,5,NULL,NULL,64,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\",\"products\\/31-1.jpg\",\"products\\/38-1.jpg\",\"products\\/52-1.jpg\"]'),(656,10,NULL,NULL,12,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/39-1.jpg\",\"products\\/50.jpg\",\"products\\/57.jpg\",\"products\\/63-1.jpg\"]'),(658,2,NULL,NULL,4,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/39-2.jpg\",\"products\\/56.jpg\"]'),(661,2,NULL,NULL,24,5,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10.jpg\",\"products\\/15-1.jpg\",\"products\\/30-1.jpg\",\"products\\/37.jpg\"]'),(670,2,NULL,NULL,40,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30.jpg\",\"products\\/32-2.jpg\",\"products\\/57.jpg\"]'),(671,9,NULL,NULL,9,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36-2.jpg\",\"products\\/55-2.jpg\"]'),(673,9,NULL,NULL,31,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52-1.jpg\"]'),(676,3,NULL,NULL,48,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/33-1.jpg\"]'),(677,1,NULL,NULL,22,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\",\"products\\/25.jpg\"]'),(678,3,NULL,NULL,7,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/11.jpg\"]'),(679,2,NULL,NULL,54,2,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/13.jpg\",\"products\\/28-1.jpg\",\"products\\/31-1.jpg\",\"products\\/52-1.jpg\"]'),(680,3,NULL,NULL,14,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\"]'),(683,6,NULL,NULL,24,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/39-2.jpg\",\"products\\/42-2.jpg\",\"products\\/52-2.jpg\",\"products\\/58-2.jpg\"]'),(685,10,NULL,NULL,28,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-1.jpg\",\"products\\/22.jpg\",\"products\\/38.jpg\",\"products\\/45-1.jpg\"]'),(690,4,NULL,NULL,28,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-2.jpg\",\"products\\/18-2.jpg\",\"products\\/42-1.jpg\"]'),(691,3,NULL,NULL,64,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/47.jpg\"]'),(695,3,NULL,NULL,50,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/31-1.jpg\"]'),(698,8,NULL,NULL,52,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/10-1.jpg\",\"products\\/19-1.jpg\"]'),(699,6,NULL,NULL,44,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30.jpg\",\"products\\/53-1.jpg\"]'),(708,5,NULL,NULL,58,1,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/4-3.jpg\",\"products\\/59-3.jpg\"]'),(712,9,NULL,NULL,39,5,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/38-1.jpg\",\"products\\/38.jpg\",\"products\\/39-1.jpg\",\"products\\/60-2.jpg\"]'),(714,2,NULL,NULL,25,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-2.jpg\",\"products\\/19-1.jpg\",\"products\\/31.jpg\",\"products\\/48.jpg\"]'),(715,5,NULL,NULL,15,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/28.jpg\"]'),(718,2,NULL,NULL,42,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-1.jpg\",\"products\\/42-1.jpg\"]'),(722,1,NULL,NULL,6,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/12.jpg\",\"products\\/22-1.jpg\"]'),(723,10,NULL,NULL,49,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/13-1.jpg\",\"products\\/56-1.jpg\",\"products\\/59-2.jpg\"]'),(735,10,NULL,NULL,19,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/58-2.jpg\"]'),(737,3,NULL,NULL,2,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8-1.jpg\",\"products\\/13-1.jpg\",\"products\\/21-1.jpg\",\"products\\/61-1.jpg\"]'),(738,9,NULL,NULL,7,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\",\"products\\/22-2.jpg\",\"products\\/36-1.jpg\"]'),(739,10,NULL,NULL,56,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/41-2.jpg\",\"products\\/52.jpg\"]'),(742,6,NULL,NULL,45,3,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19.jpg\",\"products\\/22-2.jpg\",\"products\\/55.jpg\"]'),(746,5,NULL,NULL,42,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/63-1.jpg\"]'),(752,2,NULL,NULL,39,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\",\"products\\/20-1.jpg\",\"products\\/56-1.jpg\",\"products\\/59.jpg\"]'),(754,7,NULL,NULL,42,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/11-3.jpg\",\"products\\/35-1.jpg\",\"products\\/59.jpg\"]'),(758,1,NULL,NULL,24,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/28-1.jpg\"]'),(759,5,NULL,NULL,7,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36-1.jpg\",\"products\\/36.jpg\"]'),(762,5,NULL,NULL,24,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-2.jpg\",\"products\\/63.jpg\",\"products\\/65.jpg\"]'),(763,9,NULL,NULL,24,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-1.jpg\",\"products\\/22-1.jpg\"]'),(767,3,NULL,NULL,35,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/19-3.jpg\",\"products\\/19.jpg\",\"products\\/45.jpg\"]'),(769,2,NULL,NULL,53,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-3.jpg\",\"products\\/39-2.jpg\",\"products\\/59-1.jpg\",\"products\\/60-2.jpg\"]'),(776,5,NULL,NULL,9,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20-2.jpg\",\"products\\/45-1.jpg\",\"products\\/54.jpg\"]'),(782,5,NULL,NULL,51,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\",\"products\\/38.jpg\"]'),(786,4,NULL,NULL,35,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/21-2.jpg\"]'),(798,3,NULL,NULL,12,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/9.jpg\",\"products\\/30-2.jpg\"]'),(800,7,NULL,NULL,38,2,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/33-2.jpg\",\"products\\/58.jpg\"]'),(803,2,NULL,NULL,1,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/22-2.jpg\",\"products\\/30-1.jpg\"]'),(806,9,NULL,NULL,50,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18.jpg\"]'),(813,1,NULL,NULL,30,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/28.jpg\",\"products\\/51.jpg\"]'),(816,1,NULL,NULL,16,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/34.jpg\"]'),(822,1,NULL,NULL,37,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/51.jpg\"]'),(824,8,NULL,NULL,27,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/8-1.jpg\",\"products\\/49-2.jpg\"]'),(825,4,NULL,NULL,49,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\"]'),(826,5,NULL,NULL,22,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/21-2.jpg\",\"products\\/34.jpg\",\"products\\/49.jpg\",\"products\\/63.jpg\"]'),(831,6,NULL,NULL,16,2,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\"]'),(835,5,NULL,NULL,45,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2-2.jpg\",\"products\\/32.jpg\",\"products\\/64-1.jpg\"]'),(837,2,NULL,NULL,43,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30-1.jpg\",\"products\\/35-1.jpg\",\"products\\/47.jpg\",\"products\\/53.jpg\"]'),(842,3,NULL,NULL,56,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/12-2.jpg\",\"products\\/21-1.jpg\",\"products\\/50.jpg\"]'),(845,3,NULL,NULL,63,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-2.jpg\",\"products\\/24-1.jpg\",\"products\\/29.jpg\"]'),(846,2,NULL,NULL,27,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/55-1.jpg\"]'),(850,5,NULL,NULL,21,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/9-2.jpg\",\"products\\/19-2.jpg\",\"products\\/32-1.jpg\",\"products\\/46.jpg\"]'),(853,3,NULL,NULL,19,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/36.jpg\",\"products\\/64-1.jpg\"]'),(855,1,NULL,NULL,17,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/27.jpg\",\"products\\/36-2.jpg\",\"products\\/40.jpg\",\"products\\/47-1.jpg\"]'),(858,7,NULL,NULL,24,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/10-1.jpg\",\"products\\/35.jpg\",\"products\\/44-1.jpg\"]'),(859,6,NULL,NULL,41,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5.jpg\"]'),(869,10,NULL,NULL,33,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/17-3.jpg\",\"products\\/25-1.jpg\",\"products\\/58-2.jpg\"]'),(873,9,NULL,NULL,32,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/33-1.jpg\"]'),(876,6,NULL,NULL,31,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/23-2.jpg\",\"products\\/30.jpg\",\"products\\/33-2.jpg\",\"products\\/53-1.jpg\"]'),(885,9,NULL,NULL,10,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\",\"products\\/59-3.jpg\"]'),(889,1,NULL,NULL,18,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/52.jpg\"]'),(891,3,NULL,NULL,43,5,'Good app, good backup service and support. Good documentation.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/19.jpg\",\"products\\/32-2.jpg\",\"products\\/41.jpg\"]'),(895,6,NULL,NULL,1,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/54-1.jpg\"]'),(896,8,NULL,NULL,44,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/60-1.jpg\"]'),(897,8,NULL,NULL,4,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/16.jpg\",\"products\\/60.jpg\",\"products\\/63.jpg\"]'),(905,9,NULL,NULL,30,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/5-3.jpg\",\"products\\/12.jpg\",\"products\\/57.jpg\"]'),(913,5,NULL,NULL,46,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-1.jpg\",\"products\\/18-3.jpg\",\"products\\/25.jpg\"]'),(916,8,NULL,NULL,45,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/11-2.jpg\"]'),(919,3,NULL,NULL,31,3,'Clean & perfect source code','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/11-2.jpg\"]'),(924,3,NULL,NULL,61,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/30-1.jpg\"]'),(927,7,NULL,NULL,48,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/54-1.jpg\"]'),(938,9,NULL,NULL,52,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/15.jpg\",\"products\\/30-1.jpg\",\"products\\/37-1.jpg\",\"products\\/45.jpg\"]'),(939,10,NULL,NULL,24,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-3.jpg\",\"products\\/28.jpg\",\"products\\/30-1.jpg\"]'),(944,7,NULL,NULL,12,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/5-1.jpg\",\"products\\/7.jpg\"]'),(949,2,NULL,NULL,37,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/7.jpg\",\"products\\/21-1.jpg\",\"products\\/24-2.jpg\",\"products\\/41-1.jpg\"]'),(950,4,NULL,NULL,48,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/32.jpg\",\"products\\/38-1.jpg\",\"products\\/58-2.jpg\"]'),(951,10,NULL,NULL,26,5,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/6.jpg\",\"products\\/22-1.jpg\",\"products\\/30-1.jpg\",\"products\\/30-2.jpg\"]'),(956,6,NULL,NULL,11,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/20.jpg\",\"products\\/26-1.jpg\",\"products\\/56.jpg\"]'),(962,5,NULL,NULL,14,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/4-3.jpg\",\"products\\/10-1.jpg\",\"products\\/29.jpg\",\"products\\/48-2.jpg\"]'),(976,6,NULL,NULL,43,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/28-1.jpg\"]'),(978,2,NULL,NULL,34,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/1.jpg\",\"products\\/11-2.jpg\",\"products\\/48-1.jpg\",\"products\\/53-1.jpg\"]'),(981,4,NULL,NULL,12,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/2.jpg\",\"products\\/8-1.jpg\",\"products\\/36-2.jpg\"]'),(983,1,NULL,NULL,54,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/61.jpg\"]'),(987,9,NULL,NULL,56,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/18-1.jpg\",\"products\\/47.jpg\"]'),(995,8,NULL,NULL,8,5,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/8.jpg\",\"products\\/18-3.jpg\",\"products\\/46.jpg\"]'),(999,9,NULL,NULL,23,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-03-28 07:26:37','2025-03-28 07:26:37','[\"products\\/17-3.jpg\",\"products\\/24-2.jpg\",\"products\\/37-2.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shared_wishlists`
--

DROP TABLE IF EXISTS `ec_shared_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shared_wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shared_wishlists_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shared_wishlists`
--

LOCK TABLES `ec_shared_wishlists` WRITE;
/*!40000 ALTER TABLE `ec_shared_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shared_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double DEFAULT '0',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `customer_delivered_confirmed_at` timestamp NULL DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2025-03-28 07:26:30','2025-03-28 07:26:30');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',1000.00,NULL,0.00,'2025-03-28 07:26:30','2025-03-28 07:26:30'),(2,'Flat Rate',1,'based_on_price',0.00,NULL,20.00,'2025-03-28 07:26:30','2025-03-28 07:26:30'),(3,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2025-03-28 07:26:30','2025-03-28 07:26:30');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes`
--

DROP TABLE IF EXISTS `ec_specification_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_attributes_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes`
--

LOCK TABLES `ec_specification_attributes` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes` DISABLE KEYS */;
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Height','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(2,1,'Width','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(3,1,'Weight','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(4,2,'Power','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(5,2,'Speed','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(6,3,'Battery Life','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(7,4,'Screen Size','text',NULL,NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(8,4,'Resolution','select','[\"1920x1080\",\"2560x1440\",\"3840x2160\"]',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes_translations`
--

DROP TABLE IF EXISTS `ec_specification_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_attributes_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes_translations`
--

LOCK TABLES `ec_specification_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups`
--

DROP TABLE IF EXISTS `ec_specification_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_groups_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups`
--

LOCK TABLES `ec_specification_groups` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups` DISABLE KEYS */;
INSERT INTO `ec_specification_groups` VALUES (1,'Dimensions',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(2,'Performance',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(3,'Battery',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(4,'Display',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_table_group`
--

DROP TABLE IF EXISTS `ec_specification_table_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_table_group` (
  `table_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_table_group`
--

LOCK TABLES `ec_specification_table_group` WRITE;
/*!40000 ALTER TABLE `ec_specification_table_group` DISABLE KEYS */;
INSERT INTO `ec_specification_table_group` VALUES (1,1,0),(1,2,0),(2,3,0),(2,4,0);
/*!40000 ALTER TABLE `ec_specification_table_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables`
--

DROP TABLE IF EXISTS `ec_specification_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_tables_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables`
--

LOCK TABLES `ec_specification_tables` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables` DISABLE KEYS */;
INSERT INTO `ec_specification_tables` VALUES (1,'General Specification',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL),(2,'Technical Specification',NULL,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Farmart','sales@botble.com','1800979769','502 New Street','AU','Brighton VIC','Brighton VIC',1,1,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL);
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
INSERT INTO `ec_tax_products` VALUES (1,2),(1,3),(1,4),(1,5),(1,10),(1,14),(1,25),(1,27),(1,38),(1,45),(1,47),(1,49),(1,50),(1,53),(1,54),(1,56),(1,57),(1,59),(1,64),(2,7),(2,9),(2,11),(2,12),(2,13),(2,16),(2,18),(2,19),(2,20),(2,21),(2,23),(2,28),(2,30),(2,32),(2,35),(2,36),(2,37),(2,40),(2,41),(2,42),(2,44),(2,46),(2,51),(2,52),(2,55),(2,58),(2,60),(2,61),(2,65),(3,1),(3,6),(3,8),(3,15),(3,17),(3,22),(3,24),(3,26),(3,29),(3,31),(3,33),(3,34),(3,39),(3,43),(3,48),(3,62),(3,63);
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10,1,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(2,'None',0,2,'published','2025-03-28 07:26:30','2025-03-28 07:26:30'),(3,'Import Tax',15,3,'published','2025-03-28 07:26:30','2025-03-28 07:26:30');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes_translations`
--

DROP TABLE IF EXISTS `ec_taxes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_taxes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes_translations`
--

LOCK TABLES `ec_taxes_translations` WRITE;
/*!40000 ALTER TABLE `ec_taxes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_taxes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'SHIPPING',0,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(2,'PAYMENT',1,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(3,'ORDER &amp; RETURNS',2,'published','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2025-03-28 07:26:27','2025-03-28 07:26:27'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','e1db95b22860200641bcd509b128ee1c',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'en_US','fc1c4ebbc2864eb64d0f929d080add02',1,'Botble\\Menu\\Models\\MenuLocation'),(3,'en_US','777b6410f7acc2c9f9ec20966d5b3d92',1,'Botble\\Menu\\Models\\Menu'),(4,'en_US','7b7aea0319408fd6d4c64a48bda0143b',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'en_US','35b204354270d174ed1a2ff5d16de6cc',2,'Botble\\Menu\\Models\\Menu'),(6,'en_US','d0512c3f0da8010f0d4ba1ca0c0ff4e1',3,'Botble\\Menu\\Models\\Menu'),(7,'en_US','71db00371d50ef0b25028d3f737634a9',4,'Botble\\Menu\\Models\\Menu'),(8,'en_US','bdf1b0aa2aea8235b2ffc620a334b472',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/png',5403,'brands/1.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(2,0,'2','2',1,'image/png',5403,'brands/2.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(3,0,'3','3',1,'image/png',5403,'brands/3.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(4,0,'4','4',1,'image/png',5403,'brands/4.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(5,0,'1','1',2,'image/png',5327,'product-categories/1.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(6,0,'2','2',2,'image/png',5327,'product-categories/2.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(7,0,'3','3',2,'image/png',5327,'product-categories/3.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(8,0,'4','4',2,'image/png',5327,'product-categories/4.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(9,0,'5','5',2,'image/png',5327,'product-categories/5.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(10,0,'6','6',2,'image/png',5327,'product-categories/6.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(11,0,'7','7',2,'image/png',5327,'product-categories/7.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(12,0,'8','8',2,'image/png',5327,'product-categories/8.png','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(13,0,'1','1',3,'image/jpeg',9803,'customers/1.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(14,0,'10','10',3,'image/jpeg',9803,'customers/10.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(15,0,'2','2',3,'image/jpeg',9803,'customers/2.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(16,0,'3','3',3,'image/jpeg',9803,'customers/3.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(17,0,'4','4',3,'image/jpeg',9803,'customers/4.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(18,0,'5','5',3,'image/jpeg',9803,'customers/5.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(19,0,'6','6',3,'image/jpeg',9803,'customers/6.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(20,0,'7','7',3,'image/jpeg',9803,'customers/7.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(21,0,'8','8',3,'image/jpeg',9803,'customers/8.jpg','[]','2025-03-28 07:26:27','2025-03-28 07:26:27',NULL,'public'),(22,0,'9','9',3,'image/jpeg',9803,'customers/9.jpg','[]','2025-03-28 07:26:28','2025-03-28 07:26:28',NULL,'public'),(23,0,'1','1',4,'image/jpeg',9803,'products/1.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(24,0,'10-1','10-1',4,'image/jpeg',9803,'products/10-1.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(25,0,'10-2','10-2',4,'image/jpeg',9803,'products/10-2.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(26,0,'10','10',4,'image/jpeg',9803,'products/10.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(27,0,'11-1','11-1',4,'image/jpeg',9803,'products/11-1.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(28,0,'11-2','11-2',4,'image/jpeg',9803,'products/11-2.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(29,0,'11-3','11-3',4,'image/jpeg',9803,'products/11-3.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(30,0,'11','11',4,'image/jpeg',9803,'products/11.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(31,0,'12-1','12-1',4,'image/jpeg',9803,'products/12-1.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(32,0,'12-2','12-2',4,'image/jpeg',9803,'products/12-2.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(33,0,'12-3','12-3',4,'image/jpeg',9803,'products/12-3.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(34,0,'12','12',4,'image/jpeg',9803,'products/12.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(35,0,'13-1','13-1',4,'image/jpeg',9803,'products/13-1.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(36,0,'13','13',4,'image/jpeg',9803,'products/13.jpg','[]','2025-03-28 07:26:30','2025-03-28 07:26:30',NULL,'public'),(37,0,'14','14',4,'image/jpeg',9803,'products/14.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(38,0,'15-1','15-1',4,'image/jpeg',9803,'products/15-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(39,0,'15','15',4,'image/jpeg',9803,'products/15.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(40,0,'16','16',4,'image/jpeg',9803,'products/16.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(41,0,'17-1','17-1',4,'image/jpeg',9803,'products/17-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(42,0,'17-2','17-2',4,'image/jpeg',9803,'products/17-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(43,0,'17-3','17-3',4,'image/jpeg',9803,'products/17-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(44,0,'17','17',4,'image/jpeg',9803,'products/17.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(45,0,'18-1','18-1',4,'image/jpeg',9803,'products/18-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(46,0,'18-2','18-2',4,'image/jpeg',9803,'products/18-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(47,0,'18-3','18-3',4,'image/jpeg',9803,'products/18-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(48,0,'18','18',4,'image/jpeg',9803,'products/18.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(49,0,'19-1','19-1',4,'image/jpeg',9803,'products/19-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(50,0,'19-2','19-2',4,'image/jpeg',9803,'products/19-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(51,0,'19-3','19-3',4,'image/jpeg',9803,'products/19-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(52,0,'19','19',4,'image/jpeg',9803,'products/19.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(53,0,'2-1','2-1',4,'image/jpeg',9803,'products/2-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(54,0,'2-2','2-2',4,'image/jpeg',9803,'products/2-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(55,0,'2-3','2-3',4,'image/jpeg',9803,'products/2-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(56,0,'2','2',4,'image/jpeg',9803,'products/2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(57,0,'20-1','20-1',4,'image/jpeg',9803,'products/20-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(58,0,'20-2','20-2',4,'image/jpeg',9803,'products/20-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(59,0,'20-3','20-3',4,'image/jpeg',9803,'products/20-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(60,0,'20','20',4,'image/jpeg',9803,'products/20.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(61,0,'21-1','21-1',4,'image/jpeg',9803,'products/21-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(62,0,'21-2','21-2',4,'image/jpeg',9803,'products/21-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(63,0,'21','21',4,'image/jpeg',9803,'products/21.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(64,0,'22-1','22-1',4,'image/jpeg',9803,'products/22-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(65,0,'22-2','22-2',4,'image/jpeg',9803,'products/22-2.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(66,0,'22-3','22-3',4,'image/jpeg',9803,'products/22-3.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(67,0,'22','22',4,'image/jpeg',9803,'products/22.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(68,0,'23-1','23-1',4,'image/jpeg',9803,'products/23-1.jpg','[]','2025-03-28 07:26:31','2025-03-28 07:26:31',NULL,'public'),(69,0,'23-2','23-2',4,'image/jpeg',9803,'products/23-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(70,0,'23-3','23-3',4,'image/jpeg',9803,'products/23-3.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(71,0,'23','23',4,'image/jpeg',9803,'products/23.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(72,0,'24-1','24-1',4,'image/jpeg',9803,'products/24-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(73,0,'24-2','24-2',4,'image/jpeg',9803,'products/24-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(74,0,'24','24',4,'image/jpeg',9803,'products/24.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(75,0,'25-1','25-1',4,'image/jpeg',9803,'products/25-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(76,0,'25-2','25-2',4,'image/jpeg',9803,'products/25-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(77,0,'25','25',4,'image/jpeg',9803,'products/25.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(78,0,'26-1','26-1',4,'image/jpeg',9803,'products/26-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(79,0,'26','26',4,'image/jpeg',9803,'products/26.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(80,0,'27-1','27-1',4,'image/jpeg',9803,'products/27-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(81,0,'27','27',4,'image/jpeg',9803,'products/27.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(82,0,'28-1','28-1',4,'image/jpeg',9803,'products/28-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(83,0,'28-2','28-2',4,'image/jpeg',9803,'products/28-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(84,0,'28','28',4,'image/jpeg',9803,'products/28.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(85,0,'29-1','29-1',4,'image/jpeg',9803,'products/29-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(86,0,'29-2','29-2',4,'image/jpeg',9803,'products/29-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(87,0,'29','29',4,'image/jpeg',9803,'products/29.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(88,0,'3','3',4,'image/jpeg',9803,'products/3.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(89,0,'30-1','30-1',4,'image/jpeg',9803,'products/30-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(90,0,'30-2','30-2',4,'image/jpeg',9803,'products/30-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(91,0,'30','30',4,'image/jpeg',9803,'products/30.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(92,0,'31-1','31-1',4,'image/jpeg',9803,'products/31-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(93,0,'31','31',4,'image/jpeg',9803,'products/31.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(94,0,'32-1','32-1',4,'image/jpeg',9803,'products/32-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(95,0,'32-2','32-2',4,'image/jpeg',9803,'products/32-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(96,0,'32','32',4,'image/jpeg',9803,'products/32.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(97,0,'33-1','33-1',4,'image/jpeg',9803,'products/33-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(98,0,'33-2','33-2',4,'image/jpeg',9803,'products/33-2.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(99,0,'33','33',4,'image/jpeg',9803,'products/33.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(100,0,'34-1','34-1',4,'image/jpeg',9803,'products/34-1.jpg','[]','2025-03-28 07:26:32','2025-03-28 07:26:32',NULL,'public'),(101,0,'34','34',4,'image/jpeg',9803,'products/34.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(102,0,'35-1','35-1',4,'image/jpeg',9803,'products/35-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(103,0,'35','35',4,'image/jpeg',9803,'products/35.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(104,0,'36-1','36-1',4,'image/jpeg',9803,'products/36-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(105,0,'36-2','36-2',4,'image/jpeg',9803,'products/36-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(106,0,'36','36',4,'image/jpeg',9803,'products/36.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(107,0,'37-1','37-1',4,'image/jpeg',9803,'products/37-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(108,0,'37-2','37-2',4,'image/jpeg',9803,'products/37-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(109,0,'37','37',4,'image/jpeg',9803,'products/37.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(110,0,'38-1','38-1',4,'image/jpeg',9803,'products/38-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(111,0,'38-2','38-2',4,'image/jpeg',9803,'products/38-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(112,0,'38-3','38-3',4,'image/jpeg',9803,'products/38-3.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(113,0,'38','38',4,'image/jpeg',9803,'products/38.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(114,0,'39-1','39-1',4,'image/jpeg',9803,'products/39-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(115,0,'39-2','39-2',4,'image/jpeg',9803,'products/39-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(116,0,'39','39',4,'image/jpeg',9803,'products/39.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(117,0,'4-1','4-1',4,'image/jpeg',9803,'products/4-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(118,0,'4-2','4-2',4,'image/jpeg',9803,'products/4-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(119,0,'4-3','4-3',4,'image/jpeg',9803,'products/4-3.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(120,0,'4','4',4,'image/jpeg',9803,'products/4.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(121,0,'40-1','40-1',4,'image/jpeg',9803,'products/40-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(122,0,'40','40',4,'image/jpeg',9803,'products/40.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(123,0,'41-1','41-1',4,'image/jpeg',9803,'products/41-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(124,0,'41-2','41-2',4,'image/jpeg',9803,'products/41-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(125,0,'41','41',4,'image/jpeg',9803,'products/41.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(126,0,'42-1','42-1',4,'image/jpeg',9803,'products/42-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(127,0,'42-2','42-2',4,'image/jpeg',9803,'products/42-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(128,0,'42','42',4,'image/jpeg',9803,'products/42.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(129,0,'43-1','43-1',4,'image/jpeg',9803,'products/43-1.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(130,0,'43-2','43-2',4,'image/jpeg',9803,'products/43-2.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(131,0,'43','43',4,'image/jpeg',9803,'products/43.jpg','[]','2025-03-28 07:26:33','2025-03-28 07:26:33',NULL,'public'),(132,0,'44-1','44-1',4,'image/jpeg',9803,'products/44-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(133,0,'44-2','44-2',4,'image/jpeg',9803,'products/44-2.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(134,0,'44','44',4,'image/jpeg',9803,'products/44.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(135,0,'45-1','45-1',4,'image/jpeg',9803,'products/45-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(136,0,'45','45',4,'image/jpeg',9803,'products/45.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(137,0,'46-1','46-1',4,'image/jpeg',9803,'products/46-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(138,0,'46','46',4,'image/jpeg',9803,'products/46.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(139,0,'47-1','47-1',4,'image/jpeg',9803,'products/47-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(140,0,'47','47',4,'image/jpeg',9803,'products/47.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(141,0,'48-1','48-1',4,'image/jpeg',9803,'products/48-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(142,0,'48-2','48-2',4,'image/jpeg',9803,'products/48-2.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(143,0,'48','48',4,'image/jpeg',9803,'products/48.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(144,0,'49-1','49-1',4,'image/jpeg',9803,'products/49-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(145,0,'49-2','49-2',4,'image/jpeg',9803,'products/49-2.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(146,0,'49','49',4,'image/jpeg',9803,'products/49.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(147,0,'5-1','5-1',4,'image/jpeg',9803,'products/5-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(148,0,'5-2','5-2',4,'image/jpeg',9803,'products/5-2.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(149,0,'5-3','5-3',4,'image/jpeg',9803,'products/5-3.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(150,0,'5','5',4,'image/jpeg',9803,'products/5.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(151,0,'50-1','50-1',4,'image/jpeg',9803,'products/50-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(152,0,'50','50',4,'image/jpeg',9803,'products/50.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(153,0,'51','51',4,'image/jpeg',9803,'products/51.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(154,0,'52-1','52-1',4,'image/jpeg',9803,'products/52-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(155,0,'52-2','52-2',4,'image/jpeg',9803,'products/52-2.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(156,0,'52','52',4,'image/jpeg',9803,'products/52.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(157,0,'53-1','53-1',4,'image/jpeg',9803,'products/53-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(158,0,'53','53',4,'image/jpeg',9803,'products/53.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(159,0,'54-1','54-1',4,'image/jpeg',9803,'products/54-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(160,0,'54','54',4,'image/jpeg',9803,'products/54.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(161,0,'55-1','55-1',4,'image/jpeg',9803,'products/55-1.jpg','[]','2025-03-28 07:26:34','2025-03-28 07:26:34',NULL,'public'),(162,0,'55-2','55-2',4,'image/jpeg',9803,'products/55-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(163,0,'55','55',4,'image/jpeg',9803,'products/55.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(164,0,'56-1','56-1',4,'image/jpeg',9803,'products/56-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(165,0,'56-2','56-2',4,'image/jpeg',9803,'products/56-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(166,0,'56','56',4,'image/jpeg',9803,'products/56.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(167,0,'57-1','57-1',4,'image/jpeg',9803,'products/57-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(168,0,'57','57',4,'image/jpeg',9803,'products/57.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(169,0,'58-1','58-1',4,'image/jpeg',9803,'products/58-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(170,0,'58-2','58-2',4,'image/jpeg',9803,'products/58-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(171,0,'58','58',4,'image/jpeg',9803,'products/58.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(172,0,'59-1','59-1',4,'image/jpeg',9803,'products/59-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(173,0,'59-2','59-2',4,'image/jpeg',9803,'products/59-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(174,0,'59-3','59-3',4,'image/jpeg',9803,'products/59-3.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(175,0,'59','59',4,'image/jpeg',9803,'products/59.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(176,0,'6','6',4,'image/jpeg',9803,'products/6.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(177,0,'60-1','60-1',4,'image/jpeg',9803,'products/60-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(178,0,'60-2','60-2',4,'image/jpeg',9803,'products/60-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(179,0,'60','60',4,'image/jpeg',9803,'products/60.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(180,0,'61-1','61-1',4,'image/jpeg',9803,'products/61-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(181,0,'61','61',4,'image/jpeg',9803,'products/61.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(182,0,'62-1','62-1',4,'image/jpeg',9803,'products/62-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(183,0,'62','62',4,'image/jpeg',9803,'products/62.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(184,0,'63-1','63-1',4,'image/jpeg',9803,'products/63-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(185,0,'63','63',4,'image/jpeg',9803,'products/63.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(186,0,'64-1','64-1',4,'image/jpeg',9803,'products/64-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(187,0,'64','64',4,'image/jpeg',9803,'products/64.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(188,0,'65-1','65-1',4,'image/jpeg',9803,'products/65-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(189,0,'65-2','65-2',4,'image/jpeg',9803,'products/65-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(190,0,'65','65',4,'image/jpeg',9803,'products/65.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(191,0,'7','7',4,'image/jpeg',9803,'products/7.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(192,0,'8-1','8-1',4,'image/jpeg',9803,'products/8-1.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(193,0,'8-2','8-2',4,'image/jpeg',9803,'products/8-2.jpg','[]','2025-03-28 07:26:35','2025-03-28 07:26:35',NULL,'public'),(194,0,'8-3','8-3',4,'image/jpeg',9803,'products/8-3.jpg','[]','2025-03-28 07:26:36','2025-03-28 07:26:36',NULL,'public'),(195,0,'8','8',4,'image/jpeg',9803,'products/8.jpg','[]','2025-03-28 07:26:36','2025-03-28 07:26:36',NULL,'public'),(196,0,'9-1','9-1',4,'image/jpeg',9803,'products/9-1.jpg','[]','2025-03-28 07:26:36','2025-03-28 07:26:36',NULL,'public'),(197,0,'9-2','9-2',4,'image/jpeg',9803,'products/9-2.jpg','[]','2025-03-28 07:26:36','2025-03-28 07:26:36',NULL,'public'),(198,0,'9','9',4,'image/jpeg',9803,'products/9.jpg','[]','2025-03-28 07:26:36','2025-03-28 07:26:36',NULL,'public'),(199,0,'1','1',5,'image/png',2691,'stores/1.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(200,0,'10','10',5,'image/png',2691,'stores/10.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(201,0,'11','11',5,'image/png',2691,'stores/11.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(202,0,'12','12',5,'image/png',2691,'stores/12.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(203,0,'13','13',5,'image/png',2691,'stores/13.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(204,0,'14','14',5,'image/png',2691,'stores/14.png','[]','2025-03-28 07:26:37','2025-03-28 07:26:37',NULL,'public'),(205,0,'15','15',5,'image/png',2691,'stores/15.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(206,0,'16','16',5,'image/png',2732,'stores/16.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(207,0,'17','17',5,'image/png',2732,'stores/17.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(208,0,'2','2',5,'image/png',2691,'stores/2.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(209,0,'3','3',5,'image/png',2691,'stores/3.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(210,0,'4','4',5,'image/png',2691,'stores/4.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(211,0,'5','5',5,'image/png',2691,'stores/5.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(212,0,'6','6',5,'image/png',2691,'stores/6.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(213,0,'7','7',5,'image/png',2691,'stores/7.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(214,0,'8','8',5,'image/png',2691,'stores/8.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(215,0,'9','9',5,'image/png',2691,'stores/9.png','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(216,0,'background-1','background-1',5,'image/jpeg',5286,'stores/background-1.jpg','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(217,0,'background-2','background-2',5,'image/jpeg',5286,'stores/background-2.jpg','[]','2025-03-28 07:26:38','2025-03-28 07:26:38',NULL,'public'),(218,0,'1','1',6,'image/jpeg',9803,'news/1.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(219,0,'10','10',6,'image/jpeg',9803,'news/10.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(220,0,'11','11',6,'image/jpeg',9803,'news/11.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(221,0,'2','2',6,'image/jpeg',9803,'news/2.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(222,0,'3','3',6,'image/jpeg',9803,'news/3.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(223,0,'4','4',6,'image/jpeg',9803,'news/4.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(224,0,'5','5',6,'image/jpeg',9803,'news/5.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(225,0,'6','6',6,'image/jpeg',9803,'news/6.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(226,0,'7','7',6,'image/jpeg',9803,'news/7.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(227,0,'8','8',6,'image/jpeg',9803,'news/8.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(228,0,'9','9',6,'image/jpeg',9803,'news/9.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(229,0,'01-sm','01-sm',7,'image/jpeg',10737,'sliders/01-sm.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(230,0,'01','01',7,'image/jpeg',11704,'sliders/01.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(231,0,'02-sm','02-sm',7,'image/jpeg',10737,'sliders/02-sm.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(232,0,'02','02',7,'image/jpeg',11704,'sliders/02.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(233,0,'1','1',8,'image/jpeg',7935,'promotion/1.jpg','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(234,0,'2','2',8,'image/png',14659,'promotion/2.png','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(235,0,'3','3',8,'image/png',10632,'promotion/3.png','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(236,0,'4','4',8,'image/png',10076,'promotion/4.png','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(237,0,'5','5',8,'image/png',12274,'promotion/5.png','[]','2025-03-28 07:26:40','2025-03-28 07:26:40',NULL,'public'),(238,0,'cod','cod',9,'image/png',12121,'payments/cod.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(239,0,'bank-transfer','bank-transfer',9,'image/png',29089,'payments/bank-transfer.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(240,0,'stripe','stripe',9,'image/webp',7516,'payments/stripe.webp','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(241,0,'paypal','paypal',9,'image/png',3001,'payments/paypal.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(242,0,'mollie','mollie',9,'image/png',8968,'payments/mollie.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(243,0,'paystack','paystack',9,'image/png',31015,'payments/paystack.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(244,0,'razorpay','razorpay',9,'image/png',8489,'payments/razorpay.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(245,0,'sslcommerz','sslcommerz',9,'image/png',3482,'payments/sslcommerz.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(246,0,'404','404',10,'image/png',31297,'general/404.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(247,0,'app-android','app-android',10,'image/png',630,'general/app-android.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(248,0,'app-bg','app-bg',10,'image/png',11530,'general/app-bg.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(249,0,'app-ios','app-ios',10,'image/png',630,'general/app-ios.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(250,0,'background','background',10,'image/jpeg',26676,'general/background.jpg','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(251,0,'blog-bg','blog-bg',10,'image/jpeg',81226,'general/blog-bg.jpg','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(252,0,'coming-soon','coming-soon',10,'image/jpeg',26506,'general/coming-soon.jpg','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(253,0,'facebook','facebook',10,'image/png',732,'general/facebook.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(254,0,'favicon','favicon',10,'image/png',6337,'general/favicon.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(255,0,'footer-payments','footer-payments',10,'image/png',439,'general/footer-payments.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(256,0,'icon-protect','icon-protect',10,'image/png',1677,'general/icon-protect.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(257,0,'icon-reload','icon-reload',10,'image/png',1457,'general/icon-reload.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(258,0,'icon-rocket','icon-rocket',10,'image/png',1640,'general/icon-rocket.png','[]','2025-03-28 07:26:41','2025-03-28 07:26:41',NULL,'public'),(259,0,'icon-support','icon-support',10,'image/png',1854,'general/icon-support.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(260,0,'icon-tag','icon-tag',10,'image/png',1151,'general/icon-tag.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(261,0,'instagram','instagram',10,'image/png',2476,'general/instagram.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(262,0,'logo-light','logo-light',10,'image/png',12206,'general/logo-light.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(263,0,'logo','logo',10,'image/png',18245,'general/logo.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(264,0,'newsletter-popup','newsletter-popup',10,'image/png',17253,'general/newsletter-popup.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(265,0,'open-graph-image','open-graph-image',10,'image/png',406719,'general/open-graph-image.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(266,0,'pinterest','pinterest',10,'image/png',2103,'general/pinterest.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(267,0,'placeholder','placeholder',10,'image/png',2675,'general/placeholder.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(268,0,'slider-bg','slider-bg',10,'image/jpeg',26676,'general/slider-bg.jpg','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(269,0,'twitter','twitter',10,'image/png',1749,'general/twitter.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public'),(270,0,'youtube','youtube',10,'image/png',1035,'general/youtube.png','[]','2025-03-28 07:26:42','2025-03-28 07:26:42',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands',NULL,'brands',0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(2,0,'product-categories',NULL,'product-categories',0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(3,0,'customers',NULL,'customers',0,'2025-03-28 07:26:27','2025-03-28 07:26:27',NULL),(4,0,'products',NULL,'products',0,'2025-03-28 07:26:30','2025-03-28 07:26:30',NULL),(5,0,'stores',NULL,'stores',0,'2025-03-28 07:26:37','2025-03-28 07:26:37',NULL),(6,0,'news',NULL,'news',0,'2025-03-28 07:26:40','2025-03-28 07:26:40',NULL),(7,0,'sliders',NULL,'sliders',0,'2025-03-28 07:26:40','2025-03-28 07:26:40',NULL),(8,0,'promotion',NULL,'promotion',0,'2025-03-28 07:26:40','2025-03-28 07:26:40',NULL),(9,0,'payments',NULL,'payments',0,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL),(10,0,'general',NULL,'general',0,'2025-03-28 07:26:41','2025-03-28 07:26:41',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-03-28 07:26:41','2025-03-28 07:26:41'),(2,2,'header-navigation','2025-03-28 07:26:41','2025-03-28 07:26:41');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/products/smart-watches','icon icon-tag',0,'Special Prices',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(2,1,0,NULL,NULL,'#',NULL,1,'Pages',NULL,'_self',1,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(3,1,2,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(4,1,2,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,1,'Terms Of Use',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(5,1,2,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,2,'Terms & Conditions',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(6,1,2,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,3,'Refund Policy',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(7,1,2,12,'Botble\\Page\\Models\\Page','/coming-soon',NULL,4,'Coming soon',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(8,1,0,NULL,NULL,'/products',NULL,2,'Shop',NULL,'_self',1,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(9,1,8,NULL,NULL,'/products',NULL,0,'All products',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(10,1,8,15,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,1,'Products Of Category',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(11,1,8,NULL,NULL,'/products/beat-headphone',NULL,2,'Product Single',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(12,1,0,NULL,NULL,'/stores',NULL,3,'Stores',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(13,1,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,4,'Blog',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(14,1,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,5,'FAQs',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(15,1,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,6,'Contact',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(16,2,0,2,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About Us',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(17,2,0,NULL,NULL,'wishlist',NULL,1,'Wishlist',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(18,2,0,NULL,NULL,'orders/tracking',NULL,2,'Order Tracking',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(19,3,0,3,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Terms Of Use',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(20,3,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Terms & Conditions',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(21,3,0,5,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Refund Policy',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(22,3,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,3,'FAQs',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(23,3,0,NULL,NULL,'/nothing',NULL,4,'404 Page',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(24,4,0,2,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About us',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(25,4,0,10,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Affiliate',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(26,4,0,11,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Career',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(27,4,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,3,'Contact us',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(28,5,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Our blog',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(29,5,0,NULL,NULL,'/cart',NULL,1,'Cart',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(30,5,0,NULL,NULL,'/customer/overview',NULL,2,'My account',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41'),(31,5,0,NULL,NULL,'/products',NULL,3,'Shop',NULL,'_self',0,'2025-03-28 07:26:41','2025-03-28 07:26:41');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-03-28 07:26:41','2025-03-28 07:26:41'),(2,'Header menu','header-menu','published','2025-03-28 07:26:41','2025-03-28 07:26:41'),(3,'Useful Links','useful-links','published','2025-03-28 07:26:41','2025-03-28 07:26:41'),(4,'Help Center','help-center','published','2025-03-28 07:26:41','2025-03-28 07:26:41'),(5,'Business','business','published','2025-03-28 07:26:41','2025-03-28 07:26:41');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'faq_ids','[[1,3,5,8,10]]',1,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(2,'faq_ids','[[2,5,6,7,9]]',2,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(3,'faq_ids','[[1,2,3,5,9]]',3,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(4,'faq_ids','[[1,4,5,8,9]]',4,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(5,'faq_ids','[[2,4,6,7,8]]',5,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(6,'faq_ids','[[2,5,6,7,8]]',6,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(7,'faq_ids','[[2,3,4,5,10]]',7,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(8,'faq_ids','[[4,5,8,9,10]]',8,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(9,'faq_ids','[[1,2,3,6,7]]',9,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(10,'faq_ids','[[1,2,6,8,10]]',10,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(11,'faq_ids','[[2,3,4,9,10]]',11,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(12,'faq_ids','[[1,5,6,8,9]]',12,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(13,'faq_ids','[[4,5,6,7,10]]',13,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(14,'faq_ids','[[1,4,8,9,10]]',14,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(15,'faq_ids','[[2,3,6,7,9]]',15,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(16,'faq_ids','[[2,5,6,7,8]]',16,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(17,'faq_ids','[[1,3,7,8,10]]',17,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(18,'faq_ids','[[4,5,7,8,10]]',18,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(19,'faq_ids','[[1,5,6,9,10]]',19,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(20,'faq_ids','[[2,3,8,9,10]]',20,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(21,'faq_ids','[[3,5,7,8,9]]',21,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(22,'faq_ids','[[3,4,5,8,9]]',22,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(23,'faq_ids','[[3,5,6,8,9]]',23,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(24,'faq_ids','[[2,3,5,7,9]]',24,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(25,'faq_ids','[[1,4,8,9,10]]',25,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(26,'faq_ids','[[1,3,6,8,9]]',26,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(27,'faq_ids','[[2,5,6,8,10]]',27,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(28,'faq_ids','[[1,3,4,8,10]]',28,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(29,'faq_ids','[[1,4,5,9,10]]',29,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(30,'faq_ids','[[3,4,5,8,10]]',30,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(31,'faq_ids','[[2,4,8,9,10]]',31,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(32,'faq_ids','[[2,4,8,9,10]]',32,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(33,'faq_ids','[[1,3,5,6,8]]',33,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(34,'faq_ids','[[1,3,7,8,10]]',34,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(35,'faq_ids','[[1,6,7,9,10]]',35,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(36,'faq_ids','[[2,4,5,8,9]]',36,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(37,'faq_ids','[[2,4,6,8,10]]',37,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(38,'faq_ids','[[2,3,5,7,8]]',38,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(39,'faq_ids','[[1,3,4,6,7]]',39,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(40,'faq_ids','[[1,2,5,6,8]]',40,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(41,'faq_ids','[[3,6,7,9,10]]',41,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(42,'faq_ids','[[1,6,7,9,10]]',42,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(43,'faq_ids','[[1,2,3,5,8]]',43,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(44,'faq_ids','[[1,2,4,8,9]]',44,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(45,'faq_ids','[[2,4,8,9,10]]',45,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(46,'faq_ids','[[1,2,5,8,10]]',46,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(47,'faq_ids','[[2,3,6,8,9]]',47,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(48,'faq_ids','[[1,2,7,8,10]]',48,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(49,'faq_ids','[[1,4,5,6,10]]',49,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(50,'faq_ids','[[1,2,3,9,10]]',50,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(51,'faq_ids','[[4,5,7,8,10]]',51,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(52,'faq_ids','[[2,7,8,9,10]]',52,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(53,'faq_ids','[[1,4,5,7,9]]',53,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(54,'faq_ids','[[1,3,4,7,10]]',54,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(55,'faq_ids','[[1,3,8,9,10]]',55,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(56,'faq_ids','[[1,2,4,6,7]]',56,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(57,'faq_ids','[[1,4,5,9,10]]',57,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(58,'faq_ids','[[3,4,6,7,10]]',58,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(59,'faq_ids','[[2,4,5,6,9]]',59,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(60,'faq_ids','[[1,2,3,4,9]]',60,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(61,'faq_ids','[[2,4,6,7,9]]',61,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(62,'faq_ids','[[2,4,5,8,9]]',62,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(63,'faq_ids','[[1,2,5,7,10]]',63,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(64,'faq_ids','[[1,3,4,6,8]]',64,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(65,'faq_ids','[[2,4,7,9,10]]',65,'Botble\\Ecommerce\\Models\\Product','2025-03-28 07:26:36','2025-03-28 07:26:36'),(66,'background','[\"stores\\/background-1.jpg\"]',1,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(67,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',1,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(68,'background','[\"stores\\/background-1.jpg\"]',2,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(69,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',2,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(70,'background','[\"stores\\/background-1.jpg\"]',3,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(71,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',3,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(72,'background','[\"stores\\/background-2.jpg\"]',4,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(73,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',4,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(74,'background','[\"stores\\/background-2.jpg\"]',5,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(75,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',5,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(76,'background','[\"stores\\/background-1.jpg\"]',6,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(77,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',6,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(78,'background','[\"stores\\/background-2.jpg\"]',7,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(79,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',7,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(80,'background','[\"stores\\/background-2.jpg\"]',8,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(81,'socials','[{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/\"}]',8,'Botble\\Marketplace\\Models\\Store','2025-03-28 07:26:40','2025-03-28 07:26:40'),(82,'tablet_image','[\"sliders\\/01.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-03-28 07:26:40','2025-03-28 07:26:40'),(83,'mobile_image','[\"sliders\\/01-sm.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-03-28 07:26:40','2025-03-28 07:26:40'),(84,'tablet_image','[\"sliders\\/02.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-03-28 07:26:40','2025-03-28 07:26:40'),(85,'mobile_image','[\"sliders\\/02-sm.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_04_030654_improve_social_links',1),(35,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(36,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(37,'2024_07_12_100000_change_random_hash_for_media',1),(38,'2024_09_30_024515_create_sessions_table',1),(39,'2020_11_18_150916_ads_create_ads_table',2),(40,'2021_12_02_035301_add_ads_translations_table',2),(41,'2023_04_17_062645_add_open_in_new_tab',2),(42,'2023_11_07_023805_add_tablet_mobile_image',2),(43,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(44,'2024_04_27_100730_improve_analytics_setting',3),(45,'2015_06_29_025744_create_audit_history',4),(46,'2023_11_14_033417_change_request_column_in_table_audit_histories',4),(47,'2015_06_18_033822_create_blog_table',5),(48,'2021_02_16_092633_remove_default_value_for_author_type',5),(49,'2021_12_03_030600_create_blog_translations',5),(50,'2022_04_19_113923_add_index_to_table_posts',5),(51,'2023_08_29_074620_make_column_author_id_nullable',5),(52,'2024_07_30_091615_fix_order_column_in_categories_table',5),(53,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(54,'2016_06_17_091537_create_contacts_table',6),(55,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(56,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(57,'2024_03_25_000001_update_captcha_settings_for_contact',6),(58,'2024_04_19_063914_create_custom_fields_table',6),(59,'2020_03_05_041139_create_ecommerce_tables',7),(60,'2021_01_01_044147_ecommerce_create_flash_sale_table',7),(61,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',7),(62,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',7),(63,'2021_02_18_073505_update_table_ec_reviews',7),(64,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',7),(65,'2021_03_10_025153_change_column_tax_amount',7),(66,'2021_03_20_033103_add_column_availability_to_table_ec_products',7),(67,'2021_04_28_074008_ecommerce_create_product_label_table',7),(68,'2021_05_31_173037_ecommerce_create_ec_products_translations',7),(69,'2021_08_17_105016_remove_column_currency_id_in_some_tables',7),(70,'2021_08_30_142128_add_images_column_to_ec_reviews_table',7),(71,'2021_10_04_030050_add_column_created_by_to_table_ec_products',7),(72,'2021_10_05_122616_add_status_column_to_ec_customers_table',7),(73,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',7),(74,'2021_11_23_071403_correct_languages_for_product_variations',7),(75,'2021_11_28_031808_add_product_tags_translations',7),(76,'2021_12_01_031123_add_featured_image_to_ec_products',7),(77,'2022_01_01_033107_update_table_ec_shipments',7),(78,'2022_02_16_042457_improve_product_attribute_sets',7),(79,'2022_03_22_075758_correct_product_name',7),(80,'2022_04_19_113334_add_index_to_ec_products',7),(81,'2022_04_28_144405_remove_unused_table',7),(82,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',7),(83,'2022_05_18_143720_add_index_to_table_ec_product_categories',7),(84,'2022_06_16_095633_add_index_to_some_tables',7),(85,'2022_06_30_035148_create_order_referrals_table',7),(86,'2022_07_24_153815_add_completed_at_to_ec_orders_table',7),(87,'2022_08_14_032836_create_ec_order_returns_table',7),(88,'2022_08_14_033554_create_ec_order_return_items_table',7),(89,'2022_08_15_040324_add_billing_address',7),(90,'2022_08_30_091114_support_digital_products_table',7),(91,'2022_09_13_095744_create_options_table',7),(92,'2022_09_13_104347_create_option_value_table',7),(93,'2022_10_05_163518_alter_table_ec_order_product',7),(94,'2022_10_12_041517_create_invoices_table',7),(95,'2022_10_12_142226_update_orders_table',7),(96,'2022_10_13_024916_update_table_order_returns',7),(97,'2022_10_21_030830_update_columns_in_ec_shipments_table',7),(98,'2022_10_28_021046_update_columns_in_ec_shipments_table',7),(99,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',7),(100,'2022_11_19_041643_add_ec_tax_product_table',7),(101,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',7),(102,'2022_12_17_041532_fix_address_in_order_invoice',7),(103,'2022_12_26_070329_create_ec_product_views_table',7),(104,'2023_01_04_033051_fix_product_categories',7),(105,'2023_01_09_050400_add_ec_global_options_translations_table',7),(106,'2023_01_10_093754_add_missing_option_value_id',7),(107,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',7),(108,'2023_01_26_021854_add_ec_customer_used_coupons_table',7),(109,'2023_02_08_015900_update_options_column_in_ec_order_product_table',7),(110,'2023_02_27_095752_remove_duplicate_reviews',7),(111,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',7),(112,'2023_04_21_082427_create_ec_product_categorizables_table',7),(113,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',7),(114,'2023_05_17_025812_fix_invoice_issue',7),(115,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',7),(116,'2023_05_27_144611_fix_exchange_rate_setting',7),(117,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',7),(118,'2023_06_30_042512_create_ec_order_tax_information_table',7),(119,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',7),(120,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',7),(121,'2023_08_15_064505_create_ec_tax_rules_table',7),(122,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',7),(123,'2023_08_22_094114_drop_unique_for_barcode',7),(124,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',7),(125,'2023_09_07_094312_add_index_to_product_sku_and_translations',7),(126,'2023_09_19_024955_create_discount_product_categories_table',7),(127,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',7),(128,'2023_11_22_154643_add_unique_in_table_ec_products_variations',7),(129,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',7),(130,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',7),(131,'2023_12_25_040604_ec_create_review_replies_table',7),(132,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',7),(133,'2024_01_16_070706_fix_translation_tables',7),(134,'2024_01_23_075227_add_proof_file_to_ec_orders_table',7),(135,'2024_03_26_041531_add_cancel_reason_to_ec_orders_table',7),(136,'2024_03_27_062402_create_ec_customer_deletion_requests_table',7),(137,'2024_03_29_042242_migrate_old_captcha_settings',7),(138,'2024_03_29_093946_create_ec_order_return_histories_table',7),(139,'2024_04_01_063523_add_customer_columns_to_ec_reviews_table',7),(140,'2024_04_15_092654_migrate_ecommerce_google_tag_manager_code_setting',7),(141,'2024_04_16_035713_add_min_max_order_quantity_columns_to_products_table',7),(142,'2024_05_07_073153_improve_table_wishlist',7),(143,'2024_05_07_093703_add_missing_zip_code_into_table_store_locators',7),(144,'2024_05_15_021503_fix_invoice_path',7),(145,'2024_06_20_160724_create_ec_shared_wishlists_table',7),(146,'2024_06_28_025104_add_notify_attachment_updated_column_to_ec_products_table',7),(147,'2024_07_03_030900_add_downloaded_at_column_to_ec_order_product_table',7),(148,'2024_07_14_071826_make_customer_email_nullable',7),(149,'2024_07_15_104916_add_video_media_column_to_ec_products_table',7),(150,'2024_07_26_052530_add_percentage_to_tax_rules_table',7),(151,'2024_08_14_123028_add_customer_delivered_confirmed_at_column_to_ec_shipments_table',7),(152,'2024_08_19_132849_create_specification_tables',7),(153,'2024_09_07_060744_add_author_column_to_specification_tables',7),(154,'2024_09_14_064023_add_can_use_with_flash_sale_column_to_ec_discounts_table',7),(155,'2024_09_25_073928_remove_wrong_product_slugs',7),(156,'2025_01_15_050230_migrate_old_theme_options',7),(157,'2025_01_17_082713_correct_column_barcode_and_cost_per_item_to_product_table',7),(158,'2025_01_24_044641_migrate_old_country_data',7),(159,'2025_01_28_233602_add_private_notes_into_ec_orders_table',7),(160,'2025_02_13_021247_add_tax_translations',7),(161,'2025_02_24_152621_add_text_color_to_product_labels_table',7),(162,'2018_07_09_221238_create_faq_table',8),(163,'2021_12_03_082134_create_faq_translations',8),(164,'2023_11_17_063408_add_description_column_to_faq_categories_table',8),(165,'2016_10_03_032336_create_languages_table',9),(166,'2023_09_14_022423_add_index_for_language_table',9),(167,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(168,'2021_12_03_075608_create_page_translations',10),(169,'2023_07_06_011444_create_slug_translations_table',10),(170,'2019_11_18_061011_create_country_table',11),(171,'2021_12_03_084118_create_location_translations',11),(172,'2021_12_03_094518_migrate_old_location_data',11),(173,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(174,'2022_01_16_085908_improve_plugin_location',11),(175,'2022_08_04_052122_delete_location_backup_tables',11),(176,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(177,'2023_07_26_041451_add_more_columns_to_location_table',11),(178,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(179,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(180,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(181,'2024_08_17_094600_add_image_into_countries',11),(182,'2025_01_08_093652_add_zip_code_to_cities',11),(183,'2021_07_06_030002_create_marketplace_table',12),(184,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',12),(185,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',12),(186,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',12),(187,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',12),(188,'2021_12_06_031304_update_table_mp_customer_revenues',12),(189,'2022_10_19_152916_add_columns_to_mp_stores_table',12),(190,'2022_10_20_062849_create_mp_category_sale_commissions_table',12),(191,'2022_11_02_071413_add_more_info_for_store',12),(192,'2022_11_02_080444_add_tax_info',12),(193,'2023_02_01_062030_add_store_translations',12),(194,'2023_02_13_032133_update_fee_column_mp_customer_revenues_table',12),(195,'2023_02_17_023648_fix_store_prefix',12),(196,'2024_04_03_062451_add_cover_image_to_table_mp_stores',12),(197,'2024_05_07_082630_create_mp_messages_table',12),(198,'2024_07_19_131849_add_documents_to_mp_stores_table',12),(199,'2024_08_18_083119_add_tax_id_column_to_mp_stores_table',12),(200,'2024_08_27_141244_add_block_reason_to_ec_customers_table',12),(201,'2024_09_17_125408_add_square_logo_to_stores_table',12),(202,'2017_10_24_154832_create_newsletter_table',13),(203,'2024_03_25_000001_update_captcha_settings_for_newsletter',13),(204,'2017_05_18_080441_create_payment_tables',14),(205,'2021_03_27_144913_add_customer_type_into_table_payments',14),(206,'2021_05_24_034720_make_column_currency_nullable',14),(207,'2021_08_09_161302_add_metadata_column_to_payments_table',14),(208,'2021_10_19_020859_update_metadata_field',14),(209,'2022_06_28_151901_activate_paypal_stripe_plugin',14),(210,'2022_07_07_153354_update_charge_id_in_table_payments',14),(211,'2024_07_04_083133_create_payment_logs_table',14),(212,'2017_07_11_140018_create_simple_slider_table',15),(213,'2024_09_14_100108_add_stripe_connect_details_to_ec_customers_table',16),(214,'2016_10_07_193005_create_translations_table',17),(215,'2023_12_12_105220_drop_translations_table',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_category_sale_commissions`
--

DROP TABLE IF EXISTS `mp_category_sale_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_category_sale_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint unsigned NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp_category_sale_commissions_product_category_id_unique` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_category_sale_commissions`
--

LOCK TABLES `mp_category_sale_commissions` WRITE;
/*!40000 ALTER TABLE `mp_category_sale_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_category_sale_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) unsigned DEFAULT '0.00',
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_messages`
--

DROP TABLE IF EXISTS `mp_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_messages`
--

LOCK TABLES `mp_messages` WRITE;
/*!40000 ALTER TABLE `mp_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_square` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government_id_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'GoPro','carolyn.walsh@example.com','+14049498222','98038 Bruen Village','CU','Tennessee','Lake Rose',2,'stores/1.png',NULL,NULL,'Dignissimos omnis vitae velit reiciendis quia modi. Sed recusandae perferendis velit praesentium ratione autem sed ipsum. Ut molestiae eveniet totam commodi. Nam magnam ea porro eveniet numquam facere iusto. Et amet sequi atque earum autem vitae in. Sint et rerum iusto voluptas reiciendis voluptates sequi. Labore eos quam cupiditate occaecati consectetur autem sed.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(2,'Global Office','lelah64@example.net','+12405643050','129 Francesco Run','HT','Florida','West Mabelshire',7,'stores/2.png',NULL,NULL,'Non totam mollitia unde consequuntur non magni. Eius odit eaque nesciunt enim velit consequuntur voluptas. Maiores vitae eveniet recusandae et. Ratione ipsam ut ut animi nulla. Et dolor eligendi deserunt fugiat et molestiae. Inventore assumenda quo odio veniam consectetur veritatis. Laborum aut accusantium eum non sint. Unde doloribus assumenda cumque non minus ipsa molestias quo.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(3,'Young Shop','marvin.zander@example.org','+19283974938','5389 Metz Coves','CF','Texas','Madisonside',2,'stores/3.png',NULL,NULL,'Reprehenderit voluptatum omnis incidunt eos omnis aspernatur autem quia. Molestiae maiores ipsam veritatis earum dolor. Delectus quas ut est est itaque ut sit. Iure deserunt consequatur deserunt explicabo.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(4,'Global Store','jettie57@example.com','+13174835306','691 Corkery Oval Suite 712','SJ','District of Columbia','Jayfurt',7,'stores/4.png',NULL,NULL,'Vel tenetur in illum ea dicta qui suscipit. Minima quaerat corrupti sed aut dolore rerum. Ipsa assumenda alias commodi quaerat cum quis expedita. Vel accusamus dicta quis unde explicabo. Voluptas officia autem laboriosam. Neque dolor perspiciatis aliquam eius voluptatem distinctio.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(5,'Robert’s Store','webster.will@example.com','+14788374259','14548 Bins Centers Apt. 210','BG','Colorado','Delfinaland',2,'stores/5.png',NULL,NULL,'Laudantium aut dolores blanditiis architecto. Soluta sed suscipit ut sequi. Perspiciatis aut eum et. Distinctio et quod consequatur sit ipsa voluptas. Enim autem quod accusantium aut nobis nostrum sint rerum. Doloremque quaerat eos ducimus aliquid soluta mollitia quisquam.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(6,'Stouffer','murazik.teresa@example.org','+16103588731','932 Kaya Plain Apt. 950','PM','Michigan','Port Marley',4,'stores/6.png',NULL,NULL,'Ex odit provident ut consequuntur maxime explicabo. Ut qui eaque laudantium ex porro. Blanditiis quas vel consequatur voluptatem voluptatem. Sed soluta ab excepturi sint vitae. Sunt illo consequatur ex assumenda. Perferendis ut officia excepturi aut harum occaecati est. Quis voluptates soluta vitae.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(7,'StarKist','yauer@example.net','+19869093373','798 Conroy Mountains Suite 092','CV','Hawaii','Mosciskishire',4,'stores/7.png',NULL,NULL,'Et consequatur velit totam molestias. Libero consectetur doloremque in fugit dolore neque. Placeat non quia aut qui omnis nostrum eaque. Accusantium quo ut aut similique esse ab. Enim suscipit optio rerum harum mollitia a quasi. Perferendis cumque aut sequi recusandae itaque quasi. Illum vitae ut voluptas veritatis sunt aliquam neque est. Assumenda fugit unde quo aliquam tenetur.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL),(8,'Old El Paso','theodore.wisoky@example.org','+18038059556','404 Felicity Creek Suite 849','FK','Ohio','East Royceborough',6,'stores/8.png',NULL,NULL,'Ducimus assumenda perspiciatis suscipit. Dolor quisquam rerum repellendus necessitatibus at. Possimus dolores quidem fugiat qui eaque quae. Perspiciatis a veritatis laudantium possimus. Molestiae eum non eos voluptate quod vitae molestiae velit. Cumque magni nam maiores ducimus vero optio. Eveniet natus est voluptatibus natus qui.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f4\" src=\"/storage/news/1.jpg\"></p>\n\n<p><br>\n </p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men’s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even <strong>minimalist style</strong> is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don’t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f5\" src=\"/storage/news/2.jpg\"></p>\n\n<p><br>\n </p>\n<hr>\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don’t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers’ pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don’t need anymore.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f1\" src=\"/storage/news/3.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 3: Don’t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f6\" src=\"/storage/news/4.jpg\"></p>\n\n<p><br>\n </p>\n\n<hr>\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center;\"><img alt=\"f2\" src=\"/storage/news/5.jpg\"></p>\n\n<p> </p>\n','published',NULL,'2025-03-28 07:26:39','2025-03-28 07:26:39',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores_translations`
--

DROP TABLE IF EXISTS `mp_stores_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_stores_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`mp_stores_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores_translations`
--

LOCK TABLES `mp_stores_translations` WRITE;
/*!40000 ALTER TABLE `mp_stores_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_stores_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_payment_method` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'bank_transfer',
  `tax_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
INSERT INTO `mp_vendor_info` VALUES (1,2,0.00,0.00,0.00,'$2y$12$FZEWtbbtNaU2lmC//aaW6.Lps4brCZaDT5TkRYyz/yyob2bpgVpmq','{\"name\":\"Prof. Percival Kiehn IV\",\"number\":\"+13146436434\",\"full_name\":\"Mr. Ubaldo Smith\",\"description\":\"Hunter Kohler\"}','2025-03-28 07:26:38','2025-03-28 07:26:38','bank_transfer',NULL),(2,3,0.00,0.00,0.00,'$2y$12$OSnul3fMw350iZk7aHjdaOLLeATPgHb13bUOB7SWabIlKEvLLvntG','{\"name\":\"Bud Raynor\",\"number\":\"+13865746185\",\"full_name\":\"Flavie Bailey\",\"description\":\"Anthony Mayert DVM\"}','2025-03-28 07:26:38','2025-03-28 07:26:38','bank_transfer',NULL),(3,4,0.00,0.00,0.00,'$2y$12$XuUDHCjdKyFSn3ogMveCBORHrFvjBuPoS1gXX66ruAsAOWHkF7BVC','{\"name\":\"Prof. Johnny Kutch\",\"number\":\"+16154493576\",\"full_name\":\"Lola Heaney\",\"description\":\"Hailey Hammes\"}','2025-03-28 07:26:38','2025-03-28 07:26:38','bank_transfer',NULL),(4,5,0.00,0.00,0.00,'$2y$12$mE4OPheoIQ6nGYupvpYuCeKP/kGcR7lG3HbYEsUOE45eVtYgHFbH.','{\"name\":\"Estevan Bergstrom\",\"number\":\"+14793442854\",\"full_name\":\"Tad Mills\",\"description\":\"Priscilla Schowalter\"}','2025-03-28 07:26:39','2025-03-28 07:26:39','bank_transfer',NULL),(5,6,0.00,0.00,0.00,'$2y$12$ASMD8KX9iu8p72.5/12Mx.sVqh7UEKoBgaWELGbWqKcFplDENI7Ey','{\"name\":\"Hellen Padberg\",\"number\":\"+15629026769\",\"full_name\":\"Natalia Pfeffer\",\"description\":\"Arne Tromp\"}','2025-03-28 07:26:39','2025-03-28 07:26:39','bank_transfer',NULL),(6,7,0.00,0.00,0.00,'$2y$12$3cUqcCQNQpT7qEs3nozsQOorGpH7z.YbS/4Uk0QDNeLTV7bhRevY.','{\"name\":\"Fredrick Smitham\",\"number\":\"+15862224926\",\"full_name\":\"Christian Durgan\",\"description\":\"Gilbert Gaylord\"}','2025-03-28 07:26:39','2025-03-28 07:26:39','bank_transfer',NULL),(7,8,0.00,0.00,0.00,'$2y$12$3PfHsCqbPU6uTu6X0SHyne.dglV4ZVIHVGvdAqPGgKQ5jbfyVuLVG','{\"name\":\"Margot O\'Conner\",\"number\":\"+19512125873\",\"full_name\":\"Miss Aurelie Kuhic\",\"description\":\"Callie Marks\"}','2025-03-28 07:26:39','2025-03-28 07:26:39','bank_transfer',NULL);
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[simple-slider key=\"home-slider\" is_autoplay=\"yes\" autoplay_speed=\"5000\" ads=\"VC2C8Q1UGCBG\" background=\"general/slider-bg.jpg\"][/simple-slider]</div><div>[featured-product-categories title=\"Browse by Category\"][/featured-product-categories]</div><div>[featured-brands title=\"Featured Brands\"][/featured-brands]</div><div>[flash-sale title=\"Top Saver Today\" flash_sale_id=\"1\"][/flash-sale]</div><div>[product-category-products title=\"Just Landing\" category_id=\"23\"][/product-category-products]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[featured-products title=\"Featured products\"][/featured-products]</div><div>[product-collections title=\"Essential Products\"][/product-collections]</div><div>[product-category-products category_id=\"18\"][/product-category-products]</div><div>[featured-posts title=\"Health Daily\" background=\"general/blog-bg.jpg\"\n                        app_enabled=\"1\"\n                        app_title=\"Shop faster with Farmart App\"\n                        app_description=\"Available on both iOS & Android\"\n                        app_bg=\"general/app-bg.png\"\n                        app_android_img=\"general/app-android.png\"\n                        app_android_link=\"#\"\n                        app_ios_img=\"general/app-ios.png\"\n                        app_ios_link=\"#\"][/featured-posts]</div>',1,NULL,'homepage',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,'About us',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(3,'Terms Of Use',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(4,'Terms &amp; Conditions',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(5,'Refund Policy',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(6,'Blog','<p>---</p>',1,NULL,'full-width',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(7,'FAQs','<div>[faq title=\"Frequently Asked Questions\"][/faq]</div>',1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(8,'Contact','<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Contact Info\" subtitle=\"Location\" name_1=\"Store\" address_1=\"68 Atlantic Ave St, Brooklyn, NY 90002, USA\" phone_1=\"(+005) 5896 72 78 79\" email_1=\"support@farmart.com\" name_2=\"Warehouse\" address_2=\"172 Richmond Hill Ave St, Stamford, NY 90002, USA\" phone_2=\"(+005) 5896 03 04 05\" show_contact_form=\"1\" ][/contact-info-boxes]</div>',1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(10,'Affiliate',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(11,'Career',NULL,1,NULL,NULL,NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(12,'Coming soon','<div>[coming-soon time=\"2026-03-28 14:26:40\" title=\"We’re coming soon.\" subtitle=\"Currently we’re working on our brand new website and will be\nlaunching soon.\" social_title=\"Connect us on social networks\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>',1,NULL,'coming-soon',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(3,1),(2,2),(4,2),(2,3),(3,3),(2,4),(4,4),(2,5),(4,5),(1,6),(4,6),(2,7),(4,7),(2,8),(4,8),(1,9),(3,9),(1,10),(3,10),(2,11),(3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',341,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1241,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1024,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',2385,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',2182,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',2420,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',1214,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',676,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',1865,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',810,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1150,NULL,'2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-03-28 07:26:27','2025-03-28 07:26:27');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','20cc7f15b9c88adb8ce0dc3faddc364b',NULL,'2025-03-28 07:26:42'),(2,'api_enabled','0',NULL,'2025-03-28 07:26:42'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"translation\"]',NULL,'2025-03-28 07:26:42'),(4,'analytics_dashboard_widgets','0','2025-03-28 07:26:24','2025-03-28 07:26:24'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-03-28 07:26:24','2025-03-28 07:26:24'),(6,'api_layer_api_key','',NULL,'2025-03-28 07:26:42'),(9,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-03-28 07:26:26','2025-03-28 07:26:26'),(10,'theme','farmart',NULL,'2025-03-28 07:26:42'),(11,'show_admin_bar','1',NULL,'2025-03-28 07:26:42'),(12,'language_hide_default','1',NULL,'2025-03-28 07:26:42'),(14,'language_display','all',NULL,'2025-03-28 07:26:42'),(15,'language_hide_languages','[]',NULL,'2025-03-28 07:26:42'),(16,'ecommerce_store_name','Farmart',NULL,'2025-03-28 07:26:42'),(17,'ecommerce_store_phone','1800979769',NULL,'2025-03-28 07:26:42'),(18,'ecommerce_store_address','502 New Street',NULL,'2025-03-28 07:26:42'),(19,'ecommerce_store_state','Brighton VIC',NULL,'2025-03-28 07:26:42'),(20,'ecommerce_store_city','Brighton VIC',NULL,'2025-03-28 07:26:42'),(21,'ecommerce_store_country','AU',NULL,'2025-03-28 07:26:42'),(22,'simple_slider_using_assets','0',NULL,'2025-03-28 07:26:42'),(23,'language_switcher_display','dropdown',NULL,'2025-03-28 07:26:42'),(24,'admin_favicon','general/favicon.png',NULL,'2025-03-28 07:26:42'),(25,'admin_logo','general/logo-light.png',NULL,'2025-03-28 07:26:42'),(26,'payment_cod_status','1',NULL,'2025-03-28 07:26:42'),(27,'payment_bank_transfer_status','1',NULL,'2025-03-28 07:26:42'),(28,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-03-28 07:26:42'),(29,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-03-28 07:26:42'),(30,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-03-28 07:26:42'),(31,'plugins_ecommerce_customer_new_order_status','0',NULL,'2025-03-28 07:26:42'),(32,'plugins_ecommerce_admin_new_order_status','0',NULL,'2025-03-28 07:26:42'),(33,'ecommerce_is_enabled_support_digital_products','1',NULL,'2025-03-28 07:26:42'),(34,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2025-03-28 07:26:42'),(35,'ecommerce_product_sku_format','SF-2443-%s%s%s%s',NULL,'2025-03-28 07:26:42'),(36,'ecommerce_store_order_prefix','SF',NULL,'2025-03-28 07:26:42'),(37,'ecommerce_enable_product_specification','1',NULL,'2025-03-28 07:26:42'),(38,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2025-03-28 07:26:42'),(39,'payment_cod_logo','payments/cod.png',NULL,'2025-03-28 07:26:42'),(40,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2025-03-28 07:26:42'),(41,'payment_stripe_logo','payments/stripe.webp',NULL,'2025-03-28 07:26:42'),(42,'payment_paypal_logo','payments/paypal.png',NULL,'2025-03-28 07:26:42'),(43,'payment_mollie_logo','payments/mollie.png',NULL,'2025-03-28 07:26:42'),(44,'payment_paystack_logo','payments/paystack.png',NULL,'2025-03-28 07:26:42'),(45,'payment_razorpay_logo','payments/razorpay.png',NULL,'2025-03-28 07:26:42'),(46,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2025-03-28 07:26:42'),(47,'permalink-botble-blog-models-post','blog',NULL,'2025-03-28 07:26:42'),(48,'permalink-botble-blog-models-category','blog',NULL,'2025-03-28 07:26:42'),(49,'theme-farmart-site_title','Farmart - Laravel Ecommerce system',NULL,NULL),(50,'theme-farmart-seo_description','Farmart is a modern and flexible Multipurpose Marketplace Laravel script. This script is suited for electronic, organic and grocery store, furniture store, clothing store, hitech store and accessories store… With the theme, you can create your own marketplace and allow vendors to sell just like Amazon, Envato, eBay…',NULL,NULL),(51,'theme-farmart-copyright','© %Y Farmart. All Rights Reserved.',NULL,NULL),(52,'theme-farmart-favicon','general/favicon.png',NULL,NULL),(53,'theme-farmart-logo','general/logo.png',NULL,NULL),(54,'theme-farmart-seo_og_image','general/open-graph-image.png',NULL,NULL),(55,'theme-farmart-image-placeholder','general/placeholder.png',NULL,NULL),(56,'theme-farmart-address','502 New Street, Brighton VIC, Australia',NULL,NULL),(57,'theme-farmart-hotline','8 800 332 65-66',NULL,NULL),(58,'theme-farmart-email','contact@fartmart.co',NULL,NULL),(59,'theme-farmart-working_time','Mon - Fri: 07AM - 06PM',NULL,NULL),(60,'theme-farmart-payment_methods_image','general/footer-payments.png',NULL,NULL),(61,'theme-farmart-homepage_id','1',NULL,NULL),(62,'theme-farmart-blog_page_id','6',NULL,NULL),(63,'theme-farmart-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(64,'theme-farmart-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(65,'theme-farmart-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(66,'theme-farmart-number_of_products_per_page','40',NULL,NULL),(67,'theme-farmart-number_of_cross_sale_product','6',NULL,NULL),(68,'theme-farmart-logo_in_the_checkout_page','general/logo.png',NULL,NULL),(69,'theme-farmart-logo_in_invoices','general/logo.png',NULL,NULL),(70,'theme-farmart-logo_vendor_dashboard','general/logo.png',NULL,NULL),(71,'theme-farmart-404_page_image','general/404.png',NULL,NULL),(72,'theme-farmart-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background-color\",\"value\":\"#3b5999\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background-color\",\"value\":\"#000\"}],[{\"key\":\"name\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background-color\",\"value\":\"#0a66c2\"}]]',NULL,NULL),(73,'theme-farmart-social_sharing','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background_color\",\"value\":\"#3b5999\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background_color\",\"value\":\"#55acee\"}],[{\"key\":\"name\",\"value\":\"Pinterest\"},{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background_color\",\"value\":\"#b10c0c\"}],[{\"key\":\"name\",\"value\":\"Linkedin\"},{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background_color\",\"value\":\"#0271ae\"}],[{\"key\":\"name\",\"value\":\"Whatsapp\"},{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"},{\"key\":\"icon_image\",\"value\":null},{\"key\":\"color\",\"value\":\"#fff\"},{\"key\":\"background_color\",\"value\":\"#25d366\"}]]',NULL,NULL),(74,'theme-farmart-primary_font','Mulish',NULL,NULL),(75,'theme-farmart-newsletter_popup_enable','1',NULL,NULL),(76,'theme-farmart-newsletter_popup_image','general/newsletter-popup.png',NULL,NULL),(77,'theme-farmart-newsletter_popup_title','Subscribe Now',NULL,NULL),(78,'theme-farmart-newsletter_popup_subtitle','Newsletter',NULL,NULL),(79,'theme-farmart-newsletter_popup_description','Subscribe to our newsletter and get 10% off your first purchase',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Slider 1','sliders/01.jpg','/products',NULL,1,'2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,1,'Slider 2','sliders/02.jpg','/products',NULL,2,'2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'foodpound',1,'Botble\\Ecommerce\\Models\\Brand','brands','2025-03-28 07:26:27','2025-03-28 07:26:27'),(2,'itea-jsc',2,'Botble\\Ecommerce\\Models\\Brand','brands','2025-03-28 07:26:27','2025-03-28 07:26:27'),(3,'soda-brand',3,'Botble\\Ecommerce\\Models\\Brand','brands','2025-03-28 07:26:27','2025-03-28 07:26:27'),(4,'farmart',4,'Botble\\Ecommerce\\Models\\Brand','brands','2025-03-28 07:26:27','2025-03-28 07:26:27'),(5,'soda-brand',5,'Botble\\Ecommerce\\Models\\Brand','brands','2025-03-28 07:26:27','2025-03-28 07:26:27'),(6,'fruits-vegetables',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(7,'fruits',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(8,'apples',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(9,'bananas',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(10,'berries',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(11,'oranges-easy-peelers',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(12,'grapes',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(13,'lemons-limes',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(14,'peaches-nectarines',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(15,'pears',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(16,'melon',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(17,'avocados',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(18,'plums-apricots',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(19,'vegetables',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(20,'potatoes',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(21,'carrots-root-vegetables',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(22,'broccoli-cauliflower',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(23,'cabbage-spinach-greens',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(24,'onions-leeks-garlic',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(25,'mushrooms',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(26,'tomatoes',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(27,'beans-peas-sweetcorn',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(28,'freshly-drink-orange-juice',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(29,'breads-sweets',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(30,'crisps-snacks-nuts',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(31,'crisps-popcorn',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(32,'nuts-seeds',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(33,'lighter-options',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(34,'cereal-bars',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(35,'breadsticks-pretzels',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(36,'fruit-snacking',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(37,'rice-corn-cakes',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(38,'protein-energy-snacks',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(39,'toddler-snacks',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(40,'meat-snacks',35,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(41,'beans',36,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(42,'lentils',37,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(43,'chickpeas',38,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(44,'tins-cans',39,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(45,'tomatoes',40,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(46,'baked-beans-spaghetti',41,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(47,'fish',42,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(48,'beans-pulses',43,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(49,'fruit',44,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(50,'coconut-milk-cream',45,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(51,'lighter-options',46,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(52,'olives',47,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(53,'sweetcorn',48,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(54,'carrots',49,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(55,'peas',50,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(56,'mixed-vegetables',51,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(57,'frozen-seafoods',52,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(58,'raw-meats',53,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(59,'wines-alcohol-drinks',54,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(60,'ready-meals',55,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(61,'meals-for-1',56,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(62,'meals-for-2',57,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(63,'indian',58,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(64,'italian',59,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(65,'chinese',60,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(66,'traditional-british',61,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(67,'thai-oriental',62,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(68,'mediterranean-moroccan',63,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(69,'mexican-caribbean',64,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(70,'lighter-meals',65,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(71,'lunch-veg-pots',66,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(72,'salad-herbs',67,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(73,'salad-bags',68,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(74,'cucumber',69,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(75,'tomatoes',70,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(76,'lettuce',71,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(77,'lunch-salad-bowls',72,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(78,'lunch-salad-bowls',73,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(79,'fresh-herbs',74,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(80,'avocados',75,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(81,'peppers',76,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(82,'coleslaw-potato-salad',77,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(83,'spring-onions',78,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(84,'chilli-ginger-garlic',79,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(85,'tea-coffee',80,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(86,'milks-and-dairies',81,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(87,'pet-foods',82,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(88,'food-cupboard',83,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-03-28 07:26:27','2025-03-28 07:26:27'),(89,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(90,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(91,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(92,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(93,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(94,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-03-28 07:26:30','2025-03-28 07:26:30'),(95,'dual-camera-20mp',1,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(96,'smart-watches',2,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(97,'beat-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(98,'red-black-headphone-digital',4,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(99,'smart-watch-external',5,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(100,'nikon-hd-camera',6,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(101,'audio-equipment',7,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(102,'smart-televisions-digital',8,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(103,'samsung-smart-phone',9,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(104,'herschel-leather-duffle-bag-in-brown-color',10,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(105,'xbox-one-wireless-controller-black-color',11,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(106,'epsion-plaster-printer-digital',12,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(107,'sound-intone-i65-earphone-white-version',13,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(108,'bo-play-mini-bluetooth-speaker',14,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(109,'apple-macbook-air-retina-133-inch-laptop',15,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(110,'apple-macbook-air-retina-12-inch-laptop-digital',16,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(111,'samsung-gear-vr-virtual-reality-headset',17,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(112,'aveeno-moisturizing-body-shower-450ml',18,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(113,'nyx-beauty-couton-pallete-makeup-12',19,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(114,'nyx-beauty-couton-pallete-makeup-12-digital',20,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(115,'mvmth-classical-leather-watch-in-black',21,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(116,'baxter-care-hair-kit-for-bearded-mens',22,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(117,'ciate-palemore-lipstick-bold-red-color',23,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(118,'vimto-squash-remix-apple-15-litres-digital',24,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(119,'crock-pot-slow-cooker',25,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(120,'taylors-of-harrogate-yorkshire-coffee',26,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(121,'soft-mochi-galeto-ice-cream',27,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(122,'naked-noodle-egg-noodles-singapore-digital',28,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(123,'saute-pan-silver',29,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(124,'bar-s-classic-bun-length-franks',30,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(125,'broccoli-crowns',31,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(126,'slimming-world-vegan-mac-greens-digital',32,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(127,'haagen-dazs-salted-caramel',33,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(128,'iceland-3-solo-exotic-burst',34,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(129,'extreme-budweiser-light-can',35,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(130,'iceland-macaroni-cheese-traybake-digital',36,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(131,'dolmio-bolognese-pasta-sauce',37,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(132,'sitema-bakeit-plastic-box',38,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(133,'wayfair-basics-dinner-plate-storage',39,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(134,'miko-the-panda-water-bottle-digital',40,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(135,'sesame-seed-bread',41,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(136,'morrisons-the-best-beef',42,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(137,'avocado-hass-large',43,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(138,'italia-beef-lasagne-digital',44,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(139,'maxwell-house-classic-roast-mocha',45,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(140,'bottled-pure-water-500ml',46,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(141,'famart-farmhouse-soft-white',47,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(142,'coca-cola-original-taste-digital',48,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(143,'casillero-diablo-cabernet-sauvignon',49,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(144,'arla-organic-free-range-milk',50,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(145,'aptamil-follow-on-baby-milk',51,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(146,'cuisinart-chefs-classic-hard-anodized-digital',52,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(147,'corn-yellow-sweet',53,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(148,'hobnobs-the-nobbly-biscuit',54,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(149,'honest-organic-still-lemonade',55,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(150,'ice-becks-beer-350ml-x-24-pieces-digital',56,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(151,'iceland-6-hot-cross-buns',57,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(152,'iceland-luxury-4-panini-rolls',58,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(153,'iceland-soft-scoop-vanilla',59,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(154,'iceland-spaghetti-bolognese-digital',60,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(155,'kelloggs-coco-pops-cereal',61,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(156,'kit-kat-chunky-milk-chocolate',62,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(157,'large-green-bell-pepper',63,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(158,'pice-94w-beasley-journal-digital',64,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:42'),(159,'province-piece-glass-drinking-glass',65,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:36','2025-03-28 07:26:36'),(160,'gopro',1,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(161,'global-office',2,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(162,'young-shop',3,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(163,'global-store',4,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(164,'roberts-store',5,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(165,'stouffer',6,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(166,'starkist',7,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(167,'old-el-paso',8,'Botble\\Marketplace\\Models\\Store','stores','2025-03-28 07:26:39','2025-03-28 07:26:39'),(168,'ecommerce',1,'Botble\\Blog\\Models\\Category','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(169,'fashion',2,'Botble\\Blog\\Models\\Category','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(170,'electronic',3,'Botble\\Blog\\Models\\Category','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(171,'commercial',4,'Botble\\Blog\\Models\\Category','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(172,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-03-28 07:26:40','2025-03-28 07:26:40'),(173,'design',2,'Botble\\Blog\\Models\\Tag','tag','2025-03-28 07:26:40','2025-03-28 07:26:40'),(174,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2025-03-28 07:26:40','2025-03-28 07:26:40'),(175,'branding',4,'Botble\\Blog\\Models\\Tag','tag','2025-03-28 07:26:40','2025-03-28 07:26:40'),(176,'modern',5,'Botble\\Blog\\Models\\Tag','tag','2025-03-28 07:26:40','2025-03-28 07:26:40'),(177,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(178,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(179,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(180,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(181,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(182,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(183,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(184,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(185,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(186,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(187,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','blog','2025-03-28 07:26:40','2025-03-28 07:26:41'),(188,'home',1,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(189,'about-us',2,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(190,'terms-of-use',3,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(191,'terms-conditions',4,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(192,'refund-policy',5,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(193,'blog',6,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(194,'faqs',7,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(195,'contact',8,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(196,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(197,'affiliate',10,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(198,'career',11,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(199,'coming-soon',12,'Botble\\Page\\Models\\Page','','2025-03-28 07:26:40','2025-03-28 07:26:40'),(200,'dual-camera-20mp',66,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(201,'dual-camera-20mp',67,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(202,'dual-camera-20mp',68,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(203,'nikon-hd-camera',69,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(204,'smart-televisions-digital',70,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(205,'smart-televisions-digital',71,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(206,'smart-televisions-digital',72,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(207,'herschel-leather-duffle-bag-in-brown-color',73,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(208,'herschel-leather-duffle-bag-in-brown-color',74,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(209,'sound-intone-i65-earphone-white-version',75,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(210,'sound-intone-i65-earphone-white-version',76,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(211,'sound-intone-i65-earphone-white-version',77,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(212,'mvmth-classical-leather-watch-in-black',78,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(213,'mvmth-classical-leather-watch-in-black',79,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(214,'baxter-care-hair-kit-for-bearded-mens',80,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(215,'vimto-squash-remix-apple-15-litres-digital',81,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(216,'vimto-squash-remix-apple-15-litres-digital',82,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(217,'vimto-squash-remix-apple-15-litres-digital',83,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(218,'vimto-squash-remix-apple-15-litres-digital',84,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(219,'crock-pot-slow-cooker',85,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(220,'crock-pot-slow-cooker',86,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(221,'crock-pot-slow-cooker',87,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(222,'crock-pot-slow-cooker',88,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(223,'taylors-of-harrogate-yorkshire-coffee',89,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(224,'taylors-of-harrogate-yorkshire-coffee',90,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(225,'soft-mochi-galeto-ice-cream',91,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(226,'soft-mochi-galeto-ice-cream',92,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(227,'bar-s-classic-bun-length-franks',93,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(228,'broccoli-crowns',94,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(229,'broccoli-crowns',95,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(230,'slimming-world-vegan-mac-greens-digital',96,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(231,'haagen-dazs-salted-caramel',97,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(232,'extreme-budweiser-light-can',98,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(233,'extreme-budweiser-light-can',99,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(234,'iceland-macaroni-cheese-traybake-digital',100,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(235,'sitema-bakeit-plastic-box',101,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(236,'sitema-bakeit-plastic-box',102,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(237,'sitema-bakeit-plastic-box',103,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(238,'sitema-bakeit-plastic-box',104,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(239,'wayfair-basics-dinner-plate-storage',105,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(240,'wayfair-basics-dinner-plate-storage',106,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(241,'bottled-pure-water-500ml',107,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(242,'bottled-pure-water-500ml',108,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(243,'bottled-pure-water-500ml',109,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(244,'famart-farmhouse-soft-white',110,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(245,'famart-farmhouse-soft-white',111,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(246,'famart-farmhouse-soft-white',112,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(247,'casillero-diablo-cabernet-sauvignon',113,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(248,'casillero-diablo-cabernet-sauvignon',114,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(249,'casillero-diablo-cabernet-sauvignon',115,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(250,'arla-organic-free-range-milk',116,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(251,'hobnobs-the-nobbly-biscuit',117,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(252,'hobnobs-the-nobbly-biscuit',118,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(253,'hobnobs-the-nobbly-biscuit',119,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(254,'hobnobs-the-nobbly-biscuit',120,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(255,'honest-organic-still-lemonade',121,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(256,'honest-organic-still-lemonade',122,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(257,'honest-organic-still-lemonade',123,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(258,'ice-becks-beer-350ml-x-24-pieces-digital',124,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(259,'ice-becks-beer-350ml-x-24-pieces-digital',125,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(260,'ice-becks-beer-350ml-x-24-pieces-digital',126,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(261,'iceland-luxury-4-panini-rolls',127,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(262,'iceland-luxury-4-panini-rolls',128,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(263,'iceland-soft-scoop-vanilla',129,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(264,'iceland-soft-scoop-vanilla',130,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(265,'iceland-soft-scoop-vanilla',131,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(266,'iceland-soft-scoop-vanilla',132,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(267,'kelloggs-coco-pops-cereal',133,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(268,'kit-kat-chunky-milk-chocolate',134,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(269,'kit-kat-chunky-milk-chocolate',135,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(270,'kit-kat-chunky-milk-chocolate',136,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(271,'pice-94w-beasley-journal-digital',137,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(272,'province-piece-glass-drinking-glass',138,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(273,'province-piece-glass-drinking-glass',139,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42'),(274,'province-piece-glass-drinking-glass',140,'Botble\\Ecommerce\\Models\\Product','products','2025-03-28 07:26:42','2025-03-28 07:26:42');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(2,'Design',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(3,'Fashion',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(4,'Branding',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40'),(5,'Modern',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-28 07:26:40','2025-03-28 07:26:40');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'duane.roberts@abernathy.com',NULL,'$2y$12$uaWzdCnqspZ0AqUfxwvTZ.T4XcQRrdjX5N9X1Azadn0rq4KzZtCqi',NULL,'2025-03-28 07:26:26','2025-03-28 07:26:26','Archibald','Rolfson','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SiteInfoWidget','footer_sidebar','farmart',0,'{\"id\":\"SiteInfoWidget\",\"name\":\"Farmart \\u2013 Your Online Foods & Grocery\",\"about\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus viverra iaculis. Etiam vulputate et justo eget scelerisque.\",\"phone\":\"(+965) 7492-4277\",\"address\":\"959 Homestead Street Eastlake, NYC\",\"email\":\"support@farmart.com\",\"working_time\":\"Mon - Fri: 07AM - 06PM\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(2,'CustomMenuWidget','footer_sidebar','farmart',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(3,'CustomMenuWidget','footer_sidebar','farmart',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Help Center\",\"menu_id\":\"help-center\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(4,'CustomMenuWidget','footer_sidebar','farmart',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Business\",\"menu_id\":\"business\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(5,'NewsletterWidget','footer_sidebar','farmart',4,'{\"id\":\"NewsletterWidget\",\"title\":\"Newsletter\",\"subtitle\":\"Register now to get updates on promotions and coupon. Don\\u2019t worry! We not spam\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(6,'BlogSearchWidget','primary_sidebar','farmart',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(7,'BlogCategoriesWidget','primary_sidebar','farmart',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(8,'RecentPostsWidget','primary_sidebar','farmart',3,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(9,'BlogTagsWidget','primary_sidebar','farmart',4,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(10,'SiteFeaturesWidget','pre_footer_sidebar','farmart',1,'{\"id\":\"SiteFeaturesWidget\",\"title\":\"Site Features\",\"data\":{\"1\":{\"icon\":\"general\\/icon-rocket.png\",\"title\":\"Free Shipping\",\"subtitle\":\"For all orders over $200\"},\"2\":{\"icon\":\"general\\/icon-reload.png\",\"title\":\"1 & 1 Returns\",\"subtitle\":\"Cancellation after 1 day\"},\"3\":{\"icon\":\"general\\/icon-protect.png\",\"title\":\"100% Secure Payment\",\"subtitle\":\"Guarantee secure payments\"},\"4\":{\"icon\":\"general\\/icon-support.png\",\"title\":\"24\\/7 Dedicated Support\",\"subtitle\":\"Anywhere & anytime\"},\"5\":{\"icon\":\"general\\/icon-tag.png\",\"title\":\"Daily Offers\",\"subtitle\":\"Discount up to 70% OFF\"}}}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(11,'AdsWidget','products_list_sidebar','farmart',1,'{\"id\":\"AdsWidget\",\"title\":\"Ads\",\"ads_key\":\"ZDOZUZZIU7FZ\",\"background\":\"general\\/background.jpg\",\"size\":\"full-width\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(12,'SiteFeaturesWidget','product_detail_sidebar','farmart',1,'{\"id\":\"SiteFeaturesWidget\",\"title\":\"Site Features\",\"data\":{\"1\":{\"icon\":\"general\\/icon-rocket.png\",\"title\":\"Free Shipping\",\"subtitle\":\"For all orders over $200\"},\"2\":{\"icon\":\"general\\/icon-reload.png\",\"title\":\"1 & 1 Returns\",\"subtitle\":\"Cancellation after 1 day\"},\"3\":{\"icon\":\"general\\/icon-protect.png\",\"title\":\"Secure Payment\",\"subtitle\":\"Guarantee secure payments\"}}}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(13,'SiteInfoWidget','product_detail_sidebar','farmart',2,'{\"id\":\"SiteInfoWidget\",\"name\":\"Store information\",\"phone\":\"(+965) 7492-4277\",\"working_time\":\"Mon - Fri: 07AM - 06PM\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(14,'BecomeVendorWidget','product_detail_sidebar','farmart',3,'{\"id\":\"BecomeVendorWidget\",\"name\":\"Become a Vendor?\"}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(15,'ProductCategoriesWidget','bottom_footer_sidebar','farmart',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Consumer Electric\",\"categories\":[18,2,3,4,5,6,7]}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(16,'ProductCategoriesWidget','bottom_footer_sidebar','farmart',2,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Clothing & Apparel\",\"categories\":[8,9,10,11,12]}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(17,'ProductCategoriesWidget','bottom_footer_sidebar','farmart',3,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Home, Garden & Kitchen\",\"categories\":[13,14,15,16,17]}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(18,'ProductCategoriesWidget','bottom_footer_sidebar','farmart',4,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Health & Beauty\",\"categories\":[20,21,22,23,24]}','2025-03-28 07:26:42','2025-03-28 07:26:42'),(19,'ProductCategoriesWidget','bottom_footer_sidebar','farmart',5,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Computer & Technologies\",\"categories\":[25,26,27,28,29,19]}','2025-03-28 07:26:42','2025-03-28 07:26:42');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 21:26:43
