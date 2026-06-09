<?php
/**
 * Arayüze sektörel uyarıları ve model karşılaştırma verilerini getiren Türkçe API uç noktası.
 */
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

require_once __DIR__ . '/veritabani_kurulumu.php';

$vt = veritabani_baglantisi_getir();
$islem = isset($_GET['islem']) ? $_GET['islem'] : (isset($_GET['action']) ? $_GET['action'] : 'hepsi');

if ($islem === 'en_yakin_il') {
    $lat = isset($_GET['lat']) ? floatval($_GET['lat']) : 0;
    $lon = isset($_GET['lon']) ? floatval($_GET['lon']) : 0;
    $iller = mysql_iller_listesini_getir();
    $en_yakin_plaka = '34';
    $min_mesafe = 999999;
    $secilen_il = null;

    foreach ($iller as $plaka => $il) {
        $mesafe = sqrt(pow(($il['enlem'] - $lat), 2) + pow(($il['boylam'] - $lon), 2));
        if ($mesafe < $min_mesafe) {
            $min_mesafe = $mesafe;
            $en_yakin_plaka = $plaka;
            $secilen_il = $il;
        }
    }
    echo json_encode(["plaka" => $en_yakin_plaka, "sehir_adi" => $secilen_il ? $secilen_il['sehir_adi'] : "İstanbul"]);
    exit;
}

if ($islem === 'karsilastirma' || $islem === 'comparison') {
    echo json_encode(mysql_model_karsilastirmalarini_getir());
    exit;
} elseif ($islem === 'uyarilar' || $islem === 'alerts') {
    $sorgu = $vt->query("SELECT `uyari_id` as `id`, `sektor` as `type`, `tehlike_seviyesi` as `severity`, `etkilenen_bolge` as `region`, `baslik` as `title`, `aciklama` as `message`, DATE_FORMAT(`uyari_tarihi`, '%Y-%m-%d') as `date` FROM `sektorel_uyarilar` ORDER BY `uyari_tarihi` DESC");
    echo json_encode($sorgu->fetchAll());
    exit;
} else {
    echo json_encode(["durum" => "hazir", "veritabani" => "MySQL Baglantisi Basarili"]);
}
