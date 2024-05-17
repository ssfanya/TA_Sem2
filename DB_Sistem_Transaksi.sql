-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Bulan Mei 2024 pada 06.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_transaksi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_pesanan`
--

CREATE TABLE `daftar_pesanan` (
  `No_Transaksi` int(15) NOT NULL,
  `Nama_Customer` varchar(255) NOT NULL,
  `No_Telepon` varchar(15) NOT NULL,
  `Tanggal_Penerimaan` date NOT NULL,
  `Status_Pesanan` enum('Edit','Dibatalkan','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar_pesanan`
--

INSERT INTO `daftar_pesanan` (`No_Transaksi`, `Nama_Customer`, `No_Telepon`, `Tanggal_Penerimaan`, `Status_Pesanan`) VALUES
(1, 'John Doe', '081234567890', '2024-04-01', 'Selesai'),
(2, 'Jane Smith', '081298765432', '2024-04-02', 'Selesai'),
(3, 'David Johnson', '081276543210', '2024-04-03', 'Selesai'),
(5, 'Michael Brown', '081298765433', '2024-04-05', 'Selesai'),
(6, 'Emily Davis', '081276543211', '2024-04-06', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_produk`
--

CREATE TABLE `data_produk` (
  `Kode_Pesanan` varchar(255) NOT NULL,
  `Nama_Pesanan` varchar(255) NOT NULL,
  `Harga_Satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_produk`
--

INSERT INTO `data_produk` (`Kode_Pesanan`, `Nama_Pesanan`, `Harga_Satuan`) VALUES
('A1', 'Appo Kacang', 45000),
('A2', 'Appo Mix', 45000),
('B1', 'Banana Cookies', 45000),
('B2', 'BLack and White', 45000),
('B3', 'Blue Berry Cookies', 45000),
('B4', 'Brownies Cookies', 45000),
('B5', 'Brownies Mesis', 45000),
('B6', 'Brownies Pandan', 45000),
('C1', 'Coklat Almond Keju', 45000),
('G1', 'Greem', 40000),
('K1', 'Kastengel', 45000),
('K2', 'Kurma Siram Coklat', 65000),
('L1', 'Lidah Kucing', 45000),
('L2', 'Lidah Kucing Rainbow', 45000),
('M1', 'Miranda', 60000),
('M2', 'Muffin Cookiies', 45000),
('N1', 'Nastar', 45000),
('O1', 'Oatmeal', 50000),
('P1', 'Patakrut Cookies', 45000),
('P2', 'Pralin Blueberry', 60000),
('P3', 'Pralin Jeruk Lemon', 60000),
('P4', 'Pralin Rainbow Mix', 60000),
('P5', 'Pralin Strawberry', 60000),
('P6', 'Putri Salju', 45000),
('P7', 'Putri Salju Coklat', 45000),
('S1', 'Semprit', 40000),
('S2', 'Semprit larut', 40000),
('W1', 'Wafer Coklat', 45000),
('W2', 'Wafer Keju', 45000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `Kode_Pesanan` varchar(255) NOT NULL,
  `Nama_Pesanan` varchar(255) NOT NULL,
  `Total_Pesanan` int(11) NOT NULL,
  `Note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `No_Transaksi` int(15) NOT NULL,
  `Nama_Customer` varchar(255) NOT NULL,
  `No_Telepon` varchar(15) NOT NULL,
  `Kode_Pesanan` varchar(255) NOT NULL,
  `Nama_Pesanan` varchar(255) NOT NULL,
  `Total_Pesanan` int(11) NOT NULL,
  `Harga_Satuan` int(11) NOT NULL,
  `Total_Harga` int(11) NOT NULL,
  `Note` varchar(255) NOT NULL,
  `Tanggal_Penerimaan` date NOT NULL,
  `Jumlah_Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`No_Transaksi`, `Nama_Customer`, `No_Telepon`, `Kode_Pesanan`, `Nama_Pesanan`, `Total_Pesanan`, `Harga_Satuan`, `Total_Harga`, `Note`, `Tanggal_Penerimaan`, `Jumlah_Harga`) VALUES
(1, 'John Doe', '081234567890', 'G1', 'Greem', 5, 40000, 200000, '-', '2024-04-01', 200000),
(2, 'Jane Smith', '081298765432', 'S1', 'Semprit', 3, 40000, 120000, '-', '2024-04-02', 120000),
(3, 'David Johnson', '081276543210', 'S2', 'Semprit Larut', 2, 40000, 80000, 'Special request', '2024-04-03', 80000),
(5, 'Michael Brown', '081298765433', 'A1', 'Appo Kacang', 4, 45000, 180000, '-', '2024-04-05', 180000),
(6, 'Emily Davis', '081276543211', 'A2', 'Appo Mix', 2, 45000, 90000, '-', '2024-04-06', 90000),
(7, 'Christopher Wilson', '081234567892', 'B1', 'Banana Cookies', 3, 45000, 135000, '-', '2024-04-07', 135000),
(8, 'Olivia Taylor', '081298765434', 'B2', 'Black and White', 1, 45000, 45000, '-', '2024-04-08', 45000),
(9, 'Ethan Martinez', '081276543212', 'B3', 'Blue Berry Cookies', 4, 45000, 180000, '-', '2024-04-09', 180000),
(10, 'Ava Anderson', '081234567893', 'B4', 'Brownies Cookies', 2, 45000, 90000, '-', '2024-04-10', 90000),
(11, 'Dyahna Az-Zahra', '085791645963', 'B6', 'Brownies Pandan', 3, 45000, 135000, 'Pakai mika plastik', '2024-04-30', 135000),
(12, 'Yonathan Grace Widodo', '081216344114', 'B6', 'Brownies Pandan', 5, 45000, 225000, 'dibungkus jadi satu', '2024-05-08', 225000),
(13, 'Cahya Kumala Dewi', '085730753735', 'N1', 'Nastar', 4, 45000, 180000, 'dibungkus dengan rapi', '2024-05-25', 180000),
(14, 'Hilya', '12345678', 'A2', 'Appo Mix', 5, 45000, 225000, '-', '2024-05-31', 225000),
(15, 'HILLYA', '1234567890', 'A2', 'Appo Mix', 5, 45000, 225000, '-', '2024-05-25', 225000),
(16, 'TEST', '12312312', 'B1', 'Banana Cookies', 2323123, 45000, 1461319896, '-', '2024-05-31', 1461319896);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_penjualan`
--

CREATE TABLE `laporan_penjualan` (
  `Kode_Pesanan` varchar(255) NOT NULL,
  `Nama_Pesanan` varchar(255) NOT NULL,
  `Harga_Satuan` int(11) NOT NULL,
  `Terjual` int(11) NOT NULL,
  `Laba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_pesanan`
--

CREATE TABLE `riwayat_pesanan` (
  `No_Transaksi` int(15) NOT NULL,
  `Nama_Customer` varchar(255) NOT NULL,
  `No_Telepon` int(11) NOT NULL,
  `Tanggal_Penerimaan` date NOT NULL,
  `Status_Pesanan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_pesanan`
--
ALTER TABLE `daftar_pesanan`
  ADD KEY `No_Transaksi` (`No_Transaksi`);

--
-- Indeks untuk tabel `data_produk`
--
ALTER TABLE `data_produk`
  ADD PRIMARY KEY (`Kode_Pesanan`);

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD KEY `Kode_Pesanan` (`Kode_Pesanan`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`No_Transaksi`),
  ADD KEY `Kode_Pesanan` (`Kode_Pesanan`);

--
-- Indeks untuk tabel `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD KEY `Kode_Pesanan` (`Kode_Pesanan`);

--
-- Indeks untuk tabel `riwayat_pesanan`
--
ALTER TABLE `riwayat_pesanan`
  ADD KEY `No_Transaksi` (`No_Transaksi`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_pesanan`
--
ALTER TABLE `daftar_pesanan`
  ADD CONSTRAINT `daftar_pesanan_ifbk1` FOREIGN KEY (`No_Transaksi`) REFERENCES `kasir` (`No_Transaksi`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`Kode_Pesanan`) REFERENCES `data_produk` (`Kode_Pesanan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`Kode_Pesanan`) REFERENCES `data_produk` (`Kode_Pesanan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD CONSTRAINT `laporan_penjualan_ibfk_1` FOREIGN KEY (`Kode_Pesanan`) REFERENCES `data_produk` (`Kode_Pesanan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `riwayat_pesanan`
--
ALTER TABLE `riwayat_pesanan`
  ADD CONSTRAINT `riwayat_pesanan_ifbk1` FOREIGN KEY (`No_Transaksi`) REFERENCES `kasir` (`No_Transaksi`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
