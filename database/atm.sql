-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2020 at 03:49 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm`
--

-- --------------------------------------------------------

--
-- Table structure for table `error`
--

CREATE TABLE `error` (
  `id_eror` varchar(5) NOT NULL,
  `masalah` varchar(256) NOT NULL,
  `solusi` varchar(512) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `error`
--

INSERT INTO `error` (`id_eror`, `masalah`, `solusi`, `tgl_input`, `tgl_update`) VALUES
('E0001', 'Alat printer terlalu panas', 'Dinginkan mesin printer dengan melepas semua konektor', '2020-06-14 02:50:28', '2020-06-14 02:50:28'),
('E0002', 'Kertas macet', 'Pertama keluarkan sisa kertas yang macet dari printer, Kedua bersihkan sobekan kertas yang ada di jalur keluar kertas, dan yang terakhir bersihkan roda roller printer', '2020-06-14 02:50:28', '2020-06-14 02:50:28'),
('E0003', 'Kertas print habis', 'Pertama ganti kertas print dengan yang baru, Kedua cek sensor print, terakhir cek kabel konektor', '2020-06-14 02:53:42', '2020-06-14 02:53:42'),
('E0004', 'Kesalahan pemotongan kertas', 'Pertama cek alat pemotong, cek presisi ukuran pemotong, periksa status pengaturan printer, cek sensor print, dan cek kabel konektor', '2020-06-14 02:53:42', '2020-06-14 02:53:42'),
('E0005', 'Printer tidak merespon', 'reset printer lewat aplikasi operator, cek pengaturan pada aplikasi, cek kabel konektor, cek kabel jaringan, opsi terakhir restart ATM', '2020-06-14 02:55:21', '2020-06-14 02:55:21'),
('E0006', 'Tuas pembuka kertas terbuka', 'Tutup tuas keluar kertas, dan cek sensor keluar kertas', '2020-06-14 02:55:21', '2020-06-14 02:55:21'),
('E0007', 'Ukuran cetak gambar tidak normal', 'cek posisi kertas, cek pengaturan ukuran pemotong pada sistem, dan cek pemotong kertas', '2020-06-14 02:57:28', '2020-06-14 02:57:28'),
('E0008', 'Kartu didalam cardreader', 'keluarkan kartu didalam cardreader', '2020-06-14 02:57:28', '2020-06-14 02:57:28'),
('E0009', 'Tidak dapat membaca kartu', 'cek kabel konektor cardreader, cek kabel jaringan, reset cardreader lewat aplikasi operator, dan cek pengaturan pada aplikasi', '2020-06-14 02:59:39', '2020-06-14 02:59:39'),
('E0010', 'Kartu Tertolak', 'keluarkan kartu didalam cardreader, cek kabel konektor cardreader, dan cek pengunci mulut kartu', '2020-06-14 02:59:39', '2020-06-14 02:59:39'),
('E0011', 'Kartu tidak bisa keluar', 'buka pengunci mulut cardreader, cek kabel konektor cardreader, dan bersihkan sensor cardreader', '2020-06-14 03:02:34', '2020-06-14 03:02:34'),
('E0012', 'Layar mati', 'cek kelistrikan utama dan ATM, restart ATM, cek kabel VGA, dan cek AD-BOARD', '2020-06-14 03:02:34', '2020-06-14 03:02:34'),
('E0013', 'Menu tidak lengkap', 'restart ATM, cek jaringan, dan cek harddisk', '2020-06-14 03:03:44', '2020-06-14 03:03:44'),
('E0014', 'Tampilan layar 002', 'restart modem, dan restart ATM', '2020-06-14 03:03:44', '2020-06-14 03:03:44'),
('E0015', 'Tampilan layar 001', 'setting konfigurasi jaringan ATM, setting konfigurasi modem, dan restart ATM', '2020-06-14 03:05:37', '2020-06-14 03:05:37'),
('E0016', 'Tampilan layar 003', 'tutup dan kunci brankas dengan baik dan benar', '2020-06-14 03:05:37', '2020-06-14 03:05:37'),
('E0017', 'Tidak dapat mengeluarkan uang', 'cek sensor cassete, cek sensor dispenser, dan cek sensor exit shutter', '2020-06-14 03:07:01', '2020-06-14 03:07:01'),
('E0018', 'Dispenser tidak bekerja', 'cek kabel konektor, cek motherboard, dan cek sensor tangan robot', '2020-06-14 03:07:01', '2020-06-14 03:07:01'),
('E0019', 'Mulut exit shutter tidak terbuka', 'cek tangan robot, cek kabel fleksibel, dan cek sensor exit shutter', '2020-06-14 03:08:30', '2020-06-14 03:08:30'),
('E0020', 'Tombol tidak berfungsi', 'restart ATM, input ulang masterkey atau ganti masterkey', '2020-06-14 03:08:30', '2020-06-14 03:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `informasi_error`
--

CREATE TABLE `informasi_error` (
  `id_informasi` int(11) NOT NULL,
  `id_eror` varchar(5) DEFAULT NULL,
  `id_teknisi` varchar(8) NOT NULL,
  `id_mesin` varchar(3) NOT NULL,
  `komentar` varchar(256) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasi_error`
--

INSERT INTO `informasi_error` (`id_informasi`, `id_eror`, `id_teknisi`, `id_mesin`, `komentar`, `tgl_input`) VALUES
(1, 'E0001', 'T0000001', 'M01', 'Mesin Sudah terselesaikan dengan baik', '2020-06-14 07:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `mesin`
--

CREATE TABLE `mesin` (
  `id_mesin` varchar(3) NOT NULL,
  `tipe_mesin` varchar(20) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mesin`
--

INSERT INTO `mesin` (`id_mesin`, `tipe_mesin`, `keterangan`) VALUES
('M01', 'Hyosung', 'made in korea'),
('M02', 'Wincor', 'made in germany'),
('M03', 'NCR', 'made in United States'),
('M04', 'Diebold', ''),
('M05', 'Hitachi', ''),
('M06', 'OKI', '');

-- --------------------------------------------------------

--
-- Table structure for table `teknisi`
--

CREATE TABLE `teknisi` (
  `id_teknisi` varchar(8) NOT NULL,
  `nama_teknisi` varchar(60) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teknisi`
--

INSERT INTO `teknisi` (`id_teknisi`, `nama_teknisi`, `alamat`, `no_hp`, `email`, `tgl_input`, `tgl_update`) VALUES
('T0000001', 'Dwi Hananto', 'Kel.Mojosongo Kec.Jebres Kota Surakarta', '082242009199', 'solohananto@gmail.com', '2020-06-14 03:34:57', '2020-06-14 03:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` mediumint(9) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_teknisi` varchar(8) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_teknisi`, `tgl_input`, `tgl_update`) VALUES
(1, 'hananto', 'hananto', 'T0000001', '2020-06-14 03:36:48', '2020-06-14 03:36:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `error`
--
ALTER TABLE `error`
  ADD PRIMARY KEY (`id_eror`),
  ADD KEY `id_eror` (`id_eror`);

--
-- Indexes for table `informasi_error`
--
ALTER TABLE `informasi_error`
  ADD PRIMARY KEY (`id_informasi`),
  ADD KEY `id_teknisi` (`id_teknisi`),
  ADD KEY `id_mesin` (`id_mesin`),
  ADD KEY `id_error` (`id_eror`);

--
-- Indexes for table `mesin`
--
ALTER TABLE `mesin`
  ADD PRIMARY KEY (`id_mesin`),
  ADD KEY `id_mesin` (`id_mesin`);

--
-- Indexes for table `teknisi`
--
ALTER TABLE `teknisi`
  ADD PRIMARY KEY (`id_teknisi`),
  ADD KEY `id_teknisi` (`id_teknisi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_teknisi` (`id_teknisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `informasi_error`
--
ALTER TABLE `informasi_error`
  MODIFY `id_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `informasi_error`
--
ALTER TABLE `informasi_error`
  ADD CONSTRAINT `informasi_error_ibfk_1` FOREIGN KEY (`id_teknisi`) REFERENCES `teknisi` (`id_teknisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `informasi_error_ibfk_2` FOREIGN KEY (`id_mesin`) REFERENCES `mesin` (`id_mesin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `informasi_error_ibfk_3` FOREIGN KEY (`id_eror`) REFERENCES `error` (`id_eror`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_teknisi`) REFERENCES `teknisi` (`id_teknisi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
