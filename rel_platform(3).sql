-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 04:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rel_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(300) NOT NULL DEFAULT '',
  `image` varchar(300) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admininvitations`
--

CREATE TABLE `admininvitations` (
  `id` int(11) NOT NULL,
  `code` varchar(300) NOT NULL DEFAULT '0',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `name`, `link`, `icon`, `created_at`, `updated_at`, `status`) VALUES
(3, 'Manage Libraries', 'library', 'book', '0000-00-00 00:00:00', NULL, '1'),
(4, 'Slider', 'slider', 'image', NULL, NULL, '1'),
(5, 'Manage Menu', 'menu', 'menu', NULL, NULL, '1'),
(7, 'Email Template', 'email-template', 'email', NULL, NULL, '1'),
(8, 'Settings', '#', 'settings', '0000-00-00 00:00:00', NULL, '1'),
(9, 'Languages', '#', 'language', NULL, NULL, '1'),
(10, 'Users', '#', 'account_circle', NULL, NULL, '1'),
(11, 'Videos', '#', 'video_library', NULL, NULL, '1'),
(12, 'Movies', '#', 'video_library', NULL, NULL, '1'),
(13, 'Articles', '#', 'library_books', NULL, NULL, '1'),
(14, 'Manage Channels', 'manage-channels', 'hub', NULL, NULL, '1'),
(15, 'Manage Categories', 'manage-categories', 'view_list', NULL, NULL, '1'),
(16, 'Manage Decisions', 'manage-decisions', 'touch_app', NULL, NULL, '1'),
(17, 'Earnings', 'earnings', 'credit_card', NULL, NULL, '1'),
(18, 'Manage Comments', 'manage-comments', 'comment', NULL, NULL, '1'),
(19, 'Manage Bank Receipts', 'bank-receipts', 'credit_card', NULL, NULL, '1'),
(20, 'Advertisement', '#', 'attach_money', NULL, NULL, '1'),
(21, 'Pro System', '#', 'star', NULL, NULL, '1'),
(22, 'Design', '#', 'color_lens', NULL, NULL, '1'),
(23, 'Tools', '#', 'build', NULL, NULL, '1'),
(24, 'Reports', '#', 'flag', NULL, NULL, '1'),
(25, 'Pages', '#', 'description', NULL, NULL, '1'),
(26, 'Sitemap', '#', 'power_input', NULL, NULL, '1'),
(27, 'Mobile & API Settings', '#', 'compare_arrows', NULL, NULL, '1'),
(28, 'Backup', 'backup', 'backup', NULL, NULL, '1'),
(29, 'Changelogs', 'changelog', 'update', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `admin_submenu`
--

CREATE TABLE `admin_submenu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `menu_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_submenu`
--

INSERT INTO `admin_submenu` (`id`, `name`, `link`, `status`, `menu_id`, `created_at`, `updated_at`) VALUES
(7, 'General Settings', 'general-settings', 1, 8, '0000-00-00 00:00:00', NULL),
(8, 'Site Settings', 'site-settings', 1, 8, '0000-00-00 00:00:00', NULL),
(9, 'FFMPEG Settings', 'ffmpeg', 1, 8, '0000-00-00 00:00:00', NULL),
(10, 'Video Settings', 'video_settings', 1, 8, '0000-00-00 00:00:00', NULL),
(11, 'E-mail Settings', 'email-settings', 1, 8, '0000-00-00 00:00:00', NULL),
(12, 'Social Login Settings', 'social-login', 1, 8, '0000-00-00 00:00:00', NULL),
(13, 'Amazon S3 & FTP Settings', 's3', 1, 8, '0000-00-00 00:00:00', NULL),
(14, 'Payment Settings', 'payment-settings', 1, 8, '0000-00-00 00:00:00', NULL),
(15, 'Manage Currencies', 'manage-currencies', 1, 8, '0000-00-00 00:00:00', NULL),
(16, 'Live Stream Settings', 'live', 1, 8, '0000-00-00 00:00:00', NULL),
(17, 'Add New Language & Keys', 'add-language', 1, 9, '0000-00-00 00:00:00', NULL),
(18, 'Manage Languages', 'manage-languages', 1, 9, '0000-00-00 00:00:00', NULL),
(19, 'Manage Users', 'manage-users', 1, 10, '0000-00-00 00:00:00', NULL),
(20, 'Manage Groups', 'manage-groups', 1, 10, '0000-00-00 00:00:00', NULL),
(21, 'Manage Custom Profile Fields', 'manage-profile-fields', 1, 10, '0000-00-00 00:00:00', NULL),
(22, 'Manage Verification Requests', 'verification-requests', 1, 10, '0000-00-00 00:00:00', NULL),
(23, 'Manage Monetization Requests', 'monetization-requests', 1, 10, '0000-00-00 00:00:00', NULL),
(24, 'Manage Videos', 'manage-videos', 1, 11, '0000-00-00 00:00:00', NULL),
(25, 'Import From YouTube', 'import-from-youtube', 1, 11, '0000-00-00 00:00:00', NULL),
(26, 'Import From Dailymotion', 'import-from-dailymotion', 1, 11, '0000-00-00 00:00:00', NULL),
(27, 'Import From Twitch', 'import-from-twitch', 1, 11, '0000-00-00 00:00:00', NULL),
(28, 'Manage movies category', 'manage-movies-category', 1, 12, '0000-00-00 00:00:00', NULL),
(29, 'Manage movies', 'manage-movies', 1, 12, '0000-00-00 00:00:00', NULL),
(30, 'Add New Article', 'create-article', 1, 13, '0000-00-00 00:00:00', NULL),
(31, 'Manage Articles', 'manage-articles', 1, 13, '0000-00-00 00:00:00', NULL),
(32, 'Manage Ads', 'manage-video-ads', 1, 20, '0000-00-00 00:00:00', NULL),
(33, 'Manage Website Ads', 'manage-website-ads', 1, 20, '0000-00-00 00:00:00', NULL),
(34, 'Manage User Ads', 'manage-user-ads', 1, 20, '0000-00-00 00:00:00', NULL),
(35, 'Payment Requests', 'payment-requests', 1, 20, '0000-00-00 00:00:00', NULL),
(36, 'Pro System Settings', 'prosys-settings', 1, 21, '0000-00-00 00:00:00', NULL),
(37, 'Recent Payments', 'manage-payments', 1, 21, '0000-00-00 00:00:00', NULL),
(38, 'Themes', 'manage-themes', 1, 22, '0000-00-00 00:00:00', NULL),
(39, 'Change Design', 'change-site-desgin', 1, 22, '0000-00-00 00:00:00', NULL),
(40, 'Custom Design', 'custom-design', 1, 22, '0000-00-00 00:00:00', NULL),
(41, 'Manage Announcements', 'manage-announcements', 1, 23, '0000-00-00 00:00:00', NULL),
(42, 'Ban Users', 'ban-users', 1, 23, '0000-00-00 00:00:00', NULL),
(43, 'Manage Activities', 'manage-activities', 1, 23, '0000-00-00 00:00:00', NULL),
(44, 'Mass Notifications', 'mass-notifications', 1, 23, '0000-00-00 00:00:00', NULL),
(45, 'Manage Invitation Keys', 'manage-invitation-keys', 1, 23, '0000-00-00 00:00:00', NULL),
(46, 'Auto Subscribe', 'auto_subscribe', 1, 23, '0000-00-00 00:00:00', NULL),
(47, 'Auto Delete Videos', 'auto-delete', 1, 23, '0000-00-00 00:00:00', NULL),
(48, 'Newsletter', 'newsletters', 1, 23, '0000-00-00 00:00:00', NULL),
(49, 'Manage video reports', 'manage-video-reports', 1, 24, '0000-00-00 00:00:00', NULL),
(50, 'Manage Copyright Reports', 'copy_report', 1, 24, '0000-00-00 00:00:00', NULL),
(51, 'Manage Custom Pages', 'manage-custom-pages', 1, 25, '0000-00-00 00:00:00', NULL),
(52, 'Manage Pages', 'manage-pages', 1, 25, '0000-00-00 00:00:00', NULL),
(53, 'Create Sitemap', 'create-new-sitemap', 1, 26, '0000-00-00 00:00:00', NULL),
(54, 'Manage API Access Keys', 'api-settings', 1, 27, '0000-00-00 00:00:00', NULL),
(55, 'Push Notifications System', 'push-notifications-system', 1, 27, '0000-00-00 00:00:00', NULL),
(57, 'Video Not work', 'video-stop', 1, 11, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ads_transactions`
--

CREATE TABLE `ads_transactions` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL DEFAULT 0,
  `video_owner` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `time` int(32) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_views`
--

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `announcement_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `background`
--

CREATE TABLE `background` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_receipts`
--

CREATE TABLE `bank_receipts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `description` tinytext NOT NULL,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `mode` varchar(50) NOT NULL DEFAULT '',
  `approved` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `receipt_file` varchar(250) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_at` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banned`
--

CREATE TABLE `banned` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(100) DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blocked_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ref_video` int(11) NOT NULL DEFAULT 0,
  `title` varchar(300) NOT NULL DEFAULT '',
  `url` text DEFAULT NULL,
  `duration` varchar(33) NOT NULL DEFAULT '00:00',
  `color` varchar(100) NOT NULL DEFAULT '',
  `background_color` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT '',
  `part` varchar(100) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent_id`) VALUES
(9, 'CHALLENGES', 0),
(10, 'MATCH PREPARATION	V3', 0),
(11, 'ILLEGAL USE OF THE ARM', 0),
(12, 'CWLC21 | CHALLENGES', 0),
(13, 'CWLC | ILLEGAL USE OF THE ARM', 0),
(14, 'CWLC | HOLDING', 0),
(15, 'CWLC | HANDBALL', 0),
(16, 'CWLC | TACTICAL FOULS', 0),
(17, 'CWLC | OFFSIDE', 0),
(18, 'CWLC | PENALTY AREA INCIDENT', 0),
(19, 'CWLC | POSITIONING AND READING', 0),
(20, 'CWLC | GAME MANAGEMENT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `description` varchar(100) NOT NULL DEFAULT '',
  `cover` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `library_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel_category`
--

CREATE TABLE `channel_category` (
  `category_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channel_category`
--

INSERT INTO `channel_category` (`category_id`, `channel_id`) VALUES
(9, 7),
(10, 7),
(9, 8),
(10, 8),
(9, 3),
(11, 3),
(10, 4),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `activity_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `pinned` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT 0,
  `dis_likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `reply_id` int(30) NOT NULL DEFAULT 0,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `post_id` int(15) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comm_replies`
--

CREATE TABLE `comm_replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(15) NOT NULL DEFAULT 0,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `post_id` int(15) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `time` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(20000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'theme', 'vidplay'),
(2, 'censored_words', ''),
(3, 'title', 'Refereeing Education and Learning'),
(4, 'name', 'Refereeing Education and Learning'),
(5, 'keyword', 'Refereeing Education and Learning'),
(6, 'email', 'creative_15@live.com'),
(7, 'description', 'Refereeing Education and Learning'),
(8, 'validation', 'off'),
(9, 'recaptcha', 'off'),
(10, 'recaptcha_key', ''),
(11, 'language', 'english'),
(12, 'google_app_ID', ''),
(13, 'google_app_key', ''),
(14, 'facebook_app_ID', ''),
(15, 'facebook_app_key', ''),
(16, 'twitter_app_ID', ''),
(17, 'twitter_app_key', ''),
(18, 'yt_api', 'AIzaSyBTwxpmr5EraHyEolTDPiSx7axFS-0CE5s'),
(19, 'seo_link', 'on'),
(20, 'comment_system', 'default'),
(21, 'smtp_or_mail', 'mail'),
(22, 'smtp_host', 'smtp.refereeing.online'),
(23, 'smtp_username', 'test@refereeing.online'),
(24, 'smtp_password', 'q1w2e3r4Q!W@E#R$'),
(25, 'smtp_encryption', 'tls'),
(26, 'smtp_port', '465'),
(27, 'delete_account', 'on'),
(28, 'total_videos', '2'),
(29, 'total_views', '1'),
(30, 'total_users', '9'),
(31, 'total_subs', '1'),
(32, 'total_comments', '1'),
(33, 'total_likes', '1'),
(34, 'total_dislikes', '1'),
(35, 'total_saved', '0'),
(36, 'last_admin_collection', '1681615879'),
(37, 'user_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_users&quot;:0}]'),
(38, 'videos_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:2},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]'),
(39, 'upload_system', 'on'),
(40, 'import_system', 'on'),
(41, 'resize_video', 'on'),
(42, 'autoplay_system', 'on'),
(43, 'embed_system', 'on'),
(44, 'history_system', 'off'),
(45, 'user_registration', 'on'),
(46, 'verification_badge', 'on'),
(47, 'comments_default_num', '40'),
(48, 'vimeo_api_key', ''),
(49, 'fb_login', 'off'),
(50, 'tw_login', 'off'),
(51, 'plus_login', 'off'),
(52, 'wowonder_app_ID', ''),
(53, 'wowonder_app_key', ''),
(54, 'wowonder_domain_uri', ''),
(55, 'wowonder_site_name', ''),
(56, 'wowonder_login', 'off'),
(57, 'wowonder_img', ''),
(58, 'google', ''),
(59, 'last_created_sitemap', '12-06-2018'),
(60, 'is_ok', '1'),
(61, 'pro_pkg_price', '10'),
(62, 'payment_currency', 'USD'),
(63, 'go_pro', 'off'),
(64, 'paypal_id', ''),
(65, 'paypal_secret', ''),
(66, 'paypal_mode', 'sandbox'),
(67, 'last_backup', '00-00-0000'),
(68, 'user_ads', 'off'),
(69, 'rss_export', 'on'),
(70, 'max_upload', '10000000000'),
(71, 's3_upload', 'off'),
(72, 's3_bucket_name', ''),
(73, 'amazone_s3_key', ''),
(74, 'amazone_s3_s_key', ''),
(75, 'region', 'us-east-1'),
(76, 'ad_v_price', '0.1'),
(77, 'ad_c_price', '0.5'),
(78, 'pub_price', '0.02'),
(79, 'usr_v_mon', 'off'),
(80, 'apps_api_id', 'ae9eee2be7ce8867515f1af8550d8286'),
(81, 'apps_api_key', '9a37b8b68372c1faf1b1d885eaba7b4e'),
(82, 'ffmpeg_system', 'on'),
(83, 'ffmpeg_binary_file', 'C:\\FFmpeg\\bin\\ffmpeg.exe'),
(84, 'user_max_upload', '1000000000'),
(85, 'user_max_import', '100'),
(86, 'convert_speed', 'superfast'),
(87, 'night_mode', 'light'),
(88, 'server', 'ajax'),
(89, 'article_system', 'off'),
(90, 'ftp_host', ''),
(91, 'ftp_port', ''),
(92, 'ftp_username', ''),
(93, 'ftp_password', ''),
(94, 'ftp_upload', 'off'),
(95, 'ftp_endpoint', ''),
(96, 'ftp_path', './'),
(97, 'watermark', ''),
(98, 'ftp_host', 'localhost'),
(99, 'ftp_port', '21'),
(100, 'ftp_username', ''),
(101, 'ftp_password', ''),
(102, 'ftp_upload', 'off'),
(103, 'ftp_endpoint', 'storage.wowonder.com'),
(104, 'ftp_path', './'),
(105, 'watermark', ''),
(106, 'download_videos', 'off'),
(107, 'facebook_import', 'off'),
(108, 'donate_system', 'off'),
(109, 'approve_videos', 'off'),
(110, 'videos_upload_limit', '0'),
(111, 'sell_videos_system', 'off'),
(112, 'admin_com_sell_videos', '1'),
(113, 'who_sell', 'users'),
(114, 'auto_approve_', 'yes'),
(115, 'com_type', '0'),
(116, 'upload_system_type', '0'),
(117, 'max_upload_all_users', '1000000000'),
(118, 'max_upload_free_users', '1000000000'),
(119, 'max_upload_pro_users', '1000000000'),
(120, 'player_type', 'default'),
(121, 'two_factor_setting', 'on'),
(122, 'queue_count', '0'),
(123, 'popular_channels', 'off'),
(124, 'twitch_api', 'twb88q5mhne1gsrwvkhtlugvrqniks'),
(125, 'twitch_import', 'on'),
(126, 'geo_blocking', 'on'),
(127, 'server_key', '1312a113c58715637a94437389326a49'),
(128, 'earn_from_ads', 'on'),
(129, 'push', '1'),
(130, 'push_id', ''),
(131, 'push_key', ''),
(132, 'recurring_payment', 'off'),
(133, 'videos_load_limit', '20'),
(134, 'demo_video', 'on'),
(135, 'all_create_articles', 'off'),
(136, 'movies_videos', 'off'),
(137, 'dailymotion_id', ''),
(138, 'version', '2.0.2'),
(139, 'pop_up_18', 'off'),
(140, 'time_18', '1'),
(141, 'ok_import', 'off'),
(142, 'gif_system', 'off'),
(143, 'block_system', 'on'),
(144, 'spaces', 'on'),
(145, 'space_name', ''),
(146, 'spaces_key', ''),
(147, 'spaces_secret', ''),
(148, 'space_region', 'nyc3'),
(149, 'currency_symbol_array', 'a:10:{s:3:\"USD\";s:1:\"$\";s:3:\"EUR\";s:3:\"€\";s:3:\"JPY\";s:2:\"¥\";s:3:\"TRY\";s:3:\"₺\";s:3:\"GBP\";s:2:\"£\";s:3:\"RUB\";s:6:\"руб\";s:3:\"PLN\";s:3:\"zł\";s:3:\"ILS\";s:3:\"₪\";s:3:\"BRL\";s:2:\"R$\";s:3:\"INR\";s:3:\"₹\";}'),
(150, 'currency_array', 'a:10:{i:0;s:3:\"USD\";i:1;s:3:\"EUR\";i:2;s:3:\"JPY\";i:3;s:3:\"TRY\";i:4;s:3:\"GBP\";i:5;s:3:\"RUB\";i:6;s:3:\"PLN\";i:7;s:3:\"ILS\";i:8;s:3:\"BRL\";i:9;s:3:\"INR\";}'),
(151, 'paypal_currency', 'USD'),
(152, 'checkout_currency', 'USD'),
(153, 'checkout_payment', 'no'),
(154, 'checkout_mode', 'sandbox'),
(155, 'checkout_seller_id', ''),
(156, 'checkout_publishable_key', ''),
(157, 'checkout_private_key', ''),
(158, 'credit_card', 'no'),
(159, 'stripe_currency', 'USD'),
(160, 'stripe_secret', ''),
(161, 'stripe_id', ''),
(162, 'bank_payment', 'no'),
(163, 'bank_transfer_note', 'In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it.'),
(164, 'payed_subscribers', 'off'),
(165, 'admin_com_subscribers', '2'),
(166, 'bank_description', '<div class=\"bank_info\"><div class=\"dt_settings_header bg_gradient\"><div class=\"dt_settings_circle-1\"></div><div class=\"dt_settings_circle-2\"></div><div class=\"bank_info_innr\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path fill=\"currentColor\" d=\"M11.5,1L2,6V8H21V6M16,10V17H19V10M2,22H21V19H2M10,10V17H13V10M4,10V17H7V10H4Z\"></path></svg><h4 class=\"bank_name\">Garanti Bank</h4><div class=\"row\"><div class=\"col col-md-12\"><div class=\"bank_account\"><p>4796824372433055</p><span class=\"help-block\">Account number / IBAN</span></div></div><div class=\"col col-md-12\"><div class=\"bank_account_holder\"><p>Antoian Kordiyal</p><span class=\"help-block\">Account name</span></div></div><div class=\"col col-md-6\"><div class=\"bank_account_code\"><p>TGBATRISXXX</p><span class=\"help-block\">Routing code</span></div></div><div class=\"col col-md-6\"><div class=\"bank_account_country\"><p>United States</p><span class=\"help-block\">Country</span></div></div></div></div></div></div>'),
(167, 'version', '2.0.2'),
(168, 'lang_modal', 'off'),
(169, 'report_copyright', 'off'),
(170, 'user_mon_approve', 'off'),
(171, 'version', '2.0.2'),
(172, 'require_login', 'off'),
(173, 'who_upload', 'all'),
(174, 'rent_videos_system', 'off'),
(175, 'admin_com_rent_videos', '0'),
(176, 'playlist_subscribe', 'on'),
(177, 'require_subcription', 'off'),
(178, 'auto_subscribe', ''),
(179, 'post_system', 'on'),
(180, 'live_video', '0'),
(181, 'live_video_save', '0'),
(182, 'agora_live_video', '0'),
(183, 'agora_app_id', ''),
(184, 'agora_customer_id', ''),
(185, 'agora_customer_certificate', ''),
(186, 'amazone_s3_2', '0'),
(187, 'bucket_name_2', ''),
(188, 'amazone_s3_key_2', ''),
(189, 'amazone_s3_s_key_2', ''),
(190, 'region_2', 'eu-west-1'),
(191, 'who_use_live', 'all'),
(192, 'paystack_payment', 'no'),
(193, 'paystack_secret_key', ''),
(194, 'cashfree_payment', 'no'),
(195, 'cashfree_mode', 'sandBox'),
(196, 'cashfree_client_key', ''),
(197, 'cashfree_secret_key', ''),
(198, 'razorpay_payment', 'no'),
(199, 'razorpay_key_id', ''),
(200, 'razorpay_key_secret', ''),
(201, 'paysera_payment', 'no'),
(202, 'paysera_mode', '1'),
(203, 'paysera_project_id', ''),
(204, 'paysera_sign_password', ''),
(205, 'iyzipay_payment', 'no'),
(206, 'iyzipay_mode', '1'),
(207, 'iyzipay_key', ''),
(208, 'iyzipay_secret_key', ''),
(209, 'iyzipay_buyer_id', ''),
(210, 'iyzipay_buyer_name', ''),
(211, 'iyzipay_buyer_surname', ''),
(212, 'iyzipay_buyer_gsm_number', ''),
(213, 'iyzipay_buyer_email', ''),
(214, 'iyzipay_identity_number', ''),
(215, 'iyzipay_city', ''),
(216, 'iyzipay_address', ''),
(217, 'iyzipay_country', ''),
(218, 'iyzipay_zip', ''),
(219, 'fav_category', ''),
(220, 'show_articles', 'off'),
(221, 'sticky_video', 'off'),
(222, 'point_level_system', '0'),
(223, 'point_allow_withdrawal', '0'),
(224, 'dollar_to_point_cost', '100'),
(225, 'likes_point', '5'),
(226, 'dislikes_point', '2'),
(227, 'watching_point', '2'),
(228, 'free_day_limit', '1000'),
(229, 'pro_day_limit', '2000'),
(230, 'upload_point', '20'),
(231, 'stock_videos', 'off'),
(232, 'comments_point', '10'),
(233, 'trailer_system', 'off'),
(234, 'restrict_embedding_system', 'off'),
(235, 'pro_google', 'on'),
(236, 'payu_payment', 'no'),
(237, 'payu_mode', '1'),
(238, 'payu_merchant_id', ''),
(239, 'payu_secret_key', ''),
(240, 'payu_buyer_name', ''),
(241, 'payu_buyer_surname', ''),
(242, 'payu_buyer_gsm_number', ''),
(243, 'payu_buyer_email', ''),
(244, 'video_text_system', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copyright_report`
--

CREATE TABLE `copyright_report` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(300) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(50) NOT NULL DEFAULT '',
  `page_title` varchar(200) NOT NULL DEFAULT '',
  `page_content` text DEFAULT NULL,
  `page_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `decisions`
--

CREATE TABLE `decisions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `technical` varchar(250) NOT NULL,
  `disciplinary` varchar(250) NOT NULL,
  `var_technical` varchar(250) DEFAULT NULL,
  `var_disciplinary` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `decisions_information`
--

CREATE TABLE `decisions_information` (
  `id` int(11) NOT NULL,
  `decision_id` int(11) DEFAULT NULL,
  `technical` varchar(50) DEFAULT NULL,
  `disciplinary` varchar(50) DEFAULT NULL,
  `var_technical` varchar(250) DEFAULT NULL,
  `var_disciplinary` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `content`, `tags`, `type`) VALUES
(1, '<p>Welcome #fullname to CAF REL</p>\n\n<p>Your account has been registered. Click <a href=\"#loginlink\">here</a>&nbsp;to login. The login credentials are given below.</p>\n\n<p>username: #email</p>\n\n<p>password: #password</p>\n\n<p>Regards</p>\n', 'fullname,email,password,loginlink', 'register');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Pending = 1,\r\nApprove = 2,\r\nRejected = 3',
  `time` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `follower_id`, `status`, `time`, `active`) VALUES
(17, 2, 1, 1, 1619426951, 1),
(18, 1, 8, 2, 1620153742, 1),
(19, 1, 9, 2, 1620154451, 1),
(20, 1, 4, 2, 1626297873, 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `user_id`, `video_id`, `time`) VALUES
(32, 1, 23, 1626175734);

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `english` text DEFAULT NULL,
  `arabic` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dutch` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `french` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `german` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `spanish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `spanish`) VALUES
(1, 'login', '', 'Login', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Anmeldung', 'Iniciar sesión'),
(2, 'search_keyword', '', 'Search for videos', 'البحث عن مقاطع الفيديو', 'Zoek naar video\'s', 'Rechercher des vidéos', 'Suche nach Videos', 'Buscar videos'),
(3, 'register', '', 'Register', 'تسجيل', 'Registreren', 'registre', 'Neu registrieren', 'Registro'),
(4, 'invalid_request', '', 'Invalid request', 'طلب غير صالح', 'Ongeldig verzoek', 'Requête invalide', 'Ungültige Anfrage', 'Solicitud no válida'),
(5, 'please_check_details', '', 'Please check the details', 'يرجى التحقق من التفاصيل', 'Controleer de details', 'Vérifiez les détails', 'Bitte überprüfen Sie die Details', 'Por favor verifique los detalles'),
(6, 'email_sent', '', 'E-mail sent successfully', 'تم إرسال البريد الإلكتروني بنجاح', 'E-mail is succesvol verzonden', 'E-mail envoyé avec succès', 'Email wurde erfolgreich Versendet', 'E-mail enviado correctamente'),
(7, 'email_not_exist', '', 'E-mail not exist', 'البريد الإلكتروني غير موجود', 'E-mail bestaat niet', 'E-mail n\'existe pas', 'E-Mail existiert nicht', 'E-mail no existe'),
(8, 'reset_password', '', 'Reset Password', 'إعادة تعيين كلمة المرور', 'Wachtwoord opnieuw instellen', 'réinitialiser le mot de passe', 'Passwort zurücksetzen', 'Restablecer la contraseña'),
(9, 'account_is_not_active', '', 'Your account is not active yet, please confirm your E-mail.', 'حسابك غير نشط حتى الآن، يرجى تأكيد بريدك الإلكتروني.', 'Uw account is nog niet actief, bevestig alstublieft uw e-mail.', 'Votre compte n\'est pas encore actif, confirmez votre e-mail.', 'Ihr Konto ist noch nicht aktiv, bitte bestätigen Sie Ihre E-Mail.', 'Su cuenta aún no está activa, por favor confirme su E-mail.'),
(10, 'resend_email', '', 'Resend E-mail', 'إعادة إرسال البريد الإلكتروني', 'Email opnieuw verzenden', 'Ré-envoyer l\'email', 'E-Mail zurücksenden', 'Reenviar email'),
(11, 'invalid_username_or_password', '', 'Invalid username or password', 'خطأ في اسم المستخدم أو كلمة مرور', 'ongeldige gebruikersnaam of wachtwoord', 'Nom d\'utilisateur ou mot de passe invalide', 'ungültiger Benutzername oder Passwort', 'usuario o contraseña invalido'),
(12, 'gender', '', 'Gender', 'جنس', 'Geslacht', 'Le genre', 'Geschlecht', 'Género'),
(13, 'gender_is_invalid', '', 'Gender is invalid', 'الجنس غير صالح', 'Geslacht is ongeldig', 'Le sexe n\'est pas valable', 'Geschlecht ist ungültig', 'Género no válido'),
(14, 'country', '', 'Country', 'بلد', 'land', 'Pays', 'Land', 'País'),
(15, 'username_is_taken', '', 'Username is taken', 'اسم المستخدم ماخوذ', 'Gebruikersnaam is in gebruik', 'Le nom d\'utilisateur est pris', 'Benutzername ist vergeben', 'El nombre de usuario se ha tomado'),
(16, 'username_characters_length', '', 'Username must be between 5 / 32', 'يجب أن يكون اسم المستخدم بين 5/32', 'Gebruikersnaam moet tussen 5/32 zijn', 'Le nom d\'utilisateur doit être compris entre 5/32', 'Benutzername muss zwischen 5/32 liegen', 'El nombre de usuario debe estar entre 5/32'),
(17, 'username_invalid_characters', '', 'Invalid username characters', 'أحرف اسم المستخدم غير صالحة', 'Ongeldige gebruikersnaam karakters', 'Caractères d\'identifiant non valides', 'Ungültige Benutzernamen', 'Caracteres de usuario no válidos'),
(18, 'email_exists', '', 'This e-mail is already in use', 'هذا البريد استخدم من قبل', 'Deze email is al in gebruik', 'Cet e-mail est déjà utilisée', 'Diese E-Mail-Adresse wird schon verwendet', 'Este correo electrónico ya está en uso'),
(19, 'email_invalid_characters', '', 'E-mail is invalid', 'البريد الإلكتروني غير صالح', 'Email is ongeldig', 'Le courriel est invalide', 'E-Mail ist ungültig', 'El correo electrónico es invalido'),
(20, 'password_not_match', '', 'Password not match', 'كلمة المرور غير متطابقة', 'Wachtwoord niet overeenkomen', 'Le mot de passe ne correspond pas', 'Passwort nicht übereinstimmen', 'La contraseña no coincide'),
(21, 'password_is_short', '', 'Password is too short', 'كلمة المرور قصيرة جدا', 'Wachtwoord is te kort', 'Le mot de passe est trop court', 'Das Passwort ist zu kurz', 'La contraseña es demasiado corta'),
(22, 'reCaptcha_error', '', 'Please Check the re-captcha.', 'يرجى التحقق من إعادة كابتشا.', 'Controleer alstublieft de re-captcha.', 'Vérifiez le re-captcha.', 'Bitte überprüfen Sie das Re-Captcha.', 'Por favor, compruebe la re-captcha.'),
(23, 'successfully_joined_desc', '', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.', 'التسجيل بنجاح! لقد أرسلنا إليك رسالة إلكترونية، يرجى التحقق من البريد الوارد / الرسائل غير المرغوب فيها للتحقق من حسابك.', 'Registratie gelukt! Wij hebben u een email gestuurd, Controleer uw inbox / spam om uw account te verifiëren.', 'Inscription réussi! Nous vous avons envoyé un courriel, vérifiez votre boîte de réception / spam pour vérifier votre compte.', 'Registrierung erfolgreich! Wir haben Ihnen eine E-Mail geschickt, bitte überprüfen Sie Ihren Posteingang / Spam, um Ihr Konto zu bestätigen.', '¡Registro exitoso! Te hemos enviado un correo electrónico, verifica tu bandeja de entrada / spam para verificar tu cuenta.'),
(24, 'change_password', '', 'Change Password', 'تغيير كلمة السر', 'Verander wachtwoord', 'Changer le mot de passe', 'Passwort ändern', 'Cambia la contraseña'),
(25, '404_desc', '', 'The page you were looking for doesn\'t exist.', 'الصفحة التي كنت تبحث عنها غير موجودة.', 'De pagina die u zocht, bestaat niet.', 'La page que vous recherchiez n\'existe pas.', 'Die Seite, die Sie gesucht haben, existiert nicht.', 'La página que buscabas no existe.'),
(26, '404_title', '', '404, page not found', '404، لم يتم العثور على الصفحة', '404 pagina niet gevonden', '404 Page non trouvée', '404 Seite nicht gefunden', '404 Pagina no encontrada'),
(27, 'your_email_address', '', 'Your E-mail address', 'عنوان بريدك  الإلكتروني', 'Jouw e-mailadres', 'Votre adresse email', 'Deine Emailadresse', 'Tu correo electrónico'),
(28, 'request_new_password', '', 'Request new password', 'طلب كلمة مرور جديدة', 'Vraag nieuw wachtwoord aan', 'Demander un nouveau mot de passe', 'Fordere ein neues Passwort an', 'Pide nueva contraseña'),
(29, 'got_your_password', '', 'Got your password?', 'هل حصلت على كلمة المرور؟', 'Heb je je wachtwoord ontvangen?', 'Vous avez votre mot de passe?', 'Haben Sie Ihr Passwort?', '¿Tienes tu contraseña?'),
(30, 'login_', '', 'Log In', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Einloggen', 'Iniciar sesión'),
(31, 'please_wait', '', 'Please wait..', 'أرجو الإنتظار..', 'Even geduld aub..', 'S\'il vous plaît, attendez..', 'Warten Sie mal..', 'Por favor espera..'),
(32, 'welcome_back', '', 'Welcome back!', 'مرحبا بعودتك!', 'Welkom terug!', 'Nous saluons le retour!', 'Willkommen zurück!', '¡Dar una buena acogida!'),
(33, 'username', '', 'Username', 'اسم المستخدم', 'Gebruikersnaam', 'Nom d\'utilisateur', 'Benutzername', 'Nombre de usuario'),
(34, 'password', '', 'Password', 'كلمه السر', 'Wachtwoord', 'Mot de passe', 'Passwort', 'Contraseña'),
(35, 'forgot_your_password', '', 'Forgot your password?', 'نسيت رقمك السري؟', 'Je wachtwoord vergeten?', 'Mot de passe oublié?', 'Haben Sie Ihr Passwort vergessen?', '¿Olvidaste tu contraseña?'),
(36, 'sign_up', '', 'Sign Up!', 'سجل!', 'Aanmelden!', 'S\'inscrire!', 'Anmelden!', '¡Regístrate!'),
(37, 'new_here', '', 'New here?', 'جديد هنا؟', 'Nieuw hier?', 'Nouveau ici?', 'Neu hier?', '¿Nuevo aquí?'),
(38, 'lets_get_started', '', 'Let\'s get started!', 'هيا بنا نبدأ!', 'Laten we beginnen!', 'Commençons!', 'Lass uns anfangen!', '¡Empecemos!'),
(39, 'email_address', '', 'E-mail address', 'عنوان البريد الإلكتروني', 'E-mailadres', 'Adresse e-mail', 'E-Mail-Addresse', 'Dirección de correo electrónico'),
(40, 'confirm_password', '', 'Confirm Password', 'تأكيد كلمة المرور', 'bevestig wachtwoord', 'Confirmez le mot de passe', 'Bestätige das Passwort', 'Confirmar contraseña'),
(41, 'male', '', 'Male', 'الذكر', 'Mannetje', 'Mâle', 'Männlich', 'Masculino'),
(42, 'female', '', 'Female', 'إناثا', 'Vrouw', 'Femelle', 'Weiblich', 'Hembra'),
(43, 'already_have_account', '', 'Already have an account?', 'هل لديك حساب بالفعل؟', 'Heeft u al een account?', 'Vous avez déjà un compte?', 'Hast du schon ein Konto?', '¿Ya tienes una cuenta?'),
(44, 'home', '', 'Home', 'الصفحة الرئيسية', 'Huis', 'Accueil', 'Zuhause', 'Casa'),
(45, 'upload', '', 'Upload', 'تحميل', 'Uploaden', 'Télécharger', 'Hochladen', 'Subir'),
(46, 'terms_of_use', '', 'Terms of use', 'تعليمات الاستخدام', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation', 'Nutzungsbedingungen', 'Términos de Uso'),
(47, 'privacy_policy', '', 'Privacy Policy', 'سياسة الخصوصية', 'Privacybeleid', 'Politique de confidentialité', 'Datenschutz-Bestimmungen', 'Política de privacidad'),
(48, 'about_us', '', 'About us', 'معلومات عنا', 'Over ons', 'À propos de nous', 'Über uns', 'Sobre nosotros'),
(49, 'language', '', 'Language', 'لغة', 'Taal', 'La langue', 'Sprache', 'Idioma'),
(50, 'copyright', '', 'Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.', 'حقوق الطبع والنشر © {{DATE}} {{CONFIG name}}. كل الحقوق محفوظة.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle rechten voorbehouden.', 'Copyright © {{DATE}} {{CONFIG name}}. Tous les droits sont réservés.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle Rechte vorbehalten.', 'Copyright © {{DATE}} {{CONFIG name}}. Todos los derechos reservados.'),
(51, 'profile', '', 'Profile', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Perfil'),
(52, 'edit', '', 'Edit', 'تصحيح', 'Bewerk', 'modifier', 'Bearbeiten', 'Editar'),
(53, 'settings', '', 'Settings', 'إعدادات', 'instellingen', 'Paramètres', 'Einstellungen', 'Ajustes'),
(54, 'log_out', '', 'Log out', 'الخروج', 'Uitloggen', 'Connectez - Out', 'Ausloggen', 'Cerrar sesión'),
(55, 'featured_video', '', 'Featured video', 'فيديو متميز', 'Aanbevolen video', 'Vidéo en vedette', 'Empfohlenes Video', 'Vídeo destacado'),
(56, 'subscribe', '', 'Subscribe', 'الاشتراك', 'abonneren', 'Souscrire', 'Abonnieren', 'Suscribir'),
(57, 'views', '', 'Views', 'المشاهدات', 'Bekeken', 'Vues', 'Ansichten', 'vistas'),
(58, 'save', '', 'Save', 'حفظ', 'Save', 'sauvegarder', 'sparen', 'Salvar'),
(59, 'share', '', 'Share', 'شارك', 'Delen', 'Partager', 'Aktie', 'Compartir'),
(60, 'embed', '', 'Embed', 'تضمين', 'insluiten', 'Intégrer', 'Einbetten', 'Empotrar'),
(61, 'report', '', 'Report', 'أبلغ عن', 'Rapportere', 'rapport', 'Bericht', 'Informe'),
(62, 'published_on', '', 'Published on ', 'نشرت في', 'gepubliceerd op', 'Publié le', 'Veröffentlicht auf', 'Publicado en'),
(63, 'in', '', 'In', 'في', 'In', 'Dans', 'Im', 'En'),
(64, 'top_videos', '', 'Top videos', 'أهم مقاطع الفيديو', 'Top video\'s', 'Top videos', 'Top Videos', 'Los mejores videos'),
(65, 'trending', '', 'Trending', 'الشائع', 'Trending', 'Tendances', 'Trending', 'Tendencias'),
(66, 'explore_more', '', 'Explore more', 'استكشاف المزيد', 'Ontdek meer', 'Explorez plus', 'Erkunde mehr', 'Explora más'),
(67, 'year', '', 'year', 'عام', 'jaar', 'an', 'Jahr', 'año'),
(68, 'month', '', 'month', 'شهر', 'maand', 'mois', 'Monat', 'mes'),
(69, 'day', '', 'day', 'يوم', 'dag', 'journée', 'Tag', 'día'),
(70, 'hour', '', 'hour', 'ساعة', 'uur', 'heure', 'Stunde', 'hora'),
(71, 'minute', '', 'minute', 'اللحظة', 'minuut', 'minute', 'Minute', 'minuto'),
(72, 'second', '', 'second', 'ثانيا', 'tweede', 'seconde', 'zweite', 'segundo'),
(73, 'years', '', 'years', 'سنوات', 'jaar', 'années', 'Jahre', 'años'),
(74, 'months', '', 'months', 'الشهور', 'maanden', 'mois', 'Monate', 'meses'),
(75, 'days', '', 'days', 'أيام', 'dagen', 'journées', 'Tage', 'días'),
(76, 'hours', '', 'hours', 'ساعات', 'uur', 'heures', 'Std.', 'horas'),
(77, 'minutes', '', 'minutes', 'الدقائق', 'notulen', 'minutes', 'Protokoll', 'minutos'),
(78, 'seconds', '', 'seconds', 'ثواني', 'seconden', 'secondes', 'Sekunden', 'segundos'),
(79, 'time_ago', '', 'ago', 'منذ', 'geleden', 'depuis', 'vor', 'hace'),
(80, 'url_not_supported', '', 'URL not supported.', 'عنوان ورل غير متوافق.', 'URL niet ondersteund.', 'URL non prise en charge.', 'URL wird nicht unterstützt.', 'URL no es compatible.'),
(81, 'no_more_comments', '', 'No more comments found', 'لم يتم العثور على مزيد من التعليقات', 'Er zijn nog geen reacties gevonden', 'Plus de commentaires ont été trouvés', 'Keine weiteren Kommentare gefunden', 'No se encontraron comentarios'),
(82, 'video_not_found_please_try_again', '', 'Video not found, please refresh the page and try again.', 'لم يتم العثور على الفيديو، يرجى تحديث الصفحة وإعادة المحاولة.', 'Video niet gevonden, vernieuw de pagina en probeer het opnieuw.', 'Vidéo non trouvée, actualisez la page et réessayez.', 'Video nicht gefunden, bitte aktualisieren Sie die Seite und versuchen Sie es erneut.', 'No se encontró el video, actualice la página e inténtelo de nuevo.'),
(83, 'saved', '', 'Saved', 'حفظ', 'lagret', 'Enregistré', 'gespeichert', 'guardado'),
(84, 'no_comments_found', '', 'No comments found', 'لم يتم العثور على تعليقات', 'Geen reacties gevonden', 'Aucun commentaire trouvé', 'Keine Kommentare gefunden', 'No se encontraron comentarios'),
(85, 'import', '', 'Import', 'استيراد', 'Importeren', 'Importer', 'Einführen', 'Importar'),
(86, 'import_new_video', '', 'Import new video', 'استيراد فيديو جديد', 'Nieuwe video importeren', 'Importer une nouvelle vidéo', 'Neues Video importieren', 'Importar nuevo video'),
(87, 'video_url', '', 'Video URL', 'عنوان الفيديو', 'Video URL', 'URL de la vidéo', 'Video-URL', 'URL del vídeo'),
(88, 'url_desc', '', 'YouTube, Dailymotion, Vimeo URLs', 'يوتيوب، دايليموتيون، فيميو عناوين المواقع', 'YouTube, Dailymotion, Vimeo URLs', 'YouTube, Dailymotion, URL de Vimeo', 'YouTube, Dailymotion, Vimeo URLs', 'URL de YouTube, Dailymotion, Vimeo'),
(89, 'fetch_Video', '', 'Fetch Video', 'جلب الفيديو', 'Haal video', 'Fetch Video', 'Video abrufen', 'Obtener video'),
(90, 'video_title', '', 'Video Title', 'عنوان مقطع الفيديو', 'Video Titel', 'titre de la vidéo', 'Videotitel', 'Titulo del Video'),
(91, 'video_title_help', '', 'Your video title, 2 - 55 characters', 'عنوان الفيديو، من 2 إلى 55 حرفا', 'Je videotitel, 2 - 55 tekens', 'Votre titre vidéo, 2 à 55 caractères', 'Ihr Videotitel, 2 - 55 Zeichen', 'Su título de vídeo, 2 - 55 caracteres'),
(92, 'video_descritpion', '', 'Video Description', 'وصف الفيديو', 'video beschrijving', 'description de vidéo', 'Videobeschreibung', 'Descripción del video'),
(93, 'category', '', 'Category', 'فئة', 'categorie', 'Catégorie', 'Kategorie', 'categoría'),
(94, 'tags', '', 'Tags', 'الكلمات', 'Tags', 'Mots clés', 'Tags', 'Etiquetas'),
(95, 'tags_help', '', 'Tags, seprated by comma', 'الكلمات، سيبراتد بواسطة فاصلة', 'Tags gescheiden door komma\'s', 'Tags, séparés par virgule', 'Tags, gefolgt von Komma', 'Etiquetas, seprated by comma'),
(96, 'publish', '', 'Publish', 'نشر', 'Publiceren', 'Publier', 'Veröffentlichen', 'Publicar'),
(97, 'upload_new_video', '', 'Upload new video', 'تحميل فيديو جديد', 'Nieuwe video uploaden', 'Télécharger une nouvelle vidéo', 'Neues Video hochladen', 'Subir nuevo video'),
(98, 'choose_new_file', '', 'Choose video file..', 'اختيار ملف فيديو ..', 'Kies een videobestand ..', 'Choisissez le fichier vidéo ..', 'Videodatei auswählen', 'Elige un archivo de video ..'),
(99, 'thumbnail', '', 'Thumbnail', 'صورة مصغرة', 'thumbnail', 'La vignette', 'Miniaturansicht', 'Miniatura'),
(100, 'successfully_uplaoded', '', 'successfully uploaded.', 'تم تحميلها بنجاح.', 'succesvol geüpload.', 'téléchargé avec succès.', 'erfolgreich hochgeladen', 'cargado con éxito.'),
(101, 'reply', '', 'Reply', 'الرد', 'Antwoord', 'Répondre', 'Antworten', 'Respuesta'),
(102, 'show_more', '', 'Show more', 'أظهر المزيد', 'Laat meer zien', 'Montre plus', 'Zeig mehr', 'Mostrar más'),
(103, 'comments', '', 'Comments', 'تعليقات', 'Comments', 'commentaires', 'Bemerkungen', 'Comentarios'),
(104, 'write_your_comment', '', 'Write your comment..', 'اكتب تعليقك ..', 'Schrijf je reactie ..', 'Écrivez votre commentaire ..', 'Schreiben Sie Ihren Kommentar ..', 'Escriba su comentario ..'),
(105, 'fb_comments', '', 'Facebook Comments', 'تعليقات الفيسبوك', 'Facebook Reacties', 'Commentaires de Facebook', 'Facebook Kommentare', 'Comentarios de Facebook'),
(106, 'related_videos', '', 'Related Videos', 'فيديوهات ذات علاقة', 'Relaterte videoer', 'Vidéos connexes', 'Ähnliche Videos', 'Videos relacionados'),
(107, 'delete_confirmation', '', 'Are you sure you want to delete your comment?', 'هل تريد بالتأكيد حذف تعليقك؟', 'Weet u zeker dat u uw reactie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer votre commentaire?', 'Bist du sicher, dass du deinen Kommentar löschen möchtest?', '¿Seguro que quieres eliminar tu comentario?'),
(108, 'subscribed', '', 'Subscribed', 'المشترك', 'geabonneerd', 'Souscrit', 'Gezeichnet', 'Suscrito'),
(109, 'no_videos_found_subs', '', 'No videos found, subscribe to get started!', 'لم يتم العثور على مقاطع فيديو، اشترك في الخطوات الأولى!', 'Geen video\'s gevonden, schrijf je in om te beginnen!', 'Aucune vidéo n\'a été trouvée, inscrivez-vous pour commencer!', 'Keine Videos gefunden, abonnieren, um loszulegen!', 'No videos encontrados, suscríbase para empezar!'),
(110, 'subscriptions', '', 'Subscriptions', 'الاشتراكات', 'abonnementen', 'Abonnements', 'Abonnements', 'Suscripciones'),
(111, 'no_videos_found_history', '', 'No videos found, watch to get started!', 'لم يتم العثور على مقاطع فيديو، يمكنك مشاهدة الخطوات الأولى!', 'Geen video\'s gevonden, kijk om te beginnen!', 'Aucune vidéo n\'a été trouvée, regardez pour commencer!', 'Keine Videos gefunden, schau, um loszulegen!', 'No se han encontrado vídeos, ¡mira para empezar!'),
(112, 'history', '', 'History', 'التاريخ', 'Geschiedenis', 'Histoire', 'Geschichte', 'Historia'),
(113, 'no_videos_found_liked', '', 'No videos found, like to get started!', 'لم يتم العثور على مقاطع فيديو، مثل البدء!', 'Geen video\'s gevonden, graag aan de slag!', 'Aucune vidéo trouvée, n\'aime la mise en route!', 'Keine Videos gefunden, wie los!', 'No se han encontrado vídeos, ¡como para empezar!'),
(114, 'liked_videos', '', 'Liked videos', 'أعجبت مقاطع الفيديو', 'Verwachte video\'s', 'Vidéos aimées', 'Mochte Videos', 'Videos que me gustaron'),
(115, 'latest_videos', '', 'Latest videos', 'أحدث مقاطع الفيديو', 'Laatste video\'s', 'Dernières vidéos', 'Neueste Videos', 'Últimos vidéos'),
(116, 'no_videos_found_for_now', '', 'No videos found for now!', 'لم يتم العثور على مقاطع فيديو في الوقت الحالي!', 'Er zijn nog geen video\'s gevonden!', 'Aucune vidéo trouvée pour l\'instant!', 'Bisher keine Videos gefunden!', 'No se encontraron videos por ahora!'),
(117, 'no_more_videos_to_show', '', 'No more videos to show', 'لا مزيد من مقاطع الفيديو المراد عرضها', 'Nog geen video\'s om te laten zien', 'Plus de vidéos à afficher', 'Keine Videos mehr zu zeigen', 'No hay más videos para mostrar'),
(118, 'categories', '', 'Categories', 'الاقسام', 'Categorieën', 'Catégories', 'Kategorien', 'Categorías'),
(119, 'video_already_exist', '', 'Video is already exist', 'الفيديو موجود من قبل', 'Video bestaat al', 'La vidéo existe déjà', 'Video ist bereits vorhanden', 'El video ya existe'),
(120, 'video_saved', '', 'Video successfully updated', 'تم تحديث الفيديو بنجاح', 'Video is succesvol bijgewerkt', 'Vidéo mise à jour avec succès', 'Video erfolgreich aktualisiert', 'Video actualizado correctamente'),
(121, 'manage_videos', '', 'Manage Videos', 'إدارة مقاطع الفيديو', 'Beheer video\'s', 'Gérer les vidéos', 'Videos verwalten', 'Administrar vídeos'),
(122, 'search', '', 'Search', 'بحث', 'Zoeken', 'Chercher', 'Suche', 'Buscar'),
(123, 'manage', '', 'Manage', 'يدير', 'beheren', 'Gérer', 'Verwalten', 'Gestionar'),
(124, 'edit_video', '', 'Edit video', 'تحرير الفيديو', 'Bewerk video', 'Éditer vidéo', 'Video bearbeiten', 'Editar video'),
(125, 'delete_video_confirmation', '', 'Are you sure you want to delete this video? This action can\'t be undo', 'هل تريد بالتأكيد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء', 'Weet u zeker dat u deze video wilt verwijderen? Deze actie kan niet worden ongedaan gemaakt', 'Êtes-vous sûr de vouloir supprimer cette vidéo? Cette action ne peut pas annuler', 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden', '¿Seguro que quieres eliminar este video? No se puede deshacer esta acción'),
(126, 'manage_my_videos', '', 'Manage My Videos', 'إدارة مقاطع الفيديو الخاصة بي', 'Beheer mijn video\'s', 'Gérer mes vidéos', 'Verwalten Sie meine Videos', 'Administrar mis videos'),
(127, 'delete_videos', '', 'Delete video', 'حذف الفيديو', 'Video verwijderen', 'Supprimer la vidéo', 'Video löschen', 'Eliminar vídeo'),
(128, 'search_results', '', 'Search Results', 'نتائج البحث', 'Zoekresultaten', 'Résultats de la recherche', 'Suchergebnisse', 'Resultados de la búsqueda'),
(129, 'status', '', 'Status', 'وضع', 'staat', 'Statut', 'Status', 'estatus'),
(130, 'active', '', 'Active', 'نشيط', 'Actief', 'actif', 'Aktiv', 'Activo'),
(131, 'inactive', '', 'Inactive', 'غير نشط', 'Inactief', 'Inactif', 'Inaktiv', 'Inactivo'),
(132, 'type', '', 'Type', 'اكتب', 'Type', 'Type', 'Art', 'Tipo'),
(133, 'user', '', 'User', 'المستعمل', 'Gebruiker', 'Utilisateur', 'Benutzer', 'Usuario'),
(134, 'admin', '', 'Admin', 'مشرف', 'beheerder', 'Admin', 'Administrator', 'Administración'),
(135, 'verification', '', 'Verification', 'التحقق', 'Verificatie', 'Vérification', 'Überprüfung', 'Verificación'),
(136, 'verified', '', 'Verified', 'التحقق', 'geverifieerd', 'Vérifié', 'Verifiziert', 'Verificado'),
(137, 'not_verified', '', 'Not verified', 'لم يتم التحقق منه', 'niet geverifieerd', 'non vérifié', 'Nicht verifiziert', 'No verificado'),
(138, 'setting_updated', '', 'Settings successfully updated!', 'تم تحديث الإعدادات بنجاح!', 'Instellingen succesvol bijgewerkt!', 'Les paramètres ont été mis à jour avec succès!', 'Einstellungen erfolgreich aktualisiert!', 'Configuración actualizada con éxito!'),
(139, 'first_name', '', 'First Name', 'الاسم الاول', 'Voornaam', 'Prénom', 'Vorname', 'Nombre de pila'),
(140, 'last_name', '', 'Last Name', 'الكنية', 'Achternaam', 'Nom de famille', 'Familienname, Nachname', 'Apellido'),
(141, 'about_profile', '', 'About', 'حول', 'Over', 'Sur', 'Über', 'Acerca de'),
(142, 'facebook', '', 'Facebook', 'فيس بوك', 'Facebook', 'Facebook', 'Facebook', 'Facebook'),
(143, 'google_plus', '', 'Google+', 'في + Google', 'Google+', 'Google+', 'Google+', 'Google+'),
(144, 'twitter', '', 'Twitter', 'تغريد', 'tjilpen', 'Gazouillement', 'Twitter', 'Gorjeo'),
(145, 'current_password', '', 'Current Passowrd', 'باسورد الحالي', 'Huidige Passowrd', 'Passowrd actuel', 'Aktuelles Passowrd', 'Passowrd actual'),
(146, 'new_password', '', 'New Passowrd', 'جديد باسورد', 'Nieuwe Passowrd', 'New Passowrd', 'Neue Passowrd', 'Nuevo pasatiempo'),
(147, 'confirm_new_password', '', 'Confirm new password', 'تأكيد كلمة المرور الجديدة', 'Bevestig nieuw wachtwoord', 'Confirmer le nouveau mot de passe', 'Bestätige neues Passwort', 'Confirmar nueva contraseña'),
(148, 'current_password_dont_match', '', 'Current password doesn\'t match.', 'كلمة المرور الحالية غير متطابقة.', 'Huidig ​​wachtwoord komt niet overeen.', 'Le mot de passe actuel ne correspond pas.', 'Aktuelles Passwort stimmt nicht überein.', 'La contraseña actual no coincide.'),
(149, 'new_password_dont_match', '', 'New password doesn\'t match.', 'كلمة المرور الجديدة غير متطابقة.', 'Nieuw wachtwoord komt niet overeen.', 'Le nouveau mot de passe ne correspond pas.', 'Neues Passwort stimmt nicht überein.', 'La nueva contraseña no coincide.'),
(150, 'avatar', '', 'Avatar', 'الصورة الرمزية', 'avatar', 'Avatar', 'Benutzerbild', 'Avatar'),
(151, 'cover', '', 'Cover', 'غطاء، يغطي', 'deksel', 'Couverture', 'Abdeckung', 'Cubrir'),
(152, 'your_account_was_deleted', '', 'Your account was deleted', 'تم حذف حسابك', 'Uw account is verwijderd', 'Votre compte a été supprimé', 'Ihr Konto wurde gelöscht', 'Se ha eliminado tu cuenta.'),
(153, 'avatar_and_cover', '', 'Avatar & Cover', 'الصورة الرمزية والغطاء', 'Avatar & Cover', 'Avatar et couverture', 'Avatar & Cover', 'Avatar y portada'),
(154, 'general', '', 'General', 'جنرال لواء', 'Algemeen', 'Général', 'General', 'General'),
(155, 'delete_account', '', 'Delete account', 'حذف الحساب', 'Account verwijderen', 'Supprimer le compte', 'Konto löschen', 'Borrar cuenta'),
(156, 'general_settings', '', 'General Settings', 'الاعدادات العامة', 'Algemene instellingen', 'réglages généraux', 'Allgemeine Einstellungen', 'Configuración general'),
(157, 'password_settings', '', 'Password Settings', 'إعدادات كلمة المرور', 'Wachtwoordinstellingen', 'Paramètres du mot de passe', 'Kennworteinstellungen', 'Configuración de la contraseña'),
(158, 'profile_settings', '', 'Profile Settings', 'إعدادات الملف الشخصي', 'Profielinstellingen', 'Paramètres de profil', 'Profileinstellungen', 'Configuración de perfil'),
(159, 'videos', '', 'Videos', 'أشرطة فيديو', 'Videos', 'Vidéos', 'Videos', 'Videos'),
(160, 'up_next', '', 'Up next', 'التالي', 'Volgende', 'Suivant', 'Als nächstes', 'Hasta la próxima'),
(161, 'autoplay', '', 'Autoplay', 'تشغيل تلقائي', 'Automatisch afspelen', 'Lecture automatique', 'Automatisches Abspielen', 'Auto reproducción'),
(162, 'featured', '', 'Featured', 'متميز', 'Uitgelicht', 'En vedette', 'Vorgestellt', 'Destacados'),
(163, 'saved_videos', '', 'Saved Videos', 'مقاطع الفيديو المحفوظة', 'Opgeslagen video\'s', 'Vidéos sauvegardées', 'Gespeicherte Videos', 'Videos guardados'),
(164, 'my_channel', '', 'My Channel', 'قناتي', 'Mijn kanaal', 'Ma chaîne', 'Mein Kanal', 'Mi canal'),
(165, 'add_to', '', 'Add to', 'إضافة إلى', 'Legg til i', 'Ajouter à', 'Hinzufügen zu', 'Agregar a'),
(166, 'add_to_pl', '', 'Add to playlist', 'إضافة إلى قائمة التشغيل', 'Legg til i spilleliste', 'Ajouter à la playlist', 'Zu Playlist hinzufügen', 'Agregar a lista de reproducción'),
(167, 'create_new', '', 'Create new', 'إنشاء جديد', 'Opprett ny', 'Créer un nouveau', 'Neu erstellen', 'Crear nuevo'),
(168, 'close', '', 'Close', 'قريب', 'Lukk', 'Fermer', 'Schließen', 'cerca'),
(169, 'removed_from', '', 'Removed from', 'تمت الإزالة من', 'Fjernet fra', 'Retiré de', 'Entfernt von', 'Eliminado de'),
(170, 'added_to', '', 'Added to', 'تمت الإضافة إلى', 'Lagt til', 'Ajouté à', 'Hinzugefügt zu', 'Agregado a'),
(171, 'create_new_pl', '', 'Create new playlist', 'إنشاء قائمة تشغيل جديدة', 'Opprett ny spilleliste', 'Créer une nouvelle playlist', 'Neue Playlist erstellen', 'Crear nueva lista de reproducción'),
(172, 'pl_name', '', 'Playlist name', 'اسم قائمة التشغيل', 'Spilleliste navn', 'Nom de la liste de lecture', 'Playlist-Name', 'Nombre de la lista de reproducción'),
(173, 'privacy', '', 'Privacy', 'خصوصية', 'personvern', 'Confidentialité', 'Privatsphäre', 'intimidad'),
(174, 'description', '', 'Description', 'وصف', 'beschrijving', 'Description', 'Beschreibung', 'descripción'),
(175, 'create', '', 'Create', 'خلق', 'Opprett', 'Créer', 'Erstellen', 'crear'),
(176, 'cancel', '', 'Cancel', 'إلغاء', 'Avbryt', 'Annuler', 'Abbrechen', 'cancelar'),
(177, 'pl_name_required', '', 'Play list name is required.', 'اسم قائمة التشغيل مطلوب.', 'Spillelistenavn er nødvendig.', 'Le nom de la liste de lecture est requis.', 'Der Name der Wiedergabeliste ist erforderlich.', 'Se requiere el nombre de la lista de reproducción.'),
(178, 'play_lists', '', 'Playlists', 'قوائم التشغيل', 'spillelister', 'PlayLists', 'PlayLists', 'las listas de reproducción'),
(179, 'delete', '', 'Delete', 'حذف', 'Slett', 'Supprimer', 'Löschen', 'borrar'),
(180, 'confirmation', '', 'Confirmation!', 'تأكيد!', 'Bekreftelse!', 'Confirmation!', 'Bestätigung!', 'Confirmación!'),
(181, 'confirm_delist', '', 'Are you sure you want to delete this PlayList?', 'هل تريد بالتأكيد حذف قائمة التشغيل هذه؟', 'Er du sikker på at du vil slette denne PlayList?', 'Êtes-vous sûr de vouloir supprimer cette PlayList?', 'Möchten Sie diese PlayList wirklich löschen?', '¿Estás seguro de que quieres eliminar esta PlayList?'),
(182, 'yes_del', '', 'Yes,delete it!', 'نعم، حذفه!', 'Ja, slett det!', 'Oui, supprimez-le!', 'Ja, löschen Sie es!', 'Sí, ¡bórralo!'),
(183, 'deleted', '', 'Deleted!', 'حذف!', 'Slettet!', 'Supprimé!', 'Gelöscht!', 'Borrado!'),
(184, 'was_deleted', '', 'has been deleted!', 'تم حذف!', 'har blitt slettet!', 'a été supprimé!', 'wurde gelöscht!', 'ha sido eliminado'),
(185, 'no_lists_found', '', 'No PlayLists Found!', 'لم يتم العثور على قوائم تشغيل!', 'Ingen spillelister funnet!', 'Aucune liste de lecture trouvée!', 'Keine PlayLists gefunden!', 'No se encontraron listas de reproducción'),
(186, 'public', '', 'Public', 'جمهور', 'offentlig', 'Public', 'Öffentlichkeit', 'público'),
(187, 'private', '', 'Private', 'خاص', 'privat', 'Privé', 'Privat', 'privado'),
(188, 'сreated', '', 'Created', 'مكون', 'laget', 'établi', 'Erstellt', 'creado'),
(189, 'pl_сreated', '', 'PlayList was successful added!', 'تمت إضافة قائمة التشغيل بنجاح!', 'Spilleliste ble lagt til!', 'PlayList a été ajouté avec succès!', 'PlayList wurde erfolgreich hinzugefügt!', '¡La lista de reproducción se agregó con éxito!'),
(190, 'pl_saved', '', 'PlayList was successful saved!', 'تم حفظ قائمة التشغيل بنجاح!', 'Spillelisten ble lagret!', 'PlayList a été enregistré avec succès!', 'PlayList wurde erfolgreich gespeichert!', '¡La lista de reproducción se guardó con éxito!'),
(191, 'watch_later', '', 'Watch later', 'سأشاهده لاحقا', 'Se senere', 'Regarder plus tard', 'Später ansehen', 'Ver despues'),
(192, 'articles', '', 'Articles', 'مقالات', 'Artikler', 'Des articles', 'Artikel', 'Artículos'),
(193, 'search_articles', '', 'Search for articles', 'البحث عن المقالات', 'Søk etter artikler', 'Rechercher des articles', 'Suche nach Artikeln', 'Buscar artículos'),
(194, 'most_popular', '', 'Most popular', 'الأكثر شعبية', 'Mest populær', 'Le plus populaire', 'Am beliebtesten', 'Más popular'),
(195, 'no_result_for', '', 'Sorry, no results found for', 'آسف، لا توجد نتائج ل', 'Beklager, ingen resultater funnet for', 'Désolé, aucun résultat trouvé pour', 'Leider wurden keine Ergebnisse für', 'Lo sentimos, no se encontraron resultados para'),
(196, 'no_post_found', '', 'No posts found!', 'لم يتم العثور على أية مشاركات!', 'Ingen innlegg funnet!', 'Aucun article trouvé!', 'Keine Einträge gefunden!', '¡No se han encontrado publicaciones!'),
(197, 'related_articles', '', 'Related Articles', 'مقالات ذات صلة', 'Relaterte artikler', 'Articles Liés', 'In Verbindung stehende Artikel', 'Artículos relacionados'),
(198, 'share_to', '', 'Share to', 'مشاركة في', 'Del til', 'Partager à', 'Teilen mit', 'Compartir a'),
(199, 'no_more_articles', '', 'No more Articles', 'لا مزيد من المقالات', 'Ingen flere artikler', 'Plus d\'articles', 'Keine Artikel mehr', 'No más artículos'),
(200, 'go_pro', '', 'Go Pro', 'الذهاب للمحترفين', 'Bli profesjonell', 'Go Pro', 'Go pro', 'Hazte profesional'),
(201, 'buy_pro_pkg', '', 'Discover more features with {{SITE_NAME}} Pro package!', 'اكتشاف المزيد من الميزات مع {{SITE_NAME}} حزمة برو!', 'Oppdag flere funksjoner med {{SITE_NAME}} Pro pakke!', 'Découvrez plus de fonctionnalités avec le package {{SITE_NAME}} Pro!', 'Entdecken Sie weitere Funktionen mit dem {{SITE_NAME}} Pro-Paket!', 'Descubre más funciones con el {{SITE_NAME}} paquete Pro!'),
(202, 'free_mbr', '', 'Free Member', 'عضو مجاني', 'Gratis medlem', 'Membre gratuit', 'Freies Mitglied', 'miembro gratuito'),
(203, 'pro_mbr', '', 'Pro Member', 'عضو برو', 'Pro-medlem', 'Membre Pro', 'Pro-Mitglied', 'Pro miembro'),
(204, 'upload_1gb_limit', '', 'Upload up to 1GB limit', 'تحميل حد يصل إلى 1 غيغابايت', 'Last opp opptil 1 GB grense', 'Importer jusqu\'à 1 Go de limite', 'Bis zu 1 GB limitieren', 'Carga hasta 1GB de límite'),
(205, 'ads_will_show_up', '', 'Videos ads will show up', 'ستظهر إعلانات مقاطع الفيديو', 'Videoannonser vises', 'Les annonces vidéo s\'affichent', 'Videos werden geschaltet', 'Los anuncios de videos aparecerán'),
(206, 'not_featured_videos', '', 'Not featured videos', 'مقاطع الفيديو غير المميزة', 'Ikke kjennetegnet videoer', 'Vidéos non présentées', 'Nicht vorgestellte Videos', 'Videos no destacados'),
(207, 'no_verified_badge', '', 'No verified badge', 'لم يتم التحقق من شارة', 'Ingen bekreftet merke', 'Aucun badge vérifié', 'Kein bestätigtes Abzeichen', 'Sin insignia verificada'),
(208, 'stay_free', '', 'Stay Free', 'ابق حرا', 'Forbli fri', 'Reste libre', 'Bleibe frei', 'Mantente Libre'),
(209, 'upgrade', '', 'Upgrade', 'تطوير', 'Oppgradering', 'Surclassement', 'Aktualisierung', 'Mejorar'),
(210, 'upload_1tr_limit', '', 'Upload up to 1000GB', 'تحميل ما يصل إلى 1000 غيغابايت', 'Last opp opptil 1000 GB', 'Télécharger jusqu\'à 1000Go', 'Bis zu 1000 GB hochladen', 'Carga hasta 1000GB'),
(211, 'ads_wont_show_up', '', 'No ads will show up', 'لن تظهر أية إعلانات', 'Ingen annonser vil dukke opp', 'Aucune annonce ne s\'affichera', 'Es werden keine Anzeigen geschaltet', 'No se mostrarán anuncios'),
(212, 'ur_are_featured', '', 'Featured videos', 'مقاطع الفيديو الخاصة بك واردة', 'Dine videoer er omtalt', 'Vos vidéos sont en vedette', 'Ihre Videos sind gekennzeichnet', 'Tus videos son presentados'),
(213, 'verified_badge', '', 'Verified badge', 'تم التحقق من الشارة', 'Verifisert merketegn', 'Badge vérifié', 'Bestätigter Ausweis', 'Insignia verificada'),
(214, 'congratulations', '', 'Congratulations!', 'تهانينا!', 'Gratulerer!', 'Toutes nos félicitations!', 'Glückwünsche!', '¡Felicitaciones!'),
(215, 'uare_pro', '', 'You have successfully upgraded you profile to PRO user!', 'لقد نجحت في ترقية ملفك الشخصي إلى مستخدم برو!', 'Du har oppgradert profilen din til PRO-brukeren!', 'Vous avez mis à jour votre profil avec succès vers l\'utilisateur PRO!', 'Sie haben Ihr Profil erfolgreich auf den PRO-Benutzer aktualisiert!', '¡Ha actualizado su perfil con éxito a usuario PRO!'),
(216, 'start_features', '', 'Start browsing new features', 'ابدأ تصفح الميزات الجديدة', 'Begynn å bla gjennom nye funksjoner', 'Commencer à parcourir les nouvelles fonctionnalités', 'Suche nach neuen Funktionen', 'Comienza a navegar por nuevas funciones'),
(217, 'import_limit_reached_upgrade', '', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'لقد وصلت إلى حد الاستيراد، وترقية إلى الموالية لاستيراد أشرطة الفيديو غير محدود!', 'Du har nådd importgrensen din, oppgrader til pro for å importere ubegrensede videoer!', 'Vous avez atteint votre limite d\'importation, passez à pro pour importer des vidéos illimitées!', 'Sie haben Ihr Importlimit erreicht, aktualisieren Sie auf Pro, um unlimitierte Videos zu importieren!', '¡Has alcanzado tu límite de importación, actualízate a pro para importar videos ilimitados!'),
(218, 'upload_limit_reached_upgrade', '', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'لقد وصلت إلى حد التحميل، وترقية إلى الموالية لتحميل أشرطة الفيديو غير محدود!', 'Du har nådd opplastingsgrensen din, oppgrader til pro for å laste opp ubegrensede videoer!', 'Vous avez atteint votre limite de téléchargement, passez à pro pour télécharger des vidéos illimitées!', 'Du hast dein Upload-Limit erreicht, aktualisiere auf Pro, um unlimitierte Videos hochzuladen!', 'Has alcanzado el límite de carga y actualízate a profesional para subir videos ilimitados.'),
(219, 'import_limit_reached', '', 'You have reached your import limit', 'لقد وصلت إلى حد الاستيراد', 'Du har nådd importgrensen din', 'Vous avez atteint votre limite d\'importation', 'Sie haben Ihr Importlimit erreicht', 'Has alcanzado tu límite de importación'),
(220, 'upload_limit_reached', '', 'You have reached your upload limit', 'لقد وصلت إلى حد التحميل', 'Du har nådd opplastingsgrensen din', 'Vous avez atteint votre limite de téléchargement', 'Du hast dein Upload-Limit erreicht', 'Has alcanzado tu límite de carga'),
(221, 'upgrade_now', '', 'Upgrade Now?', 'تحديث الآن؟', 'Oppgrader nå?', 'Mettre à jour maintenant?', 'Jetzt upgraden?', '¿Actualizar ahora?'),
(222, 'error', '', 'Error!', 'خطأ!', 'Feil!', 'Erreur!', 'Fehler!', '¡Error!'),
(223, 'error_msg', '', 'Something went wrong Please try again later!', 'هناك شئ خاطئ، يرجى المحاولة فى وقت لاحق!', 'Noe gikk galt. Prøv igjen senere!', 'Quelque chose c\'est mal passé. Merci d\'essayer plus tard!', 'Etwas ist schief gelaufen Bitte versuche es später noch einmal!', 'Algo salió mal. ¡Inténtalo de nuevo más tarde!'),
(224, 'oops', '', 'Oops', 'وجه الفتاة', 'Oops', 'Oops', 'Hoppla', 'Uy'),
(225, 'write_a_reply', '', 'Write a comment and press ENTER', 'اكتب تعليق واضغط إنتر', 'Schrijf een reactie en druk op ENTER', 'Ecrire un commentaire et appuyez sur ENTER', 'Schreiben Sie einen Kommentar und drücken Sie ENTER.', 'Escribe un comentario y presiona ENTER'),
(226, 'file_is_too_big', '', 'File is too big, Max upload size is', 'الملف كبير جدا، الحد الأقصى لحجم التحميل هو', 'Bestand is te groot, Max upload grootte is', 'Le fichier est trop grand, la taille maximale de téléchargement est', 'Datei ist zu groß, Max Upload-Größe ist', 'El archivo es demasiado grande, el tamaño máximo de carga es'),
(227, 'ads', '', 'Advertising', 'إعلان', 'Advertising', 'Publicité', 'Werbung', 'publicidad'),
(228, 'wallet', '', 'Wallet', 'محفظة', 'portemonnee', 'Portefeuille', 'Geldbörse', 'billetera'),
(229, 'name', '', 'Name', 'اسم', 'naam', 'Nom', 'Name', 'nombre'),
(230, 'results', '', 'Results', 'النتائج', 'resultaten', 'Résultats', 'Ergebnisse', 'resultados'),
(231, 'spent', '', 'Spent', 'أمضى', 'besteed', 'Dépensé', 'Ausgegeben', 'gastado'),
(232, 'action', '', 'Action', 'عمل', 'actie', 'Action', 'Aktion', 'acción'),
(233, 'clicks', '', 'Clicks', 'نقرات', 'klikken', 'Clics', 'Klicks', 'clics'),
(234, 'create_ad', '', 'Create ad', 'إنشاء إعلان', 'Maak een advertentie', 'Créer une annonce', 'Anzeige erstellen', 'Crear anuncio'),
(235, 'my_balance', '', 'MY BALANCE', 'ماي بالانس', 'MIJN EVENWICHT', 'MON ÉQUILIBRE', 'MEINE BALANCE', 'MI EQUILIBRIO'),
(236, 'replenish_my_balance', '', 'Replenish My Balance', 'ريبلينيش بلدي التوازن', 'Vervult mijn saldo', 'Réapprovisionner mon équilibre', 'Füllen Sie mein Gleichgewicht auf', 'Reponer mi saldo'),
(237, 'amount', '', 'Amount', 'كمية', 'bedrag', 'Montant', 'Betrag', 'cantidad'),
(238, 'replenish', '', 'Replenish', 'سد النقص', 'bijvullen', 'Régénérer', 'Auffüllen', 'reponer'),
(239, 'create_new_ad', '', 'Create new ad', 'إنشاء إعلان جديد', 'Maak een nieuwe advertentie', 'Créer une nouvelle annonce', 'Neue Anzeige erstellen', 'Crear nuevo anuncio'),
(240, 'title', '', 'Title', 'لقب', 'titel', 'Titre', 'Titel', 'título'),
(241, 'select_media', '', 'Select Media', 'حدد الوسائط', 'Selecteer media', 'Sélectionner un média', 'Medien auswählen', 'Seleccionar medios'),
(242, 'pricing', '', 'Pricing', 'التسعير', 'pricing', 'Tarification', 'Preise', 'la fijación de precios'),
(243, 'placement', '', 'Placement', 'وضع', 'plaatsing', 'Placement', 'Platzierung', 'colocación'),
(244, 'traget_audience', '', 'Target Audience', 'الجمهور المستهدف', 'Doelgroep', 'Public cible', 'Zielgruppe', 'Audiencia objetivo'),
(245, 'video_ad', '', 'Videos (Format Video / Image)', 'مقاطع الفيديو (تنسيق الفيديو / الصورة)', 'Video\'s (video / afbeelding opmaken)', 'Vidéos (format vidéo / image)', 'Videos (Format Video / Bild)', 'Videos (Formato de video / imagen)'),
(246, 'page_ad', '', 'Sidebar (Format Image)', 'الشريط الجانبي (تنسيق الصورة)', 'Zijbalk (opmaakafbeelding)', 'Barre latérale (format image)', 'Seitenleiste (Bild formatieren)', 'Barra lateral (Imagen de formato)'),
(247, 'cost_click', '', 'Pay Per Click', 'الدفع لكل نقرة', 'Betaal per klik', 'Payer par clic', 'Zahlen pro Klick', 'Pago por clic'),
(248, 'cost_view', '', 'Pay Per Impression', 'الدفع لكل ظهور', 'Betaal per indruk', 'Pay Per Impression', 'Bezahlen pro Eindruck', 'Pago por impresión'),
(249, 'invalid_name', '', 'Name must be between 5/32', 'يجب أن يكون الاسم بين 5/32', 'Naam moet tussen 5/32 zijn', 'Le nom doit être entre 5/32', 'Name muss zwischen 5/32 liegen', 'El nombre debe estar entre 5/32'),
(250, 'invalid_url', '', 'The URL is invalid. Please enter a valid URL', 'عنوان ورل غير صالح. الرجاء إدخال عنوان ورل صالح', 'De URL is ongeldig. Voer een geldige URL in', 'L\'URL est invalide. Veuillez entrer une URL valide', 'Die URL ist ungültig. Bitte geben Sie eine gültige URL ein', 'La URL no es válida. Por favor ingrese una URL válida'),
(251, 'invalid_ad_title', '', 'Ad title must be between 5/100', 'يجب أن يكون عنوان الإعلان بين 5/100', 'De advertentietitel moet tussen 5/100 zijn', 'Le titre de l\'annonce doit être compris entre 5/100', 'Der Anzeigentitel muss zwischen 5/100 liegen', 'El título del anuncio debe estar entre 5/100'),
(252, 'invalid_videoad_media', '', 'Media file is invalid. Please select a valid image / video', 'ملف الوسائط غير صالح. الرجاء تحديد صورة / فيديو صالح', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding / video', 'Le fichier multimédia est invalide. Veuillez sélectionner une image / vidéo valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild / Video aus', 'El archivo multimedia no es válido. Seleccione una imagen / video válido'),
(253, 'invalid_pagead_media', '', 'Media file is invalid. Please select a valid image', 'ملف الوسائط غير صالح. الرجاء تحديد صورة صالحة', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier multimédia est invalide. Veuillez sélectionner une image valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'El archivo multimedia no es válido. Seleccione una imagen válida'),
(254, 'edit_ad', '', 'Edit ad', 'تعديل الإعلان', 'Advertentie bewerken', 'Modifier l\'annonce', 'Anzeige bearbeiten', 'Editar anuncio'),
(255, 'by', '', 'By', 'بواسطة', 'door', 'Par', 'Von', 'por'),
(256, 'more_info', '', 'More Info', 'مزيد من المعلومات', 'Meer info', 'Plus d\'infos', 'Mehr Infos', 'Más información'),
(257, 'monetization', '', 'Monetization', 'تسييل', 'monetization', 'Monétisation', 'Monetarisierung', 'monetización'),
(258, 'monetization_settings', '', 'Monetization Settings', 'إعدادات تحقيق الدخل', 'Instellingen voor inkomsten genereren', 'Paramètres de monétisation', 'Monetarisierungseinstellungen', 'Configuración de monetización'),
(259, 'withdrawals', '', 'Withdrawals', 'السحب', 'onttrekkingen', 'Retraits', 'Abhebungen', 'Los retiros'),
(260, 'balance', '', 'Available balance', 'الرصيد المتاح', 'Beschikbare balans', 'Solde disponible', 'Verfügbare Bilanz', 'Saldo disponible'),
(261, 'min', '', 'Min', 'دقيقة', 'min', 'Min', 'Min', 'min'),
(262, 'submit_withdrawal_request', '', 'Submit withdrawal request', 'إرسال طلب السحب', 'Verzoek tot opname indienen', 'Envoyer une demande de retrait', 'Abhebungsanfrage einreichen', 'Enviar solicitud'),
(263, 'cant_request_withdrawal', '', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'لا يمكنك إرسال طلب', 'U kunt geen aanvraag indienen', 'Vous ne pouvez pas soumettre une demande', 'Sie können keine Anfrage senden', 'No puede enviar la solicitud hasta que la solicitud anterior haya sido aprobada / rechazada'),
(264, 'withdrawal_request_amount_is', '', 'Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:', 'رصيدك هو {{بالانس}}، الحد الأدنى لطلب السحب هو 50:', 'Uw saldo is {{BALANCE}}, het minimum opnameverzoek is 50:', 'Votre solde est {{BALANCE}}, la demande de retrait minimum est de 50:', 'Ihr Guthaben ist {{BALANCE}}, die Mindestanzahl der Auszahlungen beträgt 50:', 'Su saldo es {{BALANCE}}, la solicitud mínima de retiro es 50:'),
(265, 'min_withdrawal_request_amount_is', '', 'The minimum withdrawal request is 50:', 'الحد الأدنى لطلب السحب هو 50:', 'Het minimale opnameverzoek is 50:', 'La demande de retrait minimum est de 50:', 'Die minimale Auszahlungsanforderung ist 50:', 'La solicitud mínima de retiro es 50:'),
(266, 'withdrawal_request_sent', '', 'Your withdrawal request has been successfully sent!', 'تم إرسال طلب السحب بنجاح!', 'Uw opnameverzoek is met succes verzonden!', 'Votre demande de retrait a bien été envoyée!', 'Ihre Auszahlungsanfrage wurde erfolgreich versendet!', '¡Su solicitud de retiro ha sido enviada con éxito!'),
(267, 'enabled', '', 'Enabled', 'تمكين', 'ingeschakeld', 'Activé', 'Aktiviert', 'Activado'),
(268, 'disabled', '', 'Disabled', 'معاق', 'invalide', 'Désactivé', 'Deaktiviert', 'discapacitado'),
(269, 'withdrawals_history', '', 'Withdrawals History', 'انسحابات التاريخ', 'Opnames geschiedenis', 'Historique des retraits', 'Abhebungen Geschichte', 'Historia de Retiros'),
(270, 'rejected', '', 'Rejected', 'مرفوض', 'verworpen', 'Rejeté', 'Abgelehnt', 'rechazado'),
(271, 'accepted', '', 'Accepted', 'قبلت', 'geaccepteerd', 'Accepté', 'Akzeptiert', 'aceptado'),
(272, 'requested_at', '', 'Requested at', 'طلب في', 'Gevraagd om', 'Demandé à', 'Angefordert bei', 'Solicitado en'),
(273, 'confirm_delete_ad', '', 'Are you sure you want to delete this ad?', 'هل تريد بالتأكيد حذف هذا الإعلان؟', 'Weet je zeker dat je deze advertentie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer cette annonce?', 'Möchten Sie diese Anzeige wirklich löschen?', '¿Seguro que quieres eliminar este anuncio?'),
(274, 'ad_published', '', 'Your ad has been published successfully', 'إعلانك هنا', 'Uw advertentie is hier', 'Votre annonce est ici', 'Ihre Anzeige ist hier', 'Su anuncio ha sido publicado con éxito'),
(275, 'ad_saved', '', 'Your changes to the ad were successfully saved', 'تغييراتك إلى الأفضل', 'Uw wijzigingen in de beste', 'Vos changements au meilleur', 'Ihre Änderungen an den besten', 'Sus cambios en el anuncio se guardaron con éxito'),
(276, 'pending', '', 'Pending', 'ريثما', 'in afwachting van', 'en attente', 'anstehend', 'pendiente'),
(277, 'balance_is_0', '', 'Your current wallet balance is: 0, please top up your wallet to continue.', 'رصيد المحفظة الحالي هو: 0، يرجى متابعة محفظتك للمتابعة.', 'Uw huidige portemonneebalans is: 0, vul uw portemonnee aan om door te gaan.', 'Votre solde de portefeuille actuel est: 0, veuillez compléter votre portefeuille pour continuer.', 'Ihre aktuelle Brieftasche Gleichgewicht ist: 0, bitte nach oben Ihre Brieftasche, um fortzufahren.', 'Su saldo de cartera actual es: 0, por favor, recargue su cartera para continuar.'),
(278, 'top_up', '', 'Top Up', 'أشحن', 'Top Up', 'Remplir', 'Nachfüllen', 'Completar'),
(279, 'earn_mon', '', 'Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!', 'اربح ({{CONFIG pub_price}} {{CONFIG payment_currency}}) لكل إعلان يتم النقر عليه من مقاطع الفيديو التابعة لك', 'Verdien ({{CONFIG pub_price}} {{CONFIG payment_currency}}) voor elke advertentieklik die je krijgt van je video\'s!', 'Gagnez ({{CONFIG pub_price}} {{CONFIG payment_currency}}) pour chaque annonce que vous recevez de vos vidéos!', 'Verdiene ({{CONFIG pub_price}} {{CONFIG payment_currency}}) für jeden Werbeclick, den du aus deinen Videos erhältst!', 'Gane ({{CONFIG pub_price}} {{CONFIG payment_currency}}) por cada clic publicitario que obtenga de sus videos.'),
(280, 'get_verified', '', 'Get verified', 'الحصول على التحقق', 'Wordt geverifieerd', 'Être vérifié', 'Verifiziert werden', 'Verifícate'),
(281, 'u_are_verified', '', 'Congratulations, you are verified. Thanks for verifying your ID', 'تهانينا، لقد تم إثبات ملكيتك. نشكرك على إثبات هويتك', 'Gefeliciteerd, je bent geverifieerd. Bedankt voor het verifiëren van uw ID', 'Félicitations, vous êtes vérifié. Merci d\'avoir vérifié votre identifiant', 'Herzlichen Glückwunsch, du bist verifiziert. Vielen Dank für die Bestätigung Ihrer ID', 'Felicidades, estás verificado. Gracias por verificar tu ID'),
(282, 'verif_request_received', '', 'Your request was received and is pending approval', 'تم استلام طلبك وهو في انتظار الموافقة', 'Uw aanvraag is ontvangen en wacht op goedkeuring', 'Votre demande a été reçue et est en attente d\'approbation', 'Ihre Anfrage wurde empfangen und steht noch aus.', 'Su solicitud fue recibida y está pendiente de aprobación'),
(283, 'upload_id', '', 'Upload Passport or ID', 'تحميل جواز السفر أو الهوية', 'Upload paspoort of ID', 'Télécharger un passeport ou un identifiant', 'Reisepass oder ID hochladen', 'Cargar pasaporte o ID'),
(284, 'select_id', '', 'Please select a recent picture of your passport or id', 'يرجى تحديد صورة حديثة لجواز السفر أو الهوية', 'Selecteer een recente foto van uw paspoort of id', 'Veuillez sélectionner une photo récente de votre passeport ou identifiant', 'Bitte wählen Sie ein aktuelles Bild Ihres Passes oder Ihrer ID', 'Seleccione una foto reciente de su pasaporte o identificación'),
(285, 'choose_file', '', 'Choose File', 'اختر ملف', 'Kies bestand', 'Choisir le fichier', 'Datei wählen', 'Elija el archivo'),
(286, 'submit_request', '', 'Submit request', 'تقديم الطلب', 'Aanvraag indienen', 'Envoyer la demande', 'Anfrage einreichen', 'Enviar peticion'),
(287, 'submit_verif_request_error', '', 'You can not submit verification request until the previous requests has been accepted / rejected', 'لا يمكنك إرسال طلب التحقق إلى أن يتم قبول الطلبات السابقة أو رفضها', 'U kunt geen verificatieverzoek indienen totdat de vorige verzoeken zijn geaccepteerd / afgewezen', 'Vous ne pouvez pas soumettre de demande de vérification tant que les demandes précédentes n\'ont pas été acceptées / rejetées', 'Sie können keine Überprüfungsanfrage senden, bis die vorherigen Anforderungen akzeptiert / abgelehnt wurden.', 'No puede enviar solicitud de verificación hasta que las solicitudes anteriores hayan sido aceptadas / rechazadas'),
(288, 'ivalid_last_name', '', 'Last name is too long!', 'اسم العائلة طويل جدا!', 'Achternaam is te lang!', 'Le nom de famille est trop long!', 'Nachname ist zu lang!', '¡El apellido es demasiado largo!'),
(289, 'ivalid_image_file', '', 'The Image file is Not valid.please select a valid picture!', 'ملف الصورة غير صالح.الرجاء تحديد صورة صالحة!', 'Het afbeeldingsbestand is niet geldig. Selecteer een geldige foto!', 'Le fichier Image n\'est pas valide. Veuillez sélectionner une image valide!', 'Die Bilddatei ist nicht gültig. Bitte wählen Sie ein gültiges Bild aus!', 'El archivo de imagen no es válido. ¡Por favor seleccione una imagen válida!'),
(290, 'ivalid_id_file', '', 'The passport/ID picture must be an image', 'يجب أن تكون صورة الجواز / الهوية صورة', 'Het paspoort / ID-beeld moet een afbeelding zijn', 'L\'image du passeport / ID doit être une image', 'Das Pass / ID-Bild muss ein Bild sein', 'El pasaporte / foto de identificación debe ser una imagen');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `spanish`) VALUES
(291, 'verif_request_sent', '', 'Your request was successfully sent and will be in the near future reviwed!', 'تم إرسال طلبك بنجاح وسوف تكون في المستقبل القريب ريفيويد!', 'Uw aanvraag is met succes verzonden en zal in de nabije toekomst worden herzien!', 'Votre demande a été envoyée avec succès et sera dans un futur proche reviwed!', 'Ihre Anfrage wurde erfolgreich versendet und wird in naher Zukunft reviwed sein!', 'Su solicitud fue enviada con éxito y será reviwed en el futuro cercano.'),
(292, 'unknown_error', '', 'Error: an unknown error occurred. Please try again later', 'خطأ: حدث خطأ غير معروف. الرجاء معاودة المحاولة في وقت لاحق', 'Fout: er is een onbekende fout opgetreden. Probeer het later opnieuw', 'Erreur: une erreur inconnue s\'est produite. Veuillez réessayer plus tard', 'Fehler: Ein unbekannter Fehler ist aufgetreten. Bitte versuche es später noch einmal', 'Error: se produjo un error desconocido. Por favor, inténtelo de nuevo más tarde'),
(293, 'ivalid_thumb_file', '', 'Thumbnail image file is invalid. Please select a valid image', 'ملف الصورة المصغرة غير صالح. الرجاء تحديد صورة صالحة', 'Miniatuurafbeeldingsbestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier d\'image miniature est invalide. Veuillez sélectionner une image valide', 'Miniaturbilddatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'El archivo de imagen en miniatura no es válido. Seleccione una imagen válida'),
(294, 'hide', '', 'Hide', 'إخفاء', 'Verbergen', 'Cacher', 'Verbergen', 'Esconder'),
(295, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Mensaje'),
(296, 'notifications', '', 'Notifications', 'إخطارات', 'Varsler', 'Notifications', 'Benachrichtigungen', 'Notificaciones'),
(297, 'subscribed_u', '', 'subscribed to your channel', 'مشترك في قناتك', 'abonnerer på kanalen din', 'abonné à votre chaîne', 'abonniert deinen Kanal', 'suscrito a tu canal'),
(298, 'unsubscribed_u', '', 'unsubscribed from your channel', 'غير مشترك من قناتك', 'avmeldt fra kanalen din', 'désabonné de votre chaîne', 'von deinem Kanal abgemeldet', 'anulado de su canal'),
(299, 'liked_ur_video', '', 'liked your video', 'أعجبك الفيديو', 'likte videoen din', 'aimé votre vidéo', 'mochte dein Video', 'me gustó tu video'),
(300, 'disliked_ur_video', '', 'disliked your video', 'لم يعجبك الفيديو', 'Mislikte videoen din', 'n\'aimait pas votre vidéo', 'hat dein Video nicht gefallen', 'disgustó tu video'),
(301, 'commented_ur_video', '', 'commented on your video', 'علق على الفيديو التابع لك', 'kommenterte videoen din', 'a commenté votre vidéo', 'hat dein Video kommentiert', 'comentó tu video'),
(302, 'liked_ur_comment', '', 'liked your comment', 'أحب تعليقك', 'likte din kommentar', 'aimé ton commentaire', 'mochte deinen Kommentar', 'le gustó su comentario'),
(303, 'disliked_ur_comment', '', 'disliked your comment', 'لم يعجبك تعليقك', 'Mislikte din kommentar', 'n\'aimait pas ton commentaire', 'hat deinen Kommentar nicht gefallen', 'disgustado su comentario'),
(304, 'replied_2ur_comment', '', 'replied to your comment', 'أجاب على تعليقك', 'svarte på din kommentar', 'a répondu à votre commentaire', 'antwortete auf deinen Kommentar', 'respondió a tu comentario'),
(305, 'cancel_report', '', 'Cancel Report', 'إلغاء التقرير', 'Avbryt rapport', 'Annuler le rapport', 'Bericht abbrechen', 'Cancelar informe'),
(306, 'no_more_videos', '', 'No more videos found', 'لم يتم العثور على مزيد من مقاطع الفيديو', 'Ingen flere videoer funnet', 'Plus de vidéos trouvées', 'Keine weiteren Videos gefunden', 'No se encontraron más videos'),
(307, 'load_more', '', 'Load more', 'تحميل المزيد', 'Last mer', 'Charger plus', 'Mehr laden', 'Carga más'),
(308, 'report_zs_video', '', 'Report this video', 'ابلغ عن هذا الفيديو', 'Rapporter denne videoen', 'Signaler cette vidéo', 'Melde dieses Video', 'Reporta este video'),
(309, 'write_vr_summary', '', 'Please write a summary of what this video was about', 'يرجى كتابة ملخص عن هذا الفيديو', 'Vennligst skriv et sammendrag av hva denne videoen handlet om', 'S\'il vous plaît écrire un résumé de ce que cette vidéo était sur', 'Bitte schreibe eine Zusammenfassung darüber, worum es in diesem Video ging', 'Por favor, escribe un resumen de lo que este video fue sobre'),
(310, 'submit', '', 'Submit', 'خضع', 'Sende inn', 'Soumettre', 'einreichen', 'Enviar'),
(311, 'thank_u', '', 'Thank you', 'شكرا لكم', 'Takk skal du ha', 'Je vous remercie', 'Vielen Dank', 'Gracias'),
(312, 'we_received_ur_rep', '', 'We have received your report!', 'لقد تلقينا تقريرك!', 'Vi har mottatt din rapport!', 'Nous avons reçu votre rapport!', 'Wir haben Ihren Bericht erhalten!', '¡Hemos recibido su informe!'),
(313, 'report_canceled', '', 'Your report has been canceled!', 'تم إلغاء تقريرك!', 'Rapporten din er kansellert!', 'Votre rapport a été annulé!', 'Ihr Bericht wurde storniert!', '¡Su informe ha sido cancelado!'),
(314, 'comment_pinned', '', 'Comment pinned to top', 'تم تعليق التعليق إلى الأعلى', 'Kommentar festet til toppen', 'Commentaire épinglé en haut', 'Kommentar nach oben gepinnt', 'Comentario anclado al principio'),
(315, 'comment_unpinned', '', 'Comment unpinned', 'تم إلغاء تثبيت التعليق', 'Kommentar unpinned', 'Commentaire détaché', 'Kommentar nicht gepinnt', 'Comentario sin fijar'),
(316, 'porcessing_video', '', 'Processing your video - this may take a few minutes', 'معالجة الفيديو - قد يستغرق ذلك بضع دقائق', 'Je video verwerken - dit kan een paar minuten duren', 'Traitement de votre vidéo - cela peut prendre quelques minutes', 'Verarbeitung deines Videos - dies kann einige Minuten dauern', 'Procesando su video: esto puede demorar unos minutos'),
(317, 'video_thumbs', '', 'Video thumbnails', 'الصور المصغرة الفيديو', 'Videominiaturen', 'vignettes vidéo', 'Video-Miniaturansichten', 'Miniaturas de vídeo'),
(318, 'ur_video_porcessing', '', 'This video is being converted to few resolutions, it may take a few minutes.', 'يتم تحويل الفيديو، قد يستغرق بضع دقائق', 'Video wordt geconverteerd, dit kan enkele minuten duren', 'La vidéo est convertie, cela peut prendre quelques minutes', 'Video wird konvertiert, es kann einige Minuten dauern', 'El video se convierte, puede tomar unos minutos'),
(319, 'this_video_porcessing', '', 'This video is being processed, please come back in few minutes', 'تتم معالجة هذا الفيديو، يرجى العودة في غضون بضع دقائق', 'Deze video wordt verwerkt. Kom over een paar minuten terug', 'Cette vidéo est en cours de traitement, revenez dans quelques minutes', 'Dieses Video wird gerade bearbeitet. Bitte kommen Sie in ein paar Minuten zurück', 'Este video está siendo procesado, vuelve en unos minutos'),
(320, 'mode', '', 'Mode', 'الوضع', 'mode', 'Mode', 'Modus', 'Modo'),
(321, 'day_mode', '', 'Day mode', 'وضع اليوم', 'Dagmodus', 'Mode jour', 'Tagesmodus', 'Modo día'),
(322, 'night_mode', '', 'Night mode', 'الوضع الليلي', 'Nachtstand', 'Mode nuit', 'Nacht-Modus', 'Modo nocturno'),
(323, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Ordenar por'),
(324, 'top_commnets', '', 'Top Comments', 'أعلى تعليقات', 'Top Reacties', 'Meilleures Commentaires', 'Beste Kommentare', 'Top Comentarios'),
(325, 'last_commnets', '', 'Latest comments', 'أحدث تعليقات', 'Laatste Reacties', 'Derniers Commentaires', 'Neueste Kommentare', 'Últimos comentarios'),
(326, 'darg_drop_video', '', 'Drag & Drop video', 'سحب وإسقاط الفيديو', 'Video slepen en neerzetten', 'Drag & Drop vidéo', 'Video per Drag & Drop', 'Arrastrar y soltar video'),
(327, 'click_2choose_file', '', 'click to select a file', 'انقر لتحديد ملف', 'klik om een bestand te selecteren', 'cliquez pour sélectionner un fichier', 'Klicken Sie, um eine Datei auszuwählen', 'haga clic para seleccionar un archivo'),
(328, 'or', '', 'or', 'أو', 'of', 'ou', 'oder', 'o'),
(329, 'contact_us', '', 'Contact us', 'اتصل بنا', 'Neem contact met ons op', 'Contactez nous', 'Kontaktiere uns', 'Contáctenos'),
(330, 'email', '', 'E-mail', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-mail', 'E-mail'),
(331, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', 'Ajout d&#039;une nouvelle vidéo', 'neues Video hinzugefügt', 'video nuevo agregado'),
(332, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', NULL, 'neues Video hinzugefügt', 'video nuevo agregado'),
(333, 'messages', '', 'Messages', 'رسائل', 'berichten', 'messages', 'Mitteilungen', 'Mensajes'),
(334, 'are_you_sure_you_want_delete_chat', '', 'Are you sure that you want to delete the conversation?', 'هل تريد بالتأكيد حذف المحادثة؟', 'Weet je zeker dat je het gesprek wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer la conversation?', 'Möchten Sie die Unterhaltung wirklich löschen?', '¿Estás seguro de que quieres eliminar la conversación?'),
(335, 'no_messages_found_hi', '', 'No messages were found, say Hi!', 'لم يتم العثور على رسائل، ويقول مرحبا!', 'Er zijn geen berichten gevonden, bijvoorbeeld Hallo!', NULL, 'Keine Nachrichten gefunden, sagen Hallo!', 'No se encontraron mensajes, decir Hola!'),
(336, 'no_messages_found_channel', '', 'No messages were found, please choose a channel to chat.', 'لم يتم العثور على أية رسائل، يرجى اختيار قناة للدردشة.', 'Er zijn geen berichten gevonden. Kies een kanaal om te chatten.', NULL, 'Es wurden keine Nachrichten gefunden. Wähle einen Chat-Kanal aus.', 'No se encontraron mensajes, elija un canal para chatear.'),
(337, 'no_match_found', '', 'No match found', 'لا يوجد تطابق', 'Geen overeenkomst gevonden', 'Pas de résultat trouvé', 'Keine Übereinstimmung gefunden', 'No se encontraron coincidencias'),
(338, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Mensaje'),
(339, 'write_message', '', 'Write a message...', 'اكتب رسالة...', 'Schrijf een bericht...', 'Écrire un message...', 'Eine Nachricht schreiben...', 'Escribe un mensaje...'),
(346, 'channels', '', 'Channels', 'قنوات', 'kanalen', 'Channels', 'Kanäle', 'Canales'),
(347, 'recent_articles', '', 'Most recent articles', 'أحدث المقالات', 'Meest recente artikelen', 'Articles les plus récents', 'Neueste Artikel', 'Artículos más recientes'),
(348, 'read_more', '', 'Read more', 'اقرأ أكثر', 'Lees verder', 'Lire la suite', 'Weiterlesen', 'Lee mas'),
(349, 'removed_history', '', 'Removed from History', 'تمت إزالته من السجل', 'Verwijderd uit de geschiedenis', NULL, 'Aus dem Verlauf entfernt', 'Eliminado de la historia'),
(350, 'show_less', '', 'Show less', 'عرض أقل', 'Vis mindre', 'Montre moins', 'Zeige weniger', 'Muestra menos'),
(351, 'no_users_found', '', 'No users found', 'لم يتم العثور على أي مستخدم', 'Geen gebruikers gevonden', 'Aucun utilisateur trouvé', 'Keine Benutzer gefunden', 'No se encontraron usuarios'),
(352, 'social_links', '', 'Social links', 'روابط اجتماعية', 'Sociale links', 'Liens sociaux', 'Soziale Verbindungen', 'Vínculos sociales'),
(353, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.'),
(354, 'cookie_dismiss', '', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', '¡Lo tengo!'),
(355, 'cookie_link', '', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Aprende más'),
(356, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Acepta los Términos de uso y la Política de privacidad'),
(357, 'terms_agreement', '', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Al crear su cuenta, usted acepta nuestra'),
(358, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'No tienes ninguna notificación'),
(359, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'No tienes ninguna notificación'),
(360, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.'),
(361, 'cookie_dismiss', '', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', '¡Lo tengo!'),
(362, 'cookie_link', '', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Aprende más'),
(363, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Acepta los Términos de uso y la Política de privacidad'),
(364, 'terms_agreement', '', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Al crear su cuenta, usted acepta nuestra'),
(365, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'No tienes ninguna notificación'),
(366, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'No estante en la lista'),
(367, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Este es un video privado, solo el editor puede verlo.'),
(368, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(369, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'Original'),
(370, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Restricción de edad'),
(371, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Todas las edades pueden ver este video'),
(372, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Solo +18'),
(373, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'No puedes cambiar tu edad más de una vez'),
(374, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Este video está restringido para menores de 18 años.'),
(375, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Crea una cuenta o inicia sesión para confirmar tu edad.'),
(376, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Donación Correo electrónico de PayPal'),
(377, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Descargar'),
(378, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'Donar'),
(379, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Este video está siendo revisado, por favor revise más tarde.'),
(380, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Has alcanzado tu límite de carga.'),
(381, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Elimina algunos de tus videos para poder subir más.'),
(382, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'No estante en la lista'),
(383, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Este es un video privado, solo el editor puede verlo.'),
(384, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(385, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'Original'),
(386, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Restricción de edad'),
(387, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Todas las edades pueden ver este video'),
(388, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Solo +18'),
(389, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'No puedes cambiar tu edad más de una vez'),
(390, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Este video está restringido para menores de 18 años.'),
(391, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Crea una cuenta o inicia sesión para confirmar tu edad.'),
(392, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Donación Correo electrónico de PayPal'),
(393, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Descargar'),
(394, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'Donar'),
(395, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Este video está siendo revisado, por favor revise más tarde.'),
(396, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Has alcanzado tu límite de carga.'),
(397, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Elimina algunos de tus videos para poder subir más.'),
(398, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'No estante en la lista'),
(399, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Este es un video privado, solo el editor puede verlo.'),
(400, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(401, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'Original'),
(402, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Restricción de edad'),
(403, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Todas las edades pueden ver este video'),
(404, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Solo +18'),
(405, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'No puedes cambiar tu edad más de una vez'),
(406, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Este video está restringido para menores de 18 años.'),
(407, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Crea una cuenta o inicia sesión para confirmar tu edad.'),
(408, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Donación Correo electrónico de PayPal'),
(409, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Descargar'),
(410, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'Donar'),
(411, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Este video está siendo revisado, por favor revise más tarde.'),
(412, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Has alcanzado tu límite de carga.'),
(413, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Elimina algunos de tus videos para poder subir más.'),
(414, 'other', 'Other', 'Other', 'آخر', 'anders', 'Autre', 'Andere', 'Otro'),
(415, 'no_more_s_to_show', 'No more subscriptions', 'No more subscriptions', 'لا مزيد من الاشتراكات', 'Geen abonnementen meer', 'Pas plus d\'abonnements', 'Keine weiteren Abonnements', 'No mas suscripciones'),
(416, 'sell_videos', 'Sell videos at any price', 'Sell videos at any price', 'بيع أشرطة الفيديو بأي ثمن', 'Verkoop video\'s voor elke prijs', 'Vendre des vidéos à tout prix', 'Verkaufen Sie Videos um jeden Preis', 'Vende videos a cualquier precio'),
(417, 'set_p_v', 'Price (Leave empty for free videos)', 'Price (Leave empty for free videos)', 'حدد سعرًا للمشاهد', 'Stel een prijs in voor de kijker', 'Fixer un prix pour le spectateur', 'Legen Sie einen Preis für den Viewer fest', 'Establecer un precio para el espectador'),
(418, 'p_m_than_', 'Minimum price you can set is', 'Minimum price you can set is', 'أقل سعر يمكنك تعيينه هو', 'Minimumprijs die u kunt instellen is', 'Le prix minimum que vous pouvez définir est', 'Mindestpreis, den Sie einstellen können, ist', 'El precio mínimo que puede establecer es'),
(419, 'pay_to_see', 'This video is being sold, you have to purchase the video to watch it.', 'This video is being sold, you have to purchase the video to watch it.', 'يتم بيع هذا الفيديو ، يجب عليك شراء الفيديو لمشاهدته.', 'Deze video wordt verkocht, je moet de video kopen om deze te bekijken.', 'Cette vidéo est en vente, vous devez acheter la vidéo pour la regarder.', 'Dieses Video wird verkauft, Sie müssen es kaufen, um es anzusehen.', 'Este video se está vendiendo, tienes que comprar el video para verlo.'),
(420, 'pay', 'Purchase', 'Purchase', 'دفع', 'Betalen', 'Payer', 'Zahlen', 'Paga'),
(421, 'paid_videos', 'Paid Videos', 'Paid Videos', 'مقاطع الفيديو المدفوعة', 'Betaalde video\'s', 'Vidéos payées', 'Bezahlte Videos', 'Videos de pago'),
(422, 'no_videos_found_paid', 'No paid videos found', 'No paid videos found', 'لم يتم العثور على مقاطع فيديو مدفوعة', 'Geen betaalde video\'s gevonden', 'Aucune vidéo payée trouvée', 'Keine bezahlten Videos gefunden', 'No se encontraron videos pagados'),
(423, 'transactions', 'Transactions', 'Transactions', 'المعاملات', 'transacties', 'Transactions', 'Transaktionen', 'Actas'),
(424, 'id', 'ID', 'ID', 'هوية شخصية', 'ID kaart', 'ID', 'ICH WÜRDE', 'CARNÉ DE IDENTIDAD'),
(425, 'payer_name', 'Payer Name', 'Payer Name', 'اسم المدفوع', 'Naam betaler', 'Nom du payeur', 'Name des Zahlers', 'Nombre del pagador'),
(426, 'video', 'Video', 'Video', 'فيديو', 'Video', 'Vidéo', 'Video', 'Vídeo'),
(427, 'site_com', 'Site Commission', 'Site Commission', 'لجنة الموقع', 'Site Commissie', 'Commission de chantier', 'Standortkommission', 'Comisión del sitio'),
(428, 'time', 'Time', 'Time', 'زمن', 'Tijd', 'Temps', 'Zeit', 'Hora'),
(429, 'paid_to_see', 'purchased your video', 'purchased your video', 'اشتريت الفيديو الخاص بك', 'heb je video gekocht', 'acheté votre vidéo', 'kaufte dein video', 'compré tu video'),
(430, 'video_price', 'This video price is:', 'This video price is:', 'سعر الفيديو هذا هو:', 'Deze videoprijs is:', 'Le prix de cette vidéo est:', 'Dieser Videopreis beträgt:', 'El precio de este video es:'),
(431, 'purchased', 'Purchases', 'Purchases', 'اشترى', 'Gekocht', 'Acheté', 'Gekauft', 'Comprado'),
(432, 'balance_', 'Balance', 'Balance', 'توازن', 'Balans', 'Équilibre', 'Balance', 'Equilibrar'),
(433, 'video_price_error', 'The video price should be numeric and greater than', 'The video price should be numeric and greater than', 'يجب أن يكون سعر الفيديو رقميًا وأكبر من', 'De videoprijs moet numeriek en groter zijn dan', 'Le prix de la vidéo doit être numérique et supérieur à', 'Der Videopreis sollte numerisch und größer als sein', 'El precio del video debe ser numérico y mayor que'),
(434, 'video_verified', 'This video is verified by our team', 'This video is verified by our team', 'تم التحقق من هذا الفيديو بواسطة فريقنا', 'Deze video wordt geverifieerd door ons team', 'Cette vidéo est vérifiée par notre équipe', 'Dieses Video wird von unserem Team überprüft', 'Este video es verificado por nuestro equipo.'),
(435, 'video_not_available', 'This video is no longer available', 'This video is no longer available', 'هذا المقطع لم يعد متوفرا', 'Deze video is niet langer beschikbaar', 'Cette vidéo n\'est plus disponible', 'Dieses Video ist nicht mehr verfügbar', 'Este video ya no está disponible'),
(436, 'admin_can_see', 'You have access to all videos, paid and free as you are an admin.', 'You have access to all videos, paid and free as you are an admin.', 'لديك حق الوصول إلى جميع مقاطع الفيديو ، مدفوعة ومجانية كما كنت مسؤولا.', 'Je hebt toegang tot alle video\'s, betaald en gratis als je een beheerder bent.', 'Vous avez accès à toutes les vidéos, payantes et gratuites, car vous êtes un administrateur.', 'Sie haben Zugriff auf alle Videos, bezahlt und kostenlos, da Sie ein Administrator sind.', 'Tienes acceso a todos los videos, de pago y gratis como eres administrador.'),
(437, 'net_earn', 'Net earnings', 'Net earnings', 'صافي الأرباح', 'Netto inkomen', 'Bénéfice net', 'Nettoverdienst', 'Ganancias netas'),
(438, 'user_upload_limit', 'User Upload Limit', 'User Upload Limit', 'حد تحميل المستخدم', 'Gebruikers upload limiet', 'Limite de téléchargement utilisateur', 'Benutzer-Upload-Limit', 'Límite de carga del usuario'),
(439, 'user_reached_upload_limit', 'You have reached your maximum upload limit, if you wish to increase it', 'You have reached your maximum upload limit, if you wish to increase it', 'لقد وصلت إلى الحد الأقصى للتحميل ، إذا كنت ترغب في زيادته', 'U heeft uw maximale uploadlimiet bereikt, als u deze wilt verhogen', 'Vous avez atteint votre limite maximale de téléchargement, si vous souhaitez l\'augmenter', 'Sie haben Ihr maximales Upload-Limit erreicht, wenn Sie es erhöhen möchten', 'Has alcanzado tu límite máximo de carga, si deseas aumentarlo'),
(440, 'please_contact', 'please contact us', 'please contact us', 'الرجاء التواصل معنا', 'Gelieve ons te contacteren', 'Contactez nous s\'il vous plait', 'bitte kontaktieren Sie uns', 'por favor contáctenos'),
(441, '_reached_max_limit', 'You have reached your maximum upload limit', 'You have reached your maximum upload limit', 'لقد وصلت إلى الحد الأقصى للتحميل', 'U heeft uw maximale uploadlimiet bereikt', 'Vous avez atteint votre limite de téléchargement maximale', 'Sie haben Ihr maximales Upload-Limit erreicht', 'Has alcanzado tu límite máximo de subida.'),
(442, 'upload_up', 'Upload up to', 'Upload up to', 'تحميل حتى', 'Upload tot', 'Télécharger jusqu\'à', 'Laden Sie bis zu', 'Subir hasta'),
(443, 'upload_up_no_limit', 'Upload unlimited videos', 'Upload unlimited videos', 'تحميل مقاطع فيديو غير محدودة', 'Upload onbeperkt video\'s', 'Télécharger des vidéos illimitées', 'Lade unbegrenzt Videos hoch', 'Subir videos ilimitados'),
(444, 'two_factor', 'Two-factor authentication', 'Two-factor authentication', 'توثيق ذو عاملين', 'Twee-factor-authenticatie', 'Authentification à deux facteurs', 'Zwei-Faktor-Authentifizierung', 'Autenticación de dos factores'),
(445, 'disable', 'Disable', 'Disable', 'تعطيل', 'onbruikbaar maken', 'Désactiver', 'Deaktivieren', 'Inhabilitar'),
(446, 'enable', 'Enable', 'Enable', 'مكن', 'in staat stellen', 'Activer', 'Aktivieren', 'Habilitar'),
(447, 'sent_two_factor_email', 'We have sent you the confirmation code to your email address.', 'We have sent you the confirmation code to your email address.', 'لقد أرسلنا إليك رمز التأكيد إلى عنوان بريدك الإلكتروني.', 'We hebben je de bevestigingscode gestuurd naar je e-mailadres.', 'Nous vous avons envoyé le code de confirmation à votre adresse e-mail.', 'Wir haben Ihnen den Bestätigungscode an Ihre E-Mail-Adresse gesendet.', 'Le hemos enviado el código de confirmación a su dirección de correo electrónico.'),
(448, 'confirm_code', 'Confirmation Code', 'Confirmation Code', 'تأكيد الكود', 'Bevestigingscode', 'Code de confirmation', 'Bestätigungscode', 'Código de confirmación'),
(449, 'wrong_confirm_code', 'Wrong confirmation code', 'Wrong confirmation code', 'رمز تأكيد خطأ', 'Foutieve bevestigingscode', 'Mauvais code de confirmation', 'Falscher Bestätigungscode', 'Código de confirmación incorrecto'),
(450, 'two_factor_description', 'Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your passw', 'Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your password and a 6-digit security code sent to your email to log in.', 'قم بتشغيل تسجيل الدخول المكوَّن من خطوتين لتحسين مستوى أمان حسابك ، وبمجرد تشغيله ، ستستخدم كل من كلمة المرور ورمز الحماية المكون من 6 أرقام والمرسلين إلى بريدك الإلكتروني لتسجيل الدخول.', 'Schakel login in 2 stappen in om de beveiliging van uw account te verbeteren. Als u eenmaal bent ingeschakeld, gebruikt u zowel uw wachtwoord als een uit 6 cijfers bestaande beveiligingscode die naar uw e-mailadres is gestuurd om u aan te melden.', 'Activez la connexion en deux étapes pour renforcer la sécurité de votre compte. Une fois activé, vous utiliserez votre mot de passe et un code de sécurité à 6 chiffres envoyé à votre adresse e-mail pour vous connecter.', 'Aktivieren Sie die Anmeldung in zwei Schritten, um die Sicherheit Ihres Kontos zu erhöhen. Nach dem Einschalten verwenden Sie sowohl Ihr Passwort als auch einen 6-stelligen Sicherheitscode, der an Ihre E-Mail gesendet wird, um sich anzumelden.', 'Active el inicio de sesión en dos pasos para aumentar la seguridad de su cuenta. Una vez que lo haya activado, utilizará su contraseña y un código de seguridad de 6 dígitos enviado a su correo electrónico para iniciar sesión.'),
(451, 'upload_date', 'Upload Date', 'Upload Date', 'تاريخ الرفع', 'Upload datum', 'Date de dépôt', 'Hochladedatum', 'Fecha de carga'),
(452, 'last_hour', 'Last hour', 'Last hour', 'الساعة الأخيرة', 'Laatste uur', 'Dernière heure', 'Letzte Stunde', 'Ultima hora'),
(453, 'today', 'Today', 'Today', 'اليوم', 'Vandaag', 'Aujourd\'hui', 'Heute', 'Hoy'),
(454, 'this_week', 'This week', 'This week', 'هذا الاسبوع', 'Deze week', 'Cette semaine', 'Diese Woche', 'Esta semana'),
(455, 'this_month', 'This month', 'This month', 'هذا الشهر', 'Deze maand', 'Ce mois-ci', 'Diesen Monat', 'Este mes'),
(456, 'this_year', 'This year', 'This year', 'هذا العام', 'Dit jaar', 'Cette année', 'Dieses Jahr', 'Este año'),
(457, 'video_studio', 'Video Studio', 'Video Studio', 'فيديو ستوديو', 'Video Studio', 'Studio vidéo', 'Videostudio', 'Estudio de video'),
(458, 'view_analytics', 'View Analytics', 'View Analytics', 'عرض التحليلات', 'Bekijk Analytics', 'Voir Analytics', 'Analytics anzeigen', 'Ver Analytics'),
(459, 'likes', 'Likes', 'Likes', 'الإعجابات', 'sympathieën', 'Aime', 'Likes', 'Gustos'),
(460, 'dislikes', 'Dislikes', 'Dislikes', 'يكره', 'Houdt niet van', 'N\'aime pas', 'Abneigungen', 'Aversiones'),
(461, 'video_analytics', 'Video Analytics', 'Video Analytics', 'تحليلات الفيديو', 'Video Analytics', 'Analyse vidéo', 'Video Analytics', 'Video Analytics'),
(462, 'total_likes', 'Total Likes', 'Total Likes', 'مجموع يحب', 'Totaal houdt van', 'Total de J\'aime', 'Likes insgesamt', 'Me gusta en total'),
(463, 'total_dislikes', 'Total Dislikes', 'Total Dislikes', 'مجموع يكره', 'Totaal houdt niet van', 'Total n\'aime pas', 'Total Abneigungen', 'Aversiones totales'),
(464, 'total_views', 'Total Views', 'Total Views', 'عدد المشاهدات', 'Totaal aantal weergaven', 'Vues totales', 'Gesamtansichten', 'Vistas totales'),
(465, 'view_report', 'View report', 'View report', 'عرض التقرير', 'Bekijk rapport', 'Voir le rapport', 'Zeige Bericht', 'Vista del informe'),
(466, 'dashboard', 'Dashboard', 'Dashboard', 'لوحة القيادة', 'Dashboard', 'Tableau de bord', 'Instrumententafel', 'Tablero'),
(467, 'latest_comments', 'Latest Comments', 'Latest Comments', 'أحدث تعليقات', 'laatste Reacties', 'Derniers Commentaires', 'neueste Kommentare', 'últimos comentarios'),
(468, 'total_comments', 'Total Comments', 'Total Comments', 'مجموع التعليقات', 'Totaal commentaar', 'Total des commentaires', 'Kommentare insgesamt', 'Total de comentarios'),
(469, 'total_comments_today', 'Comments Today', 'Comments Today', 'مجموع التعليقات اليوم', 'Totaal aantal reacties vandaag', 'Total des commentaires aujourd\'hui', 'Kommentare heute insgesamt', 'Total de comentarios hoy'),
(470, 'total_comments_month', 'Comments This Month', 'Comments This Month', 'مجموع التعليقات هذا الشهر', 'Totaal aantal reacties deze maand', 'Total des commentaires ce mois-ci', 'Kommentare insgesamt in diesem Monat', 'Total de comentarios este mes'),
(471, 'total_comments_year', 'Comments This Year', 'Comments This Year', 'مجموع التعليقات هذا العام', 'Totaal aantal reacties dit jaar', 'Total des commentaires cette année', 'Kommentare insgesamt in diesem Jahr', 'Total de comentarios de este año'),
(472, 'edit_comment', 'Edit Comment', 'Edit Comment', 'تعديل التعليق', 'Commentaar bewerken', 'Modifier le commentaire', 'Kommentar bearbeiten', 'Editar comentario'),
(473, 'channel_analytics', 'Channel Analytics', 'Channel Analytics', 'تحليلات القناة', 'Kanaalanalyses', 'Analyse de canal', 'Channel Analytics', 'Analítica de canales'),
(474, 'total_sub', 'Total Subscribers', 'Total Subscribers', 'مجموع المشتركين', 'Totaal aantal abonnees', 'Nombre total d\'abonnés', 'Abonnenten insgesamt', 'Total de suscriptores'),
(475, 'the_most_viewed', 'Most Viewed Videos', 'Most Viewed Videos', 'معظم الفيديوهات التي تمت مشاهدتها', 'Meest bekeken video\'s', 'Vidéos les plus visionnées', 'Meistgesehene Videos', 'Videos más vistos'),
(476, 'the_most_liked', 'Most Liked Videos', 'Most Liked Videos', 'أحب معظم الفيديوهات', 'Meest populaire video\'s', 'Vidéos les plus appréciées', 'Meistgeliebte Videos', 'Videos que mas me gustaron'),
(477, 'the_most_disliked', 'Most Disliked Videos', 'Most Disliked Videos', 'مقاطع الفيديو الأكثر إعجابًا', 'Meest gehate video\'s', 'Vidéos les plus détestées', 'Beliebteste Videos', 'Los videos más disgustados'),
(478, 'the_most_commented', 'Most Commented Videos', 'Most Commented Videos', 'مقاطع الفيديو الأكثر تعليقًا', 'De meeste video\'s met commentaar', 'Vidéos les plus commentées', 'Meist kommentierte Videos', 'Videos más comentados'),
(479, 'last_month', 'This month compared to last month', 'This month compared to last month', 'الشهر الماضي', 'Vorige maand', 'Le mois dernier', 'Im vergangenen Monat', 'El mes pasado'),
(480, 'subscribers', 'Subscribers', 'Subscribers', 'مشتركين', 'abonnees', 'Les abonnés', 'Abonnenten', 'Suscriptores'),
(481, 'total_earn', 'Total Earnings', 'Total Earnings', 'الأرباح الكلية', 'totale winst', 'Total des gains', 'Gesamteinnahmen', 'Ganancias Totales'),
(482, 'earnings', 'Earnings', 'Earnings', 'أرباح', 'verdiensten', 'Gains', 'Verdienste', 'Ganancias'),
(483, 'ur_video_queue', 'Your video is being added to queue, please check back in few minutes.', 'Your video is being added to queue, please check back in few minutes.', 'تتم إضافة الفيديو الخاص بك إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Je video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Votre vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier dans quelques minutes.', 'Ihr Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Su video se está agregando a la cola, por favor, vuelva en unos minutos.'),
(484, 'this_video_queue', 'This video is being added to queue, please check back in few minutes.', 'This video is being added to queue, please check back in few minutes.', 'تتم إضافة هذا الفيديو إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Deze video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Cette vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier à nouveau dans quelques minutes.', 'Dieses Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Este video se está agregando a la cola, por favor revise de nuevo en unos minutos.'),
(485, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Ordenar por'),
(486, 'assign_to_user', 'Assign To User', 'Assign To User', 'تعيين للمستخدم', 'Toewijzen aan gebruiker', 'Assigner à l\'utilisateur', 'Einem Benutzer zuweisen', 'Asignar a usuario'),
(487, 'user_not_exists', 'User is not exist', 'User is not exist', 'المستخدم غير موجود', 'Gebruiker bestaat niet', 'L\'utilisateur n\'est pas exister', 'Benutzer ist nicht vorhanden', 'El usuario no existe'),
(488, 'popular_channels', 'Popular Channels', 'Popular Channels', 'القنوات الشعبية', 'Populaire kanalen', 'Chaînes populaires', 'Beliebte Kanäle', 'Canales populares'),
(489, 'no_more_channels_to_show', 'No more channels to show', 'No more channels to show', 'لا مزيد من القنوات لإظهارها', 'Geen kanalen meer om te laten zien', 'Plus de chaînes à montrer', 'Keine Kanäle mehr zu zeigen', 'No hay más canales para mostrar.'),
(490, 'no_channels_found_for_now', 'No channels found', 'No channels found', 'لم يتم العثور على قنوات', 'Geen kanalen gevonden', 'Aucune chaîne trouvée', 'Keine Channels gefunden', 'No se encontraron canales'),
(491, 'filter_by', 'Filter By', 'Filter By', 'مصنف بواسطة', 'Filteren op', 'Filtrer par', 'Filtern nach', 'Filtrado por'),
(492, 'sub_category', 'Sub Category', 'Sub Category', 'الفئة الفرعية', 'Subcategorie', 'Sous catégorie', 'Unterkategorie', 'Subcategoría'),
(493, 'none', 'None', 'None', 'لا شيء', 'Geen', 'Aucun', 'Keiner', 'Ninguna'),
(494, 'all', 'All', 'All', 'الكل', 'Allemaal', 'Tout', 'Alles', 'Todos'),
(495, 'video_not_available_location', 'This video is not available in your location.', 'This video is not available in your location.', 'هذا الفيديو غير متوفر في موقعك.', 'Deze video is niet beschikbaar op jouw locatie.', 'Cette vidéo n\'est pas disponible dans votre région.', 'Dieses Video ist an Ihrem Standort nicht verfügbar.', 'Este video no está disponible en tu ubicación.'),
(496, 'geo_blocking', 'Geo Blocking', 'Geo Blocking', 'جيو الحظر', 'Geo-blokkering', 'Blocage géographique', 'Geo-Blocking', 'Bloqueo geográfico'),
(497, 'unknown_location', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'موقعك غير معروف ، لذا تم حظر هذا الفيديو.يجوز لك إعادة المحاولة لاحقًا.', 'Uw locatie is onbekend, dus deze video is geblokkeerd. kunt het later opnieuw proberen.', 'Votre position est inconnue, cette vidéo a donc été bloquée. Vous pouvez réessayer plus tard.', 'Ihr Standort ist unbekannt, daher wurde dieses Video gesperrt. Sie können es später erneut versuchen.', 'Su ubicación es desconocida, por lo que este video fue bloqueado. Puedes intentarlo más tarde.'),
(498, 'ads_earnings', 'Ads Earnings', 'Ads Earnings', 'أرباح الإعلانات', 'Inkomsten uit advertenties', 'Revenu des annonces', 'Werbeeinnahmen', 'Ganancias de los anuncios'),
(499, 'videos_earnings', 'Video Earnings', 'Video sales earnings', 'أرباح الفيديو', 'Video-inkomsten', 'Vidéos Gains', 'Videos Einnahmen', 'Videos de ganancias'),
(500, 'sales_earnings', 'Sales Earning', 'Sales Earning', 'كسب المبيعات', 'Verkoop verdienen', 'Ventes', 'Verkäufe verdienen', 'Ventas ganando'),
(501, 'ads_analytics', 'Ads Analytics', 'Ads Analytics', 'تحليلات الإعلانات', 'Analytics voor advertenties', 'Analyse des annonces', 'Anzeigenanalysen', 'Ads Analytics'),
(502, 'all_time', 'All Time', 'All Time', 'كل الوقت', 'Altijd', 'Tout le temps', 'Alle zeit', 'Todo el tiempo'),
(503, 'analytics', 'Analytics', 'Analytics', 'تحليلات', 'Analytics', 'Analytique', 'Analytics', 'Analítica'),
(517, 'create_article', '', 'Create article', 'خلق المادة', 'Maak een artikel', 'Créer un article', 'Artikel erstellen', 'Crear articulo'),
(518, 'create_new_article', '', 'Create new article', 'إنشاء مقال جديد', 'Maak een nieuw artikel', 'Créer un nouvel article', 'Neuen Artikel erstellen', 'Crear nuevo articulo'),
(519, 'descritpion', '', 'Description', 'Descritpion', 'descritpion', 'Description', 'Beschreibung', 'Description'),
(520, 'the_article', '', 'The article', 'المقالة', 'Het artikel', 'L\'article', 'Der Artikel', 'El artículo'),
(521, 'short_title', '', 'The title should be more than 5 characters', 'يجب أن يكون العنوان أكثر من 5 أحرف', 'De titel moet uit meer dan 5 tekens bestaan', 'Le titre doit comporter plus de 5 caractères.', 'Der Titel sollte aus mehr als 5 Zeichen bestehen', 'El título debe tener más de 5 caracteres.'),
(522, 'short_description', '', 'The description should be more than 15 characters', 'يجب أن يكون الوصف أكثر من 15 حرفًا', 'De beschrijving moet uit meer dan 15 tekens bestaan', 'La description doit comporter plus de 15 caractères.', 'Die Beschreibung sollte mehr als 15 Zeichen umfassen', 'La descripción debe tener más de 15 caracteres.'),
(523, 'image_not_valid', '', 'The Image file is not valid, please select a valid image.', 'ملف الصورة غير صالح ، يرجى تحديد صورة صالحة.', 'Het beeldbestand is niet geldig, selecteer een geldige afbeelding.', 'Le fichier image n\'est pas valide, veuillez sélectionner une image valide.', 'Die Bilddatei ist nicht gültig. Bitte wählen Sie ein gültiges Bild aus.', 'El archivo de imagen no es válido, seleccione una imagen válida.'),
(524, 'category_not_valid', '', 'Invalid category, Please check your details.', 'فئة غير صالحة ، يرجى التحقق من التفاصيل الخاصة بك.', 'Ongeldige categorie, controleer uw gegevens.', 'Catégorie non valide, veuillez vérifier vos coordonnées.', 'Ungültige Kategorie. Bitte überprüfen Sie Ihre Angaben.', 'Categoría no válida, por favor revise sus detalles.'),
(525, 'reviewed_article', '', 'Thank you, your article has been submitted, and it\'s being reviewed, please check back later.', 'شكرًا ، تم إرسال مقالك ، وهو قيد المراجعة ، يرجى التحقق مرة أخرى لاحقًا.', 'Bedankt, uw artikel is verzonden en het wordt beoordeeld. Kom later nog eens terug.', 'Merci, votre article a été soumis et il est en train d\'être revu, revenez plus tard.', 'Vielen Dank, Ihr Artikel wurde eingereicht, und er wird überprüft. Bitte versuchen Sie es später erneut.', 'Gracias, su artículo fue enviado y está siendo revisado, por favor, vuelva más tarde.'),
(526, 'my_articles', '', 'My articles', 'مقالاتي', 'Mijn artikelen', 'Mes articles', 'Meine Artikel', 'Mis articulos'),
(527, 'delete_article_text', '', 'Are you sure you want to delete this article? This action can\'t be undo', 'هل أنت متأكد أنك تريد حذف هذه المقالة؟ لا يمكن التراجع عن هذا الإجراء', 'Weet je zeker dat je dit artikel wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt', 'Êtes-vous sûr de vouloir supprimer cet article? Cette action ne peut pas être annulée', 'Möchten Sie diesen Artikel wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden', '¿Estás seguro de que quieres eliminar este artículo? Esta acción no se puede deshacer.'),
(528, 'edit_article', '', 'Edit article', 'تحرير المادة', 'Bewerk artikel', 'Modifier l\'article', 'Artikel bearbeiten', 'Editar artículo'),
(529, 'movies', '', 'Movies', 'أفلام', 'Films', 'Films', 'Filme', 'Películas'),
(530, 'is_movie', '', 'Is it a movie?', 'هل هو فيلم؟', 'Is het een film?', 'Est-ce un film?', 'Ist es ein Film?', '¿Es una película?'),
(531, 'yes', '', 'Yes', 'نعم فعلا', 'Ja', 'Oui', 'Ja', 'Sí'),
(532, 'no', '', 'No', 'لا', 'Nee', 'Non', 'Nein', 'No'),
(533, 'movie_title', '', 'Movie title', 'عنوان الفيلم', 'Film titel', 'Titre du film', 'Filmtitel', 'Título de la película'),
(534, 'stars', '', 'Stars', 'نجوم', 'Stars', 'Étoiles', 'Sterne', 'Estrellas'),
(535, 'by_comma', '', 'Separated by comma,', 'مفصولة بفاصلة ،', 'Gescheiden door komma,', 'Séparé par une virgule,', 'Durch Komma getrennt,', 'Separados por comas,'),
(536, 'producer', '', 'Producer', 'منتج', 'Producent', 'Producteur', 'Hersteller', 'Productor');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `spanish`) VALUES
(537, 'release', '', 'Release', 'إطلاق سراح', 'Vrijlating', 'Libération', 'Veröffentlichung', 'Lanzamiento'),
(538, 'rating_btween', '', '(Between 1 -> 10)', '(بين 1 -> 10)', '(Tussen 1 -> 10)', '(Entre 1 -> 10)', '(Zwischen 1 -> 10)', '(Entre 1 -> 10)'),
(539, 'duration', '', 'Duration', 'المدة الزمنية', 'Looptijd', 'Durée', 'Dauer', 'Duración'),
(540, 'quality', '', 'Quality', 'جودة', 'Kwaliteit', 'Qualité', 'Qualität', 'Calidad'),
(541, 'rating', '', 'Rating', 'تقييم', 'Beoordeling', 'Évaluation', 'Bewertung', 'Clasificación'),
(542, 'rent_price', '', 'Rent price', 'سعر الايجار', 'Huurprijs', 'Prix ​​de location', 'Mietpreis', 'Precio de alquiler'),
(543, 'rent_text', '', 'Or you can rent it for 24 hour', 'أو يمكنك استئجاره لمدة 24 ساعة', 'Of u kunt het voor 24 uur huren', 'Ou vous pouvez le louer pour 24 heures', 'Oder Sie können es für 24 Stunden mieten', 'O puedes alquilarlo por 24 horas.'),
(544, 'rent', '', 'Rent', 'تأجير', 'Huur', 'Location', 'Miete', 'Alquilar'),
(545, 'video_expire', '', 'This video will expire at ', 'سينتهي هذا الفيديو في', 'Deze video verloopt om', 'Cette vidéo expirera le', 'Dieses Video läuft am um', 'Este video expirará en'),
(546, 'rent_video', '', 'Rent this movie', 'استئجار هذا الفيلم', 'Huur deze film', 'Louez ce film', 'Mieten Sie diesen Film', 'Alquilar esta pelicula'),
(547, 'cover_size', '', 'For movies, the cover size should not be more than 400x570.', 'بالنسبة للأفلام ، يجب ألا يزيد حجم الغطاء عن 400 × 570.', 'Voor films mag de omslag niet groter zijn dan 400x570.', 'Pour les films, la taille de la couverture ne doit pas dépasser 400x570.', 'Bei Filmen sollte die Covergröße nicht größer als 400 x 570 sein.', 'Para películas, el tamaño de la cubierta no debe ser más de 400x570.'),
(548, 'movies_text', '', 'To watch this movie, you have to purchase it.', 'لمشاهدة هذا الفيلم ، عليك شراءه.', 'Om deze film te bekijken, moet je hem kopen.', 'Pour regarder ce film, vous devez l\'acheter.', 'Um diesen Film anzusehen, müssen Sie ihn kaufen.', 'Para ver esta película, tienes que comprarla.'),
(549, 'transfer_earnings', '', 'Transfer earnings to wallet', 'تحويل الأرباح إلى المحفظة', 'Overdracht van inkomsten naar portemonnee', 'Transférer les revenus dans un portefeuille', 'Übertragen Sie die Einnahmen in die Brieftasche', 'Transferencia de ganancias a la billetera'),
(550, 'transfer_money', '', 'Transfer money to wallet, so you would be able to use them for ads.', 'قم بتحويل الأموال إلى المحفظة ، حتى تتمكن من استخدامها للإعلانات.', 'Geld overboeken naar de portemonnee, zodat u ze voor advertenties kunt gebruiken.', 'Transférez de l\'argent dans un portefeuille afin que vous puissiez les utiliser pour des publicités.', 'Überweisen Sie Geld in die Brieftasche, damit Sie sie für Anzeigen verwenden können.', 'Transfiera dinero a la billetera, para que pueda utilizarlos para anuncios.'),
(551, 'withdrawal_earnings', '', 'Once the amount is transferred, you won\'t be able to withdrawal them.', 'بمجرد تحويل المبلغ ، لن تتمكن من سحبه.', 'Zodra het bedrag is overgemaakt, kunt u ze niet meer opnemen.', 'Une fois le montant transféré, vous ne pourrez plus les retirer.', 'Sobald der Betrag überwiesen ist, können Sie ihn nicht mehr abheben.', 'Una vez que la cantidad se transfiere, no podrá retirarlas.'),
(552, 'cant_transfer', '', 'Your balance is {{balance}}, You can\'t transfer', 'رصيدك هو {{balance}} ، لا يمكنك التحويل', 'Uw saldo is {{balance}}, u kunt niet overschrijven', 'Votre solde est {{balance}}, vous ne pouvez pas transférer', 'Ihr Guthaben ist {{Guthaben}}. Sie können nicht übertragen', 'Tu saldo es {{balance}}, no puedes transferir'),
(553, 'transfer', '', 'Transfer', 'نقل', 'Overdracht', 'Transfert', 'Transfer', 'Transferir'),
(554, 'balance_transferred', '', 'Your balance was transferred.', 'تم تحويل رصيدك', 'Je saldo is overgedragen.', 'Votre solde a été transféré.', 'Ihr Guthaben wurde übertragen.', 'Su saldo fue transferido.'),
(555, 'max_can_transfer', '', 'The maximum amount that you can transfer is', 'الحد الأقصى للمبلغ الذي يمكنك نقله هو', 'Het maximale bedrag dat u kunt overboeken is', 'Le montant maximum que vous pouvez transférer est de', 'Der Höchstbetrag, den Sie überweisen können, ist', 'La cantidad máxima que puede transferir es'),
(556, 'most_active', '', 'Most active', 'أكثر نشاطا', 'Meest actief', 'Le plus actif', 'Am aktivsten', 'Mas activo'),
(557, 'no_movies_found', '', 'No movies found', 'لم يتم العثور على أفلام', 'Geen films gevonden', 'Aucun film trouvé', 'Keine Filme gefunden', 'No se encontraron peliculas'),
(558, 'movies_page_search', '', 'What you would like to watch?', 'ماذا تريد أن تشاهد؟', 'Wat zou je willen zien?', 'Que voudriez-vous regarder?', 'Was würdest du gerne sehen?', '¿Qué te gustaría ver?'),
(559, 'pay_to_see_video', '', 'More to watch! to continue watching this video, you have to purchase it.', 'أكثر لمشاهدة! لمتابعة مشاهدة هذا الفيديو ، عليك شراءه.', 'Meer om te zien! om deze video te blijven bekijken, moet je hem kopen.', 'Plus à regarder! pour continuer à regarder cette vidéo, vous devez l\'acheter.', 'Mehr zu sehen! Um dieses Video weiter anzusehen, müssen Sie es kaufen.', '¡Más para ver! Para seguir viendo este video, debes comprarlo.'),
(560, 'ad_day_limit', '', 'Spending limit per day', 'حد الإنفاق في اليوم', 'Bestedingslimiet per dag', 'Limite de dépenses par jour', 'Ausgabenlimit pro Tag', 'Límite de gasto por día'),
(561, 'email_provider_banned', '', 'The email provider is blacklisted and not allowed, please choose another email provider.', 'مزود البريد الإلكتروني مدرج في القائمة السوداء وغير مسموح به ، يرجى اختيار مزود بريد إلكتروني آخر.', 'De e-mailprovider staat op de zwarte lijst en is niet toegestaan, kies een andere e-mailprovider.', 'Le fournisseur de messagerie est sur la liste noire et non autorisé. Veuillez choisir un autre fournisseur de messagerie.', 'Der E-Mail-Anbieter ist auf der schwarzen Liste und nicht zulässig. Bitte wählen Sie einen anderen E-Mail-Anbieter.', 'El proveedor de correo electrónico está en la lista negra y no está permitido, elija otro proveedor de correo electrónico.'),
(562, 'age_block_text', '', 'You are under 18 you can\'t access this site for {hour} hour(s).', 'أنت أقل من 18 عامًا ولا يمكنك الوصول إلى هذا الموقع لمدة {ساعة} (ساعات).', 'U bent jonger dan 18 jaar, u hebt gedurende {uur} uur (uren) geen toegang tot deze site.', 'Vous avez moins de 18 ans, vous ne pouvez pas accéder à ce site pendant {heure} heure (s).', 'Sie sind jünger als 18 Jahre und können für {hour} hour (s) nicht auf diese Site zugreifen.', 'Tiene menos de 18 años, no puede acceder a este sitio durante {hora} hora (s).'),
(563, 'age_block_modal', '', 'Are you 18 years old or above?', 'هل عمرك 18 سنة فما فوق؟', 'Ben je 18 jaar of ouder?', 'Avez-vous 18 ans ou plus?', 'Bist du 18 Jahre alt oder älter?', '¿Tienes 18 años o más?'),
(564, 'porcessing_image', '', 'Processing - this may take a few minutes', 'المعالجة - قد يستغرق هذا بضع دقائق', 'Verwerking - dit kan een paar minuten duren', 'Traitement - cela peut prendre quelques minutes', 'Verarbeitung - Dies kann einige Minuten dauern', 'Procesamiento - esto puede tardar unos minutos'),
(565, 'block', '', 'Block', 'منع', 'Blok', 'Bloc', 'Block', 'Bloquear'),
(566, 'unblock', '', 'Unblock', 'رفع الحظر', 'deblokkeren', 'Débloquer', 'Entsperren', 'Desatascar'),
(567, 'blocked_users', '', 'Blocked Users', 'مستخدمين محجوبين', 'Geblokkeerde gebruikers', 'Utilisateurs bloqués', 'Blockierte Benutzer', 'Usuarios bloqueados'),
(568, 'custom_page', '', 'Custom Page', 'صفحة مخصص', 'Aangepaste pagina', 'Page personnalisée', 'Benutzerdefinierte Seite', 'Pagina personalizada'),
(569, 'manage_sessions', '', 'Manage Sessions', 'إدارة الجلسات', 'Sessies beheren', 'Gérer les sessions', 'Sitzungen verwalten', 'Gestionar sesiones'),
(570, 'browser', '', 'Browser', 'المتصفح', 'browser', 'Navigateur', 'Browser', 'Navegador'),
(571, 'last_seen', '', 'Last Seen', 'اخر ظهور', 'Laatst gezien', 'Dernier vu', 'Zuletzt gesehen', 'Ultima vez visto'),
(572, 'ip_address', '', 'IP Address', 'عنوان IP', 'IP adres', 'Adresse IP', 'IP Adresse', 'Dirección IP'),
(573, 'choose_payment_method', '', 'Choose a payment method', 'اختيار طريقة الدفع', 'Kies een betaal methode', 'Choisissez une méthode de paiement', 'Wählen Sie eine Bezahlungsart', 'Elija un método de pago'),
(574, 'paypal', '', 'PayPal', 'باي بال', 'PayPal', 'Pay Pal', 'PayPal', 'PayPal'),
(575, 'checkout_text', '', '2Checkout', '2Checkout', '2Checkout', '2Checkout', '2Kasse', '2 Checkout'),
(576, 'address', '', 'Address', 'عنوان', 'Adres', 'Adresse', 'Adresse', 'Dirección'),
(577, 'city', '', 'City', 'مدينة', 'stad', 'Ville', 'Stadt', 'Ciudad'),
(578, 'state', '', 'State', 'حالة', 'Staat', 'Etat', 'Zustand', 'Estado'),
(579, 'zip', '', 'Zip', 'الرمز البريدي', 'ritssluiting', 'Zip *: français', 'Postleitzahl', 'Cremallera'),
(580, 'phone_number', '', 'Phone', 'هاتف', 'Telefoon', 'Téléphone', 'Telefon', 'Teléfono'),
(581, 'card_number', '', 'Card Number', 'رقم البطاقة', 'Kaartnummer', 'Numéro de carte', 'Kartennummer', 'Número de tarjeta'),
(582, 'checkout_declined', '', 'Your payment was declined, please contact your bank or card issuer and make sure you have the required funds.', 'تم رفض دفعتك ، يرجى الاتصال بالمصرف أو مصدر البطاقة والتأكد من أن لديك الأموال المطلوبة.', 'Uw betaling is geweigerd. Neem contact op met uw bank of creditcardmaatschappij en zorg dat u over het benodigde geld beschikt.', 'Votre paiement a été refusé, veuillez contacter votre banque ou votre émetteur de carte et assurez-vous de disposer des fonds nécessaires.', 'Ihre Zahlung wurde abgelehnt. Wenden Sie sich an Ihre Bank oder Ihren Kartenaussteller, und vergewissern Sie sich, dass Sie über das erforderliche Guthaben verfügen.', 'Su pago fue rechazado, póngase en contacto con su banco o con el emisor de la tarjeta y asegúrese de tener los fondos necesarios.'),
(583, 'credit_card', '', 'Credit Card', 'بطاقة الائتمان', 'Kredietkaart', 'Carte de crédit', 'Kreditkarte', 'Tarjeta de crédito'),
(584, 'c_payment', '', 'Confirming your payment, please wait..', 'لتأكيد الدفع ، يرجى الانتظار ..', 'Bevestiging van uw betaling, even geduld aub ..', 'Confirmant votre paiement, veuillez patienter ..', 'Bitte warten Sie, bis die Zahlung bestätigt wurde.', 'Confirmando su pago, por favor espere ..'),
(585, 'payment_declined', '', 'Payment declined, please try again later.', 'تم رفض الدفع ، يرجى المحاولة مرة أخرى لاحقًا.', 'Betaling geweigerd. Probeer het later opnieuw.', 'Paiement refusé, veuillez réessayer plus tard.', 'Zahlung abgelehnt. Bitte versuchen Sie es später erneut.', 'Pago rechazado, inténtalo de nuevo más tarde.'),
(586, 'bank_transfer', '', 'Bank transfer', 'تحويل مصرفي', 'Bankoverschrijving', 'Virement bancaire', 'Überweisung', 'Transferencia bancaria'),
(587, 'browse_to_upload', '', 'Browse To Upload', 'استعرض لتحميل', 'Blader naar uploaden', 'Parcourir pour télécharger', 'Zum Hochladen durchsuchen', 'Navegar para subir'),
(588, 'bank_transfer_request', '', 'Your request has been successfully sent, we will notify you once it\'s approved', 'تم إرسال طلبك بنجاح ، وسوف نخطرك بمجرد الموافقة عليه', 'Uw verzoek is succesvol verzonden, wij zullen u op de hoogte brengen zodra het is goedgekeurd', 'Votre demande a été envoyée avec succès, nous vous en informerons une fois approuvée', 'Ihre Anfrage wurde erfolgreich gesendet. Wir werden Sie benachrichtigen, sobald sie genehmigt wurde', 'Su solicitud ha sido enviada exitosamente, le notificaremos una vez que sea aprobada.'),
(589, 'bank_decline', '', 'Your bank receipt has been declined!', 'تم رفض إيصالك المصرفي!', 'Uw bankbewijs is geweigerd!', 'Votre ticket de banque a été refusé!', 'Ihre Bankquittung wurde abgelehnt!', 'Su recibo bancario ha sido rechazado!'),
(590, 'bank_pro', '', 'Your bank receipt has been approved!', 'تمت الموافقة على إيصالك المصرفي!', 'Uw bank-factuur is goedgekeurd!', 'Votre reçu de banque a été approuvé!', 'Ihre Bankquittung wurde genehmigt!', 'Su recibo bancario ha sido aprobado!'),
(591, 'upgrade_account', '', 'Please upgrade your account to upload videos', 'يرجى ترقية حسابك لتحميل مقاطع الفيديو', 'Voer een upgrade van uw account uit om video\'s te uploaden', 'Veuillez mettre à jour votre compte pour télécharger des vidéos.', 'Bitte aktualisiere dein Konto, um Videos hochzuladen', 'Por favor actualice su cuenta para subir videos'),
(592, 'duration_fromat', '', 'Duration format must be like 03:33', 'يجب أن يكون تنسيق المدة مثل 03:33', 'Duurindeling moet ongeveer 03:33 zijn', 'Le format de la durée doit être comme 03:33', 'Das Dauerformat muss 03:33 sein', 'Formato de duración debe ser como 03:33'),
(593, 'age_block_extra', '', 'Please note that if you are under 18, you won\'t be able to access this site. ', 'يرجى ملاحظة أنه إذا كان عمرك أقل من 18 عامًا ، فلن تتمكن من الوصول إلى هذا الموقع.', 'Houd er rekening mee dat als u jonger bent dan 18 jaar, u geen toegang kunt krijgen tot deze site.', 'Veuillez noter que si vous avez moins de 18 ans, vous ne pourrez pas accéder à ce site.', 'Bitte beachten Sie, dass Sie unter 18 Jahren nicht auf diese Website zugreifen können.', 'Tenga en cuenta que si es menor de 18 años, no podrá acceder a este sitio.'),
(594, 'subscriber_price', '', 'Subscription Price (How much users will pay to subscribe to your channel?)', 'سعر الاشتراك (كم يدفع المستخدمون للاشتراك في قناتك؟)', 'Abonnementsprijs (Hoeveel gebruikers betalen zich om zich te abonneren op je kanaal?)', 'Prix de l\'abonnement (Combien d\'utilisateurs paieront-ils pour s\'abonner à votre chaîne?)', 'Abonnementpreis (Wie viel Nutzer zahlen, um Ihren Kanal zu abonnieren?)', 'Precio de suscripción (¿Cuánto pagarán los usuarios para suscribirse a tu canal?)'),
(595, 'subscribe_earnings', '', 'Subscription Earnings', 'أرباح الاشتراك', 'Abonnementswinst', 'Gains d\'abonnement', 'Abo-Einnahmen', 'Ingresos de suscripción'),
(596, 'buy_or_subscribe', '', 'Buy now, OR unlock all content of {{USERNAME}} for just {{PRICE}} a month!', 'اشتر الآن ، أو افتح جميع محتويات {{USERNAME}} لمجرد {{PRICE}} في الشهر فقط!', 'Koop nu, OF ontgrendel alle content van {{USERNAME}} voor slechts {{PRICE}} per maand!', 'Achetez maintenant OU déverrouillez tout le contenu de {{USERNAME}} pour seulement {{PRICE}} un mois!', 'Kaufen Sie jetzt oder schalten Sie den gesamten Inhalt von {{USERNAME}} für nur {{PRICE}} einen Monat frei!', '¡Compre ahora, O desbloquee todo el contenido de {{USERNAME}} por solo {{PRICE}} al mes!'),
(597, 'subscribe_to_see', '', 'Subscribe for {{PRICE}} and unlock all the videos.', 'اشترك في {{PRICE}} واطلق العنان لجميع مقاطع الفيديو.', 'Abonneer je op {{PRICE}} en ontgrendel alle video\'s.', 'Abonnez-vous à {{PRICE}} et déverrouillez toutes les vidéos.', 'Abonniere {{PRICE}} und schalte alle Videos frei.', 'Suscríbete para {{PRICE}} y desbloquea todos los videos.'),
(598, 'video_purchase', '', 'Video purchases', 'مشتريات الفيديو', 'Video-aankopen', 'Achat de vidéos', 'Videokäufe', 'Compras de video'),
(599, 'unsubscribe_from_channel', '', 'Are you sure you want to unsubscribe? This action can\'t be undo.', 'هل أنت متأكد أنك تريد إلغاء الاشتراك؟ هذا الإجراء لا يمكن التراجع.', 'Weet je zeker dat je je wilt afmelden? Deze actie kan niet ongedaan maken.', 'Êtes-vous sûr de vouloir résilier votre abonnement? Cette action ne peut pas être annuler.', 'Sind Sie sicher, dass Sie sich abmelden wollen? Diese Aktion kann nicht rückgängig gemacht werden.', '¿Seguro que desea darse de baja? Esta acción no se puede deshacer.'),
(600, 'file_not_supported', '', 'File format is not supported', 'لا يتم اعتماد تنسيق الملف', 'Bestandsformaat wordt niet ondersteund', 'Format de fichier non pris en charge', 'Datei-Format wird nicht unterstützt', 'Formato de archivo no es compatible'),
(601, 'report_copyright', '', 'Report Copyright', 'تقرير حقوق الطبع والنشر', 'rapport Copyright', 'rapport droit d\'auteur', 'Bericht Urheberrecht', 'informe de Derechos de autor'),
(602, 'create_notice', '', 'Create DMCA take down notice', 'خلق اتخاذ DMCA أسفل إشعار', 'Maak DMCA take down kennisgeving', 'Créer DMCA abattre avis', 'Erstellen DMCA take down Ankündigung', 'Crear DMCA acabar aviso'),
(603, 'describe_notice', '', 'Please describe your request carefully and as much as you can, note that false DMCA requests can lead to account termination.', 'يرجى وصف طلبك بعناية وبقدر ما يمكن، لاحظ أن طلبات DMCA كاذبة يمكن أن يؤدي إلى إنهاء الحساب.', 'Beschrijf uw verzoek zorgvuldig en zoveel als je kunt, er rekening mee dat valse DMCA verzoeken kunnen leiden tot beëindiging van het account.', 'S\'il vous plaît décrire votre demande avec soin et autant que vous le pouvez, notez que les fausses demandes DMCA peuvent conduire à la résiliation du compte.', 'Bitte beschreiben Sie Ihre Anfrage sorgfältig und so viel Sie können, beachten Sie, dass falsche DMCA-Anfragen zur Kündigung des Kontos führen kann.', 'Por favor describa su solicitud con cuidado y lo más que puede, tenga en cuenta que las solicitudes DMCA falsas pueden dar lugar a la cancelación de cuenta.'),
(604, 'confirm_1_text', '', 'I have a good faith belief that use of the copyrighted work described above is not authorized by the copyright owner, its agent or the law', 'لدي اعتقاد راسخ بأن استخدام من الطبع والنشر المذكورة أعلاه غير مخول من قبل صاحب حق المؤلف أو وكيله أو القانون', 'Ik heb een goed vertrouwen geloven dat het gebruik van het auteursrechtelijk beschermde werk hiervoor geen toestemming is verleend door de auteursrechthebbende, diens vertegenwoordiger of de wet', 'J\'ai une bonne foi que l\'utilisation de l\'œuvre protégée décrite ci-dessus ne sont pas autorisée par le titulaire du droit d\'auteur, son agent ou la loi', 'Ich habe einen guten Glauben, die oben beschrieben der urheberrechtlich geschützten Arbeit verwenden wird nicht vom Inhaber des Urheberrechts, dessen Agenten oder per Gesetz', 'Tengo una buena fe que el uso de la obra con derechos de autor descrito anteriormente no está autorizado por el propietario del copyright, su agente o la ley'),
(605, 'confirm_2_text', '', 'I confirm that I am the copyright owner or am authorised to act on behalf of the owner of an exclusive right that is allegedly infringed.', 'أؤكد أنني صاحب حق المؤلف أو مرخص لي بالتصرف نيابة عن صاحب الحق الحصري الذي يزعم انتهاكه.', 'Ik bevestig dat ik de eigenaar van het auteursrecht of bevoegd ben te handelen namens de eigenaar van een exclusief recht dat de vermeende inbreuk.', 'Je confirme que je suis le propriétaire du droit d\'auteur ou autorisé à agir au nom du propriétaire d\'un droit exclusif qui aurait été violé.', 'Ich bestätige, dass ich der Inhaber des Urheberrechts bin oder bin, im Namen des Inhabers eines exklusiven Rechts zu handeln, das angeblich verletzt wird.', 'Confirmo que soy el propietario del copyright o estoy autorizado a actuar en nombre del propietario de un derecho exclusivo que presuntamente se ha infringido.'),
(606, 'confirm_check_text', '', 'Please select the checkboxs below if you own the copyright.', 'يرجى تحديد مربعات الاختيار أدناه إذا كنت تملك حقوق التأليف والنشر.', 'Selecteer de vakjes hieronder als u het copyright bezit.', 'S\'il vous plaît cocher les cases ci-dessous si vous possédez le droit d\'auteur.', 'Bitte wählen Sie die Kontrollkästchen unten, wenn Sie das Urheberrecht besitzen.', 'Por favor, seleccione las casillas de verificación a continuación si es el propietario del derecho de autor.'),
(607, 'personal_photo', '', 'Your Personal Photo', 'صورتك الشخصية', 'Uw Personal Photo', 'Votre Photo personnelle', 'Ihr persönliches Foto', 'Su foto personal'),
(608, 'passport_id', '', 'Passport / ID card', 'جواز السفر / بطاقة الهوية', 'Paspoort / ID-kaart', 'Passeport / carte d\'identité', 'Reisepass / Personalausweis', 'Pasaporte / tarjeta de ID'),
(609, 'additional_details', '', 'Additional details about your self (Optional)', 'تفاصيل إضافية حول نفسك (اختياري)', 'Aanvullende informatie over jezelf (optioneel)', 'Des détails supplémentaires au sujet de votre auto (en option)', 'Weitere Einzelheiten über sich selbst (Optional)', 'Detalles adicionales acerca de su auto (opcional)'),
(610, 'submit_monetization_request_error', '', 'You can not submit monetization request until the previous request has been accepted / rejected.', 'لا يمكنك تقديم طلب تسييل حتى تم قبول الطلب السابق / رفض.', 'U kunt inkomsten geen verzoek indienen tot de vorige aanvraag is geaccepteerd / verworpen.', 'Vous ne pouvez pas soumettre la demande de monétisation jusqu\'à ce que la demande précédente a été acceptée / refusée.', 'Sie können nicht Monetisierung Anfrage, bis die vorherige Anfrage wurde akzeptiert / abgelehnt einreichen.', 'No se puede enviar la solicitud de monetización hasta que la solicitud anterior ha sido aceptado / rechazado.'),
(611, 'monetization_accept', '', 'Your monetization request has been approved!', 'تمت الموافقة على طلب تسييل الخاص بك!', 'Je verzoek is goedgekeurd!', 'Votre demande de monétisation a été approuvée!', 'Ihre Monetisierung Anfrage wurde genehmigt!', 'Su solicitud de monetización ha sido aceptado!'),
(612, 'monetization_decline', '', 'Your monetization request has been declined!', 'تم رفض طلب تسييل الخاص بك!', 'Je verzoek is afgewezen!', 'Votre demande de monétisation a été refusée!', 'Ihre Monetisierung Anfrage wurde abgelehnt!', 'Su solicitud ha sido rechazada monetización!'),
(613, 'unverified', '', 'Unverified', 'غير مثبت عليه', 'geverifieerde', 'Non vérifié', 'Ungeprüft', 'Inconfirmado'),
(614, 'confirmation_message_email_sent', '', 'A confirmation email has been sent.', 'تم إرسال رسالة تأكيد بالبريد الإلكتروني.', 'Een bevestigings e-mail is verzonden.', 'Un e-mail de confirmation a été envoyé.', 'Eine Bestätigungs-Mail wurde abgeschickt.', 'Un correo electrónico de confirmación ha sido enviado.'),
(615, 'wrong_code', '', 'Wrong code', 'رمز خاطئ', 'Verkeerde code', 'Mauvais code', 'Falscher Code', 'Codigo erroneo'),
(616, 'new_email_verified', '', 'Congratulations, your email is verified. ', 'تهانينا، يتم التحقق من بريدك الإلكتروني.', 'Gefeliciteerd, uw e-mail geverifieerd.', 'Félicitations, votre e-mail est vérifiée.', 'Gratulation, Ihre E-Mail bestätigt.', 'Felicitaciones, su correo electrónico se verifica.'),
(617, 'rentals', '', 'Rentals', 'الإيجارات', 'Rentals', 'Les locations', 'Vermietungen', 'Alquileres'),
(618, 'rented', '', 'Rented', 'مؤجر', 'verhuurd', 'Loué', 'Gemietet', 'Alquilado'),
(619, 'expiry', '', 'Expiry', 'انقضاء', 'verstrijken', 'Expiration', 'Ablauf', 'Expiración'),
(620, 'paid', '', 'Paid', 'دفع', 'Betaald', 'Payé', 'Bezahlt', 'Pagado'),
(621, 'rented_movies', '', 'Rented Movies', 'أفلام مستأجرة', 'Gehuurde films', 'Films loués', 'Leihfilme', 'Películas alquiladas'),
(622, 'rented_videos', '', 'Rented Videos', 'مقاطع الفيديو المستأجرة', 'Gehuurde video&#39;s', 'Vidéos louées', 'Gemietete Videos', 'Videos alquilados'),
(623, 'you_have_to_rent_video', '', 'This video is not available, you have to rent the video to watch it.', 'هذا الفيديو غير متاح ، يجب عليك استئجار الفيديو لمشاهدته.', 'Deze video is niet beschikbaar, je moet de video huren om hem te bekijken.', 'Cette vidéo n&#39;est pas disponible, vous devez louer la vidéo pour la regarder.', 'Dieses Video ist nicht verfügbar. Sie müssen das Video ausleihen, um es anzusehen.', 'Este video no está disponible, debe alquilar el video para verlo.'),
(624, 'your_ads_will_stop', '', 'Your ads will stop running once you reach this amount.', 'سيتوقف عرض إعلاناتك بمجرد وصولك إلى هذا المبلغ.', '', 'Vos annonces ne seront plus diffusées une fois ce montant atteint.', 'Ihre Anzeigen werden nicht mehr geschaltet, sobald Sie diesen Betrag erreicht haben.', 'Sus anuncios dejarán de publicarse una vez que alcance esta cantidad.'),
(625, 'commented_ur_actvity', '', 'commented on your activity.', '', 'heeft gereageerd op je activiteit.', 'a commenté votre activité.', 'hat Ihre Aktivität kommentiert.', 'comentó tu actividad.'),
(626, 'choose_which_categories', '', 'Choose which categories you would like to see on your home page.', 'اختر الفئات التي ترغب في رؤيتها على صفحتك الرئيسية.', 'Kies welke categorieën u op uw startpagina wilt zien.', 'Choisissez les catégories que vous souhaitez voir sur votre page d&#39;accueil.', 'Wählen Sie aus, welche Kategorien Sie auf Ihrer Homepage sehen möchten.', 'Elija qué categorías le gustaría ver en su página de inicio.'),
(627, 'commented_ur_activity', '', 'commented on your activity.', 'علق على نشاطك.', 'heeft gereageerd op je activiteit.', 'a commenté votre activité.', 'hat Ihre Aktivität kommentiert.', 'comentó tu actividad.'),
(628, 'no_more_activity', '', 'No activities to view', 'لا توجد أنشطة للعرض', 'Geen activiteiten om te bekijken', 'Aucune activité à voir', 'Keine Aktivitäten zum Anzeigen', 'No hay actividades para ver'),
(629, 'delete_activity_confirmation', '', 'Are you sure you want to delete this activity? This action can\'t be undo.', 'هل أنت متأكد أنك تريد حذف هذا النشاط؟ لا يمكن التراجع عن هذا الإجراء.', 'Weet u zeker dat u deze activiteit wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.', 'Voulez-vous vraiment supprimer cette activité? Cette action ne peut pas être annulée.', 'Möchten Sie diese Aktivität wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden.', '¿Estás seguro de que deseas eliminar esta actividad? Esta acción no se puede deshacer.'),
(630, 'post_edited', '', 'Your post has been successfully updated.', 'تم تحديث مشاركتك بنجاح.', 'Uw bericht is succesvol bijgewerkt.', 'Votre message a été mis à jour avec succès.', 'Ihr Beitrag wurde erfolgreich aktualisiert.', 'Su publicación ha sido actualizada con éxito.'),
(631, 'edit_activity', '', 'Edit Activity', 'تحرير النشاط', 'Activiteit bewerken', 'Modifier l&#39;activité', 'Aktivität bearbeiten', 'Editar actividad'),
(632, 'disliked_ur_activity', '', 'disliked your activity', 'لم يعجبك نشاطك', 'vond je activiteit niet leuk', 'n&#39;a pas aimé votre activité', 'mochte deine Aktivität nicht', 'no me gustó tu actividad'),
(633, 'liked_ur_activity', '', 'liked your activity', 'اعجبني نشاطك', 'vond je activiteit leuk', 'aimé votre activité', 'mochte Ihre Aktivität', 'me gustó tu actividad'),
(634, 'activities', '', 'Activities', 'أنشطة', 'Activiteiten', 'Activités', 'Aktivitäten', 'Ocupaciones'),
(635, 'no_activities_found_for_now', '', 'No activities found for now.', 'لم يتم العثور على أنشطة في الوقت الحالي.', 'Momenteel geen activiteiten gevonden.', 'Aucune activité trouvée pour l&#39;instant.', 'Derzeit wurden keine Aktivitäten gefunden.', 'No se han encontrado actividades por ahora.'),
(636, 'create_post', '', 'Create Post', 'إنشاء مشاركة', 'Maak bericht', 'Créer une publication', 'Beitrag erstellen', 'Crear publicación'),
(637, 'create_new_post', '', 'Create new post', 'إنشاء منشور جديد', 'Nieuw bericht maken', 'Créer un nouveau message', 'Neuen Beitrag erstellen', 'Crear nueva publicación'),
(638, 'image', '', 'Image', 'صورة', 'Beeld', 'Image', 'Bild', 'Imagen'),
(639, 'write_message', '', 'Write a message...', 'اكتب رسالة...', 'Schrijf een bericht...', 'Écrire un message...', 'Eine Nachricht schreiben...', 'Escribe un mensaje...'),
(640, 'post_created', '', 'Your post has been successfully created.', 'تم إنشاء مشاركتك بنجاح.', 'Uw bericht is succesvol aangemaakt.', 'Votre message a été créé avec succès.', 'Ihr Beitrag wurde erfolgreich erstellt.', 'Tu publicación ha sido creada con éxito.'),
(641, 'recent_activities', '', 'Most recent activities', 'أحدث الأنشطة', 'Meest recente activiteiten', 'Activités les plus récentes', 'Letzte Aktivitäten', 'Actividades mas recientes'),
(642, 'total_ads_limit', '', 'Max limit for your ads campaign', 'الحد الأقصى لحملتك الإعلانية', 'Maximumlimiet voor uw advertentiecampagne', 'Limite maximale pour votre campagne d&#39;annonces', 'Maximales Limit für Ihre Werbekampagne', 'Límite máximo para su campaña publicitaria'),
(643, 'notification_sent', '', 'Your notification has been successfully sent', 'تم إرسال الإشعار الخاص بك بنجاح', 'Uw melding is succesvol verzonden', 'Votre notification a bien été envoyée', 'Ihre Benachrichtigung wurde erfolgreich gesendet', 'Su notificación ha sido enviada exitosamente'),
(644, 'ad_lifetime_limit', '', 'Total ads spending limit', 'إجمالي الإنفاق الإنفاق الحد', 'Totale uitgavenlimiet voor advertenties', 'Limite totale des dépenses publicitaires', '', 'Límite de gasto total en anuncios'),
(645, 'added_video_playlist', '', 'added a new video to their playlist', 'إضافة مقطع فيديو جديد إلى قائمة التشغيل الخاصة بهم', 'heeft een nieuwe video toegevoegd aan hun afspeellijst', 'a ajouté une nouvelle vidéo à sa playlist', 'hat ein neues Video zu ihrer Wiedergabeliste hinzugefügt', 'agregó un nuevo video a su lista de reproducción'),
(646, 'fav_category', '', 'Favourite category', 'الفئة المفضلة', 'Favoriete categorie', 'Catégorie préférée', 'Lieblingskategorie', 'Categoría favorita'),
(647, 'unsubscribed_u_playlist', '', 'unsubscribed from your playlist', 'ألغيت اشتراكك في قائمة التشغيل', 'afgemeld bij uw afspeellijst', 'désabonné de votre playlist', 'von Ihrer Wiedergabeliste abgemeldet', 'darse de baja de su lista de reproducción'),
(648, 'subscribed_u_playlist', '', 'subscribed to your playlist', 'مشترك في قائمة التشغيل الخاصة بك', 'geabonneerd op je afspeellijst', 'abonné à votre playlist', 'Abonniert Ihre Wiedergabeliste', 'suscrito a tu lista de reproducción'),
(649, 'subscribe_to_playlist', '', 'Subscribe for Notifications', 'اشترك للحصول على الإخطارات', 'Meld u aan voor meldingen', 'Abonnez-vous aux notifications', 'Benachrichtigungen abonnieren', 'Suscríbase para recibir notificaciones'),
(650, 'subscribed_to_playlist', '', 'Subscribed to Playlist Notifications', 'مشترك في إخطارات قائمة التشغيل', 'Geabonneerd op meldingen voor afspeellijsten', 'Abonné aux notifications de playlist', 'Playlist-Benachrichtigungen abonniert', 'Suscrito a notificaciones de listas de reproducción'),
(651, 'rent_price', '', 'Rent price', 'سعر الايجار', 'Huurprijs', 'Prix ​​de location', 'Mietpreis', 'Precio de alquiler'),
(652, 'video_rent_price_error', '', 'The video rent price should be numeric and greater than', 'يجب أن يكون سعر إيجار الفيديو رقميًا وأكبر من', 'De huurprijs van de video moet numeriek zijn en groter dan', 'Le prix de location de la vidéo doit être numérique et supérieur à', 'Der Videomietpreis sollte numerisch und höher als sein', 'El precio del alquiler del video debe ser numérico y mayor que'),
(653, 'video_rent_price', '', 'This video rent price is:', 'سعر إيجار الفيديو هذا هو:', 'Deze video huurprijs is:', 'Le prix de location de cette vidéo est:', 'Dieser Videomietpreis ist:', 'Este precio de alquiler de video es:'),
(654, 'rent_to_see', '', 'rented your video', 'استأجر الفيديو الخاص بك', 'je video gehuurd', 'loué votre vidéo', 'habe dein Video ausgeliehen', 'alquiló su video'),
(655, 'rent_time_will', '', 'Rent period will end at', 'فترة الإيجار ستنتهي في', 'Huurperiode eindigt om', 'La période de location se terminera à', 'Die Mietzeit endet um', 'El período de alquiler finalizará a las'),
(656, 'please_login_to_see_video', '', 'Please login to watch this video', 'الرجاء تسجيل الدخول لمشاهدة هذا الفيديو', 'Log in om deze video te bekijken', 'Veuillez vous connecter pour regarder cette vidéo', 'Bitte loggen Sie sich ein, um dieses Video anzusehen', 'Inicia sesión para ver este video'),
(657, 'suspend_upload', '', 'Suspend Upload', 'تعليق التحميل', 'Onderbreken van uploaden', 'Suspendre le téléchargement', 'Upload anhalten', 'Suspender carga'),
(658, 'suspend_import', '', 'Suspend Import', 'تعليق الاستيراد', 'Importeren onderbreken', 'Suspendre l\'importation', 'Import anhalten', 'Suspender importación'),
(659, 'live', '', 'Live', 'حي', 'Leven', 'Vivre', 'Leben', 'En Vivo'),
(660, 'end_live', '', 'End live', 'إنهاء العيش', 'Einde live', 'Terminer en direct', 'Live beenden', 'Terminar en vivo'),
(661, 'go_live', '', 'Go live', 'انطلق مباشرة', 'Ga leven', 'Allez vivre', 'Geh Leben', 'Ir a vivir'),
(662, 'offline', '', 'Offline', 'غير متصل على الانترنت', 'Offline', 'Hors ligne', 'Offline', 'Desconectado'),
(663, 'stream_has_ended', '', '{user} stream has ended.', 'انتهى دفق {user}.', '{user} stream is beëindigd.', 'Le flux de {utilisateur} est terminé.', 'Der {Benutzer} Stream wurde beendet.', 'La transmisión de {user} ha finalizado.'),
(664, 'was_live', '', 'was live', 'كان حيا', 'was live', 'était en direct', 'war live', 'estaba en vivo'),
(665, 'joined_live_video', '', 'joined live stream', 'انضم إلى البث المباشر', 'is lid geworden van livestream', 'rejoint la diffusion en direct', 'Live-Stream beigetreten', 'se unió a la transmisión en vivo'),
(666, 'left_live_video', '', 'left live stream', 'غادر البث المباشر', 'live stream verlaten', 'diffusion en direct gauche', 'Live-Stream verlassen', 'dejó la transmisión en vivo'),
(667, 'started_live_video', '', 'started a live stream.', 'بدأ البث المباشر.', 'startte een livestream.', 'a commencé une diffusion en direct.', 'startete einen Live-Stream.', 'comenzó una transmisión en vivo.'),
(668, 'live_videos', '', 'Live videos', 'مقاطع فيديو حية', 'Live video\'s', 'Vidéos en direct', 'Live-Videos', 'Videos en vivo'),
(669, 'paystack', '', 'Paystack', 'Paystack', 'Paystack', 'Paystack', 'Paystack', 'Pila de pagos'),
(670, 'cashfree', '', 'cashfree', 'كاش فري', 'zonder contant geld', 'sans argent', 'bargeldlos', 'sin efectivo'),
(671, 'razorpay', '', 'Razorpay', 'رازورباي', 'Razorpay', 'Razorpay', 'Razorpay', 'Razorpay'),
(672, 'paysera', '', 'Paysera', 'Paysera', 'Paysera', 'Paysera', 'Paysera', 'Paysera'),
(673, 'iyzipay', '', 'Iyzipay', 'إيزيباي', 'Iyzipay', 'Iyzipay', 'Iyzipay', 'Iyzipay'),
(674, 'move_balance_to_wallet', '', 'Move your balance to your wallet so you can use it to create ads and use other features.', 'انقل رصيدك إلى محفظتك حتى تتمكن من استخدامه لإنشاء إعلانات واستخدام ميزات أخرى.', 'Verplaats uw saldo naar uw portemonnee, zodat u deze kunt gebruiken om advertenties te maken en andere functies te gebruiken.', 'Déplacez votre solde vers votre portefeuille afin de pouvoir l\'utiliser pour créer des publicités et utiliser d\'autres fonctionnalités.', 'Verschieben Sie Ihr Guthaben in Ihre Brieftasche, damit Sie damit Anzeigen erstellen und andere Funktionen verwenden können.', 'Mueva su saldo a su billetera para que pueda usarlo para crear anuncios y usar otras funciones.'),
(675, 'more_than_balance', '', 'Amount can`t be greater than your balance', 'لا يمكن أن يكون المبلغ أكبر من رصيدك', 'Het bedrag kan niet hoger zijn dan uw saldo', 'Le montant ne peut pas être supérieur à votre solde', 'Der Betrag kann nicht höher sein als Ihr Guthaben', 'La cantidad no puede ser mayor que su saldo'),
(676, 'no_balance_to_move', '', 'You don`t have enough balance to transfer', 'ليس لديك رصيد كافي للتحويل', 'U heeft niet genoeg saldo om over te boeken', 'Vous n\'avez pas assez de solde pour transférer', 'Sie haben nicht genug Guthaben, um zu übertragen', 'No tienes saldo suficiente para transferir'),
(677, 'points', '', 'Points', 'نقاط', 'Punten', 'Points', 'Punkte', 'Puntos'),
(678, 'comment_video', '', 'Earn {point} points by commenting any video', 'اربح {point} نقطة عن طريق التعليق على أي فيديو', 'Verdien {punt} punten door op een video te reageren', 'Gagnez {point} points en commentant n\'importe quelle vidéo', 'Sammeln Sie {Punkte} Punkte, indem Sie ein Video kommentieren', 'Gana {point} puntos comentando cualquier video'),
(679, 'like_video_point', '', 'Earn {point} points by like any video', 'اربح {point} نقطة مثل أي فيديو', 'Verdien {punt} punten door zoals elke video', 'Gagnez {point} points comme n\'importe quelle vidéo', 'Verdiene {Punkt} Punkte wie in jedem Video', 'Gana {point} puntos por \"Me gusta\" en cualquier video'),
(680, 'dislike_video_point', '', 'Earn {point} points by dislike any video', 'اربح {point} نقطة مقابل عدم الإعجاب بأي فيديو', 'Verdien {punt} punten door een video niet leuk te vinden', 'Gagnez {point} points en n\'aimant aucune vidéo', 'Verdiene {Punkt} Punkte, indem du ein Video nicht magst', 'Gana {point} puntos si no te gusta un video'),
(681, 'upload_video_point', '', 'Earn {point} points by upload any video', 'اربح {point} نقطة عن طريق تحميل أي فيديو', 'Verdien {punt} punten door een video te uploaden', 'Gagnez {point} points en téléversant n\'importe quelle vidéo', 'Sammeln Sie {point} Punkte, indem Sie ein Video hochladen', 'Gana {point} puntos subiendo cualquier video'),
(682, 'watch_video_point', '', 'Earn {point} points by watching any video', 'اربح {point} نقطة من خلال مشاهدة أي فيديو', 'Verdien {punt} punten door een video te bekijken', 'Gagnez {point} points en regardant n\'importe quelle vidéo', 'Sammeln Sie {point} Punkte, indem Sie sich ein Video ansehen', 'Gana {point} puntos viendo cualquier video'),
(683, 'video_type', '', 'Video Type', 'نوع الفيديو', 'Type video', 'Type de vidéo', 'Videotyp', 'Tipo de video'),
(684, 'stock_video', '', 'Stock Video', 'فيديو الأسهم', 'Voorraadvideo', 'Stock vidéo', 'Stock Video', 'Vídeo de archivo'),
(685, 'movie', '', 'Movie', 'فيلم', 'Film', 'Film', 'Film', 'Película'),
(686, 'license_type', '', 'License Type', 'نوع الرخصة', 'Licentie type', 'Type de licence', 'Lizenz-Typ', 'Tipo de licencia'),
(687, 'rights_managed_license', '', 'Rights Managed (RM) License', 'ترخيص إدارة الحقوق (RM)', 'Rights Managed (RM) -licentie', 'Licence Rights Managed (RM)', 'Rights Managed (RM) -Lizenz', 'Licencia de derechos gestionados (RM)'),
(688, 'editorial_use_license', '', 'Editorial Use License', 'رخصة الاستخدام التحريري', 'Licentie voor redactioneel gebruik', 'Licence d\'utilisation éditoriale', 'Redaktionelle Nutzungslizenz', 'Licencia de uso editorial'),
(689, 'royalty_free_license', '', 'Royalty Free License (RF)', 'ترخيص بدون حقوق ملكية (RF)', 'Royalty-vrije licentie (RF)', 'Licence libre de droits (RF)', 'Lizenzfreie Lizenz (RF)', 'Licencia libre de derechos (RF)'),
(690, 'royalty_free_extended_license', '', 'Royalty Free Extended License', 'رخصة ممتدة بدون حقوق ملكية', 'Royalty-vrije uitgebreide licentie', 'Licence étendue libre de droits', 'Lizenzfreie erweiterte Lizenz', 'Licencia extendida libre de derechos'),
(691, 'creative_commons_license', '', 'Creative Commons License', 'رخصة المشاع الإبداعي', 'Creative Commons-licentie', 'Licence Creative Commons', 'Creative Commons License', 'Licencia Creative Commons'),
(692, 'public_domain', '', 'Public Domain', 'المجال العام', 'Publiek domein', 'Domaine public', 'Public Domain', 'Dominio publico'),
(693, 'stock_videos', '', 'Stock Videos', 'مقاطع فيديو الأسهم', 'Stockvideo\'s', 'Vidéos de stock', 'Stock Videos', 'Vídeos de archivo'),
(694, 'min_price', '', 'Min Price', 'سعر دقيقة', 'Min. Prijs', 'Prix ​​min', 'Mindestpreis', 'Precio min'),
(695, 'max_price', '', 'Max Price', 'أقصى سعر', 'Max prijs', 'Prix ​​maximum', 'Maximaler Preis', 'Precio máximo'),
(696, 'stream_has_ended', '', '{user} stream has ended.', 'انتهى دفق {user}.', '{user} stream is beëindigd.', 'Le flux de {utilisateur} est terminé.', 'Der {Benutzer} Stream wurde beendet.', 'La transmisión de {user} ha finalizado.'),
(697, 'my_information', '', 'My Information', 'معلوماتي', 'Mijn informatie', 'Mon information', 'Meine Information', 'Mi informacion'),
(698, 'age', '', 'Age', 'عمر', 'Leeftijd', 'Âge', 'Alter', 'Edad'),
(699, 'to_download', '', 'Please choose which information you would like to download', 'الرجاء اختيار المعلومات التي ترغب في تنزيلها', 'Kies welke informatie u wilt downloaden', 'Veuillez choisir les informations que vous souhaitez télécharger', 'Bitte wählen Sie aus, welche Informationen Sie herunterladen möchten', 'Elija qué información desea descargar'),
(700, 'member_type', '', 'Member Type', 'نوع العضو', 'Type lid', 'Type de membre', 'Mitgliedertyp', 'Tipo de miembro'),
(701, 'pro_member', '', 'Pro Member', 'عضو محترف', 'Pro-lid', 'Membre Pro', 'Pro Mitglied', 'Miembro Pro'),
(702, 'free_member', '', 'Free Member', 'عضو مجاني', 'gratis lid', 'Membre gratuit', 'Freies Mitglied', 'miembro gratuito'),
(703, 'google', '', 'Google', 'غوغل', 'Google', 'Google', 'Google', 'Google'),
(704, 'generate_file', '', 'Generate file', 'توليد ملف', 'Genereer bestand', 'Générer un fichier', 'Datei generieren', 'Generar archivo'),
(705, 'download_file', '', 'Download File', 'تحميل الملف', 'Download bestand', 'Télécharger un fichier', 'Download-Datei', 'Descargar archivo'),
(706, 'file_ready', '', 'Your file is ready to download!', 'ملفك جاهز للتنزيل!', 'Je bestand is klaar om te downloaden!', 'Votre fichier est prêt à être téléchargé!', 'Ihre Datei kann heruntergeladen werden!', '¡Su archivo está listo para descargar!'),
(707, 'upload_trailer', '', 'Upload Trailer', 'تحميل مقطورة', 'Trailer uploaden', 'Télécharger la bande-annonce', 'Trailer hochladen', 'Subir tráiler'),
(708, 'video_trailer', '', 'Video Trailer', 'مقطورة فيديو', 'Video-trailer', 'Bande-annonce vidéo', 'Video Trailer', 'Trailer de video'),
(709, 'restrict_embedding', '', 'Restrict Video From Embedding', 'تقييد الفيديو من التضمين', 'Voorkom dat video wordt ingesloten', 'Interdire l\'intégration de la vidéo', 'Beschränken Sie das Einbetten von Videos', 'Restringir la inserción de videos'),
(710, 'google_tracking_code', '', 'Google Tracking Code', 'كود تتبع جوجل', 'Google-trackingcode', 'Code de suivi Google', 'Google Tracking Code', 'Código de seguimiento de Google'),
(711, 'google_tracking_id', '', 'Google Tracking Id', 'معرف تتبع جوجل', 'Google-tracking-ID', 'Identifiant de suivi Google', 'Google Tracking-ID', 'ID de seguimiento de Google'),
(712, 'chating', '', 'Chating', 'الدردشة', 'Chatten', 'Bavardage', 'Chatten', 'Charlando'),
(713, 'allow_chating', '', 'Allow Chating', 'السماح بالمحادثة', 'Sta chating toe', 'Autoriser le chat', 'Chating zulassen', 'Permitir chatear'),
(714, 'block_chating', '', 'Block Chating', 'حظر الدردشة', 'Blokkeer chating', 'Bloquer le chat', 'Block Chating', 'Chatear en bloque'),
(715, 'newsletters', '', 'Newsletter', 'النشرة الإخبارية', 'Nieuwsbrief', 'Bulletin', 'Newsletter', 'Boletin informativo'),
(716, 'scheduled', '', 'Scheduled', 'المقرر', 'Gepland', 'Programmé', 'Geplant', 'Programado'),
(717, 'publication_date', '', 'Publication Date', 'تاريخ النشر', 'Publicatie datum', 'Date de publication', 'Veröffentlichungsdatum', 'Fecha de publicación'),
(718, 'wrong_date_format', '', 'Wrong date format', 'تنسيق التاريخ غير صحيح', 'Verkeerde datumnotatie', 'Format de date incorrect', 'Falsches Datumsformat', 'Formato de fecha incorrecto'),
(719, 'payu', '', 'PayU', 'PayU', 'PayU', 'PayU', 'PayU', 'PayU'),
(720, 'add_text', '', 'Add Text', 'أضف نصًا', 'Voeg tekst toe', 'Ajouter du texte', 'Text hinzufügen', 'Añadir texto'),
(721, 'video_text', '', 'Video Text', 'نص الفيديو', 'Videotekst', 'Texte vidéo', 'Videotext', 'Texto de video'),
(722, 'invalid_title', '', 'Title must be between 10/200', 'يجب أن يكون العنوان بين 10/200', 'Titel moet tussen 10/200 liggen', 'Le titre doit être compris entre 10/200', 'Der Titel muss zwischen 10/200 liegen', 'El título debe estar entre 10/200'),
(723, 'invalid_video_duration', '', 'Invalid video duration', 'مدة الفيديو غير صالحة', 'Ongeldige videoduur', 'Durée de la vidéo non valide', 'Ungültige Videodauer', 'Duración de video no válida'),
(724, 'color', '', 'Color', 'اللون', 'Kleur', 'Couleur', 'Farbe', 'Color'),
(725, 'background_color', '', 'Background Color', 'لون الخلفية', 'Achtergrond kleur', 'Couleur de l\'arrière plan', 'Hintergrundfarbe', 'Color de fondo'),
(726, 'text', '', 'Text', 'نص', 'Tekst', 'Texte', 'Text', 'Texto'),
(727, 'top_left', '', 'Top Left', 'أعلى اليسار', 'Linksboven', 'En haut à gauche', 'Oben links', 'Arriba a la izquierda'),
(728, 'top_right', '', 'Top Right', 'اعلى اليمين', 'Rechtsboven', 'En haut à droite', 'Oben rechts', 'Parte superior derecha'),
(729, 'bottom_left', '', 'Bottom Left', 'أسفل اليسار', 'Linksonder', 'En bas à gauche', 'Unten links', 'Abajo a la izquierda'),
(730, 'bottom_right', '', 'Bottom Right', 'أسفل اليمين', 'Rechts onder', 'En bas à droite', 'Unten rechts', 'Abajo a la derecha'),
(731, 'center', '', 'Center', 'مركز', 'Centrum', 'Centre', 'Center', 'Centrar'),
(732, 'please_select_another_part', '', 'Please select another part', 'الرجاء تحديد جزء آخر', 'Selecteer een ander onderdeel', 'Veuillez sélectionner une autre pièce', 'Bitte wählen Sie ein anderes Teil', 'Seleccione otra parte'),
(733, 'part', '', 'Part', 'جزء', 'Een deel', 'Partie', 'Teil', 'Parte'),
(734, 'you_cant_make_more', '', 'Sorry you can`t generate more than 5 cards.', 'آسف لا يمكنك توليد أكثر من 5 بطاقات.', 'Sorry, je kunt niet meer dan 5 kaarten genereren.', 'Désolé, vous ne pouvez pas générer plus de 5 cartes.', 'Leider können Sie nicht mehr als 5 Karten generieren.', 'Lo sentimos, no puede generar más de 5 tarjetas.'),
(735, 'card_published', '', 'The card has been published successfully', 'تم نشر البطاقة بنجاح', 'De kaart is met succes gepubliceerd', 'La carte a été publiée avec succès', 'Die Karte wurde erfolgreich veröffentlicht', 'La tarjeta se ha publicado con éxito'),
(736, 'add_card', '', 'Add Card', 'إضافة بطاقة', 'Voeg een kaart toe', 'Ajouter une carte', 'Karte hinzufügen', 'Agregar tarjeta'),
(737, 'track_your_own_profile', '', 'You can track your own profile and videos with Google Analytics!', 'يمكنك تتبع ملفك الشخصي ومقاطع الفيديو الخاصة بك باستخدام Google Analytics!', 'U kunt uw eigen profiel en video\'s volgen met Google Analytics!', 'Vous pouvez suivre votre propre profil et vos vidéos avec Google Analytics!', 'Mit Google Analytics können Sie Ihr eigenes Profil und Ihre eigenen Videos verfolgen!', '¡Puede rastrear su propio perfil y videos con Google Analytics!'),
(738, 'utc_timezone', '', '(UTC timezone)', '(المنطقة الزمنية UTC)', '(UTC-tijdzone)', '(Fuseau horaire UTC)', '(UTC-Zeitzone)', '(Zona horaria UTC)'),
(739, 'follow_u', '', 'wants to follow your channel', NULL, NULL, NULL, NULL, NULL),
(740, 'unfollow_u', '', 'unfollow from your channel', NULL, NULL, NULL, NULL, NULL),
(741, 'unfollow_from_channel', 'Are you sure you want to unfollow? This action can\\\'t be undo.', 'Are you sure you want to unfollow? This action can\\\'t be undo.', NULL, NULL, NULL, NULL, NULL),
(742, 'channels', '', 'Channels', NULL, NULL, 'Channels', NULL, NULL),
(743, 'add_channel', '', 'Add Channel', NULL, NULL, NULL, NULL, NULL),
(744, 'channel_was_deleted', '', 'Channel has been deleted!', NULL, NULL, 'La chaîne a été supprimée!', NULL, NULL),
(745, 'confirm_dechannel', '', 'Are you sure you want to delete this Channel?', NULL, '', 'Voulez-vous vraiment supprimer cette chaîne?', NULL, NULL),
(746, '746', 'category', 'CHALLENGES', NULL, NULL, NULL, NULL, NULL),
(747, 'sub__747', '746', 'FOULS / MISCONDUCT: CARELESS, RECKLESS, USING EXCESSIVE FORCE AND VIOLENT CONDUCT', NULL, NULL, NULL, NULL, NULL),
(748, '748', 'category', 'POSITIONING / MOVEMENT', NULL, NULL, NULL, NULL, NULL),
(749, '749', 'category', 'SIGNALS / BODY LANGUAGE', NULL, NULL, NULL, NULL, NULL),
(750, '750', 'category', 'MANAGAMENT', NULL, NULL, NULL, NULL, NULL),
(751, '751', 'category', 'VIDEO SUPPORT', NULL, NULL, NULL, NULL, NULL),
(752, '752', 'category', 'OTHER MATCH OFICIALS', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `libraries`
--

CREATE TABLE `libraries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `uploaded_at` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `back_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libraries_bg`
--

CREATE TABLE `libraries_bg` (
  `id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes_dislikes`
--

CREATE TABLE `likes_dislikes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `activity_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes_dislikes`
--

INSERT INTO `likes_dislikes` (`id`, `user_id`, `video_id`, `post_id`, `activity_id`, `type`, `time`) VALUES
(2, 27, 218, 0, 0, 1, 1650990986);

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `id` int(11) NOT NULL,
  `list_id` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `privacy` int(11) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(3000) NOT NULL DEFAULT '',
  `time` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lists`
--

INSERT INTO `lists` (`id`, `list_id`, `user_id`, `name`, `description`, `privacy`, `views`, `icon`, `time`) VALUES
(1, 'awipGX1A1Ry2gfj', 1, 'one', '', 1, 0, '', 1619518444),
(2, 'NUgwcDL3DCYeTOJ', 4, 'new', '', 1, 0, '', 1626271562),
(4, 'h5Aw7u85ErzBJuG', 1, 'Ramy', '', 1, 0, '', 1627573676),
(5, 'ceDQKU56TvSjCZw', 4, 'Gamal', '', 1, 0, '', 1628423976),
(6, 'z7PxA6Xul7fuflA', 1, 'TAM', '', 1, 0, '', 1629378575),
(7, 'rmvfAaWgjQawIPY', 4, 'ii', '', 1, 0, '', 1630265970),
(9, 'Z2AnyM4q9coSSHJ', 1, 'Ayoub', '', 1, 0, '', 1630348250),
(10, 'fDlnVHWdBlEokV1', 4, 'Sample Playlist', '', 1, 0, '', 1630408081),
(11, 'FtN6FLz6nlFYwih', 1, 'deb', '', 1, 0, '', 1630427852),
(15, '7LX1RN2oNFHYnzv', 18, 'TAM', '', 1, 0, '', 1636237903),
(16, 'jHthZQKImyR6oT7', 18, 'MA COURSE', '', 1, 0, '', 1636638632),
(17, 'mTIurCxbhSMg96t', 18, 'COURS ALGERIENNE', '', 1, 0, '', 1638174453),
(19, 'nzCXGU15kgYcuZs', 27, 'TM', '', 1, 0, '', 1651240698),
(20, 'yXek9DtHK21QO4v', 1, 'new', '', 1, 0, '', 1652490564);

-- --------------------------------------------------------

--
-- Table structure for table `live_sub_users`
--

CREATE TABLE `live_sub_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `is_watching` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `created_at`) VALUES
(8, 'REFEREES', 'http://refereeing.online/video', 'sports', '1630621149'),
(11, 'MATCH ANALYSIS ', 'http://refereeing.online/video/admin-cp/menu', 'emoji_events', '1650914212'),
(12, 'REL CLOUD', 'http://localhost/rel/', 'cloud_upload', '1653394304'),
(13, 'REL CONNECT', 'http://localhost/rel/', 'sensor_occupied', '1655337439'),
(14, 'VIDEO QUIZES', 'http://localhost/rel/', 'video_file', '1653394529'),
(15, 'REL METTINGS', 'http://localhost/re', 'duo', '1653394688'),
(16, 'VAR SIMULATOR', 'http://localhost/rel/', 'dvr', '1657036672'),
(17, 'ONLINE MODE', 'http://localhost/rel/', 'wifi', '1653395274'),
(18, 'OFFLINE MODE', 'http://localhost/rel/', 'wifi_off', '1653395313');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `from_deleted` int(11) NOT NULL DEFAULT 0,
  `to_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monetization_requests`
--

CREATE TABLE `monetization_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(600) NOT NULL DEFAULT '',
  `personal_photo` varchar(300) NOT NULL DEFAULT '',
  `id_photo` varchar(300) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(11) NOT NULL DEFAULT 0,
  `full_link` varchar(1000) NOT NULL DEFAULT '',
  `admin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notifier_id`, `recipient_id`, `video_id`, `type`, `text`, `url`, `seen`, `time`, `sent_push`, `full_link`, `admin`) VALUES
(29, 2, 1, 0, 'unfollow_u', NULL, '@HulkTron', '1655469330', '1619362628', 1, '', 0),
(30, 1, 2, 0, 'follow_u', NULL, '@admin', '0', '1619426951', 1, '', 0),
(32, 5, 1, 0, 'unfollow_u', NULL, '@ramygamal', '1655469330', '1619633649', 1, '', 0),
(35, 9, 1, 0, 'subscribed_u', NULL, '@good', '1655469330', '1620155590', 1, '', 0),
(41, 1, 9, 23, 'added_video', NULL, 'watch/lukOL66P8GDhaLc', '0', '1626175733', 0, '', 0),
(91, 1, 9, 17, 'added_video', NULL, 'watch/3LpcvWbt7HsUzKL', '0', '1630621010', 0, '', 0),
(92, 1, 9, 18, 'added_video', NULL, 'watch/z3KtlAVGkViLMzE', '0', '1630621796', 0, '', 0),
(93, 1, 9, 19, 'added_video', NULL, 'watch/WVUZiNoTJfTWcog', '0', '1630622100', 0, '', 0),
(94, 1, 9, 20, 'added_video', NULL, 'watch/cn4wllfn6WpObIg', '0', '1630622256', 0, '', 0),
(95, 1, 9, 21, 'added_video', NULL, 'watch/4bNbPZ5WDnURCx4', '0', '1630623729', 0, '', 0),
(96, 1, 9, 22, 'added_video', NULL, 'watch/7TngyOkTQgKHj6U', '0', '1630623991', 0, '', 0),
(97, 1, 9, 23, 'added_video', NULL, 'watch/SqdEvpxTDFdSt9m', '0', '1630624008', 0, '', 0),
(98, 1, 9, 24, 'added_video', NULL, 'watch/QuQGmIVxdtY8hRB', '0', '1630624096', 0, '', 0),
(99, 1, 9, 25, 'added_video', NULL, 'watch/rhnGMglvZ5Lv9nm', '0', '1630624261', 0, '', 0),
(101, 1, 9, 28, 'added_video', NULL, 'watch/Dc1cM65na3JTpX6', '0', '1630624528', 0, '', 0),
(102, 1, 9, 27, 'added_video', NULL, 'watch/3iCVDP3TQSxK15k', '0', '1630624536', 0, '', 0),
(106, 1, 9, 32, 'added_video', NULL, 'watch/79DPbr7ZKVM25oY', '0', '1630702441', 0, '', 0),
(118, 1, 9, 46, 'added_video', NULL, 'watch/lKfTmEAxVsVRSww', '0', '1630780798', 0, '', 0),
(119, 1, 9, 50, 'added_video', NULL, 'watch/8QfzeMYdc5t6Hq2', '0', '1630953477', 0, '', 0),
(120, 1, 9, 48, 'added_video', NULL, 'watch/vRjBPGFMTajqqRT', '0', '1630953488', 0, '', 0),
(121, 1, 9, 49, 'added_video', NULL, 'watch/3XDqDxwGxj2y56T', '0', '1630953579', 0, '', 0),
(122, 1, 9, 51, 'added_video', NULL, 'watch/9h9n4nju3GJeUnQ', '0', '1630953622', 0, '', 0),
(123, 1, 9, 112, 'added_video', NULL, 'watch/d4J7V8ZwfSGLc9m', '0', '1636538120', 0, '', 0),
(124, 1, 9, 113, 'added_video', NULL, 'watch/ntBOtWxSPbz27B9', '0', '1636538235', 0, '', 0),
(125, 1, 9, 114, 'added_video', NULL, 'watch/VMQcHvvrdYNrd7R', '0', '1636538387', 0, '', 0),
(126, 1, 9, 115, 'added_video', NULL, 'watch/XpjIfFgqxjmNz8q', '0', '1636538556', 0, '', 0),
(127, 1, 9, 116, 'added_video', NULL, 'watch/OEZK9LckOS7vDYb', '0', '1636538653', 0, '', 0),
(128, 1, 9, 117, 'added_video', NULL, 'watch/xq1gF48FQpyH25i', '0', '1636538808', 0, '', 0),
(129, 1, 9, 118, 'added_video', NULL, 'watch/wyUmCKYnhq2tiwr', '0', '1636539055', 0, '', 0),
(130, 1, 9, 119, 'added_video', NULL, 'watch/j4o3SeRCXUHPz3B', '0', '1636539290', 0, '', 0),
(131, 1, 9, 120, 'added_video', NULL, 'watch/D7CrW1gYfyiPNCs', '0', '1636539621', 0, '', 0),
(132, 1, 9, 121, 'added_video', NULL, 'watch/J32YwfOPvWrrZP8', '0', '1636539841', 0, '', 0),
(133, 1, 9, 122, 'added_video', NULL, 'watch/Lp3OKXqgXnVX8IV', '0', '1636540037', 0, '', 0),
(134, 1, 9, 123, 'added_video', NULL, 'watch/bFW8WUXjJAYrwXy', '0', '1636540469', 0, '', 0),
(135, 1, 9, 124, 'added_video', NULL, 'watch/RsURobSVLZwUWHq', '0', '1636540763', 0, '', 0),
(136, 1, 9, 125, 'added_video', NULL, 'watch/aDnhifpsP9hmmeJ', '0', '1636541040', 0, '', 0),
(137, 1, 9, 126, 'added_video', NULL, 'watch/b9q2BRGMPDVRGln', '0', '1636541162', 0, '', 0),
(138, 1, 9, 127, 'added_video', NULL, 'watch/ed8jsrogXi7SvSI', '0', '1636541254', 0, '', 0),
(139, 1, 9, 128, 'added_video', NULL, 'watch/9nK1J8D31LXLSIH', '0', '1636541359', 0, '', 0),
(140, 1, 9, 129, 'added_video', NULL, 'watch/9BRPF5MZ4e3OxGW', '0', '1636541508', 0, '', 0),
(141, 1, 9, 130, 'added_video', NULL, 'watch/j6PxlC6KmAaTyYf', '0', '1636541611', 0, '', 0),
(142, 1, 9, 131, 'added_video', NULL, 'watch/RCmH97JHAXrzhXy', '0', '1636541794', 0, '', 0),
(143, 1, 9, 132, 'added_video', NULL, 'watch/fLcWhwOeuWFyqr9', '0', '1636541908', 0, '', 0),
(144, 1, 9, 133, 'added_video', NULL, 'watch/O23d9G6jgj9ryCo', '0', '1636542089', 0, '', 0),
(145, 1, 9, 134, 'added_video', NULL, 'watch/LrXdCVrNHrCceAg', '0', '1636542492', 0, '', 0),
(146, 1, 9, 135, 'added_video', NULL, 'watch/JNm4LwV9wKal8wm', '0', '1636542674', 0, '', 0),
(147, 1, 9, 136, 'added_video', NULL, 'watch/flNvJskcpqjAJxU', '0', '1636542834', 0, '', 0),
(148, 1, 9, 137, 'added_video', NULL, 'watch/UaQkpiptQ6z9dP3', '0', '1636545608', 0, '', 0),
(149, 1, 9, 138, 'added_video', NULL, 'watch/y1t7Ho4LZNWyIES', '0', '1636545823', 0, '', 0),
(150, 1, 9, 139, 'added_video', NULL, 'watch/D2wkSmmqNJmH2aN', '0', '1636549787', 0, '', 0),
(151, 1, 9, 140, 'added_video', NULL, 'watch/HzcPDdfZN232aPX', '0', '1636621776', 0, '', 0),
(152, 1, 9, 141, 'added_video', NULL, 'watch/dxULAPKYn5i36js', '0', '1636621970', 0, '', 0),
(153, 1, 9, 143, 'added_video', NULL, 'watch/hoIRR4doBUf8OXd', '0', '1636622310', 0, '', 0),
(154, 1, 9, 144, 'added_video', NULL, 'watch/8ZgmD9Y7KbS7bjj', '0', '1636622370', 0, '', 0),
(155, 1, 9, 142, 'added_video', NULL, 'watch/MTDSPKdvMlipES6', '0', '1636622422', 0, '', 0),
(156, 1, 9, 145, 'added_video', NULL, 'watch/6KepeU99BlAsl4G', '0', '1636622440', 0, '', 0),
(157, 1, 9, 146, 'added_video', NULL, 'watch/e2i3zSfT6PcyVTw', '0', '1636622472', 0, '', 0),
(158, 1, 9, 147, 'added_video', NULL, 'watch/GifgwJRUsOf6V5v', '0', '1636622619', 0, '', 0),
(159, 1, 9, 148, 'added_video', NULL, 'watch/1Fii9gSBaxYTIJT', '0', '1636622744', 0, '', 0),
(160, 1, 9, 149, 'added_video', NULL, 'watch/3cDy2U7utdUjzhu', '0', '1636623202', 0, '', 0),
(161, 1, 9, 150, 'added_video', NULL, 'watch/KHEU7z2rXPt3iR3', '0', '1636626582', 0, '', 0),
(162, 1, 9, 151, 'added_video', NULL, 'watch/TmQ5npeX2DGt9bx', '0', '1636627589', 0, '', 0),
(163, 1, 9, 152, 'added_video', NULL, 'watch/bKBSCbRflLoWtNc', '0', '1636627977', 0, '', 0),
(164, 1, 9, 153, 'added_video', NULL, 'watch/OeFLVVkgYPX9mi2', '0', '1636629517', 0, '', 0),
(165, 1, 9, 154, 'added_video', NULL, 'watch/5qot7GY51dD7cA3', '0', '1636629622', 0, '', 0),
(166, 1, 9, 155, 'added_video', NULL, 'watch/eeu48jrzENCMl8c', '0', '1636633323', 0, '', 0),
(167, 1, 9, 156, 'added_video', NULL, 'watch/6xn9g1W7ApPWfDR', '0', '1636638946', 0, '', 0),
(168, 1, 9, 157, 'added_video', NULL, 'watch/FXRWL4q1I1UvOpI', '0', '1636701894', 0, '', 0),
(169, 1, 9, 158, 'added_video', NULL, 'watch/pX3ohuaIDsvoOqZ', '0', '1636702071', 0, '', 0),
(170, 1, 9, 159, 'added_video', NULL, 'watch/GYXyAiQYuDpppps', '0', '1636702619', 0, '', 0),
(171, 1, 9, 160, 'added_video', NULL, 'watch/IgNQIdmzF2oyewW', '0', '1636703093', 0, '', 0),
(172, 1, 9, 161, 'added_video', NULL, 'watch/ppyNIgTuXuYKwby', '0', '1636703195', 0, '', 0),
(173, 1, 9, 162, 'added_video', NULL, 'watch/nGMmMZLhMGJ5L9m', '0', '1636786291', 0, '', 0),
(174, 1, 9, 163, 'added_video', NULL, 'watch/7fhnGgbrMmAxkeF', '0', '1636786470', 0, '', 0),
(175, 1, 9, 164, 'added_video', NULL, 'watch/s3fWb16J6GjJ11S', '0', '1636786555', 0, '', 0),
(176, 1, 9, 165, 'added_video', NULL, 'watch/QguTMzp3nYUTtht', '0', '1636786635', 0, '', 0),
(177, 1, 9, 166, 'added_video', NULL, 'watch/d8crtDwodDKxixU', '0', '1636786747', 0, '', 0),
(178, 1, 9, 167, 'added_video', NULL, 'watch/TRAf4Zq1reHlUIv', '0', '1636786988', 0, '', 0),
(179, 1, 9, 168, 'added_video', NULL, 'watch/uHoxFIVibjYiRlz', '0', '1636787126', 0, '', 0),
(180, 1, 9, 169, 'added_video', NULL, 'watch/HNvduwUDLDBi6rH', '0', '1636787126', 0, '', 0),
(181, 1, 9, 170, 'added_video', NULL, 'watch/ZHqMQNnKd1EBHiZ', '0', '1636787428', 0, '', 0),
(182, 1, 9, 171, 'added_video', NULL, 'watch/yg6pfQanNTR9jdh', '0', '1636787597', 0, '', 0),
(183, 1, 9, 172, 'added_video', NULL, 'watch/atkKAo6rXfdFJ1j', '0', '1636787658', 0, '', 0),
(184, 1, 9, 173, 'added_video', NULL, 'watch/KtNZXbT7SNKQEvw', '0', '1636787915', 0, '', 0),
(185, 1, 9, 174, 'added_video', NULL, 'watch/wq6V1wG16VD1omP', '0', '1636787951', 0, '', 0),
(186, 1, 9, 175, 'added_video', NULL, 'watch/oE3l7ttFri1WPAx', '0', '1636788203', 0, '', 0),
(187, 1, 9, 176, 'added_video', NULL, 'watch/fGYCwqrGKGTjDOW', '0', '1636788447', 0, '', 0),
(188, 1, 9, 177, 'added_video', NULL, 'watch/XHFownTQbPcqwFB', '0', '1636989564', 0, '', 0),
(189, 1, 9, 178, 'added_video', NULL, 'watch/5hMKh8tzKHQjuIa', '0', '1636989709', 0, '', 0),
(190, 1, 9, 179, 'added_video', NULL, 'watch/1FrOV41u58V9mRL', '0', '1636990589', 0, '', 0),
(191, 1, 9, 180, 'added_video', NULL, 'watch/HbgXiiVwcQezTEo', '0', '1636990757', 0, '', 0),
(192, 1, 9, 181, 'added_video', NULL, 'watch/ORC9lvzKl8uOWSw', '0', '1636990821', 0, '', 0),
(193, 1, 9, 182, 'added_video', NULL, 'watch/sn9COxMAEJ4MDOo', '0', '1636991017', 0, '', 0),
(194, 1, 9, 183, 'added_video', NULL, 'watch/VdvAgeW2nCCi5MI', '0', '1636991258', 0, '', 0),
(195, 1, 9, 184, 'added_video', NULL, 'watch/IyM8CQVu4XEcWsS', '0', '1636991442', 0, '', 0),
(196, 1, 9, 185, 'added_video', NULL, 'watch/Au4Xu1huB7kQrPS', '0', '1636991739', 0, '', 0),
(197, 1, 9, 186, 'added_video', NULL, 'watch/aBTG6RCR3MIM8KJ', '0', '1636992510', 0, '', 0),
(198, 1, 9, 187, 'added_video', NULL, 'watch/cmqc7QQt7ScjLJn', '0', '1636993300', 0, '', 0),
(199, 1, 9, 188, 'added_video', NULL, 'watch/iVJVOy6gtPe3hDa', '0', '1636994716', 0, '', 0),
(200, 1, 9, 189, 'added_video', NULL, 'watch/bzPDI9YFwtSoESo', '0', '1636995510', 0, '', 0),
(201, 1, 9, 190, 'added_video', NULL, 'watch/YS6NjAATnt1satQ', '0', '1636996587', 0, '', 0),
(202, 1, 9, 191, 'added_video', NULL, 'watch/5n9GsMWaYnjFwe5', '0', '1636997699', 0, '', 0),
(203, 1, 9, 192, 'added_video', NULL, 'watch/rtDOxwgOBPrcwaD', '0', '1636999520', 0, '', 0),
(204, 1, 9, 193, 'added_video', NULL, 'watch/RiDW3QoMG1NCI6l', '0', '1637000141', 0, '', 0),
(205, 1, 9, 194, 'added_video', NULL, 'watch/YqvHoONJXxaIRj9', '0', '1637001503', 0, '', 0),
(206, 1, 9, 195, 'added_video', NULL, 'watch/8tcfVTguF6DrbRA', '0', '1637001684', 0, '', 0),
(207, 1, 9, 196, 'added_video', NULL, 'watch/9pSpmzWzRlrQmfh', '0', '1637001872', 0, '', 0),
(208, 1, 9, 197, 'added_video', NULL, 'watch/B1aWgiEGHpsj41I', '0', '1637002019', 0, '', 0),
(209, 1, 9, 198, 'added_video', NULL, 'watch/uzmLDKUtZ5MYwPB', '0', '1637002553', 0, '', 0),
(210, 1, 9, 199, 'added_video', NULL, 'watch/bJcNzVevSJy7nps', '0', '1637004594', 0, '', 0),
(211, 1, 9, 200, 'added_video', NULL, 'watch/PRRGuRtfsv6clRV', '0', '1637005156', 0, '', 0),
(212, 1, 9, 201, 'added_video', NULL, 'watch/y5hGzBhkZ846pdU', '0', '1637005584', 0, '', 0),
(213, 1, 9, 202, 'added_video', NULL, 'watch/mIkRRyKg37YdJwF', '0', '1637006020', 0, '', 0),
(214, 27, 1, 218, 'liked_ur_video', NULL, 'watch/jokJVcQpO8X4HY7', '1655469330', '1650990986', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT 0,
  `date` varchar(100) NOT NULL DEFAULT '',
  `expire` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_subscribers`
--

CREATE TABLE `playlist_subscribers` (
  `id` int(11) NOT NULL,
  `list_id` varchar(50) NOT NULL DEFAULT '',
  `subscriber_id` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `play_list`
--

CREATE TABLE `play_list` (
  `id` int(11) NOT NULL,
  `list_id` varchar(500) NOT NULL DEFAULT '',
  `video_id` varchar(500) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `play_list`
--

INSERT INTO `play_list` (`id`, `list_id`, `video_id`, `user_id`) VALUES
(10, 'jHthZQKImyR6oT7', '155', 18),
(12, 'mTIurCxbhSMg96t', '112', 18),
(17, 'nzCXGU15kgYcuZs', '218', 27),
(19, 'yXek9DtHK21QO4v', '231', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile_fields`
--

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `options` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` text DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(32) NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT 0,
  `profile_page` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pt_posts`
--

CREATE TABLE `pt_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `category` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(3000) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `tags` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT 0,
  `shared` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `video_res` varchar(20) NOT NULL DEFAULT '',
  `processing` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `article_id` int(15) NOT NULL DEFAULT 0,
  `ad_id` int(15) NOT NULL DEFAULT 0,
  `comment_id` int(20) NOT NULL DEFAULT 0,
  `reply_id` int(25) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT 0,
  `type` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_videos`
--

CREATE TABLE `saved_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `platform_details` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `platform_details`, `time`) VALUES
(5, 'a81cbd909530059800c5f607e0321308ca934fbf161884996895b62c39494e71b5370bbd2656fad97f', 2, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"89.0.4389.114\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1618849968),
(7, 'e32ba2f6f8beab3ffe11bee2d81c61bdd1d60b171618868726ad7ba8537faff4ce0eef5a0327ed306a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"89.0.4389.114\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1618868726),
(8, '52efa0bda1e0d39ba73830357ff89f907786a0b816191697583cb467d72959ebe11ca2ab5bc50a0298', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.85\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1619169758),
(11, '8eae814bb6da48b985dad606629fbd5674c444191619426995283edf2440318c9ad98221285955a601', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.0.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.9.161\";}', 1619426995),
(15, '57b3fd52d316840c3ca0faebeb2883774d89a11d1619475519a829fb1c7b929cfc76dceea003a08a5b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:139:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.0.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.40.232.56\";}', 1619475519),
(16, '63e869de52030784ea5452c5e4708ca7f983646416194807493ba6d260a27211503e116051aa548de6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:139:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.0.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"105.193.211.116\";}', 1619480749),
(23, '2186e0d082cc225df5076f1277f9a3ce0cd99add16196316482bf1036683445ce4a6d88a3ae988606e', 5, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.85\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.40.224.98\";}', 1619631648),
(24, 'bdc4dd54f59f85b6cc0eb749337422e73a222ed9161964182886cae989c87ba47b45d6bd1a7a469ff6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"14.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.40.224.98\";}', 1619641828),
(25, 'c5b05e56597d65887074b6d112f8c7a3ef6811ae1619859826c83ec4ca83911ce7ef1f229abad3b5ef', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.40.224.98\";}', 1619859826),
(26, '552beb165f38990271b2822431a6dc26d1aefd4f1620024465814aa8177658dad63a0d73f8571a11f2', 6, 'web', 'a:6:{s:9:\"userAgent\";s:109:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"182.185.169.55\";}', 1620024465),
(27, 'dddbe2250bfef8ae26ccec61a5aa0d2444dd7352162012118584cdb922643b65b312204a2185376000', 7, 'web', 'a:6:{s:9:\"userAgent\";s:109:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"39.45.57.80\";}', 1620121185),
(28, 'bfda9249f3018c2d2bc6b5c4a6b5be6d3d3baf321620142889e98be4c520f518891cef447c98acaa45', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"156.159.71.178\";}', 1620142889),
(29, '44152c18135a862ab3f474e9121fcefe075d6bab1620152393f9674c07d6adebe2e8f2d7c749132b2b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"202.163.107.133\";}', 1620152393),
(48, 'ab97c50a96c6dc66f1d6f5fa3b1c17f79f3d27db16201558951d0a393136f1754ec086308c96248ea6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"156.159.71.178\";}', 1620155895),
(49, 'be493d17e2e84ff3bcce5bcfa17032070a02b99e1620163305479f941bcbb848e057abe1f7bbf357a3', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"111.88.229.152\";}', 1620163305),
(50, 'c63f059f284087eb888cc2b56a2a09b30cc42dbf162019327043c49a95af2dfcbfb716d9649b446a74', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.75.210.244\";}', 1620193270),
(51, '449eb2cfa9639de661538642aac79f2af94573ec16202257332efaf3a37164ddb13dee05dd2cf646e4', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.188.174.30\";}', 1620225733),
(52, '82dea879f2341cfea5d2c8c1e57136707d0dfbec162022618689671af0985c8297d982700faf2d0b25', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.188.174.30\";}', 1620226186),
(53, '50c05d8113b56ca513ef9848d85980db683612b01620237274092a0201876afac14820dd25500e571d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.188.174.30\";}', 1620237274),
(54, '32064ab27310390df4ef5aec14bd82c43e89d66f1620241017f7a9cefef50e85b6429edf0c165d92c0', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.188.174.30\";}', 1620241017),
(55, 'a4c868d69bd9c9b144651373550cd05693b6a9ff1620245959059c2bba5e07cb3246973981f5ea322f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"104.206.108.202\";}', 1620245959),
(58, '026b684cfdaba9cd336040b466d2b7ae4337aaec1620257453f5160e441c30b0e6ba74007d95f8e9d4', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"90.0.4430.93\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.188.174.30\";}', 1620257453),
(59, '3c6c04b6114839b4cfed511e3244da6258e5651316207617920339386f4e2c992516ee7e2054a8da09', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"14.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.181.122\";}', 1620761792),
(60, '1eddcbb3f25d55dd0a6171e6004682a01b00323a1623827787bb2fd46b05726185ade2960a59a9d09c', 4, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.101\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.28.81\";}', 1623827787),
(61, 'aa6ccffcf4ddd9f2dff1c8e55705e5b02ed3a2701624368129e795b7c3260fbfac226d1237f9a77d2b', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.106\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.164.159\";}', 1624368129),
(69, 'a3b479e669c57808d5d7ca4cf9f267f714017f0e16257295057ae56243ae78164903e17d0948e6b18c', 10, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"90.0.4430.212\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1625729505),
(70, '2e011c0e661a71848ff3238800621d52891a7b8516261490691e6e605983657d4d59ae2b93c5a0a45b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"90.0.4430.212\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1626149069),
(72, '06ebf836d9de9063e3879c5efed24d3719bbe7621626150483179668720b505dce06f75537b4ab9956', 10, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"90.0.4430.212\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1626150483),
(82, 'eac3c4fa711f9715e87f3ed0a44217e9f61d4a6b1626272228fe6702266bc15075dab0dfd980f774b9', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.232.118.173\";}', 1626272228),
(93, 'e13a29cb557a2e4c0253d633a9927505f21eeebf1626721397f42a7a67074963d846a0908c747143da', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.124\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.47.252.114\";}', 1626721397),
(94, 'd4717d2cc6cac80d021f3a0d5e4944e8b55dc7cb1626736547fc7a4c2ffaf8971aa7b34bd3af072a7f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.164\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.47.252.114\";}', 1626736547),
(95, '617f374109dab487dd0a05b41ce0845fe33daa551626737393372e1b175c583eec1d6ddf1abd5b2e30', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.47.252.114\";}', 1626737393),
(96, '531f671102015b2b7c7722942d2c3ac8839200df1626737433da42556ca93dd9330354e50a0e8176fa', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.164\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.47.252.114\";}', 1626737433),
(97, 'e3c7aef6c0c707b0e20b68e05ff636a4922301e616267405390b985e40e6bd74689235d7070df04d2e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:103:\"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.124\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"102.47.189.253\";}', 1626740539),
(98, 'f5ded233d7186601eaeb7544c6da871b7b9db84b1626783521fd6142dc5963caf2c26f4940dad106ee', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.164\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626783521),
(99, 'f133bb600eb0cd0808e93f8ff6dbbae33263e0b41626784884bc283106a007321b412ef5943ee2f35b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626784884),
(100, '801a706fcbfd951dc532ee88a72b5e02a47982981626785108a1d455229eb8a9e8291fb09e558bb365', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626785108),
(101, 'dbfe9ba7e056e48a7ccfed8a11c2b5143ea1e6de1626785241132d8464ad397900113da8ce30fb1452', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626785241),
(102, 'c4d4898c97c063f747242962953440ba6247b7241626785727b09735d12ee3c0f73b7bc66b02afb1ef', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626785727),
(103, '554aa641185aa098bb0ee75a3e7988b7788a5d031626786160082c517905f84179ca2d7ceb5355f060', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.46.43.202\";}', 1626786160),
(106, 'b2bdbbab5fdb63d180eb17725d5d8f5231f170b816272073576d8ff6f36088bfbc1ff36fec47a1468b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"182.189.41.158\";}', 1627207357),
(114, 'b03fa706be4ddb0a1a1edbd1cfd508df017f65a416272484823e964ac7f41dfe22b035cff05b71c19a', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627248482),
(116, 'cb9d548c6031bb74c5dfe9092899160a73cba80116273125858e23cd344f854ea728c14d4372e00bf7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627312585),
(117, '205c2c01f5627dd68cf546a432058b401ce5874716273147936b7dfc542608411de5fe416ad148d62a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.164\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627314793),
(118, '78646822cf9ce2e43de6a65cbc3138c42962b50b16273167686d5147717a13bc24f66e9ba2a50f91e6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627316768),
(120, '8863bb68ada005ee2b9bb48267dddc0752632fd0162732766642e8e4f3ea98b53fd90be69c11f7e0ce', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627327666),
(121, '655818aba3604b214d28c8ad048cf09a5a6e7e3c1627331093e01dea085979063056d49e3a24b2c68c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.52.95\";}', 1627331093),
(122, '0b6a948b1e6428ea2e2377781d598df589aadacf1627392814b76be234b11ea2a4e4e26cd195efb094', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627392814),
(123, '8f0a5b698eed505b73240345c9c649a17d523a7616274075215aae7d811cef61c3cd6b0dd13e5cc94e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627407521),
(124, 'ed90053c8e5fd45d1b8f711b7e262b1dfd28ddd816274173265a1602cb4fb7090eecf409a60b39e2c1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627417326),
(125, '09042d85eaf73a35ecfceda2c65d85c84fbd621b162742062857098d71eba43f54c2ddcd70ffb24ebc', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627420628),
(126, 'c2b64ce813be7d1f688a5eef5f9b8d35f4053a9e162742078374e1582cabb74fadc1a3674a4e97f9c9', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627420783),
(127, 'c536b040ac1ca0c272e6c31f7880a79f14b2e1931627430123fdde3be86b20665196b9aca56919fcb7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"90.0.4430.212\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"111.88.110.101\";}', 1627430123),
(128, '5b8aaba4b58263f684899e0c030e67a06b5500c816274640188ea45de198941ab821fc45ad9b95329e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627464018),
(137, '84524b622985a6c53711ab4aabad4349a55d243a162747618675dd2ae76696ebc312a2d90cbe5bd9ba', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627476186),
(138, '996a76d7572a9dcf2e87953867424e9df36ba8891627494561521c393c67bb8406df3b16014226dda8', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627494561),
(139, 'cc9d2ea5d71d3fa4893a8d3b50f53104e5ddee291627495274d464e612c431c7b95c204e103bbaaf79', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"182.189.47.52\";}', 1627495274),
(143, '39276ebee2b62bb2c28e32f6069652f1225a5f201627568471071ef20d6355fb2f6250821b66bcf9b4', 4, 'web', 'a:6:{s:9:\"userAgent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:4:\"90.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"103.86.52.191\";}', 1627568471),
(144, 'fca0de2334ba8b0af2747b48d0f16e16adca4419162757037581014446b15499aeae2773c212d16a25', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627570375),
(146, '225985326bac57454ef7cd44756fb07e9343f1d51627571518bfc5332ed0487c1e63cdbdcbdfd725ed', 1, 'web', 'a:6:{s:9:\"userAgent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:4:\"90.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627571518),
(150, '02b43d11aab3758a33ea56f8d7f498d1f35bb2601627573763f12913075d42594f39ec6fcd48661960', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.107\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.4.157\";}', 1627573763),
(158, '8e38773f44f3e1922567c6ba357cfe6ef114429f1628110006db2ad5f7b2a99d050a695e727f141986', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.153.89\";}', 1628110006),
(161, 'ad970dde204295aa63742c823fb90cc83bb4bd081628273784d74821714cd0ddc8d61484665da78a7e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"113.203.208.2\";}', 1628273784),
(164, 'd0d892bfa7712900769d61f8291411e2015aa0e01628333739568cd2c6740c555138d48432a87d04e2', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"113.203.208.2\";}', 1628333739),
(166, '93a9eb58514875f262c0128104f9b33aeb8ca8b8162833772099e97bf89fe50a25e89fa2e721a162b5', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"202.69.11.211\";}', 1628337720),
(168, 'ac612837c8149f6e2d047ff198e566f67bf129ea1628343324d998b898ee6c39e2da22310c9c71132f', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.153.89\";}', 1628343324),
(172, 'c9f15464417cadf644e811796f392ab4c4e8bc0f16284241422c3120b805c32e5343c88a8cb0b40412', 4, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.153.89\";}', 1628424142),
(173, 'd6cb9f31046d34aa058e3c93889e4d7efbbd174b162868589014e223e1ce806a07c943361ae50594e6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.40.234.183\";}', 1628685890),
(175, '854e1738b3cec04755b1553f357e14988a9aaf671628714429e073271cc6be3782f19da4a7c88dd61e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.40.234.183\";}', 1628714429),
(176, 'a50e6b7816f17123cbc3d3dfb7e8fec23446e4ac162875694426736735259d9cc5a6d54e649a51973a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.40.234.183\";}', 1628756944),
(177, '302e780e11188c48ff6bcdd73956f8671fdc37a1162889692750c6a4f09011fe5436ac53d98ef9f581', 1, 'web', 'a:6:{s:9:\"userAgent\";s:134:\"Mozilla/5.0 (SMART-TV; Linux; Tizen 4.0) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.1 Chrome/56.0.2924.0 TV Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:11:\"56.0.2924.0\";s:8:\"platform\";s:5:\"linux\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.133.227\";}', 1628896927),
(178, '180eee0dd0e7bb0bc37afd978850d397b4fa62b21629225601e1273cbae0cd60f76853783acd91df17', 11, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.114\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"139.135.54.6\";}', 1629225601),
(179, '5ba4085c30547096c9b72b4d4368bb82bcd114ad162924124840f1f3661f5368d5c81884347a97fd85', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"58.65.198.191\";}', 1629241248),
(180, '075e251d01a1ec3372c4918845fc2ab4a5f7fd0a16293109762cc0d6f048109a5f1ba97e27eb3c90ae', 12, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"205.164.158.199\";}', 1629310976),
(183, '58c2170c7adeaadc0d01b57503223f38ab00dca016293214312b97a76b72b5f67c2bff49aa61d0ac18', 1, 'web', 'a:6:{s:9:\"userAgent\";s:133:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 OPR/78.0.4093.147\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"205.164.159.208\";}', 1629321431),
(184, '182433d0b58434a27bfee5a769f2fcfb789f4c071629368593da6f7d1f6e3c753f52f83f9883a448c4', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"101.53.225.43\";}', 1629368593),
(186, '3fb804f96e68f50122eaef2209c75f9204da6b1a1629532164985b5e3b8c9fb92ba5851554b025a95f', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"119.153.35.129\";}', 1629532164),
(187, 'b67111c118b6d76abef047bdea0299b30abe210016295466619011630e152d552d1d22b70a90d61d54', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"115.186.4.91\";}', 1629546661),
(190, '663602eef0915e54e2195f1f08fd37b892cd81f916297214899bed8b98eaf798496099305acb3964b0', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.132.163\";}', 1629721489),
(193, '21c72f60e4dd5fc2a954b464aab977313b9e1f341629741285336ff70ccaefef2489ba1aca45a17ed3', 1, 'web', 'a:6:{s:9:\"userAgent\";s:169:\"Mozilla/5.0 (Linux; U; Android 5.1; en-US; vivo V3M A Build/LMY47I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.892 U3/0.8.0 Mobile Safari/534.30\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:3:\"4.0\";s:8:\"platform\";s:11:\"Android Web\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"182.189.8.7\";}', 1629741285),
(195, '9557c3ef10f07b99084f6ea8f57afae31cff46bf16297931394a5c5b35fedcb799fef418e89fad0bed', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.132.163\";}', 1629793139),
(196, '740d927813e5a1ddd2dace26530ddc28e069e4571629812205a32cedaeaea3d0914545b01980ac267c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"39.34.179.134\";}', 1629812205),
(197, '9ad812836f9ddacb1bd22fe70b2c23434880bdf01629824514c2d13211b115e159a1c7e4228709bea8', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.113.192\";}', 1629824514),
(200, '388520b54918da98e9477713cf7a951be706a4591629841022dc83f30599b833a2351ae778c1826246', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.113.192\";}', 1629841022),
(202, '658352a62fde38f2d45057cd7a4bf03154cdce5b1629915178db67e750b0b611233304495f0937f5fb', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629915178),
(203, '56e483829cba98cba7f9870e39daa200cb48784616299166889e3d687d3b5dd5f772ac3869fdca8dac', 1, 'web', 'a:6:{s:9:\"userAgent\";s:129:\"Mozilla/5.0 (Linux; Android 6.0; Lenovo A7000-a) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Mobile Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"91.0.4472.101\";s:8:\"platform\";s:11:\"Android Web\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"119.157.106.117\";}', 1629916688),
(204, '720d988392511d160655f9c14c626a04809e4fd11629957980fc69689191dfc54e4d7474ef3febdf5c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629957980),
(208, '282d8f6e4785382fd55b2d5976f9fbea4dea9f451629961455da1571129f04115645a226bff70cb6c1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629961455),
(210, 'e628cda5faaeac406b956b49f8d549a82e99f9c216299639612cb2b45b9de41b68dd6effa9fe7ba63e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629963961),
(212, 'a30d59005a1642b4b02530a05b04099b903225d4162997109440742efcc7acab1c782820f90e32c64c', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629971094),
(213, 'e6b5127de61cf8f7e46c7ea6bdf974746b565b1a162997116928ed794cef24fde24f25e2d486591229', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629971169),
(214, 'ec0eedc788c4d265ad52d1d79db6159d98e11c7c16299712057a1d43b9a2c426e4ae6bf41c6e597165', 1, 'web', 'a:6:{s:9:\"userAgent\";s:131:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.78\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629971205),
(215, 'e6d0a9b68b27badd16254627be44016251f5e7af1629972137ac297f3a687990c7a76467e1c8a9b3d2', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629972137),
(216, 'cbd651c173a2dc9ff4a10a8fc311072469f6092e1629972651a2c435302b5aebbcf8bf108b93b47553', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1629972651),
(219, '2c3da7018a551b49cd8fb05220f69429effef4fb1629978426e7292c1facb872138230687be24eae83', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"59.103.201.190\";}', 1629978426),
(222, 'f1a93fede17bf0e47c1615ba042869447bbfd05b1629979886fb65c3c15cf5c6ce6cfd2fc668329b48', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1629979886),
(224, 'a6d8ba81fdebbcfeb9227c9cd9b8182bb357b8bb16299833408693582d40b1b00289be4d8cc3d4b6db', 4, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629983340),
(226, '95087a701447d5ecdffe2d096edd90bab57c5b461629985081959cbe4dce8976e9f7f95f1533a3df93', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"59.103.201.190\";}', 1629985081);
INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `platform_details`, `time`) VALUES
(228, '2d1ee1750befb648189c607234f69151143b35be16299903018884618f257b3f2c0a01ddc1fc7376ac', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"59.103.201.190\";}', 1629990301),
(229, 'a6e26215b172770620deca179a628cf8dfda626a16299958565e295c14688236ae2310a58d1b5122c9', 1, 'web', 'a:6:{s:9:\"userAgent\";s:139:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1629995856),
(237, '68d0cb65c4b52c7bed0abcd1c098b62a0f0af3571630004857fd69b44c3a438cd836cf7d7e8bb18c44', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1630004857),
(238, '99947a266c01f2490fe9a2db1e9d2d87b8b15e7f16300068273d8332e66c9e5a091f631d6559b95b39', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1630006827),
(248, '2e90e61fa4a3f99e8d4208d97fd54ae0ca042628163001646372401affd4407660fee8c8186a8633b8', 13, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.172.54\";}', 1630016463),
(249, 'cdb2b633dab0f3c6fb46ff8dc33614b75ab919d91630084564c35409991428c415322195729fcc095b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"154.142.16.152\";}', 1630084564),
(251, '36a428c49b3ff58ef9021f45590e89d32bfc7eb216300932161e037829ff3ef5bdee3ad8c5958a2535', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.194.154\";}', 1630093216),
(252, 'ff42c8ca3c4f434256a260fec1eff2d13c57745a163010667798ae5561402b9aec07ba3fac0624d5ae', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.194.154\";}', 1630106677),
(255, 'b23db2c5ce8996b662cc2f05d4f9beaea524b88f1630161185055326e739a6b90c6f350a1343853f5b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1630161185),
(261, '33f376ce964417b5d5ae7ba258f63b9b63da2bcb1630218176adaa44c4bde3748a155aff21ab458874', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"105.181.54.4\";}', 1630218176),
(262, '7141887abf35fc50b764f506762be6fb722e22a51630264486e1cd3f4bcfe2392a91c95e6858125c57', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630264486),
(265, '9cdccfa5b467429d094761df01416fdb7705ba361630264828170144f708078796450554fef80bac4d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630264828),
(267, '3e58625f9838f81cc77a80759acde24912c1a2f01630266007c6c7e5e1f182f807a75814d1bff799d6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630266007),
(268, '2894ed08bed75507d67c7683d67049c41292e59416302704012babf80bce8457b49b86963a12e978f7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630270401),
(269, '08cf6b09ea10d9fbc745d1bc32216624ef8a7f371630307799039665ce96379c2c89b76b6db9a6e9c5', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1630307799),
(271, 'a80be4c6e03ecf186bbe84f5df4205ac907d13d816303109409663a1125bb1ba3288885da03f0ca60a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"59.103.193.115\";}', 1630310940),
(276, '2d760c8df0407438ba2318018ece6336295a8e0916303124143a84525c14f595d509d10660f030cba7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630312414),
(277, 'b306581a07c67c89eca4d2c8477657360aa5ecd61630312816742eaf0b8d43d5caebddf96fee65ed94', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630312816),
(278, 'd51638c765964f3c5d65cf3892df79c08dbc37151630312955206012b624f6cbca9d294dbe75f9037f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630312955),
(280, '215a20f65e64a58daf2015c14226c4afc97483411630314110937877e81f9edf8bf76de453074c2438', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630314110),
(282, 'def42fa80a8eec3bc77862f141ca582965b894a616303149951688683d3212d6e2fac2ce528457e846', 4, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630314995),
(289, '6d5e6a73d180ec35da9e0965e39d8725c99ae816163033086971d0db1822e7a7630ffbb37de8d9a70e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630330869),
(290, 'ee7b1f2de88467a48f5a953fb19209e29768b4bc1630332909df46a6c625168b20b831835061d1f6e1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630332909),
(296, '85e8f41f6703d47199338ef21490c21b4ff723d616303468079d4103e4eaf91454243683a0f4eae0ba', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630346807),
(297, 'ea3bdcc98af82e28930528551fe8f9a4544ee9ff1630348229add2858db00027ff19e9545124d34f51', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630348229),
(298, '4d71e909dfed97116ecca98ed2c169d41c46755516303484825a205628fe7ee22754e035225fe7afaa', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630348482),
(300, 'b68b48aad6582b549c5c517a56ab369d40dfe71e1630349051212e860598f25621ddd22093b00278a0', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"115.186.5.235\";}', 1630349051),
(301, '2e2a7fb755bb914154c77e4f157dbb24b424e6d21630349628837328e2996dda9205ab504ef0e5bc56', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630349628),
(302, '5479aad26fd734f003e681d62750b65d79fdf3a61630355055e9519dbd2fa20e1a8938d8d7214b40d3', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630355055),
(303, '54f1b1cdad8c306c2824353afdedb2f118e646e71630355165eb4feb0b503db7999db1278283c4a716', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630355165),
(304, 'ddceca3a595874b8172d163a93015f81d72c0e39163035524302229e854ae2d0a3013e32baec362995', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630355243),
(305, '1e3169351aac13331a1018a77241549ebba9ba1716303555659663d2655dc677b659507487cac9258c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630355565),
(306, 'fe5c5d83686dab047e64421927022428951e2a5b1630356080b70dd335f417f41138a6289501e4d009', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630356080),
(312, 'ef4023788f1dbf35e29336d8f073a467e87811a21630358890e94fbd32f10bf461791c3a4976458abb', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630358890),
(316, 'ae25e394b25d58d24b0d4a349e52a6679afa8ad916303595011b185a83109e3828ce41423d6d54fec7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630359501),
(317, '7f2b25c73b4350bc6248c84312f676f1ee3ee87a163039741143f264b89d0ee5d5ce84a8c09554864c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630397411),
(319, '45546e04f6aa792ab7c348b6faa9f056404c8fad1630400143fbd010dd15dd0361f67947d86b323e7d', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1630400143),
(322, 'a6472a14d88bbe57e61b2db0a9acfebac419a1e0163040688059505a0835459b19b2f9fd7ad0463c93', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"111.119.183.35\";}', 1630406880),
(323, '2e6c1e6e6842573c6063336aa2c8f572f65cdaff16304140054f342556b56e9676f067dd1cf8c6657b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630414005),
(329, '218f3faa9ca9e9a5d1a277cfffd26e6f467428aa1630422127811f59d39444584b9811ba36a96f4e65', 14, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630422127),
(332, '1d826827ac3e0059622f3c052289f340097dc13816304280464673a6bdb41935c0c9c69e2ae6cacc9b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630428046),
(337, 'c6e9dcfe3275b143a1453182a6e63c061e3fcde1163043933275907661ee19c0ccb49f70526003b7f6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630439332),
(345, '8dff01aaa773d2df0e586e4e152222e6c45565f91630441661608ecfdd208d404666d66e3d0c2345c8', 14, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630441661),
(346, 'c73eb8b973b6a24900245cc0708fda388431520c163044269191ede200361ee39ada4ca39f2c55b366', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630442691),
(347, '54f6074f0330629cde3f5e84b56c9cb5c43b51111630476311226c998b97ca88f5181c08cc4e385840', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630476311),
(348, 'bb065fef3a5b8cc4c3d496be8d00609aaa1c6833163047949681d520b356dcff017c8e970955332f34', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1630479496),
(351, 'ad480817b289473815598fa5dcdd5ff78e5b382a1630485524199039c60a41ec7d36f6b51371a5d734', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630485524),
(352, '7878be36c1680fafcea8758fa568232d247f5cfe16304896394fae7ce3abb5111ffe249208e12a424d', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"202.47.36.62\";}', 1630489639),
(353, '037e7ed690043722a604d1467c6d4bc9c858166116305039754bb40050e3c21800773bb2e37c9c60ad', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630503975),
(356, 'dfe49be301910dcfb26e2057077725dbac9f5e19163050592956ec50cc3c331c2c35e57f48917f2b84', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630505929),
(357, '6307d6fcbf816ad31343c15143b45844de995d3d1630512260ab7300eeaae2447d21c7655f36b53e52', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630512260),
(360, '3c347765216e26ddf9f6c11bd585009fa8dc84101630513715c4795627fea5acc916a532c3c9ea2640', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630513715),
(361, 'cd4a5204dd40d8a9f87ebd90e9f7b965ea2b78131630515633b728c50a37930e5f3de260976b2f7650', 4, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"115.186.4.38\";}', 1630515633),
(363, 'dacc2321980070ab71a07bcf2c5ba44ad4d2ab951630523679d20f8ee21268cf06a45ea728bf81d67f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630523679),
(364, '6412c6e7cfd0de3b9729e0ba29b9b444b8906360163052416023869a22990dd1e59310fc216d9f4d05', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630524160),
(365, '31c53cd4d437407721b1ed5c2bf0def0db391de31630524252fc6c9fb64b9b880bc794e016712ed803', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630524252),
(366, 'd8055b7d5b8ef8f9e6a57989dc821c694d55c8b8163052513491535651f6d51610c21b074debbbca8a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630525134),
(367, '73355c064ae9af51203d3becfb15aabb487405a716305367661385e23a1d904c1112b096bb220e4e5e', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630536766),
(368, 'faa861e717baa2fc1d8344beaa0098e9fbe8e81916305579810e4b5136257ee5f89ecd338ae691fcc1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630557981),
(369, 'd8dcd0169f5ce9696c6defb8fe23ea759c5160ff1630573091cfc568767129528d2a9ba55a25be467c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630573091),
(370, '9f962e1d8421d31fc0bca80e2671a06b75da5d5f16305972271d6187c4af846a7ba5c45c6bff4f338b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"115.186.7.133\";}', 1630597227),
(371, '5c6bae0e19edbaa32094fed2f789f569167ed34c1630597707dcfa2a3a5dc9a60147944379b9ba1500', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630597707),
(372, 'f0c9e6f25410574164ef21ae5b73670197b7f5f6163060138489678e972cda13d711c4355f6422c456', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630601384),
(373, '7be0713ca5934866ab89e9c2b42375267432f27316306035672865f6eb9187c2bc793ced9b3f2113e6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630603567),
(374, 'cb161b04406e4e8a4559fa591c0bec83a34fb76816306036316cd8467dfab9586b63adab74b8eca0e7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630603631),
(377, 'a49010101c2fc6584e845b01b086d6a8f882a5de1630607979b632faac2036b99dd38c9eca457cc5e6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630607979),
(379, 'f68003636a6127c493fc1969d35f730c3189031116306160289654fd9452b2b4f3030d0236d40f1dda', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630616028),
(380, '4e8ea74b9ec36cec51a2caaa3f193f3791397b1e1630672829c3d6fac578756f2b1b65461c150ba000', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630672829),
(381, '1170fb2e8193164d802ce9f35df6f235d872c43f16306777787164ab7ae86ef8a4125fa8c5043f20c6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630677778),
(382, '80310eb755877d8b5c3d2ad4de2fa8a562ff457816306984836997597bd8056541ac443b86bcb23552', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630698483),
(383, 'f9d07cca2289259584946e64992c41e02ec0e9d816306985557b6bc623a75279c12b852ce8d68dcf47', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630698555),
(384, '1f126e813826681869f5261058a190cd6c4579d516306991740840432084f3788d8ee4ffa060c3c067', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630699174),
(385, '1333b4d58245accfc8b0b30c5dc0562e6dd5ad7a16307018854c29cd69fe0a63cc6e0b58eaf7c6f1dd', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630701885),
(386, '74be53fbc7d14d7eb96783faf4af4772bcadbfaa1630702256ec9d103bbb83249c842ab2f2b497067f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630702256),
(387, '5f81528b8e344b5782ba64f8a27d856b68bceb781630735652c828b56dc2690f1a5906a7ec5a181060', 1, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"14.1.2\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630735652),
(393, 'bb46e600a23dffdb8d83be7efad344bd76ce75b11630774793d1179e03c857f5a3ec2869287f5b0e00', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"182.189.30.254\";}', 1630774793),
(394, '6c76d1f4e8a806dd912731bdddd33392209a1d201630776293630b7b9734826aee1b092f92ea8cbe17', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"182.190.18.129\";}', 1630776293),
(395, '521055d952e5c9f4e6bef3442d8d46a5b72e3bbf163078862516b784bf7c5c5f97562dbf8a63934268', 1, 'web', 'a:6:{s:9:\"userAgent\";s:122:\"Mozilla/5.0 (Linux; Android 9; SM-N950U1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:11:\"Android Web\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"37.111.130.178\";}', 1630788625),
(396, 'b989547130b983b9db1c4bbaa925782846fa46a5163080783743ff7fb59426e92af11d83bed1e87165', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630807837),
(397, '928fbf4d248be2381eb306a595d7fa8ef0128b0e1630823465afb8740e0dddcb4c6dcbbca3bf3eaa4f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 14_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/92.0.4515.90 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630823465),
(410, 'effab55e6603d7ecc8a63194bd6e7535246e02231630849514f0b743fa432382360f15c9474e41d91d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630849514),
(411, '8afa528d9953dd5c9ce343b594d3174bbb56cd4216308595656ef7bac7e02acc2eed53828b69d1e48b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"119.153.46.121\";}', 1630859565),
(414, '68a6798613a80d4ca524f89b8a9697ab9c7afdee163086739140686f1e3345a349fea54999f8ff91e1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630867391),
(415, '96a6364f83e8634a9361a88d179708f70d512d621630869998e95f5627c7508e489eaef3ca261117b7', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630869998),
(416, '71202987f9046e35f0706436a402b2b16340e4641630922441b99a5a6044259362c7ce8a55737ffb6f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1630922441),
(418, '3cba56347efa2a472c365498cc817558b8777f381631002930f543df537004a77fe2b256297dc26a96', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1631002930),
(419, 'e2a4b8c8f88026f10a20db201aea86d73e2ff596163112371284531f32a49fd36e670e7a47bf86cb91', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"93.0.4577.63\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1631123712),
(420, '64b401ea64ac349569fb49e04c1bfd19f16f7b2a16311301711370bc6c88bb85745a11031e3cfb2248', 1, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"92.0.4515.159\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"103.7.79.111\";}', 1631130171),
(421, 'cba213661a87c877410940b99e6cd959f87380b61631180234c1a669abd1f98fe3d242f2a9b62fda1f', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"93.0.4577.63\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1631180234),
(425, 'eb9462e3733db90fc00e141856d4d251fb1862aa1632636391567f67ccc5df1edd4049ee66438cba32', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"93.0.4577.82\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"85.206.10.254\";}', 1632636391),
(426, '77d9c6efd1c6124bb8301fe114e1279d6729f8931633884198b04d4b6272a940f2aee33a214094b98d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"94.0.4606.81\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"154.160.1.126\";}', 1633884198),
(427, 'a302542cc760e4b0be8cb1a03e76f8c33da56beb16339436428560bf59bc28002189a24f921d1c19ed', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"154.160.24.87\";}', 1633943642),
(428, '734a571cda1f72ec32a8232b20727d03a87cc68d1633943791edb4b373ddc654c1b7ba0f36caa80ddf', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"154.160.24.87\";}', 1633943791),
(429, '651d9a556e9bcb38306d97235ba3db66a49787a516339463489128037e0a784cb124ea913c5371f76d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"94.0.4606.81\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"154.160.21.114\";}', 1633946348),
(430, 'aabf6b4fb3b7c37bb5c94edae9a42d3cfb756239163466844271db37fd8e0b9ae630fa6020849aae73', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"94.0.4606.81\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"102.176.106.246\";}', 1634668442),
(440, '0364c7d3332422034f5f1ca08011362c9569d8641636237057c1728eefdb0f231a54285c4b3bdfcdb8', 18, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1636237057),
(444, '8c2a609b9b6310fe31d80c1b91ec839785aac39d16363275103c6ebea32673d6e770ca4e346aaac559', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Linux; Android 7.0; IRON_PRO) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.74 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"95.0.4638.74\";s:8:\"platform\";s:11:\"Android Web\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1636327510);
INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `platform_details`, `time`) VALUES
(445, 'b6a02b2acbe267ae673ee00ef6f310bdcf40175f1636540537e1aa715fea419ed7db62ed8a306ab46d', 18, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1636540537),
(446, '8618add71ae5c5b6e0950da6181a9749c6380510163697911263f53ff657d06de5b9054f84e1e3c1f4', 1, 'web', 'a:6:{s:9:\"userAgent\";s:141:\"Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/95.0.4638.50 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"105.40.126.150\";}', 1636979112),
(454, '4472b8d8ee822b378b25901d40e677c52dce09b0163698919421129f5ae2329ff67be5dcaee2056587', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1636989194),
(456, '5b9df914debf388818cb79f183c1b6bf5de7ff3816369921063dfde7a194f4b1384a741e7b454df489', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"96.0.4664.45\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"39.34.153.134\";}', 1636992106),
(457, 'c651819d6a35fd2e26bd7b2f7107d1911caa40fe1637151839a4004c457b8fdf09f828ea9bd42a7461', 19, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1637151839),
(460, '61cbb6eabb0c399e9fd2aafb1a26eae126135b15163826067087209035f4ded1ed1f87d534d508ddd0', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.111.135.149\";}', 1638260670),
(461, '238504be0a47b61a8f4ebbe7c57f0631fe851d881638272927636135cc783912418ad1edaafba96c6b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"96.0.4664.55\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.111.135.149\";}', 1638272927),
(462, 'f98d029b87dbe2e31f6c861a6df7957d8930971d1638375702852fe75797706fd35a34ed0221ab5fd9', 19, 'web', 'a:6:{s:9:\"userAgent\";s:132:\"Mozilla/5.0 (iPad; CPU OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.53 Mobile/15E148 Safari/604.1\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:5:\"604.1\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"31.10.154.183\";}', 1638375702),
(464, 'e492b76fa0a14b9345c7b8451cd1e39152c15b7716387354802d99e85a80ab7c519b3fbf14a1fa0fc4', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"96.0.4664.55\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.111.135.149\";}', 1638735480),
(465, '4c2fc5674e74f4fb267f11a2f4adf842ee84b60316414787670597fd972cf48ac04f60804ba0a12a46', 18, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"96.0.4664.110\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"129.0.76.136\";}', 1641478767),
(467, '23874a2735c370c94318922521acf2f4759510a916428529353a29a4c78b3e3254d82955ec44c29342', 1, 'web', 'a:6:{s:9:\"userAgent\";s:113:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"97.0.4692.71\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"115.186.6.154\";}', 1642852935),
(468, 'cb184ba687d3ef3752d90eec2f80de3ed0cbb6e416439659767934606d09986f2d7a718fcfddf195ca', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"154.72.156.122\";}', 1643965976),
(469, '6d41d917818c9a6dd08d7fdbb8db4acfca3c242b16446693265a8d57ee490c4b41ca85d97ca4297123', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"98.0.4758.80\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.222.134\";}', 1644669326),
(473, '0cb0ab832862a4999b687fb82603f98e8e60e5fa164690882519d2ce37daa87eb69c743540f0ea68bc', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.51\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"45.96.94.159\";}', 1646908825),
(474, '689aeca39e8ccfb15c61af771f28244db7b3cc60164734268145aa3c159b792c4d7d0d90c7d2257319', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.51\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"182.190.203.19\";}', 1647342681),
(475, 'd50ebac84213e04c6f00dd63fcb4cb8e022f810c1647673613d3c0298a55c550f6da57f395c1c97372', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.74\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.156.86.42\";}', 1647673613),
(476, 'c026c9fc99925e821a58cb5f5dc7ebee6cd9c34a1647960861e975a3ac4f2aedb57124bf9ebf64cc40', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.74\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"196.188.115.244\";}', 1647960861),
(477, '42919c90e57786ca7f9c6f931fa26dedd497372b16479617818f5866eb7149b4c528db72a4537a1879', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.82\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"196.188.115.244\";}', 1647961781),
(479, 'beb4d36208574945aaa7f243053a2e6f636453371648051687998aac688899a9c22a650057aaf362b6', 1, 'web', 'a:6:{s:9:\"userAgent\";s:113:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.74\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"111.88.36.250\";}', 1648051687),
(482, 'a9ead77d40f8f27585852ed64a3248153f39059816481467051523b992dc86ca9ea8412dfd6d7f380a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.82\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"196.188.115.244\";}', 1648146705),
(483, '58e43c12f6113fa0ce6a01e031c8d5366065f2b81648894584217a288c5d68489ad5522a680b47d871', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.4\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"197.58.78.97\";}', 1648894584),
(484, '0870d4ab819235d0ad542d8b05ea82531cf42c8f1648932610d82bb3ad8ac70282a5562254b8a2a620', 1, 'web', 'a:6:{s:9:\"userAgent\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:12:\"99.0.4844.84\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.47.113.173\";}', 1648932610),
(485, '33fefce72c787a661b297063e9764f2498ae9e8a1650024540754355397ac7a877995ea51f52cbd556', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"100.0.4896.75\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"119.152.238.162\";}', 1650024540),
(486, '46e1e3a09fdef54687cd839eddd3a1ed8602398d165002778398d497b12fec679054ffa6d12a998be0', 4, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"100.0.4896.75\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"119.152.238.162\";}', 1650027783),
(487, '02b43d11aab3758a33ea56f8d7f498d1f35bb26016500437084230bae08663829abe312a43d5331a60', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"100.0.4896.88\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.191.40.33\";}', 1650043708),
(489, 'df6dfd1b1e6a92fb6a70d01e2586314f481eb7a31650047420fb8df08022a440b164c6a3952d58f34d', 27, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"100.0.4896.75\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"119.153.46.132\";}', 1650047420),
(490, 'bef9a7a3d101b9f78831fc4454baf20cee7849121650048485eb42e0a72271fc72032535a0b28321ff', 1, 'web', 'a:6:{s:9:\"userAgent\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"100.0.4896.88\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"111.88.35.58\";}', 1650048485),
(492, 'fc4fecb2a5097bcf093ce06e43eebe24be5c203d1650692995e6063a5eb4d23d815d4e64c13635375b', 1, 'web', 'a:6:{s:9:\"userAgent\";s:116:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"41.86.49.34\";}', 1650692995),
(494, 'a571e24dfff909140d3575819b0803361af4dd2416507154021d184ea6c85fe56bbd4cceaee3e30ccf', 1, 'web', 'a:6:{s:9:\"userAgent\";s:116:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"41.86.49.34\";}', 1650715402),
(507, '4a8715f23c799e2c3c269b165f0ce0e778fe1f2516509130353c2c10d2e76b478d148d7eb8029bfa53', 27, 'web', 'a:6:{s:9:\"userAgent\";s:122:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.203.222.223\";}', 1650913035),
(510, '573616f7ccf64e3c780bad6c674ccbbe6e312a8a1650947805a73c6a89dc4e7dc7737bca6c71a6e775', 27, 'web', 'a:6:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Linux; Android 9; ANE-LX2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:11:\"Android Web\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"154.68.36.186\";}', 1650947805),
(511, 'f1cc0f7b261a2918781903ae1daf33bfe6f42a6616509564540ac33777d6cc86496e1a6d352d8ffba1', 27, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"13.0.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.85.162.23\";}', 1650956454),
(512, '8dcb0b9745e7d5e7a919eaa04b160ede1d3228301650972887e09ff5dac9215fa1e748a821035514e6', 27, 'web', 'a:6:{s:9:\"userAgent\";s:134:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.50\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:12:\"41.65.226.67\";}', 1650972887),
(515, '461f2ab265f97951b1b2af7ae1e71bbc80f570fe165121836478a5a03b0d6597a30c47791783df79de', 27, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.4\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"102.112.111.29\";}', 1651218364),
(516, '9755f679841265a13438facadd549b676d5f04b4165124066863fcad0aa6a273746d74544d931c1b00', 27, 'web', 'a:6:{s:9:\"userAgent\";s:116:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"105.196.92.226\";}', 1651240668),
(518, '957cd63c19e2404349123f9f5efc57b5e00f8f7d1651327622a80c0272c3292dc7b3e40a7a4f79e4df', 1, 'web', 'a:6:{s:9:\"userAgent\";s:116:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:14:\"100.0.4896.127\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.234.133.228\";}', 1651327622),
(520, 'fc16a94290542740daf87eb6e0917773d10b6e18165225903677d7d5497efca12d66604b10bb8ee7a1', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.64\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.191.107.34\";}', 1652259036),
(521, 'c60c2f00cf029d65f3267c4b04abfa6f85df830a165225915209afc23379d19a210f86729e5939e1cb', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.64\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.191.107.34\";}', 1652259152),
(522, 'ce9277122e07e6bb85c9dbc32fd95c6de65cccc716522597824de5d94d237624dcb1b1d9fe383db48d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.64\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.191.107.34\";}', 1652259782),
(525, 'b22f0e9271515edf7ee6b6b4fdf070dbd8afafc516524664757eb16a598d300c4e42bf009b57d6570a', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.64\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.240.242\";}', 1652466475),
(527, '9c9a11a830aa1170e3c3508259e41a9b7617f23516524893942e7b5fd714bd5932172be529ea2b7163', 1, 'web', 'a:6:{s:9:\"userAgent\";s:133:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.54\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.240.242\";}', 1652489394),
(529, 'd6a70f353541b2ac3998c6ae1b12f3fa59d330a616524899971ed4492560c662f998088b8687489c9d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.54\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.240.242\";}', 1652489997),
(532, '0ba2f05311895df24ab6af43cc79819288260cfb165249046168676aede0a7ed8ba76b79d1f991d8ed', 30, 'web', 'a:6:{s:9:\"userAgent\";s:133:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.54\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"197.58.240.242\";}', 1652490461),
(536, '017ee8bae5fd90011314b00f2db3da3e7a386e6116533911761b46b1832c16d982a8822593e2ebbeaf', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"101.0.4951.64\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1653391176),
(541, '5f7347f3109a3045852c0b43597458d5e82b1c9d1653830969b5dcbf922a850503bcfa8483955f1b17', 1, 'web', 'a:6:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"102.0.5005.61\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1653830969),
(542, 'f59d4405e33bdfc0f0d0f6c08b6cb7a9bbedb9611655399792eaf47e53203b40b384a62f509bd785f0', 1, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"102.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1655399792),
(543, '21c22f15ddb5eeda39c09e48fe3eff086b919f4c1656165933ba5afbec28029bbe129bbcdbc4868daf', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.5\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656165933),
(544, '3b542d713498f5b05d2765ab9edccbcedc99c9b91656173628001eb68172da4503488a5d9aaae16a03', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656173628),
(546, '513037b5c2cbb6a4bc08faf04f1512ae942e142d16561751580e80b01fc1352c21b31943014ee64678', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656175158),
(547, '392fc59429a54bb15935d98d7734a5608f406e8b165617592757e658844fc2a6ef4966cfbfe704ef75', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656175927),
(548, '8f9efad1131c0f4e5078ae003111bf43b2aa6dad1656176581dcfaf2962fac61e8c81be1e9ea67e788', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656176581),
(549, '481ed9fc90e1b0b537b4ea7d87065e0c1e3759e2165617922462361d9a5e9b7f190747ece33969e962', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1656179224),
(557, 'f78eba2a8e0197e204a6c53d6a0c7c9163ff435b1656865488302c831f8a91563ee374dcace796e315', 32, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.54.115\";}', 1656865488),
(558, 'cae8bb905518be590b71d30d06fe74b2684153be16568664084dca9dc46984d5b3f7ecd612cb01171f', 32, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.54.115\";}', 1656866408),
(559, 'b66b4c90d7429bbacd66eab3bce19daf73f6bcec1656866501b59ab3fbabe2946e57068048b50f7b5f', 33, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.54.115\";}', 1656866501),
(563, '3cb4a8b3ecdc88c805363f9fe943701b86dd659316568694576330442378baa6a23f7f9791979821ca', 33, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"41.249.124.130\";}', 1656869457),
(568, 'd5fcef8305c967b87f46e96ac0ce6e91c551e82216570806003dc6439579deb1c0a6ace725b50317a6', 32, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.54.115\";}', 1657080600),
(569, 'e2e645c5742475c4ec418fe7777238d11e24e5aa16571103553db04fad5273c78da9dcf7fedd083dfc', 35, 'web', 'a:6:{s:9:\"userAgent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:6:\"13.0.3\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"196.117.177.67\";}', 1657110355),
(575, 'e9d94a44fc5c749df1577d8841400fdce3356b111657120524aa180c7f49a221385c74f08504e79a2c', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"103.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"197.58.54.115\";}', 1657120524),
(576, '6401b3822133b6abbd4b681491e123c0f9fe588f1657160290c7c74a5ef434e65fdf1d0820f0550bbe', 36, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15\";s:4:\"name\";s:12:\"Apple Safari\";s:7:\"version\";s:4:\"15.5\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Safari|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"5.195.34.21\";}', 1657160290),
(577, 'f290602d7a6ef91879f9c7b0d2cd8f2e7516f60016572488024c39b2f5bb95e3f41933e80d3ad1b2d0', 32, 'web', 'a:6:{s:9:\"userAgent\";s:133:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36 Edg/103.0.1264.44\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"103.0.5060.66\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"102.44.187.57\";}', 1657248802),
(578, 'de480e8d70eb950cf60fd4e99305a1bb682ac00e16623820334587b0f0cfed8688032e2d15305e8560', 1, 'web', 'a:6:{s:9:\"userAgent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"104.0.0.0\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:13:\"41.34.241.136\";}', 1662382033),
(580, '6e4db7d4df7c50add20c2c927dff03eef2b21aca1667904290dc3f174e44ec99ffb0275da8c3ac067d', 1, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"107.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:11:\"41.42.73.97\";}', 1667904290),
(581, 'ff741be8b59f1f9806b83501f0a4c5ae3763947a1674903567bcf335ccc2e3ef0503674befb3e415cb', 1, 'web', 'a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"109.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1674903567),
(584, 'cfc9aecb075e939c038448e36c58c779ba85113716788226011d4bdf38c1e2719a94f728f94cf77504', 1, 'web', 'a:6:{s:9:\"userAgent\";s:129:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.69\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"110.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:3:\"::1\";}', 1678822601),
(585, '6b7067fc92994c257b1f7ec93ef27e1462c58bc91679376318e2305e3c71b2d8c4fd5f2d78fa09faa4', 1, 'web', 'a:6:{s:9:\"userAgent\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:5:\"111.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:9:\"127.0.0.1\";}', 1679376318);

-- --------------------------------------------------------

--
-- Table structure for table `shared_playlist`
--

CREATE TABLE `shared_playlist` (
  `id` int(11) NOT NULL,
  `playlist_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `sent_by` varchar(225) DEFAULT NULL,
  `sent_at` varchar(225) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `valid_till` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shared_playlist`
--

INSERT INTO `shared_playlist` (`id`, `playlist_id`, `user_id`, `sent_by`, `sent_at`, `status`, `topic_id`, `valid_till`) VALUES
(1, '', '5', '1', '1648057555', '1', 9, '2022-03-25'),
(2, '', '24', '1', '1648057555', '1', 9, '2022-03-25'),
(3, '', '5', '1', '1650044236', '1', 11, '2022-04-16'),
(4, '', '27', '1', '1651042902', '1', 13, '2022-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `site_ads`
--

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `site_ads`
--

INSERT INTO `site_ads` (`id`, `placement`, `code`, `active`) VALUES
(1, 'header', '', 0),
(2, 'footer', '', 0),
(3, 'watch_side_bar', '', 0),
(4, 'watch_comments', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `caption` varchar(225) DEFAULT NULL,
  `craeted_at` varchar(225) DEFAULT NULL,
  `status` varchar(225) NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `subscriber_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `subscriber_id`, `time`, `active`) VALUES
(1, 1, 9, 1620155590, 1);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `type` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `type`, `text`) VALUES
(1, 'terms_of_use', '&lt;h4&gt;1- Write your Terms Of Use here.&lt;/h4&gt;           &lt;br&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          &lt;br&gt;&lt;br&gt;          &lt;h4&gt;2- Random title&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'privacy_policy', '&lt;h2&gt;Who we are?&lt;/h2&gt;Provide name and contact details of the data controller. This will typically be your business or you, if you are a sole trader. Where applicable, you should include the identity and contact details of the controller’s representative and/or the data protection officer.   &lt;br&gt;&lt;h2&gt;What information do we collect?&lt;/h2&gt; Specify the types of personal information you collect, eg names, addresses, user names, etc. You should include specific details on: &lt;br&gt;how you collect data (eg when a user registers, purchases or uses your services, completes a contact form, signs up to a newsletter, etc)  &lt;br&gt;what specific data you collect through each of the data collection method &lt;br&gt;if you collect data from third parties, you must specify categories of data and source &lt;br&gt;if you process sensitive personal data or financial information, and how you handle this  &lt;br&gt;&lt;br&gt;You may want to provide the user with relevant definitions in relation to personal data and sensitive personal data.  &lt;br&gt;&lt;br&gt;&lt;h2&gt;How do we use personal information?&lt;/h2&gt;Describe in detail all the service- and business-related purposes for which you will process data. For example, this may include things like: &lt;br&gt;personalisation of content, business information or user experience &lt;br&gt;account set up and administration &lt;br&gt;delivering marketing and events communication &lt;br&gt;carrying out polls and surveys &lt;br&gt;internal research and development purposes &lt;br&gt;providing goods and services &lt;br&gt;legal obligations (eg prevention of fraud) &lt;br&gt;meeting internal audit requirements &lt;br&gt;&lt;br&gt;Please note this list is not exhaustive. You will need to record all purposes for which you process personal data.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;What legal basis do we have for processing your personal data?&lt;/h2&gt;Describe the relevant processing conditions contained within the GDPR. There are six possible legal grounds:  &lt;br&gt;consent &lt;br&gt;contract &lt;br&gt;legitimate interests &lt;br&gt;vital interests &lt;br&gt;public task  &lt;br&gt;legal obligation &lt;br&gt;&lt;br&gt;Provide detailed information on all grounds that apply to your processing, and why. If you rely on consent, explain how individuals can withdraw and manage their consent. If you rely on legitimate interests, explain clearly what these are. &lt;br&gt; &lt;br&gt;If you’re processing special category personal data, you will have to satisfy at least one of the six processing conditions, as well as additional requirements for processing under the GDPR. Provide information on all additional grounds that apply.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;When do we share personal data?&lt;/h2&gt;Explain that you will treat personal data confidentially and describe the circumstances when you might disclose or share it. Eg, when necessary to provide your services or conduct your business operations, as outlined in your purposes for processing. You should provide information on: &lt;br&gt;how you will share the data &lt;br&gt;what safeguards you will have in place &lt;br&gt;what parties you may share the data with and why &lt;br&gt; &lt;br&gt;&lt;h2&gt;Where do we store and process personal data?&lt;/h2&gt; If applicable, explain if you intend to store and process data outside of the data subject’s home country. Outline the steps you will take to ensure the data is processed according to your privacy policy and the applicable law of the country where data is located. &lt;br&gt; &lt;br&gt;If you transfer data outside the European Economic Area, outline the measures you will put in place to provide an appropriate level of data privacy protection. Eg contractual clauses, data transfer agreements, etc. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How do we secure personal data?&lt;/h2&gt; Describe your approach to data security and the technologies and procedures you use to protect personal information. For example, these may be measures: &lt;br&gt;to protect data against accidental loss &lt;br&gt;to prevent unauthorised access, use, destruction or disclosure &lt;br&gt;to ensure business continuity and disaster recovery &lt;br&gt;to restrict access to personal information &lt;br&gt;to conduct privacy impact assessments in accordance with the law and your business policies &lt;br&gt;to train staff and contractors on data security &lt;br&gt;to manage third party risks, through use of contracts and security reviews &lt;br&gt; &lt;br&gt;Please note this list is not exhaustive. You should record all mechanisms you rely on to protect personal data. You should also state if your organisation adheres to certain accepted standards or regulatory requirements. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How long do we keep your personal data for?&lt;/h2&gt; &lt;br&gt;Provide specific information on the length of time you will keep the information for in relation to each processing purpose. The GDPR requires you to retain data for no longer than reasonably necessary. Include details of your data or records retention schedules, or link to additional resources where these are published. &lt;br&gt; &lt;br&gt;If you cannot state a specific period, you need to set out the criteria you will apply to determine how long to keep the data for (eg local laws, contractual obligations, etc) &lt;br&gt; &lt;br&gt;You should also outline how you securely dispose of data after you no longer need it. &lt;br&gt;&lt;br&gt;&lt;h2&gt;Your rights in relation to personal data&lt;/h2&gt; Under the GDPR, you must respect the right of data subjects to access and control their personal data. In your privacy notice, you must outline their rights in respect of: &lt;br&gt;access to personal information  &lt;br&gt;correction and deletion &lt;br&gt;withdrawal of consent (if processing data on condition of consent) &lt;br&gt;data portability &lt;br&gt;restriction of processing and objection &lt;br&gt;lodging a complaint with the Information Commissioner’s Office &lt;br&gt; &lt;br&gt;You should explain how individuals can exercise their rights, and how you plan to respond to subject data requests. State if any relevant exemptions may apply and set out any identity verification procedures you may rely on. &lt;br&gt; &lt;br&gt;Include details of the circumstances where data subject rights may be limited, eg if fulfilling the data subject request may expose personal data about another person, or if you’re asked to delete data which you are required to keep by law.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of automated decision-making and profiling&lt;/h2&gt; Where you use profiling or other automated decision-making, you must disclose this in your privacy policy. In such cases, you must provide details on existence of any automated decision-making, together with information about the logic involved, and the likely significance and consequences of the processing of the individual. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How to contact us?&lt;/h2&gt; Explain how data subject can get in touch if they have questions or concerns about your privacy practices, their personal information, or if they wish to file a complaint. Describe all ways in which they can contact you – eg online, by email or postal mail. &lt;br&gt;&gt; &lt;br&gt;If applicable, you may also include information on: &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of cookies and other technologies&lt;/h2&gt; You may include a link to further information, or describe within the policy if you intend to set and use cookies, tracking and similar technologies to store and manage user preferences on your website, advertise, enable content or otherwise analyse user and usage data. Provide information on what types of cookies and technologies you use, why you use them and how an individual can control and manage them. &lt;br&gt; &lt;br&gt;Linking to other websites / third party content &lt;br&gt;If you link to external sites and resources from your website, be specific on whether this constitutes endorsement, and if you take any responsibility for the content (or information contained within) any linked website. &lt;br&gt;&lt;br&gt;You may wish to consider adding other optional clauses to your privacy policy, depending on your business’ circumstances.'),
(3, 'about', '&lt;h4&gt;1- Write about your website here.&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          &lt;br&gt;&lt;br&gt;          &lt;h4&gt;2- Random title&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dxzcolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cover` varchar(500) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typings`
--

CREATE TABLE `typings` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_videos`
--

CREATE TABLE `uploaded_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `path` varchar(300) NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `uploaded_videos`
--

INSERT INTO `uploaded_videos` (`id`, `user_id`, `path`, `time`) VALUES
(14, 1, 'upload/videos/2022/04/8rgzFFuxlMhU6kbP5HO8_15_58e69fac340df3d0363ac791cc060a8d_video.mp4', 1650016378),
(36, 1, 'upload/videos/2022/06/lciUzYoTKxKQS19CWSQm_14_95b0d8bdbb06fdf84e405bb41ba7406e_video.mp4', 1655236821),
(37, 1, 'upload/videos/2022/06/8ACivtQGJFYJ3P3XyFFl_14_03e87fd99ed4c2a5b247d2b65c332fae_video.mp4', 1655236870),
(38, 1, 'upload/videos/2022/06/XZInUedBM4UTbiPZRYmP_14_d90b68d5f3b8e5607643c41631069dc6_video.mp4', 1655236921),
(39, 1, 'upload/videos/2022/06/Crc1QoqGAL2lEOsvwTRB_14_95846ee950465535eb0438b3b79524cd_video.mp4', 1655236948),
(40, 1, 'upload/videos/2022/06/1Qp3NhqpvPJa7mYVhG9l_14_2feadb0cc74925c50a09dca8d47dd481_video.mp4', 1655237039),
(41, 1, 'upload/videos/2022/06/a9l3sHj2PKH6O3fqOkyt_14_8a82854e124c03bace14bc80bdae1645_video.mp4', 1655237074),
(42, 1, 'upload/videos/2022/06/derS1FG1J9dT8cfMCXgZ_14_8b21e2536e4797b313ce4d53c98b7f98_video.mp4', 1655237123),
(43, 1, 'upload/videos/2022/06/dKAWr9P4X1mDAKGwPKqO_16_3fcf418bda9e00285743247a3205aa91_video.mp4', 1655338372),
(44, 1, 'upload/videos/2022/06/Tc43jlWpbB1EZkGzYAf5_16_bdb97ebeb05d99968c06b2ef337f3cdc_video.mp4', 1655338395),
(45, 1, 'upload/videos/2022/06/EYA8MQ4RS1Z9mHMUISmL_16_f05fc7ae4fc9d6b3cb0543e75037d1cb_video.mp4', 1655338502),
(46, 1, 'upload/videos/2023/02/BaZALUu6mPsAx5pFyf1v_14_5eb50395d69e8f7833b8aea5a3d4fba7_video.mp4', 1676389050),
(47, 1, 'upload/videos/2023/02/ylztaY69TUa4pOTHmsz3_14_05d2f0558a38912fc63cd307cbf2ad87_video.mp4', 1676389067),
(48, 1, 'upload/videos/2023/03/5rrTNU6JZrVx5hgOuR3S_14_79f8736f627d016db9a94dd05213a9e2_video.mp4', 1678823827),
(49, 1, 'upload/videos/2023/03/2hpEwCCkmkscyibjLun9_14_d5d5327cb115b1571267d7805fd1f9a5_video.mp4', 1678823874),
(50, 1, 'upload/videos/2023/03/UAt4TujrY5eBhSyiXpRp_14_07d59a8c5be2af580d8822c4a45eea07_video.mp4', 1678823883),
(51, 1, 'upload/videos/2023/03/eGq4UdcbTg5J1F5bPDaV_14_ab9d96920e7f50ba98f88012ce465ce8_video.mp4', 1678823914);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `device_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'english',
  `avatar` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `src` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT 0,
  `age` int(11) NOT NULL DEFAULT 0,
  `about` text DEFAULT NULL,
  `google` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `instagram` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0,
  `last_active` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0000/00',
  `time` int(11) NOT NULL DEFAULT 0,
  `is_pro` int(11) NOT NULL DEFAULT 0,
  `imports` int(11) NOT NULL DEFAULT 0,
  `uploads` int(11) NOT NULL DEFAULT 0,
  `wallet` float NOT NULL DEFAULT 0,
  `balance` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `video_mon` int(10) NOT NULL DEFAULT 0,
  `age_changed` int(11) NOT NULL DEFAULT 0,
  `donation_paypal_email` varchar(100) NOT NULL DEFAULT '',
  `user_upload_limit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `two_factor` int(11) NOT NULL DEFAULT 0,
  `last_month` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active_time` int(50) NOT NULL DEFAULT 0,
  `active_expire` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zip` int(11) NOT NULL DEFAULT 0,
  `subscriber_price` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `monetization` int(11) NOT NULL DEFAULT 0,
  `new_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fav_category` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `total_ads` float NOT NULL DEFAULT 0,
  `suspend_upload` int(11) NOT NULL DEFAULT 0,
  `suspend_import` int(11) NOT NULL DEFAULT 0,
  `paystack_ref` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ConversationId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `point_day_expire` int(50) NOT NULL DEFAULT 0,
  `points` float UNSIGNED NOT NULL DEFAULT 0,
  `daily_points` int(11) NOT NULL DEFAULT 0,
  `info_file` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `google_tracking_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `newsletters` int(11) NOT NULL DEFAULT 0,
  `can_share_video` int(11) NOT NULL DEFAULT 1,
  `role` varchar(50) NOT NULL,
  `equipment_size` varchar(50) NOT NULL,
  `shoe_size` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `ip_address`, `password`, `first_name`, `last_name`, `gender`, `email_code`, `device_id`, `language`, `avatar`, `cover`, `src`, `country_id`, `age`, `about`, `google`, `facebook`, `twitter`, `instagram`, `active`, `admin`, `verified`, `last_active`, `registered`, `time`, `is_pro`, `imports`, `uploads`, `wallet`, `balance`, `video_mon`, `age_changed`, `donation_paypal_email`, `user_upload_limit`, `two_factor`, `last_month`, `active_time`, `active_expire`, `phone_number`, `address`, `city`, `state`, `zip`, `subscriber_price`, `monetization`, `new_email`, `fav_category`, `total_ads`, `suspend_upload`, `suspend_import`, `paystack_ref`, `ConversationId`, `point_day_expire`, `points`, `daily_points`, `info_file`, `google_tracking_code`, `newsletters`, `can_share_video`, `role`, `equipment_size`, `shoe_size`) VALUES
(1, 'REFEREEING', 'creative_15@live.com', '127.0.0.1', 'fb3619bb8d0dbde47731b8230069955069e3a70c', 'REF', 'ADMIN', 'male', '', '', 'english', 'upload/photos/2022/04/d-avatar.jpg', 'upload/photos/2022/06/XQNzChmFZcqRKIIfAQWN_16_1c6211406770cbd9562f2a57a39243a0_image.jpg', '', 63, 0, 'Refereeing support', '', '', '', '', 1, 1, 1, 1681654220, '00/0000', 0, 0, -2, 2127006793, 1.24, '0', 0, 0, '', 'unlimited', 0, '{\"likes\":0,\"dislikes\":0,\"views\":0,\"comments\":0,\"update_time\":1682899140}', 192, '1682121540', '', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 1627430340, 124, -260, '', '', 0, 1, '', '', ''),
(27, 'members', 'tanveer@mailinator.com', '41.191.107.34', 'fb3619bb8d0dbde47731b8230069955069e3a70c', 'CAF', 'REL', 'male', '', '', 'english', 'upload/photos/2022/04/uWkdr685KX5TsSXXfAJj_25_b6152a06943e53fbcf411a652446bf14_image.jpg', 'upload/photos/2022/04/faP4XU6PMsTVUHKE1d2q_25_7548965c5d8fd979acae01386d3b6d90_image.jpg', '', 63, 0, '', '', '', '', '', 1, 0, 0, 1652259006, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 6, '1652486340', '+923232332', '', '', '', 0, '0', 0, '', '', 0, 1, 1, '', '', 0, 0, 0, '', '', 0, 1, 'IT Support', 'M', 'MD'),
(30, 'ramy.caf', 'ramy.caf@gmail.com', '197.58.240.242', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'lim', 'kee', 'male', '', '', 'english', 'backend/files/627efd87ad1eb_Untitled-2.png', 'backend/files/627efd8e2b9b5_LOGOS.png', '', 63, 0, NULL, '', '', '', '', 1, 0, 0, 1652525809, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 990, '1653091140', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Referee', 'S', '45'),
(31, 'ramygamal.tech', 'ramygamal.tech@gmail.com', '197.58.240.242', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'mamadou', 'haidara', 'male', '', '', 'english', 'upload/photos/2022/05/tuoF9CKB7cBeoYwfj4zN_14_854c187b4f8cb329b02a62ae2fc99014_image.png', '', '', 2, 0, NULL, '', '', '', '', 1, 0, 0, 1652490444, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 132, '1653091140', '012011145555', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'VAR Instructor', 'S', '22'),
(32, 'wafcon22', 'wafcon22@refereeing.online', '102.44.187.57', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'WAFCON22', '', 'male', '', '', 'english', 'upload/photos/2022/07/PA3KcCaestEJbB3CQJHk_03_636e12142e43a41eab4ab688634ed033_image.jpg', 'upload/photos/2022/07/8sW8HQGcwLbQsDYtLDQv_03_636e12142e43a41eab4ab688634ed033_image.png', '', 63, 0, '', '', '', '', '', 1, 1, 1, 1661503794, '0000/00', 0, 0, 0, 1229018674, 0, '0', 0, 0, '', '0', 0, NULL, 18, '1661558340', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Admin', 'L', '45'),
(33, 'jerome', 'jerome@refereeing.online', '197.58.54.115', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jerome', 'Damon', 'male', '', '', 'english', 'upload/photos/2022/07/DjHbxWTqHD3xcGkeFZoK_03_5596401e54215b96de002c444aeb3c57_image.jpg', '', '', 197, 0, NULL, '', '', '', '', 1, 0, 0, 1657036466, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 5574, '1657324740', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Technical Assessor', 'M', '44'),
(34, 'eddy', 'eddy@refereeing.online', '41.42.73.97', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Eddy', 'Maillet', 'male', '', '', 'english', 'upload/photos/2022/07/uZksy7ZLMnNWNfywNa5z_03_657a76d252d8252d780e1a9d8487ab30_image.jpg', '', '', 190, 0, NULL, '', '', '', '', 1, 0, 0, 1667904264, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 18, '1668211140', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Staff', 'L', '45'),
(35, 'Tempa', 'tempa@refereeing.online', '196.117.177.67', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Tempa', 'Ndah', 'male', '', '', 'english', 'upload/photos/2022/07/R51U2kVAFCP8g6H145rl_05_10bf3ae82b5478eed7e6332d67b920e3_image.jpg', '', '', 25, 0, NULL, '', '', '', '', 1, 0, 0, 1657112280, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 6252, '1657324740', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Technical Assessor', 'S', '41'),
(36, 'limkee', 'limkee@refereeing.online', '5.195.34.21', 'eaaa840d9933eba34f26fa3f1db29f5c7d232c76', 'Lim', 'kee chong', 'male', '', '', 'english', 'upload/photos/2022/07/bM9RKNhnGrBYnyE78Iqm_06_6010a876f6cebe9f37b30c10266abebe_image.jpg', '', '', 1, 0, NULL, '', '', '', '', 1, 0, 0, 1657257025, '0000/00', 0, 0, 0, 0, 0, '0', 0, 0, '', '0', 0, NULL, 666, '1657324740', '01201117588', '', '', '', 0, '0', 0, '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', 0, 1, 'Technical Assessor', 'M', '43');

-- --------------------------------------------------------

--
-- Table structure for table `user_ads`
--

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT 0,
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT 1,
  `audience` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `day_limit` varchar(11) NOT NULL DEFAULT '0',
  `day` varchar(50) NOT NULL DEFAULT '',
  `day_spend` varchar(11) NOT NULL DEFAULT '0',
  `lifetime_limit` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_channel`
--

CREATE TABLE `user_channel` (
  `user_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_channel`
--

INSERT INTO `user_channel` (`user_id`, `channel_id`) VALUES
(1, 1),
(1, 2),
(4, 7),
(4, 8),
(1, 3),
(1, 4),
(1, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(1, 9),
(18, 9),
(1, 5),
(15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_collection`
--

CREATE TABLE `user_collection` (
  `user_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_collection`
--

INSERT INTO `user_collection` (`user_id`, `channel_id`) VALUES
(1, 60),
(1, 63),
(4, 64),
(1, 60),
(1, 60),
(1, 60),
(4, 60),
(1, 60),
(1, 60),
(1, 60),
(1, 66),
(1, 60),
(1, 60),
(1, 60),
(14, 66),
(1, 2),
(1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `user_ids` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `name`, `user_ids`) VALUES
(5, 'Group 1', '1,14'),
(7, 'Group 2', '23,24'),
(8, 'staff', '30,31');

-- --------------------------------------------------------

--
-- Table structure for table `user_library`
--

CREATE TABLE `user_library` (
  `user_id` int(11) DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_library`
--

INSERT INTO `user_library` (`user_id`, `library_id`) VALUES
(27, 15),
(25, 16),
(27, 16),
(4, 8),
(14, 8),
(4, 13),
(27, 18),
(27, 19),
(27, 20),
(30, 22),
(31, 22),
(27, 17),
(33, 25),
(34, 25),
(35, 25),
(36, 25),
(30, 30),
(30, 33),
(30, 34),
(30, 35),
(30, 31),
(32, 31),
(30, 29),
(31, 36),
(30, 37),
(33, 32),
(35, 32),
(32, 40),
(27, 39),
(31, 38),
(31, 41);

-- --------------------------------------------------------

--
-- Table structure for table `user_playlist`
--

CREATE TABLE `user_playlist` (
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_playlist`
--

INSERT INTO `user_playlist` (`user_id`, `category_id`) VALUES
(4, 0),
(13, 0),
(1, 0),
(4, 0),
(4, 0),
(4, 0),
(4, 1),
(1, 1),
(4, 1),
(4, 1),
(4, 1),
(1, 21),
(1, 21),
(1, 25),
(1, 25),
(1, 25),
(1, 21),
(1, 22),
(4, 21),
(1, 21),
(1, 21),
(1, 21),
(1, 27),
(1, 27),
(1, 28),
(1, 1),
(1, 2),
(1, 3),
(1, 1),
(1, 3),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 5),
(1, 6),
(1, 5),
(1, 7),
(1, 7),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 9),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(1, 10),
(4, 9),
(1, 11),
(1, 11),
(1, 11),
(1, 11),
(17, 12),
(17, 12),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 19),
(17, 12),
(17, 12),
(17, 12),
(17, 15),
(17, 15),
(17, 15),
(17, 17),
(17, 17),
(17, 17),
(17, 17),
(17, 17),
(17, 17),
(17, 17),
(17, 17),
(17, 20),
(17, 20),
(17, 20),
(17, 20),
(17, 20),
(17, 20),
(17, 20),
(17, 20),
(17, 18),
(17, 18),
(17, 18),
(17, 16),
(17, 14),
(17, 13),
(17, 19),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 20),
(1, 20),
(1, 20),
(1, 20),
(1, 20),
(1, 20),
(1, 17),
(1, 17),
(1, 17),
(1, 17),
(1, 17),
(1, 17),
(1, 17),
(1, 17),
(1, 18),
(1, 18),
(1, 15),
(1, 15),
(1, 14),
(1, 16),
(1, 16),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 19),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(32, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12),
(1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `user_shared_playlist`
--

CREATE TABLE `user_shared_playlist` (
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `shared_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_shared_playlist`
--

INSERT INTO `user_shared_playlist` (`user_id`, `category_id`, `shared_by`) VALUES
(4, 1, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usr_prof_fields`
--

CREATE TABLE `usr_prof_fields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `fid_2` varchar(32) NOT NULL DEFAULT '',
  `fid_3` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_requests`
--

CREATE TABLE `verification_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(200) NOT NULL DEFAULT '',
  `message` text DEFAULT NULL,
  `media_file` text DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `user_id` int(11) DEFAULT 0,
  `short_id` varchar(10) DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'upload/photos/thumbnail.jpg',
  `video_location` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `youtube` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vimeo` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `daily` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `facebook` varchar(100) DEFAULT '',
  `ok` varchar(100) DEFAULT '',
  `twitch` varchar(100) DEFAULT '',
  `twitch_type` varchar(50) DEFAULT '',
  `time` int(11) DEFAULT 0,
  `time_date` timestamp NULL DEFAULT current_timestamp(),
  `active` int(11) DEFAULT 1,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '00:00',
  `size` int(50) DEFAULT 0,
  `converted` int(5) DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `featured` int(11) DEFAULT 0,
  `registered` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0000/00',
  `privacy` int(11) DEFAULT 0,
  `age_restriction` int(11) DEFAULT 1,
  `type` varchar(100) DEFAULT '',
  `approved` int(11) DEFAULT 1,
  `240p` int(11) DEFAULT 0,
  `360p` int(11) DEFAULT 0,
  `480p` int(11) DEFAULT 0,
  `720p` int(11) DEFAULT 0,
  `1080p` int(11) DEFAULT 0,
  `2048p` int(11) DEFAULT 0,
  `4096p` int(11) DEFAULT 0,
  `sell_video` float UNSIGNED DEFAULT 0,
  `sub_category` varchar(100) DEFAULT '',
  `geo_blocking` varchar(200) DEFAULT '',
  `demo` varchar(3000) DEFAULT '',
  `gif` varchar(3000) DEFAULT '',
  `is_movie` int(11) DEFAULT 0,
  `stars` varchar(200) DEFAULT '',
  `producer` varchar(200) DEFAULT '',
  `country` varchar(50) DEFAULT '',
  `movie_release` varchar(4) DEFAULT '',
  `quality` varchar(11) DEFAULT '',
  `rating` varchar(11) DEFAULT '',
  `monetization` int(11) DEFAULT 1,
  `rent_price` int(11) DEFAULT 0,
  `stream_name` varchar(150) DEFAULT '',
  `live_time` int(50) DEFAULT 0,
  `live_ended` int(11) DEFAULT 0,
  `agora_resource_id` text DEFAULT NULL,
  `agora_sid` varchar(500) DEFAULT '',
  `license` varchar(100) DEFAULT '',
  `is_stock` int(11) DEFAULT 0,
  `trailer` varchar(3000) DEFAULT '',
  `embedding` int(11) DEFAULT 0,
  `live_chating` varchar(11) DEFAULT 'on',
  `publication_date` int(50) DEFAULT 0,
  `channel_id` int(11) DEFAULT NULL,
  `free_kick_decision` varchar(255) DEFAULT NULL,
  `yellow_card_decision` varchar(255) DEFAULT NULL,
  `is_decision` int(11) DEFAULT 1,
  `is_explaination` int(11) DEFAULT 1,
  `is_comment` int(11) DEFAULT 1,
  `topic_id` int(11) DEFAULT NULL,
  `technical` varchar(250) DEFAULT '',
  `disciplinary` varchar(250) DEFAULT '',
  `var_technical` varchar(250) DEFAULT '',
  `var_disciplinary` varchar(250) DEFAULT '',
  `technical_value` varchar(250) DEFAULT NULL,
  `disciplinary_value` varchar(250) DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos_transactions`
--

CREATE TABLE `videos_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `paid_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `admin_com` varchar(11) NOT NULL DEFAULT '0',
  `currency` varchar(11) NOT NULL DEFAULT 'USD',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_ads`
--

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL,
  `ad_link` varchar(400) NOT NULL DEFAULT '',
  `name` varchar(300) NOT NULL DEFAULT '',
  `ad_media` varchar(400) NOT NULL DEFAULT '',
  `ad_image` varchar(400) NOT NULL DEFAULT '',
  `skip_seconds` int(11) NOT NULL DEFAULT 0,
  `vast_type` varchar(30) NOT NULL DEFAULT '',
  `vast_xml_link` varchar(700) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_topic`
--

CREATE TABLE `video_topic` (
  `video_id` int(11) DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `fingerprint` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `video_id`, `fingerprint`, `user_id`, `time`) VALUES
(1, 4, '623742b493b39923cff27112498599b0f56221d5', 0, '1619426234'),
(2, 3, '623742b493b39923cff27112498599b0f56221d5', 4, '1619426704'),
(3, 3, '623742b493b39923cff27112498599b0f56221d5', 1, '1619426946'),
(4, 4, '623742b493b39923cff27112498599b0f56221d5', 1, '1619433408'),
(5, 1, '62db7b23adb36917253cfa2418ecd72e51d4206e', 1, '1619440983'),
(6, 5, '836792be5b059dc4efe2a32bd1ae06493666866b', 1, '1619458847'),
(7, 6, '836792be5b059dc4efe2a32bd1ae06493666866b', 1, '1619459103'),
(8, 7, '836792be5b059dc4efe2a32bd1ae06493666866b', 1, '1619462251'),
(9, 6, '72b6600055a89111045c0b3684f5a01ecd02bf51', 0, '1619475470'),
(10, 8, '836792be5b059dc4efe2a32bd1ae06493666866b', 1, '1619479854'),
(11, 7, '5efc7d75895efe2d19492e50b083698188c2177b', 5, '1619518204'),
(12, 3, '5efc7d75895efe2d19492e50b083698188c2177b', 5, '1619518265'),
(13, 4, '5efc7d75895efe2d19492e50b083698188c2177b', 5, '1619519259'),
(14, 8, '5efc7d75895efe2d19492e50b083698188c2177b', 5, '1619519332'),
(15, 9, 'b58d8984e40ea26764abeaef44a9060c9214fb4a', 1, '1619548200'),
(16, 10, 'b58d8984e40ea26764abeaef44a9060c9214fb4a', 1, '1619549894'),
(17, 11, 'b58d8984e40ea26764abeaef44a9060c9214fb4a', 1, '1619630508'),
(18, 12, 'b58d8984e40ea26764abeaef44a9060c9214fb4a', 1, '1619630593'),
(19, 13, '8445f0d2b30bd1bdb45b4c1e112076a4dae8ab19', 1, '1619631496'),
(20, 13, '8445f0d2b30bd1bdb45b4c1e112076a4dae8ab19', 5, '1619633509'),
(21, 14, '8445f0d2b30bd1bdb45b4c1e112076a4dae8ab19', 5, '1619633520'),
(22, 16, 'b58d8984e40ea26764abeaef44a9060c9214fb4a', 1, '1619641566'),
(23, 16, '8f0abd69bb1b78380850a2d025e850a9e1b4eb40', 0, '1619978705'),
(24, 15, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 0, '1620142875'),
(25, 17, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620142892'),
(26, 18, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620225860'),
(27, 19, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620225978'),
(28, 20, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620237400'),
(29, 21, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620237551'),
(30, 22, 'a441b9852f9eebcd8e5b805bace8c930083e1fee', 1, '1620238534'),
(31, 22, '21098c98457ce3698cdf88f4ae6c3b83ecd25f4b', 0, '1623846603'),
(32, 21, '32d81b118e913a61ea29edc040eaf8440b3652d6', 4, '1623864920'),
(33, 5, '32d81b118e913a61ea29edc040eaf8440b3652d6', 4, '1623864947'),
(34, 21, 'c9747167f7100dbe3999362466e8e14d1383ea26', 0, '1624368086'),
(35, 22, 'c9747167f7100dbe3999362466e8e14d1383ea26', 4, '1624368165'),
(36, 22, 'f3fd5c2a9c3bfdbaff0616d4db44d1f25a2822d6', 0, '1625402701'),
(37, 7, 'c1d5c3ee1d68710367d0f44f94ea5bbe21f13e7a', 10, '1626150600'),
(38, 23, 'c1d5c3ee1d68710367d0f44f94ea5bbe21f13e7a', 1, '1626175742'),
(39, 24, 'ffd7ea0e02eed8d03e06112da9c03dac35c5c3aa', 1, '1626270109'),
(40, 7, 'ffd7ea0e02eed8d03e06112da9c03dac35c5c3aa', 4, '1626270295'),
(41, 17, 'ffd7ea0e02eed8d03e06112da9c03dac35c5c3aa', 4, '1626270318'),
(42, 24, 'ffd7ea0e02eed8d03e06112da9c03dac35c5c3aa', 4, '1626271152'),
(43, 24, '36e81555075a4b7d6204642a201d5090a2c15313', 0, '1626288320'),
(44, 15, '7c348960e1075eb716c429289b4aa0edcf5fe3c1', 0, '1626308432'),
(45, 24, '7c348960e1075eb716c429289b4aa0edcf5fe3c1', 0, '1626439979'),
(46, 24, '07d6fb3a5d842ce08e017ca37951ff08d0f3aefb', 0, '1626527589'),
(47, 25, '36e81555075a4b7d6204642a201d5090a2c15313', 1, '1626529165'),
(48, 25, '8387ab38f77c09311efac34263920d3b60b0215b', 0, '1626532418'),
(49, 25, '07d6fb3a5d842ce08e017ca37951ff08d0f3aefb', 0, '1626557100'),
(50, 25, '987dab59104fd4136edac8965e4fbc93a0231bb4', 0, '1626611601'),
(51, 21, '7c348960e1075eb716c429289b4aa0edcf5fe3c1', 0, '1626630000'),
(52, 22, '7c348960e1075eb716c429289b4aa0edcf5fe3c1', 0, '1626653337'),
(53, 25, '7c348960e1075eb716c429289b4aa0edcf5fe3c1', 0, '1626653348'),
(54, 26, '36e81555075a4b7d6204642a201d5090a2c15313', 1, '1626721595'),
(55, 26, 'c88cd608515e7fc52071b4d69c7f2ee5f76aefdd', 0, '1626736362'),
(56, 26, 'ffd7ea0e02eed8d03e06112da9c03dac35c5c3aa', 0, '1626785217'),
(57, 25, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627248351'),
(58, 18, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627248707'),
(59, 26, 'f14ba38192d09bd79ad03c7111a92d9ebce7e451', 0, '1627318812'),
(60, 26, 'eabc295310c65b15aae3d979f605723b2cff27eb', 0, '1627391621'),
(61, 25, 'b4c8771b2644324a3689067b823c9660817b34b4', 0, '1627392570'),
(62, 20, 'b4c8771b2644324a3689067b823c9660817b34b4', 0, '1627392737'),
(63, 26, 'b4c8771b2644324a3689067b823c9660817b34b4', 0, '1627392761'),
(64, 5, 'eabc295310c65b15aae3d979f605723b2cff27eb', 0, '1627420772'),
(65, 27, '29c265e219232d106da15f724cb9f9bc4ebcf3ff', 1, '1627433573'),
(66, 29, '5b55349115def405c9858cc0815870d18a5e426f', 1, '1627467414'),
(67, 30, 'eabc295310c65b15aae3d979f605723b2cff27eb', 1, '1627477292'),
(68, 31, 'af3fe5417381e99b17671b01273d30d87f691b00', 1, '1627495152'),
(69, 30, 'af3fe5417381e99b17671b01273d30d87f691b00', 4, '1627495621'),
(70, 31, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627561260'),
(71, 26, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627565291'),
(72, 29, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627567384'),
(73, 32, 'eabc295310c65b15aae3d979f605723b2cff27eb', 1, '1627570469'),
(74, 33, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627573399'),
(75, 32, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627573449'),
(76, 14, 'eabc295310c65b15aae3d979f605723b2cff27eb', 4, '1627657293'),
(77, 33, '788e4d31bd8fa3430955071e1be987014c2d5926', 1, '1628084375'),
(78, 33, 'c031f215def63b93242ec0e4b086c36d46a48cd7', 0, '1628175475'),
(79, 33, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 0, '1628247289'),
(80, 31, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 0, '1628335847'),
(81, 20, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 4, '1628343378'),
(82, 34, '5b55349115def405c9858cc0815870d18a5e426f', 1, '1628344333'),
(83, 34, '5b55349115def405c9858cc0815870d18a5e426f', 4, '1628610360'),
(84, 34, 'fd016b6628f74840737f8e1321b5edfd8895b21c', 0, '1628682413'),
(85, 34, '6461e58c6e6b9d61a76f425837b643f4572a2d7e', 0, '1628682549'),
(86, 35, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 1, '1628714059'),
(87, 36, '2188f1b98c38a207735a7cffdf720faf27ff6d60', 1, '1628715314'),
(88, 38, '2188f1b98c38a207735a7cffdf720faf27ff6d60', 1, '1628715975'),
(89, 40, '2188f1b98c38a207735a7cffdf720faf27ff6d60', 1, '1628717666'),
(90, 39, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 1, '1628717721'),
(91, 37, '961ed2730d1ca0b3882dcd7dbf3826d4c6a08227', 1, '1628718656'),
(92, 42, '58a2e69cdfc3f15824248202ecb13e187f47cb7a', 1, '1628756825'),
(93, 41, '163076da3223496a7373c1b72d5bf6c1222e467d', 1, '1628757836'),
(94, 43, '51e8edf932c65f3b3b669ebe55e00bb526d5b2e8', 1, '1628861384'),
(95, 42, 'be9a29b3ed147dbdd9c844672442d01e42010d85', 0, '1628896815'),
(96, 40, 'fb04eecf38fc4592d3993317c29c4fbdff70f3bd', 0, '1629063112'),
(97, 38, 'fb04eecf38fc4592d3993317c29c4fbdff70f3bd', 0, '1629063398'),
(98, 43, '0cc621722af938e5d405b4630fb39db08953611c', 0, '1629241866'),
(99, 43, '6c19111bb785f6e6f3eef8a381b6366d2461ca13', 0, '1629311111'),
(100, 43, '21ed7027a66e80636abf82a38aceaa8d369bc098', 0, '1629450944'),
(101, 39, '21ed7027a66e80636abf82a38aceaa8d369bc098', 0, '1629453899'),
(102, 43, '57ec3654c5684140e4824feae55916abefd33ab8', 4, '1629547704'),
(103, 42, '21ed7027a66e80636abf82a38aceaa8d369bc098', 0, '1629551753'),
(104, 40, '21ed7027a66e80636abf82a38aceaa8d369bc098', 0, '1629616188'),
(105, 43, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 0, '1629721251'),
(106, 37, '21ed7027a66e80636abf82a38aceaa8d369bc098', 0, '1629726699'),
(107, 44, '21ed7027a66e80636abf82a38aceaa8d369bc098', 1, '1629741757'),
(108, 45, '21ed7027a66e80636abf82a38aceaa8d369bc098', 1, '1629961888'),
(109, 46, '21ed7027a66e80636abf82a38aceaa8d369bc098', 4, '1629976720'),
(110, 47, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1629977520'),
(111, 48, '57ec3654c5684140e4824feae55916abefd33ab8', 4, '1629980081'),
(112, 49, '57ec3654c5684140e4824feae55916abefd33ab8', 4, '1629980210'),
(113, 50, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1629992126'),
(114, 51, '2188f1b98c38a207735a7cffdf720faf27ff6d60', 13, '1630015977'),
(115, 52, '57ec3654c5684140e4824feae55916abefd33ab8', 1, '1630153392'),
(116, 53, '57ec3654c5684140e4824feae55916abefd33ab8', 4, '1630161377'),
(117, 54, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630163170'),
(118, 55, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630163379'),
(119, 56, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630163518'),
(120, 57, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630163823'),
(121, 58, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630163947'),
(122, 59, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630164150'),
(123, 60, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630164242'),
(124, 62, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630164665'),
(125, 49, '21ed7027a66e80636abf82a38aceaa8d369bc098', 1, '1630169774'),
(126, 61, '41f01735d4597985acd861cfe6004fd9cd93c216', 4, '1630265885'),
(127, 63, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630311143'),
(128, 63, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630311145'),
(129, 64, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630311234'),
(130, 65, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630311812'),
(131, 66, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630313601'),
(132, 66, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630314718'),
(133, 47, '4e818cd3c65fdd6b1080edc53bf0303ae1f865a3', 1, '1630315308'),
(134, 65, '4e818cd3c65fdd6b1080edc53bf0303ae1f865a3', 1, '1630315336'),
(135, 67, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630315765'),
(136, 64, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630319777'),
(137, 58, '41f01735d4597985acd861cfe6004fd9cd93c216', 1, '1630323945'),
(138, 68, '41f01735d4597985acd861cfe6004fd9cd93c216', 1, '1630325064'),
(139, 69, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630351110'),
(140, 70, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630357191'),
(141, 71, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630357321'),
(142, 73, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630357493'),
(143, 73, '2d874a5d621ecf27f73327d350c6a52ece31a42b', 14, '1630358838'),
(144, 66, '2d874a5d621ecf27f73327d350c6a52ece31a42b', 14, '1630359232'),
(145, 72, '2d874a5d621ecf27f73327d350c6a52ece31a42b', 1, '1630359382'),
(146, 74, '1a32f212c014ef630869d355fe5212208690f0e7', 1, '1630403148'),
(147, 75, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630407740'),
(148, 75, '57ec3654c5684140e4824feae55916abefd33ab8', 1, '1630415703'),
(149, 76, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630422013'),
(150, 71, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630424227'),
(151, 71, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 14, '1630427912'),
(152, 75, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 14, '1630427959'),
(153, 76, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 14, '1630428007'),
(154, 77, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630428202'),
(155, 78, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630436574'),
(156, 74, '7ef49442410df320006800d95531c6df62c1f6d8', 14, '1630438861'),
(157, 80, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 1, '1630439976'),
(158, 78, '41f01735d4597985acd861cfe6004fd9cd93c216', 14, '1630441300'),
(159, 2, 'c892f0d2a93a257efae24d4005376ca0737a4aa9', 1, '1630484911'),
(160, 1, '7ef49442410df320006800d95531c6df62c1f6d8', 14, '1630485284'),
(161, 4, '7ef49442410df320006800d95531c6df62c1f6d8', 0, '1630512536'),
(162, 2, '7ef49442410df320006800d95531c6df62c1f6d8', 0, '1630515527'),
(163, 2, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 4, '1630519161'),
(164, 4, 'd39b3552cf5793e600e5959a6d301fb20b52864b', 0, '1630597606'),
(165, 8, '7ef49442410df320006800d95531c6df62c1f6d8', 0, '1630608479'),
(166, 14, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630611577'),
(167, 15, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630612526'),
(168, 28, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630624693'),
(169, 24, '7ef49442410df320006800d95531c6df62c1f6d8', 0, '1630693954'),
(170, 20, '7ef49442410df320006800d95531c6df62c1f6d8', 0, '1630694108'),
(171, 46, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630780749'),
(172, 28, '91a012a665661901cd56dd72c15a0b8b50004c7d', 0, '1630788809'),
(173, 17, '7ef49442410df320006800d95531c6df62c1f6d8', 16, '1630867372'),
(174, 18, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 0, '1630921014'),
(175, 19, 'fab00c75cbb29a78292c3ca1db17fbb398df8cc9', 0, '1630921030'),
(176, 48, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630953147'),
(177, 50, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630953321'),
(178, 51, '7ef49442410df320006800d95531c6df62c1f6d8', 1, '1630953442'),
(179, 17, '0d3951d84db76536a013003cc239be819b080d62', 0, '1630972452'),
(180, 52, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636236608'),
(181, 52, '24d471984c13e86cbc95cac3c16e50386c88e943', 18, '1636237106'),
(182, 53, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636239251'),
(183, 54, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636239947'),
(184, 55, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636240269'),
(185, 56, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636240471'),
(186, 57, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636240905'),
(187, 58, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636240908'),
(188, 59, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636241601'),
(189, 60, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636241895'),
(190, 61, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636242136'),
(191, 62, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636242327'),
(192, 63, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636242715'),
(193, 64, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636242952'),
(194, 65, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636268342'),
(195, 66, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636268618'),
(196, 67, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636268797'),
(197, 68, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636268903'),
(198, 70, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636270048'),
(199, 71, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636271476'),
(200, 72, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636271585'),
(201, 74, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636271948'),
(202, 74, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1636272021'),
(203, 75, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636272132'),
(204, 76, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636272193'),
(205, 77, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636274891'),
(206, 78, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636274977'),
(207, 79, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636275052'),
(208, 80, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636275132'),
(209, 81, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636275191'),
(210, 82, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636275417'),
(211, 83, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636276533'),
(212, 84, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636276944'),
(213, 85, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636277077'),
(214, 86, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636277493'),
(215, 87, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636277619'),
(216, 88, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636277757'),
(217, 89, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636277931'),
(218, 90, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278106'),
(219, 91, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278207'),
(220, 92, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278545'),
(221, 93, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278668'),
(222, 94, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278740'),
(223, 95, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278869'),
(224, 96, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636278984'),
(225, 97, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636279138'),
(226, 98, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636279290'),
(227, 99, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636279434'),
(228, 100, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636280150'),
(229, 101, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636280244'),
(230, 107, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636281043'),
(231, 108, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636281057'),
(232, 110, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636281685'),
(233, 109, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636281746'),
(234, 105, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636282793'),
(235, 106, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636282950'),
(236, 102, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636283483'),
(237, 103, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636283521'),
(238, 104, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636283636'),
(239, 111, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 17, '1636285151'),
(240, 107, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636290412'),
(241, 105, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636290427'),
(242, 101, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636290586'),
(243, 110, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636291292'),
(244, 53, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636293932'),
(245, 83, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636294137'),
(246, 84, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636294235'),
(247, 85, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636294379'),
(248, 109, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636294612'),
(249, 86, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636294875'),
(250, 87, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295123'),
(251, 88, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295256'),
(252, 108, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295309'),
(253, 89, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295403'),
(254, 90, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295525'),
(255, 93, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636295879'),
(256, 94, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636296010'),
(257, 96, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636296117'),
(258, 107, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1636296378'),
(259, 106, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636296482'),
(260, 55, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636296744'),
(261, 57, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636296855'),
(262, 59, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636297027'),
(263, 62, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636297056'),
(264, 67, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636297381'),
(265, 111, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298221'),
(266, 79, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298356'),
(267, 97, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298454'),
(268, 98, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298557'),
(269, 99, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298586'),
(270, 103, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636298789'),
(271, 102, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636299148'),
(272, 61, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636390418'),
(273, 81, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636390449'),
(274, 114, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636538400'),
(275, 117, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636538756'),
(276, 118, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636538965'),
(277, 119, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636539239'),
(278, 120, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636539535'),
(279, 122, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636539935'),
(280, 112, 'c3f0d58d48e1b5f334a5f278a4fb03f61cd881f9', 18, '1636540567'),
(281, 123, 'c3f0d58d48e1b5f334a5f278a4fb03f61cd881f9', 18, '1636540601'),
(282, 124, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636540706'),
(283, 124, 'c3f0d58d48e1b5f334a5f278a4fb03f61cd881f9', 18, '1636540706'),
(284, 139, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636549767'),
(285, 126, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636621964'),
(286, 146, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636622428'),
(287, 152, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636627909'),
(288, 154, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636629529'),
(289, 155, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636633255'),
(290, 155, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1636638477'),
(291, 56, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1636638651'),
(292, 83, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1636638665'),
(293, 157, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636701848'),
(294, 161, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636703188'),
(295, 151, 'bd86043ba9a1bcc8b56416ba7de8f6691c60721c', 18, '1636729148'),
(296, 162, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636786248'),
(297, 164, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636786560'),
(298, 169, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636787103'),
(299, 171, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636787610'),
(300, 174, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636787915'),
(301, 123, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636788276'),
(302, 176, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1636901014'),
(303, 108, '47139ef8f628f943c265023b821d01017cdbe47c', 19, '1636980857'),
(304, 177, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636989523'),
(305, 178, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636989688'),
(306, 184, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636991412'),
(307, 187, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1636993209'),
(308, 198, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1637002903'),
(309, 113, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1637003943'),
(310, 199, '5ab21d5a2169d3bb0abedeb2654c853302307db9', 1, '1637004570'),
(311, 82, '47139ef8f628f943c265023b821d01017cdbe47c', 1, '1637072350'),
(312, 187, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1637226249'),
(313, 97, 'e8c59067e2ad975aab737f63b7fbb88a198ae679', 18, '1637226274'),
(314, 182, 'e2d86a205aa3da44355d9cf08bf139ad6ad7cd58', 18, '1638174256'),
(315, 171, '33416b7c7405082f5bcd6ff838b80620f7680861', 18, '1638176511'),
(316, 61, '33416b7c7405082f5bcd6ff838b80620f7680861', 18, '1638184868'),
(317, 75, '2e73d3a8a86d65a43469a5b0daf6d1177d815288', 0, '1638272708'),
(318, 55, 'e9e4a3283a17fe3a1ae8dd33c21ef7ab2cda00b3', 18, '1638272771'),
(319, 53, '7694a0ceb26439fd1bb7cd4b7bff4a9d055ec51f', 19, '1638375775'),
(320, 197, 'dffb9dd8996ec7160d2607ffd8c457cd996a32ff', 1, '1638490654'),
(321, 135, '60c47aaa67ac4fb51b52c0bec645ecd53cbdb3d3', 1, '1638735635'),
(322, 138, '60c47aaa67ac4fb51b52c0bec645ecd53cbdb3d3', 1, '1638735774'),
(323, 133, '831ab384281e8fe0a2d1c7b9fe59ef16ea09450f', 1, '1639597158'),
(324, 140, '831ab384281e8fe0a2d1c7b9fe59ef16ea09450f', 1, '1639597511'),
(325, 137, '831ab384281e8fe0a2d1c7b9fe59ef16ea09450f', 1, '1639597645'),
(326, 190, 'e1998ac1bdfa26966fe3c71a609098a703dde847', 1, '1639999728'),
(327, 202, 'd41419b0bb5d3afefeb0698d3c20e254ec73d6de', 1, '1648832143'),
(328, 201, 'd41419b0bb5d3afefeb0698d3c20e254ec73d6de', 1, '1648832199'),
(329, 188, 'd41419b0bb5d3afefeb0698d3c20e254ec73d6de', 1, '1648832234'),
(330, 183, 'd41419b0bb5d3afefeb0698d3c20e254ec73d6de', 1, '1648832275'),
(331, 210, 'e08fddcf048796f1d2bc71e31dc6c842af61551a', 1, '1650019709'),
(332, 211, 'e08fddcf048796f1d2bc71e31dc6c842af61551a', 1, '1650024395'),
(333, 208, 'e08fddcf048796f1d2bc71e31dc6c842af61551a', 1, '1650029067'),
(334, 213, '15082d1283f7bbac2dc9a1d792108807918e193b', 1, '1650032646'),
(335, 214, '15082d1283f7bbac2dc9a1d792108807918e193b', 1, '1650032932'),
(336, 215, 'aa37ced626d5030b8e203e9f19ca10bae4285f83', 1, '1650044139'),
(337, 216, 'e08fddcf048796f1d2bc71e31dc6c842af61551a', 1, '1650045172'),
(338, 217, '15082d1283f7bbac2dc9a1d792108807918e193b', 1, '1650049201'),
(339, 209, '15082d1283f7bbac2dc9a1d792108807918e193b', 1, '1650049252'),
(340, 213, '15082d1283f7bbac2dc9a1d792108807918e193b', 4, '1650050597'),
(341, 218, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650889603'),
(342, 220, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650890240'),
(343, 219, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650891125'),
(344, 223, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650891461'),
(345, 224, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650891738'),
(346, 225, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650891860'),
(347, 226, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650892217'),
(348, 228, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650894642'),
(349, 227, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650908861'),
(350, 229, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650909804'),
(351, 218, '108b20b8810dbc55caf5024c72c1685c269d0272', 27, '1650911205'),
(352, 229, '108b20b8810dbc55caf5024c72c1685c269d0272', 27, '1650911484'),
(353, 223, '108b20b8810dbc55caf5024c72c1685c269d0272', 27, '1650912684'),
(354, 221, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650912815'),
(355, 219, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650913347'),
(356, 224, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650913434'),
(357, 227, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650913618'),
(358, 222, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650913962'),
(359, 226, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650914126'),
(360, 228, '321a9634e9b795d355f1805531941a680c60b11b', 27, '1650914524'),
(361, 221, 'dbc35684a447441f3bf9fb79f96da576deb190e6', 27, '1650958522'),
(362, 220, 'dbc35684a447441f3bf9fb79f96da576deb190e6', 27, '1650962311'),
(363, 222, '108b20b8810dbc55caf5024c72c1685c269d0272', 1, '1650978067'),
(364, 231, 'b95fc0ef63591778598912584a57599a8defa994', 1, '1652023858'),
(365, 232, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653391544'),
(366, 233, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653392954'),
(367, 234, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653393772'),
(368, 236, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653410058'),
(369, 237, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653410140'),
(370, 235, '7cf9069a061af7f749086871ff6a434ae9dca63f', 1, '1653410367'),
(371, 238, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1653431059'),
(372, 240, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004110'),
(373, 239, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004716'),
(374, 241, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004780'),
(375, 242, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004792'),
(376, 243, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004797'),
(377, 244, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004817'),
(378, 245, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004828'),
(379, 246, '6b22fc22e5e3ebc903392559d03e1a4e895e550c', 1, '1654004836'),
(380, 247, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373399'),
(381, 248, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373465'),
(382, 249, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373523'),
(383, 250, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373581'),
(384, 251, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373643'),
(385, 252, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373721'),
(386, 253, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373783'),
(387, 254, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373918'),
(388, 255, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655373935'),
(389, 257, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374027'),
(390, 256, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374034'),
(391, 258, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374218'),
(392, 259, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374376'),
(393, 260, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374521'),
(394, 261, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374669'),
(395, 262, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655374861'),
(396, 263, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378387'),
(397, 264, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378452'),
(398, 265, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378556'),
(399, 266, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378607'),
(400, 267, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378694'),
(401, 268, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655378747'),
(402, 270, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379010'),
(403, 271, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379083'),
(404, 272, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379248'),
(405, 273, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379359'),
(406, 274, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379577'),
(407, 275, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379726'),
(408, 276, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379856'),
(409, 277, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655379980'),
(410, 278, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380111'),
(411, 280, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380456'),
(412, 281, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380542'),
(413, 282, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380667'),
(414, 279, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380681'),
(415, 283, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380830'),
(416, 284, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380905'),
(417, 285, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655380964'),
(418, 286, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655381996'),
(419, 290, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655382028'),
(420, 292, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655382151'),
(421, 293, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655382323'),
(422, 294, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655382447'),
(423, 295, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655382564'),
(424, 296, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655400005'),
(425, 297, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655400267'),
(426, 298, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655400703'),
(427, 299, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655400909'),
(428, 300, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655401131'),
(429, 301, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655401293'),
(430, 302, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655401488'),
(431, 303, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655401867'),
(432, 304, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655401981'),
(433, 305, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402134'),
(434, 306, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402253'),
(435, 307, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402354'),
(436, 308, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402460'),
(437, 309, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402603'),
(438, 310, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402711'),
(439, 311, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402799'),
(440, 312, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655402985'),
(441, 313, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655403163'),
(442, 314, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655403312'),
(443, 315, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655403666'),
(444, 316, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655403834'),
(445, 317, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404099'),
(446, 318, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404262'),
(447, 319, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404503'),
(448, 320, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404592'),
(449, 321, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404746'),
(450, 322, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404918'),
(451, 323, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655404998'),
(452, 324, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655405296'),
(453, 325, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655405617'),
(454, 326, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655405848'),
(455, 327, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655405960'),
(456, 328, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655406088'),
(457, 329, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655406167'),
(458, 330, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655460100'),
(459, 331, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655460242'),
(460, 332, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655460530'),
(461, 333, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655460797'),
(462, 334, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461016'),
(463, 335, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461183'),
(464, 336, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461342'),
(465, 337, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461491'),
(466, 338, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461653'),
(467, 339, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655461790'),
(468, 340, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462010'),
(469, 341, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462184'),
(470, 342, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462329'),
(471, 343, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462447'),
(472, 344, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462558'),
(473, 345, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462705'),
(474, 346, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462806'),
(475, 347, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655462904'),
(476, 348, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655463185'),
(477, 349, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655463244'),
(478, 350, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655463318'),
(479, 351, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655463452'),
(480, 352, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655463645'),
(481, 353, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655468426'),
(482, 354, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655486453'),
(483, 355, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655486626'),
(484, 356, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655486963'),
(485, 357, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487123'),
(486, 358, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487410'),
(487, 359, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487527'),
(488, 360, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487645'),
(489, 361, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487789'),
(490, 362, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655487939'),
(491, 363, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488139'),
(492, 364, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488251'),
(493, 365, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488373'),
(494, 366, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488477'),
(495, 367, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488587'),
(496, 368, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655488715'),
(497, 369, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655537783'),
(498, 370, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655537904'),
(499, 371, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538021'),
(500, 372, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538116'),
(501, 373, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538414'),
(502, 374, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538502'),
(503, 375, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538630'),
(504, 376, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538711'),
(505, 377, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538803'),
(506, 378, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655538897'),
(507, 379, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539000'),
(508, 380, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539081'),
(509, 381, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539158'),
(510, 382, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539224'),
(511, 383, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539292'),
(512, 384, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655539374'),
(513, 385, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655541355'),
(514, 386, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655541463'),
(515, 387, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655541554'),
(516, 388, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655541741'),
(517, 389, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655541965'),
(518, 390, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655607344'),
(519, 391, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655607493'),
(520, 392, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655607682'),
(521, 393, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655607824'),
(522, 394, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655607921'),
(523, 395, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655608583'),
(524, 396, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655608756'),
(525, 397, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655608875'),
(526, 398, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655608946'),
(527, 399, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655613682'),
(528, 400, '84af24fc2e8759df23ba89fe5d11ed9ea3658394', 1, '1655621613'),
(529, 401, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656866556'),
(530, 401, '6cbbd18d45a8b4e216501379a4b70f12ca2de943', 33, '1656866559'),
(531, 402, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656866681'),
(532, 403, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656866768'),
(533, 404, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656866866'),
(534, 405, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867050'),
(535, 406, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867165'),
(536, 407, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867249'),
(537, 408, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867377'),
(538, 409, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867471'),
(539, 410, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867556'),
(540, 411, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867673'),
(541, 412, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867819'),
(542, 413, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656867932'),
(543, 414, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656868449'),
(544, 415, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1656868730'),
(545, 401, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 34, '1656869520'),
(546, 405, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 34, '1656874910'),
(547, 407, '6cbbd18d45a8b4e216501379a4b70f12ca2de943', 33, '1656876032'),
(548, 416, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657026692'),
(549, 417, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657027479'),
(550, 418, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657027596'),
(551, 419, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657027694'),
(552, 420, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657027796'),
(553, 421, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657027917'),
(554, 422, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657028722'),
(555, 423, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657028858'),
(556, 424, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657028974'),
(557, 425, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657029111'),
(558, 426, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657029207'),
(559, 427, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657029314'),
(560, 428, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657030499'),
(561, 429, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657030623'),
(562, 430, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657030726'),
(563, 431, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657030845'),
(564, 432, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031036'),
(565, 433, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031145'),
(566, 434, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031204'),
(567, 435, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031240'),
(568, 436, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031383'),
(569, 437, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031521'),
(570, 438, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031550'),
(571, 439, '270242c98466830ceb9b19668618586224afb7a2', 32, '1657031584'),
(572, 430, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 35, '1657042091'),
(573, 440, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657080739'),
(574, 441, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657080979'),
(575, 442, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657081196'),
(576, 443, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657081407'),
(577, 444, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657081517'),
(578, 445, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657081724'),
(579, 446, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657081944'),
(580, 447, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657082235'),
(581, 448, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657082471'),
(582, 449, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657083137'),
(583, 450, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657083420'),
(584, 451, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657083679'),
(585, 452, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657083958'),
(586, 453, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657084561'),
(587, 454, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657084774'),
(588, 455, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657109045'),
(589, 456, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657109225'),
(590, 457, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657109589'),
(591, 458, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657109970'),
(592, 401, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657110405'),
(593, 402, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657110454'),
(594, 404, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657110533'),
(595, 422, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657110555'),
(596, 405, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657110651'),
(597, 459, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657110748'),
(598, 460, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657110834'),
(599, 403, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657111055'),
(600, 461, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657111523'),
(601, 416, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657111909'),
(602, 418, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657111939'),
(603, 419, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657111961'),
(604, 420, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657111995'),
(605, 421, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657112042'),
(606, 454, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657112054'),
(607, 456, 'f1bf09565f4cc5eed9bef1dc1ad0045727a8314a', 35, '1657112281'),
(608, 462, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657112361'),
(609, 463, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657112964'),
(610, 464, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657113344'),
(611, 465, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657114692'),
(612, 466, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657115746'),
(613, 467, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116178'),
(614, 468, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116281'),
(615, 469, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116476'),
(616, 470, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116647'),
(617, 471, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116833'),
(618, 472, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657116973'),
(619, 473, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657117132'),
(620, 474, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657117215'),
(621, 476, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657117935'),
(622, 477, 'c9938bacaf9402641fad8fd61760bab5540ae1a3', 32, '1657118046'),
(623, 423, '6cbbd18d45a8b4e216501379a4b70f12ca2de943', 1, '1657120578'),
(624, 401, '8ecf36b019f10792be15961245b74be219d33d4d', 36, '1657160350'),
(625, 402, '8ecf36b019f10792be15961245b74be219d33d4d', 36, '1657160387'),
(626, 406, '2538bec09e163184cf6c836dda0ed09ad4efe7dc', 36, '1657256947'),
(627, 407, '2538bec09e163184cf6c836dda0ed09ad4efe7dc', 36, '1657256970'),
(628, 401, '6cbbd18d45a8b4e216501379a4b70f12ca2de943', 1, '1659211841'),
(629, 478, '30ff2575666b4a5457967ab19fdb85170cc0c85d', 1, '1678824272'),
(630, 25, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680439853'),
(631, 479, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680451905'),
(632, 481, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680586423'),
(633, 483, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680587976'),
(634, 484, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680588360'),
(635, 486, 'cb937fce5cd88ef91e010cfb09a23a2cd3cd3548', 1, '1680758555'),
(636, 487, 'cb937fce5cd88ef91e010cfb09a23a2cd3cd3548', 1, '1680759515'),
(637, 1, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680917566'),
(638, 2, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680918215'),
(639, 3, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1680919546'),
(640, 4, '0bc8c1d5d4803123d89f7692eb6220385ec8c192', 1, '1681357722'),
(641, 5, 'cb937fce5cd88ef91e010cfb09a23a2cd3cd3548', 1, '1681434896');

-- --------------------------------------------------------

--
-- Table structure for table `watch_later`
--

CREATE TABLE `watch_later` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(30) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admininvitations`
--
ALTER TABLE `admininvitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`(255));

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_submenu`
--
ALTER TABLE `admin_submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_submenu_menu_id_fk` (`menu_id`);

--
-- Indexes for table `ads_transactions`
--
ALTER TABLE `ads_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `announcement_views`
--
ALTER TABLE `announcement_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `background`
--
ALTER TABLE `background`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_receipts`
--
ALTER TABLE `bank_receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banned`
--
ALTER TABLE `banned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `blocked_id` (`blocked_id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `ref_video` (`ref_video`),
  ADD KEY `type` (`type`),
  ADD KEY `part` (`part`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `likes` (`likes`),
  ADD KEY `dis_likes` (`dis_likes`);

--
-- Indexes for table `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `type` (`type`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `reply_id` (`reply_id`);

--
-- Indexes for table `comm_replies`
--
ALTER TABLE `comm_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`(255));

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `copyright_report`
--
ALTER TABLE `copyright_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decisions`
--
ALTER TABLE `decisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `decisions_information`
--
ALTER TABLE `decisions_information`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_key` (`lang_key`);

--
-- Indexes for table `libraries`
--
ALTER TABLE `libraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libraries_bg`
--
ALTER TABLE `libraries_bg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_id` (`library_id`);

--
-- Indexes for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `type` (`type`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `privacy` (`privacy`);

--
-- Indexes for table `live_sub_users`
--
ALTER TABLE `live_sub_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `is_watching` (`is_watching`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `seen` (`seen`),
  ADD KEY `time` (`time`),
  ADD KEY `from_deleted` (`from_deleted`),
  ADD KEY `to_deleted` (`to_deleted`);

--
-- Indexes for table `monetization_requests`
--
ALTER TABLE `monetization_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `type` (`type`),
  ADD KEY `seen` (`seen`),
  ADD KEY `notifier_id` (`notifier_id`),
  ADD KEY `time` (`time`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `sent_push` (`sent_push`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`),
  ADD KEY `type` (`type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `playlist_subscribers`
--
ALTER TABLE `playlist_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`list_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `play_list`
--
ALTER TABLE `play_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `video_id` (`video_id`(255));

--
-- Indexes for table `profile_fields`
--
ALTER TABLE `profile_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_page` (`registration_page`),
  ADD KEY `active` (`active`),
  ADD KEY `profile_page` (`profile_page`);

--
-- Indexes for table `pt_posts`
--
ALTER TABLE `pt_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views` (`views`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `active` (`active`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `processing` (`processing`),
  ADD KEY `video_res` (`video_res`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `saved_videos`
--
ALTER TABLE `saved_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `platform` (`platform`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `shared_playlist`
--
ALTER TABLE `shared_playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_ads`
--
ALTER TABLE `site_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placement` (`placement`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `typings`
--
ALTER TABLE `typings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`);

--
-- Indexes for table `uploaded_videos`
--
ALTER TABLE `uploaded_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `password` (`password`),
  ADD KEY `last_active` (`last_active`),
  ADD KEY `admin` (`admin`),
  ADD KEY `active` (`active`),
  ADD KEY `registered` (`registered`),
  ADD KEY `is_pro` (`is_pro`),
  ADD KEY `wallet` (`wallet`),
  ADD KEY `balance` (`balance`),
  ADD KEY `video_mon` (`video_mon`),
  ADD KEY `active_time` (`active_time`);

--
-- Indexes for table `user_ads`
--
ALTER TABLE `user_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `location` (`location`(255)),
  ADD KEY `placement` (`placement`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category` (`category`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `verification_requests`
--
ALTER TABLE `verification_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_transactions`
--
ALTER TABLE `videos_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_ads`
--
ALTER TABLE `video_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fingerprint` (`fingerprint`(255)),
  ADD KEY `time` (`time`);

--
-- Indexes for table `watch_later`
--
ALTER TABLE `watch_later`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admininvitations`
--
ALTER TABLE `admininvitations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `admin_submenu`
--
ALTER TABLE `admin_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `ads_transactions`
--
ALTER TABLE `ads_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_views`
--
ALTER TABLE `announcement_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background`
--
ALTER TABLE `background`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `bank_receipts`
--
ALTER TABLE `bank_receipts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banned`
--
ALTER TABLE `banned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comm_replies`
--
ALTER TABLE `comm_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `copyright_report`
--
ALTER TABLE `copyright_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `decisions`
--
ALTER TABLE `decisions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `decisions_information`
--
ALTER TABLE `decisions_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `libraries`
--
ALTER TABLE `libraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `libraries_bg`
--
ALTER TABLE `libraries_bg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `live_sub_users`
--
ALTER TABLE `live_sub_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monetization_requests`
--
ALTER TABLE `monetization_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist_subscribers`
--
ALTER TABLE `playlist_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `play_list`
--
ALTER TABLE `play_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `profile_fields`
--
ALTER TABLE `profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pt_posts`
--
ALTER TABLE `pt_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_videos`
--
ALTER TABLE `saved_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=586;

--
-- AUTO_INCREMENT for table `shared_playlist`
--
ALTER TABLE `shared_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_ads`
--
ALTER TABLE `site_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=793;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `typings`
--
ALTER TABLE `typings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploaded_videos`
--
ALTER TABLE `uploaded_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_ads`
--
ALTER TABLE `user_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_requests`
--
ALTER TABLE `verification_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `videos_transactions`
--
ALTER TABLE `videos_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_ads`
--
ALTER TABLE `video_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=642;

--
-- AUTO_INCREMENT for table `watch_later`
--
ALTER TABLE `watch_later`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_submenu`
--
ALTER TABLE `admin_submenu`
  ADD CONSTRAINT `admin_submenu_menu_id_fk` FOREIGN KEY (`menu_id`) REFERENCES `admin_menu` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `libraries_bg`
--
ALTER TABLE `libraries_bg`
  ADD CONSTRAINT `libraries_bg_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `libraries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
