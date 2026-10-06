-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2021 lúc 02:31 PM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `clothingshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Passwd` varchar(255) NOT NULL,
  `Image` text NOT NULL,
  `Contact` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `Position` varchar(255) NOT NULL,
  `About` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`ID`, `Name`, `Email`, `Passwd`, `Image`, `Contact`, `Address`, `Position`, `About`) VALUES
('ad01', 'ABC', 'abc@gmail.com', 'abc', 'ad02.jpg', '0123456789', '273 An Duong Vuong', 'Quáº£n lÃ½', '                                                                                                                                                                        ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_hoadon`
--

CREATE TABLE `ct_hoadon` (
  `MA_HD` int(10) NOT NULL,
  `MA_SP` varchar(10) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `TONGTIEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ct_hoadon`
--

INSERT INTO `ct_hoadon` (`MA_HD`, `MA_SP`, `SOLUONG`, `TONGTIEN`) VALUES
(1512051207, 'giay02', 1, 2500000),
(1612051219, 'ao05', 1, 420000),
(1612051219, 'giay03', 1, 1500000),
(1612051219, 'tui02', 1, 580000),
(1612051338, 'ao01', 1, 320000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsx`
--

CREATE TABLE `hangsx` (
  `MA_HANGSX` varchar(10) NOT NULL,
  `TEN_HANGSX` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hangsx`
--

INSERT INTO `hangsx` (`MA_HANGSX`, `TEN_HANGSX`) VALUES
('H001', 'MISSOUT'),
('H002', 'ADIDAS'),
('H004', 'CONVERSE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MA_HD` int(10) NOT NULL,
  `MA_KH` int(11) NOT NULL,
  `TONGTIEN` int(11) NOT NULL,
  `TRANGTHAI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MA_HD`, `MA_KH`, `TONGTIEN`, `TRANGTHAI`) VALUES
(1512051207, 15, 2500000, 'ChÆ°a Thanh ToÃ¡n'),
(1612051219, 16, 2500000, 'ChÆ°a Thanh ToÃ¡n'),
(1612051338, 16, 320000, 'ChÆ°a Thanh ToÃ¡n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kh`
--

CREATE TABLE `kh` (
  `MA_KH` int(11) NOT NULL,
  `TEN_KH` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `MATKHAU` varchar(255) NOT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `DIENTHOAI` varchar(10) DEFAULT NULL,
  `AVATAR` varchar(500) DEFAULT NULL,
  `TRANGTHAI` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `kh`
--

INSERT INTO `kh` (`MA_KH`, `TEN_KH`, `EMAIL`, `MATKHAU`, `DIACHI`, `DIENTHOAI`, `AVATAR`, `TRANGTHAI`) VALUES
(15, 'XÃ­n', 'xin@gmail.com', '123456', 'PY', '012345678', 'kh01.jpg', ''),
(16, 'tien', 'tien@gmail.com', '123456', 'HCM', '7777777777', 'kh02.jpg', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

CREATE TABLE `loaisp` (
  `MA_LOAISP` varchar(10) NOT NULL,
  `TEN_LOAISP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`MA_LOAISP`, `TEN_LOAISP`) VALUES
('L001', 'GiÃ y'),
('L002', 'Ão'),
('L003', 'Quáº§n'),
('L004', 'TÃºi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sp`
--

CREATE TABLE `sp` (
  `MA_SP` varchar(10) NOT NULL,
  `TEN_SP` varchar(50) NOT NULL,
  `MA_LOAISP` varchar(10) NOT NULL,
  `MA_HANGSX` varchar(10) NOT NULL,
  `MIEUTA_SP` text DEFAULT NULL,
  `HINHANH_SP` text DEFAULT NULL,
  `GIA` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sp`
--

INSERT INTO `sp` (`MA_SP`, `TEN_SP`, `MA_LOAISP`, `MA_HANGSX`, `MIEUTA_SP`, `HINHANH_SP`, `GIA`) VALUES
('ao01', 'TEE SNOW BEAR', 'L002', 'H001', 'Cháº¥t liá»‡u: Váº£i cotton 100% 2 chiá»u\r\nSize: S/M/L\r\n                             \r\n                            ', 'ao01.jpg', 320000),
('ao03', 'MELTING CHEESE', 'L002', 'H001', 'Cháº¥t liá»‡u: Váº£i cotton 100% 2 chiá»u\r\nColor: Äen, Tráº¯ng\r\nSize: S/M/L\r\n                            ', 'ao03.jpg', 350000),
('ao04', 'SPACE TEE MST', 'L002', 'H001', 'Cháº¥t liá»‡u: Váº£i cotton 100% 2 chiá»u\r\nColor: Tan, Äen\r\nSize: S/M/L\r\n                             \r\n                            ', 'ao04.jpg', 340000),
('ao05', 'CARDIGAN LOGO M', 'L002', 'H001', 'Size S/M/L', 'ao05.jpg', 420000),
('ao06', 'SÆ  MI LOGO ( SHIRT )', 'L002', 'H001', 'Size S/M/L', 'ao06.png', 380000),
('ao07', 'LOGO LINE TEE', 'L002', 'H001', 'Cháº¥t liá»‡u: Váº£i cotton 100% 2 chiá»u\r\nColor:Tráº¯ng\r\nSize: S/M/L\r\n\r\nHÃ£y cÃ¢n nháº¯c tham kháº£o size chart Ä‘á»ƒ lá»±a chá»n Ä‘Æ°á»£c size Ã¡o phÃ¹ há»£p nháº¥t vá»›i báº£n thÃ¢n báº¡n nhÃ©!', 'ao07.jpg', 320000),
('giay01', 'MST LOGO SLIPPER', 'L001', 'H001', 'Size 1 : 36-37 (23cm )\r\nSize 2 : 38-39 (25cm ) \r\nSize 3 : 40-41. ( 26.5cm) \r\nSize 4 : 42-43. (28cm )\r\n\r\nÄá»‘i vá»›i dÃ©p shop khÃ´ng há»— trá»£ Ä‘á»•i size nÃªn báº¡n Ä‘o chiá»u dÃ i chÃ¢n trÆ°á»›c khi Ä‘áº·t hÃ ng hoáº·c liÃªn há»‡ vá»›i shop qua insta/fb Ä‘á»ƒ Ä‘Æ°á»£c tÆ° váº¥n size nha <3\r\n                             \r\n                             \r\n                             \r\n                            ', 'giay01.jpg', 380000),
('giay02', 'ZX 1K BOOST', 'L001', 'H002', 'Size 3.5UK  4UK  4.5UK  5UK  5.5UK  6UK', 'giay02.jpg', 2500000),
('giay03', 'CHUCK TAYLOR ALL STAR MADISON HYBRID SHINE', 'L001', 'H004', 'Color: Black/White/Black\r\nSize: 5.5US - 8.5US Women', 'giay03.jpg', 1500000),
('quan01', 'LOGO PANTS', 'L003', 'H001', 'Color: Black Size: S/M/L\r\nCháº¥t liá»‡u: Kaki.\r\nDetail Tag kim loáº¡i, thÃªu Logo viá»n tÃºi\r\n                            ', 'quan01.jpg', 420000),
('quan02', 'SWEATPANTS LOGO', 'L003', 'H001', 'Size S/M/L\r\n                            ', 'quan02.jpg', 380000),
('tui01', 'Wallet Logo', 'L004', 'H004', ' \r\n                             \r\n                            ', 'tui01.jpg', 250000),
('tui02', 'BACKPACK LOGO MISSOUT', 'L004', 'H001', 'KÃ­ch thÆ°á»›c Balo: 30*40*12 \r\nÄa tÃ­nh nÄƒng: Äiá»u chá»‰nh tá»« Balo thÃ nh Shoulder Bag. \r\nCháº¥t: váº£i bá»‘ 900pvc. \r\nTrang bá»‹: TÃºi há»™p/ Tag nhá»±a/ Miáº¿ng lÃ³t má»m giáº£m sá»©c náº·ng.\r\n                             \r\n                            ', 'tui02.jpg', 580000),
('tui03', 'MST SHOULDER BAG', 'L004', 'H001', 'Size: 40x29x12\r\nBLACK ONLY\r\n                            ', 'tui03.jpg', 350000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `ct_hoadon`
--
ALTER TABLE `ct_hoadon`
  ADD PRIMARY KEY (`MA_HD`,`MA_SP`),
  ADD KEY `FK_SP` (`MA_SP`);

--
-- Chỉ mục cho bảng `hangsx`
--
ALTER TABLE `hangsx`
  ADD PRIMARY KEY (`MA_HANGSX`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MA_HD`);

--
-- Chỉ mục cho bảng `kh`
--
ALTER TABLE `kh`
  ADD PRIMARY KEY (`MA_KH`);

--
-- Chỉ mục cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`MA_LOAISP`);

--
-- Chỉ mục cho bảng `sp`
--
ALTER TABLE `sp`
  ADD PRIMARY KEY (`MA_SP`),
  ADD KEY `MA_LOAISP` (`MA_LOAISP`),
  ADD KEY `MA_HANGSX` (`MA_HANGSX`);

ALTER TABLE `ct_hoadon`
  ADD CONSTRAINT `FK_HD` FOREIGN KEY (`MA_HD`) REFERENCES `hoadon` (`MA_HD`),
  ADD CONSTRAINT `FK_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sp` (`MA_SP`);

--
-- Các ràng buộc cho bảng `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `sp_ibfk_1` FOREIGN KEY (`MA_LOAISP`) REFERENCES `loaisp` (`MA_LOAISP`),
  ADD CONSTRAINT `sp_ibfk_2` FOREIGN KEY (`MA_HANGSX`) REFERENCES `hangsx` (`MA_HANGSX`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
