-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 13, 2023 lúc 12:15 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cauhinhwebsite`
--

CREATE TABLE `cauhinhwebsite` (
  `id` int(11) NOT NULL,
  `codeCauHinh` varchar(500) DEFAULT NULL,
  `anhCauHinh` varchar(500) DEFAULT NULL,
  `giaTri` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cauhinhwebsite`
--

INSERT INTO `cauhinhwebsite` (`id`, `codeCauHinh`, `anhCauHinh`, `giaTri`, `slug`) VALUES
(1, 'logo-desktop', '/img/logo.png', '', '/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `tenDanhMuc` varchar(500) DEFAULT NULL,
  `avatarDanhMuc` varchar(500) DEFAULT NULL,
  `soLuongSanPham` int(11) DEFAULT NULL,
  `slug` varchar(500) NOT NULL,
  `loaiDanhMuc` varchar(500) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tenDanhMuc`, `avatarDanhMuc`, `soLuongSanPham`, `slug`, `loaiDanhMuc`, `parentId`) VALUES
(1, 'Thời trang quý ông', 'http://dummyimage.com/250x300.png/cc0000/ffffff', 95, 'thoi-trang-nam', 'shop', NULL),
(2, 'Thời trang nữ', 'http://dummyimage.com/250x300.png/5fa2dd/ffffff', 73, 'thoi-trang-nu', 'shop', NULL),
(3, 'Thời trang trẻ em', 'http://dummyimage.com/250x300.png/dddddd/000000', 34, 'thoi-trang-tre-em', 'shop', NULL),
(4, 'Phụ kiện', 'http://dummyimage.com/250x300.png/dddddd/000000', 13, 'phu-kien', 'shop', NULL),
(5, 'Áo Vest', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'thoi-trang-nam--ao-vest', 'shop', 1),
(6, 'Áo Jacket', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'thoi-trang-nam--ao-jacket', 'shop', 1),
(7, 'Váy dạ hội', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'thoi-trang-nu--vay-da-hoi', 'shop', 2),
(8, 'Váy công sở', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'thoi-trang-nu--vay-cong-so', 'shop', 2),
(9, 'Hàng mới về', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'hang-moi-ve', 'trang-chu', NULL),
(10, 'Bán chạy', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'ban-chay', 'trang-chu', NULL),
(11, 'Phổ biến', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'pho-bien', 'trang-chu', NULL),
(12, 'Yêu thích', 'http://dummyimage.com/250x300.png/dddddd/000000', 20, 'yeu-thich', 'trang-chu', NULL),
(13, 'Chăm sóc sắc đẹp', 'http://dummyimage.com/250x300.png/cc0000/ffffff', 95, 'cham-soc-sac-dep', 'shop', NULL),
(14, 'Hàng nam mùa Hè', 'http://dummyimage.com/250x300.png/cc0000/ffffff', 95, 'hang-moi-ve--hang-nam-mua-he', 'trang-chu', 9),
(15, 'Hàng nữ mùa Hè', 'http://dummyimage.com/250x300.png/cc0000/ffffff', 95, 'hang-moi-ve--hang-nữ-mua-he', 'trang-chu', 9),
(16, 'Đồ bơi', 'http://dummyimage.com/250x300.png/cc0000/ffffff', 95, 'hang-moi-ve--do-boi', 'trang-chu', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `tenMenu` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `viTri` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `tenMenu`, `slug`, `parentId`, `viTri`) VALUES
(1, 'Home', '/', NULL, 'nav-bar'),
(2, 'Nam', '/thoi-trang-nam', NULL, 'nav-bar'),
(3, 'Nữ', '/thoi-trang-nu', NULL, 'nav-bar'),
(4, 'Trẻ em', '/thoi-trang-tre-em', NULL, 'nav-bar'),
(5, 'Phụ kiện', '/phu-kien', NULL, 'nav-bar'),
(6, 'Giới thiệu', '/gioi-thieu', NULL, 'nav-bar'),
(7, 'Liên hệ', '/lien-he', NULL, 'nav-bar'),
(8, 'Áo vest', '/thoi-trang-nam--ao-vest', 2, 'nav-bar'),
(9, 'Áo Jacket', '/thoi-trang-nam--ao-jacket', 2, 'nav-bar'),
(10, 'Váy dạ hội', '/thoi-trang-nu--vay-da-hoi', 3, 'nav-bar'),
(11, 'Váy công sở', '/thoi-trang-nu--vay-cong-so', 3, 'nav-bar');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tenSanPham` varchar(500) DEFAULT NULL,
  `avatarSanPham` varchar(500) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `giaTien` decimal(10,0) DEFAULT NULL,
  `tag` varchar(500) DEFAULT NULL,
  `thuongHieu` varchar(500) DEFAULT NULL,
  `moTa` varchar(500) DEFAULT NULL,
  `danhSachMau` varchar(500) DEFAULT NULL,
  `danhSachSize` varchar(500) DEFAULT NULL,
  `danhSachKhuyenMai` varchar(500) DEFAULT NULL,
  `danhSachAnh` varchar(500) DEFAULT NULL,
  `thongTinChiTiet` text DEFAULT NULL,
  `thongSoKyThuat` text DEFAULT NULL,
  `slug` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tenSanPham`, `avatarSanPham`, `rating`, `giaTien`, `tag`, `thuongHieu`, `moTa`, `danhSachMau`, `danhSachSize`, `danhSachKhuyenMai`, `danhSachAnh`, `thongTinChiTiet`, `thongSoKyThuat`, `slug`) VALUES
(1, 'Veal - Nuckle', 'http://dummyimage.com/600x200.png/dddddd/000000', 3, 106, 'New', 'Axe', 'demo mô tả', 'red', 'm', 'Money Back', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#547467'),
(2, 'Container - Hngd Cll Blk 7x7x3', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 1, 120, 'Sale', 'Dexamethasone Sodium Phosphate', 'demo mô tả', 'red', 'm', 'Free Ship', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#6ce64c'),
(3, 'Cabbage - Red', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 4, 129, 'New', 'ACT Total Care Sensitive Anticavity Mint Mouth', 'demo mô tả', 'pink', 'l', 'Free Ship', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#f931bb'),
(4, 'Nut - Cashews, Whole, Raw', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 1, 162, 'Sale', 'Glimepiride', 'demo mô tả', 'green', 'xl', 'Money Back', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#65e688'),
(5, 'Bread - Rolls, Rye', 'http://dummyimage.com/600x200.png/ff4444/ffffff', 5, 66, 'Sale', 'Levetiracetam', 'demo mô tả', 'red', 'xl', 'Free Ship', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#691fcf'),
(6, 'Quiche Assorted', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 5, 185, 'New', 'Ampicillin and Sulbactam', 'demo mô tả', 'blue', 'x', 'Money Back', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#9239d4'),
(7, 'Cheese - Parmesan Cubes', 'http://dummyimage.com/600x200.png/dddddd/000000', 5, 82, 'Out Of Stock', 'Quinapril', 'demo mô tả', 'red', 'm', 'Free Ship', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#b4a9c8'),
(8, 'Cranberries - Fresh', 'http://dummyimage.com/600x200.png/dddddd/000000', 1, 196, 'New', 'Glipizide', 'demo mô tả', 'blue', 'x', 'Free Ship', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#169d0f'),
(9, 'Mikes Hard Lemonade', 'http://dummyimage.com/600x200.png/dddddd/000000', 3, 51, 'Sale', 'Oxybutynin Chloride', 'demo mô tả', 'orange', 'x', 'Money Back', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#eebdf1'),
(10, 'Cake - Lemon Chiffon', 'http://dummyimage.com/600x200.png/ff4444/ffffff', 2, 168, 'Out Of Stock', 'Berberis Viscum', 'demo mô tả', 'blue', 'xl', 'Money Back', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#67d4f2'),
(11, 'Vinegar - Balsamic', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 1, 165, 'Sale', 'Metoclopramide Hydrochloride', 'demo mô tả', 'pink', 'm', 'Money Back', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#e4ba0d'),
(12, 'Cabbage Roll', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 1, 103, 'Out Of Stock', 'DG Ice Cold Analgesic', 'demo mô tả', 'green', 'xxl', 'Free Ship', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#ac37f2'),
(13, 'Leeks - Baby, White', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 2, 150, 'Sale', 'Diclofenac Sodium', 'demo mô tả', 'blue', 'm', 'Free Ship', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#f268ea'),
(14, 'Pasta - Penne Primavera, Single', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 2, 159, 'New', 'Gabapentin', 'demo mô tả', 'green', 'xxl', 'Free Ship', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#21aa12'),
(15, 'Silicone Paper 16.5x24', 'http://dummyimage.com/600x200.png/dddddd/000000', 4, 123, 'New', 'Parlodel', 'demo mô tả', 'red', 'x', 'Money Back', 'http://dummyimage.com/600x200.png/dddddd/000000', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#943cab'),
(16, 'Seaweed Green Sheets', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 2, 128, 'New', 'Ranitidine', 'demo mô tả', 'blue', 'm', 'Money Back', 'http://dummyimage.com/600x200.png/5fa2dd/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#bab164'),
(17, 'Pepper - Chipotle, Canned', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 1, 120, 'Out Of Stock', 'Ranitidine Hydrochloride', 'demo mô tả', 'pink', 'l', 'Free Ship', 'http://dummyimage.com/600x200.png/ff4444/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#9c830b'),
(18, 'Oil - Food, Lacquer Spray', 'http://dummyimage.com/600x200.png/dddddd/000000', 3, 123, 'Out Of Stock', 'Diphenhydramine Hydrochloride', 'demo mô tả', 'pink', 'xl', 'Money Back', 'http://dummyimage.com/600x200.png/ff4444/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#b850a8'),
(19, 'Pepper - Red, Finger Hot', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 3, 63, 'Sale', 'Degree', 'demo mô tả', 'red', 'xxl', 'Money Back', 'http://dummyimage.com/600x200.png/ff4444/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#900b61'),
(20, 'Lamb - Whole, Frozen', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 1, 104, 'Sale', 'Ciprofloxacin', 'demo mô tả', 'green', 'l', 'Free Ship', 'http://dummyimage.com/600x200.png/cc0000/ffffff', 'demo thông tin chi tiết', 'demo thông số kỹ thuật', '#76fd69');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphamtrongdanhmuc`
--

CREATE TABLE `sanphamtrongdanhmuc` (
  `id` int(11) NOT NULL,
  `danhMuc_id` int(11) DEFAULT NULL,
  `sanPham_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphamtrongdanhmuc`
--

INSERT INTO `sanphamtrongdanhmuc` (`id`, `danhMuc_id`, `sanPham_id`) VALUES
(1, 12, 1),
(2, 5, 16),
(3, 1, 16),
(4, 10, 20),
(5, 5, 5),
(6, 12, 10),
(7, 12, 5),
(8, 12, 10),
(9, 1, 5),
(10, 12, 8),
(11, 11, 11),
(12, 1, 19),
(13, 1, 18),
(14, 1, 3),
(15, 8, 20),
(16, 5, 3),
(17, 7, 7),
(18, 3, 16),
(19, 8, 7),
(20, 12, 14),
(21, 5, 5),
(22, 12, 12),
(23, 7, 14),
(24, 7, 1),
(25, 3, 20),
(26, 2, 19),
(27, 6, 18),
(28, 1, 4),
(29, 8, 13),
(30, 3, 7),
(31, 1, 14),
(32, 1, 14),
(33, 4, 4),
(34, 3, 7),
(35, 9, 8),
(36, 4, 16),
(37, 6, 2),
(38, 7, 10),
(39, 7, 10),
(40, 6, 19),
(41, 10, 18),
(42, 6, 18),
(43, 12, 8),
(44, 10, 20),
(45, 11, 5),
(46, 6, 4),
(47, 12, 6),
(48, 9, 10),
(49, 1, 16),
(50, 12, 5),
(51, 9, 2),
(52, 6, 1),
(53, 10, 19),
(54, 9, 14),
(55, 4, 17),
(56, 6, 8),
(57, 2, 16),
(58, 12, 13),
(59, 7, 14),
(60, 8, 5),
(61, 1, 9),
(62, 5, 11),
(63, 7, 9),
(64, 6, 6),
(65, 10, 2),
(66, 7, 2),
(67, 10, 18),
(68, 3, 15),
(69, 12, 4),
(70, 9, 11),
(71, 12, 17),
(72, 3, 12),
(73, 6, 19),
(74, 10, 2),
(75, 12, 12),
(76, 9, 6),
(77, 10, 12),
(78, 5, 15),
(79, 12, 1),
(80, 7, 6),
(81, 10, 5),
(82, 12, 18),
(83, 8, 13),
(84, 6, 19),
(85, 9, 13),
(86, 7, 12),
(87, 1, 3),
(88, 12, 5),
(89, 4, 14),
(90, 2, 12),
(91, 7, 18),
(92, 7, 11),
(93, 2, 7),
(94, 10, 9),
(95, 7, 14),
(96, 11, 18),
(97, 1, 2),
(98, 9, 5),
(99, 3, 2),
(100, 9, 3),
(101, 15, 2),
(102, 14, 20),
(103, 14, 7),
(104, 15, 19),
(105, 14, 20),
(106, 14, 15),
(107, 14, 3),
(108, 14, 4),
(109, 14, 17),
(110, 14, 13),
(111, 15, 5),
(112, 14, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `code` varchar(500) DEFAULT NULL,
  `tieuDe1` varchar(500) DEFAULT NULL,
  `tieuDe2` varchar(500) DEFAULT NULL,
  `anhSlide` varchar(500) DEFAULT NULL,
  `soThuTu` int(11) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `code`, `tieuDe1`, `tieuDe2`, `anhSlide`, `soThuTu`, `slug`) VALUES
(1, 'slide_khoi_giua_trang_chu', 'Librarian', 'Ceratotherium simum', 'http://dummyimage.com/1020x1960.png/cc0000/ffffff', 1, '#7ce8dc'),
(2, 'slide_khoi_giua_trang_chu', 'Research Nurse', 'Funambulus pennati', 'http://dummyimage.com/1020x1960.png/cc0000/ffffff', 2, '#9e57b4'),
(3, 'slide_khoi_giua_trang_chu', 'Social Worker', 'Nucifraga columbiana', 'http://dummyimage.com/1020x1960.png/ff4444/ffffff', 3, '#1242ba'),
(4, 'slide_khoi_giua_trang_chu', 'Editor', 'Zosterops pallidus', 'http://dummyimage.com/1020x1960.png/ff4444/ffffff', 4, '#8c6ff5');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cauhinhwebsite`
--
ALTER TABLE `cauhinhwebsite`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `sanphamtrongdanhmuc`
--
ALTER TABLE `sanphamtrongdanhmuc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanPhamTrongDanhMuc_fk0` (`danhMuc_id`),
  ADD KEY `sanPhamTrongDanhMuc_fk1` (`sanPham_id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cauhinhwebsite`
--
ALTER TABLE `cauhinhwebsite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `sanphamtrongdanhmuc`
--
ALTER TABLE `sanphamtrongdanhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanphamtrongdanhmuc`
--
ALTER TABLE `sanphamtrongdanhmuc`
  ADD CONSTRAINT `sanPhamTrongDanhMuc_fk0` FOREIGN KEY (`danhMuc_id`) REFERENCES `danhmuc` (`id`),
  ADD CONSTRAINT `sanPhamTrongDanhMuc_fk1` FOREIGN KEY (`sanPham_id`) REFERENCES `sanpham` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
