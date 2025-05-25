-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Bulan Mei 2025 pada 09.55
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peran_prestasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poin` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `kegiatan`, `tingkat_kegiatan`, `peran_prestasi`, `poin`, `created_at`, `updated_at`) VALUES
(1, 'Kepanitiaan', 'INTERNASIONAL', 'Panitia Pengarah (SC)', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(2, 'Kepanitiaan', 'INTERNASIONAL', 'Ketua', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(3, 'Kepanitiaan', 'INTERNASIONAL', 'Wakil Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(4, 'Kepanitiaan', 'INTERNASIONAL', 'Sekretaris', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(5, 'Kepanitiaan', 'INTERNASIONAL', 'Bendahara', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(6, 'Kepanitiaan', 'INTERNASIONAL', 'Ketua Bidang', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(7, 'Kepanitiaan', 'INTERNASIONAL', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(8, 'Kepanitiaan', 'NASIONAL', 'SC', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(9, 'Kepanitiaan', 'NASIONAL', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(10, 'Kepanitiaan', 'NASIONAL', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(11, 'Kepanitiaan', 'NASIONAL', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(12, 'Kepanitiaan', 'NASIONAL', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(13, 'Kepanitiaan', 'NASIONAL', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(14, 'Kepanitiaan', 'NASIONAL', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(15, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'SC', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(16, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(17, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(18, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(19, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(20, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(21, 'Kepanitiaan', 'REGIONAL/PROPINSI', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(22, 'Kepanitiaan', 'KABUPATEN/KOTA', 'SC', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(23, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(24, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(25, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(26, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(27, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(28, 'Kepanitiaan', 'KABUPATEN/KOTA', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(29, 'Kepanitiaan', 'KECAMATAN', 'SC', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(30, 'Kepanitiaan', 'KECAMATAN', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(31, 'Kepanitiaan', 'KECAMATAN', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(32, 'Kepanitiaan', 'KECAMATAN', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(33, 'Kepanitiaan', 'KECAMATAN', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(34, 'Kepanitiaan', 'KECAMATAN', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(35, 'Kepanitiaan', 'KECAMATAN', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(36, 'Kepanitiaan', 'DESA/KELURAHAN', 'SC', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(37, 'Kepanitiaan', 'DESA/KELURAHAN', 'Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(38, 'Kepanitiaan', 'DESA/KELURAHAN', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(39, 'Kepanitiaan', 'DESA/KELURAHAN', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(40, 'Kepanitiaan', 'DESA/KELURAHAN', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(41, 'Kepanitiaan', 'DESA/KELURAHAN', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(42, 'Kepanitiaan', 'INTERNAL KAMPUS', 'SC', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(43, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(44, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(45, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(46, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(47, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(48, 'Kepanitiaan', 'INTERNAL KAMPUS', 'Anggota', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(49, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Juara I', 6, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(50, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Juara II', 5, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(51, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Juara III', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(52, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Harapan I, II, III', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(53, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Sepuluh Besar', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(54, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Peserta/Partisipasi', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(55, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNASIONAL', 'Supporter resmi', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(56, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Juara I', 5, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(57, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Juara II', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(58, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Juara III', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(59, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Harapan I, II, III', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(60, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Sepuluh Besar', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(61, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Peserta/Partisipasi', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(62, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL (BELMAWA/BAKORMA)', 'Supporter resmi', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(63, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Medali Emas', 6, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(64, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Medali Perak', 5, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(65, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Medali Perunggu', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(66, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Juara/Penghargaan Kategori', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(67, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Lolos PIMNAS', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(68, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Lolos Pendanaan PKM', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(69, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Juara Tingkat Polinema', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(70, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Upload Proposal Simbelmawa', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(71, 'Kejuaraan/Kompetisi/Perlombaan', 'PKM/PIMNAS', 'Proposal PKM', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(72, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Juara I', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(73, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Juara II', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(74, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Juara III', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(75, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Harapan I, II, III', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(76, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Sepuluh Besar', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(77, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Peserta/Partisipasi', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(78, 'Kejuaraan/Kompetisi/Perlombaan', 'NASIONAL LAINNYA', 'Supporter resmi', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(79, 'Kejuaraan/Kompetisi/Perlombaan', 'REGIONAL/PROPINSI', 'Juara I', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(80, 'Kejuaraan/Kompetisi/Perlombaan', 'REGIONAL/PROPINSI', 'Juara II', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(81, 'Kejuaraan/Kompetisi/Perlombaan', 'REGIONAL/PROPINSI', 'Juara III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(82, 'Kejuaraan/Kompetisi/Perlombaan', 'REGIONAL/PROPINSI', 'Harapan I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(83, 'Kejuaraan/Kompetisi/Perlombaan', 'REGIONAL/PROPINSI', 'Sepuluh Besar', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(84, 'Kejuaraan/Kompetisi/Perlombaan', 'KABUPATEN/KOTA', 'Juara I', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(85, 'Kejuaraan/Kompetisi/Perlombaan', 'KABUPATEN/KOTA', 'Juara II', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(86, 'Kejuaraan/Kompetisi/Perlombaan', 'KABUPATEN/KOTA', 'Juara III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(87, 'Kejuaraan/Kompetisi/Perlombaan', 'KABUPATEN/KOTA', 'Harapan I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(88, 'Kejuaraan/Kompetisi/Perlombaan', 'KABUPATEN/KOTA', 'Sepuluh Besar', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(89, 'Kejuaraan/Kompetisi/Perlombaan', 'KECAMATAN', 'Juara I', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(90, 'Kejuaraan/Kompetisi/Perlombaan', 'KECAMATAN', 'Juara II', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(91, 'Kejuaraan/Kompetisi/Perlombaan', 'KECAMATAN', 'Juara III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(92, 'Kejuaraan/Kompetisi/Perlombaan', 'KECAMATAN', 'Harapan I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(93, 'Kejuaraan/Kompetisi/Perlombaan', 'KECAMATAN', 'Sepuluh Besar', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(94, 'Kejuaraan/Kompetisi/Perlombaan', 'DESA/KELURAHAN', 'Juara I', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(95, 'Kejuaraan/Kompetisi/Perlombaan', 'DESA/KELURAHAN', 'Juara II', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(96, 'Kejuaraan/Kompetisi/Perlombaan', 'DESA/KELURAHAN', 'Juara III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(97, 'Kejuaraan/Kompetisi/Perlombaan', 'DESA/KELURAHAN', 'Harapan I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(98, 'Kejuaraan/Kompetisi/Perlombaan', 'DESA/KELURAHAN', 'Sepuluh Besar', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(99, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNAL KAMPUS', 'Juara I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(100, 'Kejuaraan/Kompetisi/Perlombaan', 'INTERNAL KAMPUS', 'Harapan I, II, III', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(101, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'SC', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(102, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Ketua', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(103, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Wakil Ketua', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(104, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Sekretaris', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(105, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Bendahara', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(106, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Ketua Bidang', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(107, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Anggota/Peserta', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(108, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'INTERNASIONAL', 'Penyaji/Narasumber', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(109, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'SC', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(110, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Ketua', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(111, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Wakil Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(112, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(113, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(114, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(115, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(116, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'NASIONAL', 'Penyaji/Narasumber', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(117, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Steering Committee', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(118, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Ketua', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(119, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Wakil Ketua', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(120, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Sekretaris', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(121, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Bendahara', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(122, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Ketua Bidang', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(123, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Anggota/Peserta', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(124, 'Penelitian, Pengabdian Masyarakat, Seminar, Kuliah Tamu dan Kegiatan Ilmiah Lainnya', 'LOKAL', 'Penyaji/Narasumber/Mentor/Tutor', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(125, 'Penghargaan Akademik dan Non Akademik', 'INTERNASIONAL', '-', 4, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(126, 'Penghargaan Akademik dan Non Akademik', 'NASIONAL', '-', 3, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(127, 'Penghargaan Akademik dan Non Akademik', 'REGIONAL', '-', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(128, 'Penghargaan Akademik dan Non Akademik', 'LOKAL', '-', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(129, 'Hak Paten, Hak Cipta', 'INTERNASIONAL', '-', 6, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(130, 'Hak Paten, Hak Cipta', 'NASIONAL', '-', 5, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(131, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'INTERNASIONAL', 'Ketua Tim', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(132, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'INTERNASIONAL', 'Pemain', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(133, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'NASIONAL', 'Ketua Tim', 2, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(134, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'NASIONAL', 'Pemain', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(135, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'REGIONAL/PROPINSI', 'Ketua Tim', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(136, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'REGIONAL/PROPINSI', 'Pemain', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(137, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'KABUPATEN/KOTA', 'Ketua Tim', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(138, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'KABUPATEN/KOTA', 'Pemain', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(139, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'INTERNAL POLINEMA', 'Ketua Tim', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(140, 'Pertandingan Persahabatan antar Kampus/Jurusan dengan Pihak lain/Industri/Institusi', 'INTERNAL POLINEMA', 'Pemain', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `exports`
--

CREATE TABLE `exports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faculties`
--

CREATE TABLE `faculties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faculty_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faculty_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university_branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faculties`
--

INSERT INTO `faculties` (`id`, `faculty_name`, `faculty_code`, `university_branch_id`, `created_at`, `updated_at`) VALUES
(1, 'JTI', '1', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) UNSIGNED NOT NULL,
  `validation_error` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `failed_import_rows`
--

INSERT INTO `failed_import_rows` (`id`, `data`, `import_id`, `validation_error`, `created_at`, `updated_at`) VALUES
(49, '{\"name\":\"tes1\",\"nim_nip\":\"123456\",\"email\":\"tes1234@g\",\"password\":\"123\",\"roles\":\"prodi\"}', 42, 'The NIM/NIP has already been taken. The email address is already in use.', '2025-05-23 23:10:28', '2025-05-23 23:10:28'),
(50, '{\"name\":\"tes2\",\"nim_nip\":\"12345\",\"email\":\"tes234@g\",\"password\":\"123\",\"roles\":\"prodi\"}', 42, 'The NIM/NIP has already been taken. The email address is already in use.', '2025-05-23 23:10:29', '2025-05-23 23:10:29'),
(51, '{\"name\":\"tes3\",\"nim_nip\":\"123457\",\"email\":\"tes34@g\",\"password\":\"123\",\"roles\":\"mahasiswa\"}', 42, 'The NIM/NIP has already been taken. The email address is already in use.', '2025-05-23 23:10:29', '2025-05-23 23:10:29'),
(52, '{\"name\":\"tes4\",\"nim_nip\":\"123458\",\"email\":\"tes23@g\",\"password\":\"123\",\"roles\":\"mahasiswa\"}', 42, 'The NIM/NIP has already been taken. The email address is already in use.', '2025-05-23 23:10:29', '2025-05-23 23:10:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `imports`
--

INSERT INTO `imports` (`id`, `completed_at`, `file_name`, `file_path`, `importer`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/45oYkg6aOQloBNuzmvtzIE3BY1hBxt-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:17:36', '2025-05-23 08:17:36'),
(2, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/TpI6fV9hiyCbKiGIwTnZd5sbDI5SX0-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:26:39', '2025-05-23 08:26:39'),
(3, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/gE1vqU9rg0emGyyTWdsMs1ukhulhnS-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:30:16', '2025-05-23 08:30:16'),
(4, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/ljlqvKSEuw41ONHQ2w8F4m03KlkzkT-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:36:18', '2025-05-23 08:36:18'),
(5, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/4RNrV1ZD8BdswaJPrZxklNm7hmKUEZ-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:37:22', '2025-05-23 08:37:22'),
(6, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/NQnmyZzNkliYk4EmcmOARPmpfDW93x-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:42:39', '2025-05-23 08:42:39'),
(7, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/4rSv1rGjx7xa5Yr0B5AugzF7G30Jn5-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:47:07', '2025-05-23 08:47:07'),
(8, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/KPk4eRV1pqoYulu3S1lxQ2hUBiF5u5-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:48:49', '2025-05-23 08:48:49'),
(9, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/r3tpB4pZAWELE7Va67uzVuvfPe4D4t-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:49:39', '2025-05-23 08:49:39'),
(10, '2025-05-23 08:52:02', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/vvtxrWRtOXSlK4HKAvvIAquIhMHOnv-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 2, 2, 2, 2, '2025-05-23 08:52:02', '2025-05-23 08:52:02'),
(11, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/hbkNU8it9QLx7sJ7L1OnjBAjJcboce-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:53:28', '2025-05-23 08:53:28'),
(12, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/BSXEgx0eAwATj3PfmOYWsvENfed8Pf-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:54:06', '2025-05-23 08:54:06'),
(13, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/eCP8nGY411JPccePErQkBLT5gyfw2i-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:56:38', '2025-05-23 08:56:38'),
(14, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/H2TSvY8SZ4aboLrvi18Vb2BbXKBxKq-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:58:27', '2025-05-23 08:58:27'),
(15, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/Yg4fjxJlVkL3JGh0irpBuApkbPOoCi-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 08:59:51', '2025-05-23 08:59:51'),
(16, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/gyK7BVAfSYlSV0Ia9NyFPSEUXzCttp-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:02:38', '2025-05-23 09:02:38'),
(17, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/GMfY84VxfIgAJMWXf0Zb3xCxv68E8t-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:13:44', '2025-05-23 09:13:44'),
(18, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/X37v6C4rCCAkdmxsSaLXnRq5PfLM5H-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:16:40', '2025-05-23 09:16:40'),
(19, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/5d6F3CNOuUDgQy7CEAnfGV55mULCKH-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:17:18', '2025-05-23 09:17:18'),
(20, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/7mCZN8Zm386W1PnZV3by0viA5L6RWT-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:18:22', '2025-05-23 09:18:22'),
(21, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/wutmGFA3BauRC1ZwQWWyCm9syIoT6i-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:19:25', '2025-05-23 09:19:25'),
(22, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/oxhY185WIfoxzXT2bhvm5LVeYXb5AO-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 2, 0, 2, '2025-05-23 09:21:37', '2025-05-23 09:21:37'),
(23, '2025-05-23 09:22:19', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/VGxxX8uuwCEy7peLUSSAFvnkLA29pV-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 2, 2, 2, 2, '2025-05-23 09:22:18', '2025-05-23 09:22:19'),
(24, '2025-05-23 09:24:11', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/EvmmPyVQ0BmIKuo8ZpdtkbCRsE1YDB-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 2, 2, 2, 2, '2025-05-23 09:24:10', '2025-05-23 09:24:11'),
(25, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/lpZh6KB7oywvxsbKXuyttHOSbsGJR4-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 1, 0, 2, '2025-05-23 09:25:11', '2025-05-23 09:25:11'),
(26, '2025-05-23 09:25:38', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/uuf80tOZW6hG1JdzrWztSHsp8qJ92J-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 1, 1, 1, 2, '2025-05-23 09:25:37', '2025-05-23 09:25:38'),
(27, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/M52dAtpXCSFq4icz8jMzncc4V9Gos0-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 1, 0, 1, '2025-05-23 22:23:58', '2025-05-23 22:23:58'),
(28, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/6YW2cmvhlGxmj5kkyAzJ91CDEXpqg5-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 1, 0, 1, '2025-05-23 22:26:27', '2025-05-23 22:26:27'),
(29, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/Nm7at8ynWKUaSNzqkrkoGJXogCgpko-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 1, 0, 1, '2025-05-23 22:27:21', '2025-05-23 22:27:21'),
(30, '2025-05-23 22:33:07', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/iE07enSnxca2H8ZisySo9g9Tr4IVtV-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 1, 1, 1, 1, '2025-05-23 22:33:07', '2025-05-23 22:33:07'),
(31, '2025-05-23 22:34:52', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/dP5d0FKf9DtB0tNkLEwtGdsJuCYZSC-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 1, 1, 1, 1, '2025-05-23 22:34:52', '2025-05-23 22:34:52'),
(32, '2025-05-23 22:38:29', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/vkXts18QJMFiCml7xMck8Gp83sG9ju-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 22:38:28', '2025-05-23 22:38:29'),
(33, '2025-05-23 22:43:07', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/RWJvpb3oR225tsGge4O5EPIZ7ubkn0-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 22:43:06', '2025-05-23 22:43:07'),
(34, '2025-05-23 22:56:47', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/nFut0sjpNzvrUrF8yQVwbenXYmWrNZ-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 22:56:47', '2025-05-23 22:56:47'),
(35, '2025-05-23 22:57:50', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/sZ93PGO6uZ4KYllC4zzIlyKrmMIHUI-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 22:57:50', '2025-05-23 22:57:50'),
(36, '2025-05-23 22:59:42', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/oal8TgU6GQMKhBZhFsNwfJCvAWuc9X-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 22:59:41', '2025-05-23 22:59:42'),
(37, '2025-05-23 23:00:26', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/EqiKVEqE3MsQHJUvWHov8y00cW0qrp-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 23:00:25', '2025-05-23 23:00:26'),
(38, '2025-05-23 23:01:19', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/5YCLGG6y2iMd4YkRCYTvfcduy9J2mS-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 23:01:18', '2025-05-23 23:01:19'),
(39, '2025-05-23 23:03:08', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/wmnCLhpVkjvl8Zyd13creJxCtE9Zt9-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 23:03:07', '2025-05-23 23:03:08'),
(40, '2025-05-23 23:04:00', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/OEwhWct9ZUUiNuWlUkvHNmGMSxVgOC-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 4, 1, '2025-05-23 23:03:59', '2025-05-23 23:04:00'),
(41, NULL, 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/7yX9qCaR6CXFwZVRayKkFZLxN7gPxE-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 0, 4, 0, 1, '2025-05-23 23:05:09', '2025-05-23 23:05:09'),
(42, '2025-05-23 23:10:29', 'user-importer-example (1).csv', 'C:\\xampp\\htdocs\\skripsi\\storage\\app\\livewire-tmp/7yX9qCaR6CXFwZVRayKkFZLxN7gPxE-metadXNlci1pbXBvcnRlci1leGFtcGxlICgxKS5jc3Y=-.csv', 'App\\Filament\\Imports\\UserImporter', 4, 4, 0, 1, '2025-05-23 23:10:28', '2025-05-23 23:10:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9efb286d-6e50-474a-8190-23397931f2bf', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3532:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:4:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:10;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000a460000000000000000\";}\";s:4:\"hash\";s:44:\"k14J4yN/aQgX/ldGrptlyami7hL2BGflT9HrYbvknVY=\";}}}}', NULL, 1748015522, 1748015522),
('9efb3341-21f4-4a87-8c9b-4808cbdfa733', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:23;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"ZVG7A8dwUdwDc2gtoH0w8ZERxNDEh3N3vMS+sVYisqE=\";}}}}', NULL, 1748017338, 1748017339),
('9efb33ec-2d68-4551-8fbb-c5b9ac6f8ce2', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:24;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"5z+Xg10YNOSOowGkfPTyEQ8P/KHUVq28hN7zxYqGt+Y=\";}}}}', NULL, 1748017450, 1748017451),
('9efb3470-dd81-474d-ac79-818ba2dac063', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:26;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"I4jrpxdT2LG8wuwGt8m66pYzNmNGFSXF2/EO4gx+hZc=\";}}}}', NULL, 1748017537, 1748017538),
('9efc4e12-59f0-40d8-bbf7-b7afc6d2383f', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:30;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"MSZxZvYCznSrd6GaK9138NHKlRV0mhKk7XAcFiKT+yI=\";}}}}', NULL, 1748064787, 1748064787),
('9efc4eb1-fb31-4264-b8ff-a8cc6b43d65d', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:31;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"m7jyfdPD6VEh3wCM079MXBPOmASio4qwPpw63eW9jfA=\";}}}}', NULL, 1748064892, 1748064892),
('9efc4ffc-3be8-41b9-b23c-b97e8faec4ff', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:32;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"UygF42TSDJYh0w6Wnd1OnpC+/BDjzAqlGFMPQpfTGTQ=\";}}}}', NULL, 1748065108, 1748065109),
('9efc51a4-2b50-4154-b8e3-2266a07646a7', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:33;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"8voPImYZ7Gx68TuWH3DN15M5Fav8muXb5JjG2u0OCGw=\";}}}}', NULL, 1748065386, 1748065387),
('9efc5688-1ee1-4c45-a84b-1e59e539e50d', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:34;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"8rmZXA1sZIUg4XRzyufUBo2fUQ9T6hAclwFPT1wJwlk=\";}}}}', NULL, 1748066207, 1748066207),
('9efc56e8-47f5-4fdf-9e45-b971c1fecd93', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:35;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"vS2RsDx4MqcnqV/y9xZsaasf1ERqlClUKELsGQDd7YQ=\";}}}}', NULL, 1748066270, 1748066270),
('9efc5792-25cc-44e6-b7f1-0bf310d60f64', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:36;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"lpNApsE2Jy3dnJgcQhWzgs/emS9/pdqeMvjYT+p/rCU=\";}}}}', NULL, 1748066381, 1748066382),
('9efc57d6-13b1-41ec-a69e-5c31d8141664', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:37;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"Xo1DF5ZbOZ7VnMy9wVQCkv3WYbMwqGFhATX9rA+DNqQ=\";}}}}', NULL, 1748066425, 1748066426);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9efc5826-15c3-47bd-ad9f-4c791d801819', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:38;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"ut/fYQRlwJb2CbgE4tkq2QNB3uwBvv5QfWshjaFAwYA=\";}}}}', NULL, 1748066478, 1748066479),
('9efc58cd-2a36-4b54-983d-cb14f0366b28', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:39;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"G8al3YZuIcSEgisH+TyYbptdgyRdy48Ck7LF28HTY5M=\";}}}}', NULL, 1748066587, 1748066588),
('9efc591c-0ae8-4a11-b1ac-2b14f484af25', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:40;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c630000000000000000\";}\";s:4:\"hash\";s:44:\"tNUUnWkjIkd5G/yT3MdcZHO00NMvrOfeXaP+/caBU9E=\";}}}}', NULL, 1748066639, 1748066640),
('9efc5b6d-aa19-4d68-b46d-66fc5bebddab', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3556:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:7:\"nim_nip\";s:7:\"nim_nip\";s:5:\"email\";s:5:\"email\";s:8:\"password\";s:8:\"password\";s:5:\"roles\";s:5:\"roles\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:42;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:36:\"Filament\\Tables\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c640000000000000000\";}\";s:4:\"hash\";s:44:\"cXgEGHOqZ4auzTZT1CFSngUWEeqcSbGt5eEIIErt3GE=\";}}}}', NULL, 1748067028, 1748067029);

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `semester` int(11) NOT NULL,
  `ip_semester` decimal(3,2) NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`id`, `user_id`, `semester`, `ip_semester`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '3.00', 'khs/21417210215/1.pdf', '2025-05-21 06:42:15', '2025-05-21 06:42:15'),
(2, 3, 2, '3.10', 'khs/21417210215/2.pdf', '2025-05-21 06:42:40', '2025-05-21 06:42:40'),
(3, 3, 3, '3.30', 'khs/21417210215/3.pdf', '2025-05-21 06:43:03', '2025-05-21 06:43:03'),
(4, 4, 1, '2.90', 'khs/2041720050/1.pdf', '2025-05-21 06:55:07', '2025-05-21 06:55:07'),
(5, 4, 2, '3.80', 'khs/2041720050/2.pdf', '2025-05-21 06:55:55', '2025-05-21 06:55:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_04_23_162522_create_permission_tables', 1),
(6, '2025_04_23_165020_create_categories_table', 1),
(7, '2025_04_23_172349_create_portfolios_table', 1),
(8, '2025_05_01_054657_create_khs_table', 1),
(9, '2025_05_09_183202_create_job_batches_table', 1),
(10, '2025_05_09_183214_create_notifications_table', 1),
(11, '2025_05_09_183224_create_imports_table', 1),
(12, '2025_05_09_183225_create_exports_table', 1),
(13, '2025_05_09_183226_create_failed_import_rows_table', 1),
(14, '2025_05_18_112820_add_custom_fields_to_users_table', 1),
(15, '2025_05_18_112821_add_avatar_url_to_users_table', 1),
(16, '2025_05_20_030417_create_prodi_codes_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(3, 'App\\Models\\User', 34),
(3, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 47),
(3, 'App\\Models\\User', 48),
(3, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 50),
(3, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 54),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 66),
(3, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 69),
(3, 'App\\Models\\User', 70),
(3, 'App\\Models\\User', 71),
(3, 'App\\Models\\User', 72),
(3, 'App\\Models\\User', 73),
(3, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 76),
(3, 'App\\Models\\User', 77),
(3, 'App\\Models\\User', 78),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 80),
(3, 'App\\Models\\User', 81),
(3, 'App\\Models\\User', 82),
(3, 'App\\Models\\User', 83),
(3, 'App\\Models\\User', 84),
(3, 'App\\Models\\User', 85),
(3, 'App\\Models\\User', 86),
(3, 'App\\Models\\User', 87),
(3, 'App\\Models\\User', 88),
(3, 'App\\Models\\User', 89),
(3, 'App\\Models\\User', 90),
(3, 'App\\Models\\User', 91),
(3, 'App\\Models\\User', 92),
(3, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 94),
(3, 'App\\Models\\User', 95),
(3, 'App\\Models\\User', 96),
(3, 'App\\Models\\User', 97),
(3, 'App\\Models\\User', 98),
(3, 'App\\Models\\User', 99),
(3, 'App\\Models\\User', 100),
(3, 'App\\Models\\User', 101),
(3, 'App\\Models\\User', 102),
(3, 'App\\Models\\User', 103),
(3, 'App\\Models\\User', 104),
(3, 'App\\Models\\User', 105),
(3, 'App\\Models\\User', 106),
(3, 'App\\Models\\User', 107),
(3, 'App\\Models\\User', 108),
(3, 'App\\Models\\User', 109),
(3, 'App\\Models\\User', 110),
(3, 'App\\Models\\User', 111),
(3, 'App\\Models\\User', 112),
(3, 'App\\Models\\User', 113),
(3, 'App\\Models\\User', 114),
(3, 'App\\Models\\User', 115),
(3, 'App\\Models\\User', 116),
(3, 'App\\Models\\User', 117),
(3, 'App\\Models\\User', 118),
(3, 'App\\Models\\User', 119),
(3, 'App\\Models\\User', 120),
(3, 'App\\Models\\User', 121),
(3, 'App\\Models\\User', 122),
(3, 'App\\Models\\User', 123),
(3, 'App\\Models\\User', 124),
(3, 'App\\Models\\User', 125),
(3, 'App\\Models\\User', 126),
(3, 'App\\Models\\User', 127),
(3, 'App\\Models\\User', 128),
(3, 'App\\Models\\User', 129),
(3, 'App\\Models\\User', 130),
(3, 'App\\Models\\User', 131),
(3, 'App\\Models\\User', 132),
(3, 'App\\Models\\User', 133),
(3, 'App\\Models\\User', 134),
(3, 'App\\Models\\User', 135),
(3, 'App\\Models\\User', 136),
(3, 'App\\Models\\User', 137),
(3, 'App\\Models\\User', 138),
(3, 'App\\Models\\User', 139),
(3, 'App\\Models\\User', 140),
(3, 'App\\Models\\User', 141),
(3, 'App\\Models\\User', 142),
(3, 'App\\Models\\User', 143),
(3, 'App\\Models\\User', 144),
(3, 'App\\Models\\User', 145),
(3, 'App\\Models\\User', 146),
(3, 'App\\Models\\User', 147),
(3, 'App\\Models\\User', 148),
(3, 'App\\Models\\User', 149),
(3, 'App\\Models\\User', 150),
(3, 'App\\Models\\User', 151),
(3, 'App\\Models\\User', 152),
(3, 'App\\Models\\User', 153),
(3, 'App\\Models\\User', 154),
(3, 'App\\Models\\User', 155),
(3, 'App\\Models\\User', 156),
(3, 'App\\Models\\User', 157),
(3, 'App\\Models\\User', 158),
(3, 'App\\Models\\User', 159),
(3, 'App\\Models\\User', 160),
(3, 'App\\Models\\User', 161),
(3, 'App\\Models\\User', 162),
(3, 'App\\Models\\User', 163),
(3, 'App\\Models\\User', 164),
(3, 'App\\Models\\User', 165),
(3, 'App\\Models\\User', 166),
(3, 'App\\Models\\User', 167),
(3, 'App\\Models\\User', 168),
(3, 'App\\Models\\User', 169),
(3, 'App\\Models\\User', 170),
(3, 'App\\Models\\User', 171),
(3, 'App\\Models\\User', 172),
(3, 'App\\Models\\User', 173),
(3, 'App\\Models\\User', 174),
(3, 'App\\Models\\User', 175),
(3, 'App\\Models\\User', 176),
(3, 'App\\Models\\User', 177),
(3, 'App\\Models\\User', 178),
(3, 'App\\Models\\User', 179),
(3, 'App\\Models\\User', 180),
(3, 'App\\Models\\User', 181),
(3, 'App\\Models\\User', 182),
(3, 'App\\Models\\User', 183),
(3, 'App\\Models\\User', 184),
(3, 'App\\Models\\User', 185),
(3, 'App\\Models\\User', 186),
(3, 'App\\Models\\User', 187),
(3, 'App\\Models\\User', 188),
(3, 'App\\Models\\User', 189),
(3, 'App\\Models\\User', 190),
(3, 'App\\Models\\User', 191),
(3, 'App\\Models\\User', 192),
(3, 'App\\Models\\User', 193),
(3, 'App\\Models\\User', 194),
(3, 'App\\Models\\User', 195),
(3, 'App\\Models\\User', 196),
(3, 'App\\Models\\User', 197),
(3, 'App\\Models\\User', 198),
(3, 'App\\Models\\User', 199),
(3, 'App\\Models\\User', 200),
(3, 'App\\Models\\User', 201),
(3, 'App\\Models\\User', 202),
(3, 'App\\Models\\User', 203),
(3, 'App\\Models\\User', 204),
(3, 'App\\Models\\User', 205),
(3, 'App\\Models\\User', 206),
(3, 'App\\Models\\User', 207),
(3, 'App\\Models\\User', 208),
(3, 'App\\Models\\User', 209),
(3, 'App\\Models\\User', 210),
(3, 'App\\Models\\User', 211),
(3, 'App\\Models\\User', 212);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(2, 'view_any_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(3, 'create_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(4, 'update_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(5, 'restore_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(6, 'restore_any_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(7, 'replicate_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(8, 'reorder_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(9, 'delete_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(10, 'delete_any_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(11, 'force_delete_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(12, 'force_delete_any_category', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(13, 'view_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(14, 'view_any_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(15, 'create_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(16, 'update_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(17, 'restore_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(18, 'restore_any_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(19, 'replicate_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(20, 'reorder_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(21, 'delete_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(22, 'delete_any_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(23, 'force_delete_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(24, 'force_delete_any_khs', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(25, 'view_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(26, 'view_any_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(27, 'create_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(28, 'update_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(29, 'restore_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(30, 'restore_any_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(31, 'replicate_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(32, 'reorder_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(33, 'delete_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(34, 'delete_any_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(35, 'force_delete_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(36, 'force_delete_any_portfolio', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(37, 'view_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(38, 'view_any_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(39, 'create_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(40, 'update_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(41, 'restore_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(42, 'restore_any_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(43, 'replicate_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(44, 'reorder_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(45, 'delete_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(46, 'delete_any_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(47, 'force_delete_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(48, 'force_delete_any_prodi', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(49, 'view_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(50, 'view_any_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(51, 'create_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(52, 'update_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(53, 'restore_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(54, 'restore_any_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(55, 'replicate_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(56, 'reorder_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(57, 'delete_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(58, 'delete_any_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(59, 'force_delete_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(60, 'force_delete_any_recap', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(61, 'view_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(62, 'view_any_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(63, 'create_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(64, 'update_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(65, 'delete_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(66, 'delete_any_role', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(67, 'view_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(68, 'view_any_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(69, 'create_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(70, 'update_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(71, 'restore_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(72, 'restore_any_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(73, 'replicate_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(74, 'reorder_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(75, 'delete_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(76, 'delete_any_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(77, 'force_delete_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(78, 'force_delete_any_user', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(79, 'page_EditProfilePage', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(80, 'widget_ProdiStateOverview', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(81, 'widget_MahasiswaStatOverview', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(82, 'widget_ActivityChart', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(83, 'widget_HistoryIPSChart', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(84, 'widget_StatusPortfolioChart', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(85, 'widget_HistoryUploadTable', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(86, 'widget_NonAcademicRankingTable', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(87, 'widget_AcademicRankingTable', 'web', '2025-05-20 00:32:03', '2025-05-20 00:32:03'),
(88, 'widget_RankingTable', 'web', '2025-05-20 00:32:04', '2025-05-20 00:32:04'),
(89, 'widget_AverageIPSChart', 'web', '2025-05-21 08:59:33', '2025-05-21 08:59:33'),
(90, 'page_Themes', 'web', '2025-05-24 01:28:46', '2025-05-24 01:28:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `jenis_pencapaian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('revise','on-review','accepted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on-review',
  `feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `portfolios`
--

INSERT INTO `portfolios` (`id`, `nama_kegiatan`, `kategori_id`, `tanggal_kegiatan`, `jenis_pencapaian`, `file_path`, `user_id`, `status`, `feedback`, `verified_by`, `created_at`, `updated_at`) VALUES
(1, 'sertifikasi', 9, '2025-05-06', 'Akademik', 'portofolio/21417210215/1747834828.pdf', 3, 'accepted', 'acc', NULL, '2025-05-21 06:40:28', '2025-05-21 07:49:39'),
(2, 'sertifikasi', 9, '2025-04-30', 'Non-Akademik', 'portofolio/2141720039/1747838958.pdf', 5, 'revise', 'ganti\n', NULL, '2025-05-21 07:49:18', '2025-05-21 07:53:32'),
(3, 'karya ilmiah', 57, '2025-05-13', 'Akademik', 'portofolio/2141762146/1747839172.pdf', 211, 'on-review', NULL, NULL, '2025-05-21 07:52:52', '2025-05-21 07:52:52'),
(4, 'portMHS2', 2, '2025-04-30', 'Akademik', 'portofolio/21417210215/1748112402.pdf', 3, 'accepted', 'acc min\n', NULL, '2025-05-24 11:46:42', '2025-05-24 12:07:40'),
(5, 'tes', 72, '2025-05-07', 'Non-Akademik', 'portofolio/21417210215/1748112462.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 11:47:42', '2025-05-24 12:08:08'),
(6, 'tes1', 130, '2025-05-03', 'Akademik', 'portofolio/21417210215/1748112497.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 11:48:17', '2025-05-24 12:12:13'),
(7, 'portMHS1', 136, '2025-05-03', 'Non-Akademik', 'portofolio/21417210215/1748112622.pdf', 3, 'accepted', 'cc', NULL, '2025-05-24 11:50:22', '2025-05-24 12:12:26'),
(8, 'tes1', 64, '2025-05-08', 'Non-Akademik', 'portofolio/21417210215/1748113868.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 12:11:08', '2025-05-24 12:12:38'),
(9, 'karya ilmiah', 120, '2025-05-16', 'Akademik', 'portofolio/21417210215/1748116638.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 12:57:18', '2025-05-24 12:58:50'),
(10, 'tes1', 111, '2025-05-10', 'Akademik', 'portofolio/21417210215/1748116709.pdf', 3, 'accepted', 'acc\n', NULL, '2025-05-24 12:58:29', '2025-05-24 12:59:07'),
(11, 'qwe', 117, '2025-05-14', 'Akademik', 'portofolio/21417210215/1748116827.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 13:00:27', '2025-05-24 13:01:34'),
(12, 'tesss', 127, '2025-05-08', 'Akademik', 'portofolio/21417210215/1748116864.pdf', 3, 'accepted', 'acc', NULL, '2025-05-24 13:01:04', '2025-05-24 13:01:46'),
(13, 'sertifikasi', 1, '2025-05-02', 'Akademik', 'portofolio/21417210215/1748117777.pdf', 3, 'accepted', 'p', NULL, '2025-05-24 13:16:17', '2025-05-24 13:16:38'),
(14, 'sertifikasi', 9, '2025-05-16', 'Non-Akademik', 'portofolio/21417210215/1748117846.pdf', 3, 'accepted', 'd', NULL, '2025-05-24 13:17:26', '2025-05-24 13:19:08'),
(15, 'sertifikasi', 10, '2025-05-01', 'Akademik', 'portofolio/21417210215/1748117921.pdf', 3, 'on-review', NULL, NULL, '2025-05-24 13:18:41', '2025-05-24 13:18:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prodi_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `prodis`
--

INSERT INTO `prodis` (`id`, `prodi_name`, `prodi_code`, `faculty_id`, `created_at`, `updated_at`) VALUES
(1, 'DIV Teknik Informatika', '172', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(2, 'DIV Teknik Informatika', '702', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(3, 'DIV Sistem Informasi Bisnis', '176', 1, '2025-05-20 00:25:18', '2025-05-21 06:32:57'),
(4, 'DIV Sistem Informasi Bisnis', '706', 1, '2025-05-20 00:25:18', '2025-05-20 00:25:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(2, 'prodi', 'web', '2025-05-20 00:25:18', '2025-05-20 00:25:18'),
(3, 'mahasiswa', 'web', '2025-05-20 00:25:18', '2025-05-20 00:25:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 2),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(79, 3),
(80, 1),
(80, 2),
(81, 1),
(81, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 2),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `university_branches`
--

CREATE TABLE `university_branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `university_branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `university_branches`
--

INSERT INTO `university_branches` (`id`, `university_branch`, `branch_code`, `created_at`, `updated_at`) VALUES
(1, 'Pusat', '1', '2025-05-20 00:25:18', '2025-05-20 00:25:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim_nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `nim_nip`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `custom_fields`, `avatar_url`) VALUES
(1, 'superadmin', '-', 'superadmin@gmail.com', NULL, '$2y$12$5jzEQ7UIY8ElaIbu6L9km.srzDUlumqDJ.xeE230NnBZq8jcb8OVS', NULL, '2025-05-20 00:25:18', '2025-05-20 00:25:18', NULL, NULL),
(2, 'Hendra Pradibta, SE., M.Sc.', '198305212006041000', 'hendrapradibta@gmail.com', NULL, '$2y$12$mbcsIa8d7buAsK/.eoJ.9ObZydT8Y/70ZkZ/TrGAeTbCtaWWkEqta', NULL, '2025-05-20 00:25:18', '2025-05-20 00:25:18', NULL, NULL),
(3, 'FAWAA\'EL AKBAR El FIRDAUS', '21417210215', '2141720215@student.polinema.ac.id', NULL, '$2y$12$o6X291oFeMGvBBaP6tkRGuRHac3PKzfiGdbAltDnDTLseiBwdlKu2', NULL, '2025-05-20 00:25:19', '2025-05-24 11:51:22', NULL, NULL),
(4, 'ABDULLAH KHAFABI', '2041720050', '2041720050@student.polinema.ac.id', NULL, '$2y$12$TDOxRjWq1CcO04Tf/mLV4.wQKu023B8xf8zYfZ2ACwvHiMwTYvxs6', NULL, '2025-05-20 00:25:19', '2025-05-20 00:25:19', NULL, NULL),
(5, 'ACHMAD ALY ABDULLOH', '2141720039', '2141720039@student.polinema.ac.id', NULL, '$2y$12$mCaBc7DO9NBHeAmIgrr.suEXuQowReQ2euLPKtCvCNC0k9FMhyfmq', NULL, '2025-05-20 00:25:19', '2025-05-20 00:25:19', NULL, NULL),
(6, 'ACHMAD RACHMANDIKA RIZKY PRATAMA', '2041720125', '2041720125@student.polinema.ac.id', NULL, '$2y$12$i.E8USDMVjgTO8FnhpSXd.ciHGIVaCYMYxaW8hjNvopBtSpgWF.ZC', NULL, '2025-05-20 00:25:19', '2025-05-20 00:25:19', NULL, NULL),
(7, 'ADITYA KUNCARA BAKTI', '2041720231', '2041720231@student.polinema.ac.id', NULL, '$2y$12$WwGAxUXfildrU7.P/U5mQOQLsdGfIJ/JMhVQfBzeeUniMfuBM5ov6', NULL, '2025-05-20 00:25:19', '2025-05-20 00:25:19', NULL, NULL),
(8, 'AGUS PRAYOGI', '2141720025', '2141720025@student.polinema.ac.id', NULL, '$2y$12$HlZSB0zqlnVI8rnZYpSUgeN0kbxfeshq9ofC6lsGSNQyRizUOg63O', NULL, '2025-05-20 00:25:20', '2025-05-20 00:25:20', NULL, NULL),
(9, 'AIDO LUTHFI AL HAKIM', '2141720136', '2141720136@student.polinema.ac.id', NULL, '$2y$12$UB9lFpmMw2TV6aDYWPTd.OywqB/HIn/WPodanwMnklnCacgFC8kxq', NULL, '2025-05-20 00:25:20', '2025-05-20 00:25:20', NULL, NULL),
(10, 'ALFAN FARCHI AL-HADI', '2141720084', '2141720084@student.polinema.ac.id', NULL, '$2y$12$L9tMZO8ne7YzrJSqpEN5zuHcK47Chl/qGCvdYk1WEQJxyjxR7mPCy', NULL, '2025-05-20 00:25:20', '2025-05-20 00:25:20', NULL, NULL),
(11, 'ALFAN MARCEL MULYAWAN', '2141720266', '2141720266@student.polinema.ac.id', NULL, '$2y$12$UaE1SyyJvGDlo2pnM9Ps7OrtQIWJIo8ZiwOT2WfWh15CL4/cp2z4i', NULL, '2025-05-20 00:25:20', '2025-05-20 00:25:20', NULL, NULL),
(12, 'ALWAN ALAWI', '2141720178', '2141720178@student.polinema.ac.id', NULL, '$2y$12$I60wCCEAdVeqzS5w2PRah.yg5ic7xKNvSaHftuPWX3gTLMMVMpL2m', NULL, '2025-05-20 00:25:20', '2025-05-20 00:25:20', NULL, NULL),
(13, 'ARHAN WINDU RIZKI PUTRA BUDIANTO', '2141720227', '2141720227@student.polinema.ac.id', NULL, '$2y$12$ajf8.irZpoFzzUsq03/aiORhQn2il34cZDp0xTSHagQ3MwTf.OX7W', NULL, '2025-05-20 00:25:21', '2025-05-20 00:25:21', NULL, NULL),
(14, 'DANDY WAHYU SYAHPUTRA', '2141720002', '2141720002@student.polinema.ac.id', NULL, '$2y$12$bx.P4qPGGQfer9Ka6wEW7.T63NP0zy93nvlQ59zXD/9ATMN5E2uD2', NULL, '2025-05-20 00:25:21', '2025-05-20 00:25:21', NULL, NULL),
(15, 'DIAH PUTRI NOFIANTI', '2141720054', '2141720054@student.polinema.ac.id', NULL, '$2y$12$FiijP9QL5n56MfwMB.lqauHK8kGPXaGQWEx2xIRyXSGkAsFoO/IOO', NULL, '2025-05-20 00:25:21', '2025-05-20 00:25:21', NULL, NULL),
(16, 'EVI AMALIA MIDFIA', '2141720030', '2141720030@student.polinema.ac.id', NULL, '$2y$12$lSF7SEW/6co7uy5zTpjFpO6NxnvBSrt1/uCc80NKBxfkfp2lBIvxS', NULL, '2025-05-20 00:25:21', '2025-05-20 00:25:21', NULL, NULL),
(17, 'JAUHAR MAULANA A\'LA', '2141720186', '2141720186@student.polinema.ac.id', NULL, '$2y$12$YezSuN0fNR1fqgnPoAqqA.g8WbPoQzynQ0M8DQFO87qF9lpGsqslu', NULL, '2025-05-20 00:25:21', '2025-05-20 00:25:21', NULL, NULL),
(18, 'KURNIAWATI AGUSTINA', '2141720040', '2141720040@student.polinema.ac.id', NULL, '$2y$12$WyNSoqCM7ip6DxFmHtN2keO1Nij161QnjLxE9S.VaJY33EUFPocyy', NULL, '2025-05-20 00:25:22', '2025-05-20 00:25:22', NULL, NULL),
(19, 'KYNANTIO CANDRA ABRARI', '2141720206', '2141720206@student.polinema.ac.id', NULL, '$2y$12$o89UkiZJzl5FMJofe4BslurAXSPZMJKY0wHSkd7GfQXfGBiM9OQIi', NULL, '2025-05-20 00:25:22', '2025-05-20 00:25:22', NULL, NULL),
(20, 'M. ROHMATUL MAULUDI', '2141720062', '2141720062@student.polinema.ac.id', NULL, '$2y$12$5H2Gx3JoegCXeRSrU4L3EOO261/rLL1o4QZdHam309nFQnaUsxxbC', NULL, '2025-05-20 00:25:22', '2025-05-20 00:25:22', NULL, NULL),
(21, 'MIRZA PRISCILLA FARADIBA', '2141720254', '2141720254@student.polinema.ac.id', NULL, '$2y$12$lVKvb7K4/2uq60QP60ymDeEBGyaIVnB1ID0npwToVso.5LeV8W9ZS', NULL, '2025-05-20 00:25:22', '2025-05-20 00:25:22', NULL, NULL),
(22, 'MOHAMMAD ALFARIZI ABDULLAH', '2141720142', '2141720142@student.polinema.ac.id', NULL, '$2y$12$qmb.DRbxsUk6Yu.gTOBld.AoYQ4.QH43qcj9Saq.4amE2MPEHATHu', NULL, '2025-05-20 00:25:22', '2025-05-20 00:25:22', NULL, NULL),
(23, 'MUHAMMAD HAIKAL BULDAN', '2141720080', '2141720080@student.polinema.ac.id', NULL, '$2y$12$BxHC.Qr1.dcUjAQrKR6awuFkaohYNpi85ZMvNc8xp91Qpmna.4f5S', NULL, '2025-05-20 00:25:23', '2025-05-20 00:25:23', NULL, NULL),
(24, 'MUHAMMAD HATTA', '2141720021', '2141720021@student.polinema.ac.id', NULL, '$2y$12$BTcRNFm7WthIxy/fGoB6xuDiNxIWw/rWn6WkcoCBmG7k.6D0BWMO2', NULL, '2025-05-20 00:25:23', '2025-05-20 00:25:23', NULL, NULL),
(25, 'MUHAMMAD RIFAT ANWAR', '2141720006', '2141720006@student.polinema.ac.id', NULL, '$2y$12$a7WtcSpYX6VkVpHZuKaHBecj2xQqfU.L33T9VwraHfD7RpLlQhafC', NULL, '2025-05-20 00:25:23', '2025-05-20 00:25:23', NULL, NULL),
(26, 'NAUFAL FALAH WAFIUDDIN', '2141720129', '2141720129@student.polinema.ac.id', NULL, '$2y$12$IqgxpgKOgfFh.LS/5uzG9.S5iEeYXy5UCOlzvelmH/iIkmnVfMqqy', NULL, '2025-05-20 00:25:23', '2025-05-20 00:25:23', NULL, NULL),
(27, 'RIZKY ANGKATA PUTRA SASONGKO', '2141720223', '2141720223@student.polinema.ac.id', NULL, '$2y$12$9syRz5OJlB3hjdGnyu9xA.SzOuCOLnC36mJPH7q4HYCFyXAFULcci', NULL, '2025-05-20 00:25:23', '2025-05-20 00:25:23', NULL, NULL),
(28, 'SABBAHA NAUFAL ERWANDA', '2141720221', '2141720221@student.polinema.ac.id', NULL, '$2y$12$XPEbTa2ODdcW5OjvUqHUeeGcR4HUeqIqetrqaqHL1CxRVGK9lBvB6', NULL, '2025-05-20 00:25:24', '2025-05-20 00:25:24', NULL, NULL),
(29, 'TARISTA DWI SILVIA', '2141720014', '2141720014@student.polinema.ac.id', NULL, '$2y$12$dnZLkpAbTUW1Dfq.sAuHxu209UvuW43gEA6pQbzAyvIzwNdEt5PXK', NULL, '2025-05-20 00:25:24', '2025-05-20 00:25:24', NULL, NULL),
(30, 'TESYA ERIANA', '2141720024', '2141720024@student.polinema.ac.id', NULL, '$2y$12$F.odCI.FIUGUAE99c4a9zOPwSd6sr0DhIa2ae25Yt8vVWZ8xUpFGu', NULL, '2025-05-20 00:25:24', '2025-05-20 00:25:24', NULL, NULL),
(31, 'WIDYA INDAH PUSPITA SARI', '2141720034', '2141720034@student.polinema.ac.id', NULL, '$2y$12$EZLzMAXnh1o5ayBnEEfQFe0giy.l3G4pAD1MAEBkg0wYnnldrtEaK', NULL, '2025-05-20 00:25:24', '2025-05-20 00:25:24', NULL, NULL),
(32, 'YISHA ZUKHRUFIN ANGELYNA', '2141720013', '2141720013@student.polinema.ac.id', NULL, '$2y$12$tKwrwBGKZm8SLH4l1Ov8YeAzJvuT2gFLon2PyaF5QNHdcNM.UzOZq', NULL, '2025-05-20 00:25:25', '2025-05-20 00:25:25', NULL, NULL),
(33, 'ABIMA FADRICHO SYUHADAK', '2241720025', '2241720025@student.polinema.ac.id', NULL, '$2y$12$ONcm4vScwkLLkuvTqvvH/e/sKUtq2arpmyBTBHE4I6/.3AH2gtvYW', NULL, '2025-05-20 00:25:25', '2025-05-20 00:25:25', NULL, NULL),
(34, 'ANDREAGAZY IZA AMERIANTO', '2241720146', '2241720146@student.polinema.ac.id', NULL, '$2y$12$qcOToqn/EW1yJ3QN.QJmQulOpQSlCWvVYzyJK2lf50texck4jC2mK', NULL, '2025-05-20 00:25:25', '2025-05-20 00:25:25', NULL, NULL),
(35, 'ARMAND MAULANA ANDIKA PUTRA', '2241720090', '2241720090@student.polinema.ac.id', NULL, '$2y$12$RT0r2OXTuKBwIxX3Y8Lh.OF4bnxMP/likIv54Po8qfCCe8hUV4ZmG', NULL, '2025-05-20 00:25:25', '2025-05-20 00:25:25', NULL, NULL),
(36, 'ARYA CHANDRA KUSUMA', '2241720228', '2241720228@student.polinema.ac.id', NULL, '$2y$12$0zRfkE./N97kxGxMMe8rzu5be5g2X4rBLR3vXOCvBjVv6Yj2M/MX2', NULL, '2025-05-20 00:25:25', '2025-05-20 00:25:25', NULL, NULL),
(37, 'ASTRID RISA WIDIANA', '2241720250', '2241720250@student.polinema.ac.id', NULL, '$2y$12$6tRCFZgEKAUhRmUTsNpsLuUsrvLCTA5Ho0ctgloG7Zu4WHH.tf02W', NULL, '2025-05-20 00:25:26', '2025-05-20 00:25:26', NULL, NULL),
(38, 'ASYIFA NURFADILAH', '2241720257', '2241720257@student.polinema.ac.id', NULL, '$2y$12$pm5TSWBXPR8.iw8jvXYHeObShrt1/gECTEbmWE23p/.6ZXsG7Zada', NULL, '2025-05-20 00:25:26', '2025-05-20 00:25:26', NULL, NULL),
(39, 'BAGUS ARNOVARIO WIBOWO', '2241720225', '2241720225@student.polinema.ac.id', NULL, '$2y$12$0v5FYnQ3/FO/D8YEJGSFEOppqgsQ8CsN5n3NGXwXE6gevmnqxysHW', NULL, '2025-05-20 00:25:26', '2025-05-20 00:25:26', NULL, NULL),
(40, 'BIMANTARA DWI CAHYO', '2241720188', '2241720188@student.polinema.ac.id', NULL, '$2y$12$6sKRUEysKYXnEN.ayQ46vORFG5xiHvoRK8e5dOpKKLiCagQK04EAK', NULL, '2025-05-20 00:25:26', '2025-05-20 00:25:26', NULL, NULL),
(41, 'DIDO IMAM PADMANEGARA', '2241720111', '2241720111@student.polinema.ac.id', NULL, '$2y$12$Bh6tqk1GHAYYSjqNKKJPN.ICkPNkaLsHnFPE4.YR.SfUX.CPp8YaG', NULL, '2025-05-20 00:25:26', '2025-05-20 00:25:26', NULL, NULL),
(42, 'ELIS NURHIDAYATI', '2241720035', '2241720035@student.polinema.ac.id', NULL, '$2y$12$hyuvfn3nCPp5rFJzCoduN.b.tcDtpaD4OJf8DH9RN3974AzKWDsXK', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(43, 'FAHRIDANA AHMAD RAYYANSYAH', '2241720158', '2241720158@student.polinema.ac.id', NULL, '$2y$12$o6.k5ujB53U.DGAS8ljpBOcAXD/tJh3kUrvle6xnziVbrkHr1Avvq', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(44, 'FARADILLA ROUDHOTUL SA\'NAA', '2241720205', '2241720205@student.polinema.ac.id', NULL, '$2y$12$8w3t/kiR8sqKa2Iz6F3RCe/UHTY92ge6Mz7r/RV/h3Ymc8RvO7UOC', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(45, 'FARID FITRIANSAH ALFARIZI', '2241720055', '2241720055@student.polinema.ac.id', NULL, '$2y$12$KssB6JmzVULGtaioiqgxbOP1bXNQPI5TCcUe0PezF2EWkBQjOgYtC', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(46, 'LUKMAN EKA SEPTIAWAN', '2241720049', '2241720049@student.polinema.ac.id', NULL, '$2y$12$QGiSp6TrG0p8o1p0L2xVg.jyrYhLu4uDubttW1e2JADenu69xm4By', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(47, 'MOCH. REYNALD SILVA BAKTIAR', '2241720203', '2241720203@student.polinema.ac.id', NULL, '$2y$12$p3jRfvkeMu32AihwqH.BeuXFearm.PrJAXmxWvqnK97mZqQGGJqgW', NULL, '2025-05-20 00:25:27', '2025-05-20 00:25:27', NULL, NULL),
(48, 'MUHAMMAD BAGUS INDRAWAN', '2241720217', '2241720217@student.polinema.ac.id', NULL, '$2y$12$PIM8s7HAysJM2sJxh7CaX.T6yiVZ61F4MqwvRBQUdODKJZ7dQLjnq', NULL, '2025-05-20 00:25:28', '2025-05-20 00:25:28', NULL, NULL),
(49, 'MUHAMMAD PAKSI SATRIO BAYU DHIYAUL HAQ', '2241720150', '2241720150@student.polinema.ac.id', NULL, '$2y$12$tNr/126ufQlM0OxVeq7BnOA3u/ENtHP2Do78SFxw1BHe95przukwO', NULL, '2025-05-20 00:25:28', '2025-05-20 00:25:28', NULL, NULL),
(50, 'MULKI HAKIM', '2241720131', '2241720131@student.polinema.ac.id', NULL, '$2y$12$spOxhKmqoaZK6l3vwAFbcuKPFlGMqv2N5CmfIbTQmw5mhWKeodB46', NULL, '2025-05-20 00:25:28', '2025-05-20 00:25:28', NULL, NULL),
(51, 'RENDY PUTRA KUSUMA', '2241720124', '2241720124@student.polinema.ac.id', NULL, '$2y$12$x55vQZ9qg4K8pqiGnn8JTu9uHcUU3Pg.cv5jKqZWAu20o4SFGsLBy', NULL, '2025-05-20 00:25:28', '2025-05-20 00:25:28', NULL, NULL),
(52, 'RICKY PUTRA PRATAMA TEDJO', '2241720204', '2241720204@student.polinema.ac.id', NULL, '$2y$12$vxGkKqcMMDqNgq1YvgiVdOLoKVB5VkSOsJB0oBzVko.IFC9K2T/AK', NULL, '2025-05-20 00:25:28', '2025-05-20 00:25:28', NULL, NULL),
(53, 'RIFKI FAKHRUDIN', '2241720218', '2241720218@student.polinema.ac.id', NULL, '$2y$12$r3/Jl958n5pMIHoNTTXkguQcCxmaFDAp9wkwMJYDkHl9Rl6SRwGWm', NULL, '2025-05-20 00:25:29', '2025-05-20 00:25:29', NULL, NULL),
(54, 'SATRIA ABRAR SAMBARANA WIRA PRATAMA', '2241720260', '2241720260@student.polinema.ac.id', NULL, '$2y$12$bBuhqbHjBHjjmWNUtSnZE.D0i6Pth1DgBABMjg4X4OLQ6r3rEAzGa', NULL, '2025-05-20 00:25:29', '2025-05-20 00:25:29', NULL, NULL),
(55, 'YOGIANNA NUR FEBRIANTI', '2241720261', '2241720261@student.polinema.ac.id', NULL, '$2y$12$MFfoPLIWcyh1KpGZ9nGrGeOPLUeBW.2Kr0/BLJmG0oY1D6cfFphq6', NULL, '2025-05-20 00:25:29', '2025-05-20 00:25:29', NULL, NULL),
(56, 'YONATAN EFRASSETYO', '2241720063', '2241720063@student.polinema.ac.id', NULL, '$2y$12$ePz2dVj/iEqgCSR25HwezulQDki99tSPqXpfHRnS9wFCSbZapBNE2', NULL, '2025-05-20 00:25:29', '2025-05-20 00:25:29', NULL, NULL),
(57, 'ACHMAD MAULANA HAMZAH', '2341720172', '2341720172@student.polinema.ac.id', NULL, '$2y$12$J4.4n4QqSHtrZbZ7mTXGHeMDmYdmu7je4/BrznYFgFBOZKp64e.mq', NULL, '2025-05-20 00:25:29', '2025-05-20 00:25:29', NULL, NULL),
(58, 'ALVANZA SAPUTRA YUDHA', '2341720182', '2341720182@student.polinema.ac.id', NULL, '$2y$12$mlffEwH/ZxPBaRZ0nEja5eVlCArCkF8hnII7OyaQ59I8ZCUjZPIc6', NULL, '2025-05-20 00:25:30', '2025-05-20 00:25:30', NULL, NULL),
(59, 'ANYA CALLISSTA CHRISWANTARI', '2341720234', '2341720234@student.polinema.ac.id', NULL, '$2y$12$ER9m4/km/Qaogbv4AhTDYuF3Gz7YUNbO.or5t/39q9r4jzIYKbzey', NULL, '2025-05-20 00:25:30', '2025-05-20 00:25:30', NULL, NULL),
(60, 'BERYL FUNKY MUBAROK', '2341720256', '2341720256@student.polinema.ac.id', NULL, '$2y$12$yZB0b.5/omuk.SYHs96j/u75QRV1Bb8NiryhI.635OYhVsVfRdcYm', NULL, '2025-05-20 00:25:30', '2025-05-20 00:25:30', NULL, NULL),
(61, 'CANDRA AHMAD DANI', '2341720187', '2341720187@student.polinema.ac.id', NULL, '$2y$12$.dgqwLwFJdbKsQJPfTBMFOylKX1TGa4FH/KyZkMVo/cFRopr/SBYy', NULL, '2025-05-20 00:25:30', '2025-05-20 00:25:30', NULL, NULL),
(62, 'CINDY LAILI LARASATI', '2341720038', '2341720038@student.polinema.ac.id', NULL, '$2y$12$2eUIT2JqKGMVQgvBjbCxieTIQfyB9/YNCP/VSZK90SK07Fmg7c/cK', NULL, '2025-05-20 00:25:30', '2025-05-20 00:25:30', NULL, NULL),
(63, 'DIKA ARIE ARRIFKY', '2341720232', '2341720232@student.polinema.ac.id', NULL, '$2y$12$gARVClsiXvYoavv2hCH7Q.frx5Gfgc9sZC2cCEtH1b8X2rshTRnhy', NULL, '2025-05-20 00:25:31', '2025-05-20 00:25:31', NULL, NULL),
(64, 'FAHMI YAHYA', '2341720089', '2341720089@student.polinema.ac.id', NULL, '$2y$12$kgn/EIodithchyoANO3Kg.yrg1I7ttUhTelqF572AgYS164VXVHg2', NULL, '2025-05-20 00:25:31', '2025-05-20 00:25:31', NULL, NULL),
(65, 'GILANG PURNOMO', '2341720042', '2341720042@student.polinema.ac.id', NULL, '$2y$12$MwLA9ZeVVbVYzF5A8eRDtOQUdkl5tjoAYZp2ZbyOS7ruKDkB2Tudm', NULL, '2025-05-20 00:25:31', '2025-05-20 00:25:31', NULL, NULL),
(66, 'GWIDO PUTRA WIJAYA', '2341720103', '2341720103@student.polinema.ac.id', NULL, '$2y$12$1wlTa6VTM2Y7lsFjSGjM7.reSc3TGB00/WvIqvaXv0.jmcDHZQCRK', NULL, '2025-05-20 00:25:31', '2025-05-20 00:25:31', NULL, NULL),
(67, 'HIDAYAT WIDI SAPUTRA', '2341720157', '2341720157@student.polinema.ac.id', NULL, '$2y$12$BW0Wmm2/9a9riVu41XTh9usVu150so83mvkvAhnH7jNxov7bE1Atq', NULL, '2025-05-20 00:25:31', '2025-05-20 00:25:31', NULL, NULL),
(68, 'ILHAM FATURACHMAN', '244107023001', '244107023001@student.polinema.ac.id', NULL, '$2y$12$tbpRpNnfesTnziekrtowpeD7F4sI.dSw.RMC4DCnKZoMo9QHKP0Na', NULL, '2025-05-20 00:25:32', '2025-05-20 00:25:32', NULL, NULL),
(69, 'INNAMA MAESA PUTRI', '2341720235', '2341720235@student.polinema.ac.id', NULL, '$2y$12$h0NZ5J4/x9mfTrPS7ds8PexJqAVfc8Lw4bkRe6gvY9qSWB5su9UrO', NULL, '2025-05-20 00:25:32', '2025-05-20 00:25:32', NULL, NULL),
(70, 'JIHA RAMDHAN', '2341720043', '2341720043@student.polinema.ac.id', NULL, '$2y$12$VNoivejHhvKsqR27iWiWMua13OdWzdU4OFqWNVsaADR1hng4T1jQu', NULL, '2025-05-20 00:25:32', '2025-05-20 00:25:32', NULL, NULL),
(71, 'LELYTA MEYDA AYU BUDIYANTI', '2341720124', '2341720124@student.polinema.ac.id', NULL, '$2y$12$Toh5yLjdS6wLk5T8Xy5qt.t.zG9v.fO/FImtnVgTjD1dhFfETT1kC', NULL, '2025-05-20 00:25:32', '2025-05-20 00:25:32', NULL, NULL),
(72, 'M. FATIH AL GHIFARY', '2341720194', '2341720194@student.polinema.ac.id', NULL, '$2y$12$OFSJNfbPRyYB9PKF3W1PteXNDI2tBf.7YlWYqm1ImfPMqjDUYEUBe', NULL, '2025-05-20 00:25:33', '2025-05-20 00:25:33', NULL, NULL),
(73, 'M. FIRMANSYAH', '2341720099', '2341720099@student.polinema.ac.id', NULL, '$2y$12$NYT6PvJR1IC.SzmSmloCj.xR91j1CI4aJRLoymTpC4VWAxSm7zkFW', NULL, '2025-05-20 00:25:33', '2025-05-20 00:25:33', NULL, NULL),
(74, 'MOCH. ALFIN BURHANUDIN ALQODRI', '2341720024', '2341720024@student.polinema.ac.id', NULL, '$2y$12$S7U45Ut/Q3SJ7N3h3pB8w.j30o98M2QtqTYA279SPnS.5R1MNKw1.', NULL, '2025-05-20 00:25:33', '2025-05-20 00:25:33', NULL, NULL),
(75, 'MUHAMAD SYAIFULLAH', '2341720013', '2341720013@student.polinema.ac.id', NULL, '$2y$12$7I5Jl8GT4xZHTW8PlpNov./dh18p2w5gGpuJgXcxyb7hKmsfHZtXm', NULL, '2025-05-20 00:25:33', '2025-05-20 00:25:33', NULL, NULL),
(76, 'MUHAMMAD NUR AZIZ', '2341720237', '2341720237@student.polinema.ac.id', NULL, '$2y$12$uXuLqiaB4j.z.T2R4yhNpuma9W9h.bVjHrYJpxkdPyIFc/KijhrR.', NULL, '2025-05-20 00:25:33', '2025-05-20 00:25:33', NULL, NULL),
(77, 'NAJWA ALYA NURIZZAH', '2341720230', '2341720230@student.polinema.ac.id', NULL, '$2y$12$SmLQ6eZ8zm2O2EWRJIXc5O8983DFit8u.Tcm24coqFMQ0okkmnsge', NULL, '2025-05-20 00:25:34', '2025-05-20 00:25:34', NULL, NULL),
(78, 'NECHA SYIFA SYAFITRI', '2341720167', '2341720167@student.polinema.ac.id', NULL, '$2y$12$lcwoge0YleuE1BNN1I35luB8uJIiwL/7G2DG5Lbkf0TnyqXzo2k/q', NULL, '2025-05-20 00:25:34', '2025-05-20 00:25:34', NULL, NULL),
(79, 'NOKLENT FARDIAN ERIX', '2341720082', '2341720082@student.polinema.ac.id', NULL, '$2y$12$j1UBFqul/6syNU873ntnfO1P/spjmUDxORfUVBq6LoZb7LPZdbekW', NULL, '2025-05-20 00:25:34', '2025-05-20 00:25:34', NULL, NULL),
(80, 'OCTRIAN ADILUHUNG TITO PUTRA', '2341720078', '2341720078@student.polinema.ac.id', NULL, '$2y$12$Wx1i6ma/s2a3VRyBUhE93ezZnUjjolh6AbuK529pQsjVDn9I.gVlO', NULL, '2025-05-20 00:25:34', '2025-05-20 00:25:34', NULL, NULL),
(81, 'SATRIO AHMAD RAMADHANI', '2341720163', '2341720163@student.polinema.ac.id', NULL, '$2y$12$wnn7/7Tuiw95Tkkj9FIszOsz909QwA1PDZW.sN/eOMY/pKCX3xpmu', NULL, '2025-05-20 00:25:34', '2025-05-20 00:25:34', NULL, NULL),
(82, 'SESY TANA LINA RAHMATIN', '2341720029', '2341720029@student.polinema.ac.id', NULL, '$2y$12$XAMPLMhDUivlemJUWJkVE.Yzsp0IDcme3lNMyw2h/hED4lUt2vJq6', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(83, 'TAUFIK DIMAS EDYSTARA', '2341720062', '2341720062@student.polinema.ac.id', NULL, '$2y$12$onBeGraCwQSTCKRex63trOC3piVg3JXwD7ef6mTPUARw8o1VlVupS', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(84, 'VINCENTIUS LEONANDA PRABOWO', '2341720149', '2341720149@student.polinema.ac.id', NULL, '$2y$12$jqSzQiJT.gEON1uyse/p.er5OhEREEUjlSH36JvaQWq87cbfCmBmS', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(85, 'YANUAR RIZKI AMINUDIN', '2341720030', '2341720030@student.polinema.ac.id', NULL, '$2y$12$KTzc1pZ5xOeZBHO10oUuuuGXJC22PH3KIqtq6tzLGHBpxGoUOg1Uq', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(86, 'ABDUL GHOFUR ALMIQBADI', '244107020155', '244107020155@student.polinema.ac.id', NULL, '$2y$12$b8B1fh3pwOn9ilkBcyglte3Y8woY0O2ctVH3S0sk.ZKh8oUf5qTpy', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(87, 'ABDUL RAHMAN HANIF DARMAWAN', '244107020232', '244107020232@student.polinema.ac.id', NULL, '$2y$12$qM3DO8MvyOF6i25/CSBlduWBsauLR9/PiJ52Ei9rvvqCbJuQVtdui', NULL, '2025-05-20 00:25:35', '2025-05-20 00:25:35', NULL, NULL),
(88, 'ACHMAD NABIL AFGAREZA', '244107020001', '244107020001@student.polinema.ac.id', NULL, '$2y$12$zMilZEPkgaBZrqXQBanwZuwnmPJi/5qNS1SSOfXJElz30k4G2tlzi', NULL, '2025-05-20 00:25:36', '2025-05-20 00:25:36', NULL, NULL),
(89, 'ALFREDA DHAIFULLAH MAHEZWARA', '244107020219', '244107020219@student.polinema.ac.id', NULL, '$2y$12$at0g9xizFmrHrAYxuVTMTezOMPK2hrGkrsc5RwViXFjx4YTpsttpm', NULL, '2025-05-20 00:25:36', '2025-05-20 00:25:36', NULL, NULL),
(90, 'AMIN AZIZ SUDJUD', '244107020079', '244107020079@student.polinema.ac.id', NULL, '$2y$12$DbMxRKEJ9UGXdgWB5b19b.LHa26V6CWby6X5UsMiNHgHnmDGpkEI.', NULL, '2025-05-20 00:25:36', '2025-05-20 00:25:36', NULL, NULL),
(91, 'ARJUNA SATRIA HUTAMA', '244107020158', '244107020158@student.polinema.ac.id', NULL, '$2y$12$5uyKYLPSpaqFtHB4bgk1h.ZcS6ixrnJVf3nCm0rt/Zcz./3CD8ILO', NULL, '2025-05-20 00:25:36', '2025-05-20 00:25:36', NULL, NULL),
(92, 'ARYA BAYU SAMODRA', '244107020162', '244107020162@student.polinema.ac.id', NULL, '$2y$12$FTeUaxHdCbDB8hBTYtQc8.MQI2d1D/DYarjum0Jy.iI66llKfXa6u', NULL, '2025-05-20 00:25:37', '2025-05-20 00:25:37', NULL, NULL),
(93, 'ARYAN ZUDA FIRDAUS', '244107020060', '244107020060@student.polinema.ac.id', NULL, '$2y$12$0RXYOONE4R3CAP5hLVw08ebrwUsjBFAKz2fuUzgMey22tY8oYwQ1G', NULL, '2025-05-20 00:25:37', '2025-05-20 00:25:37', NULL, NULL),
(94, 'ASMAUL RIZWAN', '2341720014', '2341720014@student.polinema.ac.id', NULL, '$2y$12$M2Ft98gi8yj/LQsMEaZYBO8EH.krr89X06v75EfatXGpWvzzvjBPi', NULL, '2025-05-20 00:25:37', '2025-05-20 00:25:37', NULL, NULL),
(95, 'DIFA NAYA SARI PASHA', '244107020213', '244107020213@student.polinema.ac.id', NULL, '$2y$12$bRFQVNi4Pe/DBnZhZa3w4uxOoSw60wRjFLnhfqMcJ8QGLJ/oq32Hi', NULL, '2025-05-20 00:25:37', '2025-05-20 00:25:37', NULL, NULL),
(96, 'DINA KUMALA SARI', '244107020072', '244107020072@student.polinema.ac.id', NULL, '$2y$12$NEGwFV5bFFmvcFdwMctT3OXdP0o4SW/TCHw7lOHhT7DgKzEzQkpC6', NULL, '2025-05-20 00:25:37', '2025-05-20 00:25:37', NULL, NULL),
(97, 'FAZEL PRIYONO', '244107020033', '244107020033@student.polinema.ac.id', NULL, '$2y$12$8FK4LKHnp/5ZLXBefjsBPeGkLmyGWxU6GLlE77xaqdPQQYNHIEU0K', NULL, '2025-05-20 00:25:38', '2025-05-20 00:25:38', NULL, NULL),
(98, 'FIKAR BAHRUL SANTOSO', '244107020160', '244107020160@student.polinema.ac.id', NULL, '$2y$12$r1945sBt7a091N7sRET.zeqU2WIfLVB9e5QK/EefqUwH3booL7PvO', NULL, '2025-05-20 00:25:38', '2025-05-20 00:25:38', NULL, NULL),
(99, 'ILHAM DHARMA ATMAJA', '244107020220', '244107020220@student.polinema.ac.id', NULL, '$2y$12$Hc6VUb7argRlcKJK.JjZBelLG1dag3X5r9SWjL/27OjQQhVIASZge', NULL, '2025-05-20 00:25:38', '2025-05-20 00:25:38', NULL, NULL),
(100, 'LINDA OCTAVIANI', '244107020002', '244107020002@student.polinema.ac.id', NULL, '$2y$12$QlA5HeMIJ9byTEfu.Jxsuu2DycnvkGi0hHoMww5RPQnEiT5775rfu', NULL, '2025-05-20 00:25:38', '2025-05-20 00:25:38', NULL, NULL),
(101, 'MOHAMMAD ARIQ BAIHAQI', '244107020161', '244107020161@student.polinema.ac.id', NULL, '$2y$12$Wt7s70l9haj7H8xnXjcf2e6DdgAhUFmdm7sx0BL2/rY.oV0PvnnPG', NULL, '2025-05-20 00:25:38', '2025-05-20 00:25:38', NULL, NULL),
(102, 'MUFLIHA HAFSYAH SHAHIEZA', '244107020147', '244107020147@student.polinema.ac.id', NULL, '$2y$12$GXHQ7hBlWsG4F1ftmXWaN.1akPXUUzpsAvA7pmBB06Sd/IaH8utJi', NULL, '2025-05-20 00:25:39', '2025-05-20 00:25:39', NULL, NULL),
(103, 'MUHAMMAD DWI FEBRIAN', '244107020081', '244107020081@student.polinema.ac.id', NULL, '$2y$12$0wzbQhOtwNyag4Gz30J6R.Xd1ND6QeETzquTADAza0kwkNmfaxsEO', NULL, '2025-05-20 00:25:39', '2025-05-20 00:25:39', NULL, NULL),
(104, 'MUHAMMAD NURIL HUDA', '244107020004', '244107020004@student.polinema.ac.id', NULL, '$2y$12$bpMrvPq.fw7EIkwPgrsdku9iaeMwwC362ePFMXxcDzBHIXypG2TCW', NULL, '2025-05-20 00:25:39', '2025-05-20 00:25:39', NULL, NULL),
(105, 'NURFINKA LAILASARI', '244107020211', '244107020211@student.polinema.ac.id', NULL, '$2y$12$Hxk5e9u2RoN8qBwHzzbOdejriQbARQDNidmEWboa0JXuqiuqWv56G', NULL, '2025-05-20 00:25:39', '2025-05-20 00:25:39', NULL, NULL),
(106, 'QRUZEETA PRASNA UMERI AL JAWY', '244107020084', '244107020084@student.polinema.ac.id', NULL, '$2y$12$3cjg5bg5.eo0ZLR4zYvaFOPcHqvfs/7ZRMNpuMSDkbS8.3QNb60cq', NULL, '2025-05-20 00:25:39', '2025-05-20 00:25:39', NULL, NULL),
(107, 'RAFAZL RADANA DIVA', '244107020082', '244107020082@student.polinema.ac.id', NULL, '$2y$12$chSzgytugapJ1auIN.SC3e43n4eedNkaPN4Pwp6dyk/g4gdNVCs2W', NULL, '2025-05-20 00:25:40', '2025-05-20 00:25:40', NULL, NULL),
(108, 'RAIHAN NUR PRATAMA', '244107020085', '244107020085@student.polinema.ac.id', NULL, '$2y$12$7ldfU0RsIwJ9ztAix5BJ.uOqlIv/uJv75uS36NX60WI4.G0QZsaEi', NULL, '2025-05-20 00:25:40', '2025-05-20 00:25:40', NULL, NULL),
(109, 'RAYA RABBANI ANANTA ARYASATYA', '244107020159', '244107020159@student.polinema.ac.id', NULL, '$2y$12$eNOotEivgtZQHw3lhDZn0.ZylSEnENKim0tWFw8oebl0sM0pbAMAG', NULL, '2025-05-20 00:25:40', '2025-05-20 00:25:40', NULL, NULL),
(110, 'RAYMON DEVTANT', '244107020009', '244107020009@student.polinema.ac.id', NULL, '$2y$12$JtwPk1wvFK7BViCDOiHkw.1hhUmcbLBEn.QLNehmmRCwkqx2ZrkQW', NULL, '2025-05-20 00:25:40', '2025-05-20 00:25:40', NULL, NULL),
(111, 'SILEYSA FAEDATUL NURAINI', '244107020231', '244107020231@student.polinema.ac.id', NULL, '$2y$12$jGk/c8s4fDUjA3LjpAKXbOv7Azii/cAR68PzBY3WQVU5kAemoB3U6', NULL, '2025-05-20 00:25:40', '2025-05-20 00:25:40', NULL, NULL),
(112, 'YULIKE DWI NURCAHYANI', '244107020146', '244107020146@student.polinema.ac.id', NULL, '$2y$12$OOC4AKOUsjDWC8YheG3IWuK1.tQ992zLlEYpUTY9CUBtea2Djepwy', NULL, '2025-05-20 00:25:41', '2025-05-20 00:25:41', NULL, NULL),
(113, 'ARSYA FIKRI SABILILLAH', '244107060121', '244107060121@student.polinema.ac.id', NULL, '$2y$12$bazqZMlPTF.ip2PyZ4fA7.Qn3PWsWgCLbR3ruT3figZzST1HZptzS', NULL, '2025-05-20 00:25:41', '2025-05-20 00:25:41', NULL, NULL),
(114, 'AZARIA AMANDA', '244107060060', '244107060060@student.polinema.ac.id', NULL, '$2y$12$mq06gYtUsvBCxRMfJ8s9NeUtQmBoKTDXCUaJ90zg93eZbKW2V5R/a', NULL, '2025-05-20 00:25:41', '2025-05-20 00:25:41', NULL, NULL),
(115, 'DESY DWI PUSPITA', '244107060145', '244107060145@student.polinema.ac.id', NULL, '$2y$12$mpjT./ePQivt9bVMK/04Suj1.H2z48AtC97/6x3IZpPl77brPloGW', NULL, '2025-05-20 00:25:41', '2025-05-20 00:25:41', NULL, NULL),
(116, 'FADHIL SYAHIDAN ARIZKI', '244107060125', '244107060125@student.polinema.ac.id', NULL, '$2y$12$5C8Jim4u3B.myXrkEMM5WOoonTo2V1zSeJrg1djDhkkpOtMxw/f/e', NULL, '2025-05-20 00:25:41', '2025-05-20 00:25:41', NULL, NULL),
(117, 'FATMA AZZAHRA ALIF HIDAYAH', '244107060046', '244107060046@student.polinema.ac.id', NULL, '$2y$12$cd6AhifusvjqLMlsOfUoB.3MHBgiiySzIfkiVYXZurv8bu8h4p.Zy', NULL, '2025-05-20 00:25:42', '2025-05-20 00:25:42', NULL, NULL),
(118, 'HAFIZ AHMAD ZAIM KUNTORO', '244107060103', '244107060103@student.polinema.ac.id', NULL, '$2y$12$MvxEqlSYhc/CVjTxLD7iAuxkO9pJgiswHR//XdtUrQiAYBg4rKrhW', NULL, '2025-05-20 00:25:42', '2025-05-20 00:25:42', NULL, NULL),
(119, 'MARIA SAVIRA', '244107060144', '244107060144@student.polinema.ac.id', NULL, '$2y$12$ucCK9Bz8WhuokCFDAEgZ1u4Dc0KJViuusJZ0E72BxJK0Y3iPN3vCC', NULL, '2025-05-20 00:25:42', '2025-05-20 00:25:42', NULL, NULL),
(120, 'MEUTIA ARAFAH HIDAYAT', '244107060078', '244107060078@student.polinema.ac.id', NULL, '$2y$12$OiTuFJScAiWHJUQwusyocuORes1zEMgCik7qoB5.HERyvZkwLdvze', NULL, '2025-05-20 00:25:42', '2025-05-20 00:25:42', NULL, NULL),
(121, 'MOCHAMMAD TANGGAQ DIRAT SAPUTRA', '244107060126', '244107060126@student.polinema.ac.id', NULL, '$2y$12$NVMUCpplXabr.85EK1.5/O5I8nHEO7Ello784pKiZQBAYK507fKta', NULL, '2025-05-20 00:25:42', '2025-05-20 00:25:42', NULL, NULL),
(122, 'MUHAMMAD ATABIK ZINKY', '244107060131', '244107060131@student.polinema.ac.id', NULL, '$2y$12$pMZBcKa6/BlQjrusy5azHuPb9nUnJhoGTcUhW.fNq.eh14C6XntRi', NULL, '2025-05-20 00:25:43', '2025-05-20 00:25:43', NULL, NULL),
(123, 'MUHAMMAD RIF\'AT SYAMLAN', '244107060150', '244107060150@student.polinema.ac.id', NULL, '$2y$12$q07iBFoo4s0xPa3C4ADcleU7u2iWp4pNODYCgfvN8.GPsCsWNcefS', NULL, '2025-05-20 00:25:43', '2025-05-20 00:25:43', NULL, NULL),
(124, 'NADIA MINATUL SALMA', '244107060141', '244107060141@student.polinema.ac.id', NULL, '$2y$12$1AeCbZ6Pgrc/35WnNm8kg.nRXNMgkR9EB.a4aEAUeCcqFTDwkaU0.', NULL, '2025-05-20 00:25:43', '2025-05-20 00:25:43', NULL, NULL),
(125, 'NAFISAH ALIYAH KHUMAINI', '244107060066', '244107060066@student.polinema.ac.id', NULL, '$2y$12$VNxG1lK.zO0DZ1yN/RITFuPXMAjWYmAzcgqc5GBqKvMw0QfTcAwXa', NULL, '2025-05-20 00:25:43', '2025-05-20 00:25:43', NULL, NULL),
(126, 'NANDA RICCO SATRIA INDRAWAN', '244107060058', '244107060058@student.polinema.ac.id', NULL, '$2y$12$xQRe/k3Bgcc6fOQs7rG8tu1JWXNo4v7jp6vApy8PgdaoFVb7x.Jkq', NULL, '2025-05-20 00:25:43', '2025-05-20 00:25:43', NULL, NULL),
(127, 'NAZWA AZAHRA AUDINA', '244107060146', '244107060146@student.polinema.ac.id', NULL, '$2y$12$x6Clgp0alvzzQkb3OgYjL.WiVGrCBC9GOpXTWHbNc1TBl4mtTFl.G', NULL, '2025-05-20 00:25:44', '2025-05-20 00:25:44', NULL, NULL),
(128, 'PRIMAYUNITA PUTRI AGUSTINE', '244107060094', '244107060094@student.polinema.ac.id', NULL, '$2y$12$AfGSd0F05wnzdzs1XgTmoewNAaAyrS5LbHcYOypEggMVKoM4u1mWy', NULL, '2025-05-20 00:25:44', '2025-05-20 00:25:44', NULL, NULL),
(129, 'RACHMAD ZAKI SETYAWAN', '244107060107', '244107060107@student.polinema.ac.id', NULL, '$2y$12$3jfaDZff/sxBx.N6v.b.rev1CRt85tufax7r/4C8K/3tAK6ribSFW', NULL, '2025-05-20 00:25:44', '2025-05-20 00:25:44', NULL, NULL),
(130, 'RIFAT DJIBRAN', '244107060138', '244107060138@student.polinema.ac.id', NULL, '$2y$12$A7oVYYArk1Tl9Imo/0oDlucvCk2np97PBC9iJKiAR007zvw3p.PlC', NULL, '2025-05-20 00:25:44', '2025-05-20 00:25:44', NULL, NULL),
(131, 'SABRINA IZZAH RAMADHANI', '244107060013', '244107060013@student.polinema.ac.id', NULL, '$2y$12$1PmKJNoIsrNGCResodgKFemKxq3VPN5GRWo8aif8Q/mSVmfkzyMv.', NULL, '2025-05-20 00:25:44', '2025-05-20 00:25:44', NULL, NULL),
(132, 'SASTRA MAHEVA ZAKY', '244107060116', '244107060116@student.polinema.ac.id', NULL, '$2y$12$zFsB3Bc8PZ6cd.BM/urlg.yb/iLm3zbc6kU6qKHMHH983eFTbOnPe', NULL, '2025-05-20 00:25:45', '2025-05-20 00:25:45', NULL, NULL),
(133, 'SOFIAH', '244107060065', '244107060065@student.polinema.ac.id', NULL, '$2y$12$N.jBl/wAmPtxTkTTWETaw.mCo46ECBe.XPBS2Vk/bbpuq2JBnB.Xq', NULL, '2025-05-20 00:25:45', '2025-05-20 00:25:45', NULL, NULL),
(134, 'TERSIQO ALFAREZEL', '244107060089', '244107060089@student.polinema.ac.id', NULL, '$2y$12$HVvv5PPsU17bxNZU5VGfbOQgrEN54o7s5JInZ0KIcpq7reEKxdmTm', NULL, '2025-05-20 00:25:45', '2025-05-20 00:25:45', NULL, NULL),
(135, 'TYFOSA HELGA WIJAYA', '244107060071', '244107060071@student.polinema.ac.id', NULL, '$2y$12$5EUHmYxLAlCc7f3yu06E9eqJ.4YP8.dkP55uAbwAlA54tyH3V7btm', NULL, '2025-05-20 00:25:45', '2025-05-20 00:25:45', NULL, NULL),
(136, 'ZASKIA MAULIDINA MUTIARA HATI', '244107060056', '244107060056@student.polinema.ac.id', NULL, '$2y$12$1zxafGrTEidY4mIH/xU94.XhL19HNF1vOO8NQ3MHFxlhsSJJ6teuG', NULL, '2025-05-20 00:25:45', '2025-05-20 00:25:45', NULL, NULL),
(137, 'ADITYA YUHANDA PUTRA', '2341760050', '2341760050@student.polinema.ac.id', NULL, '$2y$12$4LRgbPHj8z/9.p2w4FNwQeJNJjtR3gCZFFjj5j2GetgsK1eAW.zua', NULL, '2025-05-20 00:25:46', '2025-05-20 00:25:46', NULL, NULL),
(138, 'ALDO FEBRIANSYAH', '2341760146', '2341760146@student.polinema.ac.id', NULL, '$2y$12$wl3nPSu3QFHQyZrE3qjlJ.L.ekH8eyo9OY2aQ9BiKYbIxJkIep3Uy', NULL, '2025-05-20 00:25:46', '2025-05-20 00:25:46', NULL, NULL),
(139, 'ALDO KHRISNA WIJAYA', '2341760091', '2341760091@student.polinema.ac.id', NULL, '$2y$12$YkyrGHRB9XK7FpgrMKxCOu/ckEbmVPEabdqbQBnSHNB/DYcSMjZkW', NULL, '2025-05-20 00:25:46', '2025-05-20 00:25:46', NULL, NULL),
(140, 'AQILA NUR AZZA', '2341760022', '2341760022@student.polinema.ac.id', NULL, '$2y$12$Cn71tndS3EGXeA6POKL.PuTpq6oYx.ANsOD4ObgbhmpvQLfVj9XuC', NULL, '2025-05-20 00:25:46', '2025-05-20 00:25:46', NULL, NULL),
(141, 'ARIMBI PUTRI HAPSARI', '2341760016', '2341760016@student.polinema.ac.id', NULL, '$2y$12$.XFScXiHJVMkQYStBjSgE.CIXPmFZ/WImc8UE8GsR45nQw2eo/dZO', NULL, '2025-05-20 00:25:46', '2025-05-20 00:25:46', NULL, NULL),
(142, 'ATHALLAH AYUDYA PARAMESTI', '2341760061', '2341760061@student.polinema.ac.id', NULL, '$2y$12$OsZ6rys2nBVzn896FfS9UO9G1/USB0OwbQGn.qECxTGze8X3OzL3a', NULL, '2025-05-20 00:25:47', '2025-05-20 00:25:47', NULL, NULL),
(143, 'BAYU TRIWIBOWO', '2341760073', '2341760073@student.polinema.ac.id', NULL, '$2y$12$B1inswOCbs6wN7yu0otVo.o8TreQkFjzAnDKcWbeVOFb0Ij4mt3h.', NULL, '2025-05-20 00:25:47', '2025-05-20 00:25:47', NULL, NULL),
(144, 'CLAUDYA DESTINE JULIA HANDOKO', '2341760008', '2341760008@student.polinema.ac.id', NULL, '$2y$12$6hyaab97U9uaijg5Dlg7Bu7ll3kqkofpyCnlfeFM6UqUivRwmfzIm', NULL, '2025-05-20 00:25:47', '2025-05-20 00:25:47', NULL, NULL),
(145, 'DAHNIAR DAVINA', '2341760023', '2341760023@student.polinema.ac.id', NULL, '$2y$12$0DPAGpa5wuuvAz48Jfryr.jPnWba9S4Blnj98kt.CaM2CagGfD3Fu', NULL, '2025-05-20 00:25:47', '2025-05-20 00:25:47', NULL, NULL),
(146, 'DEVIN I\'ZAZ RADIN DEWANTORO', '2341760034', '2341760034@student.polinema.ac.id', NULL, '$2y$12$f6MtxKLqNitiqM7uoiW/feDFBXzYeienik9xfRdsl5cdcoDExTImW', NULL, '2025-05-20 00:25:47', '2025-05-20 00:25:47', NULL, NULL),
(147, 'DIAJENG SEKAR ARUM', '2341760070', '2341760070@student.polinema.ac.id', NULL, '$2y$12$LW8D6UfNm5t1CMeysqrL..1HeqbLqrDd2Y5L2Da1D8EmaAo1BxgC6', NULL, '2025-05-20 00:25:48', '2025-05-20 00:25:48', NULL, NULL),
(148, 'FAIZA ANATHASYA EKA FALEN', '2341760105', '2341760105@student.polinema.ac.id', NULL, '$2y$12$kv4IamfmmiXCBxEnkwqx4OFA8VilbfuZ0bjAGeJ.yNCGUYOTB1sh6', NULL, '2025-05-20 00:25:48', '2025-05-20 00:25:48', NULL, NULL),
(149, 'GEGAS ANUGRAH DERAJAT', '2341760140', '2341760140@student.polinema.ac.id', NULL, '$2y$12$h/9YldX58cxYST77rCdrju2whygPoTJsj.9DuVVNqfHB5XPik20Xa', NULL, '2025-05-20 00:25:48', '2025-05-20 00:25:48', NULL, NULL),
(150, 'HUSEIN FADHLULLAH', '2341760134', '2341760134@student.polinema.ac.id', NULL, '$2y$12$AdE5pWfblN0Ruae7sJrMdOLimfbBFbt35DLCIzGa53JG5UzRwrX6C', NULL, '2025-05-20 00:25:48', '2025-05-20 00:25:48', NULL, NULL),
(151, 'KANAYA ABDIELARAMADHANI HIDAYAT', '2341760118', '2341760118@student.polinema.ac.id', NULL, '$2y$12$XEqb37gCX6W/NFPBy5iMIOgF9vIwgcGTwC4rOnBZTms/RPvXejlk.', NULL, '2025-05-20 00:25:48', '2025-05-20 00:25:48', NULL, NULL),
(152, 'KARINA IKA INDASA', '2341760042', '2341760042@student.polinema.ac.id', NULL, '$2y$12$tx9RM//O2RUEVaFM7YvMl.9hWw6WRfLE6Z/daOy9do7lw2YH3I4Qy', NULL, '2025-05-20 00:25:49', '2025-05-20 00:25:49', NULL, NULL),
(153, 'KHUZAIMA FILLA JANUARTHA', '2341760078', '2341760078@student.polinema.ac.id', NULL, '$2y$12$UMh0UxE1dW7K0VgDO/G8b.GsGfggE4SvqJheJd0vwFlXMYCSq8wjO', NULL, '2025-05-20 00:25:49', '2025-05-20 00:25:49', NULL, NULL),
(154, 'LOUISE NAZAROSSA', '2341760117', '2341760117@student.polinema.ac.id', NULL, '$2y$12$mYmu0daRQRFYK.LY/oll9uK9.2XCfBYz0Du20maOfDcI2aBU9xQbe', NULL, '2025-05-20 00:25:49', '2025-05-20 00:25:49', NULL, NULL),
(155, 'LYRA FAIQAH BILQIS', '2341760013', '2341760013@student.polinema.ac.id', NULL, '$2y$12$0nUyMxEaaVhgkYhLarba2.RvF75tYixXTR1/rdI1vNUBqJVrJ.1x2', NULL, '2025-05-20 00:25:49', '2025-05-20 00:25:49', NULL, NULL),
(156, 'MOCHAMMAD AUDRIC ANDHIKA HIDAYATULLOH', '2341760094', '2341760094@student.polinema.ac.id', NULL, '$2y$12$0jQshaS3fZ80wnEyzmnmAuUCIMqFnkPFyj0Oe.QkzzIQewNgcr6uy', NULL, '2025-05-20 00:25:49', '2025-05-20 00:25:49', NULL, NULL),
(157, 'MUHAMMAD HAMDAN UBAIDILLAH', '2341760190', '2341760190@student.polinema.ac.id', NULL, '$2y$12$lxcpeN.GfAgEAtelsGhuGuLDcL9FWQG0KwcuBIVTkHSyx4CNPdbza', NULL, '2025-05-20 00:25:50', '2025-05-20 00:25:50', NULL, NULL),
(158, 'MUHAMMAD IRCHAM DAFFANSYAH ISMAIL', '2341760115', '2341760115@student.polinema.ac.id', NULL, '$2y$12$IIYmJ8o2uaxgclJ9z.atiufDGNwohLrZBgOpKjE0nEyF3g8wwCv76', NULL, '2025-05-20 00:25:50', '2025-05-20 00:25:50', NULL, NULL),
(159, 'MUHAMMAD REISHI FAUZI AUGURI', '2341760012', '2341760012@student.polinema.ac.id', NULL, '$2y$12$U98zXUF8UnTEgOeehlZUfO6kfqGOq5jwx8rKn.c3QNXbgKUyE9AWy', NULL, '2025-05-20 00:25:50', '2025-05-20 00:25:50', NULL, NULL),
(160, 'PAUDRA AKBAR BUANA', '2341760063', '2341760063@student.polinema.ac.id', NULL, '$2y$12$U09UaIRYkkivLv2DtymsWuJEN7OZF/jBp1dVBqXJ06.MG59UtCmVO', NULL, '2025-05-20 00:25:50', '2025-05-20 00:25:50', NULL, NULL),
(161, 'QUSNUL DIAH MAWANTI', '2341760035', '2341760035@student.polinema.ac.id', NULL, '$2y$12$22W2rxyUw6SRoFDN7pl7De8H4s1Ilc2C1kQLYUEKNU1fCDGEbp7EG', NULL, '2025-05-20 00:25:50', '2025-05-20 00:25:50', NULL, NULL),
(162, 'RAFIF TRI HARTANTO', '2241760038', '2241760038@student.polinema.ac.id', NULL, '$2y$12$UJp363Z5nARlvJ17YxWWC.X7t9oNPX1KktljD0AFla9O/RVtsIDtO', NULL, '2025-05-20 00:25:51', '2025-05-20 00:25:51', NULL, NULL),
(163, 'REZA ANGELINA FEBRIYANTI', '2341760015', '2341760015@student.polinema.ac.id', NULL, '$2y$12$hCAJGNY3F1dqKvpGmLC9/.nQDyRO2qX7rBd/RqJZpWZ7EKUGzaoRm', NULL, '2025-05-20 00:25:51', '2025-05-20 00:25:51', NULL, NULL),
(164, 'SATRIA RAKHMADANI', '2341760106', '2341760106@student.polinema.ac.id', NULL, '$2y$12$wO9Js9tDX4KWAjoAkPlDuOp/4y6g.z7PYsQqtEBtxyajPD.Z2kI7G', NULL, '2025-05-20 00:25:51', '2025-05-20 00:25:51', NULL, NULL),
(165, 'VITA EKA SARASWATI', '2341760082', '2341760082@student.polinema.ac.id', NULL, '$2y$12$25Oese0guwGzxIlLCkSIS.mVJrEMXlY8gc.qJG9Zm2gq54W80udPK', NULL, '2025-05-20 00:25:51', '2025-05-20 00:25:51', NULL, NULL),
(166, 'YONANDA MAYLA RUSDIATY', '2341760184', '2341760184@student.polinema.ac.id', NULL, '$2y$12$oSzUkvWPJceAk6GcaG.8KOch3ZsTVy2sQ4mLkjDidVBGMowpWI6d2', NULL, '2025-05-20 00:25:51', '2025-05-20 00:25:51', NULL, NULL),
(167, 'A. MUH. FAQIH FADILLAH GAU', '2241760124', '2241760124@student.polinema.ac.id', NULL, '$2y$12$wIsbo/.iy6lz99nsDqixKekkJd/qkl8zkDAuvsU4fhw8LoY/H/.PW', NULL, '2025-05-20 00:25:52', '2025-05-20 00:25:52', NULL, NULL),
(168, 'ADAM SAFRILA IRAWAN', '2241760058', '2241760058@student.polinema.ac.id', NULL, '$2y$12$.ROUDGGOdAyQFTX2a88LNeriIlHscVIS8u8qM3Kuo/rcC80nygIlq', NULL, '2025-05-20 00:25:52', '2025-05-20 00:25:52', NULL, NULL),
(169, 'AHMAD HIDAYAT PERMANA', '2241760087', '2241760087@student.polinema.ac.id', NULL, '$2y$12$LaQQCjCBlrYhNDpzsI.B4ey.M2eID9ZcgxqKYQb.O6kdidUb/4eZq', NULL, '2025-05-20 00:25:52', '2025-05-20 00:25:52', NULL, NULL),
(170, 'AHMAD MIMNA\'I FIDDIN', '2241760136', '2241760136@student.polinema.ac.id', NULL, '$2y$12$v8VLWsI1MrVuMSXoaavftenVYymgI.aLvYsUXw07R7Ppf2sFLmGyK', NULL, '2025-05-20 00:25:52', '2025-05-20 00:25:52', NULL, NULL),
(171, 'ANNISA PRISSILYA', '2241760099', '2241760099@student.polinema.ac.id', NULL, '$2y$12$T.9AdlppxwGJbMM8XD0nMeZ46FVj/yOPPMoUGfNrUswOEItUC8fdC', NULL, '2025-05-20 00:25:52', '2025-05-20 00:25:52', NULL, NULL),
(172, 'AURELIA NASYA LAKSMITHA WINDIONORA', '2241760084', '2241760084@student.polinema.ac.id', NULL, '$2y$12$FZbGAsmxcEZdGOnwm/1fx.bGeJdkUXv07kG/HDFEvsxwIW01lbepe', NULL, '2025-05-20 00:25:53', '2025-05-20 00:25:53', NULL, NULL),
(173, 'CARIESKA BERLIANA NOVITA KUSUMA WARDANI', '2241760027', '2241760027@student.polinema.ac.id', NULL, '$2y$12$R83/CfrrAniiJ7Fra8YWFO6ej9N6./hoX2pzDt/V/LNg0PbwCc6/i', NULL, '2025-05-20 00:25:53', '2025-05-20 00:25:53', NULL, NULL),
(174, 'CHIKAL NAZMI MAHIRA', '2241760122', '2241760122@student.polinema.ac.id', NULL, '$2y$12$LqzNm/s9si0OQf3OsN/RmuXmCV57XjcR1rUr7E3lh/zhDLVQFBPx2', NULL, '2025-05-20 00:25:53', '2025-05-20 00:25:53', NULL, NULL),
(175, 'FAHMI MARDIANSYAH', '2241760064', '2241760064@student.polinema.ac.id', NULL, '$2y$12$V1NvubZyjee5o4fgJCefnOtCGmKxRS7cmBQKGXCJQ9lm5eZk/2tgm', NULL, '2025-05-20 00:25:53', '2025-05-20 00:25:53', NULL, NULL),
(176, 'FAIQ RAMZY NABIGHAH', '2241760024', '2241760024@student.polinema.ac.id', NULL, '$2y$12$wltI1JeiNa5yul0wpJSeAeSYRtzvbevipz5HcK8jUgKcrE8nN/os6', NULL, '2025-05-20 00:25:53', '2025-05-20 00:25:53', NULL, NULL),
(177, 'GHANIYU ILMI SAPUTRA', '2241760132', '2241760132@student.polinema.ac.id', NULL, '$2y$12$UP7gYacsuQhNlEB4pUBVu.3kFdRpUMeLkCaaaHBP.fgCE1x1f4GjK', NULL, '2025-05-20 00:25:54', '2025-05-20 00:25:54', NULL, NULL),
(178, 'INGGA CHINTIA SARI', '2241760018', '2241760018@student.polinema.ac.id', NULL, '$2y$12$lq1IhtqltPjkpTM4IqXfEusV7T5YQ9CWSp3OputC29hWeF80Crg6i', NULL, '2025-05-20 00:25:54', '2025-05-20 00:25:54', NULL, NULL),
(179, 'KHARISMA ETANA FEBRIANTO', '2241760009', '2241760009@student.polinema.ac.id', NULL, '$2y$12$pYpE2Xp3.rHoYD0tyw7FOe6YpND45Y6nscqU.37oTd0BY.5aP3HLq', NULL, '2025-05-20 00:25:54', '2025-05-20 00:25:54', NULL, NULL),
(180, 'KHOIRUL HIDAYAH', '2241760021', '2241760021@student.polinema.ac.id', NULL, '$2y$12$FO7zKeM26ah77edEzejlHeVDKXTJFcBTSBMqMVT.cnoEDODmANUQ6', NULL, '2025-05-20 00:25:54', '2025-05-20 00:25:54', NULL, NULL),
(181, 'MARITZA ULFA HURIYAH', '2241760119', '2241760119@student.polinema.ac.id', NULL, '$2y$12$ZpD49cnVuT6tXqKJ9mVqB.csovXIptdeAsZ0H79/lhYh5Z5bZmKc.', NULL, '2025-05-20 00:25:54', '2025-05-20 00:25:54', NULL, NULL),
(182, 'MOCHAMMAD ALFITO DIANOVA', '2241760106', '2241760106@student.polinema.ac.id', NULL, '$2y$12$JjLV1.I8fI/wcvk1hgy2C.V6kY3NC1JJsLco94Ab7zXgMYZwAZ9Ii', NULL, '2025-05-20 00:25:55', '2025-05-20 00:25:55', NULL, NULL),
(183, 'NASYWA SALMA SALSA BILA', '2241760140', '2241760140@student.polinema.ac.id', NULL, '$2y$12$NL8RgnlSbaLjNv7v9M0Aj.CcXu2vyngd/igXCZpCYnYHMa/jrOqKC', NULL, '2025-05-20 00:25:55', '2025-05-20 00:25:55', NULL, NULL),
(184, 'NASYWA SYAFINKA WIDYAMARA', '2241760002', '2241760002@student.polinema.ac.id', NULL, '$2y$12$xoWoD/Bf/crkM1DiueWatOzzgM4V8XHpoqBZm3fupgDt.IWlYiUWm', NULL, '2025-05-20 00:25:55', '2025-05-20 00:25:55', NULL, NULL),
(185, 'REZA KURNIAWAN', '2241760059', '2241760059@student.polinema.ac.id', NULL, '$2y$12$70PT3WJSGfMDTjcqQnsBHeSdMGiluOULJMw9nB8pU5XhaEka1Fhty', NULL, '2025-05-20 00:25:55', '2025-05-20 00:25:55', NULL, NULL),
(186, 'SYFFA FIRDAUSYAH HANI PUTRA', '2241760005', '2241760005@student.polinema.ac.id', NULL, '$2y$12$UZNUZcaheMgSupXvDXkSaeUzdHDNo8/i.7YkWlsqGMMeIH0CPuGJq', NULL, '2025-05-20 00:25:55', '2025-05-20 00:25:55', NULL, NULL),
(187, 'TAUFIQ SATRIAJI ARIYA PUTRA RIYADI', '2241760142', '2241760142@student.polinema.ac.id', NULL, '$2y$12$bhRUCGtaqfVFKJkK2/LrUe/waDzmC6Stq0DVM5TJaiiSipG2KF.pi', NULL, '2025-05-20 00:25:56', '2025-05-20 00:25:56', NULL, NULL),
(188, 'ZULFA ULINNUHA AZAZI', '2241760131', '2241760131@student.polinema.ac.id', NULL, '$2y$12$4OZsPcPjYLk5aoYhvsDIm.l.oMhjTuLV1iTDJ/HY/GQgzYRFdz8Rm', NULL, '2025-05-20 00:25:56', '2025-05-20 00:25:56', NULL, NULL),
(189, 'ACHMAD CHAIDAR ISMAIL', '2141762102', '2141762102@student.polinema.ac.id', NULL, '$2y$12$Ig8ARdKjPbdsvcokAFtLTOnPWcXY6Rzkff7WJzJsmIUafWhVPTOMO', NULL, '2025-05-20 00:25:56', '2025-05-20 00:25:56', NULL, NULL),
(190, 'ACHMAD NOVA ARDIANSYAH', '2141764160', '2141764160@student.polinema.ac.id', NULL, '$2y$12$lWPkZBlEakZiz7aZGFATaOHT6Teijzg6KnBiKObClI8NZ5AbpkMBS', NULL, '2025-05-20 00:25:56', '2025-05-20 00:25:56', NULL, NULL),
(191, 'ACHMAD SAVERO WINDI PRADANA', '2141762135', '2141762135@student.polinema.ac.id', NULL, '$2y$12$wpZ3bYnaSohzZdhMv4wgZO3ZzNirVPYjuSImIXQ9bh48pWp8yVAdG', NULL, '2025-05-20 00:25:56', '2025-05-20 00:25:56', NULL, NULL),
(192, 'ADESTA ANY FITRIANI', '2141762063', '2141762063@student.polinema.ac.id', NULL, '$2y$12$5i0DwIIH.kYQdX34GaxXHe6NDZ8MXHWwVqNTVHy.X0K5SNk5j94ba', NULL, '2025-05-20 00:25:57', '2025-05-20 00:25:57', NULL, NULL),
(193, 'ARYA WILDHANI PUTRA', '2141762093', '2141762093@student.polinema.ac.id', NULL, '$2y$12$8RlV4AJEzblwXGWP1C56aesQnbeAf95nRIvC/Xra3Q4CdHazH650O', NULL, '2025-05-20 00:25:57', '2025-05-20 00:25:57', NULL, NULL),
(194, 'ASHRAF NAWAF', '2141762090', '2141762090@student.polinema.ac.id', NULL, '$2y$12$sWe9cFyugTB560xF.o80UujZvCSueXO3WJoesu0u4qydbTNCf.qOu', NULL, '2025-05-20 00:25:57', '2025-05-20 00:25:57', NULL, NULL),
(195, 'AZIZAH PUTRI DIKMARA', '2141762017', '2141762017@student.polinema.ac.id', NULL, '$2y$12$K7zUqE.dQ0Qastux0AB27./SksOhu32T.Im7.a8WmufpTtf.b0huu', NULL, '2025-05-20 00:25:57', '2025-05-20 00:25:57', NULL, NULL),
(196, 'BAGUS NURCAHYO', '2141762120', '2141762120@student.polinema.ac.id', NULL, '$2y$12$1ZjAkoAE8FGACYnbzx3LtexdsZwvqf.HwgCmDROOuaxDCHDhzNcbC', NULL, '2025-05-20 00:25:57', '2025-05-20 00:25:57', NULL, NULL),
(197, 'BANGKIT MAULANA CANIAGO', '2141762143', '2141762143@student.polinema.ac.id', NULL, '$2y$12$i/4tNAef3rSzNZuk4YZO4.PrJbH7S4hplGKKTDerCoEEQsqeip/J6', NULL, '2025-05-20 00:25:58', '2025-05-20 00:25:58', NULL, NULL),
(198, 'CLAURIA DWI PUTRI NABILLAH', '2141762029', '2141762029@student.polinema.ac.id', NULL, '$2y$12$GbTaRiQEJyBR0IM.IQaJuOggBWDpoECYllNhUfUSAo3qizmffttcS', NULL, '2025-05-20 00:25:58', '2025-05-20 00:25:58', NULL, NULL),
(199, 'DELINDA CANDRAWATI EKA PUTRI', '2141762026', '2141762026@student.polinema.ac.id', NULL, '$2y$12$5bWikJVXM1USaTDmQuY9hOGj0MoTC4/k1B19ZxryRLMDCFWAQnQ/2', NULL, '2025-05-20 00:25:58', '2025-05-20 00:25:58', NULL, NULL),
(200, 'EREEN LOURENZA NATALIA MAMAHI', '2141762044', '2141762044@student.polinema.ac.id', NULL, '$2y$12$XZbKoVh2Tv2tlFBTzoelGOc/Q6cbPi2ipCU9VEWKtLW6uOnEcDBQG', NULL, '2025-05-20 00:25:58', '2025-05-20 00:25:58', NULL, NULL),
(201, 'FARHAN ASYAM ALFITRA', '2141762138', '2141762138@student.polinema.ac.id', NULL, '$2y$12$R7o5O374GwyoUOM7s5/4ee7jIi8hUWJaecLoCclpJKovfbKGTftJ6', NULL, '2025-05-20 00:25:58', '2025-05-20 00:25:58', NULL, NULL),
(202, 'FAUZAN ZULFA RAMADHAN', '2141762074', '2141762074@student.polinema.ac.id', NULL, '$2y$12$htZ51Cl2TzUiMWC/Jl8CPuf6j2JFYN64DZBtU0y/Rty7GaQlWoPSu', NULL, '2025-05-20 00:25:59', '2025-05-20 00:25:59', NULL, NULL),
(203, 'INDAH RETNO IRIANI', '2141762104', '2141762104@student.polinema.ac.id', NULL, '$2y$12$ivCmE9lZWalBqtMn53TXRuHVI4yPUUYoPhAYsA6okGFrPDTXTlyW2', NULL, '2025-05-20 00:25:59', '2025-05-20 00:25:59', NULL, NULL),
(204, 'INDIRA IRAWATI PUTRI', '2141762022', '2141762022@student.polinema.ac.id', NULL, '$2y$12$TdU7js.rjIxBSJqEmBsQkeKH5SLH7AE/QuLkd1xZaC2pTIDmwEJwq', NULL, '2025-05-20 00:25:59', '2025-05-20 00:25:59', NULL, NULL),
(205, 'LAITA ZIDAN', '2141762100', '2141762100@student.polinema.ac.id', NULL, '$2y$12$S1TqjhJ4t3JBsozRyp0a7et251Jw8lNnIdxO/dc8WZDim5WBloHtG', NULL, '2025-05-20 00:25:59', '2025-05-20 00:25:59', NULL, NULL),
(206, 'MUKHAMAD YUSA GALANG FIRMANSYAH', '2141762105', '2141762105@student.polinema.ac.id', NULL, '$2y$12$pR9Sun3PTyilORXtJTsqCeEBMIWIgHFC12O3MyryBENAm/eX2KX8O', NULL, '2025-05-20 00:25:59', '2025-05-20 00:25:59', NULL, NULL),
(207, 'NADILLA AMANDA MARTHA AFRHISSA', '2141762050', '2141762050@student.polinema.ac.id', NULL, '$2y$12$Bb3vg7AFrVL.rMk1xW05nupeK5iFuIUbv1hV2e3pUEExe9WsQEL2.', NULL, '2025-05-20 00:26:00', '2025-05-20 00:26:00', NULL, NULL),
(208, 'NASSWA MAURA SYAWALIA', '2141762027', '2141762027@student.polinema.ac.id', NULL, '$2y$12$iIvbd9a9v76AFGCb74WI5e0I3xuxtB2klxq9YRPJKYYwW7A3UHPh2', NULL, '2025-05-20 00:26:00', '2025-05-20 00:26:00', NULL, NULL),
(209, 'NIKEN MAHARANI PERMATA', '2141762006', '2141762006@student.polinema.ac.id', NULL, '$2y$12$4z1qNwq9tRn99lPHJiHRSOH9BdHyGO8rRzoGdYTtuCap2baSn4LmO', NULL, '2025-05-20 00:26:00', '2025-05-20 00:26:00', NULL, NULL),
(210, 'OKTAVIANINDA KUSUMADEWI', '2141762131', '2141762131@student.polinema.ac.id', NULL, '$2y$12$c5aKSwxEh0hHnPiNg6v7ielm7vGt2.nnqyE7/Be5F1HQCU8B1KUji', NULL, '2025-05-20 00:26:00', '2025-05-20 00:26:00', NULL, NULL),
(211, 'RIVALDITO ILHAM PRATAMA', '2141762146', '2141762146@student.polinema.ac.id', NULL, '$2y$12$hScz9KsTBjIVzdxLiiBV8u3uXR.xkVqclxR8CiEeaxr3YOLWaNoku', NULL, '2025-05-20 00:26:01', '2025-05-20 00:26:01', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculties_university_branch_id_foreign` (`university_branch_id`);

--
-- Indeks untuk tabel `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khs_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolios_kategori_id_foreign` (`kategori_id`),
  ADD KEY `portfolios_user_id_foreign` (`user_id`),
  ADD KEY `portfolios_verified_by_foreign` (`verified_by`);

--
-- Indeks untuk tabel `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodis_faculty_id_foreign` (`faculty_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `university_branches`
--
ALTER TABLE `university_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nim_nip_unique` (`nim_nip`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT untuk tabel `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `khs`
--
ALTER TABLE `khs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `university_branches`
--
ALTER TABLE `university_branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `faculties`
--
ALTER TABLE `faculties`
  ADD CONSTRAINT `faculties_university_branch_id_foreign` FOREIGN KEY (`university_branch_id`) REFERENCES `university_branches` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolios_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `prodis`
--
ALTER TABLE `prodis`
  ADD CONSTRAINT `prodis_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
