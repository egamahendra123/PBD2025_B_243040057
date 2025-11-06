--membuat database--
CREATE DATABASE UNPAS;

USE UNPAS;

--membuat table--
CREATE TABLE mahasiswa (
	npm CHAR(9),
	nama VARCHAR(100),
	jurusan VARCHAR(50)
)

--melihat struktur--
EXEC sp_help 'mahasiswa';

--mengubah tabel memakai alter--
--menambah kolom--
ALTER TABLE mahasiswa
ADD alamat VARCHAR(100) NOT NULL;

--mengubah tipe data--
ALTER TABLE mahasiswa
ALTER COLUMN nama VARCHAR(50);

--menambah constraint unique--
ALTER TABLE mahasiswa
ADD CONSTRAINT UQ_npm_mahasiswa UNIQUE (npm);

--membuat tabel dosen--
CREATE TABLE dosen (
	nama VARCHAR(50),
	nip CHAR(9),
	alamat VARCHAR(100),
	prodi VARCHAR(50)
)

--menghapus tabel atau database--
DROP TABLE mahasiswa;
DROP DATABASE UNPAS;

--menambahkan not null pada kolom nip--
ALTER TABLE dosen
ALTER COLUMN nip VARCHAR(9) NOT NULL;

--menambahkan pk di kolom nip pada tabel dosen--
ALTER TABLE dosen
ADD CONSTRAINT PK_nip_dosen PRIMARY KEY (nip);

--menghapus constraint unique pada kolom npm--
ALTER TABLE mahasiswa
DROP CONSTRAINT UQ_npm_mahasiswa;

--menambahkan pk di kolom npm--
ALTER TABLE Mahasiswa 
ALTER CONSTRAINT PK_npm_mahasiswa PRIMARY KEY (npm);

--menambahkan nip ke tabel mahasiswa--
ALTER TABLE mahasiswa
ADD nip_pembimbing CHAR(9);

--menambah foreign key di tabel mahasiswa--
ALTER TABLE mahasiswa
ADD CONSTRAINT FK_mahasiswa_dosen
FOREIGN KEY (nip_pembimbing)
REFERENCES dosen(nip);