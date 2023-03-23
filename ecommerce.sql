-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'paijo','jl. Kutilang berkicau 12, jakarta barat');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `get_cart`
--

DROP TABLE IF EXISTS `get_cart`;
/*!50001 DROP VIEW IF EXISTS `get_cart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_cart` AS SELECT 
 1 AS `id`,
 1 AS `tgl_mutasi`,
 1 AS `pcode`,
 1 AS `order_id`,
 1 AS `type_mutasi`,
 1 AS `jml_mutasi`,
 1 AS `product_name`,
 1 AS `price`,
 1 AS `jml_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_stock`
--

DROP TABLE IF EXISTS `get_stock`;
/*!50001 DROP VIEW IF EXISTS `get_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_stock` AS SELECT 
 1 AS `pcode`,
 1 AS `product_name`,
 1 AS `price`,
 1 AS `jumlah`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mutasi_stock`
--

DROP TABLE IF EXISTS `mutasi_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tgl_mutasi` date NOT NULL,
  `pcode` varchar(10) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `type_mutasi` enum('O','I') NOT NULL,
  `jumlah` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutasi_stock`
--

LOCK TABLES `mutasi_stock` WRITE;
/*!40000 ALTER TABLE `mutasi_stock` DISABLE KEYS */;
INSERT INTO `mutasi_stock` VALUES (1,'2020-02-17','010001','INV/07/2020/00001','O',2),(17,'2023-03-23','010001','INV/03/2023/00001','I',3);
/*!40000 ALTER TABLE `mutasi_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `pcode` varchar(10) NOT NULL,
  `qty` tinyint NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'INV/07/2020/00001','010001',2,10000,20000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_header` (
  `order_id` varchar(20) NOT NULL,
  `order_date` date NOT NULL,
  `customer_name` varchar(15) NOT NULL,
  `promo_code` varchar(10) DEFAULT NULL,
  `amount_discount` decimal(10,0) DEFAULT NULL,
  `net` decimal(10,0) NOT NULL,
  `ppn` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES ('INV/07/2020/00001','2020-02-17','202007-0001','pmo-001',1000,20000,1900,20900);
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pcode` varchar(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`pcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('010001','MIRANDA H.C N.BLACK 30.MC1',10000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `promo_code` varchar(10) NOT NULL,
  `Promo_name` tinytext NOT NULL,
  PRIMARY KEY (`promo_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` VALUES ('pmo-001','Setiap pembelian MIRANDA H.C N.BLACK 30.MC1, mendapat porongan 1000');
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `pcode` varchar(10) NOT NULL,
  `jumlah` int NOT NULL,
  PRIMARY KEY (`pcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('010001',200);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `checkout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkout`(
in d_order_id char(20),
in d_pmo_code char(10)
)
BEGIN
INSERT INTO order_header (order_id, order_date, customer_name, promo_code, amount_discount, net, ppn, total)
SELECT 
    order_id,
    CURDATE() as order_date,
    '202007-0001' as customer_name,
    d_pmo_code as pmo_code,
    '1000' as amount_discount,
    jml_mutasi*price as net,
    (((jml_mutasi*price)-1000)*10) div 100 as ppn,
    ((jml_mutasi*price)-1000)+(((jml_mutasi*price)-1000)*10) div 100 as total
FROM
    get_cart
WHERE
    order_id = d_order_id;

INSERT INTO order_header (order_id, pcode, qty, price, subtotal)
SELECT 
    order_id,
    pcode,
    jml_mutasi as qty,
    price,
    jml_mutasi*price as subtotal
FROM
    get_cart
WHERE
    order_id = d_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cart`(
in d_pcode char(10),
in d_jumlah int
)
BEGIN
(SELECT 
    tgl_mutasi,
    pcode,
    order_id,
    type_mutasi,
    jumlah + d_jumlah AS jumlah,
    true as status
FROM
    mutasi_stock
WHERE
    pcode = d_pcode AND type_mutasi = 'I'
ORDER BY id DESC
LIMIT 1) UNION (SELECT 
    CURDATE() as tgl_mutasi,
    d_pcode as pcode,
    CONCAT('INV/',
            DATE_FORMAT(CURDATE(), '%m'),
            '/',
            DATE_FORMAT(CURDATE(), '%Y'),
            '/00001') AS `order_id`,
    'I' as type_mutasi,
    d_jumlah as jumlah,
    false as status
FROM
    mutasi_stock)
LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `get_cart`
--

/*!50001 DROP VIEW IF EXISTS `get_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_cart` AS select `ms`.`id` AS `id`,`ms`.`tgl_mutasi` AS `tgl_mutasi`,`ms`.`pcode` AS `pcode`,`ms`.`order_id` AS `order_id`,`ms`.`type_mutasi` AS `type_mutasi`,`ms`.`jumlah` AS `jml_mutasi`,`p`.`product_name` AS `product_name`,`p`.`price` AS `price`,`s`.`jumlah` AS `jml_stock` from ((`mutasi_stock` `ms` join `product` `p` on((`ms`.`pcode` = `p`.`pcode`))) join `stock` `s` on((`p`.`pcode` = `s`.`pcode`))) where (`ms`.`type_mutasi` = 'I') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_stock`
--

/*!50001 DROP VIEW IF EXISTS `get_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_stock` AS select `p`.`pcode` AS `pcode`,`p`.`product_name` AS `product_name`,`p`.`price` AS `price`,`s`.`jumlah` AS `jumlah` from (`product` `p` join `stock` `s` on((`p`.`pcode` = `s`.`pcode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24  6:30:06
