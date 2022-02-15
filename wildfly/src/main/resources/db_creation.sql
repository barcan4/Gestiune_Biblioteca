-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 09:26 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
CREATE DATABASE IF NOT EXISTS `la_biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `la_biblioteca`;

-- --------------------------------------------------------

--
-- Table structure for table `carti`
--

CREATE TABLE `carti` (
  `cID` int(11) NOT NULL,
  `titlu` varchar(30) DEFAULT NULL,
  `autor` varchar(40) DEFAULT NULL,
  `editura` varchar(30) DEFAULT NULL,
  `anPublicatie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carti`
--

INSERT INTO `carti` (`cID`, `titlu`, `autor`, `editura`, `anPublicatie`) VALUES
(4, 'In pat cu regina', 'Eleanor Herman', 'Litera', 2021),
(6, 't2', 'a2', 'e2', 2),
(7, 't3', 'a3', 'e3', 3),
(8, 't4', 'a4', 'e4', 4),
(9, 't5', 'a5', 'e5', 5),
(10, 't6', 'a6', 'e6', 6),
(11, 'Rosu si Negru', 'Stendhal', 'Univers', 1981);

-- --------------------------------------------------------

--
-- Table structure for table `inchirieri`
--

CREATE TABLE `inchirieri` (
  `rID` int(11) NOT NULL,
  `cID` int(11) DEFAULT NULL,
  `uID` int(11) DEFAULT NULL,
  `dateRent` varchar(20) DEFAULT NULL,
  `dateReturned` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inchirieri`
--

INSERT INTO `inchirieri` (`rID`, `cID`, `uID`, `dateRent`, `dateReturned`) VALUES
(4, 4, 2, '2022-02-13', '2022-02-13'),
(6, 6, 2, '2022-02-13', '2022-02-13'),
(7, 7, 2, '2022-02-13', '2022-02-13'),
(8, 8, 2, '2022-02-13', ''),
(9, 9, 2, '2022-02-13', '2022-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `user_bib`
--

CREATE TABLE `user_bib` (
  `uID` int(11) NOT NULL,
  `nume` varchar(10) DEFAULT NULL,
  `prenume` varchar(15) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `parola` varchar(20) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_bib`
--

INSERT INTO `user_bib` (`uID`, `nume`, `prenume`, `user_name`, `parola`, `isAdmin`) VALUES
(1, 'petrescu', 'gigel', 'gigicul_thau', 'gigel', 1),
(2, 'Groza', 'Loredana', 'lore.groza', 'loredana', 0),
(3, 'elev', 'normal', 'elev.normal', 'elev', 0),
(4, 'n1', 'p1', 'n1.p1', 'pass1', 0),
(5, 'n1', 'p1', 'n1.p1', '1234', 0),
(6, 'asdas', 'asdad', 'asdas', 'asd', 0),
(7, 'florin', 'barcan', 'florin.barcan', 'florin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carti`
--
ALTER TABLE `carti`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `inchirieri`
--
ALTER TABLE `inchirieri`
  ADD PRIMARY KEY (`rID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `user_bib`
--
ALTER TABLE `user_bib`
  ADD PRIMARY KEY (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carti`
--
ALTER TABLE `carti`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inchirieri`
--
ALTER TABLE `inchirieri`
  MODIFY `rID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_bib`
--
ALTER TABLE `user_bib`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inchirieri`
--
ALTER TABLE `inchirieri`
  ADD CONSTRAINT `inchirieri_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `carti` (`cID`),
  ADD CONSTRAINT `inchirieri_ibfk_2` FOREIGN KEY (`uID`) REFERENCES `user_bib` (`uID`);
--
