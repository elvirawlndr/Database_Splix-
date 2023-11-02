CREATE DATABASE RPL;

CREATE TABLE User(
ID_User INT NOT NULL auto_increment,
Nama_User VARCHAR(50) NOT NULL,
Email_User VARCHAR(50) NOT NULL,
Nomor_Telepon CHAR(13) NOT NULL,
Tanggal_Lahir DATE NOT NULL,
Kata_Sandi VARCHAR(255) NOT  NULL,
PRIMARY KEY(ID_User)
);

CREATE TABLE Admin(
ID_Admin INT NOT NULL auto_increment,
Nama_User VARCHAR(50) NOT NULL,
Kata_Sandi VARCHAR(255) NOT NULL,
PRIMARY KEY(ID_Admin)
);

CREATE TABLE Musik (
ID_Musik INT NOT NULL auto_increment,
Judul_Musik VARCHAR(50) NOT NULL,
Nama_Penyanyi VARCHAR(50) NOT NULL,
Judul_Album VARCHAR(50) NOT NULL,
Genre_Musik VARCHAR(50) NOT NULL,
TglRilis_Musik DATE NOT NULL,
Durasi_Musik TIME NOT NULL,
JumPutar_Musik INT NOT NULL,
PRIMARY KEY(ID_Musik)
);

CREATE TABLE Film (
ID_Film INT NOT NULL auto_increment,
Judul_Film VARCHAR(50) NOT NULL,
Nama_Aktor VARCHAR(50) NOT NULL,
Genre_Film VARCHAR(50) NOT NULL,
TglRilis_Film DATE NOT NULL,
Durasi_Film TIME NOT NULL,
JumPutar_Film INT NOT NULL,
PRIMARY KEY(ID_Film)
);

CREATE TABLE Teleparty (
ID_Teleparty INT NOT NULL auto_increment,
ID_User INT NOT NULL,
ID_Film INT NOT NULL,
PRIMARY KEY(ID_Teleparty)
);

CREATE TABLE Playlab (
ID_Playlab INT NOT NULL auto_increment,
ID_User INT NOT NULL,
ID_Musik INT NOT NULL,
PRIMARY KEY(ID_Playlab)
);

CREATE TABLE LisensiMusik (
ID_LisensiMusik INT NOT NULL auto_increment,
ID_Musik INT NOT NULL,
PRIMARY KEY(ID_LisensiMusik)
);

CREATE TABLE LisensiFilm (
ID_LisensiFilm INT NOT NULL auto_increment,
ID_Film INT NOT NULL,
PRIMARY KEY(ID_LisensiFilm)
);

CREATE TABLE Premium (
ID_Pembayaran INT NOT NULL auto_increment,
ID_User INT NOT NULL,
Metode_Pembayaran ENUM("GOPAY", "Shopeepay", "Dana", "OVO", "Transfer Bank") NOT NULL,
Pilihan_Paket ENUM("Mini", "Individual", "Duo", "Family"),
Total_Pembayaran INT NOT NULL,
Waktu_Pembayaran DATETIME NOT NULL,
PRIMARY KEY(ID_Pembayaran)
);

ALTER TABLE `premium` ADD FOREIGN KEY (`ID_User`) REFERENCES `user`(`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `teleparty` ADD FOREIGN KEY (`ID_User`) REFERENCES `user`(`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `teleparty` ADD FOREIGN KEY (`ID_Film`) REFERENCES `film`(`ID_Film`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `playlab` ADD FOREIGN KEY (`ID_User`) REFERENCES `user`(`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `playlab` ADD FOREIGN KEY (`ID_Musik`) REFERENCES `musik`(`ID_Musik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `lisensimusik` ADD FOREIGN KEY (`ID_Musik`) REFERENCES `musik`(`ID_Musik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `lisensifilm` ADD FOREIGN KEY (`ID_Film`) REFERENCES `film`(`ID_Film`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `user` ADD UNIQUE KEY `notelp_user` (`Nomor_Telepon`);
ALTER TABLE `user` ADD UNIQUE KEY `email_user` (`Email_User`);

INSERT INTO `user` (`Nama_User`, `Email_User`, `Nomor_Telepon`, `Tanggal_Lahir`, `Kata_Sandi`) 
VALUES ('Robby', 'robbyjeremy@gmail.com', '08123456789', '2003-11-2', '$2y$10$EnIi90KP.0BqCVJgK21BrO3xzArxCZaiAPaUebCw.K2Xw71QOCZv2');
INSERT INTO `admin` (`Nama_User`, `Kata_Sandi`) 
VALUES ('jerenyah', '$2y$10$EnIi90KP.0BqCVJgK21BrO3xzArxCZaiAPaUebCw.K2Xw71QOCZv2');
INSERT INTO `musik` (`Judul_Musik`, `Nama_Penyanyi`, `Judul_Album`, `Genre_Musik`, `TglRilis_Musik`, `Durasi_Musik`, `JumPutar_Musik`) 
VALUES ('Goodbye', 'Air Supply', 'The Vanishing Race', 'Pop/Rock', '1993-5-7', '00:04:02', '99384717');
INSERT INTO `playlab` (`ID_User`, `ID_Musik`) 
VALUES ('1', '1');
INSERT INTO `film` (`Judul_Film`, `Nama_Aktor`, `Genre_Film`, `TglRilis_Film`, `Durasi_Film`, `JumPutar_Film`) 
VALUES ('Unlocked', 'Im Si-Wan', 'Drama', '2023-02-17', '01:57:52', 21937182);
INSERT INTO `teleparty` (`ID_User`, `ID_Film`) 
VALUES ('1', '1');
INSERT INTO `lisensimusik` (`ID_Musik`) 
VALUES ('1');
INSERT INTO `lisensifilm` (`ID_film`) 
VALUES ('1');
INSERT INTO `premium` (`ID_User`, `Metode_Pembayaran`, `Pilihan_Paket`, `Total_Pembayaran`, `Waktu_Pembayaran`) 
VALUES ('1', 'OVO', 'Individual', '27500', '2023-01-17 06:59:30');

select * from user;
describe user;
select * from admin;
describe admin;
select * from musik;
describe musik;
select * from playlab;
describe playlab;
select * from film;
describe film;
select * from teleparty;
describe teleparty;
select * from lisensimusik;
describe lisensimusik;
select * from lisensifilm;
describe lisensifilm;
select * from premium;
