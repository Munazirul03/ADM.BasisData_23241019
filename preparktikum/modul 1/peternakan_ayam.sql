CREATE DATABASE TERNAK_AYAM;
USE TERNAK_AYAM;

-- TABEL PELANGGAN
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_depan VARCHAR(50),
    nama_tengah VARCHAR(50),
    nama_belakang VARCHAR(50),
    lokasi VARCHAR(100)
);

-- TABEL KANDANG
CREATE TABLE kandang (
    id_kandang INT AUTO_INCREMENT PRIMARY KEY,
    ukuran VARCHAR(50),
    bahan VARCHAR(50),
    petak_kandang VARCHAR(100)
);

-- TABEL AYAM
CREATE TABLE ayam (
    id_ayam INT AUTO_INCREMENT PRIMARY KEY,
    ukuran_tubuh VARCHAR(50),
    warna_bulu VARCHAR(50),
    jenis_kelamin ENUM('Jantan', 'Betina'),
    id_kandang INT,
    FOREIGN KEY (id_kandang) REFERENCES kandang(id_kandang)
);

-- TABEL MEMBELI
CREATE TABLE membeli (
    id_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_ayam INT,
    qty INT,
    tgl_beli DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_ayam) REFERENCES ayam(id_ayam)
);

-- TABEL JADWAL PAKAN
CREATE TABLE jadwal_pakan (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    waktu TIME,
    frekuensi VARCHAR(50),
    konsistensi VARCHAR(100)
);

-- TABEL PAKAN
CREATE TABLE pakan (
    id_pakan INT AUTO_INCREMENT PRIMARY KEY,
    komposisi TEXT,
    kualitas VARCHAR(50),
    jumlah INT
);

-- TABEL PEMBERIAN_PAKAN (junction table)
CREATE TABLE pemberian_pakan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pakan INT,
    id_jadwal INT,
    FOREIGN KEY (id_pakan) REFERENCES pakan(id_pakan),
    FOREIGN KEY (id_jadwal) REFERENCES jadwal_pakan(id_jadwal)
);

-- DATA KANDANG
INSERT INTO kandang (ukuran, bahan, petak_kandang)
VALUES ('10x10m', 'Bambu', 'Petak 1'),
        ('15x15m', 'Baja ringan', 'Petak 2');

-- DATA PELANGGAN
INSERT INTO pelanggan (nama_depan, nama_tengah, nama_belakang, lokasi)
VALUES ('Ani', NULL, 'Sukmawati', 'Desa Sejahtera');

-- DATA AYAM
INSERT INTO ayam (ukuran_tubuh, warna_bulu, jenis_kelamin, id_kandang)
VALUES ('Sedang', 'Putih', 'Betina', 1),
        ('Besar', 'Coklat', 'Jantan', 2);

-- DATA PEMBELIAN
INSERT INTO membeli (id_pelanggan, id_ayam, qty, tgl_beli, total)
VALUES (1, 1, 5, '2025-04-10', 250000.00);

-- DATA PAKAN
INSERT INTO pakan (komposisi, kualitas, jumlah)
VALUES ('Jagung, Kedelai, Vitamin, Mineral', 'A', 100);

-- DATA JADWAL PAKAN
INSERT INTO jadwal_pakan (waktu, frekuensi, konsistensi)
VALUES ('06:00:00', '2 kali sehari', 'Tinggi');

-- DATA PEMBERIAN PAKAN
INSERT INTO pemberian_pakan (id_pakan, id_jadwal)
VALUES (1, 1);


-- Mengambil 1 kolom dari setiap tabel dengan alias dan prefix

SELECT pe.id_pelanggan AS pelanggan_id FROM pelanggan pe;
SELECT ka.ukuran AS kandang_ukuran FROM kandang ka;
SELECT ay.warna_bulu AS ayam_warna FROM ayam ay;
SELECT me.qty AS pembelian_jumlah FROM membeli me;
SELECT jp.waktu AS jadwal_waktu FROM jadwal_pakan jp;
SELECT pa.kualitas AS pakan_kualitas FROM pakan pa;
SELECT pp.id_pakan AS pemberian_id_pakan FROM pemberian_pakan pp;

-- Mengambil 2 kolom dari setiap tabel dengan alias dan prefix

SELECT pe.id_pelanggan AS pelanggan_id, pe.nama_depan AS pelanggan_nama FROM pelanggan pe;
SELECT ka.id_kandang AS kandang_id, ka.bahan AS kandang_bahan FROM kandang ka;
SELECT ay.id_ayam AS ayam_id, ay.jenis_kelamin AS ayam_kelamin FROM ayam ay;
SELECT me.id_pembelian AS pembelian_id, me.tgl_beli AS pembelian_tanggal FROM membeli me;
SELECT jp.id_jadwal AS jadwal_id, jp.frekuensi AS jadwal_frekuensi FROM jadwal_pakan jp;
SELECT pa.id_pakan AS pakan_id, pa.jumlah AS pakan_stok FROM pakan pa;
SELECT pp.id AS pemberian_id, pp.id_jadwal AS pemberian_id_jadwal FROM pemberian_pakan pp;