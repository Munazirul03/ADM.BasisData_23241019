-- Nama			: Munazirul Akbar
-- Nim			: 23241019
-- kelas    	: A
-- Mata kuliah	: Basis Data

-- soal 1
/*Munculkan nama produk, tgl transaksi, bulan,  tahun,  dan selesih hari dari transaksi dengan tanggal 30 juni 2023 atas seemua produk ditransaksikan*/


USE pti_mart;

SELECT 
    nama_produk, 
    tgl_transaksi,
    MONTH(tgl_transaksi) AS bulan,
    YEAR(tgl_transaksi) AS tahun,
    DATEDIFF('2023-06-30', tgl_transaksi) AS selisih_hari
FROM tr_penjualan_dqlab;

-- Soal 2
/*Tampilkan nama pelanggan  dan nilai transaksinya dengan nilai transaksi terkecuali*/


USE pti_mart;

SELECT 
  plg.nama_pelanggan,
  (tr.qty * tr.harga * (1 - tr.diskon_persen / 100)) AS nilai_transaksi
FROM tr_penjualan_dqlab AS tr
JOIN ms_pelanggan_dqlab AS plg
  ON tr.kode_pelanggan = plg.kode_pelanggan
ORDER BY nilai_transaksi ASC
LIMIT 1;

-- Soal 3
/*tampilkan bulan, nama produk, kategori, dan harga dari produk yang tidak pernah  terjual pada bulan mei*/

USE pti_mart;

SELECT 
  'Mei' AS bulan,
  p.nama_produk,
  p.kategori_produk,
  p.harga
FROM ms_produk_dqlab AS p
WHERE p.kode_produk NOT IN (
    SELECT DISTINCT t.kode_produk
    FROM tr_penjualan_dqlab AS t
    WHERE MONTH(t.tgl_transaksi) = 5
);



USE pti_mart;

SELECT 
  p.nama_produk,
  p.kategori_produk,
  p.harga,
  t.tgl_transaksi
FROM tr_penjualan_dqlab t
JOIN ms_produk_dqlab p
  ON t.kode_produk = p.kode_produk
WHERE MONTH(t.tgl_transaksi) = 5;

