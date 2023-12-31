self.addEventListener('install', function(e) {
  console.log('[demoPWA - ServiceWorker] Install event fired.');
  e.waitUntil(
      caches.open(cacheName).then(function(cache) {
          console.log('[demoPWA - ServiceWorker] Caching app shell...');
          return cache.addAll(filesToCache);
      })
  );
});

self.addEventListener('activate', function(e) {
  console.log('[demoPWA - ServiceWorker] Activate event fired.');
  e.waitUntil(
      caches.keys().then(function(keyList) {
          return Promise.all(keyList.map(function(key) {
              if (key !== cacheName) {
                  console.log('[demoPWA - ServiceWorker] Removing old cache...', key);
                  return caches.delete(key);
              }
          }));
      })
  );
  return self.clients.claim();
});

self.addEventListener('fetch', function(e) {
  console.log('[demoPWA - ServiceWorker] Fetch event fired.', e.request.url);
  e.respondWith(
      caches.match(e.request).then(function(response) {
          if (response) {
              console.log('[demoPWA - ServiceWorker] Retrieving from cache...');
              return response;
          }
          console.log('[demoPWA - ServiceWorker] Retrieving from URL...');
          return fetch(e.request);
      })
  );
});