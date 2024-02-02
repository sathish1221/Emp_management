-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 09:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'sathish', 's', 'sathish11@gmail.com', '12345', '2024-01-08 11:08:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `record_id` int(11) NOT NULL,
  `emp_id` varchar(11) NOT NULL,
  `att_date` date NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `total_hours` time DEFAULT NULL,
  `status` enum('present','absent','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`record_id`, `emp_id`, `att_date`, `check_in`, `check_out`, `total_hours`, `status`) VALUES
(2, '2', '2024-01-19', '2024-01-19 15:39:00', '2024-01-19 15:39:00', '00:00:00', 'present'),
(3, '3', '2024-01-19', '2024-01-19 15:40:00', '2024-01-19 15:40:00', '00:00:00', 'present'),
(4, '4', '2024-01-19', '2024-01-19 15:40:00', '2024-01-19 15:40:00', '00:00:00', 'present'),
(6, '1', '2024-01-19', NULL, NULL, '00:00:00', 'absent'),
(7, '1', '2024-01-22', '2024-01-22 11:57:00', '2024-01-22 17:31:00', NULL, 'present'),
(9, '2', '2024-01-22', '2024-01-22 17:59:00', NULL, '00:00:00', 'present'),
(10, '1', '2024-01-23', '2024-01-23 15:25:00', '2024-01-23 17:49:00', '01:54:30', 'present'),
(11, '1', '2024-01-24', '2024-01-24 10:08:00', '2024-01-24 11:19:00', '01:11:07', 'present'),
(12, '7', '2024-01-24', '2024-01-24 16:00:00', '2024-01-24 18:09:00', '02:12:08', 'present'),
(13, '1', '2024-01-29', '2024-01-29 10:54:00', NULL, '00:00:00', 'present'),
(14, '1', '2024-01-30', '2024-01-30 10:09:00', '2024-01-30 17:36:00', '07:27:52', 'present'),
(15, '2', '2024-01-30', '2024-01-30 12:10:00', '2024-01-30 13:02:00', '12:52:17', 'present'),
(16, '3', '2024-01-30', '2024-01-30 13:03:00', '2024-01-30 13:04:00', '12:26:56', 'present'),
(17, '4', '2024-01-30', '2024-01-30 15:03:00', '2024-01-30 15:12:00', '00:11:46', 'present'),
(18, '1', '2024-01-31', '2024-01-31 10:37:00', '2024-01-31 11:59:00', '02:49:22', 'present'),
(19, '1', '2024-02-01', '2024-02-01 11:35:00', '2024-02-01 12:16:00', '00:42:39', 'present'),
(20, '0', '2024-02-01', '2024-02-01 13:11:00', '2024-02-01 13:12:00', '00:04:37', 'present'),
(21, 'ss1', '2024-02-01', '2024-02-01 13:16:00', '2024-02-01 16:50:00', '03:43:21', 'present'),
(22, '10', '2024-02-01', '2024-02-01 15:08:00', '2024-02-01 15:08:00', '00:00:16', 'present'),
(23, 'ss1', '2024-02-02', '2024-02-02 12:36:00', '2024-02-02 12:36:00', '00:00:50', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other','') NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `img` longtext NOT NULL,
  `bank_holder_name` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `acc_no` bigint(30) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `passbook_img` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('active','inactive','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `email`, `password`, `date_of_birth`, `gender`, `contact`, `address`, `dept`, `degree`, `img`, `bank_holder_name`, `bank_name`, `acc_no`, `ifsc_code`, `passbook_img`, `created_at`, `updated_at`, `status`) VALUES
('10', 'mani', 's', 'mani123@gmail.com', '12345', '2000-03-15', 'male', '7897897889', '123kitecareer', 'computer', 'Bs.C', '../images/bg.jpg', NULL, NULL, NULL, NULL, NULL, '2024-01-30 17:51:28', NULL, 'active'),
('2', 'arjun', 't', 'arjun123@gmail.com', '12345', '2002-05-10', 'male', '7897898797', '123kitecareer', 'english', 'BA', '../images/rest_api.png', NULL, NULL, NULL, NULL, NULL, '2024-01-09 15:42:17', NULL, 'active'),
('3', 'mathan', 'a', 'mathan123@gmail.com', '12345', '2001-04-18', 'male', '678678789', '123kitecareer', 'computer', 'BCA', '../images/2650332.jpg', NULL, NULL, NULL, NULL, NULL, '2024-01-09 15:43:34', NULL, 'active'),
('4', 'mukesh', 'c', 'mukesh123@gmail.com', '12345', '2000-03-22', 'male', '7897897897', '1234kitecareer', 'maths', 'Bs.C', '../images/python-100763524-large.jpg', NULL, NULL, NULL, NULL, NULL, '2024-01-09 16:09:24', NULL, 'active'),
('7', 'manoj', 'k', 'manoj123@gmail.com', '12345', '2024-01-01', 'male', '7897897899', '123kitecareer', 'maths', 'Bs.C', '../images/2650332.jpg', NULL, NULL, NULL, NULL, NULL, '2024-01-10 15:46:38', NULL, 'active'),
('9', 'sherin', 's', 'sherin@gmail.com', '12345', '2003-02-07', 'male', '7898789778', '123kitecareer', 'computer', 'Bs.C', '../images/bg1.jpeg', NULL, NULL, NULL, NULL, NULL, '2024-01-30 17:40:42', NULL, 'active'),
('ss1', 'sathish', 's', 'sathish123@gmail.com', '12345', '2002-07-19', 'male', '9889878982', '123kitecareer321', 'english', 'BA', '../images/2fe1f88fd7c7e398dee3fa97ab115f30.png', NULL, NULL, NULL, NULL, NULL, '2024-01-09 15:39:40', '2024-02-01 13:44:50', 'active'),
('ss2', 'suthan', 'k', 'suthan123@gmail.com', '12345', '2004-04-06', 'male', '8907897897', '123kitecareer', 'Business', 'BBA', '../images/new.jpg', NULL, NULL, NULL, NULL, NULL, '2024-02-01 16:55:19', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave`
--

CREATE TABLE `employee_leave` (
  `emp_id` varchar(11) NOT NULL,
  `token` int(110) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(110) NOT NULL,
  `status` enum('approved','pending','cancelled','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_leave`
--

INSERT INTO `employee_leave` (`emp_id`, `token`, `start_date`, `end_date`, `reason`, `status`) VALUES
('ss1', 1, '2024-01-12', '2024-01-13', 'sick leave', 'cancelled'),
('ss1', 2, '2024-01-14', '2024-01-18', 'sick leave', 'approved'),
('ss1', 3, '2024-02-02', '2024-02-03', 'sick leave', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `emp_id` varchar(11) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `due_date` date NOT NULL,
  `sub_date` date DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `status` enum('submitted','due','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `emp_id`, `project_name`, `due_date`, `sub_date`, `mark`, `status`) VALUES
(1, 'ss1', 'database', '2024-01-11', '2024-01-11', 10, 'submitted'),
(2, 'ss1', 'php', '2024-01-12', '2024-02-01', 10, 'submitted'),
(3, 'ss1', 'html', '2024-01-13', '2024-02-01', NULL, 'submitted'),
(5, 'ss1', 'database', '2024-02-02', NULL, 10, 'due'),
(6, '10', 'react', '2024-02-02', NULL, NULL, 'due');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `emp_id` varchar(11) NOT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`emp_id`, `points`) VALUES
('10', 0),
('2', 0),
('3', 0),
('4', 0),
('5', 0),
('6', 0),
('7', 0),
('8', 0),
('9', 0),
('ss1', 0),
('ss2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `emp_id` varchar(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `salary_mode` enum('cash','account','other','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('pending','in_progerss','completed','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`emp_id`, `salary`, `bonus`, `total`, `salary_mode`, `created_at`, `updated_at`, `status`) VALUES
('ss1', 15000, 0, 15000, 'cash', '2024-01-09 10:09:40', '2024-02-01 10:23:36', 'pending'),
('2', 15000, 0, 15000, 'cash', '2024-01-09 10:12:17', NULL, 'pending'),
('3', 15000, 0, 15000, 'cash', '2024-01-09 10:13:34', NULL, 'pending'),
('4', 15000, 0, 15000, 'cash', '2024-01-09 10:39:24', NULL, 'pending'),
('5', 15000, 0, 15000, 'cash', '2024-01-09 10:40:53', NULL, 'pending'),
('6', 15000, 0, 15000, 'cash', '2024-01-09 10:41:29', NULL, 'pending'),
('7', 15000, 0, 15000, 'cash', '2024-01-10 10:16:38', NULL, 'pending'),
('9', 15000, 0, 15000, 'cash', '2024-01-30 12:10:42', '2024-01-30 12:18:42', 'pending'),
('10', 20000, 0, 20000, 'cash', '2024-01-30 12:21:28', NULL, 'pending'),
('ss2', 20000, 0, 20000, 'cash', '2024-02-01 11:25:19', NULL, 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `token` int(110) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
