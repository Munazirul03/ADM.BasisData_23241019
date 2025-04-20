CREATE DATABASE peternakan_ayam;
USE peternakan_ayam;

-- TABEL PELANGGAN
CREATE TABLE Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_depan VARCHAR(50),
    nama_tengah VARCHAR(50),
    nama_belakang VARCHAR(50),
    lokasi VARCHAR(100)
);

-- TABEL KANDANG
CREATE TABLE Kandang (
    id_kandang INT AUTO_INCREMENT PRIMARY KEY,
    ukuran VARCHAR(50),
    bahan VARCHAR(50),
    petak_kandang VARCHAR(100)
);

-- TABEL AYAM
CREATE TABLE Ayam (
    id_ayam INT AUTO_INCREMENT PRIMARY KEY,
    ukuran_tubuh VARCHAR(50),
    warna_bulu VARCHAR(50),
    jenis_kelamin ENUM('Jantan', 'Betina'),
    id_kandang INT,
    FOREIGN KEY (id_kandang) REFERENCES Kandang(id_kandang)
);

-- TABEL MEMBELI
CREATE TABLE Membeli (
    id_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_ayam INT,
    qty INT,
    tgl_beli DATE,
    karyawan VARCHAR(100),
    total DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_ayam) REFERENCES Ayam(id_ayam)
);

-- TABEL JADWAL PAKAN
CREATE TABLE Jadwal_Pakan (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    waktu TIME,
    frekuensi VARCHAR(50),
    konsistensi VARCHAR(100)
);

-- TABEL PAKAN
CREATE TABLE Pakan (
    id_pakan INT AUTO_INCREMENT PRIMARY KEY,
    komposisi TEXT,
    kualitas VARCHAR(50),
    jumlah INT
);

-- TABEL PEMBERIAN_PAKAN (junction table)
CREATE TABLE Pemberian_Pakan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pakan INT,
    id_jadwal INT,
    FOREIGN KEY (id_pakan) REFERENCES Pakan(id_pakan),
    FOREIGN KEY (id_jadwal) REFERENCES Jadwal_Pakan(id_jadwal)
);

-- DATA PELANGGAN
INSERT INTO pelanggan (nama_depan, nama_tengah, nama_belakang, lokasi)
VALUES ('Ani', NULL, 'Sukmawati', 'Desa Sejahtera');

-- DATA AYAM
INSERT INTO ayam (ukuran_tubuh, warna_bulu, jenis_kelamin)
VALUES ('Sedang', 'Putih', 'Betina'),
       ('Besar', 'Coklat', 'Jantan');

-- DATA KANDANG
INSERT INTO kandang (ukuran, bahan, petak_kandang)
VALUES ('10x10m', 'Bambu', 5),
       ('15x15m', 'Baja ringan', 10);

-- DATA TINGGAL
INSERT INTO tinggal (id_ayam, id_kandang)
VALUES (1, 1),
       (2, 2);

-- DATA KARYAWAN
INSERT INTO karyawan (nama, posisi, kualifikasi)
VALUES 
('Bapak Arif', 'Manajer Operasional', 'Sarjana Peternakan, pengalaman 5 tahun'),
('Ibu Maya', 'Akuntan', 'Sarjana Akuntansi, pengalaman 3 tahun'),
('Pak Budi', 'Staf Pemasaran', 'Sarjana Pemasaran'),
('Siti', 'Teknisi Kesehatan', 'Teknisi hewan, tersertifikasi');

-- DATA PEMBELIAN
INSERT INTO membeli (id_pelanggan, id_ayam, id_karyawan, qty, tgl_beli, total)
VALUES (1, 1, 3, 5, '2025-04-10', 250000.00);

-- DATA PAKAN
INSERT INTO pakan (komposisi, kualitas, jumlah)
VALUES ('Jagung, Kedelai, Vitamin, Mineral', 'A', 100);

-- DATA JADWAL PAKAN
INSERT INTO jadwal_pakan (waktu, frekuensi, konsistensi)
VALUES ('06:00:00', 2, 'Tinggi');

-- DATA DIBERIKAN
INSERT INTO diberikan (id_pakan, id_jadwal)
VALUES (1, 1);


