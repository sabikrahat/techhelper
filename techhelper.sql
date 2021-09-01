-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 12:19 AM
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
(1, 'Md. Sabik', 'Alam Rahat', '01647629698', 'Flutter', '60', 'sabikrahat72428@gmail.com', 'sabikrahat72428', 'pbkdf2_sha256$260000$MNb1BnWs487LuGt7NwSx6Z$/qPmkiE8cqdwDBvHR6nKouDQOvRNiPF8Bf09iWg6m1o=', 'uploads/20210902032133-rahat.jpg', '2021-09-02 03:21:33.112793'),
(2, 'Humaira', 'Tabassum', '01733627713', 'C Programming', '80', 'humaira.tabassumkhan@gmail.com', 'humaira.tabassumkhan', 'pbkdf2_sha256$260000$jXjuTD1vUGWt1MWJScjQnN$ij6bxeak5F5wzL8CGvcXiqux3E+cA8qhmESgi6G7Il8=', 'uploads/20210902032231-humaira.jpg', '2021-09-02 03:22:31.626145'),
(3, 'Kawshik', 'Das', '01875602853', 'Python', '80', 'kawshik400@gmail.com', 'kawshik400', 'pbkdf2_sha256$260000$ief7LxiRXbTvDZcBCveGkO$WyjJR0BQQ+NRFkbHZBMaop+DHBp3IR1AtVMiyYhq+ec=', 'uploads/20210902032941-kawshik.jpg', '2021-09-02 03:29:41.597859');

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
(1, 'Can add qstn cmnt', 1, 'add_qstncmnt'),
(2, 'Can change qstn cmnt', 1, 'change_qstncmnt'),
(3, 'Can delete qstn cmnt', 1, 'delete_qstncmnt'),
(4, 'Can view qstn cmnt', 1, 'view_qstncmnt'),
(5, 'Can add user contact', 2, 'add_usercontact'),
(6, 'Can change user contact', 2, 'change_usercontact'),
(7, 'Can delete user contact', 2, 'delete_usercontact'),
(8, 'Can view user contact', 2, 'view_usercontact'),
(9, 'Can add user internships', 3, 'add_userinternships'),
(10, 'Can change user internships', 3, 'change_userinternships'),
(11, 'Can delete user internships', 3, 'delete_userinternships'),
(12, 'Can view user internships', 3, 'view_userinternships'),
(13, 'Can add user jobs', 4, 'add_userjobs'),
(14, 'Can change user jobs', 4, 'change_userjobs'),
(15, 'Can delete user jobs', 4, 'delete_userjobs'),
(16, 'Can view user jobs', 4, 'view_userjobs'),
(17, 'Can add user question', 5, 'add_userquestion'),
(18, 'Can change user question', 5, 'change_userquestion'),
(19, 'Can delete user question', 5, 'delete_userquestion'),
(20, 'Can view user question', 5, 'view_userquestion'),
(21, 'Can add user register', 6, 'add_userregister'),
(22, 'Can change user register', 6, 'change_userregister'),
(23, 'Can delete user register', 6, 'delete_userregister'),
(24, 'Can view user register', 6, 'view_userregister'),
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add permission', 9, 'add_permission'),
(34, 'Can change permission', 9, 'change_permission'),
(35, 'Can delete permission', 9, 'delete_permission'),
(36, 'Can view permission', 9, 'view_permission'),
(37, 'Can add group', 10, 'add_group'),
(38, 'Can change group', 10, 'change_group'),
(39, 'Can delete group', 10, 'delete_group'),
(40, 'Can view group', 10, 'view_group'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

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
(7, 'accounts', 'profile'),
(6, 'accounts', 'userregister'),
(8, 'admin', 'logentry'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(12, 'contenttypes', 'contenttype'),
(1, 'home', 'qstncmnt'),
(2, 'home', 'usercontact'),
(3, 'home', 'userinternships'),
(4, 'home', 'userjobs'),
(5, 'home', 'userquestion'),
(13, 'sessions', 'session');

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
(1, 'accounts', '0001_initial', '2021-09-01 20:33:28.016677'),
(2, 'accounts', '0002_profile', '2021-09-01 20:33:28.222559'),
(3, 'contenttypes', '0001_initial', '2021-09-01 20:33:28.428441'),
(4, 'auth', '0001_initial', '2021-09-01 20:33:30.180438'),
(5, 'admin', '0001_initial', '2021-09-01 20:33:30.843059'),
(6, 'admin', '0002_logentry_remove_auto_add', '2021-09-01 20:33:30.961991'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-01 20:33:31.046942'),
(8, 'contenttypes', '0002_remove_content_type_name', '2021-09-01 20:33:31.435719'),
(9, 'auth', '0002_alter_permission_name_max_length', '2021-09-01 20:33:31.735548'),
(10, 'auth', '0003_alter_user_email_max_length', '2021-09-01 20:33:31.957422'),
(11, 'auth', '0004_alter_user_username_opts', '2021-09-01 20:33:32.079351'),
(12, 'auth', '0005_alter_user_last_login_null', '2021-09-01 20:33:32.525095'),
(13, 'auth', '0006_require_contenttypes_0002', '2021-09-01 20:33:32.540087'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2021-09-01 20:33:32.576068'),
(15, 'auth', '0008_alter_user_username_max_length', '2021-09-01 20:33:32.668013'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2021-09-01 20:33:32.927397'),
(17, 'auth', '0010_alter_group_name_max_length', '2021-09-01 20:33:33.069315'),
(18, 'auth', '0011_update_proxy_permissions', '2021-09-01 20:33:33.230223'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2021-09-01 20:33:33.335163'),
(20, 'home', '0001_initial', '2021-09-01 20:33:33.706793'),
(21, 'sessions', '0001_initial', '2021-09-01 20:33:33.833721');

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
('ei3bhbs2xni1efawno9lkckywo7uro2b', 'eyJlbWFpbCI6InNhYmlrcmFoYXQ3MjQyOEBnbWFpbC5jb20ifQ:1mLXuT:IMuKOAntTQpR2muuK2qA_oVNSBFCPo791G_YEZfQYNM', '2021-09-15 21:36:41.366776');

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
(1, '', '2021-09-01 20:36:14.761276', 1),
(2, 'ffb2e6f3-37f7-4e92-ba89-f374a7bf5486', '2021-09-01 21:16:43.409910', 2),
(3, '', '2021-09-01 21:29:01.949838', 3);

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
(1, '2', 'Humaira Tabassum', '1', 'Please initialize the sharedPreference first.', '2021-09-02 03:17:34.891489'),
(2, '3', 'Kawshik Das', '2', 'try to add proper skeleton.... ????', '2021-09-02 03:36:12.997542');

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
(1, '2', 'Humaira Tabassum', 'Virtual Internship', 'Youth School for Social Entrep', 'The Covid-19 situation has completely reshaped the world and the demands of soft skills have increased noticeably. Therefore, to prepare the youths for the post-pandemic time YSSE is introducing its Internship Program, September 2021. So far more than 500 youths have successfully completed their Internship.\r\n\r\nNow it is your turn!!\r\n\r\nJoin YSSE Internship Program, September 2021, and get one more step closer to your success.\r\n\r\n♦ Deadline: 03 September 2021\r\n\r\n♦ Application link: https://forms.gle/LoCfaBjBwrZ64nXu6\r\n\r\nN.B - A candidate can apply in only one department.\r\n\r\n♦Visual Link: https://drive.google.com/file/d/1Zt-lC0rOKT8IBbFPsqSOagVDsTJr4uNG/view?usp=sharing ', 'Part Time', 'Paid', 'At Office', '10000', '15000', 'https://docs.google.com/forms/d/e/1FAIpQLScpMvajb9BzCUsAlhqQ4G0qTrsdCKTo7NcE5d2vXqe78xBZ5Q/viewform', '2021-09-02 03:26:22.700920'),
(2, '3', 'Kawshik Das', 'Flutter Dev Intern', 'Taka School ', 'At taka.school we are on the mission to solve the wealth gap of the nation by providing wealth management service for everyone. We are looking for problem solvers who will reinvent the technology stack of local financial system to achieve that mission.\r\n\r\nJob Description\r\n-Building apps for Android, IOS & Web, primarily using Flutter.\r\n-The applications will involve data visualization, and machine learning inferencing.\r\n-Translate designs and wireframes into high quality code.\r\n-Self-Learn about dart, and different flutter APIs.\r\n-Some involvement of JS frameworks are there as well.\r\n-Integrate lot of WebView components.\r\n-Handle Real-Time Time Series in a crowded screen space, optimizing for resources.\r\n-Roughly 40 hours work per week.\r\n-Take over codebase from third party vendors.\r\n\r\nBenefits & Allowance\r\n-10K salary per month during 3 months internship period.\r\n-After 3 months we offer you full time job if we like you.\r\n-You will learn plenty about how money works.\r\n\r\nApplication Requirement\r\n-Genuine interest in Mobile & Edge computing.\r\n-Interest in Data Analytics & Machine Learning technologies is a plus.\r\n-Final Year Students or Fresh Grads.\r\n-Should have a self-reliant problem solving mindset to solve hard problems with web research & little guidance by supervisor in a startup environment.\r\n-Intermediate level proficiency with at least one programming language such as Java, Kotlin, JavaScript, Python, PHP etc.\r\n-Knowledge of Algorithms & Data structure along with Big O notations.\r\n-Knowledge about any web framework.\r\n-Knowledge about dart and flutter is a plus.\r\n\r\nHiring Process\r\n-We hire people who can solve problems, we don’t care much about your grade or certs.\r\n-We will send you a programming challenge once you send your cv. You will have to solve it within a stipulated amount of time.\r\n-Based on your submission given the requirements and constraints sent to you, you will move onto the next step.\r\n-Sending cv early will start this process early.\r\n\r\nJob Location\r\n-Banani. Work will mostly be remote during the pandemic, but we intend to do some physical office work once the lockdown is gone as communication latency is much much lower in physical settings.\r\n\r\nApplication Instruction\r\n-Please send your cv to hr@taka.school\r\n\r\nApplication Deadline\r\n-August 25th, 2021', 'Full Time', 'Paid', 'At Office', '20000', '30000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-02 03:33:52.986866');

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
(1, '1', 'Md. Sabik Alam Rahat', 'Android Developer', 'Tech Novo LTD', 'Tech-novo is looking for an Android Developer/Flutter to be responsible for the development and maintenance of in-house applications.\r\n\r\nJob Responsibilities\r\n\r\n• Candidate must have at least 3 Years of Android development.\r\n\r\n• At least 1 year of Flutter Development Experience and completed clients\' projects successfully.\r\n\r\n• Must have experience with handling background service, threading, Push notification, SQLite, Retrofit2, Dagger2\r\n\r\nMVVM design pattern , Android Jetpack\r\n\r\nRxJava, RxAndroid.\r\n\r\n• Work with integration using REST APIs.\r\n\r\nSalary : 25000 BDT -40000 BDT\r\n\r\nPosition: Permanent\r\n\r\nOffice Hour: Friday Off\r\n\r\nOffice time: 10 am to 6 pm\r\n\r\nOffice Location: Mirpur Dohs, Work from Office.\r\n\r\nPlease send an email with CV and Expected Salary at jobs@tech-novo.uk', 'Full Time', 'Paid', 'At Office', '10000', '30000', 'https://docs.google.com/forms/d/e/1FAIpQLSd1WWK85KqBMlZwYdT-KH8FT_oVqq8lqp1SERXAvFQfwpQ-YA/viewform', '2021-09-02 03:11:10.840020');

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
(1, '1', 'Md. Sabik Alam Rahat', 'Getting this error when I use Flutter Shared Preference', 'So I\'ve created a login page for flutter through MySQL and now I\'m adding to it shared preferences to keep the user logged in. My first step was saving username, password, and token and the second step was of course getting username and password. Both steps work fine, but the third step should be navigating to the next page(User) while also pushing id and phone. While it is navigating to the next page but the page is empty.. I think its because it\'s not pushing id and phone to the next page.', 'Flutter', 'import \'dart:convert\';\r\n\r\nimport \'package:firebase_messaging/firebase_messaging.dart\';\r\nimport \'package:flutter/material.dart\';\r\n\r\n// import http.dart plugin that was previously entered into pubspec.yaml\r\nimport \'package:http/http.dart\' as http;\r\nimport \'package:multiple_login/admin.dart\';\r\nimport \'package:multiple_login/user.dart\';\r\nimport \'package:flutter/services.dart\';\r\nimport \'package:firebase_core/firebase_core.dart\';\r\nimport \'package:shared_preferences/shared_preferences.dart\';\r\n\r\nvoid main() async {\r\n  WidgetsFlutterBinding.ensureInitialized();\r\n  await Firebase.initializeApp();\r\n  runApp(MyApp());\r\n}\r\n\r\nvar fbm = FirebaseMessaging.instance;\r\nvar mytoken;\r\n\r\nclass MyApp extends StatelessWidget {\r\n  @override\r\n  Widget build(BuildContext context) {\r\n    return MaterialApp(\r\n      title: \"Multiple Login Flutter\",\r\n      debugShowCheckedModeBanner: false,\r\n      theme: ThemeData(\r\n        primaryColor: Colors.black,\r\n      ),\r\n      home: Login(),\r\n    );\r\n  }\r\n}\r\n\r\nclass Login extends StatefulWidget {\r\n  @override\r\n  _LoginState createState() => _LoginState();\r\n}\r\n\r\nclass _LoginState extends State<Login> {\r\n  // variable for saving data from data json which derive from php code in the file login.php\r\n  String username, password, status, id, phone, user, pass;\r\n\r\n  String alert = \"asd\";\r\n\r\n  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();\r\n  TextEditingController usernameInput = new TextEditingController();\r\n  TextEditingController passwordInput = new TextEditingController();\r\n\r\n  savePref() async {\r\n    SharedPreferences prefs = await SharedPreferences.getInstance();\r\n    prefs.setString(\'username\', username);\r\n    prefs.setString(\'password\', password);\r\n    prefs.setString(\'token\', mytoken);\r\n  }\r\n\r\n  getPref() async {\r\n    SharedPreferences prefs = await SharedPreferences.getInstance();\r\n    user = prefs.getString(\'username\');\r\n    pass = prefs.getString(\'password\');\r\n\r\n      if (user != null) {\r\n      Navigator.pushReplacement(\r\n          context,\r\n          MaterialPageRoute(\r\n              builder: (context) => User(\r\n                    id: id,\r\n                    phone: phone,\r\n                  )));\r\n    } else {\r\n      print(\'Login\');\r\n    }\r\n  }\r\n\r\n\r\n\r\n\r\n  @override\r\n  void initState() {\r\n    fbm.getToken().then((token) {\r\n      setState(() {\r\n        mytoken = token;\r\n      });\r\n    });\r\n    getPref();\r\n    super.initState();\r\n  }\r\n\r\n\r\n  \r\n  // method for login process\r\n  void loginProcess() async {\r\n    if (_formKey.currentState.validate()) {\r\n      // 10.0.2.2 is ip address from android studio\'s emulator\r\n\r\n      final response = await http.post(\r\n          \"http://***\",\r\n          body: {\r\n            \"username\": usernameInput.text,\r\n            \"password\": passwordInput.text,\r\n            \"token\": mytoken\r\n          });\r\n\r\n      var dataUser = json.decode(response.body);\r\n\r\n      if (dataUser.length < 1) {\r\n        // if data user is empty or 0\r\n        setState(() {\r\n          alert = \"Username or Password incorrect\";\r\n        });\r\n      } else {\r\n        setState(() {\r\n          ', '2021-09-02 03:08:57.581915'),
(2, '2', 'Humaira Tabassum', 'How to initialize a struct in accordance with C programming language standards', 'I want to initialize a struct element, split in declaration and initialization. This is what I have:\r\nIs this the way to declare and initialize a local variable of MY_TYPE in accordance with C programming language standards (C89, C90, C99, C11, etc.)? Or is there anything better or at least working?\r\n\r\nUpdate I ended up having a static initialization element where I set every subelement according to my needs.', 'C Programming', 'typedef struct MY_TYPE {\r\n  bool flag;\r\n  short int value;\r\n  double stuff;\r\n} MY_TYPE;\r\n\r\nvoid function(void) {\r\n  MY_TYPE a;\r\n  ...\r\n  a = { true, 15, 0.123 }\r\n}', '2021-09-02 03:24:06.764646'),
(3, '3', 'Kawshik Das', 'Strange \'Currency Rates source not ready\' forex_python error', 'I\'m trying to understand forex API through python.The code that I am posting below worked for me on friday and I received all the conversion rates for the dates as desired. Strangely when I run the code today for some reason it says', 'Python', 'from forex_python.converter import CurrencyRates\r\nimport pandas as pd\r\nc = CurrencyRates()\r\nfrom forex_python.converter import CurrencyRates\r\nc = CurrencyRates()\r\n\r\n\r\ndf = pd.DataFrame(pd.date_range(start=\'8/16/2021 10:00:00\', end=\'8/22/2021 11:00:00\', freq=\'600min\'), columns=[\'DateTime\'])\r\n\r\ndef get_rate(x):\r\n    try:\r\n        op = c.get_rate(\'CAD\', \'USD\', x)\r\n    except Exception as re:\r\n        print(re)\r\n        op=None\r\n    return op\r\n\r\ndf[\'Rate\'] = df[\'DateTime\'].apply(get_rate)\r\n\r\nCurrency Rates Source Not ', '2021-09-02 03:31:51.105708'),
(4, '1', 'Md. Sabik Alam Rahat', 'Flutter quiz app and how to select correct answer', 'I am a beginner and self-learning. I\'m using Flutter/Dart to make a quiz app. I am stuck on a portion of my code. I have a list with a map inside. It contains the question, four different choices for the question, and the correct answer (answerIndex).\r\n\r\nI want to have the function of when a user selects one of the choices, the button will turn into red or green based on if the answer is correct or incorrect. I\'m a bit lost on how to go about this with my current code.', 'Flutter', 'class QuizPage extends StatefulWidget {\r\n  @override\r\n  _QuizPageState createState() => _QuizPageState();\r\n}\r\n\r\nclass _QuizPageState extends State<QuizPage> {\r\n  static const questions = [\r\n    {\r\n      \'questionText\':\r\n          \'What protein is the principal component of skeletal muscle thick filiaments?\',\r\n      \'answersList\': [\'Actin\', \'Myosin\', \'Troponin\', \'Tropomyosin\'],\r\n      \'answerIndex\': 1,\r\n    },\r\n    {\r\n      \'questionText\': \'What connective tissue surrounds the entire muscle?\',\r\n      \'answersList\': [\'Epimysium\', \'Perimysium\', \'Endomysium\', \'Plasmalemma\'],\r\n      \'answerIndex\': 0,\r\n    },\r\n    {\r\n      \'questionText\':\r\n          \'In skeletal muscle cells, calcium initiates contraction by binding to?\',\r\n      \'answersList\': [\'Tropomyosin\', \'Actin\', \'Troponin\', \'Myosin\'],\r\n      \'answerIndex\': 2,\r\n    }\r\n  ];\r\n\r\n  int questionNumber = 0;\r\n\r\n  void answeredQuestion() {\r\n    if (questionNumber < questions.length) {\r\n      setState(() {\r\n        questionNumber += 1;\r\n      });\r\n    }\r\n  }\r\n\r\n\r\n\r\n  \r\n\r\n  @override\r\n  Widget build(BuildContext context) {\r\n    return questionNumber < questions.length\r\n        ? Column(\r\n            mainAxisAlignment: MainAxisAlignment.center,\r\n            crossAxisAlignment: CrossAxisAlignment.stretch,\r\n            children: [\r\n              Row(\r\n                children: [\r\n                  Padding(\r\n                    padding: EdgeInsets.symmetric(\r\n                      horizontal: 10.0,\r\n                      vertical: 30.0,\r\n                    ),\r\n                  ),\r\n                  Text(\r\n                    \'${questionNumber + 1} of ${questions.length}\',\r\n                    style: TextStyle(\r\n                      color: Colors.white,\r\n                      fontSize: 16.0,\r\n                    ),\r\n                  ),\r\n                ],\r\n              ),\r\n              Question(\r\n                questionText:\r\n                    questions[questionNumber][\'questionText\'].toString(),\r\n              ),\r\n\r\n              ///Answer Choices///\r\n              ...(questions[questionNumber][\'answersList\'] as List<String>)\r\n                  .map((answer) {\r\n                return Answer(\r\n                    selectedAnswer: answeredQuestion, answerText: answer);\r\n              }).toList(),\r\n            ],\r\n          )\r\n        : Result();\r\n  }\r\n}', '2021-09-02 03:37:58.638192');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `profile_tokens`
--
ALTER TABLE `profile_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions_comments`
--
ALTER TABLE `questions_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_contacts`
--
ALTER TABLE `users_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_internships`
--
ALTER TABLE `users_internships`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_jobs`
--
ALTER TABLE `users_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_questions`
--
ALTER TABLE `users_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
