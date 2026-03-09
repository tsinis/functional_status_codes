Derive a caching strategy for HTTP status code **{{status_code}}** using the `functional_status_codes` package and RFC 7231 semantics.

{{#cache_backend}}
The cache backend in use is: **{{cache_backend}}**
{{/cache_backend}}
{{^cache_backend}}
Use a generic `cache.store(key, value, {Duration? ttl})` / `cache.get(key)` interface in the example. The caller can adapt it to their backend.
{{/cache_backend}}

Follow these steps:

1. **Evaluate cacheability** using `.isCacheable`:

   The RFC 7231 cacheable set is: `200, 203, 204, 206, 300, 301, 404, 405, 410, 414, 501`.

   ```dart
   if ({{status_code}}.isCacheable) {
     // safe to cache the response body
   }
   ```

2. **Assign a cache TTL** appropriate for code `{{status_code}}`:
   - `200 OK` — moderate TTL (e.g. 5 minutes), respect `Cache-Control` headers when present
   - `301 Moved Permanently` — long TTL (e.g. 1 day), permanent redirect is stable
   - `404 Not Found` — short negative-cache TTL (e.g. 1-10 minutes) to avoid repeated misses
   - `405 Method Not Allowed`, `410 Gone` — moderate TTL, these are stable server decisions
   - `501 Not Implemented` — long TTL, unlikely to change soon
   - `204`, `203`, `206`, `300`, `414` — short to moderate TTL depending on use case

   Use `whenConstOrNull` to express this as a compile-time mapping:

   ```dart
   final ttl = statusCode.whenConstOrNull(
     okHttp200: Duration(minutes: 5),
     noContentHttp204: Duration(minutes: 1),
     notFoundHttp404: Duration(minutes: 10),
     movedPermanentlyHttp301: Duration(days: 1),
     goneHttp410: Duration(hours: 1),
     notImplementedHttp501: Duration(hours: 6),
   );
   ```

3. **Generate the store/skip logic**:
   - If `isCacheable` is `true` for `{{status_code}}`: generate a `cache.store(...)` call{{#cache_backend}} adapted to **{{cache_backend}}**{{/cache_backend}}
   - If `isCacheable` is `false`: explain why this code should not be cached and suggest adding a `Cache-Control: no-store` header to the response if you control the server

4. **Emit a complete, reusable function** that:
   - Checks `isStatusCode` before doing anything (guards against invalid codes)
   - Uses `isCacheable` to gate the write
   - Uses `whenConstOrNull` or `whenConst` for TTL assignment (no runtime allocations)
   - Falls back gracefully for non-cacheable codes (log and skip, do not throw)
