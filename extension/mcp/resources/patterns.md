# functional_status_codes — Functional Patterns Guide

## 1. Handling Any num Response Code

Use `maybeWhenStatusCode` or `maybeMapStatusCode` directly on the raw `int` from any HTTP client — no conversion required.

```dart
import 'package:functional_status_codes/functional_status_codes.dart';

// Works with package:http, Dio, dart:io, or any int status code
T? handleResponse<T>(int statusCode, T Function() parseBody) {
  return statusCode.maybeMapStatusCode(
    orElse: (code) {
      throw StateError('Unexpected status $code');
    },
    isSuccess: (_) => parseBody(),
    isClientError: (code) {
      if (code == StatusCode.notFoundHttp404) return null;
      throw ArgumentError('Client error: $code');
    },
    isServerError: (_) => null, // caller can retry
  );
}
```

**Note:** If you provide `isStatusCode` alongside a category handler, `isStatusCode` always fires first for any valid code (100-599). Omit it when you want category-specific matching.

---

## 2. Specific Code Matching

Convert to a `StatusCode` first, then use `maybeMap` or `maybeWhen` to match individual codes.

```dart
StatusCode? code = rawStatusCode.toRegisteredStatusCode();

final message = code?.maybeMap(
  orElse: (c) => 'HTTP ${c.reason}',
  notFoundHttp404: (_) => 'Resource not found — check the URL',
  unauthorizedHttp401: (_) => 'Please sign in',
  forbiddenHttp403: (_) => 'You do not have access',
  tooManyRequestsHttp429: (_) => 'Rate limited — slow down',
  serviceUnavailableHttp503: (_) => 'Service down — try later',
) ?? 'Unknown status $rawStatusCode';
```

Use `whenOrNull` when you only care about a few codes and want `null` for the rest:

```dart
final retryDelay = code?.whenOrNull(
  tooManyRequestsHttp429: () => Duration(seconds: 60),
  serviceUnavailableHttp503: () => Duration(seconds: 5),
  gatewayTimeoutHttp504: () => Duration(seconds: 2),
);
// null → do not retry
```

---

## 3. Const Mapping (Zero Allocations)

Use `whenConst` / `whenConstOrNull` when mapping to constant values. No closures are created.

```dart
// Map every status code to a log level at compile time
const level = statusCode.whenConst(
  okHttp200: 'info',
  createdHttp201: 'info',
  noContentHttp204: 'info',
  notFoundHttp404: 'warn',
  badRequestHttp400: 'warn',
  unauthorizedHttp401: 'warn',
  internalServerErrorHttp500: 'error',
  serviceUnavailableHttp503: 'error',
  // ...all 93 codes required
);

// Or just the codes you care about — null for everything else
final icon = statusCode.whenConstOrNull(
  okHttp200: '✓',
  notFoundHttp404: '✗',
  internalServerErrorHttp500: '!',
);
```

Category-level const mapping via `whenConstStatusCodeOrNull`:

```dart
final label = rawCode.whenConstStatusCodeOrNull(
  isInformational: 'informational',
  isSuccess: 'success',
  isRedirection: 'redirect',
  isClientError: 'client error',
  isServerError: 'server error',
  orElse: 'unknown',
);
```

---

## 4. Caching Logic (RFC 7231)

`isCacheable` returns `true` for the RFC 7231 cacheable set:
`200, 203, 204, 206, 300, 301, 404, 405, 410, 414, 501`.

```dart
Future<void> fetchAndCache(String key, Future<Response> Function() fetch) async {
  final response = await fetch();
  final code = response.statusCode;

  if (!code.isStatusCode) {
    throw FormatException('Invalid status code: $code');
  }

  if (code.isCacheable) {
    await cache.store(key, response.body);
  }
}
```

Pair with `whenConst` to assign cache TTLs per code:

```dart
final ttl = statusCode.whenConstOrNull(
  okHttp200: Duration(minutes: 5),
  noContentHttp204: Duration(minutes: 1),
  notFoundHttp404: Duration(minutes: 10),  // negative-cache 404s
  movedPermanentlyHttp301: Duration(days: 1),
);

if (ttl != null) await cache.store(key, body, ttl: ttl);
```

---

## 5. Retry Logic

`isRetryable` returns `true` for transient errors:
`408, 425, 429, 500, 502, 503, 504, 511, 598, 599`.

```dart
Future<Response> fetchWithRetry(
  Uri uri, {
  int maxAttempts = 3,
  Duration baseDelay = const Duration(seconds: 1),
}) async {
  for (var attempt = 1; attempt <= maxAttempts; attempt++) {
    final response = await http.get(uri);

    if (!response.statusCode.isRetryable) return response;

    if (attempt == maxAttempts) return response;

    // Exponential backoff
    await Future.delayed(baseDelay * (1 << (attempt - 1)));
  }
  throw StateError('unreachable');
}
```

Combine `isCacheable` and `isRetryable` with category checks:

```dart
response.statusCode.maybeWhenStatusCode(
  orElse: () => Response.error(),
  isSuccess: () => processResponse(response),
  isClientError: () {
    if (response.statusCode.isRetryable) scheduleRetry();
    return Response.clientError(response.statusCode);
  },
  isServerError: () {
    if (response.statusCode.isRetryable) scheduleRetry();
    return Response.serverError(response.statusCode);
  },
);
```

---

## 6. Testing with Random Codes

`StatusCode.random()` generates random codes from any collection — ideal for property-based tests.

```dart
import 'package:test/test.dart';
import 'package:functional_status_codes/functional_status_codes.dart';

test('handler returns null for any client error', () {
  for (var i = 0; i < 50; i++) {
    final code = StatusCode.random(from: StatusCode.clientErrorCodes);
    expect(handleResponse(code, () => 'body'), isNull);
  }
});

test('cache is written for any cacheable code', () async {
  for (var i = 0; i < 20; i++) {
    final code = StatusCode.random(from: StatusCode.cacheableCodes);
    expect(code.isCacheable, isTrue);
    await fetchAndCache('key', () async => Response(statusCode: code));
    expect(cache.has('key'), isTrue);
  }
});

test('retry is attempted for retryable server errors', () {
  for (var i = 0; i < 30; i++) {
    final code = StatusCode.random(from: StatusCode.retryableCodes);
    expect(shouldRetry(code), isTrue);
  }
});

// Combine with custom codes for edge-case testing
test('unknown code is handled gracefully', () {
  final unknown = StatusCode.custom(999);
  expect(unknown.isCustom, isTrue);
  expect(unknown.toRegisteredStatusCode(), isNull);
  expect(handleResponse(unknown, () => 'body'), isNull);
});
```
