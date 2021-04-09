-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2021 at 04:40 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafeteria`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `catagory_Id` int(11) NOT NULL,
  `catagory_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catagory_Id`, `catagory_name`) VALUES
(1, 'Hot Drinks'),
(2, 'Cold Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_Id` int(11) NOT NULL,
  `order_action` varchar(50) DEFAULT NULL,
  `order_price` int(11) DEFAULT NULL,
  `user_Id` int(11) DEFAULT NULL,
  `status_Id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_Id`, `order_action`, `order_price`, `user_Id`, `status_Id`, `date`) VALUES
(36, 'Done', 56, 6, 4, '2021-04-09 00:53:22'),
(37, 'Done', 12, 6, 4, '2021-04-09 00:59:51'),
(38, 'Done', 34, 6, 3, '2021-04-09 01:11:15'),
(39, 'Done', 44, 6, 4, '2021-04-09 01:18:25'),
(40, 'Done', 12, 6, 4, '2021-04-09 01:21:58'),
(41, 'Done', 28, 6, 3, '2021-04-09 01:30:48'),
(42, 'Done', 64, 6, 4, '2021-04-09 01:31:37'),
(43, 'Done', 28, 6, 3, '2021-04-09 01:34:37'),
(44, 'Done', 30, 6, 3, '2021-04-09 01:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_Id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_picture` varchar(200) DEFAULT NULL,
  `catagory_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_Id`, `product_name`, `product_price`, `product_picture`, `catagory_Id`) VALUES
(1, 'Tea', 5, 'images/shay.png', 1),
(2, 'Cofe', 8, 'images/cofe.jpg', 1),
(3, 'Helba', 6, 'images/7elba.jpg', 1),
(4, 'Milk', 10, 'images/milk.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_Id` int(11) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_Id`, `status_name`) VALUES
(1, 'Done'),
(2, 'Delivered'),
(3, 'Processing'),
(4, 'cancel');

-- --------------------------------------------------------

--
-- Table structure for table `userorder`
--

CREATE TABLE `userorder` (
  `product_Id` int(11) NOT NULL,
  `order_Id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userorder`
--

INSERT INTO `userorder` (`product_Id`, `order_Id`, `quantity`) VALUES
(1, 36, 2),
(1, 39, 2),
(1, 42, 2),
(2, 36, 3),
(2, 38, 2),
(2, 39, 1),
(2, 41, 1),
(2, 42, 2),
(2, 43, 2),
(3, 36, 2),
(3, 37, 2),
(3, 38, 3),
(3, 39, 1),
(3, 40, 2),
(3, 42, 3),
(3, 43, 2),
(4, 36, 1),
(4, 39, 2),
(4, 41, 2),
(4, 42, 2),
(4, 44, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_profile_picture` varchar(50) DEFAULT NULL,
  `user_phone` int(25) DEFAULT NULL,
  `user_type` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `user_name`, `user_email`, `user_password`, `user_profile_picture`, `user_phone`, `user_type`) VALUES
(1, 'admin', 'admin@admin.com', '25f9e794323b453885f5181f1b624d0b', 'https://randomuser.me/api/portraits/med/men/75.jpg', 1156526691, 'admin'),
(6, 'user', 'user@user.com', '25f9e794323b453885f5181f1b624d0b', 'https://randomuser.me/api/portraits/med/men/75.jpg', 123456789, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`catagory_Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_Id`),
  ADD KEY `FK_order_user` (`user_Id`),
  ADD KEY `FK_order_status` (`status_Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_Id`),
  ADD KEY `Product_Category` (`catagory_Id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_Id`);

--
-- Indexes for table `userorder`
--
ALTER TABLE `userorder`
  ADD PRIMARY KEY (`product_Id`,`order_Id`),
  ADD KEY `FK_userorder_order` (`order_Id`),
  ADD KEY `FK_userorder_product` (`product_Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `catagory_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_order_status` FOREIGN KEY (`status_Id`) REFERENCES `status` (`status_Id`),
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`user_Id`) REFERENCES `users` (`Id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `Product_Category` FOREIGN KEY (`catagory_Id`) REFERENCES `categories` (`catagory_Id`);

--
-- Constraints for table `userorder`
--
ALTER TABLE `userorder`
  ADD CONSTRAINT `FK_userorder_order` FOREIGN KEY (`order_Id`) REFERENCES `orders` (`order_Id`),
  ADD CONSTRAINT `FK_userorder_product` FOREIGN KEY (`product_Id`) REFERENCES `products` (`product_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
