-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `db_jatiasri` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_jatiasri`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `carts` (`id`, `users_id`, `products_id`, `created_at`, `updated_at`) VALUES
(5,	3,	2,	'2022-11-17 02:59:06',	'2022-11-17 02:59:06'),
(6,	3,	5,	'2022-11-17 03:00:47',	'2022-11-17 03:00:47');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2022_09_29_052332_create_sessions_table',	1),
(6,	'2022_09_29_065622_add_roles_to_users_table',	1),
(7,	'2022_09_29_072817_create_products_table',	2),
(8,	'2022_09_29_073602_create_product_galleries_table',	3),
(9,	'2022_09_29_074015_create_carts_table',	4),
(10,	'2022_09_29_074254_create_transactions_table',	5),
(11,	'2022_09_29_075009_create_transaction_items_table',	6),
(12,	'2019_12_14_000001_create_personal_access_tokens_table',	7);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `price`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Kursi Ruang Tamu',	1000000,	'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',	'kursi-ruang-tamu',	NULL,	'2022-11-14 09:36:34',	'2022-11-17 02:55:26'),
(2,	'Jam Dinding',	150000,	'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',	'jam-dinding',	NULL,	'2022-10-12 04:45:08',	'2022-11-17 01:12:09'),
(3,	'produk mantap',	200000,	'<p>sdfasd</p>',	'produk-mantap',	'2022-11-14 04:24:12',	'2022-11-14 03:09:09',	'2022-11-14 04:24:12'),
(5,	'Sangkar Burung / Ayam',	1520000,	'<p>barang paling rare se indonesia</p>\r\n\r\n<p>&nbsp;</p>',	'sangkar-burung-ayam',	NULL,	'2022-11-15 00:50:53',	'2022-11-17 01:17:17'),
(6,	'Kursi bapack bapack',	1500000,	'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',	'kursi-bapack-bapack',	NULL,	'2022-11-15 00:51:28',	'2022-11-17 01:23:20'),
(7,	'Kursi ergonomis paling enak',	3500000,	'<p>Ini adalah kursi paling enak di dunia, tidak hanya ergonomis melainkan kursi ini sangat kuat sekali bahkan kuat menahan beban sampai dengan 100 kg. kursi ini cocok untuk anda yang ingin memiliki kursi ergonomis, awet, kuat, dan tahan lama.</p>',	'kursi-ergonomis-paling-enak',	'2022-12-04 07:41:44',	'2022-11-15 00:51:57',	'2022-12-04 07:41:44'),
(8,	'Kursi ergonomis wanita',	2635000,	'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',	'kursi-ergonomis-wanita',	'2022-12-04 07:41:41',	'2022-11-16 20:55:44',	'2022-12-04 07:41:41');

DROP TABLE IF EXISTS `product_galleries`;
CREATE TABLE `product_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_galleries` (`id`, `products_id`, `url`, `is_featured`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	2,	'public/gallery/FgmU9vFHbuqL6jSA4b8s3CoKstpZtsN6yecv8JTC.jpg',	0,	'2022-11-17 01:12:17',	'2022-11-14 10:00:18',	'2022-11-17 01:12:17'),
(2,	2,	'public/gallery/gs5nmxGB5Pem5NY20DVi13T1tey16nevYroW4oaI.jpg',	0,	'2022-11-17 01:12:18',	'2022-11-14 10:00:18',	'2022-11-17 01:12:18'),
(4,	2,	'public/gallery/EIFmVPqVrMnUmVYQUySk44LkkQKgaWP7IN83Mrzf.png',	0,	'2022-11-17 01:12:15',	'2022-11-14 10:12:43',	'2022-11-17 01:12:15'),
(5,	1,	'public/gallery/cbDM3o9Lfp2QJsiuVNQVOTupy4voURBQvKigNz1f.png',	0,	'2022-11-17 01:09:06',	'2022-11-15 01:04:15',	'2022-11-17 01:09:06'),
(6,	1,	'public/gallery/zEOwZ0E07GLU9U4xft2mhK5fcmTJl8jKGZwwEBbK.png',	0,	'2022-11-17 01:09:07',	'2022-11-15 01:04:15',	'2022-11-17 01:09:07'),
(7,	1,	'public/gallery/i5VmNmoA4oEGR28nBUK1H0Oxif4GEXwNzIBnxnEV.png',	0,	'2022-11-17 01:09:08',	'2022-11-15 01:04:15',	'2022-11-17 01:09:08'),
(8,	1,	'public/gallery/jmLTPrUgWtJOHl0fqs1alvylIhHLXZOnjNdAIcfl.png',	0,	'2022-11-17 01:09:04',	'2022-11-15 01:04:15',	'2022-11-17 01:09:04'),
(9,	5,	'public/gallery/uUIxcU5sGSJTLSkjASbjLv8zpN4zfn3WoGQu1cnp.jpg',	0,	'2022-11-17 01:15:00',	'2022-11-16 20:01:57',	'2022-11-17 01:15:00'),
(10,	6,	'public/gallery/JvwyUaGeBtMbuGAciPB2R6zSouRIuw8MvFnM0hJu.jpg',	0,	'2022-11-17 01:17:29',	'2022-11-16 20:02:24',	'2022-11-17 01:17:29'),
(11,	5,	'public/gallery/0ajz4zDRRze0haD8A83IMQt4JtTQgyONgNv3yyDy.jpg',	0,	'2022-11-17 01:15:01',	'2022-11-16 20:48:13',	'2022-11-17 01:15:01'),
(12,	5,	'public/gallery/N0zp760TB2102YNTsbwLVcK72KSPQJl1HHLBqMWQ.jpg',	0,	'2022-11-17 01:15:02',	'2022-11-16 20:48:13',	'2022-11-17 01:15:02'),
(13,	5,	'public/gallery/AIDCrsdvJA8IwGfj5oUbQ4wmufy8X862dnTuez2n.jpg',	0,	'2022-11-17 01:15:03',	'2022-11-16 20:48:13',	'2022-11-17 01:15:03'),
(14,	5,	'public/gallery/3QQjDSYq87YgWZcAnkci7Fk3gmJ4usLie16tLJiM.jpg',	0,	'2022-11-17 01:14:58',	'2022-11-16 20:49:02',	'2022-11-17 01:14:58'),
(15,	7,	'public/gallery/TxIupMqGHX9WrI6Q4U4hf2cWTXdGnN5VaGFJVFqv.jpg',	0,	'2022-11-16 20:53:36',	'2022-11-16 20:52:52',	'2022-11-16 20:53:36'),
(16,	7,	'public/gallery/ac2abfEQbfM2s1Wojn3cG5z0QVaHM6SvoPYysXdl.jpg',	0,	'2022-11-16 20:53:37',	'2022-11-16 20:52:52',	'2022-11-16 20:53:37'),
(17,	7,	'public/gallery/VDaku5IifjdkbFAnRoALu0d7X3JRE3cEGLsVPmlP.jpg',	0,	'2022-11-16 20:53:38',	'2022-11-16 20:52:52',	'2022-11-16 20:53:38'),
(18,	7,	'public/gallery/VGWnuLrux996i4PO8hExyOK9g5iGYY4nBfFSGua3.jpg',	0,	'2022-11-16 20:53:39',	'2022-11-16 20:52:52',	'2022-11-16 20:53:39'),
(19,	7,	'public/gallery/tkUrCxSQRhVFJc8QGi88Lf8j2KLiFd6gBskSKxts.jpg',	0,	'2022-11-16 20:53:40',	'2022-11-16 20:52:52',	'2022-11-16 20:53:40'),
(20,	7,	'public/gallery/uEM46fpYyZLx1joazu1GRGcANlH9Zd2J0fPCZSNO.jpg',	0,	'2022-11-16 20:59:34',	'2022-11-16 20:54:15',	'2022-11-16 20:59:34'),
(21,	7,	'public/gallery/KTIRKZ4q4IQOg7MBOzz9vxAmz3hmZMQX3AyhrQFY.jpg',	0,	NULL,	'2022-11-16 20:54:15',	'2022-11-16 20:54:15'),
(22,	7,	'public/gallery/SlH9r8FryeTxKWwbmcCkaQMcRkmQlBCKR6UNCyaY.jpg',	0,	'2022-11-16 20:59:36',	'2022-11-16 20:54:15',	'2022-11-16 20:59:36'),
(23,	7,	'public/gallery/waIdAn0Yn09nfBq35P0UmHkDNSHkbeCMuUGkvnNp.jpg',	0,	'2022-11-16 20:59:37',	'2022-11-16 20:54:15',	'2022-11-16 20:59:37'),
(24,	7,	'public/gallery/Jm0pHhHMfHjBEZxkXZfbdkYVfHVOOLe9YogNTjKg.jpg',	0,	'2022-11-16 20:59:38',	'2022-11-16 20:54:15',	'2022-11-16 20:59:38'),
(25,	8,	'public/gallery/ssLJ9B31XqML5gL4blqMbEOjkOlJCurXCktMRX8U.png',	0,	NULL,	'2022-11-16 20:56:13',	'2022-11-16 20:56:13'),
(26,	8,	'public/gallery/uEk7xzi7Hv8eywdYmzGh1QnnP0y9JimVOQfwAzz2.png',	0,	NULL,	'2022-11-16 20:56:13',	'2022-11-16 20:56:13'),
(27,	8,	'public/gallery/UcLrDy76IU4jBRyQr1rmuk8KttDi1cVR2DFDsYOz.png',	0,	NULL,	'2022-11-16 20:56:13',	'2022-11-16 20:56:13'),
(28,	8,	'public/gallery/tTEZKvm9MWefWPVCbkM8hDKuMWTTn1OaDHtdL0vo.png',	0,	NULL,	'2022-11-16 20:56:13',	'2022-11-16 20:56:13'),
(29,	8,	'public/gallery/hiSX9UQhF52NRDpFF9nhtgNG1Pw8pIjYbmo05IQE.png',	0,	NULL,	'2022-11-16 20:56:13',	'2022-11-16 20:56:13'),
(30,	7,	'public/gallery/2cpFHOjOR9vgJc5vrjAL68fxR51WFGepyMlPZIgV.jpg',	0,	NULL,	'2022-11-16 20:59:55',	'2022-11-16 20:59:55'),
(31,	7,	'public/gallery/SwchJrhvVnEe0p62n7cJMwf2S449dZhJUYSJnicL.jpg',	0,	NULL,	'2022-11-16 20:59:55',	'2022-11-16 20:59:55'),
(32,	7,	'public/gallery/sjzkr8tnoeiFdbdSO0k0BtaiW5XyXLt1UGk0zJ69.jpg',	0,	NULL,	'2022-11-16 20:59:55',	'2022-11-16 20:59:55'),
(33,	7,	'public/gallery/REL4jWhRGMUcjsxiPpr8SgRfplqFodFpL2i3aqxP.jpg',	0,	NULL,	'2022-11-16 20:59:55',	'2022-11-16 20:59:55'),
(34,	1,	'public/gallery/5nWYXFvtWhL8OC2B3woDCGtM00zGL6stuWFdb8VH.png',	0,	NULL,	'2022-11-17 01:11:32',	'2022-11-17 01:11:32'),
(35,	1,	'public/gallery/1d5sfXINXCmJAwDNivyZuGPYhDrCxnZU7wbPpVEO.png',	0,	NULL,	'2022-11-17 01:11:32',	'2022-11-17 01:11:32'),
(36,	1,	'public/gallery/NFGQzi5WEyTjAnsqvsu9vgQqzXAO7OBvcv8tIde8.png',	0,	NULL,	'2022-11-17 01:11:32',	'2022-11-17 01:11:32'),
(37,	1,	'public/gallery/Ixvapt5cwNVpnJO0oetdO545emT49XZRWtrO6aMG.png',	0,	NULL,	'2022-11-17 01:11:32',	'2022-11-17 01:11:32'),
(38,	1,	'public/gallery/7smfL93fLULTB2l46K3mev0MOqpme75Nt0QuXHqV.png',	0,	'2022-11-17 02:55:42',	'2022-11-17 01:11:32',	'2022-11-17 02:55:42'),
(39,	2,	'public/gallery/xGPapOzpxVr64S4X3wGcuuJre944VkYXeqsOxRXc.jpg',	0,	NULL,	'2022-11-17 01:14:23',	'2022-11-17 01:14:23'),
(40,	2,	'public/gallery/kgQgynqMVUeve0mFDjaTGpCHZYch4bzNiASryrY9.jpg',	0,	NULL,	'2022-11-17 01:14:23',	'2022-11-17 01:14:23'),
(41,	2,	'public/gallery/GEYU6YWpfU3npxNMIm013wbUT4a9QFlR4so5MrjG.jpg',	0,	NULL,	'2022-11-17 01:14:23',	'2022-11-17 01:14:23'),
(42,	2,	'public/gallery/aLifyjzxSjz11FB62TZuinjfFjxQsgi0DSyUC0Fp.jpg',	0,	NULL,	'2022-11-17 01:14:23',	'2022-11-17 01:14:23'),
(43,	2,	'public/gallery/ET7qPgIGBDqVixEtmuDh2o9p3E4vnt5tbL3XTIIj.jpg',	0,	NULL,	'2022-11-17 01:14:23',	'2022-11-17 01:14:23'),
(44,	5,	'public/gallery/0X214kKKGA7R0Bjw751AfTBAigsLNKG8viqmQY5G.jpg',	0,	NULL,	'2022-11-17 01:17:00',	'2022-11-17 01:17:00'),
(45,	5,	'public/gallery/9zBDROhy4529FhNdFmhzj1Ku4PbDiiW4uBwtZbFj.jpg',	0,	NULL,	'2022-11-17 01:17:00',	'2022-11-17 01:17:00'),
(46,	5,	'public/gallery/a6QQdl1X4bRMc7PZVrvdDrM0DmPrepYm4VUP14II.jpg',	0,	NULL,	'2022-11-17 01:17:00',	'2022-11-17 01:17:00'),
(47,	5,	'public/gallery/oXnDk8kJIYNN8YxefGoBBkwqw7YdnfkSC3ilmRGJ.jpg',	0,	NULL,	'2022-11-17 01:17:00',	'2022-11-17 01:17:00'),
(48,	5,	'public/gallery/FsAHDwuUET4WxMSp1buFPtdVySloEYV2IKXYTe0O.jpg',	0,	NULL,	'2022-11-17 01:17:00',	'2022-11-17 01:17:00'),
(49,	6,	'public/gallery/L9EtqMxhsdgn8qSkDDfmGxg1YZAUaDmdXz9wAvgA.jpg',	0,	NULL,	'2022-11-17 01:17:53',	'2022-11-17 01:17:53'),
(50,	6,	'public/gallery/Tk3Ycxlxys7IY7XC7SxBLV6a1kgu9AroYUOiTeGg.jpg',	0,	NULL,	'2022-11-17 01:19:13',	'2022-11-17 01:19:13'),
(51,	6,	'public/gallery/b8mslmhEEOaoUNAFKOUkWyEdy1bKDSxYaPkwW9I0.jpg',	0,	NULL,	'2022-11-17 01:19:13',	'2022-11-17 01:19:13'),
(52,	6,	'public/gallery/kM102lkZHd90GjBDi9rYwWPl2HCFfEgAQ5EPrfSQ.jpg',	0,	NULL,	'2022-11-17 01:20:00',	'2022-11-17 01:20:00'),
(53,	6,	'public/gallery/OgvjvF4qK6KXpYG8nKbxEb2n3C8DCZKoUIIHFOfb.jpg',	0,	NULL,	'2022-11-17 01:20:00',	'2022-11-17 01:20:00'),
(54,	1,	'public/gallery/YXJjy8Pel3cxVgf4MtJzEJkPWM6L8yHTWRjUBz7u.png',	0,	NULL,	'2022-11-17 02:55:54',	'2022-11-17 02:55:54');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qqh5qgeMQgIRkqxPaIhlwOzKFpMMbZ8PB8S4mFjh',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFdpb0diU2pNNXA5TDFXS0VudDF4N0lRQWpCSVg2RzZ4ZW8xelVJZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=',	1670166274);

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MIDTRANS',
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` bigint(20) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transactions` (`id`, `users_id`, `name`, `email`, `address`, `phone`, `courier`, `payment`, `payment_url`, `total_price`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	1,	'faza',	'fazanur17@gmail.com',	'Bojonegoro, Jawa Timur, Indonesia',	'088291405649',	'JNE',	'MIDTRANS',	'https://midtrans.com',	2500000,	'FAILED',	NULL,	'2022-11-15 04:25:48',	'2022-11-15 00:59:06'),
(2,	2,	'Kholilurrr',	'kholil@yahoo.com',	'Bali, Indonesia',	'085602585694',	'Si Cepat',	'MIDTRANS',	'https://midtrans.com',	9500600,	'PENDING',	NULL,	'2022-11-15 08:02:58',	'2022-11-15 08:02:58'),
(3,	1,	'Faza',	'mfnh.action@gmail.com',	'Bojonegoro',	'088291405649',	NULL,	'MIDTRANS',	'https://app.sandbox.midtrans.com/snap/v3/redirection/508aa00e-bef9-4137-ab2a-e02b5fa6457c',	1500000,	'PENDING',	NULL,	'2022-11-29 20:37:25',	'2022-11-29 20:37:26'),
(4,	4,	'M. Faza Nur Husain',	'fazanur17@gmail.com',	'Bojonegoro',	'088291405649',	NULL,	'MIDTRANS',	'https://app.sandbox.midtrans.com/snap/v3/redirection/e0365401-c184-453c-aa92-fadd4ccf28bf',	1500000,	'PENDING',	NULL,	'2022-12-01 00:01:43',	'2022-12-01 00:01:45'),
(5,	4,	'M. Faza Nur Husain',	'fazanur17@gmail.com',	'Bojonegoro',	'088291405649',	NULL,	'MIDTRANS',	'https://app.sandbox.midtrans.com/snap/v3/redirection/c816f622-2503-4e0b-b45e-285d00f556c4',	4020000,	'PENDING',	NULL,	'2022-12-01 01:21:43',	'2022-12-01 01:21:43');

DROP TABLE IF EXISTS `transaction_items`;
CREATE TABLE `transaction_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `transactions_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transaction_items` (`id`, `users_id`, `products_id`, `transactions_id`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	1,	'2022-11-15 07:33:59',	'2022-11-15 07:33:59'),
(2,	1,	2,	1,	'2022-11-15 07:35:46',	'2022-11-15 07:35:46'),
(3,	2,	2,	2,	'2022-11-15 08:03:18',	'2022-11-15 08:03:18'),
(4,	2,	5,	2,	'2022-11-15 08:03:37',	'2022-11-15 08:03:37'),
(5,	1,	6,	3,	'2022-11-29 20:37:25',	'2022-11-29 20:37:25'),
(6,	4,	6,	4,	'2022-12-01 00:01:43',	'2022-12-01 00:01:43'),
(7,	4,	5,	5,	'2022-12-01 01:21:43',	'2022-12-01 01:21:43'),
(8,	4,	6,	5,	'2022-12-01 01:21:43',	'2022-12-01 01:21:43'),
(9,	4,	1,	5,	'2022-12-01 01:21:43',	'2022-12-01 01:21:43');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `roles`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1,	'M. Faza Nur Husain',	'fazanur17@gmail.com',	'ADMIN',	NULL,	'$2y$10$QknvQUJKXQ1H.Z8Inktr/uV/ed85HtFwaytMopJ9fHEY/7.UJWPn.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2022-10-05 23:45:05',	'2022-10-05 23:45:05'),
(3,	'Bintang kejora',	'bintang@gmail.com',	'USER',	NULL,	'$2y$10$IIqoPcY3hKhjNU1b2CDaGe550Wb/QIyXbA.YxOhYZsSNnZcbv2/qq',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2022-11-16 02:09:20',	'2022-11-16 02:10:04'),
(4,	'Faza Zas User Biasa',	'mfnh.action@gmail.com',	'USER',	NULL,	'$2y$10$mo69/ea3JOgE2eiMpdJQAOysJCHAYzJhLsCK/Bi6VG4ibfMIg6zGO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2022-11-29 20:12:59',	'2022-11-30 00:43:05'),
(5,	'admin',	'admin@gmail.com',	'ADMIN',	NULL,	'$2y$10$mEMMwHdPqYWPciZ4GiaRweroSuSUO2VF.yKjhobrKSrQc7nonFwre',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2022-12-04 07:39:42',	'2022-12-04 07:39:42');

-- 2022-12-04 15:11:41
