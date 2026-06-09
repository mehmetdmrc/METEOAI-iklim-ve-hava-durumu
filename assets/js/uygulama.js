/**
 * MeteoAI TR Frontend Uygulama Mantığı (%100 Dinamik MySQL, Hamburger Menü ve Sektörel Mevsimsel Filtre Motoru)
 */
document.addEventListener('DOMContentLoaded', () => {
    const ilSecici = document.getElementById('ilSecici');
    let seciliPlakaKodu = ilSecici ? ilSecici.value : '01';
    let meteorolojiVerisi = null;
    let sicaklikGrafigi = null;

    const konumBulButonu = document.getElementById('konumBulButonu');
    const mobilMenuButonu = document.getElementById('mobilMenuButonu');
    const anaNavigasyon = document.getElementById('anaNavigasyon');
    const menuButonlari = document.querySelectorAll('.nav-btn');
    const sekmeIcerikleri = document.querySelectorAll('.tab-content');
    const topActionsBar = document.querySelector('.top-actions');

    // CUSTOM DROPDOWN ÖĞELERİ
    const customDropdown = document.getElementById('customIlDropdown');
    const customButon = document.getElementById('customIlButonu');
    const secilenMetin = document.getElementById('secilenIlAdiMetni');
    const aramaGirdisi = document.getElementById('ilAramaGirdisi');
    const customListesi = document.getElementById('customIlListesi');

    const uyariFiltreButonlari = document.querySelectorAll('.alert-filter-btn');
    const mevsimselFiltreButonlari = document.querySelectorAll('.seasonal-filter-btn');

    const sohbetGirdisi = document.getElementById('yapayZekaGirdisi');
    const sohbetGonderButonu = document.getElementById('sohbetGonderButonu');
    const sohbetKutusu = document.getElementById('yapayZekaSohbetKutusu');
    const konumDurumuMetni = document.getElementById('konumDurumuMetni');
    const konumHataKutusu = document.getElementById('konumHataKutusu');
    const konumButonMetni = document.getElementById('konumButonMetni');

    havaVerisiGetir(seciliPlakaKodu);

    // TEMA KONTROL MOTORU (AÇIK/KOYU MOD)
    const temaButonlari = document.querySelectorAll('.theme-toggle-btn');

    function temayiAyarla(acikMi) {
        temaButonlari.forEach(btn => {
            const curLight = btn.querySelector('.light-icon');
            const curDark = btn.querySelector('.dark-icon');
            if (acikMi) {
                if (curLight) curLight.style.display = 'none';
                if (curDark) curDark.style.display = '';
            } else {
                if (curLight) curLight.style.display = '';
                if (curDark) curDark.style.display = 'none';
            }
        });

        if (acikMi) {
            document.body.classList.add('light-mode');
        } else {
            document.body.classList.remove('light-mode');
        }
        localStorage.setItem('meteoai_theme', acikMi ? 'light' : 'dark');
        if (meteorolojiVerisi && meteorolojiVerisi.sehir && meteorolojiVerisi.sehir.aylik_tahmin) {
            grafikOlustur(meteorolojiVerisi.sehir.aylik_tahmin);
        }
    }

    const kayitliTema = localStorage.getItem('meteoai_theme');
    if (kayitliTema === 'light') {
        temayiAyarla(true);
    }

    temaButonlari.forEach(btn => {
        btn.addEventListener('click', () => {
            const acikMi = !document.body.classList.contains('light-mode');
            temayiAyarla(acikMi);
        });
    });

    // CUSTOM SELECTBOX KURULUM MOTORU
    if (customDropdown && customButon && customListesi && ilSecici) {
        // Option'ları Custom Listeye Bas
        customListesi.innerHTML = '';
        Array.from(ilSecici.options).forEach(opt => {
            const div = document.createElement('div');
            div.className = `dropdown-option ${opt.value === seciliPlakaKodu ? 'selected' : ''}`;
            div.dataset.value = opt.value;
            div.innerHTML = `<span>${opt.text.split(' - ')[1]}</span> <span style="color:var(--accent-cyan); font-family:'JetBrains Mono'; font-size:0.85rem;">[${opt.value}]</span>`;

            div.addEventListener('click', () => {
                ilSecici.value = opt.value;
                seciliPlakaKodu = opt.value;

                // Seçili stili güncelle
                customListesi.querySelectorAll('.dropdown-option').forEach(el => el.classList.remove('selected'));
                div.classList.add('selected');
                if (secilenMetin) secilenMetin.textContent = opt.text;

                customDropdown.classList.remove('open');
                customButon.setAttribute('aria-expanded', 'false');
                if (aramaGirdisi) aramaGirdisi.value = '';
                listeyiFiltrele('');

                if (konumHataKutusu) konumHataKutusu.style.display = 'none';
                havaVerisiGetir(seciliPlakaKodu);
            });
            customListesi.appendChild(div);
        });

        // Buton Tıklaması ile Menü Aç/Kapat
        customButon.addEventListener('click', (olay) => {
            olay.stopPropagation();
            const acikMi = customDropdown.classList.toggle('open');
            customButon.setAttribute('aria-expanded', acikMi);
            if (acikMi && aramaGirdisi) {
                aramaGirdisi.focus();
            }
        });

        // Arama Kutusu Filtreleme
        if (aramaGirdisi) {
            aramaGirdisi.addEventListener('click', o => o.stopPropagation());
            aramaGirdisi.addEventListener('input', (o) => {
                listeyiFiltrele(o.target.value);
            });
        }

        // Dışarı Tıklayınca Menüyü Kapat
        document.addEventListener('click', (olay) => {
            if (customDropdown && !customDropdown.contains(olay.target)) {
                customDropdown.classList.remove('open');
                customButon.setAttribute('aria-expanded', 'false');
            }
        });
    }

    function listeyiFiltrele(kelime) {
        if (!customListesi) return;
        const ara = kelime.toLocaleLowerCase('tr-TR').trim();
        const ogeler = customListesi.querySelectorAll('.dropdown-option');

        ogeler.forEach(oge => {
            const metin = oge.textContent.toLocaleLowerCase('tr-TR');
            if (metin.includes(ara)) {
                oge.style.display = 'flex';
            } else {
                oge.style.display = 'none';
            }
        });
    }

    // HAMBURGER MENÜ YÖNETİMİ
    if (mobilMenuButonu && anaNavigasyon) {
        mobilMenuButonu.addEventListener('click', () => {
            anaNavigasyon.classList.toggle('menu-open');
            const ikon = mobilMenuButonu.querySelector('i');

            if (anaNavigasyon.classList.contains('menu-open')) {
                ikon.setAttribute('data-lucide', 'x');
                mobilMenuButonu.style.borderColor = 'var(--accent-cyan)';
            } else {
                ikon.setAttribute('data-lucide', 'menu');
                mobilMenuButonu.style.borderColor = 'rgba(255, 255, 255, 0.1)';
            }
            if (window.lucide) window.lucide.createIcons();
        });
    }

    // SAYFA AÇILDIĞI AN OTOMATİK KONUM ALGILAMA VE ŞEHİR SEÇME (ZORUNLU GPS MODU)
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(pos => {
            haversineEnYakinIliBul(pos.coords.latitude, pos.coords.longitude);
        }, () => { }, { 
            enableHighAccuracy: true, 
            timeout: 20000, // Kapalı alanda uydudan sinyal almak daha uzun sürebilir
            maximumAge: 0   // Asla önbellekteki (eski) konumu kullanma, canlı uyduya bağlan
        });
    }

    // ŞEHİR DEĞİŞİMİ (ARKA PLAN)
    ilSecici.addEventListener('change', (olay) => {
        seciliPlakaKodu = olay.target.value;
        const opt = ilSecici.options[ilSecici.selectedIndex];
        if (secilenMetin && opt) {
            secilenMetin.textContent = opt.text;
        }
        if (customListesi) {
            customListesi.querySelectorAll('.dropdown-option').forEach(el => el.classList.remove('selected'));
            const oge = customListesi.querySelector(`.dropdown-option[data-value="${seciliPlakaKodu}"]`);
            if (oge) oge.classList.add('selected');
        }
        if (konumHataKutusu) konumHataKutusu.style.display = 'none';
        havaVerisiGetir(seciliPlakaKodu);
    });

    // KONUM BULMA (OTONOM MİKRO-BİLDİRİM VE ANİMASYON SİSTEMİ)
    if (konumBulButonu) {
        konumBulButonu.addEventListener('click', () => {
            if (konumHataKutusu) konumHataKutusu.style.display = 'none';

            const ikon = konumBulButonu.querySelector('i');
            if (ikon) ikon.setAttribute('data-lucide', 'loader-2');
            if (ikon) ikon.classList.add('spin');
            if (konumButonMetni) konumButonMetni.textContent = "Aranıyor...";
            if (window.lucide) window.lucide.createIcons();

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (pozisyon) => {
                        const enlem = pozisyon.coords.latitude;
                        const boylam = pozisyon.coords.longitude;

                        if (ikon) ikon.setAttribute('data-lucide', 'check-circle-2');
                        if (ikon) ikon.classList.remove('spin');
                        if (konumButonMetni) konumButonMetni.textContent = "Tespit Edildi!";
                        if (window.lucide) window.lucide.createIcons();

                        setTimeout(() => {
                            if (ikon) ikon.setAttribute('data-lucide', 'navigation');
                            if (konumButonMetni) konumButonMetni.textContent = "En Yakın Konumu Bul";
                            if (window.lucide) window.lucide.createIcons();
                        }, 2500);

                        haversineEnYakinIliBul(enlem, boylam);
                    },
                    (hata) => {
                        console.warn("Konum izni alınamadı.", hata);

                        if (ikon) ikon.setAttribute('data-lucide', 'navigation');
                        if (ikon) ikon.classList.remove('spin');
                        if (konumButonMetni) konumButonMetni.textContent = "En Yakın Konumu Bul";
                        if (window.lucide) window.lucide.createIcons();

                        // Kaba alert yerine şık bildirim kutusunu aç
                        if (konumHataKutusu) {
                            konumHataKutusu.querySelector('#konumHataMetni').textContent = "Konum kapalı. Tarayıcı izinlerini kontrol ediniz.";
                            konumHataKutusu.style.display = 'flex';
                            if (window.lucide) window.lucide.createIcons();
                            setTimeout(() => {
                                konumHataKutusu.style.display = 'none';
                            }, 5000);
                        }
                    },
                    { 
                        timeout: 20000, // Kapalı alanda uydudan bağlanmak için 20 saniye bekle
                        enableHighAccuracy: true, 
                        maximumAge: 0   // Sadece canlı uydu (GPS) verisini kabul et
                    }
                );
            } else {
                if (ikon) ikon.setAttribute('data-lucide', 'navigation');
                if (ikon) ikon.classList.remove('spin');
                if (konumButonMetni) konumButonMetni.textContent = "En Yakın Konumu Bul";
                if (window.lucide) window.lucide.createIcons();

                if (konumHataKutusu) {
                    konumHataKutusu.querySelector('#konumHataMetni').textContent = "Tarayıcınız konum servisini desteklemiyor.";
                    konumHataKutusu.style.display = 'flex';
                    if (window.lucide) window.lucide.createIcons();
                    setTimeout(() => konumHataKutusu.style.display = 'none', 5000);
                }
            }
        });
    }

    function haversineEnYakinIliBul(hedefEnlem, hedefBoylam) {
        const R = 6371;
        let enKucukMesafe = Infinity;
        let enYakinPlaka = seciliPlakaKodu;
        let enYakinSehirAdi = ilSecici.options[ilSecici.selectedIndex].text.split(' - ')[1].split(' (')[0];

        const secenekler = Array.from(ilSecici.options);

        secenekler.forEach(option => {
            const dataEnlem = parseFloat(option.getAttribute('data-enlem'));
            const dataBoylam = parseFloat(option.getAttribute('data-boylam'));

            if (!isNaN(dataEnlem) && !isNaN(dataBoylam)) {
                const dLat = (dataEnlem - hedefEnlem) * Math.PI / 180;
                const dLon = (dataBoylam - hedefBoylam) * Math.PI / 180;
                const lat1 = hedefEnlem * Math.PI / 180;
                const lat2 = dataEnlem * Math.PI / 180;

                const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                    Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
                const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                const mesafe = R * c;

                if (mesafe < enKucukMesafe) {
                    enKucukMesafe = mesafe;
                    enYakinPlaka = option.value;
                    enYakinSehirAdi = option.text.split(' - ')[1].split(' (')[0];
                }
            }
        });

        seciliPlakaKodu = enYakinPlaka;
        ilSecici.value = enYakinPlaka;

        const opt = ilSecici.options[ilSecici.selectedIndex];
        if (secilenMetin && opt) {
            secilenMetin.textContent = opt.text;
        }

        if (customListesi) {
            customListesi.querySelectorAll('.dropdown-option').forEach(el => el.classList.remove('selected'));
            const oge = customListesi.querySelector(`.dropdown-option[data-value="${enYakinPlaka}"]`);
            if (oge) oge.classList.add('selected');
        }

        havaVerisiGetir(seciliPlakaKodu);
    }

    // SEKME DEĞİŞİMİ VE İSTASYON BARI OTOMASYONU
    menuButonlari.forEach(buton => {
        buton.addEventListener('click', () => {
            menuButonlari.forEach(b => b.classList.remove('active'));
            sekmeIcerikleri.forEach(s => s.classList.remove('active'));

            buton.classList.add('active');
            const hedefSekmeId = buton.dataset.tab;
            const hedefSekme = document.getElementById(hedefSekmeId);
            if (hedefSekme) hedefSekme.classList.add('active');

            // HavAI Asistan, AI Model Analizi ve Barajlar sekmelerinde İstasyon Seçme Barını Gizle
            if (topActionsBar) {
                if (hedefSekmeId === 'assistant' || hedefSekmeId === 'models' || hedefSekmeId === 'dams') {
                    topActionsBar.style.display = 'none';
                } else {
                    topActionsBar.style.display = '';
                }
            }

            if (hedefSekmeId === 'dashboard' && meteorolojiVerisi) {
                grafikOlustur(meteorolojiVerisi.sehir.aylik_tahmin);
            }

            if (hedefSekmeId === 'dams') {
                barajVerileriniGetir('hepsi');
            }

            if (anaNavigasyon && anaNavigasyon.classList.contains('menu-open')) {
                anaNavigasyon.classList.remove('menu-open');
                if (mobilMenuButonu) {
                    const ikon = mobilMenuButonu.querySelector('i');
                    ikon.setAttribute('data-lucide', 'menu');
                    mobilMenuButonu.style.borderColor = 'rgba(255, 255, 255, 0.1)';
                    if (window.lucide) window.lucide.createIcons();
                }
            }
        });
    });

    // LOGO TIKLANDIĞINDA "CANLI GÖZLEM & AI" SEKMESİNE GİT
    const brandLogo = document.querySelector('.brand');
    if (brandLogo) {
        brandLogo.addEventListener('click', (olay) => {
            olay.preventDefault();
            const dashboardBtn = document.querySelector('.nav-btn[data-tab="dashboard"]');
            if (dashboardBtn) {
                dashboardBtn.click();
            }
        });
    }

    // SEKTÖREL RADAR FİLTRELEME
    uyariFiltreButonlari.forEach(buton => {
        buton.addEventListener('click', () => {
            uyariFiltreButonlari.forEach(b => b.classList.remove('active', 'btn-primary'));
            uyariFiltreButonlari.forEach(b => b.classList.add('btn-secondary'));

            buton.classList.remove('btn-secondary');
            buton.classList.add('active', 'btn-primary');

            uyarilariFiltrele(buton.dataset.type);
        });
    });

    // 3 AYLIK GÖRÜNÜM SENARYO FİLTRELEME
    mevsimselFiltreButonlari.forEach(buton => {
        buton.addEventListener('click', () => {
            mevsimselFiltreButonlari.forEach(b => b.classList.remove('active', 'btn-primary'));
            mevsimselFiltreButonlari.forEach(b => b.classList.add('btn-secondary'));

            buton.classList.remove('btn-secondary');
            buton.classList.add('active', 'btn-primary');

            mevsimselRiskleriFiltrele(buton.dataset.type);
        });
    });

    sohbetGonderButonu.addEventListener('click', sohbetGonder);
    sohbetGirdisi.addEventListener('keypress', (olay) => {
        if (olay.key === 'Enter') sohbetGonder();
    });

    // FOOTER NAVİGASYON MOTORU (SEKME VE FİLTRE TETİKLEYİCİ)
    const footerLinkleri = document.querySelectorAll('.footer-nav-link');
    footerLinkleri.forEach(link => {
        link.addEventListener('click', (olay) => {
            olay.preventDefault();
            const hedefSekmeId = link.dataset.tab;
            const hedefFiltre = link.dataset.filter;

            // Yukarı yumuşakça kaydır
            window.scrollTo({ top: 0, behavior: 'smooth' });

            // Üst menü butonlarındaki active durumunu güncelle
            menuButonlari.forEach(b => {
                b.classList.remove('active');
                if (b.dataset.tab === hedefSekmeId) b.classList.add('active');
            });

            // Sekmeleri güncelle
            sekmeIcerikleri.forEach(s => s.classList.remove('active'));
            const hedefSekme = document.getElementById(hedefSekmeId);
            if (hedefSekme) hedefSekme.classList.add('active');

            if (topActionsBar) {
                if (hedefSekmeId === 'assistant' || hedefSekmeId === 'models') {
                    topActionsBar.style.display = 'none';
                } else {
                    topActionsBar.style.display = '';
                }
            }

            if (hedefSekmeId === 'dashboard' && meteorolojiVerisi) {
                grafikOlustur(meteorolojiVerisi.sehir.aylik_tahmin);
            }

            // Varsa ilgili filtre butonunu tetikle
            if (hedefFiltre && hedefSekmeId === 'radar') {
                setTimeout(() => {
                    const filtreBtn = document.querySelector(`.alert-filter-btn[data-type="${hedefFiltre}"]`);
                    if (filtreBtn) filtreBtn.click();
                }, 100);
            }
        });
    });

    async function havaVerisiGetir(plaka, sessizMi = false) {
        try {
            const cevap = await fetch(`api/canli_hava_verisi.php?plaka_kodu=${plaka}`);
            if (!cevap.ok) throw new Error("API Verisi Alınamadı");
            const veri = await cevap.json();
            meteorolojiVerisi = veri;

            arayuzuGuncelle(veri.sehir, veri.kaynak);
            grafikOlustur(veri.sehir.aylik_tahmin);
            if (!sessizMi) yataySeridiOlustur(veri.sehir.aylik_tahmin);

            if (veri.uyarilar && !sessizMi) {
                window.tumUyarilar = veri.uyarilar;
                uyarilariEkranaBas(veri.uyarilar);
            }
            if (veri.mevsimsel && !sessizMi) {
                window.tumMevsimAylari = veri.mevsimsel.aylar;
                mevsimselArayuzuGuncelle(veri.mevsimsel);
            }
            if (!sessizMi) karsilastirmaVerisiGetir();
            bolgelerVerisiniGetir(sessizMi);
        } catch (hata) {
            console.error("Meteoroloji Canlı Senkronizasyon Hatası:", hata);
        }
    }

    async function bolgelerVerisiniGetir(sessizMi = false) {
        const izgara = document.getElementById('bolgelerIzgarasi');
        if (!izgara) return;

        try {
            const cevap = await fetch('api/bolgesel_hava_verisi.php');
            if (!cevap.ok) return;
            const veri = await cevap.json();

            if (veri.durum === 'basarili' && veri.bolgeler) {
                if (izgara.children.length === veri.bolgeler.length) {
                    // Sadece içerikleri güncelle ve değişim varsa parlat
                    veri.bolgeler.forEach((b, index) => {
                        const kart = izgara.children[index];
                        const tempEl = kart.querySelector('.region-temp');
                        const rangeEl = kart.querySelector('.region-range');
                        const condEl = kart.querySelector('.region-condition span');
                        const rainEl = kart.querySelector('.region-rain-badge');
                        const noteEl = kart.querySelector('.region-ai-note');

                        if (tempEl && tempEl.textContent !== `${b.sicaklik}°C`) {
                            tempEl.textContent = `${b.sicaklik}°C`;
                            tempEl.classList.add('glow-update');
                            setTimeout(() => tempEl.classList.remove('glow-update'), 1200);
                        }
                        if (rangeEl) rangeEl.textContent = `(${b.min}°C - ${b.max}°C)`;
                        if (condEl) condEl.textContent = b.durum;
                        if (rainEl) rainEl.innerHTML = `<i data-lucide="cloud-rain" style="width:14px;height:14px;"></i> %${b.yagis_ihtimali} Yağış Olasılığı`;
                        if (noteEl && noteEl.innerHTML.trim() !== b.ai_notu) {
                            noteEl.innerHTML = b.ai_notu;
                        }
                    });
                    if (window.lucide) window.lucide.createIcons();
                } else {
                    izgara.innerHTML = '';
                    veri.bolgeler.forEach(b => {
                        const kart = document.createElement('div');
                        kart.className = `region-card region-${b.kod}`;
                        kart.innerHTML = `
                            <div class="region-card-header">
                                <div>
                                    <div class="region-card-title">${b.bolge_adi}</div>
                                    <div class="region-card-subtitle"><i data-lucide="map-pin" style="width:14px;height:14px;"></i> ${b.ornek_sehir}</div>
                                </div>
                                <i data-lucide="${b.ikon}" class="region-icon"></i>
                            </div>
                            <div>
                                <div class="region-temp-area">
                                    <span class="region-temp">${b.sicaklik}°C</span>
                                    <span class="region-range">(${b.min}°C - ${b.max}°C)</span>
                                </div>
                                <div class="region-condition">
                                    <span>${b.durum}</span>
                                </div>
                                <div class="region-rain-badge">
                                    <i data-lucide="cloud-rain" style="width:14px;height:14px;"></i> %${b.yagis_ihtimali} Yağış Olasılığı
                                </div>
                                <div class="region-ai-note">
                                    ${b.ai_notu}
                                </div>
                            </div>
                        `;
                        izgara.appendChild(kart);
                    });
                    if (window.lucide) window.lucide.createIcons();
                }
            }
        } catch (hata) {
            console.error("Bölgeler Verisi Hatası:", hata);
        }
    }

    // AKILLI CANLI DOM GÜNCELLEYİCİ (DEĞİŞİM VARSA PARLAT)
    function canliOgeyiGuncelle(id, yeniDeger) {
        const el = document.getElementById(id);
        if (!el) return;
        const yeniMetin = yeniDeger.toString();
        if (el.textContent !== yeniMetin) {
            el.textContent = yeniMetin;
            el.classList.add('glow-update');
            setTimeout(() => el.classList.remove('glow-update'), 1200);
        }
    }

    function arayuzuGuncelle(sehir, kaynakMetni) {
        canliOgeyiGuncelle('sehirAdi', sehir.sehir_adi);
        canliOgeyiGuncelle('bolgeAdi', `${sehir.bolge} Bölgesi`);
        canliOgeyiGuncelle('mevcutSicaklik', sehir.anlik.sicaklik);
        canliOgeyiGuncelle('durumMetni', sehir.anlik.durum_metni);
        canliOgeyiGuncelle('hissedilenSicaklik', `AI Hissedilen: ${sehir.anlik.hissedilen}°C`);
        canliOgeyiGuncelle('uvIndeksi', sehir.anlik.uv_indeksi);
        canliOgeyiGuncelle('ruzgarHizi', `${sehir.anlik.ruzgar} km/s`);
        canliOgeyiGuncelle('nemOrani', `%${sehir.anlik.nem}`);
        canliOgeyiGuncelle('yapayZekaGuvenSkoru', `%${sehir.anlik.guven_skoru}`);

        const kaynakRozeti = `<span style="display:inline-flex;align-items:center;gap:0.4rem;margin-top:0.75rem;font-size:0.8rem;background:rgba(139,92,246,0.2);color:#c084fc;padding:0.4rem 0.85rem;border-radius:100px;border:1px solid rgba(139,92,246,0.4);box-shadow:0 0 15px rgba(139,92,246,0.2);"><i data-lucide="cpu" style="width:14px;height:14px;"></i> ${kaynakMetni}</span>`;
        document.getElementById('yapayZekaOzetMetni').innerHTML = `<strong>${sehir.sehir_adi} MeteoAI TR Algoritmik Analiz:</strong> ${sehir.yapay_zeka_ozeti} <br>${kaynakRozeti}`;

        const anaIkon = document.getElementById('anaHavaIkono');
        if (anaIkon && anaIkon.getAttribute('data-lucide') !== sehir.anlik.ikon) {
            anaIkon.className = 'lucide-icon weather-icon-lg glow-update';
            anaIkon.setAttribute('data-lucide', sehir.anlik.ikon);
            if (window.lucide) window.lucide.createIcons();
            setTimeout(() => anaIkon.classList.remove('glow-update'), 1200);
        }
    }

    // OTONOM GERÇEK ZAMANLI AJAX SENKRONİZASYONU (HER 5 SANİYEDE BİLGİ TAZELEME)
    setInterval(() => {
        havaVerisiGetir(seciliPlakaKodu, true);

        // Eğer Barajlar sekmesi aktifse, baraj verilerini de sessizce ve parlatarak güncelle
        const barajSekmesi = document.getElementById('dams');
        if (barajSekmesi && barajSekmesi.classList.contains('active')) {
            const aktifPill = document.querySelector('#barajSehirFiltreleri .dam-pill.active');
            const plaka = aktifPill ? aktifPill.dataset.plaka : 'hepsi';
            barajVerileriniGetirSessiz(plaka);
        }
    }, 5000);

    function yataySeridiOlustur(tahminListesi) {
        const haftalikKutu = document.getElementById('haftalikTahminSeridi');
        const aylikKutu = document.getElementById('aylikTahminSeridi');
        if (!haftalikKutu || !aylikKutu) return;

        haftalikKutu.innerHTML = '';
        aylikKutu.innerHTML = '';

        tahminListesi.forEach((gun, sira) => {
            const kart = document.createElement('div');
            kart.className = `day-card ${sira === 0 ? 'today' : ''}`;

            const aiGuven = gun.ai_guven_skoru ? `<div class="ai-guven-text">AI Öngörü: %${gun.ai_guven_skoru}</div>` : '';

            let gosterilenYagis = "Veri Yok";
            if (gun.yagis_ihtimali !== undefined && gun.yagis_ihtimali !== null && !isNaN(gun.yagis_ihtimali)) {
                gosterilenYagis = `%${Math.round(gun.yagis_ihtimali)}`;
            } else if (gun.yagis !== undefined && gun.yagis !== null && !isNaN(gun.yagis)) {
                gosterilenYagis = `%${Math.round(gun.yagis)}`;
            } else {
                gosterilenYagis = "Hesaplanıyor";
            }

            if (sira < 7) {
                kart.style.borderColor = 'rgba(16,185,129,0.4)';
                kart.innerHTML = `
                    <div class="day-date">${gun.tarih} <span style="font-size: 0.9rem; font-weight: 600; color: rgba(16, 185, 129, 0.95); display: block; margin-top: 0.35rem;">${gun.gun_adi || ''}</span></div>
                    <i data-lucide="${gun.ikon || 'sun'}" class="day-icon"></i>
                    <div class="day-temp-range">
                        <span class="temp-max">${gun.en_yuksek}°</span>
                        <span class="temp-min">${gun.en_dusuk}°</span>
                    </div>
                    <div class="day-rain"><i data-lucide="droplet" style="width:14px;height:14px;"></i> ${gosterilenYagis}</div>
                    <div class="obs-type exact">Kesin Gözlem</div>
                    ${aiGuven}
                `;
                haftalikKutu.appendChild(kart);
            } else {
                kart.style.borderColor = 'rgba(139,92,246,0.4)';
                kart.innerHTML = `
                    <div class="day-date">${gun.tarih} <span style="font-size: 0.8rem; font-weight: 600; color: rgba(192, 132, 252, 0.95); display: block; margin-top: 0.25rem;">${gun.gun_adi || ''}</span></div>
                    <i data-lucide="${gun.ikon || 'sun'}" class="day-icon"></i>
                    <div class="day-temp-range">
                        <span class="temp-max">${gun.en_yuksek}°</span>
                        <span class="temp-min">${gun.en_dusuk}°</span>
                    </div>
                    <div class="day-rain"><i data-lucide="droplet" style="width:12px;height:12px;"></i> ${gosterilenYagis}</div>
                    <div class="obs-type ai-ext">AI Uzantısı</div>
                    ${aiGuven}
                `;
                aylikKutu.appendChild(kart);
            }
        });

        if (window.lucide) window.lucide.createIcons();
    }

    function grafikOlustur(tahminListesi) {
        const tuval = document.getElementById('sicaklikTrendGrafigi').getContext('2d');
        const etiketler = tahminListesi.map(g => g.tarih);
        const enYuksekler = tahminListesi.map(g => g.en_yuksek);
        const enDusukler = tahminListesi.map(g => g.en_dusuk);

        const yagisOranlari = tahminListesi.map(g => {
            if (g.yagis_ihtimali !== undefined && g.yagis_ihtimali !== null && !isNaN(g.yagis_ihtimali)) return g.yagis_ihtimali;
            if (g.yagis !== undefined && g.yagis !== null && !isNaN(g.yagis)) return g.yagis;
            return 10;
        });

        if (sicaklikGrafigi) {
            sicaklikGrafigi.destroy();
        }

        const isLight = document.body.classList.contains('light-mode');

        sicaklikGrafigi = new Chart(tuval, {
            type: 'line',
            data: {
                labels: etiketler,
                datasets: [
                    {
                        label: 'AI En Yüksek (°C)',
                        data: enYuksekler,
                        borderColor: '#06b6d4',
                        backgroundColor: isLight ? 'rgba(6, 182, 212, 0.25)' : 'rgba(6, 182, 212, 0.15)',
                        borderWidth: 3,
                        tension: 0.4,
                        fill: true,
                        yAxisID: 'y'
                    },
                    {
                        label: 'AI En Düşük (°C)',
                        data: enDusukler,
                        borderColor: '#8b5cf6',
                        backgroundColor: 'transparent',
                        borderWidth: 2,
                        borderDash: [5, 5],
                        tension: 0.4,
                        yAxisID: 'y'
                    },
                    {
                        label: 'MeteoAI Yağış İhtimali (%)',
                        data: yagisOranlari,
                        type: 'bar',
                        backgroundColor: isLight ? 'rgba(59, 130, 246, 0.4)' : 'rgba(59, 130, 246, 0.25)',
                        borderColor: '#3b82f6',
                        borderWidth: 1,
                        borderRadius: 8,
                        yAxisID: 'y1'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: isLight ? '#0f172a' : '#f8fafc',
                            font: { family: 'Outfit', size: 13, weight: 'bold' },
                            padding: 20
                        }
                    }
                },
                scales: {
                    x: {
                        grid: { color: isLight ? 'rgba(15, 23, 42, 0.08)' : 'rgba(255, 255, 255, 0.05)' },
                        ticks: { color: isLight ? '#334155' : '#cbd5e1', font: { family: 'Outfit', size: 12, weight: 'bold' } }
                    },
                    y: {
                        title: { display: true, text: 'Sıcaklık (°C)', color: isLight ? '#0284c7' : '#00f2fe', font: { family: 'Outfit', size: 14, weight: 'bold' } },
                        grid: { color: isLight ? 'rgba(15, 23, 42, 0.08)' : 'rgba(255, 255, 255, 0.05)' },
                        ticks: { color: isLight ? '#0284c7' : '#00f2fe', font: { family: 'JetBrains Mono', size: 12, weight: 'bold' }, callback: val => `${val}°C` }
                    },
                    y1: {
                        position: 'right',
                        title: { display: true, text: 'Yağış Olasılığı (%)', color: isLight ? '#2563eb' : '#60a5fa', font: { family: 'Outfit', size: 14, weight: 'bold' } },
                        grid: { display: false },
                        min: 0,
                        max: 100,
                        ticks: { color: isLight ? '#2563eb' : '#60a5fa', font: { family: 'JetBrains Mono', size: 12, weight: 'bold' }, callback: deger => `%${deger}` }
                    }
                }
            }
        });
    }

    function uyarilariEkranaBas(uyarilar) {
        const izgara = document.getElementById('uyarilarIzgarasi');
        if (!izgara) return;
        izgara.innerHTML = '';

        if (uyarilar.length === 0) {
            izgara.innerHTML = `<div class="glass-card" style="grid-column:1/-1;text-align:center;">MeteoAI TR radarında aktif sektörel uyarı bulunmamaktadır. Sistem stabil.</div>`;
            return;
        }

        uyarilar.forEach(uyari => {
            let ikonAdi = 'alert-triangle';
            if (uyari.type === 'Tarım') ikonAdi = 'sprout';
            if (uyari.type === 'Enerji') ikonAdi = 'zap';
            if (uyari.type === 'Afet') ikonAdi = 'shield-alert';

            let ozelStil = '';
            let sevSınıfı = `severity-${uyari.severity}`;
            if (uyari.severity.includes('EKSTREM')) {
                ozelStil = 'border-color: #f43f5e; box-shadow: 0 0 30px rgba(244,63,94,0.3); background: rgba(244,63,94,0.1);';
                sevSınıfı = 'severity-Kritik';
            } else if (uyari.severity.includes('KRİTİK')) {
                ozelStil = 'border-color: #f97316; box-shadow: 0 0 20px rgba(249,115,22,0.2);';
                sevSınıfı = 'severity-Kritik';
            }

            const kart = document.createElement('div');
            kart.className = `alert-card ${sevSınıfı} card-type-${uyari.type}`;
            if (ozelStil) kart.style = ozelStil;

            kart.innerHTML = `
                <div class="alert-header">
                    <span class="alert-badge type-${uyari.type}">
                        <i data-lucide="${ikonAdi}"></i> ${uyari.type}
                    </span>
                    <span class="alert-date"><i data-lucide="calendar" style="width:12px;height:12px;display:inline-block;"></i> ${uyari.date}</span>
                </div>
                <div class="alert-title" style="${uyari.severity.includes('EKSTREM') ? 'color:#f43f5e;font-size:1.2rem;font-weight:800;' : ''}">${uyari.title} (${uyari.severity})</div>
                <div class="alert-region"><i data-lucide="map-pin"></i> ${uyari.region}</div>
                <div class="alert-message">${uyari.message}</div>
            `;
            izgara.appendChild(kart);
        });

        if (window.lucide) window.lucide.createIcons();
    }

    function uyarilariFiltrele(tur) {
        if (!window.tumUyarilar) return;
        if (tur === 'hepsi') {
            uyarilariEkranaBas(window.tumUyarilar);
        } else {
            const filtrelenen = window.tumUyarilar.filter(u => u.type.toLocaleLowerCase('tr-TR') === tur.toLocaleLowerCase('tr-TR'));
            uyarilariEkranaBas(filtrelenen);
        }
    }

    // 3 AYLIK GÖRÜNÜM ARAYÜZ VE KART BASMA MOTORU (AYRI AYRI AYLIK FORMAT)
    function mevsimselArayuzuGuncelle(mevsim) {
        const analizMetni = document.getElementById('mevsimAnalizMetni');
        if (analizMetni) analizMetni.textContent = mevsim.analiz_metni;

        if (mevsim.aylar) {
            window.tumMevsimAylari = mevsim.aylar;
            aylikProjeksiyonlariEkranaBas(mevsim.aylar);
        }
    }

    function aylikProjeksiyonlariEkranaBas(aylar) {
        const container = document.getElementById('aylikProjeksiyonlarContainer');
        if (!container) return;
        container.innerHTML = '';

        if (!aylar || aylar.length === 0) {
            container.innerHTML = `<div class="glass-card" style="grid-column:1/-1;text-align:center;">Aylık projeksiyon verisi bulunamadı.</div>`;
            return;
        }

        aylar.forEach((ay, idx) => {
            const kart = document.createElement('div');
            kart.className = 'month-card glass-card';

            let risklerHtml = '';
            if (ay.riskler && ay.riskler.length > 0) {
                ay.riskler.forEach(r => {
                    let ikon = r.ikon || 'shield-alert';
                    risklerHtml += `
                        <div class="risk-item type-${r.kategori}">
                            <div class="r-head"><i data-lucide="${ikon}"></i> ${r.kategori}</div>
                            <div class="r-body"><strong>${r.baslik}:</strong> ${r.detay}</div>
                        </div>
                    `;
                });
            } else {
                risklerHtml = '<div style="color:#94a3b8; font-size:0.85rem; text-align:center;">Özel risk saptanmadı.</div>';
            }

            kart.innerHTML = `
                <div>
                    <div class="month-header">
                        <h3 class="month-title"><i data-lucide="calendar-clock"></i> ${ay.ay_adi || ''}</h3>
                    </div>
                    
                    <div class="month-stats-row">
                        <div class="m-stat temp">
                            <span class="s-label"><i data-lucide="thermometer-sun"></i> Sıcaklık Sapması</span>
                            <span class="s-val">${ay.sicaklik_sapmasi}</span>
                        </div>
                        <div class="m-stat precip">
                            <span class="s-label"><i data-lucide="droplets"></i> Yağış Değişimi</span>
                            <span class="s-val">${ay.yagis_sapmasi}</span>
                        </div>
                    </div>
                    
                    <div class="month-summary">
                        ${ay.ozet}
                    </div>
                </div>

                <div>
                    <h4 class="month-risks-title"><i data-lucide="shield-alert"></i> Aylık Kritik Risk Faktörleri</h4>
                    <div class="month-risks-list">
                        ${risklerHtml}
                    </div>
                </div>
            `;
            container.appendChild(kart);
        });

        if (window.lucide) window.lucide.createIcons();
    }

    function mevsimselRiskleriFiltrele(kategori) {
        if (!window.tumMevsimAylari) return;
        const tumRiskOgeleri = document.querySelectorAll('#aylikProjeksiyonlarContainer .risk-item');

        tumRiskOgeleri.forEach(oge => {
            if (kategori === 'hepsi') {
                oge.style.display = 'flex';
            } else {
                if (oge.classList.contains(`type-${kategori}`)) {
                    oge.style.display = 'flex';
                } else {
                    oge.style.display = 'none';
                }
            }
        });
    }

    async function karsilastirmaVerisiGetir() {
        try {
            const cevap = await fetch('api/veri_getir.php?islem=karsilastirma');
            const veri = await cevap.json();
            const tabloGövdesi = document.getElementById('karsilastirmaTablosuGövdesi');
            tabloGövdesi.innerHTML = '';

            veri.forEach(satir => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td data-label="Zaman Periyodu"><strong>${satir.gun}</strong></td>
                    <td data-label="ECMWF (Avrupa Modeli)">%${satir.ecmwf}</td>
                    <td data-label="NOAA GFS (Amerikan Modeli)">%${satir.gfs}</td>
                    <td data-label="MeteoAI TR (Yapay Zeka)" class="best-val"><i data-lucide="check-circle-2"></i> %${satir.meteo_ai}</td>
                `;
                tabloGövdesi.appendChild(tr);
            });
            if (window.lucide) window.lucide.createIcons();
        } catch (hata) {
            console.error("Karşılaştırma Tablosu Hatası:", hata);
        }
    }

    async function sohbetGonder() {
        const soru = sohbetGirdisi.value.trim();
        if (!soru) return;

        mesajEkle(soru, 'user');
        sohbetGirdisi.value = '';

        const yaziyorId = mesajEkle('HavAI anlık uydu verilerini ve derin öğrenme modellerini analiz ediyor...', 'ai', true);

        try {
            const cevap = await fetch('api/yapay_zeka_sor.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ soru: soru })
            });
            const veri = await cevap.json();

            const yaziyorMesaji = document.getElementById(yaziyorId);
            if (yaziyorMesaji) yaziyorMesaji.remove();

            let formatliCevap = veri.cevap.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
            formatliCevap += `<div style="margin-top:0.85rem;font-size:0.8rem;color:#10b981;font-family:'JetBrains Mono',monospace;display:flex;align-items:center;gap:0.4rem;"><i data-lucide="shield-check" style="width:14px;height:14px;"></i> [MeteoAI Güvencesi: ${veri.guven_skoru}]</div>`;

            mesajEkle(formatliCevap, 'ai');
        } catch (hata) {
            const yaziyorMesaji = document.getElementById(yaziyorId);
            if (yaziyorMesaji) yaziyorMesaji.remove();
            mesajEkle("Üzgünüm, MeteoAI sunucularıyla veya uydularla anlık iletişim kurulamadı.", 'ai');
        }
    }

    function mesajEkle(metin, gonderici, yaziyorMu = false) {
        const mesajDiv = document.createElement('div');
        mesajDiv.className = `msg ${gonderici}`;
        const id = 'mesaj_' + Math.random().toString(36).substr(2, 9);
        mesajDiv.id = id;

        const avatar = gonderici === 'ai' ? '<i data-lucide="bot"></i>' : '<i data-lucide="user"></i>';

        mesajDiv.innerHTML = `
            <div class="msg-avatar">${avatar}</div>
            <div class="msg-bubble" ${yaziyorMu ? 'style="font-style:italic;opacity:0.7;"' : ''}>${metin}</div>
        `;
        sohbetKutusu.appendChild(mesajDiv);
        sohbetKutusu.scrollTop = sohbetKutusu.scrollHeight;
        if (window.lucide) window.lucide.createIcons();
        return id;
    }

    // BARAJ DOLULUK MOTORU
    let tumBarajVerileri = [];

    function barajVerileriniGetir(plaka = 'hepsi') {
        const izgara = document.getElementById('barajlarIzgarasi');
        if (!izgara) return;

        izgara.innerHTML = '<div style="color:white; padding:2rem;">Baraj sensörleri taranıyor...</div>';

        fetch(`api/baraj_verisi.php?plaka=${plaka}`)
            .then(res => res.json())
            .then(veri => {
                if (veri.durum === "basarili") {
                    tumBarajVerileri = veri.barajlar;

                    const genel = document.getElementById('genelDolulukOrani');
                    const genelBar = document.getElementById('barajGenelDolulukBari');
                    if (genel) genel.textContent = `%${veri.ozet.turkiye_genel_doluluk}`;
                    if (genelBar) genelBar.style.width = `${veri.ozet.turkiye_genel_doluluk}%`;

                    const ist = document.getElementById('istDolulukOrani');
                    const istBar = document.getElementById('istDolulukBari');
                    if (ist) ist.textContent = `%${veri.ozet.istanbul_ortalama}`;
                    if (istBar) istBar.style.width = `${veri.ozet.istanbul_ortalama}%`;

                    const ank = document.getElementById('ankDolulukOrani');
                    const ankBar = document.getElementById('ankDolulukBari');
                    if (ank) ank.textContent = `%${veri.ozet.ankara_ortalama}`;
                    if (ankBar) ankBar.style.width = `${veri.ozet.ankara_ortalama}%`;

                    const gap = document.getElementById('gapDolulukOrani');
                    const gapBar = document.getElementById('gapDolulukBari');
                    if (gap) gap.textContent = `%${veri.ozet.gap_havzasi}`;
                    if (gapBar) gapBar.style.width = `${veri.ozet.gap_havzasi}%`;

                    const rapor = document.getElementById('aiBarajRaporuMetni');
                    if (rapor) rapor.textContent = veri.ai_hidrolojik_rapor;

                    barajlariEkranaBas(tumBarajVerileri);
                }
            })
            .catch(hata => console.error("Baraj verisi çekilemedi:", hata));
    }

    function barajlariEkranaBas(liste) {
        const izgara = document.getElementById('barajlarIzgarasi');
        if (!izgara) return;

        izgara.innerHTML = '';
        if (liste.length === 0) {
            izgara.innerHTML = '<div style="color:#94a3b8; padding:2rem; text-align:center;">Aradığınız kriterde aktif baraj bulunamadı.</div>';
            return;
        }

        liste.forEach(b => {
            const kart = document.createElement('div');
            kart.className = 'dam-card-item';

            let barColor = 'linear-gradient(90deg, #2563eb, #3b82f6)'; // Mavi (65 - 79 arası)
            if (b.doluluk_orani >= 100) barColor = 'linear-gradient(90deg, #ef4444, #dc2626)'; // Kırmızı
            else if (b.doluluk_orani >= 80) barColor = 'linear-gradient(90deg, #f97316, #ea580c)'; // Turuncu
            else if (b.doluluk_orani < 40) barColor = 'linear-gradient(90deg, #ca8a04, #eab308)'; // Sarı (40 altı)
            else if (b.doluluk_orani < 65) barColor = 'linear-gradient(90deg, #059669, #10b981)'; // Yeşil (40 - 64 arası)

            kart.innerHTML = `
                <div>
                    <div class="dam-card-header">
                        <div class="dam-name">${b.isim}</div>
                        <span class="dam-region-badge">${b.sehir}</span>
                    </div>
                    <div style="font-family:'Outfit'; font-size:2.25rem; font-weight:900; color:white; margin-bottom:0.5rem;">%${b.doluluk_orani}</div>
                    <div class="dam-water-bar-bg"><div class="dam-water-fill" style="width: ${b.doluluk_orani}%; background: ${barColor};"></div></div>
                </div>
                <div style="margin-top: 1.5rem; border-top: 1px solid rgba(255,255,255,0.08); padding-top: 1rem;">
                    <div class="dam-details-row">
                        <span style="display:flex; align-items:center; gap:0.4rem;"><i data-lucide="droplet" style="color:#3b82f6; width:14px; height:14px;"></i> Mevcut Su Hacmi:</span>
                        <strong class="dam-aktif-hacim" style="color:white; font-family:'JetBrains Mono', monospace; font-size:1.05rem;">${b.aktif_hacim_hm3} hm³</strong>
                    </div>
                    <div class="dam-details-row" style="margin-bottom:0;">
                        <span style="display:flex; align-items:center; gap:0.4rem;"><i data-lucide="waves" style="color:#94a3b8; width:14px; height:14px;"></i> Maksimum Kapasite:</span>
                        <strong style="color:#94a3b8; font-family:'JetBrains Mono', monospace; font-size:1.05rem;">${b.kapasite_hm3} hm³</strong>
                    </div>
                </div>
            `;
            izgara.appendChild(kart);
        });
        if (window.lucide) window.lucide.createIcons();
    }

    const barajArama = document.getElementById('barajAramaGirdisi');
    if (barajArama) {
        barajArama.addEventListener('input', (olay) => {
            const ara = olay.target.value.toLocaleLowerCase('tr-TR').trim();
            const filtrelenen = tumBarajVerileri.filter(b =>
                b.isim.toLocaleLowerCase('tr-TR').includes(ara) ||
                b.sehir.toLocaleLowerCase('tr-TR').includes(ara)
            );
            barajlariEkranaBas(filtrelenen);
        });
    }

    const barajPills = document.querySelectorAll('#barajSehirFiltreleri .dam-pill');
    if (barajPills) {
        barajPills.forEach(pill => {
            pill.addEventListener('click', () => {
                barajPills.forEach(p => p.classList.remove('active'));
                pill.classList.add('active');
                if (barajArama) barajArama.value = '';
                barajVerileriniGetir(pill.dataset.plaka);
            });
        });
    }

    function barajVerileriniGetirSessiz(plaka = 'hepsi') {
        fetch(`api/baraj_verisi.php?plaka=${plaka}`)
            .then(res => res.json())
            .then(veri => {
                if (veri.durum === "basarili") {
                    tumBarajVerileri = veri.barajlar;

                    canliOgeyiGuncelle('genelDolulukOrani', `%${veri.ozet.turkiye_genel_doluluk}`);
                    canliOgeyiGuncelle('istDolulukOrani', `%${veri.ozet.istanbul_ortalama}`);
                    canliOgeyiGuncelle('ankDolulukOrani', `%${veri.ozet.ankara_ortalama}`);
                    canliOgeyiGuncelle('gapDolulukOrani', `%${veri.ozet.gap_havzasi}`);

                    const genelBar = document.getElementById('barajGenelDolulukBari');
                    if (genelBar) genelBar.style.width = `${veri.ozet.turkiye_genel_doluluk}%`;
                    const istBar = document.getElementById('istDolulukBari');
                    if (istBar) istBar.style.width = `${veri.ozet.istanbul_ortalama}%`;
                    const ankBar = document.getElementById('ankDolulukBari');
                    if (ankBar) ankBar.style.width = `${veri.ozet.ankara_ortalama}%`;
                    const gapBar = document.getElementById('gapDolulukBari');
                    if (gapBar) gapBar.style.width = `${veri.ozet.gap_havzasi}%`;

                    const arama = document.getElementById('barajAramaGirdisi');
                    if (!arama || !arama.value) {
                        barajlariEkranaBasSessiz(tumBarajVerileri);
                    }
                }
            })
            .catch(() => { });
    }

    function barajlariEkranaBasSessiz(liste) {
        const ogeler = document.querySelectorAll('#barajlarIzgarasi .dam-card-item');
        if (ogeler.length === liste.length) {
            ogeler.forEach((kart, sira) => {
                const b = liste[sira];
                const oranEl = kart.querySelector('div > div:nth-child(2)');
                const aktifHacimEl = kart.querySelector('.dam-aktif-hacim');
                const barEl = kart.querySelector('.dam-water-fill');

                if (oranEl && oranEl.textContent !== `%${b.doluluk_orani}`) {
                    oranEl.textContent = `%${b.doluluk_orani}`;
                    oranEl.classList.add('glow-update');
                    setTimeout(() => oranEl.classList.remove('glow-update'), 1200);
                }
                if (aktifHacimEl && aktifHacimEl.textContent !== `${b.aktif_hacim_hm3} hm³`) {
                    aktifHacimEl.textContent = `${b.aktif_hacim_hm3} hm³`;
                    aktifHacimEl.classList.add('glow-update');
                    setTimeout(() => aktifHacimEl.classList.remove('glow-update'), 1200);
                }
                if (barEl) {
                    let guncelRenk = 'linear-gradient(90deg, #2563eb, #3b82f6)';
                    if (b.doluluk_orani >= 100) guncelRenk = 'linear-gradient(90deg, #ef4444, #dc2626)';
                    else if (b.doluluk_orani >= 80) guncelRenk = 'linear-gradient(90deg, #f97316, #ea580c)';
                    else if (b.doluluk_orani < 40) guncelRenk = 'linear-gradient(90deg, #ca8a04, #eab308)';
                    else if (b.doluluk_orani < 65) guncelRenk = 'linear-gradient(90deg, #059669, #10b981)';
                    
                    barEl.style.width = `${b.doluluk_orani}%`;
                    barEl.style.background = guncelRenk;
                }
            });
        } else {
            barajlariEkranaBas(liste);
        }
    }
});
