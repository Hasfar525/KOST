-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2020 pada 05.54
-- Versi server: 10.3.15-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databse`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(12, 'jj', '1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `id_kost` int(11) NOT NULL,
  `judul` varchar(40) NOT NULL,
  `file` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kost`
--

CREATE TABLE `kost` (
  `id_kost` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `tersedia` int(2) NOT NULL,
  `status` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `fasilitas` text NOT NULL,
  `harga_3bulan` int(9) NOT NULL,
  `harga_6bulan` int(9) NOT NULL,
  `harga_pertahun` int(9) NOT NULL,
  `pengunjung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama`, `alamat`, `telepon`, `email`, `username`, `password`) VALUES
(13, 'hasfar', 'kaltara', '08213123', 'hasfar525@gmail.com', 'kk', '1234');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`),
  ADD KEY `fk_kost` (`id_kost`);

--
-- Indeks untuk tabel `kost`
--
ALTER TABLE `kost`
  ADD PRIMARY KEY (`id_kost`),
  ADD KEY `fk_pemilik` (`id_pemilik`);

--
-- Indeks untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kost`
--
ALTER TABLE `kost`
  MODIFY `id_kost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`id_kost`) REFERENCES `kost` (`id_kost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kost`
--
ALTER TABLE `kost`
  ADD CONSTRAINT `kost_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
