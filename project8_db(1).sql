-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 05:26 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project8_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app8_admin_tb`
--

CREATE TABLE `app8_admin_tb` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password2` varchar(255) NOT NULL,
  `hashpassword` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app8_admin_tb`
--

INSERT INTO `app8_admin_tb` (`id`, `fname`, `lname`, `email`, `password`, `password2`, `hashpassword`) VALUES
(1, 'navitha', 'k', 'navithashankar123@gmail.com', 'navithashankar', '', '4f048b9f61c20871d1b285732e56ea61'),
(2, 'navitha', 'k', 'navi123@gmail.com', 'navithadhanurdev', '', '07ee4e9c7fc7949e1ad8dbb710198f3b');

-- --------------------------------------------------------

--
-- Table structure for table `app8_catagory_tb`
--

CREATE TABLE `app8_catagory_tb` (
  `id` bigint(20) NOT NULL,
  `catagory` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app8_catagory_tb`
--

INSERT INTO `app8_catagory_tb` (`id`, `catagory`) VALUES
(1, 'architecture'),
(2, 'road construction'),
(3, 'interior designing'),
(4, 'painting&tiling'),
(5, 'building construction'),
(6, 'area renovation');

-- --------------------------------------------------------

--
-- Table structure for table `app8_contact_tb`
--

CREATE TABLE `app8_contact_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobileno` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app8_contact_tb`
--

INSERT INTO `app8_contact_tb` (`id`, `name`, `mobileno`, `subject`, `email`, `message`) VALUES
(1, 'navitha', '2345623785', 'official information', 'navithashankar123@gmail.com', 'hello,navitha'),
(2, 'navi', '6452345745', 'official information', 'navithashankar123@gmail.com', 'hello,navi...emergency message'),
(3, 'navdev', '6534788265', 'official information', 'navithashankar123@gmail.com', 'hi...navi'),
(4, 'dev', '1234567898', 'asdfghj', 'navithashankar123@gmail.com', 'asdfghjkl');

-- --------------------------------------------------------

--
-- Table structure for table `app8_form_tb`
--

CREATE TABLE `app8_form_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `offprice` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `proimage` varchar(100) NOT NULL,
  `catagory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app8_form_tb`
--

INSERT INTO `app8_form_tb` (`id`, `name`, `price`, `offprice`, `details`, `proimage`, `catagory_id`) VALUES
(1, 'willa', '650k', '550k', 'location:near kannur', 'product/a7.jpeg', 1),
(2, 'school', '458k', '445k', 'location:kochi', 'product/blog-img-9.jpg', 2),
(3, 'interior design', '40k', '36k', 'location:kottayam', 'product/t2.webp', 3),
(4, 'painting', '30k', '25k', 'location:trivandram', 'product/t3.jpg', 4),
(5, 'home', '34k', '32k', 'location:near kannur', 'product/t5.jpg', 3),
(6, 'road', '200k', '199k', 'location:kannur', 'product/blog-post-1.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `app8_user_tb`
--

CREATE TABLE `app8_user_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobileno` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `sid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app8_user_tb`
--

INSERT INTO `app8_user_tb` (`id`, `name`, `email`, `mobileno`, `details`, `sid_id`) VALUES
(1, 'navitha', 'navithashankar123@gmail.com', '2345634856', 'natural atmosphere area', 1),
(2, 'hema', 'hemasanthosh@gmail.com', '4567890987', 'location in kochi', 2);

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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add catagory_tb', 7, 'add_catagory_tb'),
(26, 'Can change catagory_tb', 7, 'change_catagory_tb'),
(27, 'Can delete catagory_tb', 7, 'delete_catagory_tb'),
(28, 'Can view catagory_tb', 7, 'view_catagory_tb'),
(29, 'Can add form_tb', 8, 'add_form_tb'),
(30, 'Can change form_tb', 8, 'change_form_tb'),
(31, 'Can delete form_tb', 8, 'delete_form_tb'),
(32, 'Can view form_tb', 8, 'view_form_tb'),
(33, 'Can add reg_tb', 9, 'add_reg_tb'),
(34, 'Can change reg_tb', 9, 'change_reg_tb'),
(35, 'Can delete reg_tb', 9, 'delete_reg_tb'),
(36, 'Can view reg_tb', 9, 'view_reg_tb'),
(37, 'Can add user_tb', 10, 'add_user_tb'),
(38, 'Can change user_tb', 10, 'change_user_tb'),
(39, 'Can delete user_tb', 10, 'delete_user_tb'),
(40, 'Can view user_tb', 10, 'view_user_tb'),
(41, 'Can add admin_tb', 11, 'add_admin_tb'),
(42, 'Can change admin_tb', 11, 'change_admin_tb'),
(43, 'Can delete admin_tb', 11, 'delete_admin_tb'),
(44, 'Can view admin_tb', 11, 'view_admin_tb'),
(45, 'Can add contact_tb', 12, 'add_contact_tb'),
(46, 'Can change contact_tb', 12, 'change_contact_tb'),
(47, 'Can delete contact_tb', 12, 'delete_contact_tb'),
(48, 'Can view contact_tb', 12, 'view_contact_tb');

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
(1, 'admin', 'logentry'),
(11, 'app8', 'admin_tb'),
(7, 'app8', 'catagory_tb'),
(12, 'app8', 'contact_tb'),
(8, 'app8', 'form_tb'),
(9, 'app8', 'reg_tb'),
(10, 'app8', 'user_tb'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2023-03-17 05:52:59.857060'),
(2, 'auth', '0001_initial', '2023-03-17 05:53:00.363394'),
(3, 'admin', '0001_initial', '2023-03-17 05:53:00.467200'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-17 05:53:00.470664'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-17 05:53:00.487960'),
(6, 'app8', '0001_initial', '2023-03-17 05:53:00.647647'),
(7, 'app8', '0002_admin_tb', '2023-03-17 05:53:00.682669'),
(8, 'app8', '0003_contact_tb', '2023-03-17 05:53:00.708972'),
(9, 'contenttypes', '0002_remove_content_type_name', '2023-03-17 05:53:00.786752'),
(10, 'auth', '0002_alter_permission_name_max_length', '2023-03-17 05:53:00.824205'),
(11, 'auth', '0003_alter_user_email_max_length', '2023-03-17 05:53:00.857343'),
(12, 'auth', '0004_alter_user_username_opts', '2023-03-17 05:53:00.871818'),
(13, 'auth', '0005_alter_user_last_login_null', '2023-03-17 05:53:00.921948'),
(14, 'auth', '0006_require_contenttypes_0002', '2023-03-17 05:53:00.927091'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2023-03-17 05:53:00.939663'),
(16, 'auth', '0008_alter_user_username_max_length', '2023-03-17 05:53:00.965684'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2023-03-17 05:53:00.994810'),
(18, 'auth', '0010_alter_group_name_max_length', '2023-03-17 05:53:01.015873'),
(19, 'auth', '0011_update_proxy_permissions', '2023-03-17 05:53:01.025097'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2023-03-17 05:53:01.056863'),
(21, 'sessions', '0001_initial', '2023-03-17 05:53:01.099915'),
(22, 'app8', '0004_delete_reg_tb', '2023-03-21 10:44:42.640361');

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
('mosjvhu0b4i30zvxaim9oh3g51y2mut4', 'eyJhaWQiOjIsImFlbWFpbCI6Im5hdmkxMjNAZ21haWwuY29tIn0:1pfBnN:uAG7chhbiE5aVjDGgPYN1_4uOqksYxT9O3lTVhqgFLQ', '2023-04-06 03:39:21.337370'),
('p8ntejxoe17rj2fqxv85fc2opmp950h9', 'e30:1per7k:1P82Yr0kpnEo7h5s0nRYgGGORnRTSWiDjGvG3SBIPk4', '2023-04-05 05:35:00.714388');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app8_admin_tb`
--
ALTER TABLE `app8_admin_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app8_catagory_tb`
--
ALTER TABLE `app8_catagory_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app8_contact_tb`
--
ALTER TABLE `app8_contact_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app8_form_tb`
--
ALTER TABLE `app8_form_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app8_form_tb_catagory_id_c94fc1cc_fk_app8_catagory_tb_id` (`catagory_id`);

--
-- Indexes for table `app8_user_tb`
--
ALTER TABLE `app8_user_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app8_user_tb_sid_id_45e24b4a_fk_app8_form_tb_id` (`sid_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app8_admin_tb`
--
ALTER TABLE `app8_admin_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app8_catagory_tb`
--
ALTER TABLE `app8_catagory_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app8_contact_tb`
--
ALTER TABLE `app8_contact_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app8_form_tb`
--
ALTER TABLE `app8_form_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app8_user_tb`
--
ALTER TABLE `app8_user_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app8_form_tb`
--
ALTER TABLE `app8_form_tb`
  ADD CONSTRAINT `app8_form_tb_catagory_id_c94fc1cc_fk_app8_catagory_tb_id` FOREIGN KEY (`catagory_id`) REFERENCES `app8_catagory_tb` (`id`);

--
-- Constraints for table `app8_user_tb`
--
ALTER TABLE `app8_user_tb`
  ADD CONSTRAINT `app8_user_tb_sid_id_45e24b4a_fk_app8_form_tb_id` FOREIGN KEY (`sid_id`) REFERENCES `app8_form_tb` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
