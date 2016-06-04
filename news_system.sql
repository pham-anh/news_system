-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2016 at 07:19 PM
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
  `short_content` text CHARACTER SET utf8 NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `subject`, `category`, `author`, `short_content`, `content`, `img`, `topic`, `ref`, `created_at`, `updated_at`) VALUES
(35, 'Curabitur ut mi pulvinar, dictum lacus ac, elementum ante.', '2', 1, 'Phasellus sed varius dolor, vitae viverra risus. Sed nisi neque, aliquam id finibus ac, congue vitae sem. Curabitur tincidunt, tellus in sollicitudin consectetur, nulla dui gravida tortor, in vestibulum mi nisi suscipit nunc. Curabitur sed erat et justo consectetur interdum in vel erat. Aenean lacin', 'Phasellus sed varius dolor, vitae viverra risus. Sed nisi neque, aliquam id finibus ac, congue vitae sem. Curabitur tincidunt, tellus in sollicitudin consectetur, nulla dui gravida tortor, in vestibulum mi nisi suscipit nunc. Curabitur sed erat et justo consectetur interdum in vel erat. Aenean lacinia et ante eu convallis. Quisque non massa ac magna vestibulum bibendum. Nullam non venenatis metus, ut finibus enim. Fusce lobortis sollicitudin arcu ac porttitor. Nullam viverra dui eget tortor blandit, pharetra mollis eros fringilla. Aliquam erat volutpat. Duis mollis tortor vel libero suscipit, et feugiat velit sollicitudin. Nunc ultrices nunc iaculis turpis accumsan hendrerit. Morbi nulla libero, malesuada vitae eros id, gravida vestibulum tellus. Duis laoreet, turpis in tincidunt dictum, mi metus faucibus purus, vitae interdum mi diam id lorem. Proin aliquet in justo vel luctus. Vivamus ut convallis nulla.\r\n\r\nQuisque et condimentum leo, sit amet ornare eros. Aenean ut elit nec erat facilisis dapibus at pulvinar orci. Pellentesque lectus nisi, convallis eget nibh sit amet, volutpat commodo lectus. Donec pharetra velit sed eros venenatis egestas sed at ipsum. Ut sit amet urna et neque ultricies fermentum sed id urna. In mi dolor, pellentesque quis libero vel, ultricies vulputate enim. Donec a eros non nulla interdum lacinia ac eu mi. Suspendisse id volutpat dui. Curabitur ut mi pulvinar, dictum lacus ac, elementum ante. Sed tristique ligula sed sem aliquet, a fermentum justo lobortis. Nullam cursus sem ac egestas consectetur. Ut et ipsum rhoncus, tempor felis nec, pellentesque arcu. Sed enim magna, suscipit quis rhoncus non, elementum at enim. Curabitur mattis viverra auctor. Sed blandit arcu quis velit eleifend luctus. Nullam at est massa.', '.././bootstrap/img/IMG_0031_1460910716.JPG', '', '', '2016-04-17 16:31:56', '2016-04-17 16:31:56'),
(36, 'Phasellus eleifend lacinia faucibus', '3', 1, 'Etiam sit amet tempor turpis, ac scelerisque metus. Mauris finibus eros id libero rutrum, non viverra odio malesuada. Integer ac massa eget libero vulputate convallis. Nulla viverra, purus nec consectetur sodales, leo nibh efficitur mi, eget porta metus mauris quis dui. Integer in purus vulputate ju', 'Etiam sit amet tempor turpis, ac scelerisque metus. Mauris finibus eros id libero rutrum, non viverra odio malesuada. Integer ac massa eget libero vulputate convallis. Nulla viverra, purus nec consectetur sodales, leo nibh efficitur mi, eget porta metus mauris quis dui. Integer in purus vulputate justo facilisis dictum ac quis justo. Phasellus eleifend lacinia faucibus. Morbi quis erat mollis, tristique augue sit amet, tristique enim. Nullam convallis velit ac metus ullamcorper, in tincidunt purus tempor. Integer luctus, ligula id pulvinar porttitor, orci arcu consequat odio, et sagittis lorem nisl at dolor. Maecenas dictum velit ut nisi consequat, pharetra tempus urna pharetra. Pellentesque dignissim lacinia cursus. Sed eros leo, interdum id libero id, varius lacinia arcu. Sed malesuada ornare nulla in commodo. Vivamus fringilla iaculis mauris at eleifend. Pellentesque eu orci odio. Quisque volutpat vulputate lectus ac finibus.\r\n\r\nPhasellus sed varius dolor, vitae viverra risus. Sed nisi neque, aliquam id finibus ac, congue vitae sem. Curabitur tincidunt, tellus in sollicitudin consectetur, nulla dui gravida tortor, in vestibulum mi nisi suscipit nunc. Curabitur sed erat et justo consectetur interdum in vel erat. Aenean lacinia et ante eu convallis. Quisque non massa ac magna vestibulum bibendum. Nullam non venenatis metus, ut finibus enim. Fusce lobortis sollicitudin arcu ac porttitor. Nullam viverra dui eget tortor blandit, pharetra mollis eros fringilla. Aliquam erat volutpat. Duis mollis tortor vel libero suscipit, et feugiat velit sollicitudin. Nunc ultrices nunc iaculis turpis accumsan hendrerit. Morbi nulla libero, malesuada vitae eros id, gravida vestibulum tellus. Duis laoreet, turpis in tincidunt dictum, mi metus faucibus purus, vitae interdum mi diam id lorem. Proin aliquet in justo vel luctus. Vivamus ut convallis nulla.', '.././bootstrap/img/IMG_0042_1460910784.JPG', '', '', '2016-04-17 16:33:04', '2016-04-17 16:33:04'),
(37, 'Nam vel est at magna facilisis scelerisque', '3', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent eget nulla non quam euismod pharetra non nec justo. Pellentesque ultrices gravida nulla at blandit. Ut vestibulum lobortis augue non fringilla. Maecenas porta pharetra lectus, sed euismod justo faucibus ut. Donec pulvinar, nibh eget dictum mollis, diam sem congue elit, pharetra pretium mauris diam vel nibh. Praesent viverra neque vel neque ullamcorper semper. Sed luctus est eu nibh fringilla consequat. Suspendisse a erat non tortor consectetur pretium. Nam bibendum eros eget mi venenatis, ut rutrum mi consectetur. Maecenas finibus erat id faucibus porta.\r\n\r\nNam imperdiet eros nec vulputate scelerisque. Nullam sit amet maximus sem. Praesent viverra et tellus sed aliquam. Fusce nibh metus, mollis nec dapibus a, efficitur et lectus. Curabitur aliquet mi quis massa elementum fermentum id non quam. Nam eu eros lorem. Nullam eget dui imperdiet risus elementum accumsan et sed nunc. Donec id odio sed risus sollicitudin sagittis vitae vel ante. In vel viverra magna. Mauris vitae ligula id nunc bibendum laoreet. Praesent in faucibus lacus, ut pretium metus. Duis cursus turpis et congue dapibus. Proin luctus neque et rutrum pretium. Sed pulvinar ut massa et egestas.\r\n\r\nSed ultrices est mauris, a suscipit neque ornare id. Vivamus condimentum dolor id diam scelerisque, ut aliquam ante efficitur. Nam sed eros condimentum sem ultricies vehicula. Phasellus commodo ultricies lectus quis vulputate. Sed ut laoreet est, ac tristique massa. Donec tincidunt mattis neque rutrum semper. Phasellus blandit suscipit nibh vitae vestibulum. Nam vel est at magna facilisis scelerisque. Nullam eget eros finibus, ullamcorper diam non, rutrum ipsum.\r\n\r\nDonec tempor sem ut venenatis lobortis. Cras et lacus luctus, finibus tellus in, pretium ipsum. Integer et aliquet lectus. Donec suscipit nulla sed est dapibus fermentum. Nam semper massa lorem, a lobortis nunc consequat ut. Nunc tincidunt sodales est convallis posuere. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ornare nulla et diam porttitor, vitae dignissim nisl laoreet.', '', '3', '', '2016-04-17 17:03:50', '2016-04-17 17:03:50'),
(38, 'Nunc tincidunt sodales est convallis posuere', '3', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent eget nulla non quam euismod pharetra non nec justo. Pellentesque ultrices gravida nulla at blandit. Ut vestibulum lobortis augue non fringilla. Maecenas porta pharetra lectus, sed euismod justo faucibus ut. Donec pulvinar, nibh eget dictum mollis, diam sem congue elit, pharetra pretium mauris diam vel nibh. Praesent viverra neque vel neque ullamcorper semper. Sed luctus est eu nibh fringilla consequat. Suspendisse a erat non tortor consectetur pretium. Nam bibendum eros eget mi venenatis, ut rutrum mi consectetur. Maecenas finibus erat id faucibus porta.\r\n\r\nNam imperdiet eros nec vulputate scelerisque. Nullam sit amet maximus sem. Praesent viverra et tellus sed aliquam. Fusce nibh metus, mollis nec dapibus a, efficitur et lectus. Curabitur aliquet mi quis massa elementum fermentum id non quam. Nam eu eros lorem. Nullam eget dui imperdiet risus elementum accumsan et sed nunc. Donec id odio sed risus sollicitudin sagittis vitae vel ante. In vel viverra magna. Mauris vitae ligula id nunc bibendum laoreet. Praesent in faucibus lacus, ut pretium metus. Duis cursus turpis et congue dapibus. Proin luctus neque et rutrum pretium. Sed pulvinar ut massa et egestas.\r\n\r\nSed ultrices est mauris, a suscipit neque ornare id. Vivamus condimentum dolor id diam scelerisque, ut aliquam ante efficitur. Nam sed eros condimentum sem ultricies vehicula. Phasellus commodo ultricies lectus quis vulputate. Sed ut laoreet est, ac tristique massa. Donec tincidunt mattis neque rutrum semper. Phasellus blandit suscipit nibh vitae vestibulum. Nam vel est at magna facilisis scelerisque. Nullam eget eros finibus, ullamcorper diam non, rutrum ipsum.\r\n\r\nDonec tempor sem ut venenatis lobortis. Cras et lacus luctus, finibus tellus in, pretium ipsum. Integer et aliquet lectus. Donec suscipit nulla sed est dapibus fermentum. Nam semper massa lorem, a lobortis nunc consequat ut. Nunc tincidunt sodales est convallis posuere. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ornare nulla et diam porttitor, vitae dignissim nisl laoreet.\r\n\r\nProin sagittis vulputate justo, in blandit orci dapibus nec. Sed commodo euismod libero eget porttitor. Ut ac lacus a velit sollicitudin elementum sit amet sit amet magna. Cras elementum eu erat ut rutrum. Donec at erat viverra, elementum arcu eget, aliquet tortor. Quisque sodales laoreet lacus ac vulputate. Proin ut purus nec lectus facilisis hendrerit. In hac habitasse platea dictumst. Suspendisse iaculis felis fermentum magna maximus, vitae convallis odio vestibulum. Morbi quis auctor leo, non efficitur ex. Fusce vel convallis libero, at tincidunt lorem. Donec id venenatis nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ullamcorper pulvinar varius.', '.././bootstrap/img/IMG_0420_1460912676.JPG', '', '', '2016-04-17 17:04:36', '2016-04-17 17:04:36'),
(39, 'Cras et lacus luctus, finibus tellus in, pretium ipsum', '2|4', 1, 'Nam imperdiet eros nec vulputate scelerisque. Nullam sit amet maximus sem. Praesent viverra et tellus sed aliquam. Fusce nibh metus, mollis nec dapibus a, efficitur et lectus. Curabitur aliquet mi quis massa elementum fermentum id non quam. Nam eu eros lorem. Nullam eget dui imperdiet risus elementu', 'Nam imperdiet eros nec vulputate scelerisque. Nullam sit amet maximus sem. Praesent viverra et tellus sed aliquam. Fusce nibh metus, mollis nec dapibus a, efficitur et lectus. Curabitur aliquet mi quis massa elementum fermentum id non quam. Nam eu eros lorem. Nullam eget dui imperdiet risus elementum accumsan et sed nunc. Donec id odio sed risus sollicitudin sagittis vitae vel ante. In vel viverra magna. Mauris vitae ligula id nunc bibendum laoreet. Praesent in faucibus lacus, ut pretium metus. Duis cursus turpis et congue dapibus. Proin luctus neque et rutrum pretium. Sed pulvinar ut massa et egestas.\r\n\r\nSed ultrices est mauris, a suscipit neque ornare id. Vivamus condimentum dolor id diam scelerisque, ut aliquam ante efficitur. Nam sed eros condimentum sem ultricies vehicula. Phasellus commodo ultricies lectus quis vulputate. Sed ut laoreet est, ac tristique massa. Donec tincidunt mattis neque rutrum semper. Phasellus blandit suscipit nibh vitae vestibulum. Nam vel est at magna facilisis scelerisque. Nullam eget eros finibus, ullamcorper diam non, rutrum ipsum.\r\n\r\nDonec tempor sem ut venenatis lobortis. Cras et lacus luctus, finibus tellus in, pretium ipsum. Integer et aliquet lectus. Donec suscipit nulla sed est dapibus fermentum. Nam semper massa lorem, a lobortis nunc consequat ut. Nunc tincidunt sodales est convallis posuere. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ornare nulla et diam porttitor, vitae dignissim nisl laoreet.', '.././bootstrap/img/IMG_0543_1460912728.JPG', '2', '', '2016-04-17 17:05:28', '2016-04-17 17:05:28'),
(40, 'Pellentesque ultrices gravida nulla at blandit', '4', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt ut elit ac sodales. Donec risus lectus, facilisis id felis eget, malesuada rhoncus metus. Fusce tristique ipsum convallis velit sodales feugiat. Praesent ut lacus ultricies, ullamcorper tellus quis, commodo ante. Praesent eget nulla non quam euismod pharetra non nec justo. Pellentesque ultrices gravida nulla at blandit. Ut vestibulum lobortis augue non fringilla. Maecenas porta pharetra lectus, sed euismod justo faucibus ut. Donec pulvinar, nibh eget dictum mollis, diam sem congue elit, pharetra pretium mauris diam vel nibh. Praesent viverra neque vel neque ullamcorper semper. Sed luctus est eu nibh fringilla consequat. Suspendisse a erat non tortor consectetur pretium. Nam bibendum eros eget mi venenatis, ut rutrum mi consectetur. Maecenas finibus erat id faucibus porta.', '.././bootstrap/img/IMG_0350_1460912768.JPG', '3', '', '2016-04-17 17:06:08', '2016-04-17 17:06:08'),
(41, 'Donec id venenatis nulla', '2', 1, 'Sed ultrices est mauris, a suscipit neque ornare id. Vivamus condimentum dolor id diam scelerisque, ut aliquam ante efficitur. Nam sed eros condimentum sem ultricies vehicula. Phasellus commodo ultricies lectus quis vulputate. Sed ut laoreet est, ac tristique massa. Donec tincidunt mattis neque rutr', 'Sed ultrices est mauris, a suscipit neque ornare id. Vivamus condimentum dolor id diam scelerisque, ut aliquam ante efficitur. Nam sed eros condimentum sem ultricies vehicula. Phasellus commodo ultricies lectus quis vulputate. Sed ut laoreet est, ac tristique massa. Donec tincidunt mattis neque rutrum semper. Phasellus blandit suscipit nibh vitae vestibulum. Nam vel est at magna facilisis scelerisque. Nullam eget eros finibus, ullamcorper diam non, rutrum ipsum.\r\n\r\nProin sagittis vulputate justo, in blandit orci dapibus nec. Sed commodo euismod libero eget porttitor. Ut ac lacus a velit sollicitudin elementum sit amet sit amet magna. Cras elementum eu erat ut rutrum. Donec at erat viverra, elementum arcu eget, aliquet tortor. Quisque sodales laoreet lacus ac vulputate. Proin ut purus nec lectus facilisis hendrerit. In hac habitasse platea dictumst. Suspendisse iaculis felis fermentum magna maximus, vitae convallis odio vestibulum. Morbi quis auctor leo, non efficitur ex. Fusce vel convallis libero, at tincidunt lorem. Donec id venenatis nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ullamcorper pulvinar varius.', '.././bootstrap/img/random_01_1460912819.JPG', '5', '', '2016-04-17 17:06:59', '2016-04-17 17:06:59'),
(42, 'Suspendisse sit amet ullamcorper nisi', '2', 1, 'Donec aliquet hendrerit metus, in varius lacus hendrerit ut. Nullam rhoncus sem ac quam malesuada sodales sollicitudin ut quam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut sagittis eros vel purus suscipit, sit amet dictum leo feugiat. Sed nibh risus, fauc', 'Donec aliquet hendrerit metus, in varius lacus hendrerit ut. Nullam rhoncus sem ac quam malesuada sodales sollicitudin ut quam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut sagittis eros vel purus suscipit, sit amet dictum leo feugiat. Sed nibh risus, faucibus non turpis quis, imperdiet lacinia enim. Fusce egestas ac nunc ut venenatis. Aenean nec libero in ipsum maximus accumsan a a lacus. Maecenas in nisl sed nibh sollicitudin vestibulum. Suspendisse sit amet ullamcorper nisi.', '.././bootstrap/img/random_10_1460913296.JPG', '2', '', '2016-04-17 17:14:56', '2016-04-17 17:14:56'),
(43, 'Sed elementum leo metus, vitae eleifend ante viverra sed', '3', 1, 'Nulla semper tincidunt velit at scelerisque. Donec accumsan ornare congue. Aenean eu ullamcorper enim. Mauris ut libero sed nulla ultrices feugiat pharetra vel dui. Sed mattis, mi non pulvinar mollis, erat justo scelerisque purus, quis interdum mauris sapien eu leo. Sed tristique euismod ante, sed u', 'Nulla semper tincidunt velit at scelerisque. Donec accumsan ornare congue. Aenean eu ullamcorper enim. Mauris ut libero sed nulla ultrices feugiat pharetra vel dui. Sed mattis, mi non pulvinar mollis, erat justo scelerisque purus, quis interdum mauris sapien eu leo. Sed tristique euismod ante, sed ultrices felis ullamcorper sit amet. Sed elementum leo metus, vitae eleifend ante viverra sed. Nunc condimentum tellus dui, ac consectetur diam molestie quis. Proin vestibulum viverra arcu, sit amet mattis lacus aliquet ut. Donec fermentum urna vitae tristique gravida. In hac habitasse platea dictumst. Donec posuere, ligula ac lacinia sollicitudin, eros est accumsan enim, eu convallis ante diam eget ipsum. Pellentesque nulla metus, auctor eu magna eu, eleifend pulvinar nisl. Cras iaculis nibh eu eros aliquet, vel aliquet nibh malesuada. Sed mauris libero, venenatis accumsan convallis condimentum, dictum quis dolor. Aenean ac accumsan velit, at tristique massa.', '.././bootstrap/img/random_04_1460913349.JPG', '', '', '2016-04-17 17:15:49', '2016-04-17 17:15:49');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

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
(49, 'testagain', '1', '$2y$10$2kha1tyq.wtSE/YXkkIH3u.ZXepvdPImMgblOFh2ibDQzlvoXUlja'),
(50, 'member', '1', '$2y$10$QtFh6z0cXA3u4.GZGDQKLeGgdblKrnyGS0w754rzRVUaW8BqkQSgy'),
(51, 'hello', '1', '$2y$10$y6qowZR.LCz9jKevWIpameU5mJxPb1cxZ2qswmTClh/eqJLd72hXC'),
(52, 'test_new_add', '1', '$2y$10$8oBB4dCPXJQW1N9uMSLbQuBwXMHgrsiR4EtpB9NOuBfj/6oZRq8qm'),
(53, 'test_new_add', '1', '$2y$10$l8f2rEgZtvzbYTodAGX3Xu3JTn1hLcWzy0q/OvpGUH9XwTDk.ir0S');

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
