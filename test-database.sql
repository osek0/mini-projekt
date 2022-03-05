-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               8.0.28 - MySQL Community Server - GPL
-- Serwer OS:                    Linux
-- HeidiSQL Wersja:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych app
CREATE DATABASE IF NOT EXISTS `app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `app`;

-- Zrzut struktury tabela app.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` varchar(36) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `postId` varchar(255) NOT NULL,
  `nsleft` int NOT NULL DEFAULT '1',
  `nsright` int NOT NULL DEFAULT '2',
  `parentId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_94a85bb16d24033a2afdd5df060` (`postId`),
  KEY `FK_e3aebe2bd1c53467a07109be596` (`parentId`),
  CONSTRAINT `FK_94a85bb16d24033a2afdd5df060` FOREIGN KEY (`postId`) REFERENCES `post` (`id`),
  CONSTRAINT `FK_e3aebe2bd1c53467a07109be596` FOREIGN KEY (`parentId`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Zrzucanie danych dla tabeli app.comment: ~17 rows (około)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `content`, `status`, `createdAt`, `postId`, `nsleft`, `nsright`, `parentId`) VALUES
	('012257fd-9c8d-11ec-8502-0242ac120002', 'test14', 0, '2022-03-05 14:03:16.499018', 'd656769a-9c8c-11ec-8502-0242ac120002', 1, 2, NULL),
	('01226115-9c8d-11ec-8502-0242ac120002', 'test15', 0, '2022-03-05 14:03:16.499018', 'd656769a-9c8c-11ec-8502-0242ac120002', 1, 2, NULL),
	('012262d5-9c8d-11ec-8502-0242ac120002', 'test16', 0, '2022-03-05 14:03:16.499018', 'd656769a-9c8c-11ec-8502-0242ac120002', 1, 2, NULL),
	('198fd9eb-9c8d-11ec-8502-0242ac120002', 'test17', 0, '2022-03-05 14:03:57.482133', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, NULL),
	('397baecd-9c8c-11ec-8502-0242ac120002', 'test11', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaa26-9c8b-11ec-8502-0242ac120002'),
	('397bb470-9c8c-11ec-8502-0242ac120002', 'test12', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaa26-9c8b-11ec-8502-0242ac120002'),
	('397bb65d-9c8c-11ec-8502-0242ac120002', 'test13', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaa26-9c8b-11ec-8502-0242ac120002'),
	('397bb75c-9c8c-11ec-8502-0242ac120002', 'test5', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaf3f-9c8b-11ec-8502-0242ac120002'),
	('397bb82c-9c8c-11ec-8502-0242ac120002', 'test6', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaf3f-9c8b-11ec-8502-0242ac120002'),
	('397bbddd-9c8c-11ec-8502-0242ac120002', 'test7', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41aaf3f-9c8b-11ec-8502-0242ac120002'),
	('397bbf94-9c8c-11ec-8502-0242ac120002', 'test8', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41ab128-9c8b-11ec-8502-0242ac120002'),
	('397bc04d-9c8c-11ec-8502-0242ac120002', 'test9', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41ab128-9c8b-11ec-8502-0242ac120002'),
	('397bc2bc-9c8c-11ec-8502-0242ac120002', 'test10', 0, '2022-03-05 13:57:41.540288', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'f41ab128-9c8b-11ec-8502-0242ac120002'),
	('d86138c7-9c8b-11ec-8502-0242ac120002', 'test', 0, '2022-03-05 13:54:58.627902', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, NULL),
	('f41aaa26-9c8b-11ec-8502-0242ac120002', 'test2', 0, '2022-03-05 13:55:45.141683', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'd86138c7-9c8b-11ec-8502-0242ac120002'),
	('f41aaf3f-9c8b-11ec-8502-0242ac120002', 'test3', 0, '2022-03-05 13:55:45.141683', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'd86138c7-9c8b-11ec-8502-0242ac120002'),
	('f41ab128-9c8b-11ec-8502-0242ac120002', 'test4', 0, '2022-03-05 13:55:45.141683', '20d473c6-9c3c-11ec-a4d4-0242ac120002', 1, 2, 'd86138c7-9c8b-11ec-8502-0242ac120002');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Zrzut struktury tabela app.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Zrzucanie danych dla tabeli app.post: ~2 rows (około)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `description`) VALUES
	('20d473c6-9c3c-11ec-a4d4-0242ac120002', 'test', 'some text'),
	('d656769a-9c8c-11ec-8502-0242ac120002', 'post2', 'lorem ipsum');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
