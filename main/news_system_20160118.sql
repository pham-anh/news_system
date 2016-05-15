-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2016 at 12:34 AM
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
  `category` varchar(255) CHARACTER SET utf8 NOT NULL,
  `author` int(10) unsigned NOT NULL,
  `content` longtext CHARACTER SET utf8 NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `author` (`author`),
  KEY `category` (`category`),
  KEY `author_2` (`author`),
  KEY `author_3` (`author`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `subject`, `category`, `author`, `content`, `img`, `topic`, `ref`, `created_at`, `updated_at`) VALUES
(1, 'PHP the right way', '1', 1, 'This is my 1st MUST READ.', '', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Clean code', '1', 1, 'This is my 2nd MUST READ.', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Clean code', '1', 1, 'This is my 2nd MUST READ.', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'The Art of readable code', '1', 1, 'The 3rd', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'The Art of readable code', '1', 1, 'The 3rd', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Toi di code dao', '2', 1, 'Thinking...', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Toi di code dao', '2', 1, 'Thinking...', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Toi di code dao', '2', 1, 'Thinking...', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Tony buoi sang', '4', 1, 'Found recently', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Tony buoi sang', '4', 1, 'Found recently', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Hello', '1', 1, 'First run', '.././bootstrap/img/fake_captcha_1452938330.png', '1|capcha', 'php_ltv', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Hello', '1', 1, 'First run', '.././bootstrap/img/fake_captcha_1452939189.png', '1|capcha', 'php_ltv', '0000-00-00 00:00:00', '2016-01-16 10:13:09'),
(13, 'Hello', '1', 1, 'First run', '.././bootstrap/img/fake_captcha_1452939189.png', '1|capcha', 'php_ltv', '0000-00-00 00:00:00', '2016-01-16 10:14:15'),
(14, 'Hello', '1', 1, 'First run', '.././bootstrap/img/fake_captcha_1452939189.png', '1|capcha', 'php_ltv', '2016-01-16 10:14:49', '2016-01-16 10:14:49'),
(15, 'testing', '2', 1, 'testing', '', '', '', '2016-01-16 10:18:08', '2016-01-16 10:18:08'),
(16, 'testing', '2', 1, 'testing', '', '', '', '2016-01-16 10:19:52', '2016-01-16 10:19:52'),
(17, 'testing', '2', 1, 'testing', '', '', '', '2016-01-16 10:21:25', '2016-01-16 10:21:25'),
(18, 'testing', '2', 1, 'testing', '', '', '', '2016-01-16 10:21:41', '2016-01-16 10:21:41'),
(19, 'testing', '2', 1, 'testing', '', '', '', '2016-01-16 10:21:56', '2016-01-16 10:21:56'),
(20, 'qqq', '2', 1, 'qqq', '', '15', '', '2016-01-17 23:32:31', '2016-01-17 23:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `name`) VALUES
(1, 'aaa'),
(2, 'aaa'),
(3, 'aaa'),
(4, 'aaa'),
(5, 'aaa'),
(6, 'aaa'),
(7, 'aaa'),
(8, 'www'),
(9, 'www'),
(10, 'sss'),
(11, 'sss'),
(12, 'rrr'),
(13, 'rrr'),
(14, 'rrr'),
(15, 'qqq'),
(16, 'qqq');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `level`, `password`) VALUES
(1, 'admin', '2', '$2y$10$XFIO8S/RL9LpmIWNcN521uxdZXh/qru6BqeDe/1m4si6MqNu9R3aC'),
(2, 'user01', '1', '1234'),
(24, 'Use02', '1', '02'),
(25, 'User03', '1', 'User03'),
(34, 'Chu Nhat', '1', '$2y$10$STGOM8j3sziN58jARJ0xLOJg6'),
(35, 'Thu 2', '1', '$2y$10$strl3M5IjGBVmYqZUgPeWeUrV'),
(36, 'thu 3', '1', '827ccb0eea8a706c4c34a16891f84e7b'),
(37, 'Thu 5', '1', '46d01f7fe5b631c0993dc620094690e3'),
(38, 'thu 6', '1', '827ccb0eea8a706c4c34a16891f84e7b'),
(39, 'aaa', '1', '47bce5c74f589f4867dbd57e9ca9f808'),
(40, 'bbb', '1', '$2y$10$0fPe0RNzzZDE528YPdINSOZE9'),
(43, 'admin', '2', '$2y$10$sXi8HTNrRM4DmlPU436E0O1M5/IezPyml0yw31NGDlp/93cQDx.AG'),
(44, 'phamanh', '1', '$2y$10$.4Cm066DDUxfXoa/mDbl3uw4s4Na1BpEfxyt1RA9Puz13PRw/WFTu'),
(45, 'xtvn', '1', '$2y$10$JwhzNxk4SNQWtrO9/Q8mVO6CMgIR7Rmhr.XKbdeoevvtJSMbpwlaC'),
(46, 'test', '1', '$2y$10$byqgrT5SxugYFil5coaUPOWTuGFrbvgMhVdSkJ7rXbQOlla.gPljm'),
(47, 'testagain', '1', '$2y$10$oy4VZqo7ov0ULqG0eqGcnO9/nY970d8lvPHTTYZ1Perf1fjQ493eW'),
(48, 'testagain', '1', '$2y$10$dCQwYoMdraPYssWTuSUxMOOm2CHlhMYd.eyXd6GEuzzDL2v.icpqO'),
(49, 'testagain', '1', '$2y$10$2kha1tyq.wtSE/YXkkIH3u.ZXepvdPImMgblOFh2ibDQzlvoXUlja');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
