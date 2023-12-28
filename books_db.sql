-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2023 at 11:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `publishing_house` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `inventory_quantity` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ID`, `title`, `author`, `publication_year`, `publishing_house`, `price`, `inventory_quantity`, `genre_id`) VALUES
(1, 'One Piece', 'Eiichiro Oda', 1997, 'Shueisha', 12.99, 50, 1),
(2, 'My Hero Academia', 'Kohei Horikoshi', 2014, 'Shueisha', 10.99, 30, 2),
(3, 'Attack on Titan', 'Hajime Isayama', 2009, 'Kodansha', 14.99, 40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`ID`, `name`) VALUES
(1, 'Adventure'),
(2, 'Action'),
(3, 'Dark Fantasy');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `ID` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `group_name`) VALUES
(1, 'ADMIN'),
(2, 'CLIENT');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ID` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ID`, `service_name`) VALUES
(1, 'user_service'),
(2, 'books_service');

-- --------------------------------------------------------

--
-- Table structure for table `service_has_group`
--

CREATE TABLE `service_has_group` (
  `service_ID` int(11) NOT NULL,
  `group_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_has_group`
--

INSERT INTO `service_has_group` (`service_ID`, `group_ID`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `password`) VALUES
(1, 'a', 'a'),
(2, 'b', 'b'),
(3, 'c', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_group`
--

CREATE TABLE `user_has_group` (
  `user_ID` int(11) NOT NULL,
  `group_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_has_group`
--

INSERT INTO `user_has_group` (`user_ID`, `group_ID`) VALUES
(1, 1),
(2, 2),
(3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `service_has_group`
--
ALTER TABLE `service_has_group`
  ADD PRIMARY KEY (`service_ID`,`group_ID`),
  ADD KEY `group_ID` (`group_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD PRIMARY KEY (`user_ID`,`group_ID`),
  ADD KEY `group_ID` (`group_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`ID`);

--
-- Constraints for table `service_has_group`
--
ALTER TABLE `service_has_group`
  ADD CONSTRAINT `service_has_group_ibfk_1` FOREIGN KEY (`service_ID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `service_has_group_ibfk_2` FOREIGN KEY (`group_ID`) REFERENCES `group` (`ID`);

--
-- Constraints for table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD CONSTRAINT `user_has_group_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `user_has_group_ibfk_2` FOREIGN KEY (`group_ID`) REFERENCES `group` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
