-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 09 Haz 2026, 19:44:25
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `meteoroloji`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `baraj_verileri`
--

CREATE TABLE `baraj_verileri` (
  `id` int(11) NOT NULL,
  `baraj_kodu` varchar(20) NOT NULL,
  `isim` varchar(100) NOT NULL,
  `sehir` varchar(50) NOT NULL,
  `plaka_kodu` varchar(5) NOT NULL,
  `havza` varchar(50) NOT NULL,
  `kapasite_hm3` float NOT NULL,
  `aktif_hacim_hm3` float NOT NULL,
  `su_kalitesi` varchar(50) NOT NULL,
  `risk_durumu` varchar(100) NOT NULL,
  `son_guncelleme` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `baraj_verileri`
--

INSERT INTO `baraj_verileri` (`id`, `baraj_kodu`, `isim`, `sehir`, `plaka_kodu`, `havza`, `kapasite_hm3`, `aktif_hacim_hm3`, `su_kalitesi`, `risk_durumu`, `son_guncelleme`) VALUES
(1, 'b-01', 'Ömerli Barajı', 'İstanbul', '34', 'Marmara', 235.3, 224, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(2, 'b-02', 'Terkos (Durusu) Barajı', 'İstanbul', '34', 'Marmara', 162.2, 96.4, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(3, 'b-03', 'Büyükçekmece Barajı', 'İstanbul', '34', 'Marmara', 149, 82.2, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(4, 'b-04', 'Alibey (Alibeyköy) Barajı', 'İstanbul', '34', 'Marmara', 34.1, 22.5, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(5, 'b-05', 'Sazlıdere Barajı', 'İstanbul', '34', 'Marmara', 88.7, 39.4, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(6, 'b-06', 'Elmalı Barajı', 'İstanbul', '34', 'Marmara', 9.6, 9.2, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(7, 'b-07', 'Darlık Barajı', 'İstanbul', '34', 'Marmara', 107.5, 98.9, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(8, 'b-51', 'Kazandere Barajı', 'İstanbul', '34', 'Marmara', 50.8, 28.8, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(9, 'b-52', 'Pabuçdere Barajı', 'İstanbul', '34', 'Marmara', 58.5, 33.1, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(10, 'b-53', 'Istrancalar Barajı', 'İstanbul', '34', 'Marmara', 6.2, 2.1, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(11, 'b-08', 'Çamlıdere Barajı', 'Ankara', '06', 'İç Anadolu', 1220, 489.2, '🔵 İyi', 'Orta Risk', '2026-06-03 10:35:12'),
(12, 'b-09', 'Kurtboğazı Barajı', 'Ankara', '06', 'İç Anadolu', 92, 29.8, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(13, 'b-10', 'Çubuk-2 Barajı', 'Ankara', '06', 'İç Anadolu', 22.5, 9.5, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(14, 'b-11', 'Kavşakkaya Barajı', 'Ankara', '06', 'İç Anadolu', 64, 22.4, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(15, 'b-12', 'Akyar Barajı', 'Ankara', '06', 'İç Anadolu', 56, 21.3, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(16, 'b-54', 'Eğrekkaya Barajı', 'Ankara', '06', 'İç Anadolu', 112.3, 50.5, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(17, 'b-13', 'Tahtalı Barajı', 'İzmir', '35', 'Ege', 306.6, 167.4, '🔵 İyi', 'Orta Risk', '2026-06-03 10:35:12'),
(18, 'b-14', 'Balçova Barajı', 'İzmir', '35', 'Ege', 7.8, 4.8, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(19, 'b-15', 'Ürkmez Barajı', 'İzmir', '35', 'Ege', 8.5, 4.9, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(20, 'b-16', 'Alaçatı Kutlu Aktaş Barajı', 'İzmir', '35', 'Ege', 16.5, 9.1, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(21, 'b-17', 'Gördes Barajı', 'İzmir', '35', 'Ege', 448, 38.1, '🔴 Kritik', 'Yüksek Risk', '2026-06-03 10:35:12'),
(22, 'b-18', 'Doğancı Barajı', 'Bursa', '16', 'Marmara', 43.3, 34, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(23, 'b-19', 'Nilüfer Barajı', 'Bursa', '16', 'Marmara', 60, 37.4, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(24, 'b-20', 'Çınarcık Barajı', 'Bursa', '16', 'Marmara', 372, 210.5, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(25, 'b-21', 'Seyhan Barajı (HES)', 'Adana', '01', 'Akdeniz', 1200, 1146, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-08 08:22:48'),
(26, 'b-22', 'Çatalan Barajı (HES)', 'Adana', '01', 'Akdeniz', 1600, 1528, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-08 08:22:48'),
(27, 'b-23', 'Yedigöze Barajı (HES)', 'Adana', '01', 'Akdeniz', 650, 620.8, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-08 08:22:48'),
(28, 'b-24', 'Oymapınar Barajı (HES)', 'Antalya', '07', 'Akdeniz', 300, 265.2, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(29, 'b-25', 'Manavgat Barajı', 'Antalya', '07', 'Akdeniz', 130, 114.5, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(30, 'b-26', 'Karacaören-1 Barajı', 'Antalya', '07', 'Akdeniz', 1230, 890.1, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(31, 'b-27', 'Altınapa Barajı', 'Konya', '42', 'İç Anadolu', 32.5, 14.2, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(32, 'b-28', 'Bağbaşı Mavi Tünel Barajı', 'Konya', '42', 'İç Anadolu', 180, 94.5, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(33, 'b-29', 'Ermenek Barajı (HES)', 'Karaman', '70', 'Akdeniz', 4580, 3810.2, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(34, 'b-30', 'Altınkaya Barajı (HES)', 'Samsun', '55', 'Karadeniz', 5770, 4820.5, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(35, 'b-31', 'Derbent Barajı (HES)', 'Samsun', '55', 'Karadeniz', 213, 185.4, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(36, 'b-32', 'Suat Uğurlu Barajı', 'Samsun', '55', 'Karadeniz', 182, 154, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(37, 'b-33', 'Keban Barajı (HES)', 'Elazığ', '23', 'Fırat-Dicle', 31000, 25420, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(38, 'b-34', 'Karakaya Barajı (HES)', 'Diyarbakır', '21', 'Fırat-Dicle', 9580, 7807.7, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(39, 'b-35', 'Atatürk Barajı (HES)', 'Şanlıurfa', '63', 'Fırat-Dicle', 48700, 36427.6, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(40, 'b-36', 'Birecik Barajı (HES)', 'Gaziantep', '27', 'Fırat-Dicle', 1220, 846.6, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(41, 'b-37', 'Karkamış Barajı', 'Gaziantep', '27', 'Fırat-Dicle', 157, 132.5, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(42, 'b-38', 'Kral Kızı Barajı', 'Diyarbakır', '21', 'Fırat-Dicle', 1920, 1420, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(43, 'b-39', 'Batman Barajı', 'Batman', '72', 'Fırat-Dicle', 1180, 940.2, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(44, 'b-40', 'Ilısu Prof. Dr. Veysel Eroğlu (HES)', 'Mardin', '47', 'Fırat-Dicle', 10600, 8910, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(45, 'b-41', 'Deriner Barajı (HES)', 'Artvin', '08', 'Çoruh', 3500, 3120, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(46, 'b-42', 'Yusufeli Barajı (HES)', 'Artvin', '08', 'Çoruh', 2130, 1850, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(47, 'b-43', 'Borçka Barajı (HES)', 'Artvin', '08', 'Çoruh', 420, 385, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(48, 'b-44', 'Muratlı Barajı (HES)', 'Artvin', '08', 'Çoruh', 75, 68.2, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(49, 'b-45', 'Yamula Barajı', 'Kayseri', '38', 'Kızılırmak', 3470, 2450, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(50, 'b-46', 'Menzelet Barajı', 'Kahramanmaraş', '46', 'Ceyhan', 4200, 3510, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(51, 'b-47', 'Sır Barajı', 'Kahramanmaraş', '46', 'Ceyhan', 1120, 890, '🟢 İdeal Seviye', 'Düşük Risk', '2026-06-03 10:35:12'),
(52, 'b-48', 'Kılıçkaya Barajı', 'Sivas', '58', 'Kızılırmak', 1400, 1020, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(53, 'b-49', 'Sarıyar Hasan Polatkan Barajı', 'Eskişehir', '26', 'Sakarya', 1900, 1250, '🔵 İyi', 'Düşük Risk', '2026-06-03 10:35:12'),
(54, 'b-50', 'Demirköprü Barajı', 'Manisa', '45', 'Gediz', 1020, 610, '🟡 Orta', 'Orta Risk', '2026-06-03 10:35:12'),
(55, 'B-ALMUS', 'Almus Barajı', 'Tokat', '60', 'Yeşilırmak', 950, 950, 'İyi', 'Taşkın Riski (Dolusavak Açık)', '2026-06-03 10:35:12'),
(56, 'B-CB2C63', 'Gölova', 'Sivas', '58', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(57, 'B-BA5E05', 'Büyük Karaçay', 'Hatay', '31', 'Asi', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(58, 'B-92D37C', 'Yenice-Gönen', 'Balıkesir', '10', 'Marmara', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(59, 'B-215CED', 'Bayramiç', 'Çanakkale', '17', 'Kuzey Ege', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(60, 'B-B2534A', 'Yalnızardıç', 'Antalya', '07', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(61, 'B-F6F500', 'Almus', 'Tokat', '60', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(62, 'B-2993E2', 'Balkusan', 'Karaman', '70', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(63, 'B-8BCD3D', 'Çapalı Dinar Karakuyu', 'Afyon', '03', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(64, 'B-93E537', 'Kartalkaya', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(65, 'B-3AFDE6', 'Zernek', 'Van', '65', 'Van Gölü', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(66, 'B-B6B95E', 'Yuvacık', 'Kocaeli', '41', '', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(67, 'B-3115FC', 'Karakuz', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(68, 'B-285B69', 'Berke', 'Osmaniye', '80', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(69, 'B-4F16DA', 'Ürkmez Barajı', 'İzmir', '35', 'Küçük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(70, 'B-1967F6', 'Topçam-Ordu', 'Ordu', '52', 'Doğu Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(71, 'B-DDEF85', 'Çakmak Barajı', 'Samsun', '55', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(72, 'B-000920', 'Menzelet', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(73, 'B-241122', 'Kavşakbendi Hes', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(74, 'B-FC871E', 'Kılıçkaya', 'Sivas', '58', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(75, 'B-0D89B0', 'Alakır', 'Antalya', '07', 'Batı Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(76, 'B-6905CA', 'Ömerli Barajı', 'İstanbul (asya)', '34', 'Riva Deresi', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(77, 'B-0D0871', 'Elmalı Barajı', 'İstanbul (beykoz)', '34', 'Göksu Deresi', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(78, 'B-E110B3', 'Yaşmaklı', 'Gümüşhane', '29', 'Doğu Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(79, 'B-A19242', 'Pamukluk', 'İçel', '33', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(80, 'B-C8DC4D', 'Kesikköprü', 'Ankara', '06', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(81, 'B-E1A542', 'Çatalan', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(82, 'B-7812E8', 'Yedigöze', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(83, 'B-074516', 'Eşen 1', 'Muğla', '48', 'Batı Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(84, 'B-4765A4', 'Sorgun', 'Isparta', '32', 'Antalya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(85, 'B-317119', 'Bahçelik', 'Kayseri', '38', 'Seyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(86, 'B-7542BA', 'Gümüşören', 'Kayseri', '38', 'Seyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(87, 'B-A9FADD', 'Ermenek', 'Karaman', '70', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(88, 'B-4FA6DE', 'Çamlıgöze', 'Sivas', '58', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(89, 'B-FEB53A', 'Balçova Barajı', 'İzmir', '35', 'Küçük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(90, 'B-ADDFB6', 'Manyas', 'Balıkesir', '10', 'Susurluk', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(91, 'B-AFBF84', 'Kandil Hes', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(92, 'B-5ED8AD', 'Darlık Barajı', 'İstanbul (şile)', '34', 'Darlık Deresi', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(93, 'B-28D83A', 'Kemer', 'Aydın', '09', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(94, 'B-48B745', 'Çaygören', 'Balıkesir', '10', 'Susurluk', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(95, 'B-299977', 'Alaköprü', 'İçel', '33', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(96, 'B-8C621D', 'Aslantaş', 'Adana', '01', 'Ceyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(97, 'B-F542B9', 'Cindere', 'Denizli', '20', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(98, 'B-3E1133', 'Berdan', 'İçel', '33', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(99, 'B-B5D983', 'Demirköprü', 'Manisa', '45', 'Gediz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(100, 'B-936AE4', 'Çınarcık', 'Bursa', '16', 'Susurluk', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(101, 'B-FC0113', 'Göktaş-1', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(102, 'B-C1F18D', 'Afşar', 'Konya', '42', 'Konya Kapalı', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(103, 'B-1A1A25', 'Torul', 'Gümüşhane', '29', 'Doğu Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(104, 'B-A71FE3', 'Akköprü', 'Muğla', '48', 'Batı Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(105, 'B-A9F891', 'Yamula', 'Kayseri', '38', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(106, 'B-9FCCD4', 'Çekerek', 'Yozgat', '66', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(107, 'B-CE1A9D', 'Ataköy', 'Tokat', '60', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(108, 'B-67D62F', 'Köprü', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(109, 'B-D4D6A8', 'Kapulukaya', 'Kırıkkale', '71', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(110, 'B-E81D9F', 'Manavgat', 'Antalya', '07', 'Antalya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(111, 'B-2250E2', 'Gökçeler', 'Antalya', '07', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(112, 'B-4ECAB7', 'Köprübaşı', 'Bolu', '14', 'Batı Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(113, 'B-A0E346', 'Tepekışla', 'Tokat', '60', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(114, 'B-9DA48B', 'Oymapınar', 'Antalya', '07', 'Antalya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(115, 'B-FC87FA', 'Boğazköy', 'Bursa', '16', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(116, 'B-577658', 'Kozan', 'Adana', '01', 'Ceyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(117, 'B-548259', 'Bayramhacılı Hes', 'Nevşehir', '50', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(118, 'B-5B1AF7', 'Güven Göleti', 'Samsun', '55', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(119, 'B-7333AC', 'Obruk', 'Çorum', '19', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(120, 'B-95538F', 'H.uğurlu', 'Samsun', '55', 'Yeşilırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(121, 'B-11BC96', 'Sarıyar', 'Eskişehir', '26', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(122, 'B-C663A1', 'Kürtün', 'Gümüşhane', '29', 'Doğu Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(123, 'B-DCFF57', 'Sır', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(124, 'B-FE9DE4', 'Çermikler', 'Sivas', '58', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(125, 'B-CE7077', 'Morgedik', 'Van', '65', 'Van Gölü', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(126, 'B-53A98C', 'Alaçatı Kutlu Aktaş Barajı', 'İzmir', '35', 'Küçük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(127, 'B-CE27A2', 'Çine Adnan Menderes', 'Aydın', '09', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(128, 'B-D5EC6C', 'Aladereçam', 'Gümüşhane', '29', 'Doğu Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(129, 'B-872C67', 'Gökçekaya', 'Eskişehir', '26', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(130, 'B-A9B3A0', 'Feke-2', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(131, 'B-755A16', 'Karacaören Iı', 'Burdur', '15', 'Antalya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(132, 'B-85CD38', 'Namazgah', 'Kocaeli', '41', '', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(133, 'B-B73CBA', 'Adıgüzel-2 Hes', 'Denizli', '20', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(134, 'B-64D87F', 'Boyabat', 'Sinop', '57', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(135, 'B-F4B19B', 'Alibey Barajı', 'İstanbul (avrupa)', '34', 'Alibey Deresi', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(136, 'B-C7CA57', 'Yenice', 'Eskişehir', '26', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(137, 'B-BC3D46', 'Adatepe', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(138, 'B-3EB0AE', 'Sarıgüzel Hes', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(139, 'B-607430', 'Altınapa', 'Konya', '42', 'Konya Kapalı', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(140, 'B-89D3AB', 'Düzbağ Kaynağı', 'Gaziantep', '27', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(141, 'B-B5C8D5', 'Kargı Barajı Ve Hes', 'Ankara', '06', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(142, 'B-1A232A', 'Terkos Barajı', 'İstanbul (avrupa)', '34', 'Terkos Havzası', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(143, 'B-EB1ECB', 'Karacaören I', 'Burdur', '15', 'Antalya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(144, 'B-32C50C', 'Kazandere Barajı', 'Kırklareli', '39', 'Kazandere', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(145, 'B-0EC449', 'Pabuçdere Barajı', 'Kırklareli', '39', 'Pabuçdere', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(146, 'B-FAE0D0', 'Büyükçekmece Barajı', 'İstanbul (avrupa)', '34', 'Büyükçekmece', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(147, 'B-86493B', 'Tahtalı Barajı', 'İzmir', '35', 'Küçük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(148, 'B-717A14', 'Güldürcek', 'Çankırı', '18', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(149, 'B-ACBEA9', 'Devecikonağı', 'Bursa', '16', 'Susurluk', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(150, 'B-A85818', 'Bozkır', 'Konya', '42', 'Konya Kapalı', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(151, 'B-B0A1D2', 'Sarımehmet', 'Van', '65', 'Van Gölü', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(152, 'B-A47C64', 'Menge Hes', 'Adana', '01', 'Seyhan', 100, 95.5, 'İyi', 'İzleniyor', '2026-06-08 08:22:48'),
(153, 'B-A2CA43', 'Sazlıdere Barajı', 'İstanbul (avrupa)', '34', 'Sazlıdere', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(154, 'B-26B13E', 'Gördes Barajı', 'Manisa', '45', 'Gediz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(155, 'B-C52CDA', 'Derbent', 'Samsun', '55', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(156, 'B-8EEF81', 'Gürsöğüt-1 Barajı', 'Ankara', '06', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(157, 'B-8B0608', 'Gezende', 'İçel', '33', 'Doğu Akdeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(158, 'B-ECE5DF', 'Kılavuzlu', 'Kahramanmaraş', '46', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(159, 'B-24596B', 'Altınkaya', 'Samsun', '55', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(160, 'B-0C535B', 'Araç Barajı', 'Kastamonu', '37', 'Batı Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(161, 'B-40E13A', 'Istrancalar Barajı', 'Kırklareli', '39', 'Istranca Dereleri', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(162, 'B-924939', 'Gürsöğüt-2', 'Ankara', '06', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(163, 'B-B5F0B1', 'Kirazlıköprü', 'Bartın', '74', 'Batı Karadeniz', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(164, 'B-31A35C', 'Hirfanlı', 'Ankara', '06', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(165, 'B-B67EA0', 'Gürsöğüt-1', 'Ankara', '06', 'Sakarya', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(166, 'B-0BB429', 'Bağbaşı', 'Konya', '42', 'Konya Kapalı', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(167, 'B-C0E5E5', 'Kartalkaya Barajı', 'Gaziantep', '27', 'Ceyhan', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(168, 'B-85114B', 'Mızmıllı Kuyuları', 'Gaziantep', '27', 'Bilinmiyor', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(169, 'B-8F46FA', 'Kargı Kızılırmak', 'Çorum', '19', 'Kızılırmak', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(170, 'B-4DA4D8', 'Şehırıçı Kuyuları', 'Gaziantep', '27', 'Bilinmiyor', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12'),
(171, 'B-6991B3', 'Adıgüzel', 'Denizli', '20', 'Büyük Menderes', 100, 50, 'İyi', 'İzleniyor', '2026-06-03 10:35:12');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cografi_bolgeler`
--

CREATE TABLE `cografi_bolgeler` (
  `id` int(11) NOT NULL,
  `kod` varchar(20) NOT NULL,
  `bolge_adi` varchar(50) NOT NULL,
  `ornek_sehir` varchar(100) NOT NULL,
  `enlem` float NOT NULL,
  `boylam` float NOT NULL,
  `varsayilan_not` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `cografi_bolgeler`
--

INSERT INTO `cografi_bolgeler` (`id`, `kod`, `bolge_adi`, `ornek_sehir`, `enlem`, `boylam`, `varsayilan_not`) VALUES
(1, 'marmara', 'Marmara Bölgesi', 'İstanbul & İzmit Havzası', 41.0082, 28.9784, '💨 Kuzeydoğulu poyraz rüzgarları aktif, sanayi havzalarında pus ve yüksek nem.'),
(2, 'ege', 'Ege Bölgesi', 'İzmir & Aydın Sahil Hattı', 38.4127, 27.1384, '☀️ Yüksek UV indeksi ve kesintisiz güneşlenme. Kıyılarda öğle saatlerinde imbat rüzgarı.'),
(3, 'akdeniz', 'Akdeniz Bölgesi', 'Antalya & Çukurova Deltası', 36.8841, 30.7056, '🌡️ Yüksek buharlaşma stresi ve termal yük. Tarımsal sulama ihtiyacı en üst düzeyde.'),
(4, 'icanadolu', 'İç Anadolu Bölgesi', 'Ankara & Konya Ovaları', 39.9208, 32.8541, '🌾 Gündüz belirgin termal ısınma, gece saatlerinde hızlı ışıma ile serinleme.'),
(5, 'karadeniz', 'Karadeniz Bölgesi', 'Samsun & Trabzon Sahil Hattı', 41.0015, 39.7178, '🌧️ Deniz üzerinden sürekli nem transferi, yamaç boyunca orografik sağanak geçişleri.'),
(6, 'doguanadolu', 'Doğu Anadolu Bölgesi', 'Erzurum & Van Yüksek Platosu', 39.9, 41.27, '🏔️ Yüksek rakıma bağlı düşük hava yoğunluğu ve serin hava koridoru.'),
(7, 'guneydogu', 'Güneydoğu Anadolu', 'Gaziantep & Şanlıurfa Havzası', 37.0662, 37.3833, '🏜️ Ekstrem sıcaklık değerleri ve güneyli hava akımlarıyla hafif toz taşınımı potansiyeli.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iklim_projeksiyon_sablonlari`
--

CREATE TABLE `iklim_projeksiyon_sablonlari` (
  `id` int(11) NOT NULL,
  `bolge` varchar(50) NOT NULL,
  `iklim_olayi` varchar(150) NOT NULL,
  `analiz` text NOT NULL,
  `aylar_sablonu_json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `iklim_projeksiyon_sablonlari`
--

INSERT INTO `iklim_projeksiyon_sablonlari` (`id`, `bolge`, `iklim_olayi`, `analiz`, `aylar_sablonu_json`) VALUES
(1, 'Akdeniz', 'Akdeniz Termal Isı Kubbesi & Subtropikal Yüksek Basınç', 'MeteoAI TR İklim Simülatörü, {SEHIR} sahil ve iç havzalarında önümüzdeki 3 aylık periyotta sıcaklıkların kademeli olarak artacağını ve ekstrem su buharlaşması yaşanacağını hesaplamıştır.', '[{\"sicaklik_sapmasi\":\"+1.6 °C\",\"sic_val\":1.6,\"yagis_sapmasi\":\"-20 %\",\"yag_val\":-20,\"ozet\":\"{AY1} döneminde subtropikal yüksek basınç etkisini göstermeye başlıyor. Kıyı şeridinde bağıl nem %80\'lere ulaşıyor, seralarda havalandırma ihtiyacı artıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Erken Termal Isınma\",\"detay\":\"Kıyı bandında hissedilen sıcaklıkların 35°C üzerine çıkması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Giriş Akımları\",\"detay\":\"Kar erimelerinin tamamlanmasıyla nehir debilerinde %20 azalış.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pamuk & Narenciye\",\"detay\":\"Erken gelişim evresinde artan sulama ve gübreleme ihtiyacı.\"}]},{\"sicaklik_sapmasi\":\"+2.8 °C\",\"sic_val\":2.8,\"yagis_sapmasi\":\"-35 %\",\"yag_val\":-35,\"ozet\":\"{AY2} boyunca sıcak hava dalgası kıyı ovalarını tamamen etkisi altına alıyor. Evapotranspirasyon (buharlaşma) en yüksek seviyede.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Isı & UV\",\"detay\":\"Güneş çarpması tehlikesi ve açık alan işçiliğinde kısıtlamalar.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Kanalları\",\"detay\":\"Aşırı buharlaşma sebebiyle sulama kanallarında su kotalarının devreye alınması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Termal Şok\",\"detay\":\"Meyve ağaçlarında yüksek sıcaklık kaynaklı ani dökülme ve güneş yanıklığı.\"}]},{\"sicaklik_sapmasi\":\"+3.4 °C\",\"sic_val\":3.4,\"yagis_sapmasi\":\"-45 %\",\"yag_val\":-45,\"ozet\":\"{AY3} genelinde deniz suyu ve atmosfer sıcaklıkları yüksek seyrediyor. Yüksek nem bunaltıcı bir atmosfer oluştururken orman yangını (FWI) indeksi tepe noktada.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Isısı\",\"detay\":\"Gece sıcaklıklarının 28°C altına inmemesi kaynaklı sürekli bunaltıcı hava.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Akiferleri\",\"detay\":\"Kuyu pompaj seviyelerinin en derin noktaya inmesi ve enerji sarfiyatı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Kuraklığı\",\"detay\":\"Ağaçlarda aşırı su stresi ve erken hasat planlaması zorunluluğu.\"}]}]'),
(2, 'Güneydoğu Anadolu', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', '{SEHIR} ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"sicaklik_sapmasi\":\"+2.1 °C\",\"sic_val\":2.1,\"yagis_sapmasi\":\"-25 %\",\"yag_val\":-25,\"ozet\":\"{AY1} itibarıyla karasal çöl iklimi dinamikleri başlıyor. Gündüz sıcaklıklarında belirgin artış ve yerel toz taşınımı görülebilir.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"}]},{\"sicaklik_sapmasi\":\"+3.5 °C\",\"sic_val\":3.5,\"yagis_sapmasi\":\"-45 %\",\"yag_val\":-45,\"ozet\":\"{AY2} genelinde Basra termal alçak basıncı bölgede tam hakim. Yüksek sıcaklıklar ve kuru rüzgarlar bitkisel su tüketimini artırıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"}]},{\"sicaklik_sapmasi\":\"+3.9 °C\",\"sic_val\":3.9,\"yagis_sapmasi\":\"-55 %\",\"yag_val\":-55,\"ozet\":\"{AY3} periyodunda uzun süreli kurak eğilim devam ediyor. Nehir akımlarında minimum debi seviyeleri ve yüksek buharlaşma kayıpları kaydediliyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]}]'),
(3, 'Karadeniz', 'Karadeniz Yüzey Isınması & Ani Konvektif Taşkınlar', 'Deniz yüzeyi sıcaklığındaki anormal artış, {SEHIR} yamaçlarında deniz etkili ani konvektif bulutlanmayı ve şiddetli lokal sağanakları tetiklemektedir.', '[{\"sicaklik_sapmasi\":\"+1.2 °C\",\"sic_val\":1.2,\"yagis_sapmasi\":\"+15 %\",\"yag_val\":15,\"ozet\":\"{AY1} döneminde deniz suyu yüzey değişimleriyle birlikte yerel konvektif kararsızlıklar ve lokal sağanak geçişleri yaşanıyor.\",\"riskler\":[{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Dere Havzaları\",\"detay\":\"Dik yamaçlarda saniyeler içinde ani sel ve taşkın oluşturma riski.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Çay & Fındık Terasları\",\"detay\":\"Aşırı nem ve ani sağanak geçişleri kaynaklı kök çürüklüğü ve mantar.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kıyı Isınması\",\"detay\":\"Güneşli periyotlarda hızla artan bağıl nem ve bunaltıcı hava.\"}]},{\"sicaklik_sapmasi\":\"+1.9 °C\",\"sic_val\":1.9,\"yagis_sapmasi\":\"-10 %\",\"yag_val\":-10,\"ozet\":\"{AY2} boyunca Karadeniz kıyılarında güneşlenme süresi artarken %85 üzeri bağıl nem bunaltıcı bir atmosfer oluşturuyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Yüksek Nem Stresi\",\"detay\":\"Sıcaklık 29°C olsa dahi %88 nem sebebiyle aşırı hissedilen sıcaklık.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Gelişimi\",\"detay\":\"İç kesimlerde lokal nem eksikliği, kıyılarda ise mantari enfeksiyon riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Lokal Akım Değişimi\",\"detay\":\"Vadi içlerinde ani yaz yağmurları ile taşkın kontrol noktalarının denetimi.\"}]},{\"sicaklik_sapmasi\":\"+2.4 °C\",\"sic_val\":2.4,\"yagis_sapmasi\":\"-15 %\",\"yag_val\":-15,\"ozet\":\"{AY3} genelinde su sıcaklığı yüksek seviyelerde olduğundan denizden beslenen lokal ani şimşekli sağanak patlamaları yaşanabilir.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Deniz Isı Birikimi\",\"detay\":\"Ilık deniz suyunun gece soğumasını engellemesi ve sürekli bunaltıcı hava.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Hasadı\",\"detay\":\"Hasat ve kurutma döneminde ani yağış geçişlerine karşı branda tedbiri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Ani Heyelan Riski\",\"detay\":\"Kısa sürede düşen lokal sağanakların toprağı doyurarak yamaç kayması yapması.\"}]}]'),
(4, 'Marmara', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre {SEHIR} ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"sicaklik_sapmasi\":\"+1.4 °C\",\"sic_val\":1.4,\"yagis_sapmasi\":\"-15 %\",\"yag_val\":-15,\"ozet\":\"{AY1} itibarıyla hava sistemlerinde geçiş dönemi yaşanıyor. Kısa süreli cephe hareketleri yerini ılık ve durgun havaya bırakıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"}]},{\"sicaklik_sapmasi\":\"+2.5 °C\",\"sic_val\":2.5,\"yagis_sapmasi\":\"-30 %\",\"yag_val\":-30,\"ozet\":\"{AY2} genelinde sıcak hava dalgaları kentsel alanlarda ısı adası etkisi oluşturarak gece sıcaklıklarının yüksek kalmasına neden oluyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"}]},{\"sicaklik_sapmasi\":\"+3.1 °C\",\"sic_val\":3.1,\"yagis_sapmasi\":\"-40 %\",\"yag_val\":-40,\"ozet\":\"{AY3} periyodunda yüksek nem ve durgun rüzgar rejimi baraj doluluk oranlarında hızlı tüketime ve su seviyelerinde azalışa yol açıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama energy maliyetlerinde yükseliş.\"}]}]'),
(5, 'Ege', 'Ege Termal Sırtı & Etezyen Rüzgar Rejimi Değişimi', '{SEHIR} havzası ve Ege kıyılarında Etezyen rüzgarlarının zayıflamasıyla anormal ısınma ve yaz ortası kuraklık stresi bekleniyor.', '[{\"sicaklik_sapmasi\":\"+1.9 °C\",\"sic_val\":1.9,\"yagis_sapmasi\":\"-20 %\",\"yag_val\":-20,\"ozet\":\"{AY1} döneminde Kuzey Ege\'de rüzgar rejimleri serinlik taşırken, Güney Ege ve iç ovalarda sıcak hava dalgaları erken başlıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"İç Ovalar Isınması\",\"detay\":\"Gediz ve Büyük Menderes ovalarında gündüz 38°C üzeri sıcaklıklar.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Zeytin Çiçeklenme\",\"detay\":\"Meyve tutumu döneminde kuru rüzgar ve ani ısınma kaynaklı dökülme riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Akiferleri\",\"detay\":\"Yaz dönemi tarımsal sulama pompajlarının devreye alınması.\"}]},{\"sicaklik_sapmasi\":\"+3.2 °C\",\"sic_val\":3.2,\"yagis_sapmasi\":\"-40 %\",\"yag_val\":-40,\"ozet\":\"{AY2} boyunca kuru ve sıcak hava akımları Ege kıyılarında ve ormanlık alanlarda ekstrem yangın riski (FWI) oluşturuyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Orman Yangını (FWI)\",\"detay\":\"Kuru poyraz ve 40°C sıcaklık sebebiyle çamlık alanlarda kırmızı alarm.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağlarda Yanıklık\",\"detay\":\"Üzüm salkımlarında doğrudan UV tahribatı ve gölgeleme filesi zorunluluğu.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Suyu Stresi\",\"detay\":\"Derin kuyu akiferlerinde statik su seviyelerinin hızla aşağı inmesi.\"}]},{\"sicaklik_sapmasi\":\"+3.6 °C\",\"sic_val\":3.6,\"yagis_sapmasi\":\"-45 %\",\"yag_val\":-45,\"ozet\":\"{AY3} genelinde turizm ve tarım havzalarında pik su tüketimi devam ediyor. Uzun süreli yağışsız periyot yeraltı su seviyelerini zorluyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Termal Kubbe\",\"detay\":\"Sahil bandında ve iç kesimlerde aralıksız süren ekstrem hava sıcaklığı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağbozumu Kalitesi\",\"detay\":\"Aşırı sıcağa bağlı şeker oranlarının erken yükselmesi ve erken hasat.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Kayıpları\",\"detay\":\"Tahtalı, Gördes ve Demirköprü barajlarında aktif hacmin %30 altına inmesi.\"}]}]'),
(6, 'Varsayilan', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, {SEHIR} kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"sicaklik_sapmasi\":\"+1.5 °C\",\"sic_val\":1.5,\"yagis_sapmasi\":\"-15 %\",\"yag_val\":-15,\"ozet\":\"{AY1} itibarıyla karasal iklimde gündüz ve gece sıcaklık farkı belirginleşiyor. Lokal konvektif yağış geçişleri takip ediliyor.\",\"riskler\":[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"}]},{\"sicaklik_sapmasi\":\"+2.7 °C\",\"sic_val\":2.7,\"yagis_sapmasi\":\"-35 %\",\"yag_val\":-35,\"ozet\":\"{AY2} genelinde Anadolu havzasında karasal sıcaklar hakim. Nem oranının düşmesiyle toprak yüzeyinde kuruma yaşanıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"}]},{\"sicaklik_sapmasi\":\"+3.2 °C\",\"sic_val\":3.2,\"yagis_sapmasi\":\"-40 %\",\"yag_val\":-40,\"ozet\":\"{AY3} periyodunda yağışsız geçen gün sayısı artarken yeraltı su pompaj maliyetleri ve tarımsal sulama ihtiyacı tepe noktaya ulaşıyor.\",\"riskler\":[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]}]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iller`
--

CREATE TABLE `iller` (
  `plaka_kodu` varchar(10) NOT NULL,
  `sehir_adi` varchar(100) NOT NULL,
  `enlem` decimal(10,6) NOT NULL,
  `boylam` decimal(10,6) NOT NULL,
  `bolge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `iller`
--

INSERT INTO `iller` (`plaka_kodu`, `sehir_adi`, `enlem`, `boylam`, `bolge`) VALUES
('01', 'Adana', 37.000000, 35.321300, 'Akdeniz'),
('02', 'Adıyaman', 37.764800, 38.278600, 'Güneydoğu Anadolu'),
('03', 'Afyonkarahisar', 38.750700, 30.556700, 'İç Anadolu'),
('04', 'Ağrı', 39.719100, 43.050300, 'Doğu Anadolu'),
('05', 'Amasya', 40.650000, 35.833300, 'Karadeniz'),
('06', 'Ankara', 39.933400, 32.859700, 'İç Anadolu'),
('07', 'Antalya', 36.884100, 30.705600, 'Akdeniz'),
('08', 'Artvin', 41.182800, 41.818300, 'Karadeniz'),
('09', 'Aydın', 37.844400, 27.845800, 'Ege'),
('10', 'Balıkesir', 39.648400, 27.882600, 'Marmara'),
('11', 'Bilecik', 40.145100, 29.979900, 'Marmara'),
('12', 'Bingöl', 38.884700, 40.493900, 'Doğu Anadolu'),
('13', 'Bitlis', 38.400600, 42.109500, 'Doğu Anadolu'),
('14', 'Bolu', 40.735000, 31.606100, 'Karadeniz'),
('15', 'Burdur', 37.720400, 30.290800, 'Akdeniz'),
('16', 'Bursa', 40.182400, 29.067100, 'Marmara'),
('17', 'Çanakkale', 40.155300, 26.414200, 'Marmara'),
('18', 'Çankırı', 40.601300, 33.613400, 'İç Anadolu'),
('19', 'Çorum', 40.550600, 34.955600, 'İç Anadolu'),
('20', 'Denizli', 37.776500, 29.086400, 'Ege'),
('21', 'Diyarbakır', 37.914400, 40.230600, 'Güneydoğu Anadolu'),
('22', 'Edirne', 41.677100, 26.555700, 'Marmara'),
('23', 'Elazığ', 38.674800, 39.222500, 'Doğu Anadolu'),
('24', 'Erzincan', 39.750000, 39.500000, 'Doğu Anadolu'),
('25', 'Erzurum', 39.904300, 41.267900, 'Doğu Anadolu'),
('26', 'Eskişehir', 39.776700, 30.520600, 'İç Anadolu'),
('27', 'Gaziantep', 37.066200, 37.383300, 'Güneydoğu Anadolu'),
('28', 'Giresun', 40.912800, 38.389700, 'Karadeniz'),
('29', 'Gümüşhane', 40.460000, 39.475800, 'Karadeniz'),
('30', 'Hakkari', 37.583300, 43.733300, 'Doğu Anadolu'),
('31', 'Hatay', 36.200000, 36.166700, 'Akdeniz'),
('32', 'Isparta', 37.766700, 30.550000, 'Akdeniz'),
('33', 'Mersin', 36.800000, 34.633300, 'Akdeniz'),
('34', 'İstanbul', 41.008200, 28.978400, 'Marmara'),
('35', 'İzmir', 38.418900, 27.128700, 'Ege'),
('36', 'Kars', 40.598300, 43.085300, 'Doğu Anadolu'),
('37', 'Kastamonu', 41.375600, 33.775300, 'Karadeniz'),
('38', 'Kayseri', 38.720700, 35.482600, 'İç Anadolu'),
('39', 'Kırklareli', 41.733300, 27.216700, 'Marmara'),
('40', 'Kırşehir', 39.145800, 34.163900, 'İç Anadolu'),
('41', 'Kocaeli', 40.853300, 29.881500, 'Marmara'),
('42', 'Konya', 37.866700, 32.483300, 'İç Anadolu'),
('43', 'Kütahya', 39.416700, 29.983300, 'İç Anadolu'),
('44', 'Malatya', 38.355200, 38.309500, 'Doğu Anadolu'),
('45', 'Manisa', 38.619100, 27.428900, 'Ege'),
('46', 'Kahramanmaraş', 37.585800, 36.937100, 'Akdeniz'),
('47', 'Mardin', 37.313100, 40.743600, 'Güneydoğu Anadolu'),
('48', 'Muğla', 37.215300, 28.363600, 'Ege'),
('49', 'Muş', 38.734600, 41.491000, 'Doğu Anadolu'),
('50', 'Nevşehir', 38.624400, 34.714400, 'İç Anadolu'),
('51', 'Niğde', 37.966700, 34.683300, 'İç Anadolu'),
('52', 'Ordu', 40.983900, 37.876400, 'Karadeniz'),
('53', 'Rize', 41.020100, 40.523400, 'Karadeniz'),
('54', 'Sakarya', 40.771400, 30.395600, 'Marmara'),
('55', 'Samsun', 41.286700, 36.330000, 'Karadeniz'),
('56', 'Siirt', 37.933300, 42.883300, 'Güneydoğu Anadolu'),
('57', 'Sinop', 42.026800, 35.155500, 'Karadeniz'),
('58', 'Sivas', 39.747700, 37.017900, 'İç Anadolu'),
('59', 'Tekirdağ', 40.978000, 27.508500, 'Marmara'),
('60', 'Tokat', 40.316700, 36.550000, 'Karadeniz'),
('61', 'Trabzon', 41.001500, 39.717800, 'Karadeniz'),
('62', 'Tunceli', 39.107900, 39.540100, 'Doğu Anadolu'),
('63', 'Şanlıurfa', 37.150000, 38.800000, 'Güneydoğu Anadolu'),
('64', 'Uşak', 38.682300, 29.408200, 'Ege'),
('65', 'Van', 38.489100, 43.388900, 'Doğu Anadolu'),
('66', 'Yozgat', 39.818100, 34.804200, 'İç Anadolu'),
('67', 'Zonguldak', 41.456400, 31.798700, 'Karadeniz'),
('68', 'Aksaray', 38.368700, 34.037000, 'İç Anadolu'),
('69', 'Bayburt', 40.260300, 40.228000, 'Karadeniz'),
('70', 'Karaman', 37.181100, 33.215000, 'İç Anadolu'),
('71', 'Kırıkkale', 39.845300, 33.515300, 'İç Anadolu'),
('72', 'Batman', 37.881200, 41.135100, 'Güneydoğu Anadolu'),
('73', 'Şırnak', 37.516700, 42.450000, 'Güneydoğu Anadolu'),
('74', 'Bartın', 41.634400, 32.337500, 'Karadeniz'),
('75', 'Ardahan', 41.110500, 42.702200, 'Doğu Anadolu'),
('76', 'Iğdır', 39.923700, 44.045000, 'Doğu Anadolu'),
('77', 'Yalova', 40.655600, 29.276900, 'Marmara'),
('78', 'Karabük', 41.206100, 32.622800, 'Karadeniz'),
('79', 'Kilis', 36.718400, 37.114700, 'Güneydoğu Anadolu'),
('80', 'Osmaniye', 37.074200, 36.246400, 'Akdeniz'),
('81', 'Düzce', 40.838900, 31.156100, 'Karadeniz');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mevsimsel_projeksiyonlar`
--

CREATE TABLE `mevsimsel_projeksiyonlar` (
  `plaka_kodu` varchar(10) NOT NULL,
  `sicaklik_sapmasi` varchar(50) NOT NULL,
  `yagis_sapmasi` varchar(50) NOT NULL,
  `iklim_olayi` varchar(255) NOT NULL,
  `analiz_metni` text NOT NULL,
  `bolgesel_riskler_json` text NOT NULL,
  `son_guncelleme` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `mevsimsel_projeksiyonlar`
--

INSERT INTO `mevsimsel_projeksiyonlar` (`plaka_kodu`, `sicaklik_sapmasi`, `yagis_sapmasi`, `iklim_olayi`, `analiz_metni`, `bolgesel_riskler_json`, `son_guncelleme`) VALUES
('01', '+2.6 °C', '-33 %', 'Akdeniz Termal Isı Kubbesi & Subtropikal Yüksek Basınç', 'MeteoAI TR İklim Simülatörü, Adana sahil ve iç havzalarında önümüzdeki 3 aylık periyotta sıcaklıkların kademeli olarak artacağını ve ekstrem su buharlaşması yaşanacağını hesaplamıştır.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Erken Termal Isınma\",\"detay\":\"Kıyı bandında hissedilen sıcaklıkların 35°C üzerine çıkması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Giriş Akımları\",\"detay\":\"Kar erimelerinin tamamlanmasıyla nehir debilerinde %20 azalış.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pamuk & Narenciye\",\"detay\":\"Erken gelişim evresinde artan sulama ve gübreleme ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Isı & UV\",\"detay\":\"Güneş çarpması tehlikesi ve açık alan işçiliğinde kısıtlamalar.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Kanalları\",\"detay\":\"Aşırı buharlaşma sebebiyle sulama kanallarında su kotalarının devreye alınması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Termal Şok\",\"detay\":\"Meyve ağaçlarında yüksek sıcaklık kaynaklı ani dökülme ve güneş yanıklığı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Isısı\",\"detay\":\"Gece sıcaklıklarının 28°C altına inmemesi kaynaklı sürekli bunaltıcı hava.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Akiferleri\",\"detay\":\"Kuyu pompaj seviyelerinin en derin noktaya inmesi ve enerji sarfiyatı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Kuraklığı\",\"detay\":\"Ağaçlarda aşırı su stresi ve erken hasat planlaması zorunluluğu.\"}]', '2026-06-08 20:43:28'),
('02', '+3.2 °C', '-42 %', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', 'Adıyaman ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]', '2026-05-23 19:01:36'),
('03', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Afyonkarahisar kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 08:14:43'),
('04', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Ağrı kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 08:18:04'),
('05', '+1.8 °C', '-3 %', 'Karadeniz Yüzey Isınması & Ani Konvektif Taşkınlar', 'Deniz yüzeyi sıcaklığındaki anormal artış, Amasya yamaçlarında deniz etkili ani konvektif bulutlanmayı ve şiddetli lokal sağanakları tetiklemektedir.', '[{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Dere Havzaları\",\"detay\":\"Dik yamaçlarda saniyeler içinde ani sel ve taşkın oluşturma riski.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Çay & Fındık Terasları\",\"detay\":\"Aşırı nem ve ani sağanak geçişleri kaynaklı kök çürüklüğü ve mantar.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kıyı Isınması\",\"detay\":\"Güneşli periyotlarda hızla artan bağıl nem ve bunaltıcı hava.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Yüksek Nem Stresi\",\"detay\":\"Sıcaklık 29°C olsa dahi %88 nem sebebiyle aşırı hissedilen sıcaklık.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Gelişimi\",\"detay\":\"İç kesimlerde lokal nem eksikliği, kıyılarda ise mantari enfeksiyon riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Lokal Akım Değişimi\",\"detay\":\"Vadi içlerinde ani yaz yağmurları ile taşkın kontrol noktalarının denetimi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Deniz Isı Birikimi\",\"detay\":\"Ilık deniz suyunun gece soğumasını engellemesi ve sürekli bunaltıcı hava.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Hasadı\",\"detay\":\"Hasat ve kurutma döneminde ani yağış geçişlerine karşı branda tedbiri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Ani Heyelan Riski\",\"detay\":\"Kısa sürede düşen lokal sağanakların toprağı doyurarak yamaç kayması yapması.\"}]', '2026-05-23 14:21:08'),
('06', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Ankara kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 07:12:40'),
('07', '+2.6 °C', '-33 %', 'Akdeniz Termal Isı Kubbesi & Subtropikal Yüksek Basınç', 'MeteoAI TR İklim Simülatörü, Antalya sahil ve iç havzalarında önümüzdeki 3 aylık periyotta sıcaklıkların kademeli olarak artacağını ve ekstrem su buharlaşması yaşanacağını hesaplamıştır.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Erken Termal Isınma\",\"detay\":\"Kıyı bandında hissedilen sıcaklıkların 35°C üzerine çıkması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Giriş Akımları\",\"detay\":\"Kar erimelerinin tamamlanmasıyla nehir debilerinde %20 azalış.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pamuk & Narenciye\",\"detay\":\"Erken gelişim evresinde artan sulama ve gübreleme ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Isı & UV\",\"detay\":\"Güneş çarpması tehlikesi ve açık alan işçiliğinde kısıtlamalar.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Kanalları\",\"detay\":\"Aşırı buharlaşma sebebiyle sulama kanallarında su kotalarının devreye alınması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Termal Şok\",\"detay\":\"Meyve ağaçlarında yüksek sıcaklık kaynaklı ani dökülme ve güneş yanıklığı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Isısı\",\"detay\":\"Gece sıcaklıklarının 28°C altına inmemesi kaynaklı sürekli bunaltıcı hava.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Akiferleri\",\"detay\":\"Kuyu pompaj seviyelerinin en derin noktaya inmesi ve enerji sarfiyatı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Kuraklığı\",\"detay\":\"Ağaçlarda aşırı su stresi ve erken hasat planlaması zorunluluğu.\"}]', '2026-06-08 08:46:18'),
('08', '+1.8 °C', '-3 %', 'Karadeniz Yüzey Isınması & Ani Konvektif Taşkınlar', 'Deniz yüzeyi sıcaklığındaki anormal artış, Artvin yamaçlarında deniz etkili ani konvektif bulutlanmayı tetiklemektedir. Sıcaklıkların +1.8°C artması ve yağışlarda %-3 değişim beklenmektedir.', '[{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Artvin Eğimli Dere Havzaları\",\"detay\":\"Denizden taşınan yoğun nemin dik yamaçlarda saniyeler içinde ani sel ve taşkın oluşturma riski.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık & Çay Terasları\",\"detay\":\"Aşırı nem ve ani sağanak geçişleri kaynaklı kök çürüklüğü ve mantari hastalık yayılımı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kıyı Şeridi Yüksek Bağıl Nem Stresi\",\"detay\":\"Sıcaklık 30°C olsa dahi %85 nem sebebiyle bunaltıcı hissedilen hava koşulları.\"}]', '2026-05-18 14:57:09'),
('10', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre Balıkesir ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama energy maliyetlerinde yükseliş.\"}]', '2026-05-23 14:22:11'),
('13', '+1.8 °C', '-26 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Bitlis kapalı havzasında +1.8°C sıcaklık sapması ve %-26 yağış noksanlığı hesaplamıştır. Karasal step ikliminde tarımsal kuraklık alarmı aktiftir.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bitlis Buğday \\/ Arpa Ekim Sahaları\",\"detay\":\"Kritik başaklanma ve büyüme evresinde yağış yetersizliğine bağlı rekolte daralması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Su Tablaları\",\"detay\":\"Aşırı yeraltı suyu çekimi ve kuraklık sebebiyle obruk oluşumu ve gölet kurumaları.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz \\/ Gece Aşırı Isı Farkı\",\"detay\":\"Gündüz 38°C, gece 12°C seviyesinde ani termal genleşme ve bitkisel donma stresi.\"}]', '2026-05-18 14:57:19'),
('16', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre Bursa ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama energy maliyetlerinde yükseliş.\"}]', '2026-05-19 08:16:50'),
('17', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre Çanakkale ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama energy maliyetlerinde yükseliş.\"}]', '2026-05-19 08:00:40'),
('27', '+3.2 °C', '-42 %', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', 'Gaziantep ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]', '2026-05-19 08:02:02'),
('29', '+1.8 °C', '-3 %', 'Karadeniz Yüzey Isınması & Ani Konvektif Taşkınlar', 'Deniz yüzeyi sıcaklığındaki anormal artış, Gümüşhane yamaçlarında deniz etkili ani konvektif bulutlanmayı ve şiddetli lokal sağanakları tetiklemektedir.', '[{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Dere Havzaları\",\"detay\":\"Dik yamaçlarda saniyeler içinde ani sel ve taşkın oluşturma riski.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Çay & Fındık Terasları\",\"detay\":\"Aşırı nem ve ani sağanak geçişleri kaynaklı kök çürüklüğü ve mantar.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kıyı Isınması\",\"detay\":\"Güneşli periyotlarda hızla artan bağıl nem ve bunaltıcı hava.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Yüksek Nem Stresi\",\"detay\":\"Sıcaklık 29°C olsa dahi %88 nem sebebiyle aşırı hissedilen sıcaklık.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Gelişimi\",\"detay\":\"İç kesimlerde lokal nem eksikliği, kıyılarda ise mantari enfeksiyon riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Lokal Akım Değişimi\",\"detay\":\"Vadi içlerinde ani yaz yağmurları ile taşkın kontrol noktalarının denetimi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Deniz Isı Birikimi\",\"detay\":\"Ilık deniz suyunun gece soğumasını engellemesi ve sürekli bunaltıcı hava.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Hasadı\",\"detay\":\"Hasat ve kurutma döneminde ani yağış geçişlerine karşı branda tedbiri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Ani Heyelan Riski\",\"detay\":\"Kısa sürede düşen lokal sağanakların toprağı doyurarak yamaç kayması yapması.\"}]', '2026-05-19 08:03:16'),
('34', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre İstanbul ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama energy maliyetlerinde yükseliş.\"}]', '2026-05-21 06:16:21'),
('35', '+2.9 °C', '-35 %', 'Ege Termal Sırtı & Etezyen Rüzgar Rejimi Değişimi', 'İzmir havzası ve Ege kıyılarında Etezyen rüzgarlarının zayıflamasıyla anormal ısınma ve yaz ortası kuraklık stresi bekleniyor.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"İç Ovalar Isınması\",\"detay\":\"Gediz ve Büyük Menderes ovalarında gündüz 38°C üzeri sıcaklıklar.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Zeytin Çiçeklenme\",\"detay\":\"Meyve tutumu döneminde kuru rüzgar ve ani ısınma kaynaklı dökülme riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Akiferleri\",\"detay\":\"Yaz dönemi tarımsal sulama pompajlarının devreye alınması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Orman Yangını (FWI)\",\"detay\":\"Kuru poyraz ve 40°C sıcaklık sebebiyle çamlık alanlarda kırmızı alarm.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağlarda Yanıklık\",\"detay\":\"Üzüm salkımlarında doğrudan UV tahribatı ve gölgeleme filesi zorunluluğu.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Suyu Stresi\",\"detay\":\"Derin kuyu akiferlerinde statik su seviyelerinin hızla aşağı inmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Termal Kubbe\",\"detay\":\"Sahil bandında ve iç kesimlerde aralıksız süren ekstrem hava sıcaklığı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağbozumu Kalitesi\",\"detay\":\"Aşırı sıcağa bağlı şeker oranlarının erken yükselmesi ve erken hasat.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Kayıpları\",\"detay\":\"Tahtalı, Gördes ve Demirköprü barajlarında aktif hacmin %30 altına inmesi.\"}]', '2026-05-23 14:22:21'),
('36', '+2.1 °C', '-18 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Kars kapalı havzasında +2.1°C sıcaklık sapması ve %-18 yağış noksanlığı hesaplamıştır. Karasal step ikliminde tarımsal kuraklık alarmı aktiftir.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Kars Buğday \\/ Arpa Ekim Sahaları\",\"detay\":\"Kritik başaklanma ve büyüme evresinde yağış yetersizliğine bağlı rekolte daralması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Su Tablaları\",\"detay\":\"Aşırı yeraltı suyu çekimi ve kuraklık sebebiyle obruk oluşumu ve gölet kurumaları.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz \\/ Gece Aşırı Isı Farkı\",\"detay\":\"Gündüz 38°C, gece 12°C seviyesinde ani termal genleşme ve bitkisel donma stresi.\"}]', '2026-05-18 14:27:19'),
('38', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Kayseri kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 08:18:17'),
('39', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre Kırklareli ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama enerji maliyetlerinde yükseliş.\"}]', '2026-05-18 22:30:18'),
('41', '+2.3 °C', '-28 %', 'Balkan Alçak Basıncı & Kentsel Isı Koridoru', 'MeteoAI TR otonom analizine göre Kocaeli ve Marmara metropol havzasında 3 aylık periyotta kademeli ısınma ve baraj rezervlerinde hızlı tüketim öngörülmektedir.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Metropol Isı Adası\",\"detay\":\"Asfalt ve beton yoğunluğuna bağlı olarak kentsel alanlarda fazladan +2°C ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Rezerv Takibi\",\"detay\":\"İstanbul ve Bursa su havzalarında yaz başı doluluk seviyelerinin korunması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Ayçiçeği\",\"detay\":\"Erken gelişim evresinde optimum kök nemi ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Stresi\",\"detay\":\"Gece saatlerinde dahi yüksek devam eden nem ve 26°C üzeri sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Pik Su Tüketimi\",\"detay\":\"Büyükşehirlerde su şebekesinde rekor günlük sarfiyat ve basınç düşüşü.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Trakya Kuraklığı\",\"detay\":\"Ayçiçeği tane bağlama döneminde yağışsız periyot kaynaklı verim stresi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Durgun Hava & Nem\",\"detay\":\"Rüzgarsız günlerde hava kirliliği birikimi ve yüksek hissedilen sıcaklık.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kritik Rezerv İnişi\",\"detay\":\"İçme suyu barajlarında doluluk oranlarının %60 seviyesinin altına gerilemesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Yeraltı Su Çekimi\",\"detay\":\"Kuyularda derinleşme ve zirai sulama enerji maliyetlerinde yükseliş.\"}]', '2026-05-19 07:10:34'),
('42', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Konya kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-20 20:49:45'),
('43', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Kütahya kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 08:18:44'),
('44', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Malatya kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-05-19 08:08:50'),
('45', '+2.9 °C', '-35 %', 'Ege Termal Sırtı & Etezyen Rüzgar Rejimi Değişimi', 'Manisa havzası ve Ege kıyılarında Etezyen rüzgarlarının zayıflamasıyla anormal ısınma ve yaz ortası kuraklık stresi bekleniyor.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"İç Ovalar Isınması\",\"detay\":\"Gediz ve Büyük Menderes ovalarında gündüz 38°C üzeri sıcaklıklar.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Zeytin Çiçeklenme\",\"detay\":\"Meyve tutumu döneminde kuru rüzgar ve ani ısınma kaynaklı dökülme riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Akiferleri\",\"detay\":\"Yaz dönemi tarımsal sulama pompajlarının devreye alınması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Orman Yangını (FWI)\",\"detay\":\"Kuru poyraz ve 40°C sıcaklık sebebiyle çamlık alanlarda kırmızı alarm.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağlarda Yanıklık\",\"detay\":\"Üzüm salkımlarında doğrudan UV tahribatı ve gölgeleme filesi zorunluluğu.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Suyu Stresi\",\"detay\":\"Derin kuyu akiferlerinde statik su seviyelerinin hızla aşağı inmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Termal Kubbe\",\"detay\":\"Sahil bandında ve iç kesimlerde aralıksız süren ekstrem hava sıcaklığı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağbozumu Kalitesi\",\"detay\":\"Aşırı sıcağa bağlı şeker oranlarının erken yükselmesi ve erken hasat.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Kayıpları\",\"detay\":\"Tahtalı, Gördes ve Demirköprü barajlarında aktif hacmin %30 altına inmesi.\"}]', '2026-05-19 08:18:40'),
('46', '+2.6 °C', '-33 %', 'Akdeniz Termal Isı Kubbesi & Subtropikal Yüksek Basınç', 'MeteoAI TR İklim Simülatörü, Kahramanmaraş sahil ve iç havzalarında önümüzdeki 3 aylık periyotta sıcaklıkların kademeli olarak artacağını ve ekstrem su buharlaşması yaşanacağını hesaplamıştır.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Erken Termal Isınma\",\"detay\":\"Kıyı bandında hissedilen sıcaklıkların 35°C üzerine çıkması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Giriş Akımları\",\"detay\":\"Kar erimelerinin tamamlanmasıyla nehir debilerinde %20 azalış.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pamuk & Narenciye\",\"detay\":\"Erken gelişim evresinde artan sulama ve gübreleme ihtiyacı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Isı & UV\",\"detay\":\"Güneş çarpması tehlikesi ve açık alan işçiliğinde kısıtlamalar.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Kanalları\",\"detay\":\"Aşırı buharlaşma sebebiyle sulama kanallarında su kotalarının devreye alınması.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Termal Şok\",\"detay\":\"Meyve ağaçlarında yüksek sıcaklık kaynaklı ani dökülme ve güneş yanıklığı.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Tropikal Gece Isısı\",\"detay\":\"Gece sıcaklıklarının 28°C altına inmemesi kaynaklı sürekli bunaltıcı hava.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Akiferleri\",\"detay\":\"Kuyu pompaj seviyelerinin en derin noktaya inmesi ve enerji sarfiyatı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Kuraklığı\",\"detay\":\"Ağaçlarda aşırı su stresi ve erken hasat planlaması zorunluluğu.\"}]', '2026-05-19 08:26:03'),
('47', '+3.2 °C', '-42 %', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', 'Mardin ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]', '2026-05-19 08:18:37'),
('48', '+2.9 °C', '-35 %', 'Ege Termal Sırtı & Etezyen Rüzgar Rejimi Değişimi', 'Muğla havzası ve Ege kıyılarında Etezyen rüzgarlarının zayıflamasıyla anormal ısınma ve yaz ortası kuraklık stresi bekleniyor.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"İç Ovalar Isınması\",\"detay\":\"Gediz ve Büyük Menderes ovalarında gündüz 38°C üzeri sıcaklıklar.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Zeytin Çiçeklenme\",\"detay\":\"Meyve tutumu döneminde kuru rüzgar ve ani ısınma kaynaklı dökülme riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Akiferleri\",\"detay\":\"Yaz dönemi tarımsal sulama pompajlarının devreye alınması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Orman Yangını (FWI)\",\"detay\":\"Kuru poyraz ve 40°C sıcaklık sebebiyle çamlık alanlarda kırmızı alarm.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağlarda Yanıklık\",\"detay\":\"Üzüm salkımlarında doğrudan UV tahribatı ve gölgeleme filesi zorunluluğu.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Yeraltı Suyu Stresi\",\"detay\":\"Derin kuyu akiferlerinde statik su seviyelerinin hızla aşağı inmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Ekstrem Termal Kubbe\",\"detay\":\"Sahil bandında ve iç kesimlerde aralıksız süren ekstrem hava sıcaklığı.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Bağbozumu Kalitesi\",\"detay\":\"Aşırı sıcağa bağlı şeker oranlarının erken yükselmesi ve erken hasat.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Baraj Kayıpları\",\"detay\":\"Tahtalı, Gördes ve Demirköprü barajlarında aktif hacmin %30 altına inmesi.\"}]', '2026-05-19 08:09:17'),
('51', '+1.8 °C', '-17 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Niğde kapalı havzasında +1.8°C sıcaklık sapması ve %-17 yağış noksanlığı hesaplamıştır. Karasal step ikliminde tarımsal kuraklık alarmı aktiftir.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Niğde Buğday \\/ Arpa Ekim Sahaları\",\"detay\":\"Kritik başaklanma ve büyüme evresinde yağış yetersizliğine bağlı rekolte daralması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Su Tablaları\",\"detay\":\"Aşırı yeraltı suyu çekimi ve kuraklık sebebiyle obruk oluşumu ve gölet kurumaları.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz \\/ Gece Aşırı Isı Farkı\",\"detay\":\"Gündüz 38°C, gece 12°C seviyesinde ani termal genleşme ve bitkisel donma stresi.\"}]', '2026-05-18 14:27:52'),
('56', '+3.2 °C', '-42 %', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', 'Siirt ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]', '2026-05-19 08:10:23'),
('60', '+1.8 °C', '-3 %', 'Karadeniz Yüzey Isınması & Ani Konvektif Taşkınlar', 'Deniz yüzeyi sıcaklığındaki anormal artış, Tokat yamaçlarında deniz etkili ani konvektif bulutlanmayı ve şiddetli lokal sağanakları tetiklemektedir.', '[{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Dere Havzaları\",\"detay\":\"Dik yamaçlarda saniyeler içinde ani sel ve taşkın oluşturma riski.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Çay & Fındık Terasları\",\"detay\":\"Aşırı nem ve ani sağanak geçişleri kaynaklı kök çürüklüğü ve mantar.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kıyı Isınması\",\"detay\":\"Güneşli periyotlarda hızla artan bağıl nem ve bunaltıcı hava.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Yüksek Nem Stresi\",\"detay\":\"Sıcaklık 29°C olsa dahi %88 nem sebebiyle aşırı hissedilen sıcaklık.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Gelişimi\",\"detay\":\"İç kesimlerde lokal nem eksikliği, kıyılarda ise mantari enfeksiyon riski.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Lokal Akım Değişimi\",\"detay\":\"Vadi içlerinde ani yaz yağmurları ile taşkın kontrol noktalarının denetimi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Deniz Isı Birikimi\",\"detay\":\"Ilık deniz suyunun gece soğumasını engellemesi ve sürekli bunaltıcı hava.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Fındık Hasadı\",\"detay\":\"Hasat ve kurutma döneminde ani yağış geçişlerine karşı branda tedbiri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Ani Heyelan Riski\",\"detay\":\"Kısa sürede düşen lokal sağanakların toprağı doyurarak yamaç kayması yapması.\"}]', '2026-05-23 13:34:40');
INSERT INTO `mevsimsel_projeksiyonlar` (`plaka_kodu`, `sicaklik_sapmasi`, `yagis_sapmasi`, `iklim_olayi`, `analiz_metni`, `bolgesel_riskler_json`, `son_guncelleme`) VALUES
('62', '+1.3 °C', '-18 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Tunceli kapalı havzasında +1.3°C sıcaklık sapması ve %-18 yağış noksanlığı hesaplamıştır. Karasal step ikliminde tarımsal kuraklık alarmı aktiftir.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Tunceli Buğday \\/ Arpa Ekim Sahaları\",\"detay\":\"Kritik başaklanma ve büyüme evresinde yağış yetersizliğine bağlı rekolte daralması.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Su Tablaları\",\"detay\":\"Aşırı yeraltı suyu çekimi ve kuraklık sebebiyle obruk oluşumu ve gölet kurumaları.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz \\/ Gece Aşırı Isı Farkı\",\"detay\":\"Gündüz 38°C, gece 12°C seviyesinde ani termal genleşme ve bitkisel donma stresi.\"}]', '2026-05-18 15:15:31'),
('70', '+2.5 °C', '-30 %', 'Karasal Yüksek Basınç & Zirai Nem Eksikliği', 'MeteoAI derin öğrenme simülasyonu, Karaman kapalı havzasında karasal sıcaklık dalgaları ve belirgin nem noksanlığı hesaplamıştır.', '[{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hububat Su İhtiyacı\",\"detay\":\"Buğday ve arpada tane dolum evresinde azalan yağışlar kaynaklı verim takibi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Kapalı Havza Akımları\",\"detay\":\"Kızılırmak ve Sakarya kollarında erken yaz su seviyesi düşüşleri.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Gündüz\\/Gece Farkı\",\"detay\":\"Gündüz 33°C, gece 14°C olan karasal ani genleşme ve bitkisel stres.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kavurucu Kuraklık\",\"detay\":\"Toprak nem indeksi (SMI) aşırı kurak aralığa geçiyor.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Hasat Dönemi\",\"detay\":\"Ekinlerin kurumasıyla hasat periyodunun hızlandırılması ve yangın önlemleri.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Obruk & Yeraltı Suyu\",\"detay\":\"Konya havzasında aşırı kuyu çekimi sebebiyle yeraltı boşluklarının tetiklenmesi.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Step Isı Birikimi\",\"detay\":\"Gündüz sürekli 37°C üzeri sıcaklık ve yüksek güneşlenme süresi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Pancar & Mısır Sulama\",\"detay\":\"Geniş yapraklı sanayi bitkilerinde yoğun sulama suyu sarfiyatı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Gölet ve Sulaklar\",\"detay\":\"Tuz Gölü havzası ve sulak alanlarda tam kuruma ve tuz tabakası oluşumu.\"}]', '2026-06-08 08:46:52'),
('72', '+3.2 °C', '-42 %', 'Basra Alçak Basınç Kuşağı & Çöl Sıcaklığı Dalgaları', 'Batman ovasında Afrika ve Basra kökenli ekstrem sıcak hava dalgalarının 3 ay boyunca etkili olması bekleniyor. Normallerden yüksek sapma ve kuraklık eğilimi hakim.', '[{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"GAP Sıcaklık Dalgası\",\"detay\":\"Gündüz UV maruziyeti ve asfalt\\/beton yüzeylerde ekstrem ısınma.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Atatürk & Karakaya HES\",\"detay\":\"Baraj göllerinde buharlaşma kayıplarını en aza indirmek için seviye yönetimi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Buğday Hasadı\",\"detay\":\"Hızlı kuruma ve olgunlaşma sebebiyle hasat makinelerinin aralıksız çalışması.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Çöl Isı Dalgaları\",\"detay\":\"Termal şok tehlikesi ve gün ortasında tarımsal faaliyet yasağı.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Sulama Pompajı\",\"detay\":\"Elektrik şebekesinde tarımsal sulama kaynaklı ekstrem anlık yük yüklenmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Mısır & Pamuk Stresi\",\"detay\":\"Gündüz solgunluğu ve gece sulamasına geçiş mecburiyeti.\"},{\"kategori\":\"Sıcaklık\",\"ikon\":\"thermometer-sun\",\"baslik\":\"Kesintisiz Sıcaklık\",\"detay\":\"Gece ve gündüz sürekli devam eden sıcak hava stresi.\"},{\"kategori\":\"Su\",\"ikon\":\"droplets\",\"baslik\":\"Fırat \\/ Dicle Akımları\",\"detay\":\"Nehir yataklarında akım debilerinin mevsim normallerinin en altına inmesi.\"},{\"kategori\":\"Zirai\",\"ikon\":\"wheat\",\"baslik\":\"Güneş Yanıklığı\",\"detay\":\"Açık alan ürünlerinde meyve\\/yaprak yüzeylerinde güneş yanığı tahribatı.\"}]', '2026-05-19 00:10:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `model_karsilastirmalari`
--

CREATE TABLE `model_karsilastirmalari` (
  `id` int(11) NOT NULL,
  `gun` varchar(20) NOT NULL,
  `ecmwf` float NOT NULL,
  `gfs` float NOT NULL,
  `meteo_ai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `model_karsilastirmalari`
--

INSERT INTO `model_karsilastirmalari` (`id`, `gun`, `ecmwf`, `gfs`, `meteo_ai`) VALUES
(1, '1. Gün', 94.2, 91.5, 98.1),
(2, '3. Gün', 89.4, 86.2, 96),
(3, '5. Gün', 83, 80.1, 93.4),
(4, '7. Gün', 77.5, 74, 89.8),
(5, '10. Gün', 69.1, 65.8, 85.2),
(6, '15. Gün', 58, 53.5, 78.6),
(7, '20. Gün', 47.2, 42, 71.5),
(8, '30. Gün', 37, 32.5, 63.4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sektorel_uyarilar`
--

CREATE TABLE `sektorel_uyarilar` (
  `uyari_id` varchar(20) NOT NULL,
  `sektor` varchar(50) NOT NULL,
  `tehlike_seviyesi` varchar(50) NOT NULL,
  `etkilenen_bolge` varchar(100) NOT NULL,
  `baslik` varchar(200) NOT NULL,
  `aciklama` text NOT NULL,
  `uyari_tarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sektorel_uyarilar`
--

INSERT INTO `sektorel_uyarilar` (`uyari_id`, `sektor`, `tehlike_seviyesi`, `etkilenen_bolge`, `baslik`, `aciklama`, `uyari_tarihi`) VALUES
('AI-AFET-OK-01', 'Afet', '🟢 SÜKUNET', 'Adana İl Geneli & Kentsel Altyapı', 'MeteoAI Doğal Afet Sensörü: Atmosferik Sükunet', 'Anlık atmosferik ve sinoptik radar taramalarında Adana havzası için çığ, sel veya fırtına riski saptanmamıştır. Ulaşım ve kentsel altyapı faaliyetleri tam güvenlik altında sürdürülebilir. [AI Algoritma Güveni: %99.8]', '2026-06-08'),
('AI-ENJ-GES-HOT-01', 'Enerji', '🟡 ORTA RİSK', 'Adana Güneş Enerji Santralleri (GES)', 'MeteoAI GES Termal Isınma ve Verim Kaybı Analizi', 'Yapay zeka simülatörüne göre fotovoltaik panellerin yüzey sıcaklığı 56°C seviyesine ulaşmıştır. Aşırı ısınma kaynaklı anlık fotovoltaik verim kaybı %13 olarak hesaplanmıştır.', '2026-06-08'),
('AI-ENJ-GES-OPT-01', 'Enerji', '🟢 İDEAL', 'Adana Güneş Enerji Santralleri (GES)', 'MeteoAI GES Raporu: İdeal Fotovoltaik Verimlilik', 'Hava sıcaklığının 22.1°C seviyesinde olması, fotovoltaik panellerin aşırı ısınmadan (termal stres yaşamadan) %95.4 üzeri nominal verimlilikle güneş enerjisi hasadı yapmasını sağlamaktadır.', '2026-06-08'),
('AI-ENJ-GES-OPT-07', 'Enerji', '🟢 İDEAL', 'Antalya Güneş Enerji Santralleri (GES)', 'MeteoAI GES Raporu: İdeal Fotovoltaik Verimlilik', 'Hava sıcaklığının 26.6°C seviyesinde olması, fotovoltaik panellerin aşırı ısınmadan (termal stres yaşamadan) %95.4 üzeri nominal verimlilikle güneş enerjisi hasadı yapmasını sağlamaktadır.', '2026-06-08'),
('AI-ENJ-GES-OPT-70', 'Enerji', '🟢 İDEAL', 'Karaman Güneş Enerji Santralleri (GES)', 'MeteoAI GES Raporu: İdeal Fotovoltaik Verimlilik', 'Hava sıcaklığının 27.4°C seviyesinde olması, fotovoltaik panellerin aşırı ısınmadan (termal stres yaşamadan) %95.4 üzeri nominal verimlilikle güneş enerjisi hasadı yapmasını sağlamaktadır.', '2026-06-08'),
('AI-ENJ-RES-07', 'Enerji', '⚡ YÜKSEK POTANSİYEL', 'Antalya Rüzgar Enerji Santralleri (RES)', 'MeteoAI Otonom Rüzgar Türbini (RES) Üretim Raporu', '10m seviyesinde 14 km/s olarak ölçülen rüzgar hızı koridoru, Antalya yamaçlarındaki rüzgar türbinlerinin yaklaşık %45 aktif kapasiteyle elektrik üretimine olanak tanımaktadır. Türbin kanat açıları (pitch) optimum seviyeye ayarlanmıştır.', '2026-06-08'),
('AI-ENJ-RES-LOW-01', 'Enerji', '🔵 BİLGİLENDİRME', 'Adana Rüzgar Enerji Santralleri (RES)', 'MeteoAI RES Raporu: Düşük Rüzgar Rejimi', 'Anlık rüzgar hızının 3 km/s seviyesinde seyretmesi, RES türbinlerinde minimum üretim modunu işaret etmektedir. Enterkonekte şebekede yük dengelemesi için GES santralleri önceliklendirilmektedir.', '2026-06-08'),
('AI-ENJ-RES-LOW-07', 'Enerji', '🔵 BİLGİLENDİRME', 'Antalya Rüzgar Enerji Santralleri (RES)', 'MeteoAI RES Raporu: Düşük Rüzgar Rejimi', 'Anlık rüzgar hızının 13 km/s seviyesinde seyretmesi, RES türbinlerinde minimum üretim modunu işaret etmektedir. Enterkonekte şebekede yük dengelemesi için GES santralleri önceliklendirilmektedir.', '2026-06-08'),
('AI-ENJ-RES-LOW-70', 'Enerji', '🔵 BİLGİLENDİRME', 'Karaman Rüzgar Enerji Santralleri (RES)', 'MeteoAI RES Raporu: Düşük Rüzgar Rejimi', 'Anlık rüzgar hızının 13 km/s seviyesinde seyretmesi, RES türbinlerinde minimum üretim modunu işaret etmektedir. Enterkonekte şebekede yük dengelemesi için GES santralleri önceliklendirilmektedir.', '2026-06-08'),
('AI-SEL-01', 'Afet', '🔴 KRİTİK ALARM', 'Adana - Asi Nehri & Körfez Sahil Hattı', 'MeteoAI Otonom Alarm: Kuvvetli Sağanak ve Sel Taşkını', 'MeteoAI uydu radar sensörleri, 2026-06-10 tarihinde metrekareye kısa sürede 85 kg üzeri konvektif yağış düşeceğini tespit etmiştir. Kuru dere yataklarında ve kentsel alt geçitlerde ani sel riski %53 olarak kesinleşmiştir. Tahliye planları aktif edilmelidir. [AI Otonom Sensör: %99.2]', '2026-06-10'),
('AI-SEL-07', 'Afet', '🔴 KRİTİK ALARM', 'Antalya - Asi Nehri & Körfez Sahil Hattı', 'MeteoAI Otonom Alarm: Kuvvetli Sağanak ve Sel Taşkını', 'MeteoAI uydu radar sensörleri, 2026-06-14 tarihinde metrekareye kısa sürede 85 kg üzeri konvektif yağış düşeceğini tespit etmiştir. Kuru dere yataklarında ve kentsel alt geçitlerde ani sel riski %30 olarak kesinleşmiştir. Tahliye planları aktif edilmelidir. [AI Otonom Sensör: %99.2]', '2026-06-14'),
('AI-SEL-70', 'Afet', '🔴 KRİTİK ALARM', 'Karaman - Kentsel Drenaj & Alt Geçit Havzaları', 'MeteoAI Otonom Alarm: Kuvvetli Sağanak ve Sel Taşkını', 'MeteoAI uydu radar sensörleri, 2026-06-10 tarihinde metrekareye kısa sürede 85 kg üzeri konvektif yağış düşeceğini tespit etmiştir. Kuru dere yataklarında ve kentsel alt geçitlerde ani sel riski %55 olarak kesinleşmiştir. Tahliye planları aktif edilmelidir. [AI Otonom Sensör: %99.2]', '2026-06-10'),
('AI-TRM-KRK-70', 'Tarım', '🟡 ORTA RİSK', 'Karaman Tarımsal Sulama Havzaları', 'MeteoAI Zirai Kuraklık & Ekstrem Buharlaşma Stresi', 'Anlık %28 düşük nem ve 27.4°C sıcaklık sebebiyle bitki kök bölgesinde (SMI) aşırı su kaybı ve evapotranspirasyon gözlemlenmektedir. Damlama sulama periyotlarının sıklaştırılması tavsiye edilir.', '2026-06-08'),
('AI-TRM-OPT-01', 'Tarım', '🟢 İDEAL', 'Adana Zirai Hasat & Ekim Sahaları', 'MeteoAI Zirai Rapor: İdeal Toprak Nemi ve İlaçlama Koşulları', 'Adana havzasında anlık %93 nem ve 22.1°C sıcaklık değerleri, zirai ilaçlama, gübreleme ve açık alan ekim faaliyetleri için mükemmel aralıktadır. Rüzgar hızı (3 km/s) sürüklenmeye (drift) yol açmayacak seviyededir.', '2026-06-08'),
('AI-TRM-OPT-07', 'Tarım', '🟢 İDEAL', 'Antalya Zirai Hasat & Ekim Sahaları', 'MeteoAI Zirai Rapor: İdeal Toprak Nemi ve İlaçlama Koşulları', 'Antalya havzasında anlık %70 nem ve 26.6°C sıcaklık değerleri, zirai ilaçlama, gübreleme ve açık alan ekim faaliyetleri için mükemmel aralıktadır. Rüzgar hızı (14 km/s) sürüklenmeye (drift) yol açmayacak seviyededir.', '2026-06-08'),
('AI-TRM-OPT-70', 'Tarım', '🟢 İDEAL', 'Karaman Zirai Hasat & Ekim Sahaları', 'MeteoAI Zirai Rapor: İdeal Toprak Nemi ve İlaçlama Koşulları', 'Karaman havzasında anlık %37 nem ve 24.6°C sıcaklık değerleri, zirai ilaçlama, gübreleme ve açık alan ekim faaliyetleri için mükemmel aralıktadır. Rüzgar hızı (6 km/s) sürüklenmeye (drift) yol açmayacak seviyededir.', '2026-06-08');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `baraj_verileri`
--
ALTER TABLE `baraj_verileri`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `baraj_kodu` (`baraj_kodu`);

--
-- Tablo için indeksler `cografi_bolgeler`
--
ALTER TABLE `cografi_bolgeler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kod` (`kod`);

--
-- Tablo için indeksler `iklim_projeksiyon_sablonlari`
--
ALTER TABLE `iklim_projeksiyon_sablonlari`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bolge` (`bolge`);

--
-- Tablo için indeksler `iller`
--
ALTER TABLE `iller`
  ADD PRIMARY KEY (`plaka_kodu`);

--
-- Tablo için indeksler `mevsimsel_projeksiyonlar`
--
ALTER TABLE `mevsimsel_projeksiyonlar`
  ADD PRIMARY KEY (`plaka_kodu`);

--
-- Tablo için indeksler `model_karsilastirmalari`
--
ALTER TABLE `model_karsilastirmalari`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gun` (`gun`);

--
-- Tablo için indeksler `sektorel_uyarilar`
--
ALTER TABLE `sektorel_uyarilar`
  ADD PRIMARY KEY (`uyari_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `baraj_verileri`
--
ALTER TABLE `baraj_verileri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- Tablo için AUTO_INCREMENT değeri `cografi_bolgeler`
--
ALTER TABLE `cografi_bolgeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `iklim_projeksiyon_sablonlari`
--
ALTER TABLE `iklim_projeksiyon_sablonlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `model_karsilastirmalari`
--
ALTER TABLE `model_karsilastirmalari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
