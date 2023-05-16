-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2023 at 01:31 PM
-- Server version: 5.7.42
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db1087_chatbot_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `ID` int(11) NOT NULL,
  `game_title` varchar(255) NOT NULL,
  `game_price` double NOT NULL,
  `game_desc` varchar(255) NOT NULL,
  `game_tags` varchar(255) NOT NULL,
  `game_sales` int(11) NOT NULL,
  `release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`ID`, `game_title`, `game_price`, `game_desc`, `game_tags`, `game_sales`, `release_date`) VALUES
(1, 'Grand Theft Auto 5', 9.73, 'Game description', 'Open world, Shooter', 87, '2013-05-16'),
(2, 'Fifa 23', 18.99, 'Desc', 'Sports, Football', 66, '2022-09-08'),
(3, 'Fifa 22', 5.99, 'Desc', 'Sports, Football', 44, '2021-10-08'),
(4, 'Fifa 21', 3.59, 'Desc', 'Sports, Football', 21, '2020-10-09'),
(5, 'Saints Row 4', 49.99, 'Desc', 'Open World, Shooter, Story', 95, '2022-11-02'),
(6, 'Destiny 2', 40, 'Desc', 'Sci-fi, Shooter', 500, '2023-02-14'),
(7, 'Hollow Knight ', 17.59, 'Desc', 'Action, Combat, 2D', 15, '2022-10-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
