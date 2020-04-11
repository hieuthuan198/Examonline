-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 01:28 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FULLNAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT '0',
  `NUMBER_PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GEMS` int(11) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `USERNAME`, `PASSWORD`, `FULLNAME`, `EMAIL`, `AGE`, `GENDER`, `NUMBER_PHONE`, `ADDRESS`, `GEMS`) VALUES
(1, 'lethanhphuoc', '$2a$10$AFHckFvCY5fH85y7BZy3ReNGfA8kr4P75PUixBUSRMLSjq9uCya4O', 'Lê Thành Phước', 'lethanhphuoc@lgmail.com', 18, 1, '1231231', 'Lâm ??ng', 2),
(2, 'vothanhloc', '$2a$10$AFHckFvCY5fH85y7BZy3ReNGfA8kr4P75PUixBUSRMLSjq9uCya4O', 'Võ Thanhg Lộc 2', 'vothanhloc@gmail.com', 12, 1, '0984456678123', 'Vũng Tàu', 2),
(3, 'student001', '$2a$10$AFHckFvCY5fH85y7BZy3ReNGfA8kr4P75PUixBUSRMLSjq9uCya4O', 'asd', 'thunhat@gmail.com', 15, 1, '1111', 'aaa á', 2),
(51, 'teacher001', '$2a$10$Vcr9G57/h/qA4QeMV4UucujXfqvKsOUPuxqdUsr0gV8lDwYyCe9Na', 'Teacher001', 'teacher001@gmail.com', 23, 1, '', 'Hồ Chí Minh', 2),
(52, 'student002', '$2a$10$xuyy1W8XR1jYTRk8vA10GegfNf8nqAcTNlFHXZ11r.zmMfZK6QRWq', 'Student002', 'student002@gmail.com', 17, 1, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_role`
--

CREATE TABLE `account_role` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_role`
--

INSERT INTO `account_role` (`ID`, `ACCOUNT_ID`, `ROLE_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(17, 51, 2),
(18, 52, 3);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `ID` int(11) NOT NULL,
  `EXAM_QUESTION_ID` int(11) DEFAULT NULL,
  `QUESTION_SUB_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`ID`, `EXAM_QUESTION_ID`, `QUESTION_SUB_ID`) VALUES
(129, 434, 140),
(130, 435, 101),
(131, 436, 95),
(132, 437, 143),
(133, 439, 121),
(134, 440, 82),
(135, 441, 113),
(136, 442, 56),
(137, 443, 46),
(138, 444, 171),
(139, 445, 179),
(140, 446, 150),
(142, 447, 148),
(141, 447, 149),
(143, 448, 159),
(144, 449, 165),
(145, 450, 166),
(146, 451, 177),
(147, 452, 155),
(148, 453, 185),
(149, 454, 98),
(150, 455, 105),
(151, 456, 63),
(152, 457, 80),
(153, 458, 77),
(154, 459, 111),
(155, 460, 84),
(156, 461, 129),
(157, 462, 133),
(158, 463, 50),
(159, 464, 112),
(160, 465, 137),
(161, 466, 64),
(162, 467, 97),
(163, 468, 66),
(165, 469, 107),
(164, 469, 108),
(166, 470, 132),
(167, 471, 83),
(168, 472, 75),
(169, 473, 142),
(170, 477, 87),
(171, 478, 110),
(172, 509, 74),
(173, 514, 125),
(174, 516, 97),
(175, 517, 52),
(176, 520, 62),
(177, 521, 72),
(178, 522, 141),
(179, 523, 142),
(180, 534, 87),
(181, 534, 88),
(182, 535, 132),
(183, 536, 70),
(184, 537, 54),
(185, 538, 80),
(186, 539, 83),
(187, 540, 75),
(188, 541, 98),
(189, 541, 99),
(190, 542, 142),
(191, 542, 144),
(192, 543, 47),
(193, 543, 49);

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  `YEAR_OF_EXPERIENCE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cv`
--

INSERT INTO `cv` (`ID`, `ACCOUNT_ID`, `SUBJECT_ID`, `YEAR_OF_EXPERIENCE`, `STATUS`) VALUES
(28, 51, 1, 10, 0),
(29, 51, 1, 14, 1),
(30, 51, 4, 7, 0),
(31, 51, 3, 3, 1),
(32, 2, 6, 12, 0),
(33, 2, 5, 2, 0),
(34, 2, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`ID`, `ACCOUNT_ID`, `SUBJECT_ID`, `created`, `score`) VALUES
(104, 52, 1, '2019-12-06 08:21:29', '2/10'),
(105, 52, 3, '2019-12-06 08:22:03', '4/10'),
(106, 3, 1, '2019-12-06 08:22:48', '2/10'),
(107, 3, 1, '2019-12-06 17:21:13', '4/10'),
(108, 3, 1, '2019-12-06 17:28:41', '1/10'),
(109, 3, 1, '2019-12-06 17:29:12', NULL),
(110, 3, 1, '2019-12-07 12:34:20', NULL),
(111, 3, 1, '2019-12-07 13:27:47', '0/10'),
(112, 3, 1, '2019-12-07 13:57:46', '0/10'),
(113, 3, 3, '2019-12-07 13:59:36', NULL),
(114, 3, 1, '2019-12-11 00:22:32', '4/10');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE `exam_question` (
  `ID` int(11) NOT NULL,
  `EXAM_ID` int(11) DEFAULT NULL,
  `QUESTION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_question`
--

INSERT INTO `exam_question` (`ID`, `EXAM_ID`, `QUESTION_ID`) VALUES
(443, 104, 83),
(442, 104, 85),
(440, 104, 92),
(436, 104, 95),
(435, 104, 96),
(441, 104, 99),
(438, 104, 100),
(439, 104, 101),
(434, 104, 106),
(437, 104, 107),
(447, 105, 108),
(446, 105, 109),
(452, 105, 110),
(448, 105, 111),
(449, 105, 112),
(450, 105, 113),
(444, 105, 114),
(451, 105, 115),
(445, 105, 116),
(453, 105, 117),
(463, 106, 84),
(456, 106, 87),
(458, 106, 90),
(457, 106, 91),
(460, 106, 92),
(454, 106, 96),
(455, 106, 97),
(459, 106, 99),
(461, 106, 103),
(462, 106, 104),
(466, 107, 87),
(468, 107, 88),
(472, 107, 90),
(471, 107, 92),
(467, 107, 95),
(469, 107, 98),
(464, 107, 99),
(470, 107, 104),
(465, 107, 105),
(473, 107, 107),
(481, 108, 85),
(475, 108, 87),
(479, 108, 89),
(477, 108, 93),
(476, 108, 94),
(474, 108, 98),
(478, 108, 99),
(482, 108, 101),
(483, 108, 102),
(480, 108, 106),
(492, 109, 85),
(491, 109, 92),
(489, 109, 94),
(484, 109, 95),
(493, 109, 96),
(485, 109, 97),
(486, 109, 99),
(490, 109, 103),
(488, 109, 104),
(487, 109, 105),
(498, 110, 84),
(501, 110, 86),
(495, 110, 88),
(494, 110, 89),
(503, 110, 90),
(497, 110, 92),
(499, 110, 93),
(496, 110, 95),
(500, 110, 97),
(502, 110, 107),
(507, 111, 84),
(508, 111, 86),
(509, 111, 90),
(511, 111, 91),
(505, 111, 92),
(504, 111, 94),
(512, 111, 96),
(506, 111, 97),
(510, 111, 100),
(513, 111, 106),
(517, 112, 84),
(520, 112, 87),
(521, 112, 89),
(519, 112, 93),
(516, 112, 95),
(515, 112, 98),
(518, 112, 99),
(514, 112, 102),
(522, 112, 106),
(523, 112, 107),
(530, 113, 108),
(527, 113, 109),
(525, 113, 110),
(526, 113, 111),
(532, 113, 112),
(531, 113, 113),
(528, 113, 114),
(529, 113, 116),
(524, 113, 117),
(533, 113, 118),
(543, 114, 83),
(537, 114, 85),
(536, 114, 89),
(540, 114, 90),
(538, 114, 91),
(539, 114, 92),
(534, 114, 93),
(541, 114, 96),
(535, 114, 104),
(542, 114, 107);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_ID` int(11) DEFAULT NULL,
  `TO_ID` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime(3) DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ID`, `SUBJECT`, `CONTENT`, `FROM_ID`, `TO_ID`, `CREATE_TIME`) VALUES
(24, 'Feedback', 'Cần được phê duêtj CV để đăng câu hỏi.', 2, 1, '2019-12-06 07:24:25.000'),
(25, 'Phẩn hồi về câu hỏi.', 'Vẫn chưa có câu hỏi nào của tôi đuọc chấp nhận.', 2, 1, '2019-12-06 07:25:29.000'),
(26, 'Phê duyệt câu hỏi.', 'Tôi cần phê duyệt các câu hỏi của tôi đăng tải.', 51, 1, '2019-12-06 08:08:50.000'),
(27, 'Tôi cần phê duyệt câu hỏi', 'Tôi cần phê duyệt câu hỏi', 51, 1, '2019-12-06 08:10:21.000'),
(29, 'Đăng ký thi', 'Tôi có thể thi ngay bây giờ được không?', 52, 2, '2019-12-06 08:17:44.000'),
(30, 'Tôi cần làm gì để có thể thi được?', 'Tôi cần làm gì để có thể thi được?', 52, 1, '2019-12-06 08:18:23.000'),
(31, 'â', 'â', 3, 2, '2019-12-06 17:24:21.000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_buy_gems`
--

CREATE TABLE `invoice_buy_gems` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `ACCOUNT_ACCEPT_ID` int(11) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `CREATE_TIME` datetime(3) DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_purchase_gems`
--

CREATE TABLE `invoice_purchase_gems` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `ACCOUNT_ACCEPT_ID` int(11) DEFAULT NULL,
  `GEMS` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime(3) DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_sell_gems`
--

CREATE TABLE `invoice_sell_gems` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `ACCOUNT_ACCEPT_ID` int(11) DEFAULT NULL,
  `GEMS` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime(3) DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `par_value`
--

CREATE TABLE `par_value` (
  `ID` int(11) NOT NULL,
  `AMOUNT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `ID` int(11) NOT NULL,
  `POINT` double DEFAULT NULL,
  `ACCOUNT_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  `TEXT` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`ID`, `POINT`, `ACCOUNT_ID`, `SUBJECT_ID`, `TEXT`, `STATUS`) VALUES
(83, NULL, 2, 1, 'pi = ?', 1),
(84, NULL, 2, 1, 'Kết quả phép tính: 4448 x 985 =?', 1),
(85, NULL, 2, 1, 'log(152)', 1),
(86, NULL, 2, 1, 'Cho hàm số y =(3x - 1)/(x-2) tìm trục tọa độ C', 1),
(87, NULL, 2, 1, '102 *1425 / 4 -344 = ?', 1),
(88, NULL, 2, 1, 'tan(77)', 1),
(89, NULL, 2, 1, 'Sin(865) = ?', 1),
(90, NULL, 2, 1, 'Căn bặc hai của 5785 = ?', 1),
(91, NULL, 2, 1, '936 / 5 + 10654 = ?', 1),
(92, NULL, 2, 1, 'Cos(555)', 1),
(93, NULL, 2, 1, 'ln(8526)', 1),
(94, NULL, 2, 1, 'e x 5922 =? ', 1),
(95, NULL, 2, 1, 'Cos(44) + tan(85) = ?', 1),
(96, NULL, 2, 1, '785 × 2^6 = ?', 1),
(97, NULL, 51, 1, 'tc1: cos(589) = ?', 1),
(98, NULL, 51, 1, 'tc1: 74 log(9) = ?', 1),
(99, NULL, 51, 1, 'log(69) x 28 = ?', 1),
(100, NULL, 51, 1, 'ln(8 sin(5)) = ?', 1),
(101, NULL, 51, 1, '47π = ?', 1),
(102, NULL, 51, 1, '936 / 2 + 10654 = ?', 1),
(103, NULL, 51, 1, '832/23 *23 +56 = ?', 1),
(104, NULL, 51, 1, '2983 -23 *234 +23', 1),
(105, NULL, 51, 1, '2983 -23 *23 = ?', 1),
(106, NULL, 51, 1, '265^7  = ?', 1),
(107, NULL, 51, 1, '292383 -23 *23 = ? ', 1),
(108, NULL, 51, 3, 'Cho các chất sau: hoa đào, hoa mai, con người, cây cỏ, quần áo…Hãy cho biết vật nào là nhân tạo?', 2),
(109, NULL, 51, 3, 'Chọn đáp án đúng nhất', 1),
(110, NULL, 51, 3, ' Điền từ còn thiếu vào chỗ trống “Cao su là chất…., có tính chất đàn hồi, chịu được ăn mòi nên được dùng chế tạo lốp xe”', 1),
(111, NULL, 51, 3, 'Điền từ thích hợp vào chỗ trống “ Thủy ngân là kim loại nặng có ánh bạc, có dạng (1) ở nhiệt độ thường. Thủy ngân thường được sử dụng trong(2) (3) và các thiết bị khoa học khác.”', 1),
(112, NULL, 51, 3, 'Có bao nhiêu nguyên tố hóa học:', 1),
(113, NULL, 51, 3, 'Kí hiệu của nguyên tố Xeci là', 1),
(114, NULL, 51, 3, ' Khối lượng nguyên tử ', 1),
(115, NULL, 51, 3, 'Cho nguyên tử của nguyên tố C có 11 proton. Chọn đáp án sai', 1),
(116, NULL, 51, 3, 'Cho nguyên tử khối của Bari là 137 . Tính khối lượng thực nguyên tố trên.', 1),
(117, NULL, 51, 3, 'Chọn đáp án sai', 1),
(118, NULL, 51, 3, 'Cho số khối của nguyên tử nguyên tố X là 39. Biết rằng tổng số hạt nguyên tử là 58. Xác định nguyên tố đó và cho biết số notron', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_sub`
--

CREATE TABLE `question_sub` (
  `ID` int(11) NOT NULL,
  `QUESTION_ID` int(11) DEFAULT NULL,
  `TEXT` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COPRRECT` int(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `question_sub`
--

INSERT INTO `question_sub` (`ID`, `QUESTION_ID`, `TEXT`, `COPRRECT`) VALUES
(46, 83, '3.14', 1),
(47, 83, '3.15', 0),
(48, 83, '3.16', 0),
(49, 83, '3.17', 0),
(50, 84, '4381279', 0),
(51, 84, '4381280', 1),
(52, 84, '4381281', 0),
(53, 84, '4381282', 0),
(54, 85, '2.16', 0),
(55, 85, '2.17', 0),
(56, 85, '2.18', 1),
(57, 85, '2.19', 0),
(58, 86, '1', 0),
(59, 86, '4', 1),
(60, 86, '3', 0),
(61, 86, '2', 0),
(62, 87, '35995', 0),
(63, 87, '35993', 0),
(64, 87, '35994', 1),
(65, 87, '35991', 0),
(66, 88, '-32', 1),
(67, 88, '-23', 0),
(68, 88, '32', 0),
(69, 88, '23', 0),
(70, 89, '0.99', 1),
(71, 89, '0.45', 0),
(72, 89, '0.52', 0),
(73, 89, '1', 0),
(74, 90, '89', 0),
(75, 90, '76', 1),
(76, 90, '73', 0),
(77, 90, '123', 0),
(78, 91, '10821', 0),
(79, 91, '10837', 0),
(80, 91, '10841', 1),
(81, 91, '10893', 0),
(82, 92, '-0.471', 0),
(83, 92, '-0.487', 1),
(84, 92, '-0.423', 0),
(85, 92, '-0.444', 0),
(86, 93, '9.05', 1),
(87, 93, '9.04', 0),
(88, 93, '9.02', 0),
(89, 93, '9.01', 0),
(90, 94, '13097.64', 0),
(91, 94, '16097.66', 1),
(92, 94, '16027.66', 0),
(93, 94, '16397.66', 0),
(94, 95, '11.1', 0),
(95, 95, '13.8', 0),
(96, 95, '12.149', 1),
(97, 95, '12.5', 0),
(98, 96, '50375', 0),
(99, 96, '50240', 1),
(100, 96, '12240', 0),
(101, 96, '30240', 0),
(102, 97, '-0.64', 0),
(103, 97, '-0.623', 0),
(104, 97, '-076', 0),
(105, 97, '-0.656', 1),
(106, 98, '70.276', 0),
(107, 98, '70', 0),
(108, 98, '70.613', 1),
(109, 98, '60.623', 0),
(110, 99, '51.488', 1),
(111, 99, '51.423', 0),
(112, 99, '51.287', 0),
(113, 99, '50487', 0),
(114, 100, '-0.260', 0),
(115, 100, '-0.560', 0),
(116, 100, '-0.367', 0),
(117, 100, '-0.360', 1),
(118, 101, '143.6548', 0),
(119, 101, '147.6548', 1),
(120, 101, '143.6548', 0),
(121, 101, '141.6548', 0),
(122, 102, '11122', 1),
(123, 102, '11222', 0),
(124, 102, '11322', 0),
(125, 102, '11422', 0),
(126, 103, '796', 0),
(127, 103, '878', 0),
(128, 103, '888', 1),
(129, 103, '658', 0),
(130, 104, '2376', 0),
(131, 104, '-2376', 1),
(132, 104, '2372', 0),
(133, 104, '2373', 0),
(134, 105, '2455', 0),
(135, 105, '2454', 1),
(136, 105, '2424', 0),
(137, 105, '2423', 0),
(138, 106, '9.1774308e+16', 1),
(139, 106, '9.1774308e+14', 0),
(140, 106, '9.1774308e+15', 0),
(141, 106, '9.1774308e+12', 0),
(142, 107, '2918', 0),
(143, 107, '291824', 0),
(144, 107, '291854', 1),
(145, 107, '2918524', 0),
(146, 108, 'Hoa đào', 0),
(147, 108, 'Cây cỏ ', 0),
(148, 108, 'Quần áo ', 1),
(149, 108, 'Tivi', 1),
(150, 109, 'Nước cất là chất tinh khiết.', 1),
(151, 109, 'Chỉ có 1 cách để biết tính chất của chất', 0),
(152, 109, 'Vật thể tự nhiên là do con người tạo ra', 0),
(153, 109, 'Nước mưa là chất tinh khiết', 0),
(154, 110, 'Thấm nước', 0),
(155, 110, 'Không thấm nước', 1),
(156, 110, 'Axit', 0),
(157, 110, 'Cách nhiệt', 1),
(158, 111, '(1) rắn (2) nhiệt độ (3) áp kế', 0),
(159, 111, '(1) lỏng (2) nhiệt kế (3) áp kế', 0),
(160, 111, '(1) khí (2) nhiệt kế (3) áp suất', 1),
(161, 111, '(1) khí (2) nhiệt kế (3) áp suất', 1),
(162, 112, 'Trên 110 nguyên tố', 1),
(163, 112, 'Đúng 110 nguyên tố', 0),
(164, 112, '111 nguyên tố', 0),
(165, 112, '100 nguyên tố', 0),
(166, 113, 'Cs', 1),
(167, 113, 'Sn', 0),
(168, 113, 'Ca', 0),
(169, 113, 'B', 0),
(170, 114, '1, 9926.10-24kg', 0),
(171, 114, '1, 9926.10-27kg', 1),
(172, 114, '1, 9926.10-25kg', 0),
(173, 114, '1, 9926.16-24kg', 0),
(174, 115, 'Đấy là nguyên tố Ca', 1),
(175, 115, 'Số e là 17 e', 1),
(176, 115, 'Nguyên tử khối là 22', 0),
(177, 115, 'Stt trong bảng tuần hoàn là 11', 1),
(178, 116, 'mBa=2,2742.10^22kg', 0),
(179, 116, 'mBa=2,234.10^-24g', 1),
(180, 116, 'mBa=2,234.10^-24g', 0),
(181, 116, 'mBa=2,234.10^-24g', 0),
(182, 117, 'số p là số đặc trưng của nguyên tố hóa học', 0),
(183, 117, 'nguyên tố hóa học là tập hợp những nguyên tố cùng loại, có cùng số p trong hạt nhân', 1),
(184, 117, '1 đvC=1/11 mC', 1),
(185, 117, 'Oxi là nguyên tố chiếm gần nửa khối lượng vỏ trái đất', 0),
(186, 118, 'Kali, số n= 19', 0),
(187, 118, 'Kali, số n=20', 1),
(188, 118, 'Ca, số n=19', 0),
(189, 118, 'Ca, số n= 20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `response_feedback`
--

CREATE TABLE `response_feedback` (
  `ID` int(11) NOT NULL,
  `CONTENT` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATE_TIME` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `FEEDBACK_ID` int(11) DEFAULT NULL,
  `formAccount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `response_feedback`
--

INSERT INTO `response_feedback` (`ID`, `CONTENT`, `CREATE_TIME`, `FEEDBACK_ID`, `formAccount`) VALUES
(27, 'Tôi sẻ phê duyệt.', '2019-12-06 08:05:40.000', 24, 1),
(28, 'Tôi cảm ơn.', '2019-12-06 08:07:49.000', 24, 2),
(29, 'vâng, tôi sẻ phê duyệt.', '2019-12-06 08:13:42.000', 27, 1),
(30, 'Bạn có thể liên hệ ADM để biết thêm nhé.', '2019-12-06 08:19:27.000', 29, 2),
(31, 'Bạn có thể thi ngay khi tạo xong tài khoản.', '2019-12-06 08:20:36.000', 30, 1),
(32, 'Cảm ơn nhiều.', '2019-12-06 08:21:08.000', 29, 52),
(33, 'Cảm ơn nhiều.', '2019-12-06 08:21:17.000', 30, 52);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID`, `NAME`) VALUES
(1, 'ROLE_ADMIN'),
(3, 'ROLE_STUDENT'),
(2, 'ROLE_TEACHER');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`ID`, `NAME`, `image`) VALUES
(1, 'Toán', 'montoan.jpg'),
(2, 'Lý', 'monly.jpg'),
(3, 'Hóa', 'monhoa.jpg'),
(4, 'Anh Văn', 'monanh.jpg'),
(5, 'Lịch sử', 'monsu.jpg'),
(6, 'Địa lý', 'mondia.jpg'),
(7, 'GDCD', 'gdcd.jpg'),
(8, 'Ngữ Văn', 'monvan.jpg\r\n'),
(9, 'Sinh Học', 'sinhhoc.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `account_role_ibfk_2` (`ROLE_ID`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EXAM_QUESTION_ID` (`EXAM_QUESTION_ID`,`QUESTION_SUB_ID`),
  ADD KEY `QUESTION_SUB_ID` (`QUESTION_SUB_ID`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`) USING BTREE;

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EXAM_ID` (`EXAM_ID`,`QUESTION_ID`),
  ADD KEY `QUESTION_ID` (`QUESTION_ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FROM_ID` (`FROM_ID`),
  ADD KEY `TO_ID` (`TO_ID`);

--
-- Indexes for table `invoice_buy_gems`
--
ALTER TABLE `invoice_buy_gems`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `ACCOUNT_ACCEPT_ID` (`ACCOUNT_ACCEPT_ID`);

--
-- Indexes for table `invoice_purchase_gems`
--
ALTER TABLE `invoice_purchase_gems`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `ACCOUNT_ACCEPT_ID` (`ACCOUNT_ACCEPT_ID`);

--
-- Indexes for table `invoice_sell_gems`
--
ALTER TABLE `invoice_sell_gems`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `ACCOUNT_ACCEPT_ID` (`ACCOUNT_ACCEPT_ID`);

--
-- Indexes for table `par_value`
--
ALTER TABLE `par_value`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ID` (`ACCOUNT_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `question_sub`
--
ALTER TABLE `question_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `QUESTION_ID` (`QUESTION_ID`);

--
-- Indexes for table `response_feedback`
--
ALTER TABLE `response_feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FEEDBACK_ID` (`FEEDBACK_ID`),
  ADD KEY `formAccount` (`formAccount`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `account_role`
--
ALTER TABLE `account_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `exam_question`
--
ALTER TABLE `exam_question`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=544;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `invoice_buy_gems`
--
ALTER TABLE `invoice_buy_gems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_purchase_gems`
--
ALTER TABLE `invoice_purchase_gems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_sell_gems`
--
ALTER TABLE `invoice_sell_gems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `par_value`
--
ALTER TABLE `par_value`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `question_sub`
--
ALTER TABLE `question_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `response_feedback`
--
ALTER TABLE `response_feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `account_role_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `account_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`);

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`EXAM_QUESTION_ID`) REFERENCES `exam_question` (`ID`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`QUESTION_SUB_ID`) REFERENCES `question_sub` (`ID`);

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `cv_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`);

--
-- Constraints for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `exam_question_ibfk_1` FOREIGN KEY (`EXAM_ID`) REFERENCES `exam` (`ID`),
  ADD CONSTRAINT `exam_question_ibfk_2` FOREIGN KEY (`QUESTION_ID`) REFERENCES `question` (`ID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`FROM_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`TO_ID`) REFERENCES `account` (`ID`);

--
-- Constraints for table `invoice_buy_gems`
--
ALTER TABLE `invoice_buy_gems`
  ADD CONSTRAINT `invoice_buy_gems_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `invoice_buy_gems_ibfk_2` FOREIGN KEY (`ACCOUNT_ACCEPT_ID`) REFERENCES `account` (`ID`);

--
-- Constraints for table `invoice_purchase_gems`
--
ALTER TABLE `invoice_purchase_gems`
  ADD CONSTRAINT `invoice_purchase_gems_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `invoice_purchase_gems_ibfk_2` FOREIGN KEY (`ACCOUNT_ACCEPT_ID`) REFERENCES `account` (`ID`);

--
-- Constraints for table `invoice_sell_gems`
--
ALTER TABLE `invoice_sell_gems`
  ADD CONSTRAINT `invoice_sell_gems_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `invoice_sell_gems_ibfk_2` FOREIGN KEY (`ACCOUNT_ACCEPT_ID`) REFERENCES `account` (`ID`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`);

--
-- Constraints for table `question_sub`
--
ALTER TABLE `question_sub`
  ADD CONSTRAINT `question_sub_ibfk_1` FOREIGN KEY (`QUESTION_ID`) REFERENCES `question` (`ID`);

--
-- Constraints for table `response_feedback`
--
ALTER TABLE `response_feedback`
  ADD CONSTRAINT `response_feedback_ibfk_1` FOREIGN KEY (`FEEDBACK_ID`) REFERENCES `feedback` (`ID`),
  ADD CONSTRAINT `response_feedback_ibfk_2` FOREIGN KEY (`formAccount`) REFERENCES `account` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
