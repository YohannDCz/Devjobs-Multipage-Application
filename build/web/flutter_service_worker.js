'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "7548f6fba9d47a86e20474739fa43e3f",
"index.html": "d42a9ad85a4b0ddf052d9f82e350d4e9",
"/": "d42a9ad85a4b0ddf052d9f82e350d4e9",
"main.dart.js": "2dee4e449ee601e640bb98c113484873",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "20d07f29dde14585dc5adfdda0c0ced3",
"assets/AssetManifest.json": "ec18e24d872b2daccbb21817d5dc4009",
"assets/NOTICES": "083adc428a554ba4b399c5ac98bba1ba",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/tablet/bg-pattern-header.svg": "10dca9e8535df16d4baf0cfe98f63730",
"assets/assets/logos/pomodoro.svg": "cee12e72edf539d202ac7abefbfc896f",
"assets/assets/logos/vector.svg": "f6c6e17f4431dbc275e112317fa3799e",
"assets/assets/logos/scoot.svg": "f9ceb6d64737338dae225ba0692f7ed6",
"assets/assets/logos/maker.svg": "5677d9355c2673bec6b6f427590ead91",
"assets/assets/logos/crowdfund.svg": "888af78c4bb3dcbd5d8827a31660b9ed",
"assets/assets/logos/typemaster.svg": "b682a32f31e97889b034f657283278d6",
"assets/assets/logos/blogr.svg": "50bfc47a45e494cd9382c5b2b7af332c",
"assets/assets/logos/officelite.svg": "3ba2d9c852b4cd9cd77459c80cf28411",
"assets/assets/logos/mastercraft.svg": "fadb3de5c9e7cdb3e96138b41f484c05",
"assets/assets/logos/creative.svg": "b42165fdb1cb6784f01b228e6ab5281c",
"assets/assets/logos/coffeeroasters.svg": "ae96d9392b961bf75069b74b767ada74",
"assets/assets/logos/pod.svg": "2d76e278dcc4bc3ee7a2f0ad96ab00b1",
"assets/assets/desktop/icon-sun.svg": "20ea2dcbd84639f3c3a0128d676556f6",
"assets/assets/desktop/icon-location.svg": "7c42293b3d14222e6129148e5ffd2671",
"assets/assets/desktop/bg-pattern-header.svg": "549c547037bed3b69613b18fe82026f1",
"assets/assets/desktop/icon-search.svg": "b89fe227f180059b0fd49627ad60622d",
"assets/assets/desktop/bg-pattern-detail-footer.svg": "f5101f61d2c3760bbf1e143f3f6416f8",
"assets/assets/desktop/icon-moon.svg": "a0697094d80fb1eba560070d0145c106",
"assets/assets/desktop/icon-check.svg": "6354efb6d4a8a60b0a3c37edff215b15",
"assets/assets/desktop/logo.svg": "66810c3dcb18afd9ee96edb758f52927",
"assets/assets/data.json": "c283fa193631931542620daf752e9664",
"assets/assets/mobile/bg-pattern-header.svg": "1360e861b646bd6ad7eb291611b87297",
"assets/assets/mobile/bg-pattern-detail-footer.svg": "86300130a32939f1347cb0342fbff196",
"assets/assets/mobile/icon-filter.svg": "3c89a70b5b71137658d6947dce0a025a",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
