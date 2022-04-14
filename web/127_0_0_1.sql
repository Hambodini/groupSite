-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2022 at 09:20 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb`
--
DROP DATABASE IF EXISTS `userdb`;
CREATE DATABASE IF NOT EXISTS `userdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `userdb`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `commentText` varchar(140) NOT NULL,
  `postId` int(11) NOT NULL,
  `timeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentId`, `userId`, `commentText`, `postId`, `timeStamp`) VALUES
(1, 1, 'LOL!!!! Boi.', 1, '2022-04-14 14:07:22'),
(2, 4, 'ROFL!! My Man;)!!', 1, '2022-04-14 14:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `postId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `postText` varchar(1024) NOT NULL,
  `timeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postId`, `userId`, `title`, `postText`, `timeStamp`) VALUES
(4, 1, 'All about Neil Green!!!', 'Neil moved to Toronto to attend York University, earning a degree in psychology and studying theatre and film acting. He began working on film and television productions, which included big movies such as Honey starring Jessica Alba and My Baby\'s Daddy starring Michael Imperioli from The Sopranos. Neil quickly discovered that getting bit parts on large movie sets was not as fulfilling as the experience he was receiving as a lead on a smaller independent productions. It was his time on set that set him exploring and learning about the aspects of filmmaking. Soon after writing his first screenplay, Highway, it was produced by Kevin Lane of Limestyle Productions.', '2022-04-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `birthday`) VALUES
(1, 'testuser@gmail.com', 'testuser', 'password', '2000-01-01'),
(4, 'trimeyers1@gmail.com', 'newUser', 'password123', '2002-01-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
