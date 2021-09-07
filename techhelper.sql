-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2021 at 09:47 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techhelper`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `expert` varchar(15) NOT NULL,
  `point` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `firstName`, `lastName`, `phoneNumber`, `expert`, `point`, `email`, `username`, `password`, `image`, `created_at`) VALUES
(1, 'Tech', 'Helper', '01234567890', 'Django', '100', 'techhelper72428@gmail.com', 'techhelper72428', 'pbkdf2_sha256$260000$ru6JsAZpqh45VZf5fVbpiW$iExTrHOXTXCh45qvEKH97RwO2FZDSn96j9VaqlUA3vY=', 'uploads/20210906032432-techhelper.png', '2021-09-06 03:23:40.742086'),
(2, 'Md. Sabik', 'Alam Rahat', '01647629698', 'Flutter', '350', 'sabikrahat72428@gmail.com', 'sabikrahat72428', 'pbkdf2_sha256$260000$GZ8bJI5m1vRGO4aaoBcX34$CeoArf1pUwI3SL8B3/n8M1RRORbLyWlffeQ2uAzOZs4=', 'uploads/20210906032746-rahat.jpg', '2021-09-06 03:27:09.656935'),
(3, 'Humaira', 'Tabassum', '01733627713', 'C Programming', '20', 'humaira.tabassumkhan@gmail.com', 'humaira.tabassumkhan', 'pbkdf2_sha256$260000$JDpPTc1v8XE3hEMb5ttNo5$rhKh2xhNPsiAzzFGw1t6uStn+oO+zOKq56scka7nSpk=', 'uploads/20210906033206-humaira.jpg', '2021-09-06 03:31:30.534855'),
(4, 'Kawshik', 'Das', '01875602853', 'HTML', '60', 'kawshik400@gmail.com', 'kawshik400', 'pbkdf2_sha256$260000$Yy6BJcALKKEgSmAEnsUYMR$cSldVzLNgmjQNYOobbsDj6BUKKIUOevJ7T2i3eqQhvQ=', 'uploads/20210906041923-kawshik.jpg', '2021-09-06 04:18:53.267768'),
(5, 'Naeem', 'Mizan', '01753935091', 'Java', '70', 'naeemmizan.nm1234@gmail.com', 'naeemmizan.nm1234', 'pbkdf2_sha256$260000$WiBtjRcAzAnJxUQnk2ihJx$10exhSUR2T5Aa510RQBsA3C40fCo6FVa/YHofue/On4=', 'uploads/20210908005928-naeem.jpg', '2021-09-08 00:58:41.420562'),
(6, 'Mirajur', 'Rahman', '017654389201', 'C Programming', '80', 'mirajur007@gmail.com', 'mirajur007', 'pbkdf2_sha256$260000$vOmFPBTwdlM8wqftXhtytL$sTXdRP8f8ZoWz+3WVyU9//EoK3PrEXVb/hRNnAjzrd4=', 'uploads/20210908011117-miraj.jpg', '2021-09-08 01:10:39.483724');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add bkash payment', 1, 'add_bkashpayment'),
(2, 'Can change bkash payment', 1, 'change_bkashpayment'),
(3, 'Can delete bkash payment', 1, 'delete_bkashpayment'),
(4, 'Can view bkash payment', 1, 'view_bkashpayment'),
(5, 'Can add qstn cmnt', 2, 'add_qstncmnt'),
(6, 'Can change qstn cmnt', 2, 'change_qstncmnt'),
(7, 'Can delete qstn cmnt', 2, 'delete_qstncmnt'),
(8, 'Can view qstn cmnt', 2, 'view_qstncmnt'),
(9, 'Can add user contact', 3, 'add_usercontact'),
(10, 'Can change user contact', 3, 'change_usercontact'),
(11, 'Can delete user contact', 3, 'delete_usercontact'),
(12, 'Can view user contact', 3, 'view_usercontact'),
(13, 'Can add user internships', 4, 'add_userinternships'),
(14, 'Can change user internships', 4, 'change_userinternships'),
(15, 'Can delete user internships', 4, 'delete_userinternships'),
(16, 'Can view user internships', 4, 'view_userinternships'),
(17, 'Can add user jobs', 5, 'add_userjobs'),
(18, 'Can change user jobs', 5, 'change_userjobs'),
(19, 'Can delete user jobs', 5, 'delete_userjobs'),
(20, 'Can view user jobs', 5, 'view_userjobs'),
(21, 'Can add user question', 6, 'add_userquestion'),
(22, 'Can change user question', 6, 'change_userquestion'),
(23, 'Can delete user question', 6, 'delete_userquestion'),
(24, 'Can view user question', 6, 'view_userquestion'),
(25, 'Can add user register', 7, 'add_userregister'),
(26, 'Can change user register', 7, 'change_userregister'),
(27, 'Can delete user register', 7, 'delete_userregister'),
(28, 'Can view user register', 7, 'view_userregister'),
(29, 'Can add profile', 8, 'add_profile'),
(30, 'Can change profile', 8, 'change_profile'),
(31, 'Can delete profile', 8, 'delete_profile'),
(32, 'Can view profile', 8, 'view_profile'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add content type', 13, 'add_contenttype'),
(50, 'Can change content type', 13, 'change_contenttype'),
(51, 'Can delete content type', 13, 'delete_contenttype'),
(52, 'Can view content type', 13, 'view_contenttype'),
(53, 'Can add session', 14, 'add_session'),
(54, 'Can change session', 14, 'change_session'),
(55, 'Can delete session', 14, 'delete_session'),
(56, 'Can view session', 14, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bkash_payment`
--

CREATE TABLE `bkash_payment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bkashNumber` varchar(20) NOT NULL,
  `bkashTransaction` varchar(512) NOT NULL,
  `point` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bkash_payment`
--

INSERT INTO `bkash_payment` (`id`, `name`, `username`, `email`, `bkashNumber`, `bkashTransaction`, `point`, `status`, `created_at`) VALUES
(1, 'Md. Sabik Alam Rahat', 'sabikrahat72428', 'sabikrahat72428@gmail.com', '01647620609', 'jbj6!9d %vf9f$#', '100', 'Done', '2021-09-06 03:28:19.429259'),
(2, 'Humaira Tabassum', 'humaira.tabassumkhan', 'humaira.tabassumkhan@gmail.com', '01733627713', 'jbj6!9d %vf9f$#', '150', 'Done', '2021-09-06 03:32:27.283427'),
(3, 'Md. Sabik Alam Rahat', 'sabikrahat72428', 'sabikrahat72428@gmail.com', '01647620609', 'wjakfHSAJKF', '50', 'Done', '2021-09-06 04:15:14.846337'),
(4, 'Humaira Tabassum', 'humaira.tabassumkhan', 'humaira.tabassumkhan@gmail.com', '01733627713', 'plk3lej6!9d %vf9f$#', '100', 'Pending', '2021-09-08 01:39:48.128428'),
(5, 'Kawshik Das', 'kawshik400', 'kawshik400@gmail.com', '018456781239', 'plk3lej6!9d %vf9f$#', '150', 'Pending', '2021-09-08 01:41:54.055295'),
(6, 'Mirajur Rahman', 'mirajur007', 'mirajur007@gmail.com', '01647620609', 'wjakfHSAJKF', '50', 'Pending', '2021-09-08 01:42:51.466678'),
(7, 'Md. Sabik Alam Rahat', 'sabikrahat72428', 'sabikrahat72428@gmail.com', '016476206098', 'awsef$hh&gji!23)', '300', 'Done', '2021-09-08 01:43:50.063803');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'profile'),
(7, 'accounts', 'userregister'),
(9, 'admin', 'logentry'),
(11, 'auth', 'group'),
(10, 'auth', 'permission'),
(12, 'auth', 'user'),
(13, 'contenttypes', 'contenttype'),
(1, 'home', 'bkashpayment'),
(2, 'home', 'qstncmnt'),
(3, 'home', 'usercontact'),
(4, 'home', 'userinternships'),
(5, 'home', 'userjobs'),
(6, 'home', 'userquestion'),
(14, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2021-09-05 21:21:40.303445'),
(2, 'contenttypes', '0001_initial', '2021-09-05 21:21:40.790607'),
(3, 'auth', '0001_initial', '2021-09-05 21:21:43.512391'),
(4, 'admin', '0001_initial', '2021-09-05 21:21:43.912392'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-09-05 21:21:44.003394'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-05 21:21:44.062387'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-09-05 21:21:44.555512'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-09-05 21:21:44.730405'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-09-05 21:21:44.831450'),
(10, 'auth', '0004_alter_user_username_opts', '2021-09-05 21:21:44.917426'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-09-05 21:21:45.126455'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-09-05 21:21:45.135452'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-09-05 21:21:45.171434'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-09-05 21:21:45.297397'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-09-05 21:21:45.407399'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-09-05 21:21:45.475417'),
(17, 'auth', '0011_update_proxy_permissions', '2021-09-05 21:21:45.511394'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-09-05 21:21:45.582407'),
(19, 'home', '0001_initial', '2021-09-05 21:21:46.175399'),
(20, 'sessions', '0001_initial', '2021-09-05 21:21:46.361902');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7gpm3lj5xcykzdwddpax9xn4c0epc2j1', 'eyJlbWFpbCI6InRlY2hoZWxwZXI3MjQyOEBnbWFpbC5jb20ifQ:1mNh0s:v15cKTlUK9ewvhCYAtf1LGu2J6ftrto7lPQsCuP7Cqw', '2021-09-21 19:44:10.096000');

-- --------------------------------------------------------

--
-- Table structure for table `profile_tokens`
--

CREATE TABLE `profile_tokens` (
  `id` bigint(20) NOT NULL,
  `forget_password_token` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_tokens`
--

INSERT INTO `profile_tokens` (`id`, `forget_password_token`, `created_at`, `user_id`) VALUES
(1, '', '2021-09-05 21:23:41.131562', 1),
(2, '', '2021-09-05 21:27:10.273905', 2),
(3, '', '2021-09-05 21:31:31.176996', 3),
(4, '', '2021-09-05 22:18:53.964424', 4),
(5, '', '2021-09-07 18:58:41.923275', 5),
(6, '', '2021-09-07 19:10:40.277271', 6);

-- --------------------------------------------------------

--
-- Table structure for table `questions_comments`
--

CREATE TABLE `questions_comments` (
  `id` bigint(20) NOT NULL,
  `publisherId` varchar(20) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `qstnId` varchar(20) NOT NULL,
  `cmnt` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions_comments`
--

INSERT INTO `questions_comments` (`id`, `publisherId`, `publisherName`, `qstnId`, `cmnt`, `created_at`) VALUES
(1, '3', 'Humaira Tabassum', '1', 'Please initialize the sharedPreference first.', '2021-09-08 00:18:30.742448'),
(2, '2', 'Md. Sabik Alam Rahat', '2', ' The problem is that both source files are being included in both versions of the executable, which means that there are two separate instances of main.  Replace line:  $(EXECUTABLE): $(OBJ_EXE) $(LIBRARY) with  %: %00.o $(LIBRARY) This will ensure that only client00.o is used to build client and server00.o is used to build server.', '2021-09-08 00:35:33.257129'),
(3, '2', 'Md. Sabik Alam Rahat', '3', 'This has windows file extensions (the Makefile uses standard file extensions) so won\'t work. It also won\'t work as the src/obj file base names don\'t match the executable names. But it is at least on the right track', '2021-09-08 00:36:15.385537'),
(4, '4', 'Kawshik Das', '4', 'All I can think of is that it has something to do with the DragTarget builder not rebuilding correctly, it only draws updates, not redrawing the entire page, but idk.', '2021-09-08 00:46:14.627218'),
(5, '5', 'Naeem Mizan', '6', 'Just use transform: scale(); instead', '2021-09-08 00:59:59.667808'),
(6, '6', 'Mirajur Rahman', '6', 'rebuild the project again and then run....', '2021-09-08 01:11:56.948955'),
(7, '3', 'Humaira Tabassum', '7', 'In pure C it would necessarily rely on what is UB at the level of the language. You can do it in assembly, of course. But I don\'t know what\'s wrong with just using your compiler\'s existing va_start; every conforming freestanding C implementation should provide it, and although its innards are implementation-dependent, all compilers supporting your chosen ABI will work correctly and interoperate.', '2021-09-08 01:31:57.867360'),
(8, '3', 'Humaira Tabassum', '5', 'I would prefer to have at least va_start() be a C macro but looks like this might not be possible. I have seen other answers to different questions saying it is not possible to do in C because you have to rely on undefined behaviour.  For context I am writing a kernel and I do not want to rely on any specific C89 compiler or unix-like assembler. Portability is one of the main goals of the project. Keeping it simple is another goal, unfortunately supporting something like variadic arguments seems to be complex on some architectures (amd64 ABI).', '2021-09-08 01:37:04.513502');

-- --------------------------------------------------------

--
-- Table structure for table `users_contacts`
--

CREATE TABLE `users_contacts` (
  `id` bigint(20) NOT NULL,
  `messengerId` varchar(10) NOT NULL,
  `messengerUsername` varchar(30) NOT NULL,
  `messengerEmail` varchar(50) NOT NULL,
  `messengerPhoneNumber` varchar(15) NOT NULL,
  `message` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_internships`
--

CREATE TABLE `users_internships` (
  `id` bigint(20) NOT NULL,
  `publisherId` varchar(15) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `internshipTitle` varchar(20) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `description` varchar(3072) NOT NULL,
  `internshipType` varchar(15) NOT NULL,
  `paymentStatus` varchar(15) NOT NULL,
  `workPlace` varchar(15) NOT NULL,
  `minSalary` varchar(15) NOT NULL,
  `maxSalary` varchar(15) NOT NULL,
  `applyLink` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_internships`
--

INSERT INTO `users_internships` (`id`, `publisherId`, `publisherName`, `internshipTitle`, `companyName`, `description`, `internshipType`, `paymentStatus`, `workPlace`, `minSalary`, `maxSalary`, `applyLink`, `created_at`) VALUES
(1, '4', 'Kawshik Das', 'Apprentice', ' SBU Head', 'Job description\r\nThis position is a key contributor to the SBU strategy, identifies and develops opportunities for growth and to gain market share. That leads the effort to create a strong network of end to end business performance process and to deliver top lines & bottom lines of individual SBUs named A) Staple Goods B) Dairy C) Beverage D) Snacks within the FMCG division. The ideal candidate will be responsible to manage any of the assigned SBU among the mentioned 4 for overall operations of the company as well as develop and implement strategies that meet the needs of the customers, stakeholders, and employees.\r\n\r\n\r\nREPORTS TO\r\n\r\nBoard of Directors\r\n\r\n\r\nNUMBER OF VACANCY\r\n\r\nTotal 4 COO for 4 different SBUs A) Staple Goods B) Dairy C) Beverage and D) Snacks\r\n\r\n\r\nJOB RESPONSIBILITIES BUT NOT LIMITED TO\r\n\r\nDevelop short term and long-term business strategies across all channels\r\nDevelop and maintain sustainable strategy to support growth and profitability targets\r\nManage product lifecycle including SKU rationalization and PEM (Product Excellence\r\nManagement)\r\n\r\nPerform competitor analysis and develop defensive and offensive plans\r\nPerform industry trend analysis, market share and competitive analysis, and win/loss tracking\r\nto identify product and commercial strategies for growth\r\n\r\nResearch and track market competitive trends to remain abreast of product category\r\ndevelopments\r\n\r\nSet and manage P&L targets by categories, channels & SBUs\r\nDevelop and execute NPD (New Product Development) process and marketing plans\r\nDevelop strategies to communicate with the potential current & future prospective consumers\r\nManage website, bloggers, and social medial contents\r\nDevelop annual marketing budget and deliver & achieve all activities within the budget\r\nBuilding and executing product launch plan, including value proposition, segmentation /\r\npositioning, target pricing, awareness & advocacy strategies, channel strategy and sales\r\n\r\nenablement\r\n\r\nCollaborating with Advertising & Promotion and Communications to develop a\r\ncommunications plan in support of the marketing objective defining brand, value proposition(s), and competitive positioning roadmaps.\r\n\r\n\r\nQUALIFICATIONS, SKILLS & REQUIREMENTS\r\n\r\nPost-Graduation degree in any discipline preferably from MBA/Business Administration\r\n15+ years of total experience with 05 years of experience in similar leadership position\r\nLeadership skills to lead and/or influence teams and shape/lead growth vision and marketing\r\nStrategy\r\n\r\nExcellent oral and written communication skills\r\nStrong analytical and process skills with in-depth understanding on FMCG business\r\nPragmatic, focused on real impact\r\nExperience leading direct and indirect teams, and working in large multi-functional and crossgeography teams\r\n\r\nRoleHead/VP/GM-Operations\r\nIndustry TypeFMCG\r\nFunctional AreaTop Management\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryOther\r\nEducation\r\nUG :Any Graduate\r\nPG :MBA/PGDM in Any Specialization', 'Part Time', 'Unpaid', 'At Office', '10000', '15000', 'https://docs.google.com/forms/d/e/1FAIpQLScpMvajb9BzCUsAlhqQ4G0qTrsdCKTo7NcE5d2vXqe78xBZ5Q/viewform', '2021-09-08 00:54:58.120674'),
(2, '5', 'Naeem Mizan', 'Solution Architect', 'Medvarsity Online Limited', 'Job description\r\nTechnical exp in Rail Network Communications including IP/MPLS, CCTV/Surveillance, Wi-Fi,\r\nSolution Design of Network Infrastructure, LAN, WAN, Server and security architecture and policies\r\nExperience of Core Routing & Switching design, configuration\r\n\r\nRequired Candidate profile\r\n\r\nSolution Architect during project test/pilot phases for network planning, design & system integration in Railways by closely working with both client & delivery teams\r\n\r\nReady to work onsite Dhaka\r\nRolePre Sales Consultant\r\nIndustry TypeHardware & Networking\r\nFunctional AreaSales, Retail, Business Development\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryPre Sales\r\nEducation\r\nUG :B.Tech/B.E. in Any Specialization\r\nKey Skills', 'Part Time', 'Unpaid', 'Work from Home', '10000', '20000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-08 01:06:59.066261'),
(3, '6', 'Mirajur Rahman', 'Virtual Internship', 'Network Solution Architect', 'Job description\r\nTelecommunications consultant specialization in Railways domain\r\nSolution Design of Network Infrastructure, incorporating LAN, WAN, Server & security architecture\r\nTechnical exp in Rail Network Communications including IP/MPLS,Surveillance, Wi-Fi,\r\n\r\nRequired Candidate profile\r\n\r\nExp in voice/data/internet applications, communications technology & network design.Have strategic & analytical thinking/during presales/business development stages in creating solutions/presentations\r\nRoleOutside Consultant\r\nIndustry TypeTelecom / ISP\r\nFunctional AreaIT Hardware, Technical Support, Telecom Engineering\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryOther\r\nEducation\r\nUG :B.Tech/B.E. in Any Specialization, BCA in Any Specialization', 'Full Time', 'Negotiable', 'At Office', '10000', '15000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-08 01:14:38.409931'),
(4, '3', 'Humaira Tabassum', 'Python Developer', 'Flixstock India Private Limite', 'Job description\r\nGood with Python Programming\r\nWriting effective, scalable code\r\nDeveloping back-end components to improve responsiveness and overall performance\r\nBasic knowledge of Image Processing\r\nRoleSoftware Developer\r\nIndustry TypeSoftware Product\r\nFunctional AreaIT Software - eCommerce, Internet Technologies\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryProgramming & Design\r\nEducation\r\nUG :B.Tech/B.E. in Any Specialization', 'Full Time', 'Negotiable', 'Work from Home', '12000', '30000', 'https://docs.google.com/forms/d/e/1FAIpQLScpMvajb9BzCUsAlhqQ4G0qTrsdCKTo7NcE5d2vXqe78xBZ5Q/viewform', '2021-09-08 01:31:10.130077');

-- --------------------------------------------------------

--
-- Table structure for table `users_jobs`
--

CREATE TABLE `users_jobs` (
  `id` bigint(20) NOT NULL,
  `publisherId` varchar(15) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `jobTitle` varchar(20) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `description` varchar(3072) NOT NULL,
  `jobType` varchar(15) NOT NULL,
  `paymentStatus` varchar(15) NOT NULL,
  `workPlace` varchar(15) NOT NULL,
  `minSalary` varchar(15) NOT NULL,
  `maxSalary` varchar(15) NOT NULL,
  `applyLink` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_jobs`
--

INSERT INTO `users_jobs` (`id`, `publisherId`, `publisherName`, `jobTitle`, `companyName`, `description`, `jobType`, `paymentStatus`, `workPlace`, `minSalary`, `maxSalary`, `applyLink`, `created_at`) VALUES
(1, '2', 'Md. Sabik Alam Rahat', 'Apprentice', 'GHI Company', 'This is a sample description', 'Part Time', 'Paid', 'Work from Home', '10000', '15000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-08 00:16:38.030807'),
(2, '4', 'Kawshik Das', 'Senior General-Opera', ' Bangladesh Chattogram(Garment', 'Job description\r\nRoles and Responsibilities\r\n\r\nOverall responsible for all operations for smooth functioning of the Unit.\r\nTo develop and implement strategies for further expansion, increase productivity manpower management and organization structures.\r\nTo ensure achievement of production targets for the unit within the cost, time and quality norms.\r\nTo ensure coordination amongst various areas of production, technical, quality, etc.\r\nFollow up of production plan from cutting to sewing and achieving targeted line efficiency.\r\nMake sure product quality is in accordance with standards laid down by the buyer.\r\nConceptualizing & implementing projects, annual improvement plans for process reengineering, technology absorption projects for expansion and new products.\r\nTo provide manufacturing expertise to the Production team and ensure implementation of cost reduction/efficiency improvement through process changes/improvements.\r\nTo ensure timely preparation of production plans in line with the available capacity and marketing requirements.\r\nTo ensure proper upkeep of manufacturing facility to achieve machine availability, efficiency utilization norms.\r\nTo ensure regular monitoring of performance of all departments under him.\r\nEnsure proper utilization of manpower and good employee relations.\r\nTo provide performance review and information to the Director on regular basis by ensuring proper and timely generation of all management information reports.\r\n\r\n\r\nDesired Candidate Profile\r\n\r\nCandidate from India or Overseas.\r\nExcellent communication skills\r\nShould have excellent leadership, interpersonal and relationship management skills.\r\nMust have worked with larger companies.\r\nExposure to SCM, TPM &TQM will be an added advantage\r\n\r\n\r\n\r\n\r\nRoleHead/VP/GM-Production/Manufacturing/Maintenance\r\nIndustry TypeTextile & Apparel\r\nFunctional AreaProduction, Manufacturing, Maintenance\r\nEmployment TypeFull Time, Permanent\r\nRole CategorySenior Management\r\nEducation\r\nUG :B.Tech/B.E. in Any Specialization', 'Full Time', 'Paid', 'At Office', '20000', '30000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-08 00:53:39.263813'),
(3, '5', 'Naeem Mizan', 'Country Representati', 'Medvarsity Online Ltd', 'Job description\r\nJob Description\r\n\r\n\r\nDesignation: Country Representative Bangladesh (Dhaka)\r\n\r\n\r\nDirect Sales:\r\n\r\nSupport Direct Sales teams in generating leads by visiting Corporate Hospitals/ Pharma companies based on the directions from the team as well as the demand/ trend in Bangladesh\r\n\r\n\r\nOperations:\r\n\r\nOrganize Local workshop/seminars conducted by Medvarsity.\r\n\r\nEngagement with different Hospitals/Faculty to ensure smooth completion of Contact programs.\r\n\r\nEngagement with different Hospitals for Simulation programs.\r\n\r\nOther support activities\r\n\r\n\r\nExperience\r\n\r\n5+ years experience in Medical Fraternity\r\n\r\nKnowledge, Skills & Competencies\r\n\r\nHe/ She Should be a citizen of the country in Bangladesh.\r\n\r\nEntrepreneurial and proactive.\r\n\r\nPossess professional attitude and diligence and able to work independently as well as work in a team.\r\n\r\nAbility to prioritize tasks and manage time efficiently.\r\n\r\nProven skills in networking and relationship building.\r\n\r\nStrong analytical and information gathering skills.\r\n\r\nExcellent writing and facilitation skills.\r\n\r\nStrong communication and representational skills.\r\n\r\nStrong administrative skills.\r\n\r\nCultural sensitivity.\r\n\r\n\r\nEducational Qualification\r\n\r\nBDM/ any doctor\r\n\r\n\r\n\r\nRoleOther\r\nIndustry TypeMedical Services / Hospital\r\nFunctional AreaOther\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryOther\r\nEducation\r\nUG :Any Graduate', 'Full Time', 'Negotiable', 'At Office', '10000', '20000', 'https://docs.google.com/forms/d/e/1FAIpQLScpMvajb9BzCUsAlhqQ4G0qTrsdCKTo7NcE5d2vXqe78xBZ5Q/viewform', '2021-09-08 01:01:19.258863'),
(4, '3', 'Humaira Tabassum', 'Social Media Engagem', 'It Company', 'Manage our company image in a cohesive way to achieve our marketing goals and should be able to handle our social media presence ensuring high levels of web traffic and customer engagement\r\nYou’ll help us improve our company’s reputation and growth.\r\nRoleSocial Media Marketing Manager\r\nIndustry TypeMiscellaneous\r\nFunctional AreaMarketing, Advertising, MR, PR, Media Planning\r\nEmployment TypeFull Time, Permanent\r\nRole CategoryOnline/Digital Marketing\r\nEducation\r\nUG :Any Graduate', 'Part Time', 'Paid', 'At Office', '20000', '20000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-08 01:29:02.178466');

-- --------------------------------------------------------

--
-- Table structure for table `users_questions`
--

CREATE TABLE `users_questions` (
  `id` bigint(20) NOT NULL,
  `publisherId` varchar(20) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(3072) NOT NULL,
  `type` varchar(15) NOT NULL,
  `code` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_questions`
--

INSERT INTO `users_questions` (`id`, `publisherId`, `publisherName`, `title`, `description`, `type`, `code`, `created_at`) VALUES
(1, '2', 'Md. Sabik Alam Rahat', 'Flutter image not deleted properly after calling File.delete()', 'In my Flutter application I am using the photo_gallery package to retrieve images from Android by calling:\r\n\r\nvar albums = await PhotoGallery.listAlbums(mediumType: MediumType.image);\r\nEach image is represented by a file by calling getFile as listed in their documentation.\r\n\r\nAt some point, the user might request to delete an image, so the following code gets executed:\r\n\r\nawait file.delete();\r\nWhen browsing through the emulator file system using the Device File Explorer, the file seems to be deleted.\r\n\r\nBUT, for some reason both:\r\n\r\nThe Google Photos application still shows the deleted image thumbnail as blank:\r\nIn my application, the listAlbums method (mentioned in the begginig) retreives the deleted file which eventually throws an exception when building the image that the file doesn\'t exist.\r\nWhat am I missing? Is there another step that should be done upon files deletion?\r\n\r\nNote: already tried the suggestions mentioned here and here without any success.', 'Flutter', 'import \'package:cloud_firestore/cloud_firestore.dart\';\r\nimport \'package:flutter/material.dart\';\r\nimport \'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart\';\r\nimport \'package:transparent_image/transparent_image.dart\';\r\n\r\nclass HomeTab extends StatelessWidget {\r\n  @override\r\n  Widget build(BuildContext context) {\r\n    //Fazendo aquele degradezin massa\r\n    Widget _bodyBgBuilder() => Container(\r\n          decoration: const BoxDecoration(\r\n            gradient: LinearGradient(colors: [\r\n              Color.fromARGB(255, 255, 128, 128),\r\n              Color.fromARGB(255, 255, 182, 182)\r\n            ], begin: Alignment.topLeft, end: Alignment.bottomRight),\r\n          ),\r\n        );\r\n\r\n    //Retorno do widget\r\n    return Stack(\r\n      children: <Widget>[\r\n        _bodyBgBuilder(),\r\n        CustomScrollView(\r\n          slivers: <Widget>[\r\n            const SliverAppBar(\r\n              floating: true,\r\n              snap: true,\r\n              elevation: 0,\r\n              backgroundColor: Colors.transparent,\r\n              flexibleSpace: FlexibleSpaceBar(\r\n                title: Text(\"Destaques\"),\r\n                centerTitle: true,\r\n              ),\r\n            ),\r\n            FutureBuilder<QuerySnapshot>(\r\n              future: FirebaseFirestore.instance\r\n                  .collection(\"home\")\r\n                  .orderBy(\"pos\")\r\n                  .get(),\r\n              builder: (context, snapshot) {\r\n                if (snapshot.hasData) {\r\n                  return SliverStaggeredGrid.count(\r\n                    crossAxisCount: 2,\r\n                    mainAxisSpacing: 1,\r\n                    crossAxisSpacing: 1,\r\n                    staggeredTiles: snapshot.data!.docs.map((doc) {\r\n                      return StaggeredTile.count(\r\n                          doc.get(\"width\"), doc.get(\"height\"));\r\n                    }).toList(),\r\n                    children: snapshot.data!.docs.map((doc) {\r\n                      return FadeInImage.memoryNetwork(\r\n                          placeholder: kTransparentImage,\r\n                          image: doc.get(\"url\"));\r\n                    }).toList(),\r\n                  );\r\n                }\r\n                return SliverToBoxAdapter(\r\n                  child: Container(\r\n                    width: 200,\r\n                    height: 200,\r\n                    alignment: Alignment.center,\r\n                    child: const CircularProgressIndicator(\r\n                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),\r\n                    ),\r\n                  ),\r\n                );\r\n              },\r\n            ),\r\n          ],\r\n        ),\r\n      ],\r\n    );\r\n  }\r\n}', '2021-09-06 04:14:34.384963'),
(2, '3', 'Humaira Tabassum', 'Makefile to compile 2 applicaitons in C', 'I\'m trying to use the Makefile to compile source codes into 2 executable applications. The first application is called client and its source code is client00.c and the second server and source code is server00.c. The folder contains an INC file that contains all the necessary header files to compile. The SRC_LIB file contains all the necessary source code, and since I work with sockets, Winsock is required, which I link using the -lws2_32 flag.\r\n\r\n// gcc --version gcc (MinGW-W64 x86_64-posix-seh, built by Brecht Sanders) 11.2.0\r\n\r\nMy makefile looks like this:\r\n\r\n\r\nAnd the problem I\'m getting is: enter image description here\r\n\r\nHow do I properly compile two executable applications at once using a single Makefile?', 'C Programming', 'CC=gcc\r\nCFLAGS=-c -O2 -Wall -fcommon -I./INC\r\nLDFLAGS= -lws2_32 -lm\r\n\r\n\r\nLIBRARY=libcrypto.a\r\nSRC_LIB_DIR=SRC_LIB\r\n\r\nSRC_LIB := $(wildcard $(SRC_LIB_DIR)/*.c)\r\nOBJ_LIB=$(SRC_LIB:.c=.o)\r\n\r\nEXECUTABLE= client server\r\nSRC_EXE=client00.c server00.c\r\nOBJ_EXE=$(SRC_EXE:.c=.o)\r\n\r\n\r\nall: $(SRC_EXE) $(SRC_LIB) $(EXECUTABLE)\r\n\r\n$(EXECUTABLE): $(OBJ_EXE) $(LIBRARY)\r\n    $(CC) -o $@ $+ $(LDFLAGS)\r\n    \r\n.c.o:\r\n    $(CC) $(CFLAGS) $(LDFLAGS) $< -o $@\r\n\r\n$(LIBRARY): $(OBJ_LIB) \r\n    ar rcu $@ $+\r\n    ranlib $@\r\n\r\nclean:\r\n    rm -f $(EXECUTABLE).exe *.o *.a ', '2021-09-08 00:33:01.190442'),
(3, '3', 'Humaira Tabassum', 'Program for binary to decimal conversion in C isn\'t working like it\'s supposed to and instead gives ', 'The program is supposed to ask for length and number of binary strings and then stores them and converts them all into decimal and prints the decimal part. The logic seems fine to me but it isn\'t working for some reason and gives weird outputs. Here\'s the code:', 'C Programming', '#include <stdio.h>\r\n\r\nint main(){  \r\nint n, decimal_num = 0, base = 1, rem;  \r\nprintf (\"Enter the length and number of binary strings: \");\r\nscanf(\" %i\", &n);  \r\nint str[n], deci[n];\r\nfor(int i= 0; i<n; i++){\r\n    printf(\"Enter string %i: \", i+ 1);\r\n    scanf(\" %i\", &str[i]); \r\n}\r\nfor(int i= 0; i<n; i++){\r\n    while(str[i]> 0){  \r\n        rem= str[i]% 10; \r\n        decimal_num= decimal_num + rem*base;  \r\n        str[i] = str[i]/ 10;\r\n        base= base * 2;\r\n    }\r\n    deci[i]= decimal_num;\r\n    decimal_num= 0;\r\n}  \r\nfor(int i= 0; i<n; i++){\r\n    printf(\"%i\\n\", deci[i]);\r\n}\r\n} ', '2021-09-08 00:34:11.669316'),
(4, '2', 'Md. Sabik Alam Rahat', 'flutter page with DragTarget builder doesn\'t rebuild correctly after setState', 'But on this page it has problems.\r\n\r\nIt seems like it actually does work for changes, but doesn\'t get rid of the old UI elements.\r\n\r\nIf I drag a thing onto an account it does indeed get set to the account in the database, and the page automatically redraws because of the listener to show that the thing is now assigned to that account.\r\n\r\nHowever, what it does not do is remove the thing from the previous account in the UI. Redrawing the entire page seems like it should do this. Of course, the data is right on the backend but the page still shows something like this (for example):\r\n\r\nAccount 0\r\n  Thing 0\r\nAccount 1\r\n  Thing 1\r\n\r\n<move Thing 1 to Account 0>...\r\n\r\nAccount 0\r\n  Thing 0\r\n  Thing 1  // looks good!\r\nAccount 1\r\n  Thing 1  // not supposed to be there anymore...\r\nAll I can think of is that it has something to do with the DragTarget builder not rebuilding correctly, it only draws updates, not redrawing the entire page, but idk.\r\n\r\nThe rest of the code looks like this:', 'Flutter', '  ...\r\n\r\n  @override\r\n  Widget build(BuildContext context) => Scaffold(body:\r\n    ListView(children: <Widget>[\r\n      for (var account in accounts.data) ...[\r\n        DragTarget<Thing>(\r\n          key: Key(account.id),\r\n          builder: (\r\n            BuildContext context,\r\n            List<Thing?> accepted,\r\n            List<dynamic> rejected,\r\n          ) => ListTile(title: Text(account.name));\r\n          onAcceptWithDetails: (details) =>\r\n            saveToAccount(details, account);\r\n        ),\r\n        for (var thing in things.byAccount.getAll(account.id)) ...[\r\n          Draggable<Thing>(\r\n            key: Key(thing.id),\r\n            data: thing,\r\n            child: ListTile(title: Text(thing.name)),\r\n            feedback: ListTile(title: Text(thing.name)),\r\n            childWhenDragging: null,\r\n          )\r\n        ]\r\n      ],\r\n    ]));\r\n}\r\n\r\nAccount 0\r\n  Thing 0\r\nAccount 1\r\n  Thing 1\r\n\r\n<move Thing 1 to Account 0>...\r\n\r\nAccount 0\r\n  Thing 0\r\n  Thing 1  // looks good!\r\nAccount 1\r\n  Thing 1  // not supposed to be there anymore...\r\n\r\nclass TechnicalView extends StatefulWidget {\r\n  const TechnicalView() : super();\r\n\r\n  @override\r\n  _TechnicalViewState createState() => _TechnicalViewState();\r\n}\r\n\r\nclass _TechnicalViewState extends State<TechnicalView> {\r\n  List<StreamSubscription> listeners = [];\r\n\r\n  /// LISTNER PATTERN:\r\n  @override\r\n  void initState() {\r\n    listeners.add(things.changes.listen((changes) {\r\n      setState(() {});\r\n    }));\r\n    super.initState();\r\n  }', '2021-09-08 00:43:07.076812'),
(5, '2', 'Md. Sabik Alam Rahat', 'Flutter ListWheelScrollView.useDelegate Make Auto Scroll for few seconds', 'I want to add an auto scrolling system in flutter ListWheelScrollView.useDelegate for few seconds. My ListWheelChildLoopingListDelegate is generating a loop of infinity widgets.\r\n\r\nIs it possible to scroll this loop for few seconds by clicking on a button?\r\n\r\nMy Code is here:', 'Flutter', 'return Container(\r\n  height: 125,\r\n  width: ScreenSize.width * 0.3,\r\n  child: ListWheelScrollView.useDelegate(\r\n    diameterRatio: 1,\r\n    squeeze: 1.8,\r\n    itemExtent: 75,\r\n    physics: FixedExtentScrollPhysics(),\r\n    onSelectedItemChanged: (index) => print(index),\r\n    childDelegate: ListWheelChildLoopingListDelegate(\r\n      children: List<Widget>.generate(\r\n        slotNames.length,\r\n        (index) => Padding(\r\n          padding: const EdgeInsets.all(3.0),\r\n          child: Container(\r\n            decoration: BoxDecoration(\r\n              border: Border.all(\r\n                color: Colors.blue,\r\n              ),\r\n              borderRadius: BorderRadius.circular(10.0),\r\n            ),\r\n            child: Image.asset(\r\n              \"assets/$index.png\",\r\n              width: double.infinity,\r\n              height: double.infinity,\r\n            ),\r\n          ),\r\n        ),\r\n      ),\r\n    ),\r\n  ),\r\n);', '2021-09-08 00:44:00.517171'),
(6, '4', 'Kawshik Das', 'how to show image in aspect ratio?', 'I am using css grid .I want to show my image using aspect ratio. depending upon width I want to show image .I don\'t want to give hard corded value of height .is it possible to show image without giving height .?In other words I depending upon width I want to show image without giving any value of height .\r\n\r\nhere is my code\r\n\r\nhttps://codesandbox.io/s/condescending-flower-m616l?file=/index.html', 'HTML', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n  <head>\r\n    <meta charset=\"UTF-8\" />\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\r\n    <title>Static Template</title>\r\n    <style>\r\n      .abc {\r\n        display: grid;\r\n        grid-template-columns: repeat(12, 6.697%);\r\n        grid-template-rows: 18px repeat(4, 1fr);\r\n        border: 1px solid green;\r\n        height: 320px;\r\n      }\r\n      .one {\r\n        grid-column: 2/5;\r\n        grid-row: 3/5;\r\n        border: 1px solid;\r\n      }\r\n      .two {\r\n        grid-row: 1/5;\r\n        grid-column: 2/5;\r\n        border: 1px solid #ee0;\r\n      }\r\n      .two div {\r\n        max-width: 100%;\r\n        /* height: 100%; */\r\n      }\r\n    </style>\r\n  </head>\r\n  <body>\r\n    <div class=\"abc\">\r\n      <div class=\"one\">\r\n        <p>\r\n          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptates\r\n          culpa iste facaudantium Lorem ipsum,\r\n        </p>\r\n      </div>\r\n      <div class=\"two\">\r\n        <div style=\"background-image: url(\'hero.png\');\"></div>\r\n      </div>\r\n    </div>\r\n  </body>\r\n</html>', '2021-09-08 00:47:38.233060'),
(7, '6', 'Mirajur Rahman', 'Portable way to implement variadic arguments in kernel space?', 'I am wondering if it is possible to implement the variadic macros in C or assembly.\r\n\r\nI would prefer to have at least va_start() be a C macro but looks like this might not be possible. I have seen other answers to different questions saying it is not possible to do in C because you have to rely on undefined behaviour.\r\n\r\nFor context I am writing a kernel and I do not want to rely on any specific C89 compiler or unix-like assembler. Portability is one of the main goals of the project. Keeping it simple is another goal, unfortunately supporting something like variadic arguments seems to be complex on some architectures (amd64 ABI).\r\n\r\nI know the __builtin_va_start(v,l), __builtin_va_arg(v, l), etc. macros exist but these are only available to specific compilers?\r\n\r\nRight now I have the kernel printf(, ...) and panic(, ...) routines written in assembly (i386 ABI) which setup the va_list (pointer to first va argument on the stack) and pass it to vprintf(, va_list) which then uses the va_arg() macro (written in C). This does not rely on any undefined or implementation defined behaviour but I would prefer that all the macros are written in C.', 'C Programming', '#include <stdio.h>\r\nint main() {    \r\n\r\n    int number1, number2, sum;\r\n    \r\n    printf(\"Enter two integers: \");\r\n    scanf(\"%d %d\", &number1, &number2);\r\n\r\n    // calculating sum\r\n    sum = number1 + number2;      \r\n    \r\n    printf(\"%d + %d = %d\", number1, number2, sum);\r\n    return 0;\r\n}\r\n', '2021-09-08 01:17:00.828729');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bkash_payment`
--
ALTER TABLE `bkash_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `profile_tokens`
--
ALTER TABLE `profile_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `questions_comments`
--
ALTER TABLE `questions_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_contacts`
--
ALTER TABLE `users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_internships`
--
ALTER TABLE `users_internships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_jobs`
--
ALTER TABLE `users_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_questions`
--
ALTER TABLE `users_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bkash_payment`
--
ALTER TABLE `bkash_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `profile_tokens`
--
ALTER TABLE `profile_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions_comments`
--
ALTER TABLE `questions_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_contacts`
--
ALTER TABLE `users_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_internships`
--
ALTER TABLE `users_internships`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_jobs`
--
ALTER TABLE `users_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_questions`
--
ALTER TABLE `users_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `profile_tokens`
--
ALTER TABLE `profile_tokens`
  ADD CONSTRAINT `profile_tokens_user_id_daa026a7_fk_app_users_id` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
