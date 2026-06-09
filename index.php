<?php
/**
 * MeteoAI TR - Profesyonel İklim ve Uzun Vadeli Meteoroloji Sistemi
 * Ana Giriş Noktası (%100 Sektörel Radar Formatında Dinamik ve Filtreli 3 Aylık Görünüm)
 */
require_once __DIR__ . '/api/veritabani_kurulumu.php';
$iller = mysql_iller_listesini_getir();

// Doğrudan veritabanından dönen listenin ilk plakasını al (Sıfır sabit şehir)
$varsayilan_plaka = key($iller);
$varsayilan_il = $iller[$varsayilan_plaka];
?>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteoAI TR | Yapay Zeka Destekli İklim & Meteoroloji Sistemi</title>
    <meta name="description" content="Türkiye'nin 81 ili için canlı uydu bağlantılı, yapay zeka destekli meteoroloji ve erken uyarı platformu.">
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Türkçe Stil Dosyası -->
    <link rel="stylesheet" href="assets/css/stil.css?v=<?= time() ?>">
    
    <!-- PWA Meta Etiketleri -->
    <link rel="manifest" href="manifest.json">
    <meta name="theme-color" content="#090d16">
    <link rel="apple-touch-icon" href="assets/img/icon-192.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
</head>
<body>

    <!-- ÜST MENÜ BAR -->
    <header>
        <div class="nav-container">
            <div class="brand-and-toggle">
                <a href="#" class="brand" style="display:flex; align-items:center;">
                    <img src="assets/img/logo.webp" alt="MeteoAI TR Logo" style="height: 52px; width: auto; object-fit: contain; filter: drop-shadow(0 0 15px rgba(6, 182, 212, 0.4));">
                </a>
                
                <div class="brand-actions">
                    <!-- Sadece Mobilde Beliren Tema Butonu -->
                    <button class="theme-toggle-btn mobil-theme-btn" aria-label="Tema Değiştir" title="Açık / Koyu Tema">
                        <i data-lucide="sun" class="light-icon" style="width:20px;height:20px;"></i>
                        <i data-lucide="moon" class="dark-icon" style="width:20px;height:20px;display:none;"></i>
                    </button>

                    <!-- Sadece Mobilde Beliren Hamburger Menü Butonu -->
                    <button id="mobilMenuButonu" class="mobile-toggle-btn" aria-label="Menüyü Aç/Kapat">
                        <i data-lucide="menu"></i>
                    </button>
                </div>
            </div>

            <!-- Navigasyon Sekmeleri -->
            <nav id="anaNavigasyon" class="nav-tabs">
                <button class="nav-btn active" data-tab="dashboard"><i data-lucide="layout-dashboard"></i> Canlı Gözlem & AI</button>
                <button class="nav-btn" data-tab="radar"><i data-lucide="radar"></i> Sektörel AI Radarı</button>
                <button class="nav-btn" data-tab="seasonal"><i data-lucide="calendar-days"></i> 3 Aylık AI Görünümü</button>
                <button class="nav-btn" data-tab="assistant"><i data-lucide="bot"></i> HavAI Asistan</button>
                <button class="nav-btn" data-tab="models"><i data-lucide="cpu"></i> AI Model Analizi</button>
                <button class="nav-btn" data-tab="dams"><i data-lucide="droplets"></i> Baraj Doluluk Oranları</button>
            </nav>

            <div class="header-right-tools" style="display:flex; align-items:center; gap:0.75rem;">
                <button id="temaDegistirBtn" class="theme-toggle-btn" aria-label="Tema Değiştir" title="Açık / Koyu Tema">
                    <i data-lucide="sun" class="light-icon" style="width:20px;height:20px;"></i>
                    <i data-lucide="moon" class="dark-icon" style="width:20px;height:20px;display:none;"></i>
                </button>
                <div class="system-badge">
                    <div class="node-dot"></div>
                    <span>MeteoAI TR Aktif</span>
                </div>
            </div>
        </div>
    </header>

    <main>
        <!-- KONUM SEÇİM BÖLÜMÜ -->
        <div class="top-actions">
            <div class="top-actions-inner" style="display:flex; justify-content:space-between; align-items:center; width:100%; gap:1rem; flex-wrap:wrap;">
                <div class="city-selector" style="display:flex; align-items:center; gap:1rem; flex-wrap:wrap; position:relative;">
                    <label style="white-space:nowrap;"><i data-lucide="map-pin" style="color: var(--accent-cyan);"></i> Konum:</label>
                    
                    <!-- GİZLİ GERÇEK SELECT (JS VE VERİ BAĞLANTISI İÇİN) -->
                    <select id="ilSecici" aria-label="Konum Seçimi" style="display: none;">
                        <?php foreach ($iller as $plaka => $il): ?>
                            <option value="<?= $plaka ?>" data-enlem="<?= $il['enlem'] ?>" data-boylam="<?= $il['boylam'] ?>" <?= ($plaka == $varsayilan_plaka) ? 'selected' : '' ?>>
                                <?= $plaka ?> - <?= htmlspecialchars($il['sehir_adi']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <!-- GÖRSEL PREMIUM ÖZEL AÇILIR MENÜ (CUSTOM DROPDOWN) -->
                    <div class="custom-dropdown" id="customIlDropdown">
                        <button class="custom-dropdown-btn" type="button" aria-expanded="false" id="customIlButonu">
                            <span class="selected-text"><i data-lucide="map-pin"></i> <span id="secilenIlAdiMetni"><?= $varsayilan_plaka ?> - <?= htmlspecialchars($varsayilan_il['sehir_adi']) ?></span></span>
                            <i data-lucide="chevron-down" class="dropdown-arrow"></i>
                        </button>
                        <div class="custom-dropdown-menu">
                            <div class="dropdown-search-box">
                                <i data-lucide="search" style="width:18px;height:18px;"></i>
                                <input type="text" id="ilAramaGirdisi" placeholder="Şehir adı veya plaka ara..." autocomplete="off">
                            </div>
                            <div class="dropdown-options-list" id="customIlListesi">
                                <!-- JavaScript ile doldurulacak -->
                            </div>
                        </div>
                    </div>                    
                    <!-- HATA DURUMUNDA BUTONUN SAĞINDA BELİRECEK KOMPAKT BİLDİRİM KUTUSU -->
                    <div id="konumHataKutusu" style="display:none; position:absolute; left:calc(100% + 8px); top:50%; transform:translateY(-50%); z-index:99999; align-items:center; gap:0.5rem; background:#090d16; border:1px solid #f43f5e; color:#f43f5e; padding:0.5rem 0.85rem; border-radius:12px; font-size:0.8rem; font-weight:600; box-shadow:0 10px 25px rgba(0,0,0,0.8), 0 0 20px rgba(244,63,94,0.3); animation:fadeIn 0.3s ease-out; white-space:nowrap;">
                        <i data-lucide="alert-circle" style="width:15px;height:15px;flex-shrink:0;"></i>
                        <span id="konumHataMetni">Konum kapalı. Tarayıcı izinlerini kontrol ediniz.</span>
                    </div>
                </div>
                <div class="action-buttons">
                    <button class="btn-secondary" onclick="location.reload()"><i data-lucide="refresh-cw"></i> Verileri Tazele</button>
                    <button class="btn-primary" onclick="window.open(`rapor_indir.php?plaka_kodu=${document.getElementById('ilSecici').value}`, '_blank')"><i data-lucide="file-check-2"></i> Rapor İndir</button>
                </div>
            </div>
        </div>

        <!-- 1. CANLI GÖZLEM VE AI (DASHBOARD) SEKME İÇERİĞİ -->
        <div id="dashboard" class="tab-content active">
            
            <div class="dashboard-grid">
                <div class="glass-card current-weather-card">
                    <div>
                        <div class="current-header">
                            <div>
                                <h1 id="sehirAdi" class="city-name"><?= htmlspecialchars($varsayilan_il['sehir_adi']) ?></h1>
                                <div id="bolgeAdi" class="region-name"><?= htmlspecialchars($varsayilan_il['bolge']) ?> Bölgesi</div>
                            </div>
                            <i id="anaHavaIkono" data-lucide="sun" class="lucide-icon weather-icon-lg"></i>
                        </div>
                        <div class="current-body">
                            <div class="temperature"><span id="mevcutSicaklik">--</span><span>°C</span></div>
                            <div id="durumMetni" class="condition-text">Yükleniyor...</div>
                            <div id="hissedilenSicaklik" class="feels-like">Hissedilen: --°C</div>
                        </div>
                    </div>

                    <div class="current-footer">
                        <div class="stat-item">
                            <div class="stat-icon"><i data-lucide="wind"></i></div>
                            <div class="stat-details">
                                <span class="stat-label">Rüzgar Tahmini</span>
                                <span id="ruzgarHizi" class="stat-val">-- km/s</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-icon"><i data-lucide="droplets"></i></div>
                            <div class="stat-details">
                                <span class="stat-label">Bağıl Nem Oranı</span>
                                <span id="nemOrani" class="stat-val">%--</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-icon"><i data-lucide="sun-dim"></i></div>
                            <div class="stat-details">
                                <span class="stat-label">UV İndeksi</span>
                                <span id="uvIndeksi" class="stat-val">--</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-icon"><i data-lucide="shield-check"></i></div>
                            <div class="stat-details">
                                <span class="stat-label">AI Doğruluğu</span>
                                <span id="yapayZekaGuvenSkoru" class="stat-val">%--</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="glass-card chart-card">
                    <div class="card-title-area">
                        <h2 class="card-title"><i data-lucide="trending-up"></i> 30 Günlük İklim Trend Projeksiyonu</h2>
                    </div>
                    <div class="chart-container">
                        <canvas id="sicaklikTrendGrafigi"></canvas>
                    </div>
                </div>
            </div>

            <!-- 1. ŞERİT: 7 GÜNLÜK KESİN GÖZLEM -->
            <div class="forecast-strip-container" style="margin-bottom: 2.5rem;">
                <div class="strip-header" style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 1.25rem; flex-wrap:wrap; gap:0.5rem; border-bottom: 1px solid rgba(16, 185, 129, 0.3); padding-bottom: 0.75rem;">
                    <h3 style="font-family:'Outfit',sans-serif; font-size:1.35rem; font-weight:800; color:white; display:flex; align-items:center; gap:0.65rem;"><i data-lucide="calendar-check" style="color:#10b981;"></i> 7 Günlük Kesin Gözlem</h3>
                </div>
                <div id="haftalikTahminSeridi" class="forecast-strip">
                    <!-- JS ile 1-7 günler yüklenecek -->
                </div>
            </div>

            <!-- 2. ŞERİT: 30 GÜNLÜK AI SİMÜLASYONU (8. - 30. GÜNLER) -->
            <div class="forecast-strip-container" style="margin-bottom: 2.5rem;">
                <div class="strip-header" style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 1.25rem; flex-wrap:wrap; gap:0.5rem; border-bottom: 1px solid rgba(139, 92, 246, 0.3); padding-bottom: 0.75rem;">
                    <h3 style="font-family:'Outfit',sans-serif; font-size:1.35rem; font-weight:800; color:white; display:flex; align-items:center; gap:0.65rem;"><i data-lucide="cpu" style="color:#c084fc;"></i> 30 Günlük AI İklim Tahmini (8. - 30. Günler)</h3>
                </div>
                <div id="aylikTahminSeridi" class="forecast-strip">
                    <!-- JS ile 8-30 günler yüklenecek -->
                </div>
            </div>

            <!-- 3. ŞERİT: TÜRKİYE COĞRAFİ BÖLGELER AI GÖZLEMİ -->
            <div class="regions-container" style="margin-bottom: 2.5rem;">
                <div class="strip-header" style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 1.25rem; flex-wrap:wrap; gap:0.5rem; border-bottom: 1px solid rgba(6, 182, 212, 0.3); padding-bottom: 0.75rem;">
                    <h3 style="font-family:'Outfit',sans-serif; font-size:1.35rem; font-weight:800; color:white; display:flex; align-items:center; gap:0.65rem;"><i data-lucide="map" style="color:#06b6d4;"></i> Türkiye Coğrafi Bölgeler AI Gözlemi</h3>
                    <span style="font-size:0.85rem; color:var(--text-muted); background:rgba(6, 182, 212, 0.15); padding:0.35rem 0.85rem; border-radius:100px; border:1px solid rgba(6, 182, 212, 0.3); font-weight:600;"><i data-lucide="radar" style="width:12px;height:12px;display:inline-block;vertical-align:-1px;margin-right:2px;color:#06b6d4;"></i> 7 Coğrafi Bölge Otonom Sensör Ağı</span>
                </div>
                <div id="bolgelerIzgarasi" class="regions-grid">
                    <!-- JS ile 7 bölge kartı yüklenecek -->
                </div>
            </div>

            <div class="ai-summary-box" style="margin-bottom: 0;">
                <i data-lucide="sparkles"></i>
                <div>
                    <div class="ai-summary-title">Canlı Gözlem ve Algoritmik Analiz</div>
                    <div id="yapayZekaOzetMetni" class="ai-summary-text">Canlı meteoroloji ve uydu verileri işleniyor...</div>
                </div>
            </div>
        </div>

        <!-- 2. SEKTÖREL RADAR SEKME İÇERİĞİ -->
        <div id="radar" class="tab-content">
            <!-- Inline stiller tamamen kaldırıldı; CSS sınıfları devrede -->
            <div class="glass-card radar-header-card" style="margin-bottom: 2rem;">
                <div class="header-texts">
                    <h2 style="font-family:'Outfit',sans-serif; font-size:1.5rem; font-weight:800; color:white; margin-bottom:0.25rem;">Sektörel İklim Radarı & Canlı Uyarılar</h2>
                    <p style="color:var(--text-muted); font-size:0.95rem;">Seçilen ilin canlı uydu verilerine göre anlık derlenen tarımsal, enerji ve doğal afet risk analizleri.</p>
                </div>
                <div class="radar-filter-group">
                    <button class="alert-filter-btn active btn-primary" data-type="hepsi"><i data-lucide="layers"></i> Tüm Riskler</button>
                    <button class="alert-filter-btn btn-secondary" data-type="Tarım"><i data-lucide="sprout"></i> Tarım</button>
                    <button class="alert-filter-btn btn-secondary" data-type="Enerji"><i data-lucide="zap"></i> Enerji</button>
                    <button class="alert-filter-btn btn-secondary" data-type="Afet"><i data-lucide="shield-alert"></i> Doğal Afet</button>
                </div>
            </div>
            <div id="uyarilarIzgarasi" class="alerts-grid">
                <!-- JavaScript ile yüklenecek -->
            </div>
        </div>

        <!-- 3. 3 AYLIK GÖRÜNÜM SEKME İÇERİĞİ (AYRI AYRI AYLIK KARTLI VE FİLTRELİ) -->
        <div id="seasonal" class="tab-content">
            <div class="glass-card radar-header-card" style="margin-bottom: 2rem;">
                <div class="header-texts">
                    <h2 style="font-family:'Outfit',sans-serif; font-size:1.5rem; font-weight:800; color:white; margin-bottom:0.25rem;">3 Aylık Ayrı Ayrı Otonom AI Projeksiyonu</h2>
                    <?php
                    $t_aylar = [1 => "Ocak", 2 => "Şubat", 3 => "Mart", 4 => "Nisan", 5 => "Mayıs", 6 => "Haziran", 7 => "Temmuz", 8 => "Ağustos", 9 => "Eylül", 10 => "Ekim", 11 => "Kasım", 12 => "Aralık"];
                    $d_liste = [];
                    $cur_ay = (int)date("n");
                    for ($i = 1; $i <= 3; $i++) {
                        $he_ay = ($cur_ay + $i > 12) ? $cur_ay + $i - 12 : $cur_ay + $i;
                        $d_liste[] = $t_aylar[$he_ay];
                    }
                    $dinamik_ay_str = implode(", ", $d_liste);
                    ?>
                    <p style="color:var(--text-muted); font-size:0.95rem;">Seçilen istasyonun önümüzdeki 3 ay (<?= $dinamik_ay_str ?>) için ayrı ayrı hesaplanan termal ve hidrolojik senaryoları.</p>
                </div>
                <div class="radar-filter-group seasonal-filter-group">
                    <button class="seasonal-filter-btn active btn-primary" data-type="hepsi"><i data-lucide="layers"></i> Tüm Senaryolar</button>
                    <button class="seasonal-filter-btn btn-secondary" data-type="Sıcaklık"><i data-lucide="thermometer-sun"></i> Termal Isınma</button>
                    <button class="seasonal-filter-btn btn-secondary" data-type="Su"><i data-lucide="droplets"></i> Su & Kuraklık</button>
                    <button class="seasonal-filter-btn btn-secondary" data-type="Zirai"><i data-lucide="wheat"></i> Zirai Hasat</button>
                </div>
            </div>

            <!-- 3 AY AYRI AYRI KARTLAR (GRID) -->
            <div id="aylikProjeksiyonlarContainer" class="monthly-projection-grid">
                <div class="glass-card" style="grid-column:1/-1; text-align:center; color:#94a3b8;">
                    <i data-lucide="loader-2" class="spin" style="margin-bottom:0.5rem;"></i><br>
                    Seçilen şehre özel aylık projeksiyonlar hesaplanıyor...
                </div>
            </div>

            <!-- OTONOM GENEL DEĞERLENDİRME -->
            <div class="glass-card" style="margin-bottom: 0; background:rgba(15,23,42,0.8); border:1px solid rgba(255,255,255,0.1);">
                <h3 style="font-family:'Outfit',sans-serif; color:white; margin-bottom:0.75rem; font-size:1.35rem; display:flex; align-items:center; gap:0.5rem;"><i data-lucide="bot" style="color:var(--accent-purple);"></i> 3 Aylık Otonom Sinoptik Özet</h3>
                <p id="mevsimAnalizMetni" style="color:#cbd5e1; line-height:1.7; font-size:1.05rem;">Mevsimsel veri veritabanından çekiliyor...</p>
            </div>
        </div>

        <!-- 4. HAVAI ASİSTAN SEKME İÇERİĞİ -->
        <div id="assistant" class="tab-content">
            <div class="ai-assistant-container">
                <div style="text-align:center; margin-bottom:2rem;">
                    <div style="display:inline-flex; align-items:center; justify-content:center; width:64px; height:64px; border-radius:20px; background:linear-gradient(135deg, var(--accent-purple), var(--accent-cyan)); box-shadow:0 0 30px var(--glow-purple); margin-bottom:1rem;">
                        <i data-lucide="bot" style="width:36px; height:36px; color:white;"></i>
                    </div>
                    <h2 style="font-family:'Outfit',sans-serif; font-size:2.25rem; font-weight:900; color:white;">HavAI Doğal Dil İklim & Meteoroloji Asistanı</h2>
                    <p style="color:var(--text-muted); font-size:1rem; max-width:600px; margin:0.5rem auto 0;">Merak ettiğiniz ili, don riskini, sel uyarılarını veya enerji durumlarını doğal dilde sorun. MeteoAI TR derin öğrenme motorumuz anında yanıtlasın.</p>
                </div>

                <div id="yapayZekaSohbetKutusu" class="chat-box">
                    <div class="msg ai">
                        <div class="msg-avatar"><i data-lucide="bot"></i></div>
                        <div class="msg-bubble">Merhaba! Ben HavAI. Sistemde kayıtlı 81 ilimizle ilgili her türlü anlık uydu verisini, zirai don, sel ve enerji uyarılarını bana sorabilirsiniz. Hangi şehrimizin raporunu incelemek istersiniz?</div>
                    </div>
                </div>

                <div class="chat-input-area">
                    <input id="yapayZekaGirdisi" type="text" placeholder="Örn: Antalya'da yarın hava nasıl olacak? Veya zirai don riski var mı?" aria-label="HavAI Asistan Sorusu">
                    <button id="sohbetGonderButonu"><i data-lucide="send"></i> Sor</button>
                </div>
            </div>
        </div>

        <!-- 5. MODEL KARŞILAŞTIRMA SEKME İÇERİĞİ -->
        <div id="models" class="tab-content">
            <div class="glass-card" style="margin-bottom: 2rem;">
                <div style="display:flex; align-items:center; gap:0.75rem; margin-bottom:1rem;">
                    <i data-lucide="cpu" style="width:32px;height:32px;color:var(--accent-cyan);"></i>
                    <h2 style="font-family:'Outfit',sans-serif; font-size:1.75rem; font-weight:800; color:white;">Sayısal Hava Tahmin Modelleri Başarı Doğrulaması</h2>
                </div>
                <p style="color:var(--text-muted); font-size:1rem; line-height:1.6; margin-bottom:1.5rem;">Fiziksel modeller (ECMWF, GFS) ile MeteoAI TR derin öğrenme modelinin zamana bağlı tahmin tutarlılık oranları karşılaştırması.</p>
                
                <div style="overflow-x:auto;">
                    <table class="comparison-table">
                        <thead>
                            <tr>
                                <th>Zaman Periyodu</th>
                                <th>ECMWF (Avrupa Modeli)</th>
                                <th>NOAA GFS (Amerikan Modeli)</th>
                                <th>MeteoAI TR (Yapay Zeka Modeli)</th>
                            </tr>
                        </thead>
                        <tbody id="karsilastirmaTablosuGövdesi">
                            <!-- JavaScript ile yüklenecek -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- 6. BARAJLAR VE SU REZERVLERİ SEKME İÇERİĞİ -->
        <div id="dams" class="tab-content">
            <div class="glass-card" style="margin-bottom: 2.5rem;">
                <h2 style="font-family:'Outfit',sans-serif; font-size:1.75rem; font-weight:800; color:white; margin-bottom:0.25rem;">Türkiye Geneli Kritik Barajlar & Su Rezervleri</h2>
                <p style="color:var(--text-muted); font-size:0.95rem;">Devlet Su İşleri (DSİ) havza sensörleri ve MeteoAI TR hidrolojik uydu algoritmalarının canlı rezerv analizleri.</p>
            </div>

            <!-- ÜSTTE BÜYÜK HAVZA ÖZET KARTLARI -->
            <div class="dam-overview-grid" id="barajOzetKartlari">
                <div class="dam-stat-card" style="--card-gradient: linear-gradient(90deg, #3b82f6, #06b6d4); border-color: rgba(6, 182, 212, 0.4);">
                    <div class="dam-city-title"><i data-lucide="waves" style="color:#06b6d4;"></i> Türkiye Geneli</div>
                    <div class="dam-percent-display" id="genelDolulukOrani" style="color:#06b6d4;">%71.4</div>
                    <div class="dam-water-bar-bg"><div class="dam-water-fill" id="barajGenelDolulukBari" style="width: 71.4%; background: linear-gradient(90deg, #3b82f6, #06b6d4);"></div></div>
                </div>
                <div class="dam-stat-card" style="--card-gradient: linear-gradient(90deg, #2563eb, #60a5fa); border-color: rgba(59, 130, 246, 0.4);">
                    <div class="dam-city-title"><i data-lucide="map-pin" style="color:#3b82f6;"></i> İstanbul Havzası</div>
                    <div class="dam-percent-display" id="istDolulukOrani" style="color:#3b82f6;">%71.2</div>
                    <div class="dam-water-bar-bg"><div class="dam-water-fill" id="istDolulukBari" style="width: 71.2%; background: linear-gradient(90deg, #2563eb, #60a5fa);"></div></div>
                </div>
                <div class="dam-stat-card" style="--card-gradient: linear-gradient(90deg, #059669, #34d399); border-color: rgba(16, 185, 129, 0.4);">
                    <div class="dam-city-title"><i data-lucide="map-pin" style="color:#10b981;"></i> Ankara & İç Anadolu</div>
                    <div class="dam-percent-display" id="ankDolulukOrani" style="color:#10b981;">%52.5</div>
                    <div class="dam-water-bar-bg"><div class="dam-water-fill" id="ankDolulukBari" style="width: 52.5%; background: linear-gradient(90deg, #059669, #34d399);"></div></div>
                </div>
                <div class="dam-stat-card" style="--card-gradient: linear-gradient(90deg, #d97706, #fbbf24); border-color: rgba(245, 158, 11, 0.4);">
                    <div class="dam-city-title"><i data-lucide="sun" style="color:#f59e0b;"></i> GAP & Akdeniz HES</div>
                    <div class="dam-percent-display" id="gapDolulukOrani" style="color:#f59e0b;">%78.2</div>
                    <div class="dam-water-bar-bg"><div class="dam-water-fill" id="gapDolulukBari" style="width: 78.2%; background: linear-gradient(90deg, #d97706, #fbbf24);"></div></div>
                </div>
            </div>

            <!-- ARAMA VE ŞEHİR FİLTRESİ -->
            <div class="dam-search-bar">
                <div style="display:flex; align-items:center; gap:0.5rem; color:var(--accent-cyan); font-weight:700;"><i data-lucide="search"></i> Baraj Ara:</div>
                <input type="text" id="barajAramaGirdisi" class="dam-search-input" placeholder="Baraj adı veya şehir yazın..." autocomplete="off">
                <div class="dam-filter-pills" id="barajSehirFiltreleri">
                    <span class="dam-pill active" data-plaka="hepsi">Tüm Türkiye</span>
                    <span class="dam-pill" data-plaka="34">İstanbul</span>
                    <span class="dam-pill" data-plaka="06">Ankara</span>
                    <span class="dam-pill" data-plaka="35">İzmir</span>
                    <span class="dam-pill" data-plaka="16">Bursa</span>
                    <span class="dam-pill" data-plaka="01">Adana</span>
                    <span class="dam-pill" data-plaka="07">Antalya</span>
                    <span class="dam-pill" data-plaka="42">Konya</span>
                    <span class="dam-pill" data-plaka="55">Samsun</span>
                    <span class="dam-pill" data-plaka="23">Elazığ</span>
                    <span class="dam-pill" data-plaka="08">Artvin</span>
                </div>
            </div>

            <!-- RENK AÇIKLAMALARI (LEGEND) -->
            <div class="dam-legend-bar">
                <div class="legend-title"><i data-lucide="info"></i> Doluluk Renk Skalası:</div>
                <div class="legend-item"><span class="legend-color color-red"></span> %100 (Tam Dolu)</div>
                <div class="legend-item"><span class="legend-color color-orange"></span> %80 - %99 (Çok Yüksek)</div>
                <div class="legend-item"><span class="legend-color color-blue"></span> %65 - %79 (Normal)</div>
                <div class="legend-item"><span class="legend-color color-green"></span> %40 - %64 (Düşük)</div>
                <div class="legend-item"><span class="legend-color color-yellow"></span> %40 Altı (Kritik)</div>
            </div>

            <!-- BARAJ KARTLARI LISTESI -->
            <div class="dam-cards-grid" id="barajlarIzgarasi">
                <!-- JavaScript ile yüklenecek -->
            </div>

            <div class="ai-summary-box">
                <i data-lucide="sparkles"></i>
                <div>
                    <div class="ai-summary-title">MeteoAI TR Otonom Hidrolojik Değerlendirme Raporu</div>
                    <div id="aiBarajRaporuMetni" class="ai-summary-text">Hidrolojik analizler ve rezervuar doluluk trendleri yükleniyor...</div>
                </div>
            </div>
        </div>
    </main>

    <!-- KURUMSAL MODÜLER FOOTER -->
    <?php include 'footer.php'; ?>

    <!-- TÜRKÇE JAVASCRIPT MOTORU -->
    <script src="assets/js/uygulama.js?v=<?= time() ?>"></script>
    <script>
        lucide.createIcons();

        // PWA Service Worker Kaydı
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                navigator.serviceWorker.register('/meteoroloji/sw.js')
                    .then(registration => {
                        console.log('PWA ServiceWorker başarıyla kaydedildi: ', registration.scope);
                    })
                    .catch(err => {
                        console.log('ServiceWorker kayıt hatası: ', err);
                    });
            });
        }
    </script>
</body>
</html>
<!-- Son Güncelleme & Disk Kaydı: Tamamlandı -->
