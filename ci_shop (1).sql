-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2021 at 06:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(7, 'tukang-bangunan', 'Tukang Bangunan'),
(8, 'tukang-perabot', 'Tukang Perabot');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 5, '2020-03-18', '520200318210456', 36000000, 'Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'paid'),
(2, 5, '2020-03-19', '520200319181238', 500000, 'Jotaro Kujo', 'Western', '218838383', 'delivered'),
(7, 8, '2021-06-26', '820210626213048', 200000, 'Latifah Amatullah', 'Kapalo Bukit', '0823239829', 'waiting'),
(11, 5, '2021-07-03', '520210703143344', 100000, 'Lusiana Eka Putri', 'Gadut', '082321211515', 'waiting'),
(12, 5, '2021-07-03', '520210703150556', 220000, 'Bobi, Amrullah', 'Payakumbuh', '082321211515', 'delivered'),
(13, 19, '2021-07-06', '1920210706170239', 120000, 'aaaaaaa', 'pyk', '123', 'paid'),
(14, 21, '2021-07-12', '2120210712164457', 120000, 'Rajes', 'Payakumbuh', '12345', 'paid'),
(15, 21, '2021-08-07', '2120210807221516', 100000, 'Bobi', 'Payakumbuh', '08231111111', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Amir', '42424123333', 36000000, '-', '520200318210456-20200319173859.jpg'),
(2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg'),
(3, 6, 'Zizi', '1111', 200000, '-', '520210527105633-20210527105927.jpeg'),
(4, 12, 'Zizi', '12345678', 220000, '-', '520210703150556-20210703151935.jpeg'),
(5, 13, 'Zizi', '1111', 120000, '-', '1920210706170239-20210706170310.jpeg'),
(6, 14, 'Zizi', '12345678', 120000, '-', '2120210712164457-20210712164605.jpeg'),
(7, 15, 'Zizi', '12345678', 100000, '-', '2120210807221516-20210807221706.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000),
(5, 4, 5, 1, 100000),
(6, 5, 5, 1, 100000),
(7, 6, 6, 1, 100000),
(8, 6, 5, 1, 100000),
(9, 7, 5, 1, 100000),
(10, 7, 6, 1, 100000),
(11, 8, 5, 1, 100000),
(12, 8, 9, 1, 120000),
(13, 9, 5, 1, 120000),
(14, 10, 7, 1, 100000),
(15, 11, 7, 1, 100000),
(16, 12, 7, 1, 100000),
(17, 12, 9, 1, 120000),
(18, 13, 5, 1, 120000),
(19, 14, 5, 1, 120000),
(20, 15, 7, 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`, `id_user`) VALUES
(5, 8, 'rajes', 'Rajes', 'Keahlian : \r\nReparasi Sofa, \r\nPerbaikan kunci pintu, \r\nperbaikan kursi\r\n', 120000, 1, 'rajes-20210702091302.jpg', 0),
(6, 7, 'amir', 'Amir', 'Keahlian :\r\nPemasangan Keramik\r\nPemasangan Walpaper dinding dan loteng\r\nPembuatan Taman', 100000, 0, 'faisal-20210524094254.jpg', 0),
(7, 8, 'bobi', 'Bobi', 'Keahlian :\r\nReparasi Sofa\r\nPerbaikan alat elektronik\r\n', 100000, 1, 'bobi-20210702091454.jpg', 0),
(9, 7, 'amrullah', 'Amrullah', 'Buat Meja', 120000, 1, 'amrullah-20210702091123.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

CREATE TABLE `product1` (
  `id_product` int(11) NOT NULL,
  `category` varchar(80) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member','tukang') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$IgGZy1lARp0bgxOFAckOne752zOLXlF1R6pJhViL1goRuv42f1EIq', 'member', 1, 'member-20200315232137.png'),
(18, 'BARRA', 'bara@gmail.com', '$2y$10$r2R4ggvA7cTk4vAfEHm9SeQ.m6aE8wtcXVwcTWtl6rykVV1D56gI2', 'tukang', 1, 'barra-20210706162318.jpg'),
(20, 'Rajes', 'rajes@gmail.com', '$2y$10$CIxyLd9OHoK.h1kqP8ToL.g/RbpndwTTLj.Rw2g/kt6ksM/aV952G', 'tukang', 1, 'rajes-20210712141609.jpg'),
(21, 'Zizi', 'zizi@gmail.com', '$2y$10$Q4.xp/FfoUnKjeez7TftLuspDqy.oG1oQ/2lyUzLLwK3lv4kDS6ZK', 'member', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product1`
--
ALTER TABLE `product1`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product1`
--
ALTER TABLE `product1`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
