const PREFIX = "V1";
const CACHED_FILES = [
    '../www/CPIA2B4ProjetWeb/public/css/style.css',
    '../www/CPIA2B4ProjetWeb/app/Views/assets/imgs/oeil_fond_fffaf0.png',
    '../www/CPIA2B4ProjetWeb/public/index.php',
    '../www/CPIA2B4ProjetWeb/manifest.json'
];

self.addEventListener("install", (event) => {
    self.skipWaiting();
    event.waitUntil(
        (async () => {
            const cache = await caches.open(PREFIX);
            await Promise.all([...CACHED_FILES, '../public/offline.html'].map((path) => {
                // console.log(new Request(path));
                return cache.add(new Request(path));
            }))
        })()
    );
    console.log(`${PREFIX} Install`);
});


self.addEventListener("activate", (event) => {
    clients.claim();
    event.waitUntil(
        (async () => {
            const keys = await caches.keys();
            await Promise.all(
                keys.map(key => {
                    if (!key.includes(PREFIX)) {
                        return caches.delete(key);
                    }
                })
            );
        })()
    );
    console.log(`${PREFIX} Active`);
});

self.addEventListener('fetch', (event) => {
    console.log(`Fetching : ${event.request.url}, Mode : ${event.request.mode}`
    );
    if (event.request.mode == 'navigate') {
        event.respondWith(
            (async () => {
                try {
                    const preloadResponse = await event.preloadResponse;
                    if (preloadResponse) {
                        return preloadResponse;
                    }

                    return await fetch(event.request);
                } catch (e) {
                    const cache = await caches.open(PREFIX);
                    return await cache.match('../public/offline.html');
                }
            })()
        );
    } else if (CACHED_FILES.includes(event.request.url)) {
        event.respondWith(caches.match(event.request));
    }
});