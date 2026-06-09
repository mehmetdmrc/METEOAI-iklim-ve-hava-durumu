<?php
/**
 * MeteoAI TR - Veritabanı Bağlantı ve Otonom Tohumlama Çekirdeği (%100 Endüstriyel Sürüm)
 */

function veritabani_baglantisi_getir() {
    $sunucu = "localhost";
    $kullanici = "root";
    $sifre = "";
    $veritabani_adi = "meteoroloji";

    try {
        $vt = new PDO("mysql:host=$sunucu;dbname=$veritabani_adi;charset=utf8mb4", $kullanici, $sifre, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]);
        baraj_tablosunu_kur_ve_tohumla($vt);
        bolge_tablosunu_kur_ve_tohumla($vt);
        projeksiyon_sablonlarini_kur_ve_tohumla($vt);
        model_karsilastirmalarini_kur_ve_tohumla($vt);
        return $vt;
    } catch (PDOException $e) {
        die(json_encode(["hata" => "Veritabanı Bağlantı Hatası: " . $e->getMessage()]));
    }
}

function baraj_tablosunu_kur_ve_tohumla($vt) {
    $tablo_sorgusu = "CREATE TABLE IF NOT EXISTS `baraj_verileri` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `baraj_kodu` varchar(20) NOT NULL UNIQUE,
        `isim` varchar(100) NOT NULL,
        `sehir` varchar(50) NOT NULL,
        `plaka_kodu` varchar(5) NOT NULL,
        `havza` varchar(50) NOT NULL,
        `kapasite_hm3` float NOT NULL,
        `aktif_hacim_hm3` float NOT NULL,
        `su_kalitesi` varchar(50) NOT NULL,
        `risk_durumu` varchar(100) NOT NULL,
        `son_guncelleme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";
    
    $vt->exec($tablo_sorgusu);
    
    // [Seeder Temizlendi] Kurulum ve tohumlama tamamlandığı için kod fazlalığı olmaması adına statik veriler temizlendi.
}

function bolge_tablosunu_kur_ve_tohumla($vt) {
    $tablo_sorgusu = "CREATE TABLE IF NOT EXISTS `cografi_bolgeler` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `kod` varchar(20) NOT NULL UNIQUE,
        `bolge_adi` varchar(50) NOT NULL,
        `ornek_sehir` varchar(100) NOT NULL,
        `enlem` float NOT NULL,
        `boylam` float NOT NULL,
        `varsayilan_not` varchar(255) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";
    
    $vt->exec($tablo_sorgusu);
    
    // [Seeder Temizlendi] Kurulum ve tohumlama tamamlandığı için kod fazlalığı olmaması adına statik veriler temizlendi.
}

function mysql_iller_listesini_getir() {
    $vt = veritabani_baglantisi_getir();
    $sorgu = $vt->query("SELECT * FROM `iller` ORDER BY `plaka_kodu` ASC");
    $liste = [];
    while ($satir = $sorgu->fetch()) {
        $liste[$satir['plaka_kodu']] = $satir;
    }
    return $liste;
}

function mysql_bolgeler_listesini_getir() {
    $vt = veritabani_baglantisi_getir();
    $sorgu = $vt->query("SELECT * FROM `cografi_bolgeler` ORDER BY `id` ASC");
    $liste = [];
    while ($satir = $sorgu->fetch()) {
        $liste[$satir['kod']] = $satir;
    }
    return $liste;
}

function wmo_kodunu_turkceye_cevir($wmo_kodu) {
    switch ($wmo_kodu) {
        case 0: return ["Açık ve Güneşli", "sun"];
        case 1: case 2: return ["Parçalı Bulutlu", "cloud-sun"];
        case 3: return ["Çok Bulutlu / Kapalı", "cloud"];
        case 45: case 48: return ["Yoğun Sisli", "cloud-fog"];
        case 51: case 53: case 55: return ["Hafif Çisenti", "cloud-drizzle"];
        case 56: case 57: return ["Dondurucu Çisenti", "cloud-snow"];
        case 61: return ["Hafif Yağmurlu", "cloud-rain"];
        case 63: return ["Düzenli Yağmur", "cloud-rain"];
        case 65: return ["Kuvvetli Sağanak", "cloud-lightning"];
        case 66: case 67: return ["Dondurucu Yağmur", "cloud-snow"];
        case 71: case 73: case 75: return ["Kar Yağışlı", "cloud-snow"];
        case 77: return ["Kar Taneleri / Suluseken", "snowflake"];
        case 80: case 81: case 82: return ["Ani Sağanak Geçişi", "cloud-rain"];
        case 85: case 86: return ["Yoğun Kar Fırtınası", "cloud-snow"];
        case 95: return ["Gök Gürültülü Fırtına", "cloud-lightning"];
        case 96: case 99: return ["Şiddetli Dolu Fırtınası", "cloud-lightning"];
        default: return ["Belirsiz / Açık", "sun"];
    }
}

function projeksiyon_sablonlarini_kur_ve_tohumla($vt) {
    $tablo_sorgusu = "CREATE TABLE IF NOT EXISTS `iklim_projeksiyon_sablonlari` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `bolge` varchar(50) NOT NULL UNIQUE,
        `iklim_olayi` varchar(150) NOT NULL,
        `analiz` text NOT NULL,
        `aylar_sablonu_json` text NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";
    
    $vt->exec($tablo_sorgusu);
    
    // [Seeder Temizlendi] Kurulum ve tohumlama tamamlandığı için kod fazlalığı olmaması adına statik veriler temizlendi.
}

function mysql_iklim_sablonu_getir($bolge) {
    $vt = veritabani_baglantisi_getir();
    $sorgu = $vt->prepare("SELECT * FROM `iklim_projeksiyon_sablonlari` WHERE `bolge` = ?");
    $sorgu->execute([$bolge]);
    $sablon = $sorgu->fetch();
    if (!$sablon) {
        $sorgu = $vt->prepare("SELECT * FROM `iklim_projeksiyon_sablonlari` WHERE `bolge` = 'Varsayilan'");
        $sorgu->execute([]);
        $sablon = $sorgu->fetch();
    }
    return $sablon;
}

function model_karsilastirmalarini_kur_ve_tohumla($vt) {
    $tablo_sorgusu = "CREATE TABLE IF NOT EXISTS `model_karsilastirmalari` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `gun` varchar(20) NOT NULL UNIQUE,
        `ecmwf` float NOT NULL,
        `gfs` float NOT NULL,
        `meteo_ai` float NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";
    
    $vt->exec($tablo_sorgusu);
    
    // [Seeder Temizlendi] Kurulum ve tohumlama tamamlandığı için kod fazlalığı olmaması adına statik veriler temizlendi.
}

function mysql_model_karsilastirmalarini_getir() {
    $vt = veritabani_baglantisi_getir();
    $sorgu = $vt->query("SELECT `gun`, `ecmwf`, `gfs`, `meteo_ai` FROM `model_karsilastirmalari` ORDER BY `id` ASC");
    $liste = [];
    while ($satir = $sorgu->fetch()) {
        $liste[] = [
            "gun" => $satir['gun'],
            "ecmwf" => floatval($satir['ecmwf']),
            "gfs" => floatval($satir['gfs']),
            "meteo_ai" => floatval($satir['meteo_ai'])
        ];
    }
    return $liste;
}
