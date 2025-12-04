USE KampusDB;

--CROOSS JOIN
--Menampilkan semua kombinasi Mahasiswa dan matakuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMK FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS JOIN MataKuliah AS MK;

--menampilkan semua kombinasi dosen dan ruangan 
SELECT D. NamaDosen, R. KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R;

--LEFT JOINT 
--menampilkan semua mahasiswa termasuk yang belum mengambil krs
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--menampilkan semua matakuliah , termasuk yanhgg belum punya jadwal
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK 
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--right join 
--menampilkan semua jadwal, walaupun tidak ada matakuliah
SELECT MK.NamaMK, J.Hari 
FROM MataKuliah MK 
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--menampilkan semua ruangan, apakah dipakai jadwal atau tidak 
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J 
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--INNER JOIN
--menampilkan nama mahaiswa dan matkulnya, tapi lewat KRS SELECT M. NamaMahasiswa, MK. NamaMk
SELECT M.NamaMahasiswa, NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M. MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK. MataKuliahID;

--MENAMPILKAN MATAKULIAH DAN DOSEN PENGAMPU NYA 
SELECT MK.NamaMk, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--Menampilkan jadwal lengkap
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J 
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--MENAMPILKAN NAMA MAHASISWA,MATKUL  DAN NILAI AKHIR NYA
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir 
FROM Nilai N 
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

--menampilkan dosen dan matkul yang dia ajar 
SELECT D.NamaDosen, MK.NamaMk
FROM Dosen D 
INNER JOIN MataKuliah MK ON D.DosenID = MK.DosenID;

--MENAMPILKAN NAMA MAHASISWA DAN NILAI AKHIRNYA
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--SELEF JOIN
--mencari pasangan mahasiswa dari prodi yang sama 
SELECT A.NamaMahasiswa AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasiswa2,
		A.Prodi
FROM Mahasiswa A 
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID;--agar gaada pasangan yang sama 

SELECT A.NamaMahasiswa AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasiswa2,
		A.Prodi
FROM Mahasiswa A 
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID > B.MahasiswaID;

--LATIHAN
--1.Tampilkan nama mahasiswa (NamaMahasiswa) beserta prodi-nya (Prodi) dari tabel Mahasiswa,tetapi hanya mahasiswa yang memiliki nilai di tabel Nilai.
SELECT M.NamaMahasiswa, M.Prodi, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--2.Tampilkan nama dosen(NamaDosen) dan ruangan(KodeRuangan) tempat dosen tersebut mengajarSELECT D.NamaDosen, R.KodeRuangan
SELECT D.NamaDosen, R.KodeRuangan
FROM JadwalKuliah J
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--3. Tampilkan daftar mahasiswa (NamaMahasiswa) yang mengambil suatu mata kuliah(NamaMK) beserta nama mata kuliah dan dosen pengampu-nya(NamaDosen)SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

--4. Tampilkan jadwal kuliah berisi nama mata kuliah(NamaMK), nama dosen(NamaDosen), dan hari kuliah(Hari) tetapi tidak perlu menampilkan ruangan.SELECT MK.NamaMK, D.NamaDosen, J.Hari
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID;

--5. Menampilkan nilai mahasiswa lengkap (NamaMahasiswa, NamaMK, NamaDosen, NilaiAkhir)--5. Tampilkan nilai mahasiswa(NilaiAkhir) lengkap dengan nama mahasiswa(NamaMahasiswa) nama mata kuliah (NamaMK) , nama dosen pengampu(NamaDosen) dan nilai akhirnya(NilaiAkhir)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

