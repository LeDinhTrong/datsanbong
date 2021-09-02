-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 10:00 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datsanbong`
--

-- --------------------------------------------------------

--
-- Table structure for table `p000account`
--

CREATE TABLE `p000account` (
  `id` int(11) NOT NULL,
  `IdRole` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p000account`
--

INSERT INTO `p000account` (`id`, `IdRole`, `name`, `email`, `phone`, `address`, `password`, `img`, `created_date`, `role`) VALUES
(1, 1, 'Administrator', 'admin@gmail.com', '', '', '5f4dcc3b5aa765d61d8327deb882cf99', '../../../assets/images/logo-admin.png', '2021-02-15 08:55:52', 'a:3,b:3,c:3,d:3,e:3,f:3,g:3'),
(2, 0, 'custormer', 'customer@gmail.com', '', '', '5f4dcc3b5aa765d61d8327deb882cf99', '', '2021-07-21 12:04:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p100menu`
--

CREATE TABLE `p100menu` (
  `id` int(11) NOT NULL,
  `IdParentMenu` int(11) DEFAULT NULL,
  `IsGroup` int(11) DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Slug` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p100menu`
--

INSERT INTO `p100menu` (`id`, `IdParentMenu`, `IsGroup`, `Name`, `Slug`, `Icon`, `Position`) VALUES
(1, 0, 0, 'Bảng Thông Tin', '/manager/home', '<i class=\"fas fa-address-card\"></i>', 1),
(2, 0, 1, 'Quản lý Quyền', '', '<i class=\"fas fa-book-spells\"></i>', 2),
(3, 2, 0, 'Quản lý Menu', '/manager/c2-menu', '<i class=\"fas fa-bars\"></i>', 3),
(4, 2, 0, 'Phòng Ban', '/manager/c3-role', '<i class=\"fas fa-building\"></i>', 4),
(5, 2, 0, 'Tài Khoản', '/manager/c1-account', '<i class=\"fas fa-user-circle\"></i>', 5),
(6, 0, 0, 'Quản lý Admin', '/manager/c5-Admin', '<i class=\"fab fa-python\"></i>', 6),
(7, 0, 0, 'Quản lý User', '/manager/c6-User', '<i class=\"fab fa-python\"></i>', 7),
(8, 0, 0, 'Quản lý Owner', '/manager/c7-Owner', '<i class=\"fab fa-python\"></i>', 8),
(9, 0, 0, 'Quản lý FootbalField', '/manager/c8-FootbalField', '<i class=\"fab fa-python\"></i>', 9),
(10, 0, 0, 'Quản lý Booking', '/manager/c9-Booking', '<i class=\"fab fa-python\"></i>', 10),
(11, 0, 0, 'Quản lý ImageField', '/manager/c10-ImageField', '<i class=\"fab fa-python\"></i>', 11);

-- --------------------------------------------------------

--
-- Table structure for table `p200role`
--

CREATE TABLE `p200role` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p200role`
--

INSERT INTO `p200role` (`id`, `Name`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `p300roledetail`
--

CREATE TABLE `p300roledetail` (
  `id` int(11) NOT NULL,
  `IdRole` int(11) DEFAULT NULL,
  `IdMenu` int(11) DEFAULT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p300roledetail`
--

INSERT INTO `p300roledetail` (`id`, `IdRole`, `IdMenu`, `Status`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 2),
(3, 1, 3, 2),
(4, 1, 4, 2),
(5, 1, 5, 2),
(6, 1, 6, 2),
(7, 1, 7, 2),
(8, 1, 8, 2),
(9, 1, 9, 2),
(10, 1, 10, 2),
(11, 1, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `p400admin`
--

CREATE TABLE `p400admin` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p500user`
--

CREATE TABLE `p500user` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Avatar_Url` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p500user`
--

INSERT INTO `p500user` (`id`, `Name`, `Phone`, `Email`, `Password`, `Avatar_Url`) VALUES
(2, 'ledinhtrong', '0349342565', 'trongld@gmail.com', '123123123', 'assets/images/avatar.png'),
(7, 'trong', '0349342565', 'ldtrong@gmail.com', '123456789', 'assets/images/images.png'),
(8, 'zzz', '031323232', 'abc@gmail.com', '123456789', ''),
(9, 'zzzz', '000000000', 'abc@gmail.com', '123456789', '');

-- --------------------------------------------------------

--
-- Table structure for table `p600owner`
--

CREATE TABLE `p600owner` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Avatar_Url` mediumblob DEFAULT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p600owner`
--

INSERT INTO `p600owner` (`id`, `Name`, `Phone`, `Email`, `Password`, `Avatar_Url`, `Token`) VALUES
(2, 'ldtr', '0322365698', 'sdsda@gmail.com', 'password', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `p700footbalfield`
--

CREATE TABLE `p700footbalfield` (
  `idField` int(11) NOT NULL,
  `Owner_Id` int(11) DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price_Per_Hour` int(11) DEFAULT NULL,
  `OpenAt` datetime NOT NULL DEFAULT current_timestamp(),
  `CloseAt` datetime NOT NULL DEFAULT current_timestamp(),
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Avatar_Url` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p700footbalfield`
--

INSERT INTO `p700footbalfield` (`idField`, `Owner_Id`, `Name`, `Price_Per_Hour`, `OpenAt`, `CloseAt`, `Address`, `Description`, `Avatar_Url`) VALUES
(1, 2, 'Strawberry Field', 180000, '2021-07-01 05:00:00', '2021-07-31 21:00:00', 'cmt8, hoa tho dong, cam le, da nang', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 'assets/images/b99896e0f5a58fa97cb700e82a47d029.jpg'),
(3, 2, 'Penny Lano', 300000, '2021-07-16 00:00:00', '2021-07-31 00:00:00', 'da nang', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 'assets/images/penny_lano_field.jpg'),
(4, 2, 'SWSZ Field', 200000, '2021-08-10 06:00:00', '2021-08-10 21:00:00', '108 cmt8, cam le, da nang', 'This technique is quite expensive, as it more or less requires that the contents of the viewport be laid out twice (once to find their intrinsic dimensions.', 'assets/images/penny_lano_field.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `p800booking`
--

CREATE TABLE `p800booking` (
  `id` int(11) NOT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Field_Id` int(11) DEFAULT NULL,
  `Start` datetime NOT NULL DEFAULT current_timestamp(),
  `End` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` tinyint(1) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `Message` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p800booking`
--

INSERT INTO `p800booking` (`id`, `User_Id`, `Field_Id`, `Start`, `End`, `Status`, `Total`, `Message`) VALUES
(1, 2, 1, '2021-07-22 07:00:00', '2021-07-22 08:00:00', 1, 180000, 'aaaaa'),
(31, 2, 1, '2021-08-03 15:01:00', '2021-08-03 17:01:00', 1, 360000, 'qqq'),
(32, 7, 3, '2021-08-08 10:00:43', '2021-08-08 12:00:43', 1, 360000, 'mk'),
(33, 7, 3, '2021-08-08 10:01:00', '2021-08-08 12:01:00', 1, 360000, 'm'),
(34, 2, 3, '2021-08-09 10:35:00', '2021-08-09 12:35:00', 1, 360000, 'z'),
(35, 2, 3, '2021-08-10 11:02:00', '2021-08-10 13:02:00', 0, 360000, 'a'),
(36, 7, 1, '2021-08-09 16:06:56', '2021-08-09 18:06:56', 0, 360000, 'zzz'),
(37, 7, 1, '2021-08-09 16:07:48', '2021-08-09 18:07:48', 0, 360000, ''),
(38, 7, 1, '2021-08-11 16:13:00', '2021-08-11 18:13:00', 0, 360000, 'a'),
(39, 7, 1, '2021-08-10 16:39:00', '2021-08-10 20:39:00', 0, 720000, 'q'),
(40, 7, 1, '2021-08-12 16:39:00', '2021-08-12 19:39:00', 0, 540000, 'q'),
(41, 7, 3, '2021-08-11 16:41:00', '2021-08-11 18:41:00', 0, 360000, 'qqq'),
(42, 7, 3, '2021-08-14 16:41:00', '2021-08-14 20:41:00', 0, 720000, 'qqw'),
(43, 7, 1, '2021-08-18 16:52:00', '2021-08-18 18:52:00', 0, 360000, 'zx'),
(44, 2, 3, '2021-08-12 09:17:00', '2021-08-12 11:17:00', 0, 600000, 'zx'),
(45, 7, 4, '2021-08-12 09:44:29', '2021-08-12 11:44:29', 0, 400000, 'asd'),
(46, 7, 4, '2021-08-13 09:45:00', '2021-08-13 11:45:00', 0, 400000, 'as');

-- --------------------------------------------------------

--
-- Table structure for table `p900imagefield`
--

CREATE TABLE `p900imagefield` (
  `id` int(11) NOT NULL,
  `Field_Id` int(11) DEFAULT NULL,
  `Img_Url` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p900imagefield`
--

INSERT INTO `p900imagefield` (`id`, `Field_Id`, `Img_Url`) VALUES
(1, 1, 'assets/images/josh_field.jpg'),
(2, 1, 'assets/images/images.jpg'),
(5, 3, 'assets/images/lapangan_field.jpeg'),
(6, 3, 'assets/images/straberry_field.jpg'),
(7, 3, 'assets/images/lapangan_field.jpeg'),
(8, 3, 'assets/images/straberry_field.jpg'),
(9, 1, 'assets/images/images (1).jpg'),
(10, 1, 'assets/images/images (1).jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `p000account`
--
ALTER TABLE `p000account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p100menu`
--
ALTER TABLE `p100menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p200role`
--
ALTER TABLE `p200role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p300roledetail`
--
ALTER TABLE `p300roledetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p400admin`
--
ALTER TABLE `p400admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p500user`
--
ALTER TABLE `p500user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p600owner`
--
ALTER TABLE `p600owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p700footbalfield`
--
ALTER TABLE `p700footbalfield`
  ADD PRIMARY KEY (`idField`);

--
-- Indexes for table `p800booking`
--
ALTER TABLE `p800booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p900imagefield`
--
ALTER TABLE `p900imagefield`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `p000account`
--
ALTER TABLE `p000account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `p100menu`
--
ALTER TABLE `p100menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `p200role`
--
ALTER TABLE `p200role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `p300roledetail`
--
ALTER TABLE `p300roledetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `p400admin`
--
ALTER TABLE `p400admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p500user`
--
ALTER TABLE `p500user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `p600owner`
--
ALTER TABLE `p600owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `p700footbalfield`
--
ALTER TABLE `p700footbalfield`
  MODIFY `idField` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `p800booking`
--
ALTER TABLE `p800booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `p900imagefield`
--
ALTER TABLE `p900imagefield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
