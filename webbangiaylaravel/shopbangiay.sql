-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 22, 2025 lúc 06:33 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbangiay`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `id_danh_gia` int(10) UNSIGNED NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `ten_danh_gia` varchar(255) NOT NULL,
  `danh_gia` varchar(255) NOT NULL,
  `danh_gia_binh_luan` longtext DEFAULT NULL,
  `id_giay` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`id_danh_gia`, `id_user`, `ten_danh_gia`, `danh_gia`, `danh_gia_binh_luan`, `id_giay`, `created_at`, `updated_at`) VALUES
(1, '1', 'Admin', '4.5', 'cũng ok phết', '1', '2022-05-02 08:04:28', '2022-05-02 08:04:28'),
(2, '1', 'Admin', '4.5', 'Kha ok', '2', '2022-05-02 11:09:19', '2022-05-02 11:09:19'),
(3, '2', 'Phan Văn Bằng', '4.5', 'Giá rẻ lại đẹp, nên mua', '2', '2022-05-02 11:18:06', '2022-05-02 11:18:06'),
(4, '2', 'Phan Văn Bằng', '4.5', 'Giá ok, đẹp', '1', '2022-05-02 11:18:27', '2022-05-02 11:18:27'),
(5, '2', 'Phan Văn Bằng', '3', 'Nhìn ok phết, như đi bộ đội luôn :)))', '3', '2022-05-02 11:19:03', '2022-05-02 11:19:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id_don_hang` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `dia_chi_nhan` varchar(255) NOT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL,
  `tong_tien` varchar(255) DEFAULT NULL,
  `hinh_thuc_thanh_toan` varchar(255) NOT NULL,
  `hoa_don` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trang_thai` enum('cho_duyet','dang_giao','da_giao','huy_don') NOT NULL DEFAULT 'cho_duyet',
  `trang_thai_thanh_toan` enum('chua_thanh_toan','da_thanh_toan','dang_cho') NOT NULL DEFAULT 'chua_thanh_toan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id_don_hang`, `user_id`, `ten_nguoi_nhan`, `sdt`, `dia_chi_nhan`, `ghi_chu`, `tong_tien`, `hinh_thuc_thanh_toan`, `hoa_don`, `created_at`, `updated_at`, `trang_thai`, `trang_thai_thanh_toan`) VALUES
(1, 0, 'Admin', '0123456789', 'huế', NULL, '599,400 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:2;a:5:{s:10:\"hinh_anh_1\";s:9:\"giay4.jpg\";s:8:\"ten_giay\";s:12:\"Nike Joma IC\";s:7:\"don_gia\";s:6:\"666000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"10\";}}', '2022-05-02 08:03:32', '2025-09-22 07:18:49', 'da_giao', 'da_thanh_toan'),
(2, 0, 'Admin', '0123456789', 'Thừa Thiên Huế', NULL, '1,020,000 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:1;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay13.jpg\";s:8:\"ten_giay\";s:6:\"NMD R2\";s:7:\"don_gia\";s:7:\"1200000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"15\";}}', '2022-05-02 08:03:59', '2025-09-22 08:08:32', 'da_giao', 'chua_thanh_toan'),
(3, 0, 'Admin', '0123456789', 'huế', NULL, '599,400 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:2;a:5:{s:10:\"hinh_anh_1\";s:9:\"giay4.jpg\";s:8:\"ten_giay\";s:12:\"Nike Joma IC\";s:7:\"don_gia\";s:6:\"666000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"10\";}}', '2022-05-02 11:09:03', '2022-05-02 11:09:03', 'cho_duyet', 'chua_thanh_toan'),
(4, 0, 'Phan Văn Bằng', '0123456788', 'Thừa Thiên Huế', NULL, '2,468,550 VNĐ', 'Sau khi nhận hàng', 'a:3:{i:2;a:5:{s:10:\"hinh_anh_1\";s:9:\"giay4.jpg\";s:8:\"ten_giay\";s:12:\"Nike Joma IC\";s:7:\"don_gia\";s:6:\"666000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"10\";}i:1;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay13.jpg\";s:8:\"ten_giay\";s:6:\"NMD R2\";s:7:\"don_gia\";s:7:\"1200000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"15\";}i:3;a:5:{s:10:\"hinh_anh_1\";s:9:\"giay3.jpg\";s:8:\"ten_giay\";s:19:\"The Nike Premier II\";s:7:\"don_gia\";s:6:\"999000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:2:\"15\";}}', '2022-05-02 11:17:11', '2025-09-22 08:03:00', 'dang_giao', 'chua_thanh_toan'),
(5, 0, 'Admin', '0123456789', '123123', '123132', '1,874,040 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:11;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay17.jpg\";s:8:\"ten_giay\";s:21:\"Run Star Hike Sneaker\";s:7:\"don_gia\";s:6:\"966000\";s:8:\"so_luong\";s:1:\"2\";s:10:\"khuyen_mai\";s:1:\"3\";}}', '2025-09-21 11:38:41', '2025-09-22 08:08:38', 'dang_giao', 'chua_thanh_toan'),
(6, 0, 'Admin', '0123456789', '123123123', NULL, '2,157,300 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:6;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay22.jpg\";s:8:\"ten_giay\";s:17:\"Adidas ALPHAMAGMA\";s:7:\"don_gia\";s:6:\"799000\";s:8:\"so_luong\";i:3;s:10:\"khuyen_mai\";s:2:\"10\";}}', '2025-09-22 02:13:37', '2025-09-22 02:13:37', 'cho_duyet', 'chua_thanh_toan'),
(7, 0, 'Admin', '0123456789', 'adad30s', 'fdfafaaf', '1,216,000 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:12;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay18.jpg\";s:8:\"ten_giay\";s:16:\"Chuck 70 Sneaker\";s:7:\"don_gia\";s:7:\"1280000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:1:\"5\";}}', '2025-09-22 02:18:00', '2025-09-22 02:43:43', 'huy_don', 'chua_thanh_toan'),
(8, 0, 'Admin', '0123456789', 'adad30s', 'fdfafaaf', '1,216,000 VNĐ', 'Sau khi nhận hàng', 'a:1:{i:12;a:5:{s:10:\"hinh_anh_1\";s:10:\"giay18.jpg\";s:8:\"ten_giay\";s:16:\"Chuck 70 Sneaker\";s:7:\"don_gia\";s:7:\"1280000\";s:8:\"so_luong\";s:1:\"1\";s:10:\"khuyen_mai\";s:1:\"5\";}}', '2025-09-22 02:18:00', '2025-09-22 02:43:21', 'da_giao', 'chua_thanh_toan'),
(9, 0, 'Phạm Hoàng Anh Duy', '0906023003', '123123123', '', '1,216,000 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 03:23:24', '2025-09-22 03:23:51', 'huy_don', 'chua_thanh_toan'),
(10, 0, 'Admin', '0123456789', '1234564564654', '', '1,161,000 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 03:43:49', '2025-09-22 07:52:44', 'huy_don', 'chua_thanh_toan'),
(11, 0, 'Phạm Hoàng Anh Duy', '0906023003', '12311321', '', '1,431,000 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 06:17:20', '2025-09-22 06:19:06', 'dang_giao', 'chua_thanh_toan'),
(12, 14, 'Phạm Hoàng Anh Duy', '0906023003', 'asdjaslk;djasd', '', '1,431,000 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 06:59:07', '2025-09-22 06:59:07', 'cho_duyet', 'chua_thanh_toan'),
(13, 14, 'Phạm Hoàng Anh Duy', '0906023003', '1231321321', '', '1,431,000 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 06:59:26', '2025-09-22 06:59:26', 'cho_duyet', 'chua_thanh_toan'),
(14, 1, 'Admin', '0123456789', '1231231321', '', '719,100 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 07:35:57', '2025-09-22 07:35:57', 'cho_duyet', 'chua_thanh_toan'),
(15, 1, 'Admin', '0123456789', '123121', '', '0 VNĐ', 'TPBANK', NULL, '2025-09-22 08:10:51', '2025-09-22 08:10:51', 'cho_duyet', 'chua_thanh_toan'),
(16, 1, 'Admin', '0123456789', '2123132132', '132132', '1,438,200 VNĐ', 'TECHCOMBANK', NULL, '2025-09-22 08:12:13', '2025-09-22 08:13:32', 'da_giao', 'chua_thanh_toan'),
(17, 1, 'Admin', '0123456789', '456456', '456456', '2,157,300 VNĐ', 'Sau khi nhận hàng', NULL, '2025-09-22 08:39:06', '2025-09-22 08:39:06', 'cho_duyet', 'chua_thanh_toan'),
(18, 1, 'Admin', '0123456789', '789798', '', '2,695,500 VNĐ', 'Sau khi nhận hàng', '\"{\\\"7\\\":{\\\"hinh_anh_1\\\":\\\"giay23.jpg\\\",\\\"ten_giay\\\":\\\"Adidas RUNFALCON 2.0\\\",\\\"don_gia\\\":\\\"599000\\\",\\\"so_luong\\\":\\\"5\\\",\\\"khuyen_mai\\\":\\\"10\\\"}}\"', '2025-09-22 08:43:31', '2025-09-22 08:48:29', 'dang_giao', 'chua_thanh_toan'),
(19, 1, 'Admin', '0123456789', '123789', '', '3,648,000 VNĐ', 'Sau khi nhận hàng', '\"{\\\"12\\\":{\\\"hinh_anh_1\\\":\\\"giay18.jpg\\\",\\\"ten_giay\\\":\\\"Chuck 70 Sneaker\\\",\\\"don_gia\\\":\\\"1280000\\\",\\\"so_luong\\\":\\\"3\\\",\\\"khuyen_mai\\\":\\\"5\\\"}}\"', '2025-09-22 08:48:58', '2025-09-22 08:50:02', 'huy_don', 'chua_thanh_toan'),
(20, 1, 'Admin', '0123456789', 'adsasd', 'áddddd', '3,773,700 VNĐ', 'Sau khi nhận hàng', '\"{\\\"7\\\":{\\\"hinh_anh_1\\\":\\\"giay23.jpg\\\",\\\"ten_giay\\\":\\\"Adidas RUNFALCON 2.0\\\",\\\"don_gia\\\":\\\"599000\\\",\\\"so_luong\\\":\\\"7\\\",\\\"khuyen_mai\\\":\\\"10\\\"}}\"', '2025-09-22 08:57:53', '2025-09-22 08:58:47', 'huy_don', 'chua_thanh_toan'),
(21, 1, 'Admin', '0123456789', 'ád456', 'ád415', '666,000 VNĐ', 'Sau khi nhận hàng', '\"{\\\"2\\\":{\\\"hinh_anh_1\\\":\\\"giay4.jpg\\\",\\\"ten_giay\\\":\\\"Nike Joma IC\\\",\\\"don_gia\\\":\\\"666000\\\",\\\"so_luong\\\":\\\"1\\\",\\\"khuyen_mai\\\":\\\"10\\\"}}\"', '2025-09-22 09:13:17', '2025-09-22 09:13:33', 'huy_don', 'chua_thanh_toan'),
(22, 1, 'Admin', '0123456789', 'eqewe12313', 'qewe1121', '666,000 VNĐ', 'Sau khi nhận hàng', '\"{\\\"2\\\":{\\\"hinh_anh_1\\\":\\\"giay4.jpg\\\",\\\"ten_giay\\\":\\\"Nike Joma IC\\\",\\\"don_gia\\\":\\\"666000\\\",\\\"so_luong\\\":\\\"1\\\",\\\"khuyen_mai\\\":\\\"10\\\"}}\"', '2025-09-22 09:22:25', '2025-09-22 09:22:46', 'huy_don', 'chua_thanh_toan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giay`
--

CREATE TABLE `giay` (
  `id_giay` int(10) UNSIGNED NOT NULL,
  `ten_giay` varchar(255) NOT NULL,
  `ten_loai_giay` varchar(255) NOT NULL,
  `ten_thuong_hieu` varchar(255) NOT NULL,
  `mo_ta` longtext DEFAULT NULL,
  `don_gia` varchar(255) NOT NULL,
  `so_luong` varchar(255) DEFAULT NULL,
  `hinh_anh_1` varchar(255) DEFAULT NULL,
  `hinh_anh_2` varchar(255) DEFAULT NULL,
  `hinh_anh_3` varchar(255) DEFAULT NULL,
  `hinh_anh_4` varchar(255) DEFAULT NULL,
  `ten_khuyen_mai` varchar(255) DEFAULT NULL,
  `so_luong_mua` varchar(255) DEFAULT NULL,
  `so_luot_xem` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giay`
--

INSERT INTO `giay` (`id_giay`, `ten_giay`, `ten_loai_giay`, `ten_thuong_hieu`, `mo_ta`, `don_gia`, `so_luong`, `hinh_anh_1`, `hinh_anh_2`, `hinh_anh_3`, `hinh_anh_4`, `ten_khuyen_mai`, `so_luong_mua`, `so_luot_xem`, `created_at`, `updated_at`) VALUES
(1, 'NMD R2', 'Sandanl', 'Gucci', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1200000', '100', 'giay13.jpg', 'giay13.jpg', 'giay13.jpg', 'giay13.jpg', 'Ngày lễ', '2', 29, '2021-11-25 07:59:26', '2022-05-02 11:17:11'),
(2, 'Nike Joma IC', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay4.jpg', 'giay4.jpg', 'giay4.jpg', 'giay4.jpg', 'Mới ra mắt', '5', 11, '2021-11-29 07:59:26', '2025-09-22 09:22:25'),
(3, 'The Nike Premier II', 'Sneaker', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '999000', '100', 'giay3.jpg', 'giay3.jpg', 'giay3.jpg', 'giay3.jpg', 'Ngày lễ', '1', 13, '2021-12-01 10:21:31', '2022-05-02 11:17:11'),
(4, 'Adidas PUREBOOST 21', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1590000', '100', 'giay20.jpg', 'giay20.jpg', 'giay20.jpg', 'giay20.jpg', 'Mới ra mắt', '3', 2, '2021-11-29 07:59:26', '2025-09-22 06:59:26'),
(5, 'Adidas STAN SMITH', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1290000', '100', 'giay21.jpg', 'giay21.jpg', 'giay21.jpg', 'giay21.jpg', 'Mới ra mắt', '1', 2, '2021-12-01 10:21:31', '2025-09-22 03:43:49'),
(6, 'Adidas ALPHAMAGMA', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '799000', '100', 'giay22.jpg', 'giay22.jpg', 'giay22.jpg', 'giay22.jpg', 'Mới ra mắt', '4', 1, '2021-12-01 10:21:31', '2025-09-22 08:39:06'),
(7, 'Adidas RUNFALCON 2.0', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '599000', '85', 'giay23.jpg', 'giay23.jpg', 'giay23.jpg', 'giay23.jpg', 'Mới ra mắt', '2', 0, '2021-11-29 07:59:26', '2025-09-22 08:57:53'),
(8, 'Adidas Tiempo Legend 9', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay2.jpg', 'giay2.jpg', 'giay2.jpg', 'giay2.jpg', 'Ngày lễ', '0', 3, '2021-11-29 07:59:26', '2021-11-29 07:59:26'),
(9, 'Puma One 5.3 TT', 'Thể thao', 'Puma', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '699000', '100', 'giay7.jpg', 'giay7.jpg', 'giay7.jpg', 'giay7.jpg', 'Sale cuối năm', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(11, 'Run Star Hike Sneaker', 'Sneaker', 'Converse', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '966000', '100', 'giay17.jpg', 'giay17.jpg', 'giay17.jpg', 'giay17.jpg', 'Chủ vui nên khuyến mãi', '1', 0, '2021-11-29 07:59:26', '2025-09-21 11:38:41'),
(12, 'Chuck 70 Sneaker', 'Sneaker', 'Converse', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1280000', '97', 'giay18.jpg', 'giay18.jpg', 'giay18.jpg', 'giay18.jpg', 'Sale cuối năm', '4', 1, '2021-12-01 10:21:31', '2025-09-22 08:50:02'),
(13, 'Archive Paint Splatter', 'Sneaker', 'Converse', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1880000', '100', 'giay19.jpg', 'giay19.jpg', 'giay19.jpg', 'giay19.jpg', 'Không khuyễn mãi', '0', 0, '2021-11-29 07:59:26', '2021-11-29 07:59:26'),
(14, 'Nike Top Sala14', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay9.jpg', 'giay9.jpg', 'giay9.jpg', 'giay9.jpg', 'Không khuyễn mãi', '0', 0, '2021-11-25 07:59:26', '2021-11-25 07:59:26'),
(15, 'Nike ACE Tango', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '599000', '100', 'giay6.jpg', 'giay6.jpg', 'giay6.jpg', 'giay6.jpg', 'Mới ra mắt', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(16, 'Adidas Mercurial', 'Sandanl', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay15.jpg', 'giay15.jpg', 'giay15.jpg', 'giay15.jpg', 'Ngày lễ', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(17, 'Nike FC', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1100000', '100', 'giay8.jpg', 'giay8.jpg', 'giay8.jpg', 'giay8.jpg', 'Ngày lễ', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(18, 'Adidas X Tango 17.1 FG', 'Sneaker', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay5.jpg', 'giay5.jpg', 'giay5.jpg', 'giay5.jpg', 'Không khuyễn mãi', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(19, 'Superstar KB', 'Thể thao', 'Vans', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1350000', '100', 'giay10.jpg', 'giay10.jpg', 'giay10.jpg', 'giay10.jpg', 'Sale cuối năm', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(20, 'Superstar J', 'Sandanl', 'Vans', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1290000', '100', 'giay11.jpg', 'giay11.jpg', 'giay11.jpg', 'giay11.jpg', 'Ngày lễ', '0', 0, '2021-11-25 07:59:26', '2021-11-25 07:59:26'),
(21, 'Nike Tiempo Legend', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '1990000', '100', 'giay4.jpg', 'giay4.jpg', 'giay4.jpg', 'giay4.jpg', 'Ngày lễ', '0', 0, '2021-11-24 07:59:26', '2021-11-24 07:59:26'),
(22, 'ADIDAS X Speedflow', 'Thể thao', 'Adidas', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay12.jpg', 'giay12.jpg', 'giay12.jpg', 'giay12.jpg', 'Sale cuối năm', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(23, 'Jung 96', 'Thể thao', 'New Balance', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '899000', '100', 'giay14.jpg', 'giay14.jpg', 'giay14.jpg', 'giay14.jpg', 'Sale cuối năm', '0', 0, '2021-12-01 10:21:31', '2021-12-01 10:21:31'),
(24, 'Mercurial Superfly', 'Sneaker', 'Balenciaga', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!&nbsp;</p>', '666000', '100', 'giay6.jpg', 'giay6.jpg', 'giay6.jpg', 'giay6.jpg', 'Chủ vui nên khuyến mãi', '0', 0, '2021-11-24 07:59:26', '2021-11-24 07:59:26'),
(31, 'Nike Black Pice 99', 'Thể thao', 'Nike', '<p>✔️ Đế giày được thiết kế chịu ma sát tốt, tăng chiều cao, nhẹ, êm, cân bằng và thoáng khí.&nbsp;</p><p>✔️ Kiểu dáng hottrend của năm nay.&nbsp;</p><p>✔️ Giày đẹp, nhẹ, bền. Có thể làm giày cặp, giày nhóm. Thích hợp đi chơi, chạy bộ, gym, đi học, đi làm...&nbsp;</p><p>✔️ Đế cao su bền chắc, có độ bám cao.</p><p>✔️ Mẫu mới nhất hiện nay mang êm chân thời trang cá tính.&nbsp;</p><p>✔️ Dễ dàng kết hợp với hầu hết các phong cách thời trang như: đi học, đi chơi, đi du lịch. Giày đôi, giày nhóm...</p><p>✔️ Có thể kết hợp với váy, jeans, sooc…. Đều phù hợp!!</p>', '550000', '222', 'giay1.jpg', 'giay1.jpg', 'giay1.jpg', 'giay1.jpg', 'Mới ra mắt', '0', 0, '2022-05-03 10:13:28', '2022-05-03 10:13:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyen_mai`
--

CREATE TABLE `khuyen_mai` (
  `id_khuyen_mai` int(10) UNSIGNED NOT NULL,
  `ten_khuyen_mai` varchar(255) NOT NULL,
  `gia_tri_khuyen_mai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khuyen_mai`
--

INSERT INTO `khuyen_mai` (`id_khuyen_mai`, `ten_khuyen_mai`, `gia_tri_khuyen_mai`) VALUES
(1, 'Không khuyễn mãi', '0'),
(2, 'Ngày lễ', '15'),
(3, 'Mới ra mắt', '10'),
(4, 'Sale cuối năm', '5'),
(5, 'Chủ vui nên khuyến mãi', '3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_giay`
--

CREATE TABLE `loai_giay` (
  `id_loai_giay` int(10) UNSIGNED NOT NULL,
  `ten_loai_giay` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_giay`
--

INSERT INTO `loai_giay` (`id_loai_giay`, `ten_loai_giay`, `created_at`, `updated_at`) VALUES
(1, 'Thể thao', NULL, NULL),
(2, 'Sandanl', NULL, NULL),
(3, 'Sneaker', NULL, NULL),
(4, 'Boots', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_02_024954_create_sessions_table', 1),
(6, '2021_11_15_125359_giay_table', 1),
(7, '2021_11_15_125523_loai_giay_table', 1),
(8, '2021_11_15_125541_thuong_hieu_table', 1),
(9, '2021_11_16_082748_khuyen_mai_table', 1),
(10, '2021_11_16_101507_phan_quyen_table', 1),
(11, '2021_11_21_025722_create_don_hang_table', 1),
(12, '2021_12_02_143926_create_danh_gia_table', 1),
(14, '2021_12_03_143926_add_trang_thai_don_hang_table', 2),
(15, '2025_09_22_145757_add_trang_thai_thanh_toan_v2_to_don_hang_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_quyen`
--

CREATE TABLE `phan_quyen` (
  `id_phan_quyen` int(10) UNSIGNED NOT NULL,
  `ten_phan_quyen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_quyen`
--

INSERT INTO `phan_quyen` (`id_phan_quyen`, `ten_phan_quyen`) VALUES
(1, 'Quản trị viên'),
(2, 'Người dùng'),
(3, 'Nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kkXt3gvrDTMgsDP4vlDE6teHaxZYPAUSCTZD6Nub', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid0xtdkVoVlJuY1Rjblo4eTUxRTIwdnZUR2xzUHJRVXJ6T1QwR1lUeSI7czo4OiJnaW9faGFuZyI7YToyOntpOjI7YTo1OntzOjI6ImlkIjtOO3M6ODoidGVuX2dpYXkiO3M6MTI6Ik5pa2UgSm9tYSBJQyI7czo3OiJkb25fZ2lhIjtzOjY6IjY2NjAwMCI7czo4OiJzb19sdW9uZyI7aToxO3M6MTA6ImhpbmhfYW5oXzEiO3M6OToiZ2lheTQuanBnIjt9aToxMjthOjU6e3M6MTA6ImhpbmhfYW5oXzEiO3M6MTA6ImdpYXkxOC5qcGciO3M6ODoidGVuX2dpYXkiO3M6MTY6IkNodWNrIDcwIFNuZWFrZXIiO3M6NzoiZG9uX2dpYSI7czo3OiIxMjgwMDAwIjtzOjg6InNvX2x1b25nIjtzOjE6IjEiO3M6MTA6ImtodXllbl9tYWkiO3M6MToiNSI7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2N1YS1oYW5nL3RodW9uZ2hpZXU9TmlrZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToiY2hlY2siO3M6MToiMSI7czo5OiJkYW5oX2dpYXMiO2E6NTp7aTo0O2E6NTp7czoxMDoiaGluaF9hbmhfMSI7czoxMDoiZ2lheTIwLmpwZyI7czo4OiJ0ZW5fZ2lheSI7czoxOToiQWRpZGFzIFBVUkVCT09TVCAyMSI7czo3OiJkb25fZ2lhIjtzOjc6IjE1OTAwMDAiO3M6ODoic29fbHVvbmciO3M6MToiMSI7czoxMDoia2h1eWVuX21haSI7czoyOiIxMCI7fWk6NjthOjU6e3M6MTA6ImhpbmhfYW5oXzEiO3M6MTA6ImdpYXkyMi5qcGciO3M6ODoidGVuX2dpYXkiO3M6MTc6IkFkaWRhcyBBTFBIQU1BR01BIjtzOjc6ImRvbl9naWEiO3M6NjoiNzk5MDAwIjtzOjg6InNvX2x1b25nIjtpOjM7czoxMDoia2h1eWVuX21haSI7czoyOiIxMCI7fWk6NzthOjU6e3M6MTA6ImhpbmhfYW5oXzEiO3M6MTA6ImdpYXkyMy5qcGciO3M6ODoidGVuX2dpYXkiO3M6MjA6IkFkaWRhcyBSVU5GQUxDT04gMi4wIjtzOjc6ImRvbl9naWEiO3M6NjoiNTk5MDAwIjtzOjg6InNvX2x1b25nIjtzOjE6IjciO3M6MTA6ImtodXllbl9tYWkiO3M6MjoiMTAiO31pOjEyO2E6NTp7czoxMDoiaGluaF9hbmhfMSI7czoxMDoiZ2lheTE4LmpwZyI7czo4OiJ0ZW5fZ2lheSI7czoxNjoiQ2h1Y2sgNzAgU25lYWtlciI7czo3OiJkb25fZ2lhIjtzOjc6IjEyODAwMDAiO3M6ODoic29fbHVvbmciO3M6MToiMyI7czoxMDoia2h1eWVuX21haSI7czoxOiI1Ijt9aToyO2E6NTp7czoxMDoiaGluaF9hbmhfMSI7czo5OiJnaWF5NC5qcGciO3M6ODoidGVuX2dpYXkiO3M6MTI6Ik5pa2UgSm9tYSBJQyI7czo3OiJkb25fZ2lhIjtzOjY6IjY2NjAwMCI7czo4OiJzb19sdW9uZyI7czoxOiIxIjtzOjEwOiJraHV5ZW5fbWFpIjtzOjI6IjEwIjt9fXM6ODoiRGFuZ05oYXAiO2k6MTt9', 1758558546);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuong_hieu`
--

CREATE TABLE `thuong_hieu` (
  `id_thuong_hieu` int(10) UNSIGNED NOT NULL,
  `ten_thuong_hieu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thuong_hieu`
--

INSERT INTO `thuong_hieu` (`id_thuong_hieu`, `ten_thuong_hieu`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Converse'),
(4, 'Gucci'),
(5, 'Puma'),
(6, 'Vans'),
(7, 'New Balance'),
(8, 'Balenciaga');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten_nguoi_dung` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `Ten_dang_nhap` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_phan_quyen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `ten_nguoi_dung`, `email`, `sdt`, `Ten_dang_nhap`, `password`, `id_phan_quyen`) VALUES
(1, 'Admin', 'admin@gmail.com', '0123456789', 'admin', '$2y$10$SqPrRKfIpryuVTt3zmFYT.e6QD5t.yAiNAHO0KKkWt9LynVBbkvv2', '1'),
(14, 'Phạm Hoàng Anh Duy', 'phad30@gmail.com', '0906023003', 'phad30', '$2y$10$t2zQVPXBIPIdXBGd.fyoouO2MAl8vXdYeRGCO.wb3BC6ZujHoSErS', '2'),
(15, 'Đào Ngọc Duy', 'duynguu2005@gmail.com', '123456789', 'ngocduy1', '$2y$10$cd9NVWlP/LXRgAxF8D5l5ed.aTTqfyazcZvYLzRTA/l1mElpfS9.y', '3');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`id_danh_gia`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id_don_hang`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `giay`
--
ALTER TABLE `giay`
  ADD PRIMARY KEY (`id_giay`);

--
-- Chỉ mục cho bảng `khuyen_mai`
--
ALTER TABLE `khuyen_mai`
  ADD PRIMARY KEY (`id_khuyen_mai`);

--
-- Chỉ mục cho bảng `loai_giay`
--
ALTER TABLE `loai_giay`
  ADD PRIMARY KEY (`id_loai_giay`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `phan_quyen`
--
ALTER TABLE `phan_quyen`
  ADD PRIMARY KEY (`id_phan_quyen`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `thuong_hieu`
--
ALTER TABLE `thuong_hieu`
  ADD PRIMARY KEY (`id_thuong_hieu`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_ten_dang_nhap_unique` (`Ten_dang_nhap`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `id_danh_gia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id_don_hang` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giay`
--
ALTER TABLE `giay`
  MODIFY `id_giay` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `khuyen_mai`
--
ALTER TABLE `khuyen_mai`
  MODIFY `id_khuyen_mai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loai_giay`
--
ALTER TABLE `loai_giay`
  MODIFY `id_loai_giay` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phan_quyen`
--
ALTER TABLE `phan_quyen`
  MODIFY `id_phan_quyen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `thuong_hieu`
--
ALTER TABLE `thuong_hieu`
  MODIFY `id_thuong_hieu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
