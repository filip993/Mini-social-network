-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2018 at 01:11 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(120) NOT NULL,
  `id_prijatelja` int(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `id_prijatelja`) VALUES
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 7),
(4, 3),
(5, 3),
(5, 6),
(5, 11),
(5, 10),
(5, 7),
(6, 5),
(7, 3),
(7, 5),
(7, 20),
(7, 12),
(7, 8),
(8, 7),
(10, 5),
(10, 11),
(12, 7),
(12, 9),
(12, 13),
(12, 20),
(1, 2),
(11, 5),
(11, 10),
(11, 19),
(11, 20),
(13, 12),
(13, 14),
(13, 20),
(14, 13),
(14, 15),
(15, 14),
(16, 18),
(16, 20),
(17, 18),
(17, 20),
(18, 17),
(19, 11),
(19, 20),
(20, 7),
(20, 11),
(20, 12),
(20, 13),
(20, 16),
(20, 17),
(20, 19),
(18, 16),
(9, 12);

-- --------------------------------------------------------

--
-- Table structure for table `social_network`
--

CREATE TABLE `social_network` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(32) NOT NULL,
  `gender` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `social_network`
--

INSERT INTO `social_network` (`id`, `firstName`, `surname`, `age`, `gender`) VALUES
(1, 'Paul', 'Crowe', 28, 'male'),
(2, 'Rob', 'Fitz', 23, 'male'),
(3, 'Ben', 'O\'Carolan', 22, 'male'),
(4, 'Victor', 'a ', 28, 'male'),
(5, 'Peter', 'Mac', 29, 'male'),
(6, 'John', 'Barry', 18, 'male'),
(7, 'Sarah', 'Lane', 30, 'female'),
(8, 'Susan', 'Downe', 28, 'female'),
(9, 'Jack', 'Stam', 28, 'male'),
(10, 'Amy', 'Lane', 24, 'female'),
(11, 'Sandra', 'Phelan', 28, 'female'),
(12, 'Laura', 'Murphy', 33, 'female'),
(13, 'Lisa', 'Daly', 28, 'female'),
(14, 'Mark', 'Johnson', 28, 'male'),
(15, 'Seamus', 'Crowe', 24, 'male'),
(16, 'Daren', 'Slater', 28, 'male'),
(17, 'Dara', 'Zoltan', 48, 'male'),
(18, 'Marie', 'D', 28, 'female'),
(19, 'Catriona', 'Long', 28, 'female'),
(20, 'Katy', 'Couch', 28, 'female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `social_network`
--
ALTER TABLE `social_network`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
