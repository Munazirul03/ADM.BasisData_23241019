

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