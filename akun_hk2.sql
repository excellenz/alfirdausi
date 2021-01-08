-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jan 2021 pada 01.20
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akun_hk2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotel_kamar`
--

CREATE TABLE `hotel_kamar` (
  `id` int(11) NOT NULL,
  `tipe_kamar_id` int(11) NOT NULL,
  `nomor_kamar` varchar(255) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hotel_kamar`
--

INSERT INTO `hotel_kamar` (`id`, `tipe_kamar_id`, `nomor_kamar`, `status`) VALUES
(8, 1, 'A1', 1),
(9, 1, 'A2', 1),
(10, 2, 'B1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotel_tamu`
--

CREATE TABLE `hotel_tamu` (
  `id` int(3) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(100) NOT NULL,
  `tipe_identitas` varchar(20) NOT NULL,
  `nomor_identitas` varchar(20) NOT NULL,
  `warga_negara` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(100) NOT NULL,
  `alamat_provinsi` varchar(100) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hotel_tamu`
--

INSERT INTO `hotel_tamu` (`id`, `prefix`, `nama_depan`, `nama_belakang`, `tipe_identitas`, `nomor_identitas`, `warga_negara`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `email`) VALUES
(1, 'Mr', 'Hendra Karunia', 'Agustine', 'KTP', '3208160601870002', 'WNI', 'Desa Kalapagunung Kec. Kramatmulya', 'Kuningan', 'Jawa Barat', '626285261017724', 'hendrasaleh@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotel_tipe_kamar`
--

CREATE TABLE `hotel_tipe_kamar` (
  `id` int(11) NOT NULL,
  `tipe` varchar(128) NOT NULL,
  `hk` int(11) NOT NULL,
  `fitur` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `video` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hotel_tipe_kamar`
--

INSERT INTO `hotel_tipe_kamar` (`id`, `tipe`, `hk`, `fitur`, `detail`, `harga`, `gambar`, `video`) VALUES
(1, 'A', 1, '', '<ul>\r\n	<li>2 Ranjang ukuran 160x200 cm</li>\r\n	<li>2 Springbed ukuran 160x200 cm</li>\r\n	<li>Air Panas/Water Heater</li>\r\n	<li>Air Conditioner / AC</li>\r\n	<li>TV Flat 32&#39;</li>\r\n	<li>Kloset Duduk</li>\r\n	<li>Shower</li>\r\n	<li>Gratis Wifi</li>\r\n	<li>Kamar Mandi dan Toilet di dalam</li>\r\n	<li>Lokasi di Area HK di Lantai 1</li>\r\n	<li>Non Breakfast</li>\r\n</ul>\r\n', 330000, 'tipe-a1.jpg', '<iframe class=\"embed-responsive-item\" src=\"https://www.youtube.com/embed/SdGb7p17u_U?rel=0\"></iframe>'),
(2, 'B', 0, '', '<ul>\r\n	<li>2 Ranjang (salah satunya ranjang tingkat)</li>\r\n	<li>3 Springbed</li>\r\n	<li>Air Panas/Water Heater</li>\r\n	<li>Air Conditioner / AC</li>\r\n	<li>TV Flat 32&#39;</li>\r\n	<li>Kloset Duduk</li>\r\n	<li>Shower</li>\r\n	<li>Gratis Wifi</li>\r\n	<li>Kamar Mandi dan Toilet di dalam</li>\r\n	<li>Lokasi di Luar Area HK di Lantai 1</li>\r\n	<li>Non Breakfast</li>\r\n</ul>\r\n', 330000, 'tipe-b.jpg', '<iframe class=\"embed-responsive-item\" src=\"https://www.youtube.com/embed/Oi5bsr5a4sE?rel=0\"></iframe>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `group_id` int(5) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `indeks` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `student`
--

INSERT INTO `student` (`id`, `user_name`, `user_password`, `full_name`, `group_id`, `group_name`, `indeks`) VALUES
(501, '97016', '7594', 'Achmad Pasya', 17, '9-A', 1),
(502, '97025', '8973', 'Alif Aulia Akbar Ronisa', 17, '9-A', 2),
(503, '97026', '8724', 'Alifarhan Rahmatullah', 17, '9-A', 3),
(504, '97033', '9825', 'Arya Haris Saputra', 17, '9-A', 4),
(505, '97038', '8365', 'Azri Ahmad Firas', 17, '9-A', 5),
(506, '97048', '6495', 'Dikha Bagus Pangestu', 17, '9-A', 6),
(507, '97066', '2693', 'Fathan Mubina', 17, '9-A', 7),
(508, '97067', '4573', 'Fathi Ahmad Haneya', 17, '9-A', 8),
(509, '97070', '8345', 'Fayyadh Syakib Adzkiya', 17, '9-A', 9),
(510, '97083', '7392', 'Hanif Abror Farhany', 17, '9-A', 10),
(511, '97073', '3428', 'Ghaza Abyan Alfatih', 17, '9-A', 11),
(512, '97075', '6542', 'Ghozy Rijalul Fawwaz', 17, '9-A', 12),
(513, '97084', '6483', 'Hanif Damar Pinuluh Qolbi', 17, '9-A', 13),
(514, '97109', '7924', 'Miftah Farid', 17, '9-A', 14),
(515, '97126', '6275', 'Muhammad Abdul Aziz Ali Rantisi', 17, '9-A', 15),
(516, '97147', '7625', 'Muhammad Fairuz Dzaky', 17, '9-A', 16),
(517, '97158', '5386', 'Muhammad Fitra Adhim Nurrochman', 17, '9-A', 17),
(518, '97172', '8352', 'Muhammad Irham Ramadhan', 17, '9-A', 18),
(519, '97174', '5476', 'Muhammad Izzuddin Al Qosam', 17, '9-A', 19),
(520, '97178', '5736', 'Muhammad Lutfi Azududdin', 17, '9-A', 20),
(521, '97196', '2895', 'Muhammad Sholah Syahadah', 17, '9-A', 21),
(522, '97202', '9463', 'Muhammad Zidan Alghony', 17, '9-A', 22),
(523, '97219', '3672', 'Nayaka Ivana Putra', 17, '9-A', 23),
(524, '97228', '3495', 'Rafly Nur Ariefsa', 17, '9-A', 24),
(525, '97230', '8946', 'Raissyawalinov Al Kindi', 17, '9-A', 25),
(526, '97234', '7923', 'Ramdanu Gemilliano Nawawi', 17, '9-A', 26),
(527, '97246', '3468', 'Sahril Fahreza Kotalima', 17, '9-A', 27),
(528, '97248', '5634', 'Salman Rafi Syabani', 17, '9-A', 28),
(529, '97268', '6854', 'Ziyan Said Arroyan', 17, '9-A', 29),
(530, '97269', '5672', 'Zulfa Almajid Basyaasyah', 17, '9-A', 30),
(531, '97010', '3925', 'Adli Hammam Musyaffa', 18, '9-B', 1),
(532, '97030', '5743', 'Ardian Dwi Ansyori', 18, '9-B', 2),
(533, '97034', '5972', 'Aslam Jauhari', 18, '9-B', 3),
(534, '97039', '6297', 'Azzam Abdul Aziz Syafruddin', 18, '9-B', 4),
(535, '97041', '7854', 'Cozy Muhammad Rayyan', 18, '9-B', 5),
(536, '97044', '6327', 'Daulatul Rais Afham', 18, '9-B', 6),
(537, '97045', '5867', 'Davika Chesta Adabi', 18, '9-B', 7),
(538, '97051', '4256', 'Dzikral Dipa Ammrulloh', 18, '9-B', 8),
(539, '97062', '7846', 'Farid Habibi', 18, '9-B', 9),
(540, '97064', '2674', 'Farras Abiyyu Ahmad', 18, '9-B', 10),
(541, '97068', '8796', 'Fawaz Naqiya Pasha', 18, '9-B', 11),
(542, '97076', '2834', 'Habib Rabbani', 18, '9-B', 12),
(543, '97099', '8263', 'Izzuddin Abdurrahman', 18, '9-B', 13),
(544, '97107', '3564', 'M. Hilmi Fauzi', 18, '9-B', 14),
(545, '97106', '8247', 'M. Irfan Rasyadan', 18, '9-B', 15),
(546, '97113', '2467', 'Mohamad Sabiq Rifqi', 18, '9-B', 16),
(547, '97117', '5986', 'Mohammad Hafizh Alwi Alfarizi', 18, '9-B', 17),
(548, '97159', '2649', 'Muhammad Fitrah Fauzan', 18, '9-B', 18),
(549, '97167', '6327', 'Muhammad Hilmi Ahla Dzikri', 18, '9-B', 19),
(550, '97168', '7254', 'Muhammad Hisyam Arify', 18, '9-B', 20),
(551, '97182', '6487', 'Muhammad Naufal Hafidz Izzuddin Ambuwaru', 18, '9-B', 21),
(552, '97183', '3294', 'Muhammad Naufal Putra Aryan', 18, '9-B', 22),
(553, '97186', '8629', 'Muhammad Raffi Akbar Putrahasana', 18, '9-B', 23),
(554, '97195', '5267', 'Muhammad Roihan Farid', 18, '9-B', 24),
(555, '97198', '9243', 'Muhammad Ukasyah Tuharea', 18, '9-B', 25),
(556, '97206', '4765', 'Mujahid Zubair Tobiin', 18, '9-B', 26),
(557, '97212', '2563', 'Naufal Akbar Rabbani', 18, '9-B', 27),
(558, '97222', '9758', 'Polaresky Marsa Auriga', 18, '9-B', 28),
(559, '97237', '9657', 'Refal Irfansyah', 18, '9-B', 29),
(560, '97252', '4627', 'Syamil Al Ghifary', 18, '9-B', 30),
(561, '97009', '5482', 'Adam Yuji Matshuda', 19, '9-C', 1),
(562, '97015', '6437', 'Ahmad Fauzan Abdillah', 19, '9-C', 2),
(563, '97028', '6523', 'Aqil Nafi Aditama', 19, '9-C', 3),
(564, '97054', '6289', 'Faiq Muhammad Alfaruq', 19, '9-C', 4),
(565, '97059', '5863', 'Fakhri Hamzah', 19, '9-C', 5),
(566, '97063', '8465', 'Faris M. Ihsan', 19, '9-C', 6),
(567, '97071', '5648', 'Gata Abdil Rahman', 19, '9-C', 7),
(568, '97077', '4579', 'Hafidz Fauzan Ramadhan', 19, '9-C', 8),
(569, '97080', '4752', 'Hammam Putra Islami', 19, '9-C', 9),
(570, '97097', '5462', 'Irgi Muhammad Pahresi', 19, '9-C', 10),
(571, '97101', '6482', 'Junaid Muhyiddin Fauzan', 19, '9-C', 11),
(572, '97102', '5429', 'Kahfi Husein Syamil', 19, '9-C', 12),
(573, '97115', '2856', 'Mohammad Firzy Syabani Rahman', 19, '9-C', 13),
(574, '97118', '7256', 'Muayyad Najy Assajad', 19, '9-C', 14),
(575, '97119', '7693', 'Mufti Nur Muhammad', 19, '9-C', 15),
(576, '97124', '7985', 'Muhamad Rifqi Fathurrahman', 19, '9-C', 16),
(577, '97130', '5634', 'Muhammad Al-Fatih', 19, '9-C', 17),
(578, '97141', '7962', 'Muhammad Azzam Fathurrahman', 19, '9-C', 18),
(579, '97146', '6874', 'Muhammad Fadhil Rafif Ashari', 19, '9-C', 19),
(580, '97149', '5739', 'Muhammad Faiz Widyastama', 19, '9-C', 20),
(581, '97155', '7583', 'Muhammad Fatih', 19, '9-C', 21),
(582, '97157', '9873', 'Muhammad Fawaaz Alqordhawy', 19, '9-C', 22),
(583, '97194', '3562', 'Muhammad Rizki Ath Thaariq', 19, '9-C', 23),
(584, '97197', '9836', 'Muhammad Syamil Alghiffari', 19, '9-C', 24),
(585, '97225', '4867', 'Rafi Rafsanjani Junior', 19, '9-C', 25),
(586, '97226', '7935', 'Rafid Zaidan Abdurrahman', 19, '9-C', 26),
(587, '97249', '6579', 'Shafiq Shidqi Azizi', 19, '9-C', 27),
(588, '97253', '8493', 'Uqinu Attaqi', 19, '9-C', 28),
(589, '97257', '3297', 'Wahyu Setyawan', 19, '9-C', 29),
(590, '97266', '5872', 'Ziyad Faturrahman Muslim', 19, '9-C', 30),
(591, '97001', '3925', 'Abdel Rafi Ataurahman', 20, '9-D', 1),
(592, '97014', '7943', 'Ahmad Fadil', 20, '9-D', 2),
(593, '90011', '3976', 'Ahmad Syakir Mahansar', 20, '9-D', 3),
(594, '97022', '2983', 'Ahya Ahmad Habibi', 20, '9-D', 4),
(595, '97036', '7249', 'Awad Abda Tawab', 20, '9-D', 5),
(596, '97040', '3956', 'Azzam Musyafiq Muhammad Warsino', 20, '9-D', 6),
(597, '97055', '3942', 'Faiz Ahdi Abdillah', 20, '9-D', 7),
(598, '97057', '7368', 'Fakhreddine Ali', 20, '9-D', 8),
(599, '97072', '5934', 'Ghailan Alfath Ulwanqobus', 20, '9-D', 9),
(600, '97089', '9876', 'Hilal Dipo Dinullah', 20, '9-D', 10),
(601, '97111', '2489', 'Mochamad Aldebaran Razwa', 20, '9-D', 11),
(602, '97114', '3582', 'Mohamad Yusuf Haidar Abbas', 20, '9-D', 12),
(603, '97161', '7643', 'Mohammad Ghifari Azzahran', 20, '9-D', 13),
(604, '97120', '8945', 'Muh. Rayyan Al Qadri', 20, '9-D', 14),
(605, '97121', '6237', 'Muhamad Arya Raena Nugraha', 20, '9-D', 15),
(606, '97131', '5948', 'Muhammad Al-Ghifari', 20, '9-D', 16),
(607, '97134', '6953', 'Muhammad Alwan Farrosi', 20, '9-D', 17),
(608, '97140', '5398', 'Muhammad Azkal Azkiya', 20, '9-D', 18),
(609, '97148', '2957', 'Muhammad Faiz El Mahmudi', 20, '9-D', 19),
(610, '97154', '5892', 'Muhammad Fatih', 20, '9-D', 20),
(611, '97163', '2657', 'Muhammad Hafizh Fauzan', 20, '9-D', 21),
(612, '97165', '8652', 'Muhammad Hassan Rizqi', 20, '9-D', 22),
(613, '97177', '3259', 'Muhammad Khalil Jundi', 20, '9-D', 23),
(614, '97179', '9483', 'Muhammad Mukhtar Syafiq Zallum', 20, '9-D', 24),
(615, '97200', '5837', 'Muhammad Zaidan Ilmi Addin', 20, '9-D', 25),
(616, '97205', '9465', 'Mujahid Munir Al Fatih Zega', 20, '9-D', 26),
(617, '97213', '5398', 'Naufal Ammar Rahhadatul Aisy', 20, '9-D', 27),
(618, '97221', '3458', 'Osama Faidullah', 20, '9-D', 28),
(619, '97240', '6429', 'Reza Putra Pratama', 20, '9-D', 29),
(620, '97259', '7298', 'Wildan Nurrahman', 20, '9-D', 30),
(621, '97018', '3968', 'Ahmad Tristan Adya', 21, '9-E', 1),
(622, '97024', '9235', 'Ali Abdurrahman Hasan', 21, '9-E', 2),
(623, '97042', '3479', 'Dafa Hauzaan Dzakwan', 21, '9-E', 3),
(624, '97043', '2436', 'Daffa Dhiaulhaq Latif', 21, '9-E', 4),
(625, '97049', '9263', 'Dimas Azhfar Firdaus', 21, '9-E', 5),
(626, '97096', '5289', 'Imam Maulid', 21, '9-E', 6),
(627, '97098', '7692', 'Izzatu Bani Syaamil', 21, '9-E', 7),
(628, '97104', '2873', 'Labib Abdul Aziz', 21, '9-E', 8),
(629, '97108', '3546', 'Mahbubil Khanif', 21, '9-E', 9),
(630, '97116', '8493', 'Mohammad Fitrah Ramadhani', 21, '9-E', 10),
(631, '97122', '2659', 'Muhamad Farel Ardiansyah', 21, '9-E', 11),
(632, '97127', '6243', 'Muhammad Abu Dzar Alghifari', 21, '9-E', 12),
(633, '97132', '5768', 'Muhammad Alifa Putra Kamal', 21, '9-E', 13),
(634, '97136', '2345', 'Muhammad Atqonuddinillah', 21, '9-E', 14),
(635, '97137', '6239', 'Muhammad Ayyash Fathurrahman', 21, '9-E', 15),
(636, '97138', '9742', 'Muhammad Ayyasy Arrantisi', 21, '9-E', 16),
(637, '97139', '2975', 'Muhammad Aziz', 21, '9-E', 17),
(638, '97145', '7852', 'Muhammad Emil Lutfi', 21, '9-E', 18),
(639, '97151', '2893', 'Muhammad Farhan Faqih', 21, '9-E', 19),
(640, '97156', '2894', 'Muhammad Fauzan Fathullah Ash Shiddieqy', 21, '9-E', 20),
(641, '97203', '6548', 'Muhammad Zidny Akrimy', 21, '9-E', 21),
(642, '97204', '4326', 'Muhammad Zubair Qowwamuntsabit', 21, '9-E', 22),
(643, '97207', '9684', 'Mumtaz Faris Haidar', 21, '9-E', 23),
(644, '97208', '4932', 'Mushab Umair', 21, '9-E', 24),
(645, '97227', '4729', 'Rafinas Akbar', 21, '9-E', 25),
(646, '97231', '9278', 'Rajendra Ziyadhiy Kumala Dewa', 21, '9-E', 26),
(647, '97245', '4328', 'Rully Muhammad Fadillah', 21, '9-E', 27),
(648, '97251', '3762', 'Syawal Zain Rizqillah', 21, '9-E', 28),
(649, '97255', '2854', 'Vito Luvian Rendragraha', 21, '9-E', 29),
(650, '97267', '8563', 'Ziyad Tsaqif Jamaludin', 21, '9-E', 30),
(651, '97002', '8637', 'Abdullah Azzam Fadhil Ramadhan', 22, '9-F', 1),
(652, '97011', '7539', 'Afif Jundullah  Musriadin', 22, '9-F', 2),
(653, '97020', '5378', 'Ahmad Zainul Fikri', 22, '9-F', 3),
(654, '97029', '8734', 'Ar Rasyid Ibrahim Huwaidi', 22, '9-F', 4),
(655, '97031', '5934', 'Ardra Razaan Syaikhah', 22, '9-F', 5),
(656, '97035', '9876', 'Aufa Abdillah Muhammad Fahna', 22, '9-F', 6),
(657, '97047', '5342', 'Dias Rafza Almuyassar', 22, '9-F', 7),
(658, '97050', '3285', 'Dzaky Nashruddin Ghazali', 22, '9-F', 8),
(659, '97056', '5643', 'Faiza Zain Supriyatno', 22, '9-F', 9),
(660, '97058', '4592', 'Fakhri Abdul Hafizh', 22, '9-F', 10),
(661, '97085', '6872', 'Hanif Fathurrohmat', 22, '9-F', 11),
(662, '97095', '2587', 'Imam Afkar Sentosa', 22, '9-F', 12),
(663, '97125', '4289', 'Muhammad Abbad Al Farisi', 22, '9-F', 13),
(664, '97129', '2957', 'Muhammad Al Ghazi Dhiyaulhaq', 22, '9-F', 14),
(665, '97133', '7384', 'Muhammad Alifatulmuaqi', 22, '9-F', 15),
(666, '97153', '2354', 'Muhammad Fathan Zid', 22, '9-F', 16),
(667, '97166', '4236', 'Muhammad Hilal Fachri', 22, '9-F', 17),
(668, '97170', '2947', 'Muhammad Ihsan Ramadhan', 22, '9-F', 18),
(669, '97185', '7382', 'Muhammad Rafa Izzat Rantisi', 22, '9-F', 19),
(670, '97201', '8369', 'Muhammad Zaki Alfarisi', 22, '9-F', 20),
(671, '97216', '2539', 'Naufal Lizarman', 22, '9-F', 21),
(672, '97218', '3695', 'Nauval Haris Al Ghiffary', 22, '9-F', 22),
(673, '97229', '5687', 'Raihan Abdul Azis', 22, '9-F', 23),
(674, '97235', '9625', 'Rasydan Haziqulhaq', 22, '9-F', 24),
(675, '97236', '5987', 'Rasyid Zaki Albanna', 22, '9-F', 25),
(676, '97247', '4829', 'Salman Halim Razak', 22, '9-F', 26),
(677, '97250', '6735', 'Syahruz Syah Nugraha', 22, '9-F', 27),
(678, '97260', '9837', 'Yahya  Robbani', 22, '9-F', 28),
(679, '97262', '7582', 'Zaid Ats Tsabit', 22, '9-F', 29),
(680, '97013', '3279', 'Ahmad Alim Robbani', 23, '9-G', 1),
(681, '97021', '5834', 'Ahsanul Huda Pratama', 23, '9-G', 2),
(682, '97023', '2859', 'Alfi Masruri', 23, '9-G', 3),
(683, '97065', '4837', 'Fatan Jannatan Maulaven Billah Saf', 23, '9-G', 4),
(684, '97078', '9867', 'Haidar Habib Mahbubi', 23, '9-G', 5),
(685, '97082', '4796', 'Hanief Muslim Jiyaad', 23, '9-G', 6),
(686, '97090', '2396', 'Hilma Ulil Azmi', 23, '9-G', 7),
(687, '97100', '9756', 'Izzuddin Ihsan', 23, '9-G', 8),
(688, '97123', '7549', 'Muhamad Hafidz Al Hakim', 23, '9-G', 9),
(689, '97135', '9436', 'Muhammad Assariy Al-Fath', 23, '9-G', 10),
(690, '97143', '9564', 'Muhammad Danish', 23, '9-G', 11),
(691, '97150', '2847', 'Muhammad Faqih Darmawan', 23, '9-G', 12),
(692, '97152', '5329', 'Muhammad Farras Aisy', 23, '9-G', 13),
(693, '97169', '2875', 'Muhammad Iedly Al-Kautsar', 23, '9-G', 14),
(694, '97171', '7348', 'Muhammad Ilham Fikri Rabbani', 23, '9-G', 15),
(695, '97173', '3942', 'Muhammad Ismail Ashidqi', 23, '9-G', 16),
(696, '97181', '9348', 'Muhammad Nabil Ihsan', 23, '9-G', 17),
(697, '97187', '5298', 'Muhammad Rafi Akbar', 23, '9-G', 18),
(698, '97199', '5968', 'Muhammad Umar Syahata', 23, '9-G', 19),
(699, '97214', '6534', 'Naufal Erva Syahputra', 23, '9-G', 20),
(700, '97215', '9684', 'Naufal Farid Bayanaka', 23, '9-G', 21),
(701, '97217', '3795', 'Nautiko Ozora Latumahina', 23, '9-G', 22),
(702, '97232', '8256', 'Rama Rizal Rabbani', 23, '9-G', 23),
(703, '97233', '8297', 'Ramdani Gemilliano Fuad', 23, '9-G', 24),
(704, '97238', '8253', 'Reiki Muhammad Nizar', 23, '9-G', 25),
(705, '97241', '2483', 'Rhazes Harith Shanahan', 23, '9-G', 26),
(706, '97243', '4768', 'Rizky Feryadi', 23, '9-G', 27),
(707, '97244', '6234', 'Robby Syafiq Farizi', 23, '9-G', 28),
(708, '97256', '5678', 'Wafa Aqdissalam Sirojulmunir', 23, '9-G', 29),
(709, '97265', '7548', 'Zildan Pramuditha Ependi', 23, '9-G', 30),
(710, '97003', '9284', 'Abdullah Hammam', 24, '9-H', 1),
(711, '97005', '7625', 'Abdurrahman Hammam Al Munif', 24, '9-H', 2),
(712, '97006', '5269', 'Abdurrahman Rijal Faruqi', 24, '9-H', 3),
(713, '97007', '9856', 'Abdurrasyid Taqiyuddin', 24, '9-H', 4),
(714, '97008', '8935', 'Achmad Maulana Jibbril', 24, '9-H', 5),
(715, '97019', '5483', 'Ahmad Zaim Naufal Hayfa', 24, '9-H', 6),
(716, '97046', '7429', 'Dhafa Dwi Andhika', 24, '9-H', 7),
(717, '97052', '7943', 'Fadly Khoerul Umam', 24, '9-H', 8),
(718, '97053', '7632', 'Faiq Muawwal', 24, '9-H', 9),
(719, '97060', '7489', 'Fakhri Hanif Mussyafa', 24, '9-H', 10),
(720, '97079', '4375', 'Haikal Salman Mubarok Candra', 24, '9-H', 11),
(721, '97081', '2398', 'Handy Hasby Falach', 24, '9-H', 12),
(722, '97086', '3672', 'Hasan Azmi', 24, '9-H', 13),
(723, '97091', '2864', 'Hizba Muhammad Husna', 24, '9-H', 14),
(724, '97092', '3972', 'Husain Abdurrahman', 24, '9-H', 15),
(725, '97094', '7265', 'Ikhsan Rafif', 24, '9-H', 16),
(726, '97128', '4285', 'Muhammad Abyan', 24, '9-H', 17),
(727, '97144', '5376', 'Muhammad Dzaki Qaidushidki', 24, '9-H', 18),
(728, '97162', '4928', 'Muhammad Ghiyats Syarif', 24, '9-H', 19),
(729, '97164', '4963', 'Muhammad Hasan Islami', 24, '9-H', 20),
(730, '97175', '3672', 'Muhammad Izzudin Ramdhani', 24, '9-H', 21),
(731, '97189', '3684', 'Muhammad Rafkha Aji Amarta', 24, '9-H', 22),
(732, '97210', '6752', 'Nabeel Fazlie Falah', 24, '9-H', 23),
(733, '97211', '5269', 'Nabiel Hamka Sangkala', 24, '9-H', 24),
(734, '97223', '4279', 'Radhitya Daffansyah Yahya', 24, '9-H', 25),
(735, '97224', '9235', 'Raditya Rakha Irianto', 24, '9-H', 26),
(736, '97239', '5489', 'Reza Cahya Wardana', 24, '9-H', 27),
(737, '97258', '3549', 'Wajiih Saldi Matta', 24, '9-H', 28),
(738, '97263', '7539', 'Zakka Ismail Izzaturrazaq Gunadi', 24, '9-H', 29),
(739, '97264', '5478', 'Ziankha Mahdavikya', 24, '9-H', 30),
(740, '87007', '2764', 'Abdullah Shafi', 9, '8-A', 1),
(741, '87010', '5698', 'Abdurrahman Al Banna', 9, '8-A', 2),
(742, '87014', '7693', 'Adib Murtadha', 9, '8-A', 3),
(743, '87037', '5439', 'Anas Fadhil Mubarok', 9, '8-A', 4),
(744, '87042', '8647', 'Arya Danadyaksa Kurniawan', 9, '8-A', 5),
(745, '87043', '3854', 'Aufa Jiaullhaq Ahmad', 9, '8-A', 6),
(746, '87044', '6879', 'Azmi Habiburrahman Siregar', 9, '8-A', 7),
(747, '87048', '2357', 'Derryl Prima Ihsan Elannur', 9, '8-A', 8),
(748, '87055', '8465', 'Emir Mufid Fahmi', 9, '8-A', 9),
(749, '87063', '2493', 'Fakhri Ahmad', 9, '8-A', 10),
(750, '87064', '7869', 'Fakhri Ahmad Zaidan', 9, '8-A', 11),
(751, '87070', '2768', 'Farras Abdurrahman Annawwaf', 9, '8-A', 12),
(752, '87075', '3497', 'Fathi Ahmaddienullah', 9, '8-A', 13),
(753, '87080', '8295', 'Febry Setiawan', 9, '8-A', 14),
(754, '87102', '6284', 'Khoirrais Dhiya Albany', 9, '8-A', 15),
(755, '87110', '9674', 'M.Dafa Wildan R.Suaib', 9, '8-A', 16),
(756, '87112', '8539', 'Malka Athallahva Neezar', 9, '8-A', 17),
(757, '87121', '5342', 'Muhamad Rayhan', 9, '8-A', 18),
(758, '87125', '4326', 'Muhammad Affan Al Fawwas', 9, '8-A', 19),
(759, '87144', '6284', 'Muhammad Fardan Aqil Herlam', 9, '8-A', 20),
(760, '87156', '3798', 'Muhammad Hafidz Baihaqi', 9, '8-A', 21),
(761, '87162', '3857', 'Muhammad Iqbal Rabbani', 9, '8-A', 22),
(762, '87163', '2937', 'Muhammad Irham Usman', 9, '8-A', 23),
(763, '87175', '3928', 'Muhammad Nizar Maulana Akbar', 9, '8-A', 24),
(764, '87179', '2598', 'Muhammad Rafif Sidqi', 9, '8-A', 25),
(765, '87207', '6879', 'Mujahid Ali Ar-Rasyid', 9, '8-A', 26),
(766, '87218', '7928', 'Naufal Zaffar Putra Alsa', 9, '8-A', 27),
(767, '87221', '8746', 'Radhya Algithraf Ramadhana', 9, '8-A', 28),
(768, '87226', '3429', 'Rayyan Rafif Alfarisi', 9, '8-A', 29),
(769, '87229', '5267', 'Razan Muhammad Nafis', 9, '8-A', 30),
(770, '87238', '4378', 'San Driva Dzikry Aqiila', 9, '8-A', 31),
(771, '87245', '3685', 'Syauqi Falih Hamzah', 9, '8-A', 32),
(772, '87262', '2395', 'Zheke Andrean Muhammad Akbar', 9, '8-A', 33),
(773, '87004', '9236', 'Abdullah Azzam', 10, '8-B', 1),
(774, '87006', '3698', 'Abdullah Muhammad Umar', 10, '8-B', 2),
(775, '87011', '8975', 'Abdurrahman Thoriq Ramadhan', 10, '8-B', 3),
(776, '87031', '8752', 'Alfin Syaghaf Iswara', 10, '8-B', 4),
(777, '87046', '3526', 'Binaya Rizqunnafis', 10, '8-B', 5),
(778, '87053', '4982', 'Dzakwan Hudzaifah Marhaban', 10, '8-B', 6),
(779, '87054', '2597', 'Dzikry Ainurahman Abimanyu', 10, '8-B', 7),
(780, '87056', '6294', 'Esa Fadhillah Saputra', 10, '8-B', 8),
(781, '87060', '3872', 'Fahritino Aghasi Firdaus', 10, '8-B', 9),
(782, '87069', '3657', 'Fariz Zaidan Napitupulu', 10, '8-B', 10),
(783, '87072', '9854', 'Farras Syahmi Akram', 10, '8-B', 11),
(784, '87078', '2956', 'Fauzan Rizki Andhika', 10, '8-B', 12),
(785, '87084', '2694', 'Ghiyas Fatih Al-Ghifary', 10, '8-B', 13),
(786, '87085', '3745', 'Ghulam Hilmi Farros', 10, '8-B', 14),
(787, '87095', '6249', 'Ibrohim Abdurrahman', 10, '8-B', 15),
(788, '87106', '4523', 'M.  Syakir  Hanafi  Marasabessy', 10, '8-B', 16),
(789, '87108', '5679', 'M. Fathurrahman F. Malan', 10, '8-B', 17),
(790, '87127', '7248', 'Muhammad Akhyar', 10, '8-B', 18),
(791, '87132', '3768', 'Muhammad Alfatih Rahmatullah', 10, '8-B', 19),
(792, '87150', '7963', 'Muhammad Fauzi Anshari Nasution', 10, '8-B', 20),
(793, '87151', '6893', 'Muhammad Fawwaz Fathurahman', 10, '8-B', 21),
(794, '87153', '9268', 'Muhammad Fikri Azhar', 10, '8-B', 22),
(795, '87164', '9253', 'Muhammad Izzuddin', 10, '8-B', 23),
(796, '87167', '9587', 'Muhammad Kayyisul Fathin', 10, '8-B', 24),
(797, '87168', '7283', 'Muhammad Khaidar Azka', 10, '8-B', 25),
(798, '87171', '3678', 'Muhammad Nabhan Khawarizmi Rosyadi', 10, '8-B', 26),
(799, '87192', '4759', 'Muhammad Savero', 10, '8-B', 27),
(800, '87209', '6294', 'Mush Ab Habbiburrahman', 10, '8-B', 28),
(801, '87210', '2683', 'Muslihul Umam', 10, '8-B', 29),
(802, '87217', '9783', 'Naufal Naffaa Anfays', 10, '8-B', 30),
(803, '87233', '3697', 'Roid Robbany Ahmad Alfaruq', 10, '8-B', 31),
(804, '87244', '9723', 'Syarif   Muhammad   Bagir', 10, '8-B', 32),
(805, '87256', '3672', 'Zahran Alaudin Anwari', 10, '8-B', 33),
(806, '87009', '5687', 'Abdur Rohman Aqil Musyari', 11, '8-C', 1),
(807, '87016', '5827', 'Adnan Wildan Syauqi', 11, '8-C', 2),
(808, '87018', '3597', 'Agis Hijar Sahlan', 11, '8-C', 3),
(809, '87019', '2435', 'Ahmad Abdan Syakuro', 11, '8-C', 4),
(810, '87022', '6943', 'Ahmad Mutashim Billah', 11, '8-C', 5),
(811, '87025', '5328', 'Akmal Arkaan Fahrezi', 11, '8-C', 6),
(812, '87035', '9345', 'Ammaar Tsaqiif El Farqad', 11, '8-C', 7),
(813, '87059', '3465', 'Faeza Rafiansyah', 11, '8-C', 8),
(814, '87074', '7236', 'Faruq Mifta Hurrizky Herdin', 11, '8-C', 9),
(815, '87077', '7658', 'Fatih Fadhilah Rafif', 11, '8-C', 10),
(816, '87081', '7324', 'Fikri Hafiyyan Luthfi', 11, '8-C', 11),
(817, '87083', '4763', 'Ghani Akmal Abadi', 11, '8-C', 12),
(818, '87098', '4762', 'Irfan Rasyid Arrizqi', 11, '8-C', 13),
(819, '87100', '7386', 'Jotama Iqbal Hilaby ', 11, '8-C', 14),
(820, '87107', '8643', 'M. Farros Alifiya Haya', 11, '8-C', 15),
(821, '87113', '5387', 'Mobarez Al Mattazora', 11, '8-C', 16),
(822, '87123', '9874', 'Muhamad Salman Khozin', 11, '8-C', 17),
(823, '87124', '7839', 'Muhamad Wildan Muzaqi', 11, '8-C', 18),
(824, '87155', '4758', 'Muhammad Hafidz Abiyyu Dzaky', 11, '8-C', 19),
(825, '87158', '2765', 'Muhammad Hilmy Aziz', 11, '8-C', 20),
(826, '87165', '5362', 'Muhammad Izzuddin', 11, '8-C', 21),
(827, '87166', '9435', 'Muhammad Jundullah Al Faiz', 11, '8-C', 22),
(828, '87169', '6549', 'Muhammad Miftahulizza', 11, '8-C', 23),
(829, '87172', '7859', 'Muhammad Nasywan Fikri Utomo', 11, '8-C', 24),
(830, '87196', '6253', 'Muhammad Syamil Jadwa', 11, '8-C', 25),
(831, '87197', '7326', 'Muhammad Taqy Al Faqih', 11, '8-C', 26),
(832, '87198', '9476', 'Muhammad Umar Hanif', 11, '8-C', 27),
(833, '87205', '7358', 'Muhammad Zufar Abdurrahman', 11, '8-C', 28),
(834, '87225', '6785', 'Rayhan Ahmad Wijaya', 11, '8-C', 29),
(835, '87235', '8923', 'Said Rafif', 11, '8-C', 30),
(836, '87240', '5876', 'Syabil Hanif Khoirul Afnan', 11, '8-C', 31),
(837, '87261', '6348', 'Zawki Nawfal Ghaisan', 11, '8-C', 32),
(838, '87008', '7239', 'Abdullah Yusuf Azzam', 12, '8-D', 1),
(839, '87013', '3548', 'Achmad Zaki Al Ghiffari', 12, '8-D', 2),
(840, '87017', '4976', 'Agha Safaraz Adi', 12, '8-D', 3),
(841, '87020', '5627', 'Ahmad Ghazi Alghifari', 12, '8-D', 4),
(842, '87024', '7894', 'Akbar Fakhri Abdul Majid', 12, '8-D', 5),
(843, '87026', '4528', 'Akmal Pauzan', 12, '8-D', 6),
(844, '87030', '4692', 'Alfan Zaqian Nufus', 12, '8-D', 7),
(845, '87033', '8397', 'Am Ghazi Alfaridzi', 12, '8-D', 8),
(846, '87050', '8425', 'Dizy Faiz Bangkit Pratama', 12, '8-D', 9),
(847, '87051', '8265', 'Duha Fazle Rabbani', 12, '8-D', 10),
(848, '87057', '5467', 'Fachrul Ihza Fasawa', 12, '8-D', 11),
(849, '87062', '5426', 'Faiz Muhammad Ahsan', 12, '8-D', 12),
(850, '87086', '6298', 'Gibraltar Ziaulhaq', 12, '8-D', 13),
(851, '87091', '2674', 'Hanif Rabbani Gunawan', 12, '8-D', 14),
(852, '87119', '8762', 'Muhamad Ilham Febrainto', 12, '8-D', 15),
(853, '87137', '8462', 'Muhammad Azzam Alhaq', 12, '8-D', 16),
(854, '87140', '9328', 'Muhammad Faathir Madani', 12, '8-D', 17),
(855, '87145', '6973', 'Muhammad Farel Pasha', 12, '8-D', 18),
(856, '87148', '9532', 'Muhammad Fathin Muhyiddin', 12, '8-D', 19),
(857, '87173', '4976', 'Muhammad Naufal Muzakkii Putrana Sugandi', 12, '8-D', 20),
(858, '87178', '4765', 'Muhammad Rafie Athar', 12, '8-D', 21),
(859, '87180', '6237', 'Muhammad Rahil Rabbani', 12, '8-D', 22),
(860, '87263', '7945', 'Muhammad Raihan Fadhilah', 12, '8-D', 23),
(861, '87202', '5983', 'Muhammad Zaini Ghani', 12, '8-D', 24),
(862, '87203', '6278', 'Muhammad Zaky Haidar', 12, '8-D', 25),
(863, '87206', '5324', 'Muhammad Zuhud Lillah', 12, '8-D', 26),
(864, '87216', '8724', 'Naufal Hamdi Abdillah', 12, '8-D', 27),
(865, '87222', '8932', 'Rafi Rabbani Harisman Putra', 12, '8-D', 28),
(866, '87228', '9587', 'Rayzan Hilmi Ariotejo', 12, '8-D', 29),
(867, '87231', '4872', 'Rifqi Aunur Rahman', 12, '8-D', 30),
(868, '87237', '9427', 'Salman Muhammad Ayyasy Al Hafizh', 12, '8-D', 31),
(869, '87249', '2745', 'Umar Nasrallah', 12, '8-D', 32),
(870, '87012', '7386', 'Abid Jasir Muyassar', 13, '8-E', 1),
(871, '87021', '6574', 'Ahmad Haidar Alkhoiri', 13, '8-E', 2),
(872, '87032', '4936', 'Alif Anargya', 13, '8-E', 3),
(873, '87038', '2978', 'Andi Muhammad Nurmulia Firdausy', 13, '8-E', 4),
(874, '87045', '9387', 'Bani Khairullah', 13, '8-E', 5),
(875, '87061', '5274', 'Faiz Abdurrahman', 13, '8-E', 6),
(876, '87065', '8945', 'Fakhri Yahya', 13, '8-E', 7),
(877, '87066', '8369', 'Fakri Ukkasyah', 13, '8-E', 8),
(878, '87068', '5374', 'Faris Fasya Musthafa', 13, '8-E', 9),
(879, '87076', '7362', 'Fathur Rachman', 13, '8-E', 10),
(880, '87093', '7536', 'Hasan An Nadawi Salim', 13, '8-E', 11),
(881, '87096', '9572', 'Ihsan Syamil Mubarok', 13, '8-E', 12),
(882, '87097', '6352', 'Iltizam Abdurrahman Syauqi', 13, '8-E', 13),
(883, '87099', '7695', 'Izzazudin Al Qasam', 13, '8-E', 14),
(884, '87105', '8945', 'Labib Ajiman', 13, '8-E', 15),
(885, '87129', '5248', 'Muhammad Al Kahfi M.M', 13, '8-E', 16),
(886, '87149', '5629', 'Muhammad Fauzan', 13, '8-E', 17),
(887, '87157', '7825', 'Muhammad Hilmi Linggi', 13, '8-E', 18),
(888, '87159', '8957', 'Muhammad Ikhlasul Fokatea', 13, '8-E', 19),
(889, '87161', '7596', 'Muhammad Imaduddin Zanki Nashuha', 13, '8-E', 20),
(890, '87170', '7382', 'Muhammad Musthofainal Akhyar', 13, '8-E', 21),
(891, '87185', '6438', 'Muhammad Rasyid Ari Saputro', 13, '8-E', 22),
(892, '87188', '3489', 'Muhammad Salim Al Muntazhar', 13, '8-E', 23),
(893, '87199', '6894', 'Muhammad Yuko Arrumi', 13, '8-E', 24),
(894, '87200', '9823', 'Muhammad Yusuf Azzam', 13, '8-E', 25),
(895, '87212', '8497', 'Nabil Amin Fathurrahman', 13, '8-E', 26),
(896, '87213', '6857', 'Nadhif Miftah Hibatullah', 13, '8-E', 27),
(897, '87220', '6485', 'Nur Muhammad Sofyan', 13, '8-E', 28),
(898, '87230', '7268', 'Ridho Pratama Wahyudi', 13, '8-E', 29),
(899, '87234', '5496', 'Rulian Faaz', 13, '8-E', 30),
(900, '87257', '7936', 'Zaidan Januar Musyaffa', 13, '8-E', 31),
(901, '87260', '5274', 'Zaky Abdul Rafi', 13, '8-E', 32),
(902, '87023', '7698', 'Ahmad Zaki Yasykur Pandia', 14, '8-F', 1),
(903, '87028', '2746', 'Al Atiqh Warith Abdillah', 14, '8-F', 2),
(904, '87029', '8267', 'Al Sayyid Ahmad Syaamil Sahat T', 14, '8-F', 3),
(905, '87040', '2483', 'Arfa Fadlillah Zawahir', 14, '8-F', 4),
(906, '87041', '3792', 'Arrasyiq Alam Ariansyah', 14, '8-F', 5),
(907, '87052', '4925', 'Dzaki Juliansyah Machfud', 14, '8-F', 6),
(908, '87067', '3269', 'Faradis', 14, '8-F', 7),
(909, '87071', '3594', 'Farras Nafis Ferdiansyah', 14, '8-F', 8),
(910, '87088', '6894', 'Hafizh Abdurrahman', 14, '8-F', 9),
(911, '87089', '7398', 'Haidar Ahmad Muslih', 14, '8-F', 10),
(912, '87092', '9672', 'Hario Fahmi Rizqiawan', 14, '8-F', 11),
(913, '87103', '9426', 'Khotibul Umam Al Isyrafi', 14, '8-F', 12),
(914, '87117', '9827', 'Muhamad Dzaki Akbar', 14, '8-F', 13),
(915, '87118', '9832', 'Muhamad Hafidz Padmadijaya', 14, '8-F', 14),
(916, '87122', '7238', 'Muhamad Rizqi Al Maliki', 14, '8-F', 15),
(917, '87128', '6859', 'Muhammad Al Fatih', 14, '8-F', 16),
(918, '87133', '5463', 'Muhammad Alif Al Ghaza', 14, '8-F', 17),
(919, '87135', '2974', 'Muhammad Ayyasy Cahya Fajri', 14, '8-F', 18),
(920, '87139', '2893', 'Muhammad Ezra Tsany', 14, '8-F', 19),
(921, '87147', '2697', 'Muhammad Fathi Arrayyan', 14, '8-F', 20),
(922, '87181', '3279', 'Muhammad Raihan Mahasin', 14, '8-F', 21),
(923, '87182', '5236', 'Muhammad Rakha Alfari', 14, '8-F', 22),
(924, '87191', '6374', 'Muhammad Salman Facheri', 14, '8-F', 23),
(925, '87201', '7942', 'Muhammad Zaid Fahmi', 14, '8-F', 24),
(926, '87241', '2467', 'Syafiq Ahnaf', 14, '8-F', 25),
(927, '87246', '2387', 'Teuku Azqia Bachna Rizqi', 14, '8-F', 26),
(928, '87247', '4936', 'Ulul Akbar Rahmadi', 14, '8-F', 27),
(929, '87250', '7649', 'Vicky Mohamad Zaqki Alfathir Suherman', 14, '8-F', 28),
(930, '87251', '2975', 'Wildan Attariq Syah', 14, '8-F', 29),
(931, '87252', '8369', 'Yusra Haris Alfath', 14, '8-F', 30),
(932, '87253', '5982', 'Yusuf Ahsan Faris', 14, '8-F', 31),
(933, '87255', '3462', 'Zahid Ikhwan', 14, '8-F', 32),
(934, '87001', '2896', 'Abdan Muhtada', 15, '8-G', 1),
(935, '87005', '2459', 'Abdullah Fathurrahman', 15, '8-G', 2),
(936, '87027', '9374', 'Akwa Ridzki Tsaqiif', 15, '8-G', 3),
(937, '87034', '3568', 'Amir Hamzah', 15, '8-G', 4),
(938, '87039', '8325', 'Anwar Ibrahim', 15, '8-G', 5),
(939, '87047', '6372', 'Chairul Azzam', 15, '8-G', 6),
(940, '87058', '3465', 'Fadhil Hilmi Fathurohman', 15, '8-G', 7),
(941, '87087', '2593', 'Hafiz Zakhir', 15, '8-G', 8),
(942, '87090', '5432', 'Hamzah Miski Ramadhan', 15, '8-G', 9),
(943, '87101', '7248', 'Khaeri Ismatun Awwaly', 15, '8-G', 10),
(944, '87109', '6835', 'M. Raisyah Islahul Azmi', 15, '8-G', 11),
(945, '87114', '2437', 'Moch. Syaamil Muntahalkamal', 15, '8-G', 12),
(946, '87115', '8346', 'Mohamad Nejad Akbar Islami', 15, '8-G', 13),
(947, '87120', '8426', 'Muhamad Luthfi Raihanul Islamy', 15, '8-G', 14),
(948, '87130', '2649', 'Muhammad Alfath Ramadhan Syaifuddin', 15, '8-G', 15),
(949, '87131', '4829', 'Muhammad Alfatih Pasha', 15, '8-G', 16),
(950, '87136', '4937', 'Muhammad Azri', 15, '8-G', 17),
(951, '87143', '3258', 'Muhammad Fakhri Fathurrahman', 15, '8-G', 18),
(952, '87152', '5726', 'Muhammad Fawwaz Rahman', 15, '8-G', 19),
(953, '87176', '3674', 'Muhammad Prasta Nur Ali', 15, '8-G', 20),
(954, '87177', '8793', 'Muhammad Radja Defit Perdana', 15, '8-G', 21),
(955, '87184', '3468', 'Muhammad Rasyid Alhanif', 15, '8-G', 22),
(956, '87186', '4697', 'Muhammad Rifqi Alghiffari Pratama', 15, '8-G', 23),
(957, '87187', '6598', 'Muhammad Risyad Nauval Mujahid', 15, '8-G', 24),
(958, '87189', '4735', 'Muhammad Salman Al Farisi', 15, '8-G', 25),
(959, '87195', '9574', 'Muhammad Syamil Azmy Ramadhan', 15, '8-G', 26),
(960, '87208', '7296', 'Mujahid Haikal Yahya', 15, '8-G', 27),
(961, '87211', '5987', 'Musthafa Hanif Bukhori', 15, '8-G', 28),
(962, '87219', '4259', 'Nazwan Raya Muhammad', 15, '8-G', 29),
(963, '87223', '4893', 'Rafif Abdan Hadi', 15, '8-G', 30),
(964, '87242', '8274', 'Syafiq Maulana', 15, '8-G', 31),
(965, '87259', '6325', 'Zakariyya', 15, '8-G', 32),
(966, '87002', '4872', 'Abdul Kodir Jaelani', 16, '8-H', 1),
(967, '87003', '3542', 'Abdullah Azzam', 16, '8-H', 2),
(968, '87036', '6925', 'Ananda Luthfi Sudiro', 16, '8-H', 3),
(969, '87049', '5934', 'Dhiyaulhaq Musthafa Al Ayyubi', 16, '8-H', 4),
(970, '87073', '8296', 'Farrel Khalifa Amarta', 16, '8-H', 5),
(971, '87079', '6397', 'Fawwaz Hammam Kendra Aji', 16, '8-H', 6),
(972, '87082', '6534', 'Ghais Ati Muzaffir Roby', 16, '8-H', 7),
(973, '87094', '8326', 'Hilmy Abdurrahman Alfatih', 16, '8-H', 8),
(974, '87104', '9437', 'Khyar El Fajri', 16, '8-H', 9),
(975, '87116', '6532', 'Mu`Adz   Amirul  Islam', 16, '8-H', 10),
(976, '87126', '7453', 'Muhammad Ahzami Budiman', 16, '8-H', 11),
(977, '87134', '7286', 'Muhammad Arkana Fayyadh', 16, '8-H', 12),
(978, '87138', '4927', 'Muhammad Daffa Furqoon', 16, '8-H', 13),
(979, '87141', '4798', 'Muhammad Fahri Allam Santoso', 16, '8-H', 14),
(980, '87142', '7462', 'Muhammad Faiz Afkar', 16, '8-H', 15),
(981, '87146', '9538', 'Muhammad Farell Al Hafiz', 16, '8-H', 16),
(982, '87154', '8234', 'Muhammad Firdaus Athaillah', 16, '8-H', 17),
(983, '87160', '4579', 'Muhammad Ikhwan Arivian', 16, '8-H', 18),
(984, '87174', '3984', 'Muhammad Nawwar Asady', 16, '8-H', 19),
(985, '87183', '6938', 'Muhammad Ramdhan Ashary', 16, '8-H', 20),
(986, '87190', '3784', 'Muhammad Salman Al Farisi', 16, '8-H', 21),
(987, '87193', '3296', 'Muhammad Syaamil', 16, '8-H', 22),
(988, '87194', '9568', 'Muhammad Syafiq Azizullah', 16, '8-H', 23),
(989, '87214', '2485', 'Naufal Alif Aunurrahman', 16, '8-H', 25),
(990, '87215', '8752', 'Naufal Arham Maliky', 16, '8-H', 26),
(991, '87227', '5924', 'Rayyan Ramadhan Ghozy', 16, '8-H', 27),
(992, '87232', '4685', 'Rizky Achmad Ramadhan', 16, '8-H', 28),
(993, '87236', '4792', 'Salman Himura Dzawinnuha', 16, '8-H', 29),
(994, '87239', '6837', 'Shan Fritzie Khalfani', 16, '8-H', 30),
(995, '87243', '3725', 'Syahrullayal', 16, '8-H', 31),
(996, '87248', '7694', 'Umar Hafiz Al Huda', 16, '8-H', 32),
(997, '87258', '4265', 'Zaiz Idris Aulia Rahman', 16, '8-H', 33),
(998, '71001', '7468', 'Abdullah Faqih', 1, '7-A', 1),
(999, '71002', '4792', 'Achmad Muzayyin Daffa', 1, '7-A', 2),
(1000, '71003', '3527', 'Aidan Hisyam Al Fatih', 1, '7-A', 3),
(1001, '71004', '3847', 'Akhdan Khairil Umam', 1, '7-A', 4),
(1002, '71005', '9673', 'Aldo Noverlian', 1, '7-A', 5),
(1003, '71006', '3542', 'Arili Rizky Ramadhan', 1, '7-A', 6),
(1004, '71007', '4693', 'Athallah Syafiq Ihsan', 1, '7-A', 7),
(1005, '71008', '9248', 'Bildan Hafiz', 1, '7-A', 8),
(1006, '71009', '9352', 'Fadhlan Aidil Akbar', 1, '7-A', 9),
(1007, '71010', '8693', 'Faqih Rohman Al Ghifari', 1, '7-A', 10),
(1008, '71011', '7264', 'Farhan Ferhat Fazlullah Faqih', 1, '7-A', 11),
(1009, '71012', '5478', 'Fathan Asadullah Al Bana', 1, '7-A', 12),
(1010, '71013', '7435', 'Fawwaz Rasyad Al Ayyubi', 1, '7-A', 13),
(1011, '71014', '9842', 'Galih Farras Akbar', 1, '7-A', 14),
(1012, '71015', '3472', 'Habibullah', 1, '7-A', 15),
(1013, '71016', '7864', 'Haikal Azka Robiha', 1, '7-A', 16),
(1014, '71017', '9365', 'Ilham Husain Irfani', 1, '7-A', 17),
(1015, '71018', '7562', 'M. Aldi Nur Syamsi', 1, '7-A', 18),
(1016, '71019', '5892', 'Muhamad Rizki Ramadhan Palembang', 1, '7-A', 19),
(1017, '71020', '8349', 'Muhammad Adyaraka Ramdhani Habibie', 1, '7-A', 20),
(1018, '71021', '5639', 'Muhammad Aufa Nailul Wisam', 1, '7-A', 21),
(1019, '71022', '4689', 'Muhammad Azka Habiburrahman', 1, '7-A', 22),
(1020, '71023', '5387', 'Muhammad Farhan Abdan Syakuro', 1, '7-A', 23),
(1021, '71024', '5268', 'Muhammad Ghiyats Nasution', 1, '7-A', 24),
(1022, '71025', '5479', 'Muhammad Hanif Fatihul Ihsan', 1, '7-A', 25),
(1023, '71026', '5694', 'Muhammad Ihsan', 1, '7-A', 26),
(1024, '71027', '2387', 'Muhammad Roid Mubarok', 1, '7-A', 27),
(1025, '71028', '6475', 'Muhammad Zaky Taqiyyuddin', 1, '7-A', 28),
(1026, '71029', '5432', 'Radhin Azka Firdaus', 1, '7-A', 29),
(1027, '71030', '3659', 'Raynaldo Rahmat Suharyono', 1, '7-A', 30),
(1028, '71031', '2975', 'Reza Andriansyah', 1, '7-A', 31),
(1029, '71032', '4672', 'Rezandra Dzaki Firzatullah', 1, '7-A', 32),
(1030, '71033', '9845', 'Saifurrahman Zufar', 1, '7-A', 33),
(1031, '71034', '3754', 'Zaid Muhammad Naashif', 1, '7-A', 34),
(1032, '72001', '9853', 'Abdel Aziz Fattahillah', 2, '7-B', 1),
(1033, '72002', '8924', 'Abdurrahman Yahya Ayyash', 2, '7-B', 2),
(1034, '72003', '4239', 'Adhitya Trihamdan M. Nur', 2, '7-B', 3),
(1035, '72004', '7245', 'Ahmad Muzzammil Alfaris', 2, '7-B', 4),
(1036, '72005', '4539', 'Aqila Hamidzan Rahman', 2, '7-B', 5),
(1037, '72006', '2573', 'Azrey Auranugraha Supriadi', 2, '7-B', 6),
(1038, '72007', '9846', 'Deven Rasendriya Hasyim', 2, '7-B', 7),
(1039, '72008', '9354', 'Dzaki Hibban Robbani', 2, '7-B', 8),
(1040, '72009', '2856', 'Fachri Arkaan Nuryo', 2, '7-B', 9),
(1041, '72010', '9342', 'Fadel Khairi Helmi', 2, '7-B', 10),
(1042, '72011', '9624', 'Faher Qhintara Najwan', 2, '7-B', 11),
(1043, '72012', '5297', 'Farras Adam Fian Sabili', 2, '7-B', 12),
(1044, '72013', '2567', 'Fauzan Pratama Suryadijaya', 2, '7-B', 13),
(1045, '72014', '5693', 'Fauzul Muttaqin', 2, '7-B', 14),
(1046, '72015', '4385', 'Hamas Miqdad Al Khairy', 2, '7-B', 15),
(1047, '72016', '4659', 'Hanif Faishal Abdillah', 2, '7-B', 16),
(1048, '72017', '3796', 'Kenzie Ranupani Prayoga', 2, '7-B', 17),
(1049, '72018', '9857', 'Maizar Rahman Al Giffary', 2, '7-B', 18),
(1050, '72019', '2385', 'Mohammad Satrio Rizky Noor Iman', 2, '7-B', 19),
(1051, '72020', '4586', 'Muhammad Abdullah Habibur Rohman', 2, '7-B', 20),
(1052, '72021', '9837', 'Muhammad Abdurrasyid Rusmawan', 2, '7-B', 21),
(1053, '72022', '8926', 'Muhammad Abyan Shiddiq', 2, '7-B', 22),
(1054, '72023', '8946', 'Muhammad Althaf Athaurrahman', 2, '7-B', 23),
(1055, '72024', '5243', 'Muhammad Faiq Yusuf Rosyadi', 2, '7-B', 24),
(1056, '72025', '8725', 'Muhammad Hudzaifah Haidar', 2, '7-B', 25),
(1057, '72026', '7952', 'Muhammad Izz Alif Yahya', 2, '7-B', 26),
(1058, '72027', '3825', 'Muhammad Razan Khadafi', 2, '7-B', 27),
(1059, '72028', '8596', 'Muhammad Satrio Hasiholan Broto', 2, '7-B', 28),
(1060, '72029', '3528', 'Muhammad Savero Firjatullah', 2, '7-B', 29),
(1061, '72030', '9378', 'Muhammad Yahya Ayyasy', 2, '7-B', 30),
(1062, '72031', '9647', 'Rega Firdaus Aditya', 2, '7-B', 31),
(1063, '72032', '5289', 'Rifki Firja Putra Subagja', 2, '7-B', 32),
(1064, '72033', '3584', 'Rizqi Jihad Lidinillah A.M', 2, '7-B', 33),
(1065, '72034', '5487', 'Zaki Abdurahim', 2, '7-B', 34),
(1066, '73001', '6245', 'Abyan Saiffathan Mubina', 3, '7-C', 1),
(1067, '73002', '9524', 'Ahmad Alfan Al-Arief', 3, '7-C', 2),
(1068, '73003', '8659', 'Akhtar Andifa Hamdi', 3, '7-C', 3),
(1069, '73004', '9547', 'Alif Adhyaksa Nugraha', 3, '7-C', 4),
(1070, '73005', '7628', 'Asep Azhar Al-Azis', 3, '7-C', 5),
(1071, '73006', '4592', 'Azriel Gaza Al Ghazali', 3, '7-C', 6),
(1072, '73007', '5963', 'Bagus Sangaji Nugraha', 3, '7-C', 7),
(1073, '73008', '3786', 'Darrell Zaidan Rizqullah', 3, '7-C', 8),
(1074, '73009', '3769', 'Fadhil Azzaky Azhar', 3, '7-C', 9),
(1075, '73010', '2937', 'Farrel Fernanda', 3, '7-C', 10),
(1076, '73011', '2975', 'Fathurrizqy', 3, '7-C', 11),
(1077, '73012', '3652', 'Fayyadh Muafi Dhiyaulhaq', 3, '7-C', 12),
(1078, '73013', '7495', 'Francesco Rudiantoro', 3, '7-C', 13),
(1079, '73014', '6843', 'Gaza Abdurrahman', 3, '7-C', 14),
(1080, '73015', '7926', 'Hafidz Fahmi Al Firdaus', 3, '7-C', 15),
(1081, '73016', '3954', 'Hilal Muhammad Ramadhan', 3, '7-C', 16),
(1082, '73017', '8974', 'Itsar Ibrahim', 3, '7-C', 17),
(1083, '73018', '8945', 'Jiyad Hamas Fikri', 3, '7-C', 18),
(1084, '73019', '5468', 'Muhamad Rasyad Herdiansya', 3, '7-C', 19),
(1085, '73020', '8739', 'Muhamad Rizky Fadillah', 3, '7-C', 20),
(1086, '73021', '3962', 'Muhammad Abdul Halim', 3, '7-C', 21),
(1087, '73022', '4623', 'Muhammad Fatih Al Masyriqy', 3, '7-C', 22),
(1088, '73023', '2736', 'Muhammad Haikal Harliman', 3, '7-C', 23),
(1089, '73024', '8347', 'Muhammad Salman Faris', 3, '7-C', 24),
(1090, '73025', '9284', 'Muhammad Zaheer Nurrusydi', 3, '7-C', 25),
(1091, '73026', '6983', 'Musyaffa  Imaduddin', 3, '7-C', 26),
(1092, '73027', '6793', 'Pasha Syahra Putra', 3, '7-C', 27),
(1093, '73028', '2789', 'Rafa Muhammad Khalfani', 3, '7-C', 28),
(1094, '73029', '7264', 'Rajendra Sauli Sava', 3, '7-C', 29),
(1095, '73030', '2976', 'Rifky Argia Purnama', 3, '7-C', 30),
(1096, '73031', '6957', 'Rumman Musyaffa Rabbani', 3, '7-C', 31),
(1097, '73032', '2365', 'Salman Fakhri Abdillah', 3, '7-C', 32),
(1098, '73033', '3456', 'Shatria Fatan Rofiul Birry', 3, '7-C', 33),
(1099, '73034', '5829', 'Yasir Ats Tsabit', 3, '7-C', 34),
(1100, '74001', '4896', 'Affan Muhammad Nadhif', 4, '7-D', 1),
(1101, '74002', '3497', 'Afif Muhammad Haidar Albanna', 4, '7-D', 2),
(1102, '74003', '7269', 'Ahmad Fathin Mubarak', 4, '7-D', 3),
(1103, '74004', '3972', 'Al Yunusi Al Ahmadi', 4, '7-D', 4),
(1104, '74005', '5893', 'Ammar Abdurrahman Farras', 4, '7-D', 5),
(1105, '74006', '2948', 'Arfal Bayhaqi Idris', 4, '7-D', 6),
(1106, '74007', '5962', 'Ataya Mahardika Adinegara', 4, '7-D', 7),
(1107, '74008', '6387', 'Dzaki Ahmad Felya', 4, '7-D', 8),
(1108, '74009', '3248', 'Fakhri Aqil Muhammad', 4, '7-D', 9),
(1109, '74010', '3287', 'Farros Alfaruq Abadi', 4, '7-D', 10),
(1110, '74011', '8453', 'Fauzan Afif Adzima', 4, '7-D', 11),
(1111, '74012', '8957', 'Ghiyan Januar Anindya', 4, '7-D', 12),
(1112, '74013', '6839', 'Girsan Gilmani Waqi', 4, '7-D', 13),
(1113, '74014', '2498', 'Hamzah Asadullah', 4, '7-D', 14),
(1114, '74015', '9635', 'Ilyasa Gusyana Syah Putra', 4, '7-D', 15),
(1115, '74016', '4627', 'Kayzan Nawfal Eshan Septadi', 4, '7-D', 16),
(1116, '74017', '6398', 'Khyar Elfakhri', 4, '7-D', 17),
(1117, '74018', '3798', 'Muhamad Rival Fahru Ridzky Sopyan', 4, '7-D', 18),
(1118, '74019', '2374', 'Muhammad Altaf Favian Rizqullah', 4, '7-D', 19),
(1119, '74020', '2367', 'Muhammad Arkan Al Faiz Waluya', 4, '7-D', 20),
(1120, '74021', '2348', 'Muhammad Azka Zahid Nugraha', 4, '7-D', 21),
(1121, '74022', '7394', 'Muhammad Fabian Alfarisi', 4, '7-D', 22),
(1122, '74023', '9846', 'Muhammad Hilmi Arraufu Abdillah', 4, '7-D', 23),
(1123, '74024', '7269', 'Muhammad Ibam', 4, '7-D', 24),
(1124, '74025', '9726', 'Muhammad Ibrahim Hafy', 4, '7-D', 25),
(1125, '74026', '3459', 'Muhammad Syaibatul Hamdi', 4, '7-D', 26),
(1126, '74027', '6942', 'Musyaffa Tsary Rafif', 4, '7-D', 27),
(1127, '74028', '9735', 'Naufal Fadhil Aulia', 4, '7-D', 28),
(1128, '74029', '8729', 'Naufal Rasyid Adityawarman', 4, '7-D', 29),
(1129, '74030', '3274', 'Revan Adiansyah', 4, '7-D', 30),
(1130, '74031', '3275', 'Reza Abdi Gusti', 4, '7-D', 31),
(1131, '74032', '7283', 'Sabda Wirasandi Marahitu', 4, '7-D', 32),
(1132, '74033', '7968', 'Salman', 4, '7-D', 33),
(1133, '74034', '2354', 'Syafiq Azhar Musyaffa', 4, '7-D', 34),
(1134, '74035', '5362', 'Yahya Abdussalam', 4, '7-D', 35),
(1135, '75001', '3829', 'Abdullah Faris Ali', 5, '7-E', 1),
(1136, '75002', '8395', 'Abiyyu Merah Akbar', 5, '7-E', 2),
(1137, '75003', '7265', 'Agil Rizki Muharram', 5, '7-E', 3),
(1138, '75004', '3764', 'Azwa Muhammad Rizky', 5, '7-E', 4),
(1139, '75005', '9627', 'Daffa Abrar Hukama Putra', 5, '7-E', 5),
(1140, '75006', '5987', 'Dzakwan Syarief Maulana', 5, '7-E', 6),
(1141, '75007', '7389', 'Fachri Agustian Anugrah', 5, '7-E', 7),
(1142, '75008', '3849', 'Fadhlirrahman Syauqi Fahlevi', 5, '7-E', 8),
(1143, '75009', '7483', 'Fazli Rohman Haryono', 5, '7-E', 9),
(1144, '75010', '3476', 'Gardiza Abdurahman', 5, '7-E', 10),
(1145, '75011', '4569', 'Ghailan Syabil Ataullah Kusnaedi', 5, '7-E', 11),
(1146, '75012', '7648', 'Heical Fauzan Pratama', 5, '7-E', 12),
(1147, '75013', '3862', 'Hira Fadlusshiyam Prisandi', 5, '7-E', 13),
(1148, '75014', '7482', 'Irsyad Akhlasa Taqy', 5, '7-E', 14),
(1149, '75015', '2593', 'Luqman Khalid', 5, '7-E', 15),
(1150, '75016', '5784', 'Muhammad Afif Faizul Haq', 5, '7-E', 16),
(1151, '75017', '3586', 'Muhammad Fadhil Syakib Aufa', 5, '7-E', 17),
(1152, '75018', '2786', 'Muhammad Fadhlurrahman Almusyafa', 5, '7-E', 18),
(1153, '75019', '6789', 'Muhammad Hanif Aulia', 5, '7-E', 19),
(1154, '75020', '6359', 'Muhammad Ilham Syaifuddin', 5, '7-E', 20),
(1155, '75021', '5364', 'Muhammad Naufal Fahmi Alfikry', 5, '7-E', 21),
(1156, '75022', '5792', 'Muhammad Ramzi Alvaro', 5, '7-E', 22),
(1157, '75023', '3682', 'Muhammad Rasya Agni Pratama', 5, '7-E', 23),
(1158, '75024', '7682', 'Muhammad Riezqyanto', 5, '7-E', 24),
(1159, '75025', '9487', 'Muhammad Syamil Yusuf', 5, '7-E', 25),
(1160, '75026', '5648', 'Muhammad Zidan Al Ghifari', 5, '7-E', 26),
(1161, '75027', '5974', 'Puja Laksana Wibawa', 5, '7-E', 27),
(1162, '75028', '9723', 'Purnama Syahrussya`Ban', 5, '7-E', 28),
(1163, '75029', '2983', 'Rafi Habibie', 5, '7-E', 29),
(1164, '75030', '5783', 'Raka Nizar Nugraha', 5, '7-E', 30),
(1165, '75031', '9325', 'Rifat Al Fatih', 5, '7-E', 31),
(1166, '75032', '9625', 'Taufik Hidayat', 5, '7-E', 32),
(1167, '75033', '9568', 'Wildan Awal Ramadhan', 5, '7-E', 33),
(1168, '75034', '2584', 'Zubair Abdullah', 5, '7-E', 34),
(1169, '76001', '6358', 'Abdullah Al-Muzakki', 6, '7-F', 1),
(1170, '76002', '9285', 'Ahmad Dzakiy Alfarisi', 6, '7-F', 2),
(1171, '76003', '4785', 'Amr Turky Shamlan', 6, '7-F', 3),
(1172, '76004', '3695', 'Arroyan Zulvan Hidayat', 6, '7-F', 4),
(1173, '76005', '4678', 'Azhar Mahfudz', 6, '7-F', 5),
(1174, '76006', '8379', 'Benn Radyth Rheivannio', 6, '7-F', 6),
(1175, '76007', '5369', 'Fabian Al Kautsar', 6, '7-F', 7),
(1176, '76008', '7423', 'Fathin Saenima', 6, '7-F', 8),
(1177, '76009', '8235', 'Fauzan Azka Ramadhan', 6, '7-F', 9),
(1178, '76010', '2795', 'Febrian Hansya Aburohman', 6, '7-F', 10),
(1179, '76011', '4275', 'Harimurti Iqbal Wicaksono', 6, '7-F', 11),
(1180, '76012', '5742', 'Hikmatyarahman Al Farisi', 6, '7-F', 12),
(1181, '76013', '6845', 'Husaini Mutakamil Ihsan', 6, '7-F', 13),
(1182, '76014', '7328', 'Ibnu Bail Zailullah', 6, '7-F', 14),
(1183, '76015', '2986', 'Keis Fathi Azmi', 6, '7-F', 15),
(1184, '76016', '2539', 'Lalu Muhammad Khaerunnas', 6, '7-F', 16),
(1185, '76017', '2759', 'Lingga Mulya Warman', 6, '7-F', 17),
(1186, '76018', '2648', 'M. Ridho Al Fadhil', 6, '7-F', 18),
(1187, '76019', '6958', 'M. Rizky Afghani Hasibuan', 6, '7-F', 19),
(1188, '76020', '3627', 'Muhamad Abyan Arrasyad Nurwana', 6, '7-F', 20),
(1189, '76021', '2786', 'Muhammad Aziz Prasetya', 6, '7-F', 21),
(1190, '76022', '7463', 'Muhammad Fadhil Fadhlurohman', 6, '7-F', 22),
(1191, '76023', '6978', 'Muhammad Fathin Mujahid', 6, '7-F', 23),
(1192, '76024', '7534', 'Muhammad Rifqi Silvanur Rahman', 6, '7-F', 24),
(1193, '76025', '7584', 'Muhammad Tegarr Michael Styandi', 6, '7-F', 25),
(1194, '76026', '9548', 'Muhammad Thariq Arasy', 6, '7-F', 26),
(1195, '76027', '6943', 'Muhammad Wafda Firasyan Kadarisman', 6, '7-F', 27),
(1196, '76028', '9762', 'Muhammad Yusuf Ibrahim', 6, '7-F', 28),
(1197, '76029', '9247', 'Nabil Fawazul Akbar', 6, '7-F', 29),
(1198, '76030', '2654', 'Rafa Muda Caesar', 6, '7-F', 30),
(1199, '76031', '4367', 'Rasya Rizqi Putra', 6, '7-F', 31),
(1200, '76032', '8627', 'Sayyid Daffa Muhadzdzib', 6, '7-F', 32),
(1201, '76033', '9645', 'Valerian Kamil Zaeni', 6, '7-F', 33),
(1202, '76034', '5436', 'Zian Akya Zelvian', 6, '7-F', 34),
(1203, '77001', '7562', 'Abdurrahman Fayiz', 7, '7-G', 1),
(1204, '77002', '9683', 'Adam Nurulrachman', 7, '7-G', 2),
(1205, '77003', '3896', 'Ardavan Putra Haryono', 7, '7-G', 3),
(1206, '77004', '3956', 'Arrafi Idlaal Ramadan', 7, '7-G', 4),
(1207, '77005', '7834', 'Azhar Amrulloh Caryaman', 7, '7-G', 5),
(1208, '77006', '8976', 'Azzam Hudzaifah Al Ghazali', 7, '7-G', 6),
(1209, '77007', '9463', 'Faiq Muhammad Tsaqif', 7, '7-G', 7),
(1210, '77008', '4852', 'Fajrian Ramadhan Abietto', 7, '7-G', 8),
(1211, '77009', '7493', 'Faqih Rosikhul Ilmi Nazila', 7, '7-G', 9),
(1212, '77010', '9375', 'Galang Dhiyaul Haq', 7, '7-G', 10),
(1213, '77011', '5943', 'Ghiza Raditya Voulza', 7, '7-G', 11),
(1214, '77012', '8529', 'Haedar Raka Habibi', 7, '7-G', 12),
(1215, '77013', '2498', 'Huga Pradhana Hasanudin', 7, '7-G', 13),
(1216, '77014', '8475', 'Idlan Fakhri Alriantara', 7, '7-G', 14),
(1217, '77015', '7642', 'M Nicholas Pradita A', 7, '7-G', 15),
(1218, '77016', '2583', 'Moh Rizki Ramadhani', 7, '7-G', 16),
(1219, '77017', '9785', 'Moh. Thoriq Mubarok', 7, '7-G', 17),
(1220, '77018', '7296', 'Muhamad Fauzan Mubarak', 7, '7-G', 18),
(1221, '77019', '6357', 'Muhamad Herip', 7, '7-G', 19),
(1222, '77020', '9746', 'Muhamad Reyvan Rajendra', 7, '7-G', 20),
(1223, '77021', '5738', 'Muhamad Rhaisya Manopa', 7, '7-G', 21),
(1224, '77022', '9523', 'Muhammad Azzam Hamadah', 7, '7-G', 22),
(1225, '77023', '8359', 'Muhammad Bintang Azzahran', 7, '7-G', 23),
(1226, '77024', '5369', 'Muhammad Fathi Antar Rabbani', 7, '7-G', 24),
(1227, '77025', '2654', 'Muhammad Ikhlas Setiawan', 7, '7-G', 25),
(1228, '77026', '9752', 'Muhammad Nibras', 7, '7-G', 26),
(1229, '77027', '4768', 'Muhammad Nur Said', 7, '7-G', 27),
(1230, '77028', '7968', 'Muhammad Salman Iskandar', 7, '7-G', 28),
(1231, '77029', '9637', 'Muhammad Zaki Aditya', 7, '7-G', 29),
(1232, '77030', '8639', 'Musthafa Shadieq', 7, '7-G', 30),
(1233, '77031', '7948', 'Nugraha Dwi Andika', 7, '7-G', 31),
(1234, '77032', '4895', 'Rafa Prasetyo Nugroho', 7, '7-G', 32),
(1235, '77033', '8379', 'Reza Adrian Fadillah', 7, '7-G', 33),
(1236, '77034', '3679', 'Sayyid Ahmad', 7, '7-G', 34),
(1237, '78001', '8359', 'Abel Maulana Fadhillah', 8, '7-H', 1),
(1238, '78002', '2539', 'Ahmad Faiz', 8, '7-H', 2),
(1239, '78003', '2764', 'Ahmad Khairul Huda', 8, '7-H', 3),
(1240, '78004', '6942', 'Athaillah Ezar Javierajendra', 8, '7-H', 4),
(1241, '78005', '7938', 'Azzam Ghazi Nashrullah', 8, '7-H', 5),
(1242, '78006', '2837', 'Fajrin Atalhah Wijaya', 8, '7-H', 6),
(1243, '78007', '9573', 'Fakhri Haidar Bahri', 8, '7-H', 7),
(1244, '78008', '8937', 'Fathan Ufron Al Aqsho', 8, '7-H', 8),
(1245, '78009', '9742', 'Haidar Muhammad Faruqi', 8, '7-H', 9),
(1246, '78010', '3627', 'Hudzaifah Ramdhani Pdrosa', 8, '7-H', 10),
(1247, '78011', '9462', 'Ighfirlana', 8, '7-H', 11),
(1248, '78012', '5839', 'Iqbal Fairuz Susilo El Ulwi', 8, '7-H', 12),
(1249, '78013', '6598', 'Izzat Karimi Ramadhan', 8, '7-H', 13),
(1250, '78014', '5628', 'M Hanif Rafi Raidul I A', 8, '7-H', 14),
(1251, '78015', '9246', 'Mochamad Fakhri Aryasatya', 8, '7-H', 15),
(1252, '78016', '2564', 'Muhamad Faza Hanif Asim', 8, '7-H', 16),
(1253, '78017', '7396', 'Muhamad Nafis Shobri', 8, '7-H', 17),
(1254, '78018', '6498', 'Muhammad Al-Fatih', 8, '7-H', 18),
(1255, '78019', '5267', 'Muhammad Arfidan Nizam Rahman', 8, '7-H', 19),
(1256, '78020', '6498', 'Muhammad Athar Athallah', 8, '7-H', 20),
(1257, '78021', '2465', 'Muhammad Azril Ramdhani', 8, '7-H', 21),
(1258, '78022', '9473', 'Muhammad Fakhri Adhiswara', 8, '7-H', 22),
(1259, '78023', '7925', 'Muhammad Fathurrahman', 8, '7-H', 23),
(1260, '78024', '6298', 'Muhammad Fazly Mawla Hef', 8, '7-H', 24),
(1261, '78025', '2473', 'Muhammad Hasby Ashshidqy', 8, '7-H', 25),
(1262, '78026', '6928', 'Muhammad Mufti Al Wafi Suhermawan', 8, '7-H', 26),
(1263, '78027', '3569', 'Regan Baarigh Muhammad Kusron', 8, '7-H', 27),
(1264, '78028', '5826', 'Ridwan Naufal Elzaky', 8, '7-H', 28),
(1265, '78029', '4876', 'Rifqi Mohamad Althaaf Al Buchori', 8, '7-H', 29),
(1266, '78030', '2936', 'Salman Khulayfi', 8, '7-H', 30),
(1267, '78031', '4325', 'Sayyid Muhammad Tsaqif', 8, '7-H', 31),
(1268, '78032', '6547', 'Yayang Reyfhaldi Heka', 8, '7-H', 32),
(1269, '78033', '4632', 'Zaim Nazhif Ibadurrahman', 8, '7-H', 33),
(1270, '78034', '6874', 'Zulfa Fauzi Rijaddin', 8, '7-H', 34),
(1271, '123450', '436372', 'Fulan Contoh', 1, '7-A', 35),
(1272, '73035', '4167', 'Syafiq Umairy Naufal', 3, '7-C', 35),
(1273, 'user_name', 'user_password', 'full_name', 0, 'group_name', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`, `date_modified`) VALUES
(2, 'Dede Maryam', 'maryam@gmail.com', 'bk.png', '$2y$10$QdDDNq7mOJ/xWhhs.5a92..uJkeixQhPHa3ESKNj/WWP3orgnkCfC', 4, 1, 1597107848, 1609858884),
(8, 'Hendra Karunia A., Lc., M.H.', 'hendrasaleh@gmail.com', 'Foto_Formal_(2).jpg', '$2y$10$XBnbQw2g779dEooZOYU1Bu61sWc8oc0jnurJfPlfua5Lf3K5RuFs6', 1, 1, 1607950063, 1609840824),
(9, 'Admin 1', 'role1@excellenz.id', 'default.jpg', '$2y$10$ff9laJc1dU0DpIaeUQje1.gWa/fabmBS/bu0.yJYj9tU00k7KgKaG', 3, 1, 1608127461, 1608127461),
(10, 'Admin 2', 'role2@excellenz.id', 'default.jpg', '$2y$10$lkIzuxx5CgsSHy2kav20duoFaIaRwlXkZMuSGzvvSGAZ8kJhvyqc6', 3, 1, 1608127490, 1608127490),
(11, 'Admin 3', 'role3@excellenz.id', 'default.jpg', '$2y$10$GD7BLJRZlQLKwOER7/4IdOWrVALo5hwbVfgEHQbr9MgrqQ5tJAapq', 3, 1, 1608127517, 1608127517),
(12, 'Admin 4', 'role4@excellenz.id', 'default.jpg', '$2y$10$bGUgKAUOlAGcA5Jdd0bXgeuj6Bwev5wvV6DQVve2dFOJ6Hg/tQKkm', 3, 1, 1608127542, 1608127542),
(13, 'Admin 5', 'role5@excellenz.id', 'default.jpg', '$2y$10$E1axIWEJtmEKr7sdKm4FX.JDAvNEwYvXjQ.kb8r8SXjRocBGGpGju', 3, 1, 1608127569, 1608127569),
(14, 'Admin 6', 'role6@excellenz.id', 'default.jpg', '$2y$10$KruL2qfm6hemkHNtxAJ3ReFsw2FMy/.2ola.ikZRls1F4Cgushh3W', 3, 1, 1608127592, 1608127592),
(15, 'Admin 7', 'role7@excellenz.id', 'default.jpg', '$2y$10$vrvtLquycIaK1KMaZB.AlOOk83hxO2KGpYKL2pul7EcJZfBtcGcc.', 3, 1, 1608127617, 1608127617),
(17, 'Kurikulum', 'admin@excellenz.id', 'default.jpg', '$2y$10$azpVXjABJDywAIoSrqOQMuDViJAtICMx.lYnxOXN5SihP.uFllZRu', 2, 1, 1608256025, 1609849156);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(6, 3, 2),
(8, 2, 4),
(9, 1, 4),
(10, 1, 6),
(11, 4, 2),
(12, 4, 6),
(13, 1, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_group`
--

INSERT INTO `user_group` (`id`, `level`, `name`) VALUES
(1, 7, '7-A'),
(2, 7, '7-B'),
(3, 7, '7-C'),
(4, 7, '7-D'),
(5, 7, '7-E'),
(6, 7, '7-F'),
(7, 7, '7-G'),
(8, 7, '7-H'),
(9, 8, '8-A'),
(10, 8, '8-B'),
(11, 8, '8-C'),
(12, 8, '8-D'),
(13, 8, '8-E'),
(14, 8, '8-F'),
(15, 8, '8-G'),
(16, 8, '8-H'),
(17, 9, '9-A'),
(18, 9, '9-B'),
(19, 9, '9-C'),
(20, 9, '9-D'),
(21, 9, '9-E'),
(22, 9, '9-F'),
(23, 9, '9-G'),
(24, 9, '9-H');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`, `sequence`) VALUES
(1, 'Admin', 1),
(2, 'User', 3),
(3, 'Menu', 2),
(4, 'Kurikulum', 4),
(6, 'Hotel', 5),
(7, 'Layanan', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Kurikulum'),
(3, 'Member'),
(4, 'Manager');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Admin Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(6, 4, 'Report List', 'kurikulum', 'fas fa-fw fa-file-upload', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(9, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(11, 1, 'User Management', 'admin/users', 'fas fa-fw fa-users', 1),
(12, 2, 'Upload Raport', 'user/grouplist', 'fas fa-fw fa-upload', 1),
(13, 4, 'User Assignment', 'kurikulum/users', 'fas fa-fw fa-edit', 1),
(14, 6, 'Hotel Dashboard', 'hotel', 'fas fa-fw fa-hotel', 1),
(15, 6, 'Daftar Tamu', 'hotel/tamu', 'fas fa-fw fa-suitcase', 1),
(16, 6, 'Manajemen Kamar', 'hotel/tipekamar', 'fas fa-fw fa-bed', 1),
(17, 6, 'Daftar Kamar', 'hotel/kamar', 'fas fa-fw fa-bed', 1),
(18, 7, 'Booking Kamar', 'layanan', 'fas fa-fw fa-book', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_to_group`
--

CREATE TABLE `user_to_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_to_group`
--

INSERT INTO `user_to_group` (`id`, `user_id`, `group_id`) VALUES
(5, 8, 1),
(6, 8, 2),
(7, 8, 3),
(11, 10, 4),
(12, 10, 5),
(13, 10, 6),
(14, 9, 1),
(15, 9, 2),
(16, 9, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hotel_kamar`
--
ALTER TABLE `hotel_kamar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hotel_tamu`
--
ALTER TABLE `hotel_tamu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hotel_tipe_kamar`
--
ALTER TABLE `hotel_tipe_kamar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_to_group`
--
ALTER TABLE `user_to_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hotel_kamar`
--
ALTER TABLE `hotel_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `hotel_tamu`
--
ALTER TABLE `hotel_tamu`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `hotel_tipe_kamar`
--
ALTER TABLE `hotel_tipe_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1274;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_to_group`
--
ALTER TABLE `user_to_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
