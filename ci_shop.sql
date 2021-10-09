-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2021 at 11:42 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(3, 5, '2020-03-24', '520200324223408', 3000000, 'Amir Muhammad Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'waiting'),
(4, 5, '2021-05-27', '520210527104902', 100000, 'membeer', 'pyk', '123456789', 'waiting'),
(5, 5, '2021-05-27', '520210527105313', 100000, 'membeer', 'pyk', '12345', 'waiting'),
(6, 5, '2021-05-27', '520210527105633', 200000, 'Zizi', 'Payakumbuh', '0823 2121 1515', 'paid'),
(7, 8, '2021-06-26', '820210626213048', 200000, 'Latifah Amatullah', 'Kapalo Bukit', '0823239829', 'waiting');

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
(3, 6, 'Zizi', '1111', 200000, '-', '520210527105633-20210527105927.jpeg');

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
(10, 7, 6, 1, 100000);

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
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`, `status`) VALUES
(5, 7, 'ardiwen', 'Ardiwen', 'Keahlian : \r\nPemasangan Batu Bata\r\nPemasangan Loteng\r\nPemasangan Jendela dan Pintu', 100000, 0, 'ardiwen-20210524094238.jpg', 0),
(6, 7, 'amir', 'Amir', 'Keahlian :\r\nPemasangan Keramik\r\nPemasangan Walpaper dinding dan loteng\r\nPembuatan Taman', 100000, 0, 'faisal-20210524094254.jpg', 0),
(7, 8, 'bobi', 'Bobi', 'Keahlian :\r\nPerbaikan meja dan kursi\r\nPerbaikan Kran air\r\nPerbaikan atap', 100000, 1, 'bobi-20210524094500.jpg', 0),
(9, 8, 'alif-surganda', 'Alif Surganda', 'Buat Meja', 120000, 1, '', 0);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$DXtMYuQKqapHlNeDwlKSfuKGhELttJKXysWoNu/y/dccXEues/Ibq', 'member', 1, 'member-20200315232137.png'),
(6, 'Alif', 'alif@gmail.com', '$2y$10$OZ50OkplNweIoHO9vbHMS.yXoEDo9QrrOIgeBqzpFz1CNVs7MOvWu', 'member', 1, NULL),
(7, 'Alif', 'alif@gmail.com', 'admin', 'tukang', 1, NULL),
(8, 'Alif Surganda', 'surgandaalif@gmail.com', '$2y$10$4xGBPW4J7PoJizome62CBOKXDyRgUTLLAwaHG2Q20TbGbgELY3F1e', 'tukang', 1, 'alif-surganda-20210626202930.jpeg'),
(9, 'Latifah Amatullah', 'lamatullah@gmail.com', '$2y$10$Xjj2V1hgnNb2/QOdxMlWse2pzszp4Kf4WXKccvvfzTji9RLYDAwZi', 'member', 1, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
