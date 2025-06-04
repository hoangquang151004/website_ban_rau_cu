-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2025 lúc 06:52 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbanrau`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `maDonHang` int(11) NOT NULL,
  `tenTaiKhoan` varchar(50) NOT NULL,
  `maSanPham` int(11) NOT NULL,
  `soLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`maDonHang`, `tenTaiKhoan`, `maSanPham`, `soLuong`) VALUES
(5, 'user01', 1, 1),
(5, 'user01', 2, 1),
(6, 'user02', 2, 2),
(6, 'user02', 3, 1),
(6, 'user02', 4, 1),
(7, 'user02', 1, 2),
(7, 'user02', 2, 2),
(8, 'user01', 1, 1),
(9, 'user01', 1, 1),
(9, 'user01', 2, 1),
(10, 'user01', 1, 1),
(10, 'user01', 2, 1),
(11, 'user01', 1, 1),
(12, 'user01', 1, 1),
(12, 'user01', 2, 1),
(12, 'user01', 3, 1),
(13, 'user01', 1, 1),
(14, 'user02', 2, 1),
(14, 'user02', 3, 1),
(14, 'user02', 4, 1),
(15, 'user03', 3, 1),
(15, 'user03', 4, 1),
(15, 'user03', 6, 2),
(16, 'user01', 6, 1),
(17, 'user01', 6, 1),
(18, 'user01', 1, 1),
(19, 'user04', 3, 1),
(20, 'user04', 3, 1),
(21, 'user04', 3, 2),
(21, 'user04', 4, 1),
(22, 'quang', 1, 1),
(22, 'quang', 2, 1),
(22, 'quang', 3, 1),
(22, 'quang', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `maDonHang` int(11) NOT NULL,
  `tenTaiKhoan` varchar(50) DEFAULT NULL,
  `ngayDat` date DEFAULT NULL,
  `soDienThoaiNhan` varchar(15) DEFAULT NULL,
  `diaChiGiao` varchar(250) DEFAULT NULL,
  `trangThai` varchar(50) DEFAULT 'Đang Giao Hàng',
  `ghiChu` varchar(250) DEFAULT NULL,
  `phuongThucTT` varchar(250) DEFAULT NULL,
  `tongTien` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`maDonHang`, `tenTaiKhoan`, `ngayDat`, `soDienThoaiNhan`, `diaChiGiao`, `trangThai`, `ghiChu`, `phuongThucTT`, `tongTien`) VALUES
(1, NULL, '2025-05-31', '0999988121', 'Thanh Hoas', NULL, 'asd', 'ck', 1629899),
(2, NULL, '2025-05-31', '', '', NULL, '', 'ck', 1629899),
(3, NULL, '2025-05-31', 'Ã¡da', 'Thanh Hoas', NULL, 't se bom', 'ck', 1599899),
(4, NULL, '2025-05-31', 'Ã¡da', 'Thanh Hoas', NULL, 'hihakk', 'tm', 1479899),
(5, 'user01', '2025-05-31', '01234123213', 'Thanh hóa rau má ', 'Đã hủy', 'Bán con cá rô đồng', 'ck', 1389899),
(6, 'user02', '2025-05-31', '0999988121', 'Thanh hoa', NULL, 'hehe123456', 'ck', 312000),
(7, 'user02', '2025-05-31', '0999988121', 'Thanh hoa 2', NULL, '12354123', 'ck', 2779798),
(8, 'user01', '2025-05-31', '0999988121', 'Thanh hoa 2', 'Đã giao hàng', '123412', 'ck', 1299899),
(9, 'user01', '2025-05-31', '0999988121', 'Thanh hoa 2', 'Đang giao hàng', '123412', 'ck', 1389899),
(10, 'user01', '2025-05-31', '0999988121', 'Thanh hoa 2', NULL, '123', 'ck', 1389899),
(11, 'user01', '2025-05-31', '0999988121', 'Thanh hoa 2', NULL, '123', 'ck', 1299899),
(12, 'user01', '2025-05-31', '123', '123', NULL, '123', 'ck', 1509899),
(13, 'user01', '2025-05-31', '123', '123', NULL, '123', 'ck', 1299899),
(14, 'user02', '2025-05-31', '9999123412', 'Ha gianhg', NULL, 'Twest thoi', 'ck', 222000),
(15, 'user03', '2025-05-31', '123456123', 'Khu 01', 'Đang Giao Hàng', 'asdasd', 'ck', 552000),
(16, 'user01', '2025-05-31', '123', 'Hà Nội xỉn', 'Đã hủy', 'Đây là 1 đơn hàng đến từ 1 boi phố', 'ck', 210000),
(17, 'user01', '2025-05-31', '123', 'Thanh Hoas', 'Đang Giao Hàng', '123', 'ck', 210000),
(18, 'user01', '2025-05-31', '123', '123', 'Đang Giao Hàng', '123', 'ck', 1299899),
(19, 'user04', '2025-06-03', '0123321123', 'HÃ  Giang', 'Đang Giao Hàng', 'Hehe t sáº½ bom hÃ ng', 'ck', 12000),
(20, 'user04', '2025-06-03', '0123321123', 'HÃ  Giang', 'Đang Giao Hàng', 't sáº½ bom hÃ ng haha ', 'ck', 120000),
(21, 'user04', '2025-06-04', '0123321123', 'Hà giang', 'Đã giao hàng', 'Tôi sẽ bom hàng haha', 'ck', 25200),
(22, 'quang', '2025-06-04', '0812331231', 'Mỹ đình 2, Nam Từ Liên, Hà Nội', 'Đang Giao Hàng', 'Giao nhanh giúp tôi để tôi cúng cô hồn nhé hehe', 'ck', 35000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `maSanPham` int(11) NOT NULL,
  `tenSanPham` varchar(50) DEFAULT NULL,
  `giaSanPham` double DEFAULT NULL,
  `loaiSanPham` varchar(50) DEFAULT NULL,
  `moTa` text DEFAULT NULL,
  `xuatXu` varchar(50) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `anhSanPham` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`maSanPham`, `tenSanPham`, `giaSanPham`, `loaiSanPham`, `moTa`, `xuatXu`, `soLuong`, `anhSanPham`) VALUES
(1, 'Xoài tiền giang', 12800, 'qua', 'Ha chung quốc', 'Nhật bản', 99, '1748493762097_xoai.jpg'),
(2, 'dứa', 9000, 'qua', 'hà nhân ko xuyên ', 'Trung Quốc', 5, 'dua.jpg'),
(3, 'Táo tàu', 12000, 'rau', 'Táo ngố vip pro hơn cả táo khuyết', 'USA', 9092, 'tao.jpg'),
(4, 'Cam', 1200, 'qua', 'Cam sành hà nội', 'hà nôi', 8, 'cam.jpg'),
(6, 'dâu tây', 21000, 'qua', '', 'Đà nẵng', 95, '1748964973319_dautay.jpg'),
(7, 'Cà rốt', 15000, 'rau', 'Cà rốt tươi được trồng tại các trang trại ở Đà lạt', 'Đà Lạt', 50, 'ca_rot.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `tenTaiKhoan` varchar(50) NOT NULL,
  `matKhau` varchar(50) DEFAULT NULL,
  `quyen` varchar(50) DEFAULT 'User',
  `hoTen` varchar(50) DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `diaChi` varchar(250) DEFAULT NULL,
  `SDT` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`tenTaiKhoan`, `matKhau`, `quyen`, `hoTen`, `ngaySinh`, `diaChi`, `SDT`, `email`) VALUES
('admin01', '123', 'admin', 'quangvanhoang', '1985-03-10', '123 Hoàng Quang Văn, Q1, TP.HCM', '0912345678', 'quang@greenmart.vn'),
('admin02', '123', 'admin', 'Lê Quốc Cường', '1988-02-20', '78 Hai Bà Trưng, Q1, TP.HCM', '0922123456', 'lecuong@greenmart.vn'),
('quang', '123', 'user', 'Hoàng Văn Quang', '2025-07-02', 'Mỹ đình 2, Nam Từ Liên, Hà Nội', '0812331231', 'quang123@gmail.com'),
('user01', '123456', 'user', 'Nguyễn Văn A', '1995-05-10', '12 Lê Lợi, Q1, TP.HCM', '0909123456', 'nguyenvana@gmail.com'),
('user02', '123456', 'user', 'Trần Thị B', '1992-08-15', '45 Nguyễn Huệ, Q3, TP.HCM', '0912123456', 'tranthib@gmail.com'),
('user03', '123456', 'user', 'Phạm Hữu Dũng', '1990-11-25', '25 Cách Mạng Tháng 8, Q10, TP.HCM', '0933123456', 'phamdung@gmail.com'),
('user04', '123', 'user', 'Nguyễn Hoàng Dương', '2025-06-16', 'Thanh Hóa', '0123321123', 'duong12@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`maDonHang`,`tenTaiKhoan`,`maSanPham`) USING BTREE;

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`maDonHang`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`maSanPham`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`tenTaiKhoan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `maDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `maSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
