const CACHE_NAME = 'meteoai-cache-v1';
const urlsToCache = [
  '/meteoroloji/index.php',
  '/meteoroloji/assets/css/stil.css',
  '/meteoroloji/assets/js/uygulama.js',
  '/meteoroloji/assets/img/logo.webp',
  '/meteoroloji/assets/img/icon-192.png',
  '/meteoroloji/assets/img/icon-512.png',
  'https://unpkg.com/lucide@latest',
  'https://cdn.jsdelivr.net/npm/chart.js'
];

// Install event - Cache static assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        return cache.addAll(urlsToCache);
      })
  );
  self.skipWaiting();
});

// Activate event - Clean old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
  self.clients.claim();
});

// Fetch event - Network first strategy for API, Cache first for statics
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  
  // API isteklerinde her zaman ağı kullan, yoksa hata ver
  if (url.pathname.includes('/api/')) {
    event.respondWith(
      fetch(event.request).catch(err => {
        return new Response(JSON.stringify({ error: 'Bağlantı hatası' }), {
          headers: { 'Content-Type': 'application/json' }
        });
      })
    );
    return;
  }

  // Diğer dosyalarda Network First, fallback to Cache
  event.respondWith(
    fetch(event.request).catch(() => caches.match(event.request))
  );
});
