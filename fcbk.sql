-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2019 at 04:31 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fcbk`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentable`
--

CREATE TABLE `commentable` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentable`
--

INSERT INTO `commentable` (`id`, `user_id`, `commentable_id`, `commentable_type`, `comment`, `created_at`, `updated_at`) VALUES
(15, 6, 15, 'App\\Post', 'Word Bro!', '2018-09-27 10:57:35', '2018-09-27 10:57:35'),
(18, 1, 7, 'App\\Post', 'WTF! are you saying', '2018-09-27 17:39:59', '2018-09-27 17:39:59');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `friend_id` int(10) UNSIGNED NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `accepted`, `created_at`, `updated_at`) VALUES
(42, 6, 1, 1, NULL, NULL),
(43, 1, 50, 0, NULL, NULL),
(44, 1, 44, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2c3bc56e-344b-4f84-83dd-ffa3c99b5dfe\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756163, 1538756163),
(2, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2c3bc56e-344b-4f84-83dd-ffa3c99b5dfe\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756163, 1538756163),
(3, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2c3bc56e-344b-4f84-83dd-ffa3c99b5dfe\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756163, 1538756163),
(4, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:44;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"b2ddefce-2398-4168-8d41-864d13190e57\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756233, 1538756233),
(5, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:44;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"b2ddefce-2398-4168-8d41-864d13190e57\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756233, 1538756233),
(6, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewFriendRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:44;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:34:\\\"App\\\\Notifications\\\\NewFriendRequest\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"b2ddefce-2398-4168-8d41-864d13190e57\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1538756233, 1538756233);

-- --------------------------------------------------------

--
-- Table structure for table `likeable`
--

CREATE TABLE `likeable` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `likeable_id` int(11) NOT NULL,
  `likeable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likeable`
--

INSERT INTO `likeable` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(6, 6, 7, 'App\\Post', '2018-09-26 14:51:18', '2018-09-26 14:51:18'),
(16, 8, 7, 'App\\Post', '2018-09-27 08:16:02', '2018-09-27 08:16:02'),
(17, 1, 7, 'App\\Post', '2018-09-27 08:16:50', '2018-09-27 08:16:50'),
(18, 1, 15, 'App\\Post', '2018-09-27 08:17:24', '2018-09-27 08:17:24'),
(19, 6, 15, 'App\\Post', '2018-09-27 08:18:00', '2018-09-27 08:18:00'),
(23, 1, 2, 'App\\Comment', '2018-09-27 10:46:15', '2018-09-27 10:46:15'),
(25, 6, 2, 'App\\Comment', '2018-09-27 10:46:44', '2018-09-27 10:46:44'),
(26, 6, 14, 'App\\Comment', '2018-09-27 10:54:40', '2018-09-27 10:54:40'),
(44, 6, 32, 'App\\Post', '2018-10-04 09:22:25', '2018-10-04 09:22:25'),
(45, 1, 15, 'App\\Comment', '2018-10-04 09:37:10', '2018-10-04 09:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender` int(10) UNSIGNED NOT NULL,
  `recepient` int(10) UNSIGNED NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `recepient`, `msg`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'Good Afternoon', '2018-10-03 10:50:11', '2018-10-03 10:50:11'),
(2, 6, 1, 'How are you doing', '2018-10-03 10:50:26', '2018-10-03 10:50:26'),
(3, 1, 6, 'Very Bad', '2018-10-03 11:01:23', '2018-10-03 11:01:23'),
(4, 6, 1, 'Why, What happened?', '2018-10-03 11:03:07', '2018-10-03 11:03:07'),
(5, 1, 6, 'I was robbed', '2018-10-03 11:04:45', '2018-10-03 11:04:45'),
(6, 6, 1, 'Seriously', '2018-10-03 11:05:00', '2018-10-03 11:05:00'),
(7, 6, 1, 'Jesus!!', '2018-10-03 11:05:18', '2018-10-03 11:05:18'),
(8, 1, 6, 'Yes oo', '2018-10-03 11:07:06', '2018-10-03 11:07:06'),
(9, 1, 6, 'God go help us', '2018-10-03 11:07:47', '2018-10-03 11:07:47'),
(10, 1, 6, 'You dey come house today', '2018-10-03 11:20:53', '2018-10-03 11:20:53'),
(11, 1, 6, 'I\'m back', '2018-10-03 12:12:33', '2018-10-03 12:12:33'),
(12, 6, 1, 'Hello', '2018-10-03 12:13:43', '2018-10-03 12:13:43'),
(13, 1, 6, 'baddest', '2018-10-03 12:14:04', '2018-10-03 12:14:04'),
(14, 1, 6, 'Hello', '2018-10-03 12:37:29', '2018-10-03 12:37:29'),
(15, 6, 1, 'sup', '2018-10-03 12:38:08', '2018-10-03 12:38:08'),
(16, 1, 6, 'Ki lon ball', '2018-10-03 12:38:19', '2018-10-03 12:38:19'),
(17, 6, 1, 'I just dey on a lowkey', '2018-10-03 13:40:57', '2018-10-03 13:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_09_11_151119_create_friends_table', 2),
(4, '2018_09_16_153041_create_notifications_table', 3),
(5, '2018_09_19_123310_create_posts_table', 4),
(6, '2018_09_21_210750_create_messages_table', 5),
(7, '2018_09_26_140257_create_likes_table', 6),
(8, '2018_09_26_144833_create_likeable_table', 7),
(10, '2018_09_27_091930_create_commentable_table', 8),
(11, '2018_10_02_160304_create_jobs_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('21115389-4d2e-42ca-9a3a-8a15a525c150', 'App\\Notifications\\FriendRequestAccepted', 'App\\User', 1, '{\"name\":\"Myrtice Schultz\",\"message\":\"Accepted Your Friend Request. Write on Myrtice Schultz timeline\"}', '2018-10-03 10:20:40', '2018-10-03 10:20:25', '2018-10-03 10:20:40'),
('33211647-c0ec-44ea-9a87-4128ebf118a6', 'App\\Notifications\\NewFriendRequest', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Addison Smith, sent you a friend request\"}', '2018-10-03 10:10:28', '2018-10-03 09:17:39', '2018-10-03 10:10:28'),
('4657dffc-6345-44d7-acb7-ed7c36e284c2', 'App\\Notifications\\NewFriendRequest', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Addison Smith, sent you a friend request\"}', '2018-10-03 10:10:28', '2018-10-03 09:46:02', '2018-10-03 10:10:28'),
('7ca43274-de21-4e70-8c18-8b8cb5d987a7', 'App\\Notifications\\NewFriendRequest', 'App\\User', 1, '{\"name\":\"Myrtice Schultz\",\"message\":\"Myrtice Schultz, sent you a friend request\"}', '2018-10-03 10:14:27', '2018-10-03 09:20:04', '2018-10-03 10:14:27'),
('89375303-caf2-42a3-9892-b4779ff19138', 'App\\Notifications\\FriendRequestAccepted', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Accepted Your Friend Request. Write on Addison Smith timeline\"}', NULL, '2018-10-03 10:44:38', '2018-10-03 10:44:38'),
('9001e12a-5ae5-409e-988d-508a9a15d00e', 'App\\Notifications\\NewFriendRequest', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Addison Smith, sent you a friend request\"}', '2018-10-03 10:10:28', '2018-10-03 09:47:59', '2018-10-03 10:10:28'),
('9398b065-6412-43f1-9c1c-2f4ecc900a59', 'App\\Notifications\\NewFriendRequest', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Addison Smith, sent you a friend request\"}', '2018-10-03 10:10:28', '2018-10-03 09:15:06', '2018-10-03 10:10:28'),
('ca4a4cb4-7551-4f04-97fa-22b755961111', 'App\\Notifications\\NewFriendRequest', 'App\\User', 1, '{\"name\":\"Myrtice Schultz\",\"message\":\"Myrtice Schultz, sent you a friend request\"}', '2018-10-03 10:14:27', '2018-10-03 09:18:51', '2018-10-03 10:14:27'),
('d73c37e5-7069-4946-a9f2-111a3bc3b1c3', 'App\\Notifications\\NewFriendRequest', 'App\\User', 1, '{\"name\":\"Myrtice Schultz\",\"message\":\"Myrtice Schultz, sent you a friend request\"}', '2018-10-03 13:41:09', '2018-10-03 10:30:38', '2018-10-03 13:41:09'),
('f3db50e3-6177-482a-b211-13dee86beecb', 'App\\Notifications\\NewFriendRequest', 'App\\User', 6, '{\"name\":\"Addison Smith\",\"message\":\"Addison Smith, sent you a friend request\"}', '2018-10-03 10:10:28', '2018-10-03 09:45:40', '2018-10-03 10:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('alison@gmail.com', '$2y$10$6V1HmBfNWmaKs1NVGstsGeAlm2byefoxRnG7H4zmSrVweOf4.1lvW', '2018-10-05 08:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `status`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'There’s my life. Deal with it. Oh, wait! Can’t process it. Losers! WINNING! B’bye. Major League 3? I don’t know. I haven’t read it. I don’t care.', NULL, 6, '2018-09-19 14:44:39', '2018-09-19 14:44:39'),
(7, 'Cake pie tiramisu carrot cake wafer soufflé danish tiramisu. Powder liquorice carrot cake carrot cake croissant marshmallow. Marshmallow I love candy ice cream I love. Tiramisu topping bonbon chocolate bar dessert pastry sugar plum.', NULL, 6, '2018-09-26 10:03:51', '2018-09-26 10:03:51'),
(15, 'U deserve 2 b happy n u deserve 2 live a life you\'re happy about ...😇😇\n\n#Grateful 🙏🙏', NULL, 1, '2018-09-27 08:17:12', '2018-09-27 08:17:12'),
(32, 'Halleluyah', 'myrtice-schultz-kv/timeline/HCUcvQbAl7RXV0VLq1XInVkhZvR7dIBOsMxVtmZH.jpeg', 6, '2018-10-03 14:27:59', '2018-10-03 14:27:59'),
(33, 'Grace of God', NULL, 1, '2018-10-05 08:16:16', '2018-10-05 08:16:16'),
(34, 'Non eaque nulla est saepe est. Voluptatem quaerat excepturi sed laboriosam magni incidunt.', NULL, 16, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(35, 'Sed iste eos fuga enim provident voluptas ut. Voluptates et repellendus voluptas porro.', NULL, 17, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(36, 'Excepturi sed quas nulla quos voluptatem enim. Repellendus iusto consequuntur velit corrupti.', NULL, 18, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(37, 'Autem ipsam libero provident occaecati quisquam eaque. Consectetur modi ad voluptas est eveniet in.', NULL, 19, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(38, 'Autem et quo consequatur nesciunt. Libero aliquid adipisci quo et est. Et minus est qui quia.', NULL, 20, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(39, 'Tenetur qui natus sint odio facere temporibus. Dicta enim dolorem non id eos atque delectus.', NULL, 21, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(40, 'Dolorem rem est eum iste sit quasi. Incidunt cupiditate ut unde natus officiis laboriosam.', NULL, 22, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(41, 'Id qui perspiciatis et. Ut maxime non perspiciatis.', NULL, 23, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(42, 'Aut ex nihil voluptate culpa. Quo vel aut eum. Pariatur aut facilis nostrum qui.', NULL, 24, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(43, 'Cumque ipsam quo libero. Quo iure temporibus aperiam dolores non esse.', NULL, 25, '2018-10-05 09:48:02', '2018-10-05 09:48:02'),
(44, 'Pariatur et sint sit voluptatem explicabo. Praesentium itaque ab culpa est.', NULL, 46, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(45, 'Molestiae sint officia sed pariatur deserunt. Id rem cupiditate sint dicta qui est.', NULL, 46, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(46, 'At quia velit vitae ut sunt. Fuga vero eum a recusandae ullam. Aliquid enim officiis et eos iure.', NULL, 46, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(47, 'Mollitia enim blanditiis aut quia praesentium rerum. Aspernatur deleniti exercitationem vitae.', NULL, 46, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(48, 'Eos illo culpa sed ut iure. At autem nesciunt vel dolores.', NULL, 46, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(49, 'Natus error magnam qui distinctio recusandae molestiae rem. Omnis eaque quis et deleniti.', NULL, 47, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(50, 'Sunt omnis et aut et. Vero enim aut sint numquam nostrum culpa.', NULL, 47, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(51, 'Voluptas amet est et. Magnam voluptas sed ullam pariatur.', NULL, 47, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(52, 'Maiores animi quae non et non eos sint. Mollitia fugit ex beatae voluptate.', NULL, 47, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(53, 'Aut suscipit et minus exercitationem et. At non est ut. Laborum et quidem corporis porro.', NULL, 47, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(54, 'Vero vero aliquam fugiat quis eius. Laboriosam doloremque ut quis molestias sed sint non.', NULL, 48, '2018-10-05 10:02:38', '2018-10-05 10:02:38'),
(55, 'Provident eum blanditiis quis et. Non vero eos dolores dolor a.', NULL, 48, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(56, 'Ut ut dolore sed eum consequatur incidunt. Pariatur rem eum repudiandae tempora ut.', NULL, 48, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(57, 'Cum quod eligendi rem molestias libero ad. Labore libero dicta rerum voluptatibus.', NULL, 48, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(58, 'Et animi fugiat dolores aut voluptas illo id. Nam vel asperiores corrupti.', NULL, 48, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(59, 'Itaque eligendi delectus optio. Pariatur voluptates voluptatem autem. Et sit quod dolor recusandae.', NULL, 49, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(60, 'Quas ut repellat occaecati. Aut porro repellendus et quis quae consequatur.', NULL, 49, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(61, 'Ut atque dolor quo. Atque ex cupiditate commodi accusantium rerum.', NULL, 49, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(62, 'Iusto perferendis ut occaecati corrupti. Fugit voluptate eum veniam et aut.', NULL, 49, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(63, 'Qui aut dolor rem sed non. Unde et et optio nihil. Voluptas et quae est aperiam autem.', NULL, 49, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(64, 'Animi suscipit eaque ipsum voluptatem. Mollitia sequi vero quo nihil architecto in.', NULL, 50, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(65, 'Quis omnis fugit harum ut. Ea facere veniam est optio qui est. Id aut rem dolor.', NULL, 50, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(66, 'Vitae sit dolore ipsam debitis dolorem. Ab ab dicta accusamus voluptatibus et fuga debitis.', NULL, 50, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(67, 'Est sit doloremque optio nesciunt. Iste rerum velit iste voluptas.', NULL, 50, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(68, 'Dolor qui esse laborum sapiente. Nobis ut corporis fugit. Blanditiis minus voluptatem cum labore.', NULL, 50, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(69, 'Quisquam quo accusantium est temporibus alias. A aut recusandae dolores laborum nulla in.', NULL, 51, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(70, 'Rerum adipisci aperiam sit qui. Accusantium deserunt ut rerum illo.', NULL, 51, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(71, 'Reprehenderit sit distinctio eligendi consectetur. Cum quos soluta velit dolore voluptatum.', NULL, 51, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(72, 'Soluta culpa incidunt eius maiores. Expedita in est enim aut voluptate odit numquam iusto.', NULL, 51, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(73, 'Odit maiores ea ut eligendi. Quia ducimus voluptatibus omnis exercitationem et sed.', NULL, 51, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(74, 'Nihil nulla eligendi accusamus nihil. Magni quaerat minus ab itaque. Provident tempora eveniet ex.', NULL, 52, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(75, 'Exercitationem vel aliquam culpa. Unde soluta amet animi vel deleniti.', NULL, 52, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(76, 'Placeat id debitis ut doloremque est libero. Reprehenderit ipsam quam labore sapiente enim.', NULL, 52, '2018-10-05 10:02:39', '2018-10-05 10:02:39'),
(77, 'Omnis ipsa natus voluptatem porro. Eum et hic magnam illo voluptas dicta quis. At ut impedit illo.', NULL, 52, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(78, 'Et quaerat sunt harum. Doloribus id ea quo est quas at beatae. Hic dolorum eligendi modi.', NULL, 52, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(79, 'Quisquam rem ipsa illo. Similique vitae quos minus quis est.', NULL, 53, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(80, 'Sunt molestiae in ut commodi sint. Sit totam fuga nostrum.', NULL, 53, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(81, 'Maxime rerum quibusdam explicabo. Et eveniet non et iure commodi.', NULL, 53, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(82, 'Excepturi eos doloribus id ipsa harum. Voluptatum et et eius dignissimos sequi.', NULL, 53, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(83, 'Officia explicabo omnis velit quod unde. Velit ea rerum veritatis non consectetur sit.', NULL, 53, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(84, 'Nam repellat unde autem velit. Aut nostrum aspernatur iure qui sint et.', NULL, 54, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(85, 'Quaerat rerum ea ut nostrum eligendi. In labore qui facere aut. Quod et in totam est sequi aut sit.', NULL, 54, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(86, 'Cum quaerat tenetur dolores rerum rerum quam et. Id non quod et veritatis.', NULL, 54, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(87, 'Quidem dolorum voluptas quibusdam distinctio incidunt consequatur. Quis non doloremque est.', NULL, 54, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(88, 'Tempora officiis fuga cupiditate provident labore omnis. Vel dolor nemo dolores blanditiis.', NULL, 54, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(89, 'Ut magni tenetur natus. Ratione unde nam possimus ut. Sunt animi fugit in occaecati.', NULL, 55, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(90, 'Iste harum commodi quia tempore. Asperiores quasi eaque tempora.', NULL, 55, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(91, 'Hic fuga optio aut labore excepturi inventore eos impedit. Sapiente iure accusantium quia autem et.', NULL, 55, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(92, 'Eveniet eos veritatis non facilis omnis enim. Qui ab ut quia quis. Unde ut quis sint.', NULL, 55, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(93, 'Reiciendis eaque consequatur harum sunt. Ut doloremque unde cumque non.', NULL, 55, '2018-10-05 10:02:40', '2018-10-05 10:02:40'),
(94, NULL, 'addison-smith-2y/timeline/DKu7nTX4A1yKoGIG6uGv6r5FpHvEZDTKCKNQQUE9.jpeg', 1, '2018-10-05 14:48:08', '2018-10-05 14:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `gender`, `profile`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Addison Smith', 'addison-smith-2y', 'sogungbure@gmail.com', 'female', 'addison-smith-2y/upload/7gBgOj7zdXNQtFVljbIl1Y3WD0u17CqVH2oiNMZX.jpeg', NULL, '$2y$10$LZ4Co7Pv.2M.1EN1fAuNFO/VTI5Pu8soFwi/zCNctYykbsX93C0de', 'xV8sMrK6knROYMoYhv1QOC2MXJTNiCsVeJciR0L9oZqqomtMKLEWfl8jdm3t', '2018-09-11 10:18:25', '2018-10-05 14:57:43'),
(4, 'Mckenna Thompson', 'mckenna-thompson-ro', 'jalen39@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '9oYE5Rzof6', '2018-09-11 14:37:48', '2018-09-11 14:37:48'),
(5, 'Lilyan Tromp', 'lilyan-tromp-mv', 'johnston.retta@example.net', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'EK9neASc19', '2018-09-11 14:37:48', '2018-09-11 14:37:48'),
(6, 'Myrtice Schultz', 'myrtice-schultz-kv', 'alison@gmail.com', 'male', 'myrtice-schultz-kv/upload/nMaOMnnKNDCHlKkAYi0v24ckIaPZDXnkI508tpVS.jpeg', NULL, '$2y$10$Ot41nvmQ0DquQsiA5yml.ORAvXuBvXXwW7b7mquH0kxX3aPLLyI2K', 'UAZO9MeTTtbgH5prMCRDX33hZL3G8QyPVt0BCnoOKtyEXyDy4GmFoHihmCTL', '2018-09-11 14:38:50', '2018-10-05 08:32:40'),
(7, 'Dr. Ernest Wintheiser IV', 'dr-ernest-wintheiser-iv-0m', 'lowe@gmail.com', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '46dXcyW5gwQMGJZAr4dhZ333Bau5kYlEtntfo7vaCzKPZHzlqzSWA8FXdFCD', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(8, 'Melisa Maggio', 'melisa-maggio-xn', 'vrutherford@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'TfJWtQosyE', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(9, 'Ari Gaylord', 'ari-gaylord-x6', 'lisandro.reichel@example.net', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vmfQVTV2XV', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(10, 'Sedrick Farrell', 'sedrick-farrell-7n', 'corene82@example.com', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ZUD4wyVQP4', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(11, 'Boris Carroll', 'boris-carroll-a1', 'dicki.kris@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'hUsbEv176x', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(12, 'Levi Oberbrunner II', 'levi-oberbrunner-ii-oo', 'mikayla.jacobi@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'aU3WMZKh4Z', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(13, 'Laurel Will', 'laurel-will-sa', 'zsporer@example.org', 'confused', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ESte3eHPhF', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(14, 'Joy Terry V', 'joy-terry-v-2l', 'vella.kreiger@example.com', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'aQNN7AGuy4', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(15, 'Evelyn Macejkovic', 'evelyn-macejkovic-8v', 'botsford.cole@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '1USfYwRLJt', '2018-09-11 14:38:50', '2018-09-11 14:38:50'),
(16, 'Christelle Roob', 'christelle-roob-x8', 'bud.schroeder@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'jmbbc1Opih', '2018-10-05 09:47:51', '2018-10-05 09:47:51'),
(17, 'Dayna McCullough', 'dayna-mccullough-au', 'ari.runolfsson@example.net', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'bLtbqeRUwH', '2018-10-05 09:47:58', '2018-10-05 09:47:58'),
(18, 'Miss Kristin Lakin V', 'miss-kristin-lakin-v-l0', 'kquitzon@example.com', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '5ZiDFSXOrk', '2018-10-05 09:47:58', '2018-10-05 09:47:58'),
(19, 'Tad Klein', 'tad-klein-fm', 'gislason.michale@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'L0oa4BE03C', '2018-10-05 09:47:59', '2018-10-05 09:47:59'),
(20, 'Kassandra Lemke', 'kassandra-lemke-1j', 'lucinda.bernier@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '6tbqyRkOdi', '2018-10-05 09:47:59', '2018-10-05 09:47:59'),
(21, 'Kameron Turner DDS', 'kameron-turner-dds-1q', 'evert95@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'HzyXfLvASV', '2018-10-05 09:47:59', '2018-10-05 09:47:59'),
(22, 'Ernestina Rohan', 'ernestina-rohan-wu', 'bergnaum.macey@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'l1Et0T17Ri', '2018-10-05 09:48:00', '2018-10-05 09:48:00'),
(23, 'Prof. Luciano Miller III', 'prof-luciano-miller-iii-3w', 'nfeest@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3Wbq1Zu9yM', '2018-10-05 09:48:00', '2018-10-05 09:48:00'),
(24, 'Kitty Heidenreich', 'kitty-heidenreich-sn', 'hessel.adrienne@example.com', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'mBoVBtAL7J', '2018-10-05 09:48:01', '2018-10-05 09:48:01'),
(25, 'Taryn Zulauf', 'taryn-zulauf-tx', 'khilpert@example.net', 'bisexual', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'aLhQQsfYU2', '2018-10-05 09:48:01', '2018-10-05 09:48:01'),
(26, 'Prof. Santino Smitham DDS', 'prof-santino-smitham-dds-td', 'tbotsford@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '4DomR3lgsk', '2018-10-05 09:56:45', '2018-10-05 09:56:45'),
(27, 'Ebony Zemlak', 'ebony-zemlak-il', 'malvina.buckridge@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '6QZo6THZIE', '2018-10-05 09:56:49', '2018-10-05 09:56:49'),
(28, 'Jamal Connelly DVM', 'jamal-connelly-dvm-3h', 'kuphal.aletha@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'CgBXd59Gfi', '2018-10-05 09:56:49', '2018-10-05 09:56:49'),
(29, 'Giovani Reinger', 'giovani-reinger-dm', 'stehr.roberta@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'gVtxzrA6kL', '2018-10-05 09:56:50', '2018-10-05 09:56:50'),
(30, 'Vivienne Will III', 'vivienne-will-iii-y5', 'ariel30@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'IyiMgBiRzO', '2018-10-05 09:56:50', '2018-10-05 09:56:50'),
(31, 'Virgil Harris', 'virgil-harris-vm', 'jackson.lockman@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ZXNgZKBsBr', '2018-10-05 09:56:51', '2018-10-05 09:56:51'),
(32, 'Clifton Hauck III', 'clifton-hauck-iii-vv', 'amina11@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Q1ssTdoGFT', '2018-10-05 09:56:51', '2018-10-05 09:56:51'),
(33, 'Jaylin Grant', 'jaylin-grant-52', 'pdonnelly@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'opjeKTlMBj', '2018-10-05 09:56:51', '2018-10-05 09:56:51'),
(34, 'Ms. Kali Ankunding', 'ms-kali-ankunding-zd', 'gaylord.angel@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'JFaguWCf9p', '2018-10-05 09:56:52', '2018-10-05 09:56:52'),
(35, 'Mrs. Eulah Tromp', 'mrs-eulah-tromp-eo', 'ykris@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'I368k6S3VJ', '2018-10-05 09:56:52', '2018-10-05 09:56:52'),
(36, 'Dr. Johathan Graham II', 'dr-johathan-graham-ii-zx', 'walker.sarah@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xFLFueZ6Bi', '2018-10-05 10:01:40', '2018-10-05 10:01:40'),
(37, 'Rozella Padberg', 'rozella-padberg-2k', 'clementine.okon@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'cvomLro7O1', '2018-10-05 10:01:43', '2018-10-05 10:01:43'),
(38, 'Stefan Sawayn', 'stefan-sawayn-7q', 'jerald10@example.com', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'o0H22KvBm3', '2018-10-05 10:01:43', '2018-10-05 10:01:43'),
(39, 'Dr. Freida Rutherford', 'dr-freida-rutherford-wz', 'glakin@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'O0FIrlloKu', '2018-10-05 10:01:43', '2018-10-05 10:01:43'),
(40, 'Haylee Ledner', 'haylee-ledner-pz', 'juliet52@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vIYm5oKvj9', '2018-10-05 10:01:44', '2018-10-05 10:01:44'),
(41, 'Ocie Abshire', 'ocie-abshire-fr', 'nherzog@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Fde7j08r0q', '2018-10-05 10:01:44', '2018-10-05 10:01:44'),
(42, 'Clotilde Bernier IV', 'clotilde-bernier-iv-9c', 'alejandra65@example.com', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'abqUKx4NEu', '2018-10-05 10:01:44', '2018-10-05 10:01:44'),
(43, 'Lonny Jakubowski', 'lonny-jakubowski-v2', 'lesly.kertzmann@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'kZrZOAdAzJ', '2018-10-05 10:01:45', '2018-10-05 10:01:45'),
(44, 'Miss Allene Hickle', 'miss-allene-hickle-lf', 'vicenta24@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'bxcjj1EONW', '2018-10-05 10:01:45', '2018-10-05 10:01:45'),
(45, 'Kayden Jenkins', 'kayden-jenkins-ky', 'june.oconner@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'OH6aLWSlYb', '2018-10-05 10:01:45', '2018-10-05 10:01:45'),
(46, 'Cali Pouros PhD', 'cali-pouros-phd-bp', 'auer.oswaldo@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0P86j5sQ9b', '2018-10-05 10:02:31', '2018-10-05 10:02:31'),
(47, 'Jocelyn Huels', 'jocelyn-huels-nz', 'adrianna.hegmann@example.net', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8x0DVMtECj', '2018-10-05 10:02:35', '2018-10-05 10:02:35'),
(48, 'Joel Schroeder', 'joel-schroeder-ph', 'mac52@example.net', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xaPjGlGC74', '2018-10-05 10:02:35', '2018-10-05 10:02:35'),
(49, 'Florence Kuvalis', 'florence-kuvalis-wr', 'zachariah09@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'WEVYxGV8Ln', '2018-10-05 10:02:35', '2018-10-05 10:02:35'),
(50, 'Mariela Leannon', 'mariela-leannon-zr', 'glen24@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'zbiqOZ1aHu', '2018-10-05 10:02:36', '2018-10-05 10:02:36'),
(51, 'Jessika Ryan', 'jessika-ryan-qm', 'mueller.pietro@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'mnkJ0qz2eP', '2018-10-05 10:02:36', '2018-10-05 10:02:36'),
(52, 'Fae Mann', 'fae-mann-dk', 'lowe.deborah@example.com', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'KvbJLqPpvT', '2018-10-05 10:02:36', '2018-10-05 10:02:36'),
(53, 'Olen Schamberger II', 'olen-schamberger-ii-5h', 'lesch.christophe@example.com', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3W7Ak9GOtE', '2018-10-05 10:02:37', '2018-10-05 10:02:37'),
(54, 'Retta Fisher', 'retta-fisher-de', 'franecki.rodrigo@example.org', 'male', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '5GYbKcobaP', '2018-10-05 10:02:37', '2018-10-05 10:02:37'),
(55, 'Melvin Prosacco', 'melvin-prosacco-ck', 'crawford50@example.org', 'female', NULL, NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '9IAzC6jNG4', '2018-10-05 10:02:38', '2018-10-05 10:02:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentable`
--
ALTER TABLE `commentable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentable_user_id_foreign` (`user_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friends_user_id_foreign` (`user_id`),
  ADD KEY `friends_friend_id_foreign` (`friend_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `likeable`
--
ALTER TABLE `likeable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likeable_user_id_foreign` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_foreign` (`sender`),
  ADD KEY `messages_recepient_foreign` (`recepient`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentable`
--
ALTER TABLE `commentable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likeable`
--
ALTER TABLE `likeable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentable`
--
ALTER TABLE `commentable`
  ADD CONSTRAINT `commentable_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likeable`
--
ALTER TABLE `likeable`
  ADD CONSTRAINT `likeable_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_recepient_foreign` FOREIGN KEY (`recepient`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
