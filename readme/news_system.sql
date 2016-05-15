-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2016 at 12:54 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `news_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'PHP'),
(2, 'CSS'),
(3, 'HTML'),
(4, 'JavaScript');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` text CHARACTER SET utf8 NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `author` int(10) unsigned NOT NULL,
  `content` longtext CHARACTER SET utf8 NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `author` (`author`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `level` char(1) NOT NULL DEFAULT '1',
  `password` char(72) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `level`, `password`) VALUES
(1, 'admin', '2', '$2y$10$XFIO8S/RL9LpmIWNcN521uxdZXh/qru6BqeDe/1m4si6MqNu9R3aC'),
(2, 'user01', '1', '1234'),
(24, 'Use02', '1', '02'),
(25, 'User03', '1', 'User03'),
(26, 'Pham Ngoc Anh', '1', 'anhanh'),
(27, 'Pham Quynh Anh', '1', 'anhanh'),
(28, 'Pham Huu The', '1', 'thethe'),
(29, 'Nguyen Thi Huynh Ha', '1', 'haha'),
(30, 'Ho Thai Duy', '1', 'duyduy'),
(31, 'Ho Mai Tram', '1', 'tram'),
(32, 'Ho Thai My', '1', 'mymy'),
(33, 'Mai Xuan Huong', '1', 'huong'),
(34, 'Chu Nhat', '1', '$2y$10$STGOM8j3sziN58jARJ0xLOJg6'),
(35, 'Thu 2', '1', '$2y$10$strl3M5IjGBVmYqZUgPeWeUrV'),
(36, 'thu 3', '1', '827ccb0eea8a706c4c34a16891f84e7b'),
(37, 'Thu 5', '1', '46d01f7fe5b631c0993dc620094690e3'),
(38, 'thu 6', '1', '827ccb0eea8a706c4c34a16891f84e7b'),
(39, 'aaa', '1', '47bce5c74f589f4867dbd57e9ca9f808'),
(40, 'bbb', '1', '$2y$10$0fPe0RNzzZDE528YPdINSOZE9'),
(43, 'admin', '2', '$2y$10$sXi8HTNrRM4DmlPU436E0O1M5/IezPyml0yw31NGDlp/93cQDx.AG'),
(44, 'phamanh', '1', '$2y$10$.4Cm066DDUxfXoa/mDbl3uw4s4Na1BpEfxyt1RA9Puz13PRw/WFTu');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cate` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
