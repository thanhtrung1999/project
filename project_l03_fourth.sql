-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 17, 2020 lúc 06:27 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project_l03_fourth`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Tên hãng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Asus'),
(2, 'Dell'),
(3, 'Acer'),
(4, 'Lenovo'),
(5, 'IPhone'),
(6, 'Samsung'),
(7, 'Vsmart'),
(8, 'Realme'),
(9, 'oppo'),
(10, 'HDD'),
(11, 'SSD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '1596733758-laptop.jpg', '', 1, '2020-08-02 14:05:46', '2020-08-07 00:09:18'),
(2, 'Điện thoại', '1596733768-iphone11.webp', '', 1, '2020-08-03 09:59:06', '2020-08-07 00:09:28'),
(3, 'Ổ cứng', '1596733899-o-cung.jpg', '', 1, '2020-08-05 18:47:26', '2020-08-12 12:43:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `address`, `phone_number`, `email`) VALUES
(3, 'Nguyễn Thành Trung', 'Thường Tín', '0968824797', 'darkprince411999@gmail.com'),
(4, 'BTP', 'Hải Phòng', '0987654321', 'darkprince411999@gmail.com'),
(7, 'Thành Trung', 'Hà Đông', '0968824797', 'darkprince411999@gmail.com'),
(8, 'Thành Trung', 'Hà Đông', '0968824797', 'darkprince411999@gmail.com'),
(9, 'Nguyễn Thành Trung', 'Hà Đông, Hà Nội', '0968824797', 'darkprince411999@gmail.com'),
(10, 'Thành Trung', '134 Đa Sỹ, Hà Đông, Hà Nội', '0968824797', 'darkprince411999@gmail.com'),
(11, 'Bùi Thu Phương', 'Hải Phòng', '0344139959', 'darkprince411999@gmail.com'),
(12, 'NTTrung', '134 Đa Sỹ, Hà Đông, Hà Nội', '0968824797', 'darkprince411999@gmail.com'),
(13, 'Ng Thành Trung', 'Thường Tín', '0968824797', 'darkprince411999@gmail.com'),
(14, 'Ng Thành Trung', 'Thường Tín', '0968824797', 'darkprince411999@gmail.com'),
(15, 'Ng Thành Trung', 'Thường Tín', '0968824797', 'darkprince411999@gmail.com'),
(16, 'Ng Thành Trung', 'Hà Đông, Hà Nội', '0968824797', 'darkprince411999@gmail.com'),
(17, 'Trung', '134 Đa Sỹ, Hà Đông, Hà Nội', '0968824797', 'darkprince411999@gmail.com'),
(18, 'Ng Thành Trung', 'Hà Đông', '0968824797', 'darkprince411999@gmail.com'),
(19, 'Trung Thành Nguyễn', 'Nguyễn Trãi, Thường Tín', '0968824797', 'darkprince411999@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `jobs` varchar(255) DEFAULT NULL,
  `level` tinyint(3) NOT NULL DEFAULT 1,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `managers`
--

INSERT INTO `managers` (`id`, `username`, `password`, `fullname`, `avatar`, `jobs`, `level`, `phone_number`, `address`, `email`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$xYR4QoTa2NeSl1UTJ.ZW..bvvdFrpY9/QT0.0UpGC1UobGgoVZ7T6', 'admin', NULL, 'admin', 3, '0963113613', 'admin', 'admin99887766@gmail.com', '2020-08-02 07:45:30', NULL),
(2, 'thanhtrung', '$2y$10$jrwByrU2rR306065yPAUWuDwSvbQtn2NQzU6vMeclmZFMwLkFM.86', 'Nguyễn Thành Trung', '1597488478-manager-91795304_2546207752374021_1440680954774421504_n.jpg', 'Web Dev', 1, '0968824797', 'Thường Tín', 'darkprince411999@gmail.com', '2020-08-06 04:28:21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `members`
--

INSERT INTO `members` (`id`, `username`, `password`, `fullname`, `avatar`, `phone_number`, `address`, `email`, `created_at`, `updated_at`) VALUES
(3, 'buithuphuong', '$2y$10$dFZFn06euZ07LumoNH1Gf.eMeWXE1M.aqdjn2w5AZ07e4WroOcLg.', 'Bùi Thu Phương', NULL, '0987654321', 'Hải Phòng', '', '2020-08-06 09:28:10', NULL),
(4, 'customer', '$2y$10$qHVBz84rYOzuYOw9.eYikerPB8UvwKhSD.gHrYsn/Ft1rEPrBJrom', 'abc', NULL, '0968824797', 'Thường Tín', 'darkprince411999@gmail.com', '2020-08-15 17:25:54', NULL),
(5, 'trung', '$2y$10$2nSglIGjrd0gqeTXuR4qS.7jYPNM/jpla3LO30AyACaSTzK1/TUwi', 'Trung', NULL, '0968824797', '', 'abc@gmail.com', '2020-08-15 17:33:12', NULL),
(6, 'thanhtrung1999', '$2y$10$fc9VebIejQZwq9/wXt6vLuw/eFX5.Lt3TZN7lz5iWCPe9Nx1hdIyi', 'Thành Trung', NULL, '0968824797', '', 'abc@gmail.com', '2020-08-15 17:34:24', NULL),
(7, 'thanhtrung', '$2y$10$jzxbCa7.5A7OTbZgHT12F.OWh4FHAJA2qgZF5xkPrGdLnj31naWpK', 'Trung Thành Nguyễn', NULL, '0968824797', '134 Đa Sỹ, Hà Đông, Hà Nội', 'darkprince411999@gmail.com', '2020-08-16 01:17:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'Id của khách hàng(ko phải là thành viên của shop), là khóa ngoại liên kết với bảng customers',
  `member_id` int(11) DEFAULT NULL COMMENT 'Id của thành viên đã đăng ký tài khoản, là khóa khoại liên kết đến bảng members',
  `price_total` int(11) NOT NULL COMMENT 'Tổng giá trị đơn hàng',
  `order_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Trạng thái đơn hàng: 0-Chưa xử lý, 1-Đã xứ lý',
  `note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú thêm của khách hàng',
  `payment_methods` varchar(255) NOT NULL DEFAULT 'cod',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `member_id`, `price_total`, `order_status`, `note`, `payment_methods`, `created_at`, `updated_at`) VALUES
(4, 4, NULL, 79940000, 1, '', 'cod', '2020-08-11 14:58:20', '2020-08-15 01:03:43'),
(7, 7, NULL, 52560000, 0, '134 Đa Sỹ, phường Kiến Hưng, Hà Đông, Hà Nội\r\nNhận hàng từ 10h sáng - 5h chiều', 'cod', '2020-08-11 16:22:48', NULL),
(8, 8, NULL, 40970000, 1, '', 'cod', '2020-08-11 17:35:33', '2020-08-15 01:02:41'),
(9, 9, NULL, 203350000, 0, '', 'cod', '2020-08-11 18:16:26', NULL),
(10, 10, NULL, 116730000, 0, '', 'cod', '2020-08-11 18:26:22', NULL),
(11, 11, NULL, 124880000, 0, '', 'cod', '2020-08-11 18:38:25', NULL),
(12, 12, NULL, 46970000, 0, '', 'cod', '2020-08-12 05:28:11', NULL),
(13, 13, NULL, 0, 0, '', 'cod', '2020-08-14 08:03:00', NULL),
(14, 14, NULL, 0, 0, '', 'cod', '2020-08-14 08:19:09', NULL),
(15, 15, NULL, 0, 0, '', 'cod', '2020-08-14 08:28:02', NULL),
(16, 16, NULL, 54480000, 0, '', 'cod', '2020-08-15 06:49:25', NULL),
(17, 17, NULL, 33020000, 0, 'Giao hàng nhanh nhất có thể', 'cod', '2020-08-15 06:56:04', NULL),
(18, 18, NULL, 35570000, 0, '', 'cod', '2020-08-15 17:21:50', NULL),
(19, 19, NULL, 20380000, 0, 'nhận hàng vào 4h chiều', 'cod', '2020-08-15 19:14:08', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Khóa ngoại liên kết với bảng orders',
  `product_id` int(11) DEFAULT NULL COMMENT 'Khóa ngoại liên kết với bảng products, là những sản phẩm khách hàng đặt',
  `variant_value_id` int(11) DEFAULT NULL COMMENT 'Khóa ngoại liên kết với bảng variants_value, là những tùy chọn của khách hàng khi đặt hàng (gồm color và size)',
  `amount` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm khách hàng đặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`order_id`, `product_id`, `variant_value_id`, `amount`) VALUES
(4, 40, 2, 1),
(4, 110, 18, 1),
(4, 119, 18, 1),
(4, 100, 2, 2),
(4, 100, 12, 1),
(4, 86, 12, 1),
(4, 95, 12, 1),
(7, 30, 2, 1),
(7, 107, 2, 1),
(7, 131, 18, 2),
(8, 12, 1, 1),
(8, 123, 4, 2),
(9, 113, 14, 1),
(9, 105, 12, 2),
(9, 116, 2, 1),
(9, 116, 18, 1),
(9, 58, 2, 1),
(9, 65, 2, 1),
(9, 12, 1, 1),
(10, 105, 12, 2),
(10, 65, 2, 1),
(10, 76, 2, 1),
(10, 130, 2, 2),
(10, 116, 18, 2),
(11, 113, 14, 1),
(11, 99, 2, 2),
(11, 42, 2, 1),
(11, 120, 11, 1),
(12, 35, 12, 1),
(12, 133, 12, 1),
(12, 104, 2, 1),
(16, 96, 2, 1),
(16, 88, 2, 2),
(16, 69, 1, 1),
(16, 119, 18, 1),
(17, 22, 2, 1),
(17, 101, 2, 2),
(17, 93, 2, 1),
(18, 30, 2, 1),
(18, 133, 12, 2),
(19, 2, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories	',
  `brand_id` int(11) NOT NULL COMMENT 'Id của hãng mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng brands',
  `name` varchar(255) NOT NULL COMMENT 'Tên sản phẩm	',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `description` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm	',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `avatar`, `price`, `summary`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'DELL INSPIRON 15 5584 CXGR01 (I58265-8-1TB-ON-W10)', '1596377898-product-636964445359117853_Mo-ta-san-pham-dell-inspiron-5584-1.jpg', 12590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-1095822</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. Dell Inspiron 5584 - Bolt15 N5I5384W - CPU: Intel Core i5 8265U (1.60 upto 3.9GHz, 6MB) - RAM: 8GB DDR4 2400MHz - HDD: 1TB + 1 khe SSD M.2 sata 2280 - VGA: Intel UHD Graphics 620 - Display: 15.6&quot; FHD (1920 x 1080) - OS: Windows 10 Home - Color: Silver Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-02 14:11:36', '2020-08-02 22:29:58'),
(2, 1, 2, 'DELL VOSTRO 3490 70211829 (I310110U-4-256SSD-ON-W10) ', '1596377875-product-dell-vostro-3480-i3-8145u-4gb-1tb-14-win10-701837-6-1-600x600-e6343c03ea7b42ecabc42b95ef4ca1ba-master-67701-zoom.jpg', 10190000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-75311</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam Dell Vostro 3490 70211829 - CPU: Intel&reg; Core&trade; i3-10110U (2.10 GHz upto 4.10 GHz, 4MB) - RAM: 4GB (4GBx1) DDR4 2666MHz ( 2 Khe) - Ổ cứng: 256GB SSD M.2 PCIe NVMe + 1 slot 2.5&quot; (HDD/SSD) - VGA: Intel&reg; UHD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920 x 1080) - OS: Windows 10 Home - Pin: 3-Cell, 42 WHr - C&acirc;n nặng: 1.72 Kg - T&iacute;nh năng: Bảo mật v&acirc;n tay Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-02 14:17:55', '2020-08-02 22:30:15'),
(3, 1, 2, 'DELL INSPIRON 3581A P75F005N81A (I37020-4-1TB-ON-W10) ', '1596378119-product-16344-dell-vostro-3581a-p75f005n81a-1.jpg', 9390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>Kho:&nbsp;</strong>C&ograve;n h&agrave;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-734121</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. - CPU : Intel&reg; Core i3-7020U 2.3Ghz, 3MB - RAM : 4GB - HDD : 1TB HDD - VGA : Intel HD Graphics - M&agrave;n h&igrave;nh : 15.6&quot; Full HD WLED - OS : Windows 10 - Color: Silver Made in China. Brand New 100%</p>\r\n', 1, '2020-08-02 14:20:16', '2020-08-03 16:42:29'),
(4, 1, 2, 'DELL INSPIRON 3493 N4I5122W (I51035G1-8-256SSD-ON-W10)', '1596378340-product-17853_Mo-ta-san-pham-dell-inspiron-5584-1.jpg', 1390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-1034233</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i5-1035G1 (1.00 GHz upto 3.60 GHz, 6MB) - RAM: 8GB DDR4 - Ổ cứng: 256GB SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 14&quot; FHD (1920*1080) - OS: Windows 10 - Color: Black - Pin: 3 cell - 42Whr - C&acirc;n nặng: 1.8 kg Made in China. Brannew 100%</p>\r\n', 1, '2020-08-02 14:25:40', '2020-08-02 22:32:56'),
(5, 1, 2, 'DELL XPS 13 7390 70197462 (I510210-8-256SSD-W10)', '1596378462-product-may-tinh.jpg', 28900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>Ph&acirc;n phối ch&iacute;nh h&atilde;ng Dell Việt nam: - CPU: Intel&reg; Core&trade; i5-10210U (1.60 GHz upto 4.20GHz, 6MB) - RAM: 8GB DDR4 - Ổ cứng: 256GB SSD - VGA: Intel&reg; UHD Graphics - M&agrave;n h&igrave;nh: 13.3&quot; FHD (1920*1080) - OS: Windows 10 Home + Office 365 - Pin: 4 Cell 52WHr - C&acirc;n nặng: 1.37kg - T&iacute;nh năng: Bảo mật v&acirc;n tay,&hellip;</p>\r\n', 1, '2020-08-02 14:27:42', '2020-08-02 22:32:31'),
(6, 1, 2, 'DELL VOSTRO 3580 V5I3058W (I38145-4-1TB-ON-W10)', '1596378561-product-dell-vostro-3580-i5-8265u-4gb-1tb-2gb-amd520-win10-15-600x600.jpg', 10590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-878122</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam Dell Vostro 15 3580 - CPU: Intel&reg; Core&trade; i3-8145U (4MB Cache, up to 3.9 GHz) - RAM: 4GB DDR4 2666MHz - HDD: 1TB HDD 5400rpm - VGA: Intel&reg; UHD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 - Color: Black -Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-02 14:29:21', '2020-08-02 22:33:57'),
(7, 1, 2, 'DELL INSPIRON 3593 70205744 (I51035G1-4-256GB-NVI-W10)', '1596378672-product-22451_7544.jpg', 13790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-583111</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i5-1035G1 (1.00 GHz upto 3.60 GHz, 6MB) - RAM: 4GB DDR4 - Ổ cứng: 256GB SSD - VGA: Nvidia GeForce MX230 2GB GDDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 - Color: Black - Pin: 3 cell - 42Whr - C&acirc;n nặng: 1.8 kg Made in China. Brannew 100%</p>\r\n', 1, '2020-08-02 14:31:12', '2020-08-02 22:34:12'),
(8, 1, 2, 'DELL VOSTRO 5490 V4I5106W (I510210-8-256SSD-ON-W10)', '1597478927-product-unnamed.jpg', 16900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i5-10210U (1.60GHz upto 4.20GHz, 6MB) - RAM: 8GB DDR4 2466MHz - Ổ cứng: 256GB M.2 PCIe NVMe SSD - VGA: Intel UHD Graphics 620 - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920x1080) - OS: Windows10 Home Plus SL - Pin: 3 cell 51 Wh - C&acirc;n nặng: 1.49kg - T&iacute;nh năng: Bảo mật v&acirc;n tay Made in China, Brannew 100%</p>\r\n', 1, '2020-08-02 14:32:30', '2020-08-15 15:08:47'),
(9, 1, 2, 'DELL INSPIRON 3493 N4I7131W (I71065G7-8-512SSD-NVI-W10) ', '1596379010-product-244a2fa27f1d1b3cadef2cb736d78a81.jpg', 19990000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>Kho:&nbsp;</strong>C&ograve;n h&agrave;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-1034231</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i7-1065G7 (1.30 GHz upto 3.90 GHz, 8MB) - RAM: 8GB DDR4 - Ổ cứng: 512GB SSD - VGA: NVIDIA(R)GeForce(R) MX230 wit h 2GB GDDR5 - M&agrave;n h&igrave;nh: 14&quot; FHD (1920*1080) - OS: Windows 10 - Color: Silver - Pin: 3 cell - 42Whr - C&acirc;n nặng: 1.8 kg Made in China. Brannew 100%</p>\r\n', 1, '2020-08-02 14:36:50', '2020-08-15 17:41:40'),
(10, 1, 2, 'DELL INSPIRON 5391 N3I3001W (I310110-4-128SSD-ON-W10)', '1596379195-product-unnamed.jpg', 14300000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam - CPU: Intel&reg; Core&trade; i3-10110U (2.10 GHz upto 4.10 GHz, 4MB) - RAM: 4GB onboard LPDDR3 2133MHz ( kh&ocirc;ng n&acirc;ng cấp được Ram) - Ổ cứng: 128GB PCIe&reg; NVMe&trade; M.2 SSD - VGA: Intel&reg; UHD Graphics - M&agrave;n h&igrave;nh: 13.3-inch FHD (1920 x 1080) TrueLife LED Backlight - OS: Windows 10 Home Single Language English Made in China. Brand New 100%.&nbsp;</p>\r\n', 1, '2020-08-02 14:39:55', '2020-08-02 22:35:34'),
(11, 1, 2, 'DELL INSPIRON 3493 WTW3M2 (I31005G1-4-256SSD-ON-W10) ', '1596379384-product-600ea10fcc24b8e8d0de7c1bb67b8c26.jpg', 10190000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-7341123</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i3-1005G1(1.2Ghz, Up to 3.4Ghz) - RAM: 4GB DDR4 - Ổ cứng: 256GB SSD - VGA: Intel&reg; UHD Graphics - M&agrave;n h&igrave;nh: 14&quot; FHD (1920*1080) - OS: Windows 10 - Color: Silver - Pin: 3 cell - 42Whr - C&acirc;n nặng: 1.8 kg Made in China. Brannew 100%</p>\r\n', 1, '2020-08-02 14:43:04', '2020-08-02 22:35:58'),
(12, 1, 2, 'DELL INSPIRON 14 7490 6RKVN1 (I710510-16-512SSD-NVI-W10)', '1596379503-product-ygozdzqkwjdnv.jpg', 32590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-815466</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. - CPU: Intel&reg; Core&trade; i7-10510U (1.80GHz upto 4.90GHz, 8MB) - RAM: 16GB onboard LPDDR3 2133MHz - HDD: 512GB M.2 PCIe NVMe SSD - VGA: Nvidia MX250 2GB DDR5 - M&agrave;n h&igrave;nh: 14.0-inch FHD (1920x1080) True Life 300nits 100%sRG B Wide Viewing - Angle LED-Backl it Display - OS: Window 10 Home - Pin: 4Cell, 52Whr - C&acirc;n nặng: 1.4kg - T&iacute;nh năng: Đ&egrave;n nền b&agrave;n ph&iacute;m Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-02 14:45:03', '2020-08-02 22:36:18'),
(13, 1, 2, 'DELL INSPIRON 3481 030CX2 (I37020-4-1TB-ON-W10)', '1596379623-product-unnamed.png', 9390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam Dell Inspiron 14 3481 030CX2 - Black - CPU: Intel&reg; Core&trade; i3-7020U (2.30GHz, 3MB) - RAM: 4GB DDR4 2666MHz - HDD: 1TB 5400 rpm - VGA: Đồ họa HD Intel&reg; 620 - M&agrave;n h&igrave;nh: 14.0&quot; HD (1366 x 768) - OS: Windows 10 SL -Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-02 14:47:03', '2020-08-02 22:36:35'),
(14, 1, 2, 'DELL INSPIRON G5 5590 4F4Y43 (I79750-8-256SSD-1TB-NVI-W10)', '1596379756-product-5nx4f36cxsgq4.jpg', 34890000, '', '<p>H&agrave;ng ph&acirc;n phối ch&iacute;nh h&atilde;ng Dell Việt nam:<br />\r\n- CPU: Intel&reg; Core&trade; i7-9750H (2.60 GHz upto 4.50 GHz, 12MB)<br />\r\n- RAM: 8GB DDR4<br />\r\n- Ổ cứng: 256GB SSD + HDD 1TB 5400rpm<br />\r\n- VGA: nVidia Geforce GTX1650 4GB GDDR5<br />\r\n- M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) IPS 144Hz<br />\r\n- OS: Windows 10 SL<br />\r\n- Pin: 4 cell<br />\r\n- T&iacute;nh năng: Bảo mật v&acirc;n tay, LED_KB<br />\r\nMade in China, Brand new 100%</p>\r\n', 1, '2020-08-02 14:49:16', '2020-08-02 22:36:59'),
(15, 1, 2, 'DELL INSPIRON 5491 C1JW81 (I710510-8-512SSD-NVI-W10) ', '1596380121-product-download.jpg', 22900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-1034105</p>\r\n\r\n<p>Ph&acirc;n phối Dell Ch&iacute;nh h&atilde;ng Việt Nam: - CPU: Intel&reg; Core&trade; i7-10510U (1.80 GHz upto 4.90 GHz, 8MB) - RAM: 8GB DDR4 - Ổ cứng: 512GB SSD - VGA: NVIDIA GeForce MX230 2GB - M&agrave;n h&igrave;nh: 14&quot; FHD (1920*1080) touch - xoay 360 - OS: Windows 10 Home Made in China, Brannew 100%</p>\r\n', 1, '2020-08-02 14:51:17', '2020-08-02 22:37:18'),
(16, 1, 4, 'LENOVO IDEAPAD S145-15IIL (81W80021VN)', '1596442864-product-dowsdfdsfnload.jpg', 13900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1251-004-455533</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: Intel Core i5-1035G1 1.0GHz, 6MB - RAM: 4GB DDR4 + 1slot - Ổ cứng: 512GB SSD M.2 2242 NVMe - VGA: Intel&reg; UHD Graphics - M&agrave;n h&igrave;nh: 15.6 FHD (1920x1080) - OS: Windows 10 Home - Pin: 2Cell, 35WH - C&acirc;n nặng: 1.85kg Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:21:04', NULL),
(17, 1, 4, 'LENOVO IDEAPAD S145-15API (81UT00FWVN)', '1596656000-product-downsdfdfload.jpg', 9900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1251-004-455510</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: AMD Ryzen&trade; 3 3200U (2.60Ghz upto 3.50Ghz, 4MB) - RAM: 4GB DDR4 + 1slot - Ổ cứng: 256GB SSD M.2 2242 NVMe - VGA: Radeon&trade; Vega 3 Graphics - M&agrave;n h&igrave;nh: 15.6 FHD (1920x1080) - OS: Windows 10 Home - Pin: 2Cell, 35WH - C&acirc;n nặng: 1.85kg Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:22:21', '2020-08-06 02:33:20'),
(18, 1, 4, 'LENOVO IDEAPAD 320-15IKB (81BG00LEVN)', '1596443018-product-3108f59e36b1803d8bf48ff600822982.jpg', 10590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1251-004-431212</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: Intel Core i5-8250 - M&agrave;n h&igrave;nh: 15.6&quot;FHD - RAM: 4GB DDR4 2133MHz - Đồ họa: Intel HD Graphics 620 - Lưu trữ: 256GB SSD - Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</p>\r\n', 1, '2020-08-03 08:23:38', '2020-08-03 16:49:09'),
(19, 1, 4, 'LENOVO IDEAPAD 320-14ISK (80XG0083VN)', '1596443089-product-7d3a6536bd099b52e163f392fbf23eb5.jpg', 7390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1251-004-431211</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: Intel Core i3-6006U ( 2.0 GHz / 3MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng ) - M&agrave;n h&igrave;nh: 14&quot; ( 1366 x 768 ) , - RAM: 4GB DDR4 2133MHz - Đồ họa: Intel HD Graphics 520 - Lưu trữ: 500GB HDD 5400RPM - Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit - Pin: 2 cell 30 Wh Pin liền , khối lượng: 2.1 kg</p>\r\n', 1, '2020-08-03 08:24:49', NULL),
(20, 1, 4, 'LAPTOP LENOVO IDEAPAD 130 14IBY', '1596443213-product-asfasdf.jpg', 3790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1251-004-433411</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: Intel&reg; N2840 - RAM: 4GB - Ổ cứng: 500GB HDD (Đổi SSD120 gi&aacute;: 4190K) - VGA: Intel&reg; HD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; HD (1366 x 768) - OS: Windows 7</p>\r\n', 1, '2020-08-03 08:26:53', NULL),
(21, 1, 4, 'LENOVO THINKBOOK 14-IML (20RV00AGVN)', '1596443503-product-37641_thinkbook_14_iml_ha1.jpg', 14990000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-004-185411</p>\r\n\r\n<p>H&agrave;ng Ch&iacute;nh H&atilde;ng Lenovo Việt Nam: Lenovo ThinkBook 14-IML (20RV00AGVN) - X&aacute;m - CPU: Intel&reg; Core&trade; i5-10210U (1.60GHz, 6MB) - RAM: 8GB DDR4 - HDD: 512GB SSD - VGA: Intel&reg; UHD Graphics - Display: 14.0&quot; FHD (1920x1080) - Windows 10 Made in China, Brannew 100%</p>\r\n', 1, '2020-08-03 08:31:43', NULL),
(22, 1, 4, 'LENOVO IDEAPAD S145-15IWL (81MV00F3VN)', '1596444159-product-244a2fa27f1d1b3cadef2cb736d78a81.jpg', 6390000, '', '<p><br />\r\nBảo h&agrave;nh: 12 Th&aacute;ng</p>\r\n\r\n<p>SKU: 0</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam.<br />\r\n- CPU: Intel&reg; Core&trade; Pentium Gold 5405U (2M Cache, 2.30 GHz)<br />\r\n- RAM: 4GB DDR4<br />\r\n- SSD: 256GB<br />\r\n- VGA: Intel HD Graphics<br />\r\n- Display: 15.6Inch FHD<br />\r\n- Pin: 2Cell 30WH<br />\r\n- Color: Grey (X&aacute;m)<br />\r\n- HĐH: Windows 10 Home<br />\r\nBrand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:35:42', '2020-08-03 16:50:32'),
(23, 1, 4, 'LENOVO THINKPAD EDGE E590 (20NBS07000 )', '1596443891-product-unnamed (1).jpg', 15800000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-004-185410</p>\r\n\r\n<p>H&agrave;ng Ch&iacute;nh H&atilde;ng Lenovo Việt Nam: Lenovo ThinkPad E590 20NBS07000 - Đen - CPU: Intel&reg; Core&trade; i5-8265U (1.60 upto 3.90GHz, 6MB) - RAM: 4GB DDR4 - HDD: 1TB 5400rpm - VGA: Intel&reg; UHD Graphics 620 - Display: 15.6&quot; HD (1366 x 768) Anti-GlareOS - Free DOS Made in China, Brannew 100%</p>\r\n', 1, '2020-08-03 08:38:11', '2020-08-03 16:54:15'),
(24, 1, 4, 'LENOVO IDEAPAD 130 14IKB (81H60017VN)', '1596443993-product-lenovo-ideapad-130-14ikb-81h60017vn-ava-600x600.jpg', 7900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-004-825444</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Lenovo Việt Nam. - CPU: Intel&reg; Core&trade; i3-7020U (2.30GHz) - RAM: 4GB DDR4 - Ổ cứng: HDD 1TB - VGA: Intel&reg; HD Graphics 620 - M&agrave;n h&igrave;nh: 14.0&quot; HD (1366 x 768) - OS: Windows 10 SL Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:39:53', '2020-08-07 23:54:25'),
(25, 1, 4, 'LENOVO LEGION Y530-15ICH 81FV00SUVN', '1596444106-product-14466-1.jpg', 21590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:</strong></p>\r\n\r\n<p>Lenovo Legion Y530-15ICH 81FV00SUVN - CPU: Intel&reg; Core&trade; i7-8750H (2.20GHz upto 4.10GHz, 9MB) - RAM: 8GB DDR4 - HDD: 1TB HDD + 128GB SSD M.2 PCIe 7200rpm - VGA: nVidia Geforce GTX 1050 4GB - M&agrave;n h&igrave;nh: 15.6&quot; Full HD (1920 x 1080) IPS - OS: Free-DOS - Color: Black Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:41:46', NULL),
(26, 1, 1, 'ASUS X509FA-EJ857T', '1596444294-product-downsdfdfload.jpg', 9900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-854177</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus X509FA-EJ857T - Bạc - CPU: Intel&reg; Core&trade; i3-8145U (2.1 upto 3.90GHz, 6MB) - RAM: 4GB DDR4 Onboard - HDD: 512GB SSD - VGA: Intel&reg; UHD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) 60Hz Anti-Glare Panel - OS: Windows 10 Home</p>\r\n', 1, '2020-08-03 08:44:54', '2020-08-03 16:55:17'),
(27, 1, 1, 'ASUS TUF FX505GE-BQ052T', '1596444416-product-dsfsadfasf.jpg', 17590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-934192</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus TUF FX505GE-BQ052T - CPU: Intel&reg; Core&trade; i5-8300H (2.30GHz upto 4.00GHz, 4 nh&acirc;n, 8 luồng, 8MB) - RAM: 8GB DDR4 2666MHz (C&ograve;n 1 khe) - HDD: 1TB 5400rpm SSH8GB - VGA: NVIDIA GeForce GTX 1050Ti 4GB GDDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920 x 1080) - OS: Windows 10 - Pin: 4Cell 48WHr - C&acirc;n nặng: 2.2 kg - T&iacute;nh năng: Đ&egrave;n nền b&agrave;n ph&iacute;m Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:46:56', NULL),
(28, 1, 1, 'ASUS S530FN-BQ134T', '1596444480-product-sdfsdf.jpg', 14290000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-815458</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus VivoBook S530FN-BQ134T - Vỏ nh&ocirc;m X&aacute;m - CPU: Intel&reg; Core&trade; i5-8265U (1.60GHz upto 3.90GHz, 4 nh&acirc;n, 8 luồng, 6MB) - RAM: 4GB DDR4 2400MHz - HDD: 512GB SSD - VGA: nVidia GeForce MX150 2GB DDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920 x 1080) - OS: Windows 10 SL - Pin: 3 Cells 42WHrs - C&acirc;n nặng: 1.8kg - T&iacute;nh năng: Bảo mật v&acirc;n tay Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:48:00', '2020-08-03 16:55:58'),
(29, 1, 1, 'ASUS A512FA-EJ1734T', '1596444545-product-downloasdafbsajdfgsf.jpg', 15900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-8341599</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối: - CPU: Intel&reg; Core&trade; i5-10210U (1.6 upto 3.90GHz, 2 nh&acirc;n 4 luồng, 4MB) - RAM: 8GB DDR4 2400MHz - ổ cứng: 512GB SSD - VGA: Intel&reg; UHD Graphics - Display: 15.6&quot; FHD (1920x1080) LED - OS: Windows 10 64bit - Color: SILVER Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:49:05', NULL),
(30, 1, 1, 'ASUS UX481FL-BM048T', '1596444605-product-637076189104697934_asus-zenbook-duo-ux481-xanh-1.png', 29590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-835811</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối - CPU: Intel&reg; Core&trade; i5-10210U (1.6 upto 4.2GHz, 4 nh&acirc;n 8 luồng, 6MB) - RAM: 8GB 2133MHz LPDDR3 Onboard - Ổ cứng: 512GB PCIe SSD - VGA: NVIDIA GeForce MX250 2GB GDDR5 - M&agrave;n h&igrave;nh: 14.0&quot; Full HD (1920 x 1080) - OS: Windows 10 SL - Pin: 4-cell 70Whr - C&acirc;n nặng: 1.5kg - T&iacute;nh năng: ScreenPad Plus - M&agrave;n h&igrave;nh cảm ứng FHD 12.6&quot; Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:50:05', NULL),
(31, 1, 1, 'ASUS UX333FA-A4184T', '1596444682-product-sdasfasf.jpg', 18590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834211</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus UX333FA-A4184T - CPU: Intel&reg; Core&trade; i5-8265U (1.60 upto 3.90GHz, 4 nh&acirc;n 8 luồng, 6MB) - RAM: 8GB 2133MHz LPDDR3 - HDD: 256GB SSD PCIe - VGA: Intel&reg; UHD Graphics 620 - Display: 13.3&quot; LED-backlit FHD (1920 x 1080) - OS: Windows 10 SL - Color: Red Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 08:51:22', '2020-08-03 16:56:59'),
(32, 1, 1, 'ASUS S533FA BQ026T', '1596444747-product-gdhg.jpg', 18790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834304</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S533FA BQ026T - Trắng - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:52:27', NULL),
(33, 1, 1, 'ASUS S533FA BQ025T', '1596444820-product-sfagagagardf.jpg', 18790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834305</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S533FA BQ025T - Xanh - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:53:40', NULL),
(34, 1, 1, 'ASUS S533FA BQ011T', '1596444904-product-asdfsafasdf.jpg', 18790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834306</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S533FA BQ011T - Đen - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:55:04', NULL),
(35, 1, 1, 'ASUS S433FA EB054T', '1596444991-product-sdsdfsdfadsads.jpg', 18490000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834300</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S433FA EB054T - Đỏ - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL</p>\r\n', 1, '2020-08-03 08:56:31', NULL),
(36, 1, 1, 'ASUS S433FA EB053T', '1596445050-product-244a2fa27f1d1b3cadef2cb736d78a81.jpg', 18490000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834301</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S433FA EB053T - Đen - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:57:30', NULL),
(37, 1, 1, 'ASUS S433FA EB052T', '1596445131-product-jsadfjsjfjasjsaho.jpg', 18790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834302</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus S433FA EB052T - Trắng - CPU: Intel&reg; Core&trade; i5-10210U Processor (6MB Cache, Up to 4.20GHz) - RAM: 8GB DDR4 2666Mhz - HDD: 512G-PCIE SSD - VGA: Intel UHD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920 x 1080) Anti Glare - OS: Windows 10 SL Made in China. Brand New 100%</p>\r\n', 1, '2020-08-03 08:58:51', NULL),
(38, 1, 1, 'ASUS X409FA-EK098T', '1596445180-product-gdhg.jpg', 8900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-8341200</p>\r\n\r\n<p>Ph&acirc;n phối Asus Việt Nam: Asus X409FA-EK098T - Gray - CPU: Intel&reg; Core&trade; i3-8145U Processor (4MB Cache, upto 3.90GHz) - RAM: 4GB DDR4 2400MHz onboard - HDD: 1TB SATA3 5400rpm - VGA: Đồ họa UHD Intel&reg; 510 - Display: 14.0&quot; (16:9) LED-backlit FHD (1920x1080) 60Hz - OS: Windows 10 Home Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-03 08:59:40', NULL),
(39, 1, 1, 'ASUS X507UF-EJ117T', '1596445246-product-fasifiuashf.jpg', 8900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834214</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Asus Việt Nam. Asus X507UF-EJ117T - Gold - CPU : Intel&reg; Core&trade; i3 8130U (2.20GHz upto 3.40 GHz, 4MB) - RAM : 4GB 2400MHz DDR4 - HDD : 1TB 5400RPM SATA HDD - VGA : NVIDIA GeForce MX130 2GB GDDR5 VRAM - M&agrave;n h&igrave;nh : 15.6&quot; (16:9) FHD (1920x1080) 60Hz - OS : Windows 10 - Pin : 3 Cell 33 Whrs - C&acirc;n nặng : 1.68 kg Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:00:46', NULL),
(40, 1, 1, 'ASUS TUF FX505GE-BQ308T', '1596445324-product-dsfsadfasf.jpg', 19790000, '', '<p><br />\r\nBảo h&agrave;nh: 24 Th&aacute;ng</p>\r\n\r\n<p>SKU: 1151-005-834201</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối<br />\r\nAsus TUF FX505GE-BQ308T<br />\r\n- CPU: Intel&reg; Core&trade; i7 8750H (2.2GHz, 9MB)<br />\r\n- RAM: 8GB DDR4 2666MHz<br />\r\n- HDD: 1TB 5400rpm + 128G PCIE<br />\r\n- VGA: NVIDIA Geforce GTX1050Ti 4GB DDR5<br />\r\n- Display: 15.6&quot; FHD (1920*1080) 144Hz IPS<br />\r\n- OS: Windows 10 SL<br />\r\n- Color: Black<br />\r\nBrand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:02:04', NULL),
(41, 1, 1, 'ASUS D509DA-EJ167T', '1596445394-product-asus-d509da-ej167t-r5-3500u_1_1c0e40b893ef437c9f593f876de561b0.jpg', 11790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-1035469</p>\r\n\r\n<p>Ph&acirc;n phối ch&iacute;nh h&atilde;ng Asus Việt nam: Asus D509DA-EJ167T - Silver - CPU: AMD Ryzen&trade; R5-3500U (2.1GHz upto 3.7GHz, 4MB) - RAM: 4GB DDR4 + 1slot - Ổ cứng: 1TB 5400rpm HDD + 1slot M2 sata - VGA: Radeon&trade; Vega 8 Graphics - M&agrave;n h&igrave;nh: 15.6&quot;FHD TN 200nits Anti-Glare NTSC 45% - OS: Windows 10 - Pin: 2-cell Li-ion - C&acirc;n nặng: 1.9kg - T&iacute;nh năng: Bảo mật v&acirc;n tay</p>\r\n', 1, '2020-08-03 09:03:14', NULL),
(42, 1, 1, 'ASUS ROG STRIX G531G-AL017T', '1596445468-product-G531GD-02-1.jpg', 25590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-887855</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus ROG STRIX G531G-AL017T - Đen - CPU: Intel Core i7-9750H (2.6GHz up to 4.5GHz, 12MB) - RAM: 8GB DDR4 2666MHz - SSD: 512GB M.2 NVMe PCIE 3.0 SSD - VGA: NVIDIA Geforce GTX 1650 4GB DDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) IPS, Non-Glare, 120Hz Nanoedge - OS: Windows 10 64bit Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:04:28', NULL),
(43, 1, 1, 'ASUS D509DA-EJ285T', '1597502546-product-1596445566-product-sdfadfasfa.jpg', 9590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>Ph&acirc;n phối ch&iacute;nh h&atilde;ng Asus Việt nam: Asus D509DA-EJ285T - Silver - CPU: ADM Ryzen&trade; R3-3200U (4MB, Upto 3.50GHz) - RAM: 4GB DDR4 2400 MHz - HDD: 256GB SSD - VGA: AMD Radeon Vega 3 Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920x1080) Anti-Glare - OS: Windows 10 64bit - Pin: 3 cell /42Wh - C&acirc;n nặng: 1.9kg - T&iacute;nh năng: Bảo mật v&acirc;n tay</p>\r\n', 1, '2020-08-03 09:06:06', '2020-08-15 21:42:26'),
(44, 1, 1, 'ASUS TUF FX505GE-AL440T', '1596445623-product-dsfsadfasf.jpg', 21900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834199</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus TUF FX505GE-AL440T - CPU: Intel&reg; Core&trade; i7-8750H (2.20 upto 4.10GHz, 6 nh&acirc;n 12 luồng, 9MB) - RAM: 8GB DDR4 2666MHz - HDD: 512GB PCIe&reg; Gen3 SSD - VGA: NVIDIA Geforce GTX1050Ti 4GB DDR5 - Display: 15.6&quot; FHD (1920*1080) 144Hz IPS - OS: Windows 10 SL - Color: X&aacute;m Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:07:03', NULL),
(45, 1, 1, 'ASUS D409DA-EK151T', '1596445774-product-ygozdzqkwjdnv.jpg', 9390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-1035440</p>\r\n\r\n<p>Ph&acirc;n phối ch&iacute;nh h&atilde;ng Asus Việt nam: Asus D409DA-EK151T - Silver - CPU: ADM Ryzen&trade; R3-3200U (4MB, Upto 3.50GHz) - RAM: 4GB DDR4 2400 MHz - HDD: 256GB SSD - VGA: AMD Radeon Vega 3 Graphics - M&agrave;n h&igrave;nh: 14.0&quot; FHD (1920x1080) Anti-Glare - OS: Windows 10 64bit - Pin: 3 cell /42Wh - C&acirc;n nặng: 1.9kg - T&iacute;nh năng: Bảo mật v&acirc;n tay</p>\r\n', 0, '2020-08-03 09:09:34', NULL),
(46, 1, 1, 'ASUS A512FL-EJ222T', '1596445856-product-jsadfjsjfjasjsaho.jpg', 13900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834150</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối: - CPU: Intel&reg; Core&trade; i5-8265U (1.60 GHz upto 3.90 GHz, 6MB ) - RAM: 8GB DDR4 - HDD: 512GB SSD - VGA: NVIDIA GeForce MX250 2GB - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 - Pin: 2-cell, 37WHrs - C&acirc;n nặng: 1.70 kg - Color: Silver Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:10:56', NULL),
(47, 1, 1, 'ASUS A512FL-EJ164T', '1596445904-product-gdhg.jpg', 13900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-8341577</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối: - CPU: Intel&reg; Core&trade; i5-8265U (1.60 GHz upto 3.90 GHz, 6MB ) - RAM: 8GB DDR4 - HDD: 512GB SSD - VGA: NVIDIA GeForce MX250 2GB - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 - Pin: 2-cell, 37WHrs - C&acirc;n nặng: 1.70 kg - Color: Silver Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:11:44', NULL),
(48, 1, 1, 'ASUS TUF FX505DD-AL182T', '1596445971-product-dfhgiuhgaf.jpg', 15590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834192</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối FX505DD-AL182T - CPU: AMD Ryzen 5-3550H(2.10 upto 2.70GHz, 4MB) - RAM: 8GB DDR4 2666MHz - HDD: 512GB PCIe&reg; Gen3 SSD - VGA: NVIDIA Geforce GTX 1050 3GB DDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 Home Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:12:51', NULL),
(49, 1, 1, 'ASUS X441UA-WX085T', '1596446025-product-drighadhg.jpg', 1590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-1153433</p>\r\n\r\n<p>Asus X441UA-WX085T - Đen - CPU: Intel Core i3-6006U (2.0Ghz, 3MB Cache, 2 Cores 4 Threads) - RAM: 4GB DDR4 2400MHz - HDD: 1TB SATA 5400rpm - VGA: Intel HD Graphics 520 - Display: 14&quot; HD LED (1366x768) - OS: Windows 10 Home</p>\r\n', 1, '2020-08-03 09:13:45', NULL),
(51, 1, 1, 'ASUS A512FA-EJ166T', '1596446087-product-gdhg.jpg', 16900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-8341566</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối: - CPU: Intel&reg; Core&trade; i7-8565U (1.80 GHz upto 4.60 GHz, 8MB) - RAM: 8GB DDR4 - Ổ cứng: 512 GB SSD - VGA: Nvidia MX250 2GB DDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 SL - Pin: 2Cell 37WHr - T&iacute;nh năng: Bảo mật v&acirc;n tay Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:14:47', NULL),
(52, 1, 1, 'ASUS X509FA-EJ201T', '1597502599-product-1596445566-product-sdfadfasfa.jpg', 11900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>24 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-005-834190</p>\r\n\r\n<p>H&agrave;ng Asus Việt Nam ph&acirc;n phối Asus X509FA-EJ201T - Bạc - CPU: Intel&reg; Core&trade; i5-8265U (1.60 upto 3.90GHz, 6MB) - RAM: 4GB DDR4 Onboard - HDD: 1TB 5400rpm SATA - VGA: Intel&reg; UHD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) 60Hz Anti-Glare Panel - OS: Windows 10 Home Brand New 100%. Made in China</p>\r\n', 1, '2020-08-03 09:16:12', '2020-08-15 21:43:19'),
(54, 1, 2, 'DELL LATITUDE 7280 (I77600-8-512SSD-W10) BLACK', '1596641309-product-15195836_download_1.jpg', 16590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-727804</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối Ch&iacute;nh h&atilde;ng Dell Việt Nam Dell Latitude 7280 - CPU : Intel Core i7-7600U 2.8 GHz, 4MB - RAM : 8GB - HDD : 512GB SSD - VGA : Intel HD Graphics 620 - M&agrave;n h&igrave;nh : 12.5&quot; (1920 x 1080) diagonal FHD anti-glare WLED-backlit - OS : Windows 10 Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:28:29', NULL),
(55, 1, 2, 'DELL INSPIRON 5584 70186849 (I38145-4-1TB-ON-W10) SILVER', '1597502673-product-1596641403-product-sjfjsdfadf.jpg', 13150000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-854004</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. Dell Inspiron 5584 - CPU: Intel Core i3-8145U (2.1GHz, 3MB) - RAM: 8GB DDR4 2400MHz - HDD: 1TB - VGA: Intel UHD Graphics 620 - Display: 15.6&quot; FHD (1920 x 1080) - OS: Windows 10 Home - Color: Silver Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:30:03', '2020-08-15 21:44:33'),
(56, 1, 2, 'DELL INSPIRON 3543 (N3205-4-500-ON) BLACK', '1596641482-product-dell-inspiron-3543-i3-5005u-4gb-500gb-win81-1.jpg', 6250000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-685411</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. - CPU: Core Celeron N3205 1.5Ghz, 2MB Cache - RAM: 4096MB - HDD: 500GB - Display: 15.6&quot; HD WLED webcam bluetooth&nbsp; - VGA: Intel HD Graphics VGA - OS: Dos - Weight 2.4 kg - Black Color. Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:31:22', NULL),
(57, 1, 2, 'DELL LATITUDE E3480 (I36006-4-500-ON) GRAY (NK)', '1597502726-product-1596642013-product-unnamed (2).jpg', 7990000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-7341120</p>\r\n\r\n<p>H&agrave;ng nhập khẩu trực tiếp bảo h&agrave;nh tại kholaptop Dell Inspiron 3480 - CPU: Intel&reg; Core&trade; i3-6006U (2.0GHz, 3MB) - RAM: 4GB - HDD: 500GB 5400rpm - VGA: Intel HD Graphics - M&agrave;n h&igrave;nh: 14.0&quot; HD - OS: Dos -Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:32:45', '2020-08-15 21:45:26'),
(58, 1, 2, 'DELL INSPIRON G5 5590 4F4Y42 (I79750-16-512SSD-NVI-W10) BLACK', '1596641656-product-lljhqlyogucbx.jpg', 39900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-978202</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối ch&iacute;nh h&atilde;ng Dell Việt nam: - CPU: Intel&reg; Core&trade; i7-9750H (2.60 GHz upto 4.50 GHz, 12MB) - RAM: 16GB DDR4 - Ổ cứng: 512GB SSD + 1TB HDD - VGA: nVidia Geforce GTX1650 4GB GDDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) IPS 144Hz - OS: Windows 10 SL - Pin: 4 cell - T&iacute;nh năng: Bảo mật v&acirc;n tay, LED_KB Made in China, Brand new 100%</p>\r\n', 1, '2020-08-05 15:34:16', NULL),
(59, 1, 2, 'DELL INSPIRON G5 5590 4F4Y41 (I79750-8-256SSD-NVI-W10) BLACK', '1596655932-product-dell-inspiron-3543-i3-5005u-4gb-500gb-win81-1.jpg', 32390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-978201</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối ch&iacute;nh h&atilde;ng Dell Việt nam: - CPU: Intel&reg; Core&trade; i7-9750H (2.60 GHz upto 4.50 GHz, 12MB) - RAM: 8GB DDR4 - Ổ cứng: 256GB SSD + 1TB HDD - VGA: nVidia Geforce GTX1650 4GB GDDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) IPS 144Hz - OS: Windows 10 SL - Pin: 4 cell - T&iacute;nh năng: Bảo mật v&acirc;n tay, LED_KB Made in China, Brand new 100%</p>\r\n', 1, '2020-08-05 15:35:02', '2020-08-06 02:32:12'),
(60, 1, 2, 'DELL INSPIRON 13 7370 7D61Y3 (I78550-8-256-ON-W10-FHD) SILVER', '1596641770-product-dell-inspiron-7370-i7-8550u-8gb-256ssd-win10-offic-18-600x600.jpg', 24590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-397810</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. - CPU : Intel&reg; Core i7-8550U 1.8Ghz - RAM : 8GB - SSD : 256GB - VGA : Intel&reg; UHD Graphics 520 - M&agrave;n h&igrave;nh : 13.3&quot; Full HD WLED - OS : Windows 10 - Pin : 4Cell 40WHr - C&acirc;n nặng : 1.66kg - Color: Silver Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:36:10', NULL),
(61, 1, 2, 'DELL INSPIRON 3543 (N3205-4-500-ON) BLACK', '1596641866-product-dell-inspiron-3558-i5-5200u-4gb-500gb-vga2gb-win81-den-9-slider01.jpg', 6625000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-685411</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. - CPU: Core Celeron N3205 1.5Ghz, 2MB Cache - RAM: 4096MB - HDD: 500GB - Display: 15.6&quot; HD WLED webcam bluetooth&nbsp; - VGA: Intel HD Graphics VGA - OS: Dos - Weight 2.4 kg - Black Color. Made in China. Brand New 100%.&nbsp;</p>\r\n', 1, '2020-08-05 15:37:46', NULL),
(63, 1, 2, 'DELL G7 7588 (I78750-8-128SSD-1TB-NVI-W10) NK', '1597481462-product-1596642536-product-fdsgsdfg.jpg', 24500000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-817845</p>\r\n\r\n<p>H&agrave;ng nhập khẩu trực tiếp, bảo h&agrave;nh tại KHOLAPTOP Dell Gaming Inspiron G7 15 N7588 - CPU : Intel&reg; Core&trade; i7-8750H (2.2GHz Upto 4.1GHz, 9MB Cache) - RAM : 8GB DDR4 2666MHz - HDD : 128GB SSD + 1TB HDD 5400rpm - VGA : Geforce GTX 1050Ti 4GB GDDR5 - M&agrave;n h&igrave;nh : 15.6&quot; IPS FHD (1920*1080) - OS : Windows 10 Home - Pin : 4-Cell, 56 Whr - C&acirc;n nặng : 2.63Kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:48:56', '2020-08-15 15:51:02'),
(64, 1, 2, 'DELL XPS13 9370 (I78550-8-256SSD-4K-W10) SILVER (NK)', '1596655904-product-15195836_download_1.jpg', 30900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng Nhập khẩu trực tiếp, bảo h&agrave;nh tại kholaptop: - CPU: Intel Core i7-8550U (1.8GHz Upto 4.0GHz, 8MB Cache, 4 Cores 8 Threads) - RAM: 8GB LPDDR3, - HDD: 256GB SSD, - VGA: Intel UHD Graphics 620, - DISPLAY: 13.3&quot; 4K Ultra HD (3840 x 2160) InfinityEdge touch display, - LED Keyboard, FingerPrint, Wlan + Bluetooth, Camera, - PIN: 4 Cell 52WHr, 1.2kg - Windows 10 Home , Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:50:23', '2020-08-06 02:31:44'),
(65, 1, 2, 'DELL XPS 15 9570 (I78750-8-256SSD-ON) (NK) SILVER', '1596642717-product-unnamed (1).png', 33900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-878209</p>\r\n\r\n<p>H&agrave;ng Nhập khẩu trực tiếp. bảo h&agrave;nh tại KHOLAPTOP Dell XPS 15 9570 - Bạc - CPU: Intel&reg; Core&trade; i7-8705G (3.10GHz upto 4.10GHz, 8MB) - RAM: 8GB DDR4 2400MHz - HDD: 256GB SSD - VGA: Intel HD Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920x1080) - Pin: 75WHr - C&acirc;n nặng: 2.0Kg - OS: Windows 10 Home Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:51:57', NULL),
(66, 1, 2, 'DELL INSPIRON N5570 (I78550-8-1TB-ON) - TOUCH SILVER (NK)', '1596642804-product-kjsanns.jpg', 16900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng nhập khẩu trực tiếp. bảo h&agrave;nh tại kholaptop. - CPU: Intel&reg; Core&trade; i7-8550U Processor (8M Cache, up to 4.00 GHz) - RAM: 8GB DDR4 2400MHz - HDD: 1TB - VGA: Intel&reg; UHD Graphics 620 - Display: 15.6&quot; FHD C&oacute; cảm ứng touch screen - Color: Silver - OS: Dos Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:53:24', NULL),
(67, 1, 2, 'DELL INSPIRON G3 3579 (I58300-8-128SSD-1TB-NVI) WHITE (NK)', '1596642881-product-kjfa.jpg', 15590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-817844</p>\r\n\r\n<p>H&agrave;ng nhập khẩu trực tiếp, bảo h&agrave;nh tại Kholaptop Dell G3 Gaming Inspiron 3579 - CPU: Intel&reg; Core&trade; i5-8300H (2.30GHz upto 4.00GHz, 8MB) - RAM: 8GB DDR4 2666MHz - HDD: 128GB SSD - VGA: nVidia Geforce GTX 1050 4GB DDR5 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: DOS - Color: White - Pin: 4-Cell, 56 Whr - C&acirc;n nặng: 2.53Kg Made in China. Brand New 100%</p>\r\n', 1, '2020-08-05 15:54:41', NULL),
(68, 1, 2, 'DELL INSPIRON G3 3579 (I78750-16-128SSD-1TB-NVI) BLACK (NK)', '1596642951-product-unnamed (3).jpg', 25900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-817838</p>\r\n\r\n<p>H&agrave;ng nhập khẩu trực tiếp, bảo h&agrave;nh tại kholaptop - CPU: Intel&reg; Core&trade; i7-8750H (2.20GHz upto 4.10GHz, 9MB cache) - RAM: 16GB DDR4 - HDD: 128GB SSD + 1TB SATA - VGA: nVidia Geforce GTX 1050 4GB DDR5 - Display: 15.6&quot; FHD (1920*1080) IPS - OS: Ubuntu - Color: Black - C&acirc;n nặng : 2.4Kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:55:51', NULL),
(69, 1, 2, 'DELL XPS 15 9570 (I78750-16-512SSD-ON) (NK) SILVER', '1596643031-product-unnamed (4).jpg', 35900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-878206</p>\r\n\r\n<p>H&agrave;ng Nhập khẩu trực tiếp. bảo h&agrave;nh tại KHOLAPTOP Dell XPS 15 9570 - Bạc - CPU: Intel&reg; Core&trade; i7-8705G (3.10GHz upto 4.10GHz, 8MB) - RAM: 16GB DDR4 2400MHz - HDD: 512GB SSD - VGA: Intel HD Graphics - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920x1080) - Pin: 75WHr - C&acirc;n nặng: 2.0Kg - OS: Windows 10 Home Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 15:57:11', NULL),
(70, 1, 2, 'DELL INSPIRON 5370 N3I3002W (I38130-4-128SSD-W10-ON) SILVER', '1596643108-product-unnamed (5).jpg', 13590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-104343</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Dell Việt Nam. Dell Inspiron 5370 N3I3002W - Bạc - CPU: Intel&reg; Core&trade; i3 8130U (2.20GHz upto 3.40GHz, 4MB) - RAM: 4GB DDR4 2400MHz - HDD: 128GB SSD - VGA: Intel&reg; UHD Graphics 620 - M&agrave;n h&igrave;nh: 13.3&quot; FHD (1920*1080) LED - OS: Windows 10 Home - Pin: 3-Cell, 38 WHr - C&acirc;n nặng: 1.3Kg Made in China. Brand New 100</p>\r\n', 1, '2020-08-05 15:58:28', '2020-08-05 22:59:00'),
(71, 1, 2, 'DELL INSPIRON N3576 C5I3132W (I37020-4-1TB-AMD-W10) BLACK', '1596644180-product-tyuocaizohfuf.jpg', 9900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-002-815412</p>\r\n\r\n<p>H&agrave;ng Dell Việt Nam ph&acirc;n phối Dell Inspiron N3576 C5I3132W - Đen - CPU : Intel&reg; Core&trade; i3-7020U (2.3GHz, 2Cores, 4Threads, 3MB cache) - RAM : 4GB DDR4 - HDD : 1TB - VGA : AMD R5 520 2GB DDR5 - M&agrave;n h&igrave;nh : 15.6&quot; HD (1366*768) - OS : Windows 10 - Pin : 4 cell - 40Whr - C&acirc;n nặng : 2.1Kg Brand New 100%. Made in China</p>\r\n', 1, '2020-08-05 16:16:20', NULL),
(72, 1, 3, 'ACER ASPIRE A515-53-3153 (NX.H6BSV.005)', '1596652192-product-acer-aspire-a515-53-3153-i3-8145u-4gb-1gb-win10-n-33397-conent-thietkedmx.jpg', 11000000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-225401</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire A515-53-3153 NX.H6BSV.005 - Bạc - CPU: Intel Core i3-8145U (2.10 upto 3.90GHz, 2 nh&acirc;n 4 luồng, 4MB) - RAM: 4GB DDR4 - HDD: 1TB 5400rpm - VGA: Intel&reg; UHD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920x1080) - OS: Windows 10 Home 64bit - Pin: 3 cell /4319 mAh - C&acirc;n nặng: 2.2Kg Made in China. Brand New 100%</p>\r\n', 1, '2020-08-05 18:29:52', NULL),
(73, 1, 3, 'ACER ASPIRE 3 A315-54-558R (NX.HEFSV.005) BLACK', '1596652252-product-sajhfjsadf.jpg', 10590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-315455</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire 3 A315-54-558R - CPU: Intel&reg; Core&trade; i5-8250U (1.6GHz, 6MB) - RAM: 4GB DDR4 - Ổ cứng: 1TB HDD - VGA: Intel&reg; HD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; HD - OS: Windows 10 SL - Pin: 4 cell - C&acirc;n nặng: 1,7 kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:30:52', NULL),
(74, 1, 3, 'ACER SWIFT SF314-54-51QL (NX.GXZSV.001)', '1596652342-product-acer-swift-sf314-54-51ql-nxgxzsv001-14-600x600.jpg', 10590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam. Acer swift SF314-54-51QL (NX.GXZSV.001) - Vỏ nh&ocirc;m bạc - Intel&reg; Core i5-8250U (1.6GHz Upto 3.4GHz, 6MB L3 cache), - RAM: 4GB DDR4 - HDD: 1TB HDD 5400rpm - VGA: Intel UHD Graphics 620 - Display: 14.0&quot; Full HD IPS (1920x1080) - Bluetooth4.0, Wifi, HD WebCam, Fingerprint, - Trong luong: 1.5kg - HĐH: Windows 10 Single Language</p>\r\n', 1, '2020-08-05 18:31:57', '2020-08-06 01:32:22'),
(75, 1, 3, 'ACER ASPIRE 3 A315-54K-36QU (NX.HEESV.007)', '1596652392-product-sajhfjsadf.jpg', 8890000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-297468</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire A315-54K-36QU NX.HEESV.007 - CPU: Intel&reg; Core&trade; i3-7020U (2.30 GHz, 3 MB) - RAM: 4GB DDR4 - Ổ cứng: 256GB SSD - VGA: Intel&reg; HD Graphics 620 - M&agrave;n h&igrave;nh: 15.6&quot; FHD (1920*1080) - OS: Windows 10 SL - Pin: 4 cell - C&acirc;n nặng: 1,90 kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:33:12', NULL),
(76, 1, 3, 'ACER NITRO 5 AN515-42-R8A0 (NH.Q3RSV.005)', '1596652479-product-gjadfgjj.jpg', 15290000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-297467</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam - CPU: AMD Ryzen&trade; 5 2500U (2M Cache, up to 3.60 GHz) - RAM: 8GB DDR4 2400Mhz (Up to 32GB) - SSD: 256GB - VGA: AMD Radeon&trade; RX 560X 4G-GDDR5 7Gbps - Display: 15.6Inch FHD Acer ComfyView IPS LED LCD - Color: Shale Black - OS: Windows 10 Home Made in China. Brand New 100%</p>\r\n', 1, '2020-08-05 18:34:39', NULL),
(77, 1, 3, 'ACER ASPIRE A315-53-54T3 (NX.H2BSV.002)', '1596652546-product-laptop-acer-aspire-a315-53-54t3-nxh2bsv002.jpeg', 9500000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-313212</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire A315-53-54T3 (NX.H2BSV.002) - Charcoal Black - CPU : Intel&reg; Core&trade; i5-7200U (2.5GHz upto 3.1GHz, 2Cores, 4Threads, 3MB cache) - RAM : 4GB DDR4 - HDD : 1TB SATA 5400rpm, c&oacute; khe chờ M2 để n&acirc;ng cấp SSD - VGA : Intel HD Graphics 620 - M&agrave;n h&igrave;nh : 15.6&quot; FHD (1920*1080) - OS : Linux - Pin : 2 cell - C&acirc;n nặng : 1,83 kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:35:46', NULL),
(78, 1, 3, 'ACER ASPIRE Z1402-35NV (NX.G80SV.009)', '1596652791-product-jasf.jpg', 6000000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-313211</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire Z1402-35NV NX.G80SV.009 - Charcoal Black - CPU: Intel&reg; Core i3-5005U(2.0GHz, 3MB) - RAM: 2GB DDR3L 1600Mhz - HDD: 500GB SATA 5400rpm - VGA: Intel HD Graphics 5500 - Display: 14&quot;HD LED Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:36:42', '2020-08-06 01:39:51'),
(79, 1, 3, 'ACER ASPIRE A315-54-59ZJ (NX.HM2SV.005)', '1596652754-product-jáhdfjsadfjádf.jpg', 11900000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-315433</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire A315-54-59ZJ (NX.HM2SV.005) - CPU : Intel Core i5-10210U, 1.60 GHz - RAM : 8GB DDR4 - HDD : 512GB SSD - VGA : Intel&reg; HD Graphics 620 - M&agrave;n h&igrave;nh : 15.6&quot; FHD (1920x1080) - OS : Windwos 10 Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:37:32', '2020-08-06 01:39:14'),
(80, 1, 3, 'ACER ASPIRE A315-51-325E (NX.GNPSV.037)', '1596652718-product-laptop-acer-aspire-a315-53-54t3-nxh2bsv002.jpeg', 8300000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-305408</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam Acer Aspire A315-51-325E NX.GNPSV.037 - Đen - CPU : Intel&reg; Core&trade; i3-7020U (2.3GHz, 2Cores, 4Threads, 3MB cache) - RAM : 4GB DDR4 - HDD : 1TB 5400rpm,c&oacute; khe chờ M2 để n&acirc;ng cấp SSD - VGA : Intel&reg; HD Graphics 620 - M&agrave;n h&igrave;nh : 15.6&quot; HD (1366 x 768) - OS : Linux - Pin : 2-cell 4810 mAh - C&acirc;n nặng : 2.10kg Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:38:38', NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `avatar`, `price`, `summary`, `description`, `status`, `created_at`, `updated_at`) VALUES
(81, 1, 3, 'ACER ASPIRE A315 54 3501 (NX.HEFSV.003)', '1596652867-product-acer-aspire-a315-54-3501-i3-8145u-4gb-256gb-win10-1-600x600.jpg', 9390000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-315420</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam - CPU: Intel&reg; Core&trade; i3-8145U Processor (4M Cache, up to 2.1 GHz) - RAM: 4GB DDR4 - SSD: 256GB NVMe PCIe - VGA: Intel HD Graphics 620 - Display: 15.6&quot;FHD - PIN 4cell - OS Windows 10 Home 64 Made in China. Brand New 100%</p>\r\n', 1, '2020-08-05 18:41:07', NULL),
(82, 1, 3, 'ACER SPIN 3 SP314-51-39WK (NX.GUWSV.001)', '1596652926-product-08fd2b81263fd3a8e64f8c0daa64719d.jpg', 8590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-315410</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam. - CPU: Intel Core i3-7130U 2.1Ghz - RAM: 4GB - HDD: 500GB HDD SATA 5400rpm, - VGA: Intel HD Graphics 620 - Display: 14.0&quot; FHD WLED - HĐH: Windows 10 - Color: Gray Brand New 100%. Made in China</p>\r\n', 1, '2020-08-05 18:42:06', NULL),
(83, 1, 3, 'ACER ASPIRE E5-476-3675 (NX.GWTSV.002)', '1596653021-product-fjsajdf.jpg', 8790000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-313410</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam - CPU Intel&reg; Core&trade; i3-8130U Processor (4M Cache, up to 3.40 GHz) - RAM 4GB DDR4 - HDD 500GB - VGA Intel HD Graphics 620 - DISPLAY 14.0Inch HD - PIN 4cell - OS Windows 10 Home 64 Made in China. Brand New 100%.</p>\r\n', 1, '2020-08-05 18:43:41', NULL),
(84, 1, 3, 'ACER SWIFT SF315-51-530V (NX.GSKSV.001)', '1596653091-product-asdfjasjf.jpg', 10990000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam. Acer Swift 3 SF315-51-530V NX.GSKSV.001 - Vỏ nh&ocirc;m Xanh - Intel&reg; Core i5-8250U (1.6GHz Upto 3.4GHz, 6MB L3 cache), - RAM: 4GB DDR4 - HDD: 1TB HDD 5400rpm - VGA: Intel UHD Graphics 620 - Display: 15.6&quot; Full HD IPS (1920x1080) - Bluetooth4.0, Wifi, HD WebCam, Fingerprint, - Trong luong: 1.5kg - HĐH: Windows 10 Single Language</p>\r\n', 1, '2020-08-05 18:44:51', NULL),
(85, 1, 3, 'ACER ASPIRE E5-575-54F2', '1596653150-product-afjsajdf.jpg', 9590000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1151-007-315402</p>\r\n\r\n<p>H&agrave;ng ph&acirc;n phối của Acer Việt Nam. - CPU: Intel Core i5 Kabylake, 7200U, 2.50 GHz - RAM: 4 GB, DDR4 (2 khe), 2133 MHz - HDD: 500GB HDD 5400rpm - VGA: Intel&reg; HD Graphics 620 - Display: 15.6&quot;FHD - HĐH: Windows 10 Home SL - Color: Black Brand New 100%. Made in China</p>\r\n', 1, '2020-08-05 18:45:50', NULL),
(86, 3, 10, 'HDD 1000GB @5400RPM SATA 2.5HDD FOR LAPTOP (TM)', '1596653374-product-unnamed (6).jpg', 700000, '', '<p><strong>Bảo hành: </strong>12 Tháng</p>\r\n\r\n<p><strong>SKU: </strong>3141-018-540504</p>\r\n\r\n<p>Ổ cứng HDD dành cho laptop: - Dung lượng: 1000GB - Tốc độ quay: 5400rpm - Kích thước: 2.5 - Giao tiếp: SATA Hàng tháo máy, mới 99%</p>\r\n', 1, '2020-08-05 18:49:34', '2020-08-06 01:50:51'),
(87, 3, 10, 'HDD 500GB @5400RPM SATA 2.5HDD FOR LAPTOP (TM)', '1596653434-product-unnamed (7).jpg', 500000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>3141-018-540503</p>\r\n\r\n<p>Ổ cứng HDD d&agrave;nh cho laptop: - Dung lượng: 500GB - Tốc độ quay: 5400rpm - K&iacute;ch thước: 2.5 - Giao tiếp: SATA H&agrave;ng th&aacute;o m&aacute;y, mới 99%</p>\r\n', 1, '2020-08-05 18:50:34', NULL),
(88, 3, 10, 'WESTERN DIGITAL 500GB @5400RPM SATA 2.5HDD FOR LAPTOP', '1596653503-product-ấdjf.jpg', 1200000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>36 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1141-201-540540</p>\r\n\r\n<p>Western Digital - K&iacute;ch thước: 2.5&quot; - Dung lượng: 500GB - Tốc độ quay: 5400rpm</p>\r\n', 1, '2020-08-05 18:51:43', NULL),
(89, 3, 10, 'HITACHI 500GB @5400RPM SATA 2.5', '1596653551-product-xrjq8dniwtym4.jpg', 1000000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>Li&ecirc;n hệ</p>\r\n\r\n<p><strong>SKU:</strong></p>\r\n\r\n<p>H&agrave;ng ch&iacute;nh h&atilde;ng ph&acirc;n phối Ổ cứng cắm trong cho Laptop. Chuẩn SATA H&agrave;ng ch&iacute;nh h&atilde;ng. Mới 100%.</p>\r\n', 1, '2020-08-05 18:52:31', '2020-08-06 01:52:59'),
(90, 3, 10, 'HITACHI 1.5TB @5400RPM SATA 2.5', '1596653994-product-xrjq8dniwtym4.jpg', 1250000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>Li&ecirc;n hệ</p>\r\n\r\n<p><strong>SKU:</strong></p>\r\n\r\n<p>Ổ cứng cắm trong cho Laptop. Chuẩn SATA H&agrave;ng ch&iacute;nh h&atilde;ng. Mới 100%</p>\r\n', 1, '2020-08-05 18:53:43', '2020-08-06 01:59:54'),
(91, 3, 11, 'SSD KINGMAX SA3080 M.2 - 256GB - KMAXSA3080 128GB', '1596653715-product-unnamed (8).jpg', 950000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>36 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>0</p>\r\n\r\n<p>T&ecirc;n sản phẩm: Ổ cứng SSD Kingmax M.2 2280 128GB SATA III (SA3080) - Dung lượng: 256GBGB - K&iacute;ch thước: M.2 2280 - Kết nối: M.2 SATA - NAND: 3D-NAND - Tốc độ đọc / ghi (tối đa): 500MB/s / 350MB/s</p>\r\n', 1, '2020-08-05 18:55:15', NULL),
(92, 3, 11, 'SSD M2 SATA INTEL PRO 540S 180GB', '1596653772-product-unnamed (9).jpg', 700000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>12 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1140-800-128532</p>\r\n\r\n<p>Dung lượng: 180GB Chuẩn kết nối: m2 SATA Made in China. H&agrave;ng mới 100%.&nbsp;</p>\r\n', 1, '2020-08-05 18:56:12', NULL),
(93, 3, 11, 'SSD KINGMAX 2.5 SATA III SMV32 120GB (KM120GSMV32)', '1596653855-product-ombmwkfssvcss.jpg', 650000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>36 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1140-601-041211</p>\r\n\r\n<p>SSD KINGMAX 120GB SMV32 - Dung lượng: 120GB - K&iacute;ch thước: 2.5&quot; - Kết nối: SATA 6Gb/s - Tốc độ Đọc/Ghi : Sequential Upto 500MBps / 350MBps</p>\r\n', 1, '2020-08-05 18:57:35', NULL),
(94, 3, 11, 'SSD KINGMAX SA3080 M.2 - 128GB - KMAXSA3080 128GB', '1596653915-product-unnamed (8).jpg', 700000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>36 th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1140-008-015012</p>\r\n\r\n<p>T&ecirc;n sản phẩm: Ổ cứng SSD Kingmax M.2 2280 128GB SATA III (SA3080) - Dung lượng: 128GB - K&iacute;ch thước: M.2 2280 - Kết nối: M.2 SATA - NAND: 3D-NAND - Tốc độ đọc / ghi (tối đa): 500MB/s / 350MB/s</p>\r\n', 1, '2020-08-05 18:58:35', NULL),
(95, 3, 11, 'SSD KINGSTON 120GB A400 M.2 2280 SATA3', '1596653964-product-unnamed (10).jpg', 800000, '', '<p><strong>Bảo h&agrave;nh:&nbsp;</strong>36 Th&aacute;ng</p>\r\n\r\n<p><strong>SKU:&nbsp;</strong>1140-601-041208</p>\r\n\r\n<p>- K&iacute;ch thước: 2,5&quot; &amp; M.2 2280 - Giao diện: Sata 3 - Dung lượng: 120GB - Tốc độ đọc: 500MB - Tốc độ ghi: 400MB Made in China. H&agrave;ng mới 100%. Bảo h&agrave;nh 36 th&aacute;ng</p>\r\n', 1, '2020-08-05 18:59:24', NULL),
(96, 2, 5, 'iPhone 7 Plus 128GB ', '1596654279-product-2071472164.jpeg', 9990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>5.5&#39;&#39;. LED-backlit IPS LCD, 1920 x 1080 pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A10 Fusion Intel A1784 l&otilde;i tứ 64-bit</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Hai Camera 12.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tin nhắn:</td>\r\n			<td>HSDPA 850/900/1700/2100/1900</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 12</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Danh bạ:</td>\r\n			<td>Kh&ocirc;ng giới hạn</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Li-Ion 2900 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:04:39', NULL),
(97, 2, 5, 'iPhone 8 Plus 64GB ', '1596654369-product-1653014996.jpeg', 13490000, '', '<p>&nbsp;</p>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>5.5&quot; LED-backlit IPS LCD Full HD 1920 x 1080 pixel</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Chip A11 Bionic 64, 6 nh&acirc;n c&ugrave;ng bộ xử l&yacute; chuyển động M11</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Camera k&eacute;p g&oacute;c rộng 12.0 MP, c&oacute; thể zoom quang học 2 lần, chống rung quang học</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7 MP, khẩu độ F/2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 Sim Nano</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>IOS 12</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>2691 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:06:09', NULL),
(98, 2, 5, 'iPhone 11 64GB ', '1596654465-product-1693220739.png', 18490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.1&quot;, Liquid Retina HD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic 6 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 12 MP &amp; Phụ 12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Nano SIM &amp; eSIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim FullHD 1080p@120fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@24fps, Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3110 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:07:45', NULL),
(99, 2, 5, 'iPhone 11 Pro Max 64GB ', '1596654577-product-869857964.png', 27900000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Super Retina XDR, 6.5 inches</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>3 camera 12MP G&oacute;c rộng, Si&ecirc;u rộng v&agrave; Telephoto cameras</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>eSIM v&agrave; NanoSIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim FullHD 1080p@120fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@24fps, Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3969 mAh, Lithium-ion, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Hiển thị cấu h&igrave;nh chi tiết&nbsp;</p>\r\n', 1, '2020-08-05 19:08:43', '2020-08-06 02:09:37'),
(100, 2, 5, 'iPhone SE (2020) 64GB ', '1596654652-product-87470756.jpeg', 11490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 4.7&quot;, Retina</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic 6 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 eSIM &amp; 1 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>1821 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:10:52', NULL),
(101, 2, 5, 'iPhone SE (2020) 128GB ', '1596654723-product-87470756.jpeg', 12990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 4.7&quot;, Retina</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic 6 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 eSIM &amp; 1 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>1821 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:12:03', NULL),
(102, 2, 5, 'iPhone 7 Plus 32GB ', '1596654790-product-282227484.jpeg', 7000000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>5.5&#39;&#39;. LED-backlit IPS LCD, 1920 x 1080 pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A10 Fusion Intel A1784 4 nh&acirc;n 64-bit</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Hai Camera 12.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 12</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Danh bạ:</td>\r\n			<td>Kh&ocirc;ng giới hạn</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Li-Ion 2900 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:13:10', NULL),
(103, 2, 5, 'iPhone Xs Max 64GB ', '1596654852-product-2043634260.jpeg', 21990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>OLED, 6.5 inch, Super Retina</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A12 Bionic 6 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>2 camera 12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>7 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 Nano Sim + eSim</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 12</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11ac Wi‑Fi with 2x2 MIMO</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@24fps, Quay phim FullHD 1080p@120fps, Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3174 mAh, Tiết kiệm pin, Sạc pin nhanh, Sạc pin kh&ocirc;ng d&acirc;y</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:14:12', NULL),
(104, 2, 5, 'iPhone 11 Pro 64GB ', '1596654916-product-1236633667.png', 25490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Super Retina XDR, 5.8 inches</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>3 camera 12MP G&oacute;c rộng, Si&ecirc;u rộng v&agrave; Telephoto cameras</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>12.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>eSIM v&agrave; NanoSIM (1 sim)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim FullHD 1080p@120fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@24fps, Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3190 mAh- Lithium-ion</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:15:16', NULL),
(105, 2, 5, 'iPhone 11 256GB ', '1596654964-product-1048389602.png', 22990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.1 inches, Liquid Retina HD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Dual 12MP Ultra Wide and Wide cameras</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>12MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Nano SIM &amp; eSIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>iOS 13</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>4K video recording at 24 fps, 30 fps, or 60 fps, 1080p HD video recording at 30 fps or 60 fps, Extended dynamic range for video up to 60 fps, Optical image stabilization for video,</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Pin chuẩn Li-Ion</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Hiển thị cấu h&igrave;nh chi tiết&nbsp;</p>\r\n', 1, '2020-08-05 19:16:04', NULL),
(106, 2, 6, 'Samsung Galaxy Note 10 ', '1596655041-product-167199584.png', 22990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Super AMOLED, 6.3&quot;, Quad HD+ (2K+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 9825 8 nh&acirc;n 64 bit</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12MP + 12MP + 16MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>10 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim si&ecirc;u chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3500mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:17:21', NULL),
(107, 2, 6, 'Samsung Galaxy Note 10+ ', '1596655095-product-1215762484.png', 17990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Super AMOLED, 6.8&quot;, Quad HD+ (2K+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 9825 8 nh&acirc;n 64-bit</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>12 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12MP + 12MP + 16MP + TOF camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>10MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Sim Nano (Sim 2 chung khe thẻ nhớ)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac/ax, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim si&ecirc;u chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4300mAh, C&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:18:15', NULL),
(108, 2, 6, 'Samsung Galaxy A51 ', '1596655148-product-1488940904.jpeg', 6990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inches, FHD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 9611, 8, Octa-core (4x2.3 GHz Cortex-A73 &amp; 4x1.7 GHz Cortex-A53)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>6 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>48MP, 5MP, 12MP, 5MP (4 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>32 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Nano SIM, 2 Sim</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>FullHD 1080p@30fps, Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:19:08', NULL),
(109, 2, 6, 'Samsung Galaxy S20 Ultra ', '1596655205-product-211380375.jpeg', 23990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Dynamic AMOLED 2X, 6.9&quot;, Quad HD+ (2K+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 990 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>12 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 108 MP &amp; phụ 48 MP, 12 MP, TOF 3D</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>40 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:20:05', NULL),
(110, 2, 6, 'Samsung Galaxy S20+ ', '1596655263-product-249095600.jpeg', 17990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Dynamic AMOLED 2X, 6.7&quot;, Quad HD+ (2K+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 990 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 64 MP &amp; phụ 12 MP, 12 MP, TOF 3D</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>10 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Dual-band, Wi-Fi 802.11 a/b/g/n/ac/ax, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4500 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:21:03', NULL),
(111, 2, 6, 'Samsung Galaxy A01 Core ', '1596655342-product-1818558847.jpeg', 1790000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>5.3&quot;, +HD, TFT</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek 6739 Quad 1.5GHz, Vi xử l&yacute; l&otilde;i tứ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>1GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8MP (F2.2)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5MP (F2.4)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>16GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Hỗ trợ thẻ nhớ ngo&agrave;i l&ecirc;n đến 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10 (Go edition)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3000mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:22:22', NULL),
(112, 2, 6, 'Samsung E1200 ', '1596655410-product-638180240.jpeg', 349000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>1.5&quot;, QCIF, 128 x 128 pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 MB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 SIM (SIM thường)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Danh bạ:</td>\r\n			<td>1000 số</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Li-Ion, 800 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:23:30', NULL),
(113, 2, 5, 'Samsung Galaxy Z Flip ', '1596655498-product-600175677.jpeg', 36000000, '', '<p>&nbsp;</p>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Ch&iacute;nh: Dynamic AMOLED, phụ: Super AMOLED, 6.7&quot;, Quad HD (2K)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Snapdragon 855+ 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 12 MP &amp; Phụ 12 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>10 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>256GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 eSIM &amp; 1 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3300 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:24:58', NULL),
(114, 2, 6, 'Samsung Galaxy M21 ', '1596655555-product-1999338149.jpeg', 4690000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>Super AMOLED, 6.4&quot;, Full HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Exynos 9611 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 5 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>20 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>6000 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:25:55', NULL),
(115, 2, 6, 'Samsung Galaxy A11 ', '1596655604-product-1634228869.jpeg', 3190000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>PLS TFT LCD, 6.4&quot;, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Snapdragon 450 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 13 MP &amp; Phụ 5 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:26:44', NULL),
(116, 2, 9, 'OPPO Reno3 ', '1596655666-product-1844665564.jpeg', 7490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>AMOLED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Helio P90 8 nh&acirc;n, tối đa 2.2GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>48 MP + 13 MP + 8 MP + 2 MP, 4 camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>44 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Hỗ trợ thẻ nhớ tối đa 256GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Dual nano-SIM + 1 thẻ nhớ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 7, nền tảng Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4G/5G, 802.11 a/b/g/n/ac</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4025mAh (Typ)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:27:46', NULL),
(117, 2, 9, 'OPPO A92 ', '1596655718-product-858765883.jpeg', 6490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>TFT-LCD, 6.5 inch, m&agrave;n h&igrave;nh chấm O, Full HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm&reg; SnapdragonTM 665 8 nh&acirc;n, tối đa 2.0GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>48 MP + 8 MP + 2 MP + 2 MP, 4 camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 7.1, nền tảng Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4G/5.1G/5.8G, 802.11 a/b/g/n/ac</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@120fps, Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000mAh (Typ)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:28:38', NULL),
(118, 2, 9, 'Oppo A1K ', '1596655792-product-1283432043.jpeg', 2390000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.1 inch, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek MT6762 8 nh&acirc;n 64-bit (Helio P22)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Sim Nano</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:29:52', NULL),
(119, 2, 9, 'Oppo A9 2020 ', '1596655845-product-95480791.png', 6190000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>TFT-LCD, 6.5 inch, 1080 x 2340 (HD+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm&reg; SnapdragonTM 665 tối đa 2.0GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 6.0.1, nền tảng Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:30:45', NULL),
(120, 2, 9, 'OPPO Reno2 F ', '1596656283-product-95480791.png', 7490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inches, 1080 x 2340 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Mediatek MT6771V Helio P70 2.1 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>8 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>48 MP, 8 MP + 2MP + 2MP ( 4 camera )</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 6.0.1, nền tảng Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:35:01', '2020-08-06 02:38:03'),
(121, 2, 9, 'Oppo A5 2020 4GB-128GB ', '1596656145-product-2058065927.png', 4450000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inches, 720 x 1600 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm&reg; SnapdragonTM 665, 8, 2.0 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP, 8 MP, 2 MP v&agrave; 2 MP (4 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Dual nano-SIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 6.0.1, nền tảng Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4G/5.1G/5.8G, 802.11 a/b/g/n/ac</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:35:45', NULL),
(123, 2, 9, 'Oppo A31 4GB/128GB ', '1596656250-product-1512679160.jpeg', 4190000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inch 720 x 1600 (HD+)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek Helio P35 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP + 2 MP + 2 MP (3 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Hỗ trợ thẻ nhớ tối đa 256GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 nano SIM + 1 khe thẻ nhớ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4G/5G, 802.11 a/b/g/n/ac</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4230mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:37:30', NULL),
(124, 2, 7, 'Vsmart Active 3 4GB-64GB ', '1596656376-product-625167184.jpeg', 3490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>AMOLED, 6.39&quot;, Full HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek Helio P60 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4020 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:39:36', NULL),
(125, 2, 7, 'Vsmart Active 3 6GB-64GB ', '1596656437-product-1354516902.jpeg', 3990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>AMOLED, 6.39&quot;, Full HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek Helio P60 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>6GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4020 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:40:37', NULL),
(126, 2, 7, 'Vsmart Star 4 3GB-32GB ', '1596656483-product-667897316.jpeg', 2290000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD giọt nước</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8MP AF f/1.9 - Camera chụp thiếu s&aacute;ng, 5MP f/2.2 - Camera g&oacute;c rộng, Chế độ chụp ch&acirc;n dung, AI Beauty</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8MP f/2.0, Chế độ chụp ch&acirc;n dung, Hiệu ứng l&agrave;m đẹp AI Beauty, AR Sticker</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>VOS 3.0 ( Android 10)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 b/g/n, Wi-Fi Hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3500 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:41:23', NULL),
(127, 2, 7, 'Vsmart Star 4 2GB-16GB ', '1596656546-product-563384774.jpeg', 1850000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD giọt nước</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8MP AF f/1.9 - Camera chụp thiếu s&aacute;ng, 5MP f/2.2 - Camera g&oacute;c rộng, Chế độ chụp ch&acirc;n dung, AI Beauty</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8MP f/2.0, Chế độ chụp ch&acirc;n dung, Hiệu ứng l&agrave;m đẹp AI Beauty, AR Sticker</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>16GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>VOS 3.0 ( Android 10)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 b/g/n, Wi-Fi Hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3500 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:42:26', NULL),
(128, 2, 7, 'Vsmart Joy 1+ 2GB/16GB ', '1596656590-product-563384774.jpeg', 2490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.18 inch, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm Snapdragon 430 8 nh&acirc;n 64 bit</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>13 MP v&agrave; 2 MP (2 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>16 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 8.1 (Oreo)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, 2.4Ghz, Wifi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:43:10', '2020-08-06 02:45:36'),
(129, 2, 7, 'Vsmart Star 3 ', '1596656660-product-1825424182.jpeg', 1990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.09&#39;&#39; HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm QM215, 4core, 28nm, 1.3GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2GB (DDR3)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8MP + 5MP, Flash LED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>16 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, tối đa 64GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 nano Sim + 1 Micro SD (3 khe cắm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android P</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4G WIFI; 802.11 b/g/n, Wi-Fi hotspots</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Li-Po 3520mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:44:20', NULL),
(130, 2, 7, 'Vsmart Joy 3 (4GB-64GB) ', '1596656702-product-1473371517.jpeg', 3290000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inchs, HD+(720 x 1600 Pixels)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Snapdragon 632, 8, 1.8GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>13MP f/2.0 &amp; Phụ 8MP f/2.2 + 2MP f/2.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Sim (Nano SIM)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5.000 mAh (Sạc nhanh)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:45:02', NULL),
(131, 2, 7, 'Vsmart Joy 2+ (3+32GB) ', '1596656790-product-1758452436.jpeg', 2490000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.2&quot;, HD+ (720 x 1520)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm Snapdragon 450, 1.8Ghz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>13 MP f/2.0 + 5MP f/2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD 128GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM + 1 MicroSD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 b/g/n, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay phim FullHD 1080p@60fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4500 mAh Li-Po</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:46:30', NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `avatar`, `price`, `summary`, `description`, `status`, `created_at`, `updated_at`) VALUES
(132, 2, 7, 'Vsmart Bee 3 ', '1596656838-product-1361175470.jpeg', 1590000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.0&quot;, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek MT6739WW 4 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>8 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>16 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>3000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:47:18', NULL),
(133, 2, 8, 'Realme C3 3GB/32GB ', '1596656905-product-1842217147.jpeg', 2990000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inchs, 720 x 1560 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Mediatek Helio G70, 8, 2x2.0 GHz Cortex-A75 &amp; 6x1.7 GHz Cortex-A55</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12Mp + 2Mp + 2Mp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>1 Micro SIM, 1 Nano SIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 a/b/g/n, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:48:25', NULL),
(134, 2, 8, 'Realme 6i ', '1596656978-product-542372706.jpeg', 4990000, '', '<p>&nbsp;</p>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.5&quot;, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek Helio G80 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>16 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh, c&oacute; sạc nhanh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 1, '2020-08-05 19:49:38', NULL),
(135, 2, 8, 'Realme C11 ', '1596657030-product-542372706.jpeg', 2960000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5&quot;, LCD, 1600*720, HD+, tỷ lệ hiển thị m&agrave;n h&igrave;nh l&ecirc;n đến 88%, 16.7 triệu m&agrave;u</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Helio G35, Cortex A53, 8 nh&acirc;n 64 bit, xung nhịp l&ecirc;n đến 2.3 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Camera k&eacute;p: Camera ch&iacute;nh: 13MP f/2.2, Camera ch&acirc;n dung: 2MP f/2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5 MP, f/2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Micro SD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2+1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>2.4GHz, 802.1.1b/g/n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Quay video 1080@30fps 720@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>Li-po 5000mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:50:30', NULL),
(136, 2, 8, 'Realme 5 3GB-64GB ', '1596657074-product-732647796.png', 2890000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inchs, 720 x 1600 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm Snapdragon 665 AIE, 8, 2.0GHZ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP, 8 MP, 2 MP v&agrave; 2 MP (4 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>13.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 6.0.1, nền tảng Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 a/b/g/n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:51:14', NULL),
(137, 2, 8, 'Realme C2 2GB-32GB ', '1596657138-product-1777034161.png', 2090000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.1 inches, 1520 x 720 Pixel</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MTK P22, 8, 2.0 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP v&agrave; 2 MP (2 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Nano SIM, 2 Sim</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>Full HD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>4000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:52:18', NULL),
(138, 2, 8, 'Realme 5i 4GB-64GB ', '1596657185-product-1045637889.jpeg', 3690000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.52 inchs, HD +, 720 x 1600 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Qualcomm Snapdragon 665 AIE, 8, 2.0GHZ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12 MP, 8 MP, 2 MP v&agrave; 2 MP (4 camera)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>Nano SIM, 2 ( Sim 2 c&oacute; thể d&ugrave;ng Sim hoặc thẻ nhớ ngo&agrave;i)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>ColorOS 6.0.1, nền tảng Android 9.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:53:05', NULL),
(139, 2, 8, 'Realme 5s ', '1596657228-product-434570273.jpeg', 4390000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.5&quot;, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Snapdragon 665 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>4 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>13 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>128 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:53:48', NULL),
(140, 2, 8, 'Realme 5i 3GB-32GB ', '1596657279-product-1602886629.jpeg', 3290000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>IPS LCD, 6.52&quot;, HD+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>Snapdragon 665 AIE 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>Ch&iacute;nh 12 MP &amp; Phụ 8 MP, 2 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>8 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>MicroSD, hỗ trợ tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM, Hỗ trợ 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 9.0 (Pie)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:54:39', NULL),
(141, 2, 8, 'Realme C3i 2GB-32GB ', '1596657339-product-863625520.jpeg', 2590000, '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh:</td>\r\n			<td>6.5 inchs, HD +, 720 x 1600 Pixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU:</td>\r\n			<td>MediaTek Helio G70, 8, 2.0GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM:</td>\r\n			<td>2 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau:</td>\r\n			<td>12.0 MP + 2.0 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước:</td>\r\n			<td>5 MP, f/2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ trong:</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thẻ nhớ:</td>\r\n			<td>Micro SD 256GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đa sim:</td>\r\n			<td>2 Nano SIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh:</td>\r\n			<td>Android 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi:</td>\r\n			<td>802.11 a/b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim:</td>\r\n			<td>HD 720p@30fps, FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin:</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '2020-08-05 19:55:39', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variant`
--

CREATE TABLE `product_variant` (
  `product_id` int(11) NOT NULL COMMENT 'Id của sản phẩm, là khóa ngoại liên kết với bảng products',
  `variant_value_id` int(11) NOT NULL COMMENT 'Id các giá trị của thuộc tính sản phẩm, là khóa ngoại liên kết với bảng variants_value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_variant`
--

INSERT INTO `product_variant` (`product_id`, `variant_value_id`) VALUES
(1, 1),
(2, 2),
(4, 2),
(5, 4),
(6, 2),
(7, 2),
(11, 2),
(12, 1),
(13, 2),
(14, 2),
(15, 2),
(15, 1),
(8, 2),
(10, 1),
(16, 2),
(17, 1),
(19, 2),
(20, 2),
(21, 1),
(24, 2),
(25, 2),
(27, 2),
(29, 1),
(30, 2),
(32, 1),
(33, 11),
(34, 1),
(35, 12),
(36, 1),
(37, 4),
(38, 4),
(39, 4),
(40, 2),
(41, 4),
(42, 2),
(44, 2),
(45, 4),
(46, 4),
(47, 4),
(48, 13),
(49, 2),
(51, 4),
(52, 4),
(3, 1),
(3, 2),
(18, 1),
(18, 2),
(22, 1),
(22, 2),
(22, 4),
(23, 2),
(23, 1),
(26, 1),
(26, 2),
(26, 14),
(28, 14),
(28, 2),
(31, 2),
(31, 1),
(31, 13),
(54, 2),
(55, 1),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 1),
(61, 2),
(63, 2),
(65, 2),
(66, 1),
(67, 4),
(68, 2),
(69, 1),
(70, 1),
(71, 2),
(72, 1),
(73, 2),
(74, 1),
(75, 2),
(76, 2),
(76, 1),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 15),
(84, 2),
(85, 2),
(96, 2),
(97, 2),
(97, 12),
(97, 17),
(98, 2),
(98, 4),
(98, 12),
(98, 18),
(99, 2),
(99, 4),
(99, 17),
(100, 2),
(100, 4),
(100, 12),
(100, 17),
(101, 2),
(101, 12),
(101, 4),
(102, 17),
(103, 2),
(103, 17),
(104, 2),
(105, 12),
(106, 18),
(106, 12),
(106, 14),
(106, 4),
(107, 18),
(107, 2),
(108, 2),
(109, 2),
(110, 18),
(111, 12),
(112, 2),
(113, 14),
(114, 2),
(115, 2),
(116, 18),
(116, 2),
(117, 18),
(118, 2),
(119, 18),
(64, 2),
(120, 11),
(121, 4),
(123, 4),
(124, 18),
(124, 11),
(125, 2),
(126, 2),
(127, 18),
(128, 2),
(129, 18),
(130, 2),
(131, 18),
(132, 4),
(133, 12),
(134, 11),
(135, 11),
(136, 18),
(137, 18),
(138, 18),
(139, 12),
(140, 11),
(141, 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `image`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, '1597055619-slide-637318262537361581_HPThang8-C1.jfif', '', '', '2020-08-10 10:33:39', '2020-08-10 21:07:33'),
(2, '1597055636-slide-637318263772842638_F-C1_1200x300.jfif', '', '', '2020-08-10 10:33:56', '2020-08-10 21:07:38'),
(3, '1597055657-slide-637318436566343052_F-C1_1200x300.jfif', '', '', '2020-08-10 10:34:17', '2020-08-10 21:07:45'),
(4, '1597055682-slide-637318436810654225_LenovoT8-C1.jfif', '', '', '2020-08-10 10:34:42', '2020-08-10 21:07:49'),
(5, '1597068977-slide-637323897134845142_LaptopOnline-C1.jfif', '', '', '2020-08-10 10:34:48', '2020-08-10 21:16:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `variants`
--

INSERT INTO `variants` (`id`, `name`) VALUES
(1, 'Color'),
(2, 'Size');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variants_value`
--

CREATE TABLE `variants_value` (
  `id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL COMMENT 'Khóa ngoại liên kết với bảng variants',
  `value` varchar(255) NOT NULL COMMENT 'Giá trị của từng thuộc tính sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `variants_value`
--

INSERT INTO `variants_value` (`id`, `variant_id`, `value`) VALUES
(1, 1, 'SILVER'),
(2, 1, 'black'),
(4, 1, 'white'),
(11, 1, 'green'),
(12, 1, 'red'),
(13, 1, 'brown'),
(14, 1, 'pink'),
(15, 1, 'sliver'),
(17, 1, 'yellow'),
(18, 1, 'blue');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_customers` (`customer_id`),
  ADD KEY `fk_orders_members` (`member_id`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD KEY `fk_od_orders` (`order_id`),
  ADD KEY `fk_od_products` (`product_id`),
  ADD KEY `fk_od_variantsValue` (`variant_value_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_brands` (`brand_id`),
  ADD KEY `fk_products_categories` (`category_id`);

--
-- Chỉ mục cho bảng `product_variant`
--
ALTER TABLE `product_variant`
  ADD KEY `fk_pv_products` (`product_id`),
  ADD KEY `fk_pv_variantsValue` (`variant_value_id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `variants_value`
--
ALTER TABLE `variants_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_variantsValue_variants` (`variant_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `variants_value`
--
ALTER TABLE `variants_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_members` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `fk_od_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_od_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_od_variantsValue` FOREIGN KEY (`variant_value_id`) REFERENCES `variants_value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `fk_pv_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pv_variantsValue` FOREIGN KEY (`variant_value_id`) REFERENCES `variants_value` (`id`);

--
-- Các ràng buộc cho bảng `variants_value`
--
ALTER TABLE `variants_value`
  ADD CONSTRAINT `fk_variantsValue_variants` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
