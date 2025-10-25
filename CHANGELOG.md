## 3.1.0

This release adds several new features for better HTTP status code handling, including cacheable/retryable checks, pre-sorted category collections, and a random status code generator. Also includes important bug fixes.

### New Features

- **`isCacheable` getter**: Identifies HTTP status codes that are cacheable according to RFC 7231. Includes 11 status codes: 200, 203, 204, 206, 300, 301, 404, 405, 410, 414, and 501.

  ```dart
  print(200.isCacheable); // true
  print(404.isCacheable); // true
  print(201.isCacheable); // false
  ```

- **`isRetryable` getter**: Identifies HTTP status codes that indicate transient errors suitable for retry logic. Includes 10 status codes: 408, 425, 429, 500, 502, 503, 504, 511, 598, and 599.

  ```dart
  print(503.isRetryable); // true
  print(429.isRetryable); // true
  print(404.isRetryable); // false
  ```

- **Pre-sorted category collections**: Added pre-sorted static lists for better performance when checking status code categories:
  - `StatusCode.informationalCodes` - All 1xx status codes
  - `StatusCode.successCodes` - All 2xx status codes
  - `StatusCode.redirectionCodes` - All 3xx status codes
  - `StatusCode.clientErrorCodes` - All 4xx status codes
  - `StatusCode.serverErrorCodes` - All 5xx status codes
  - `StatusCode.cacheableCodes` - Cacheable status codes
  - `StatusCode.retryableCodes` - Retryable status codes

- **`StatusCode.random()` static method**: Generate random status codes from a collection. Useful for testing, mocking, and demonstrations.

  ```dart
  // Random from all status codes.
  final anyCode = StatusCode.random();

  // Random from specific collection.
  final errorCode = StatusCode.random(from: StatusCode.clientErrorCodes);
  final cacheableCode = StatusCode.random(from: StatusCode.cacheableCodes);

  // Random from custom list.
  final successOrRedirect = StatusCode.random(from: [
    StatusCode.okHttp200,
    StatusCode.movedPermanentlyHttp301,
  ]);
  ```

### Fixes

- **`otExtendedHttp510` renamed to `notExtendedHttp510`**: Fixed typo in the status code name. The old name is now deprecated with a helpful migration message.

  ```dart
  // Before:
  const code = StatusCode.otExtendedHttp510;

  // After:
  const code = StatusCode.notExtendedHttp510;
  ```

- Fixed typo: `otExtendedHttp510` → `notExtendedHttp510` (HTTP 510)
- Fixed incorrect documentation: `networkConnectTimeoutErrorHttp599` is now correctly marked as **unofficial** (was incorrectly marked as official)
- Removed `networkConnectTimeoutErrorHttp599` from `StatusCode.officialCodes` list.

### Deprecations

- `StatusCode.otExtendedHttp510` - Use `StatusCode.notExtendedHttp510` instead.

## 3.0.0

Third anniversary - third version :tada:

**BREAKING CHANGES**: `StatusCode` has been converted from an `enum` to an `extension type`, providing better performance and new capabilities while maintaining most of the existing API.

### Breaking Changes

1. **`toString()` behavior changed**: Now returns just the integer value (e.g., `"200"`), as `StatusCode` is now a lightweight wrapper around `int`. Use `toStringShallow()` if you need the previous detailed format.

2. **`index` property deprecated**: No longer applicable since `StatusCode` is not an enum. The property still works but is deprecated.

3. **`name` property deprecated**: No longer applicable since `StatusCode` is not an enum. The property still works but is deprecated.

4. **`code` property deprecated**: Since `StatusCode` now implements `int` directly, you can use the status code value directly without calling `.code`.

### Migration Guide

#### Using `name` property

Before (v2.x):

```dart
print(StatusCode.okHttp200.name); // Output: "okHttp200"
```

After (v3.x):

```dart
print(StatusCode.okHttp200.name); // Output: "okHttp200"
print(StatusCode.custom(456).name); // Output: "customStatusCode456"
// If you just need the numeric value:
print(StatusCode.okHttp200); // Output: "200"
```

#### Using `toString()` method

Before (v2.x):

```dart
print(StatusCode.okHttp200.toString());
// Output: "StatusCode(200, reason: "OK", isOfficial: true)"
```

After (v3.x):

```dart
print(StatusCode.okHttp200.toString()); // Output: "200"

// Use toStringShallow() for the detailed format:
print(StatusCode.okHttp200.toStringShallow());
// Output: "StatusCode(200, reason: "OK", isOfficial: true)"
```

#### Using `code` property

Before (v2.x):

```dart
final code = StatusCode.okHttp200.code; // Returns: 200
if (response.statusCode == StatusCode.notFoundHttp404.code) { ... }
```

After (v3.x):

```dart
// StatusCode now implements int directly, so just use it as an int:
final code = StatusCode.okHttp200; // IS 200
if (response.statusCode == StatusCode.notFoundHttp404) { ... }

// The .code property still works but is deprecated
```

#### Using as default parameter values

Before (v2.x - NOT POSSIBLE):

```dart
// This was NOT possible with enum:
class ApiClient {
  final int defaultTimeout;
  final int successCode;

  // ERROR: Can't use enum value as compile-time constant
  const ApiClient({this.defaultTimeout = 30, this.successCode = StatusCode.okHttp200.code});
}
```

After (v3.x - NOW POSSIBLE):

```dart
// Now possible with extension type:
class ApiClient {
  final int defaultTimeout;
  final int successCode;

  // Works! StatusCode can be used as compile-time constant
  const ApiClient({
    this.defaultTimeout = 30,
    this.successCode = StatusCode.okHttp200, // Direct use as int!
  });
}
```

#### New Features

- New `mapToRegisteredStatusCodeOrNull` method added!

- **Custom status codes**: You can now create custom status codes that for example weren't registered by IANA:

  ```dart
  const customCode = StatusCode.custom(456);
  print(customCode); // Output: 456
  print(customCode.isCustom); // Output: true
  ```

- **Compile-time constants**: `StatusCode` values can now be used as compile-time constants in default parameter values, const constructors, and annotations.

- **Direct integer operations**: Since `StatusCode` implements `int`, you can use it directly in numeric operations and comparisons without calling `.code`:

  ```dart
  final status = StatusCode.okHttp200;
  if (status >= 200 && status < 300) { ... }
  final newCode = status + 1; // Works!
  ```

- **Zero runtime overhead**: Extension types have no runtime cost compared to using raw integers.

#### Benefits

- **Performance**: Zero-cost abstraction - no boxing/unboxing overhead.
- **Flexibility**: Create custom status codes for internal APIs.
- **Convenience**: Use directly as integers in const contexts.
- **Compatibility**: Most existing code continues to work with deprecation warnings guiding migration.

#### Notes

Most code will continue to work without changes. Deprecated properties include guidance messages to help with migration. The functional methods (`map`, `maybeMap`, `when`, `maybeWhen`, etc.) and `num?` extensions work exactly as before.

## 2.3.0

NEW FEATURE: Added two new methods `isStatusCodeWithinRange` method to `num?` type, allowing for easy checking if a number falls within a specified range and `isStatusWithinRange` method, similar to the `isStatusCodeWithinRange` but leveraging the `StatusCode` enum to define range.

- feat: add is-status(code)within-range methods

## 2.2.0

This release provides extended README documentation with a link to Zapp playground where you can play with a package in a DartPad like environment.

- docs: improve and provide zapp link in the readme
- chore(deps): update ci dependencies

## 2.1.0

NEW FEATURE: Added new methods: a `Map<num, Object?>` like equivalent of `whenStatusCode` + `whenStatusCodeOrNull` methods - `whenConstStatusCode` and `whenConstStatusCodeOrNull`. Should be only used with a constant values (i.e. final, const). And `mapToRegisteredStatusCode` + `maybeMapToRegisteredStatusCode` - alternatives for a `mapStatusCode` that are trying to return a `StatusCode` object instead of `num` for further mapping with a specific registered status code. `StatusCode` now also exposes `RegExp regExp` static getter and `static const pattern` for your needs, also `tryParse` method now allow any `Object?` inputs (not limited to `String?` only anymore).

- feat: added whenConstStatusCode
- feat: added whenConstStatusCodeOrNull
- feat: added mapToRegisteredStatusCode
- feat: added maybeMapToRegisteredStatusCode
- refactor: status code enum now exposes reg-exp and it's pattern
- refactor: status code try-parse method allow any nullable object inputs

## 2.0.0

NEW FEATURE: added 19 new common [unofficial status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes)

- feat: added 19 common unofficial status codes

## 1.2.1

- fix(docs): remove hardcoded reference to version in readme

## 1.2.0

NEW FEATURE: added two new methods for a `Map` like equivalent of `when` and `whenOrNull` methods - `whenConst` and `whenConstOrNull`. Should be only used with a constant values (i.e. final, const).

- feat: added when const and when const or null methods

## 1.1.0

Contains **breaking changes** in `maybeMapStatusCode` method on `num`. Please follow migration guide below.

- refactor!: orElse parameter in maybeMapStatusCode now returns input value in order to handle this unregistered status code.

- docs: updated documentation of breaking update.
- docs: added topics to pubspec.yaml.
- chore: updated SDK upper-bound to 4.0.0.
- refactor: replaced deprecated fields in analysis_options.yaml with new ones.

Since `maybeMapStatusCode` now returns input value, you will have to adjust your existing code, for example:

Replace from:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: () => handleUnregisteredStatusCode(statusCode),
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

Use this instead:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: handleUnregisteredStatusCode,
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

Or if you are using tear-off syntax, replace:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: handleUnregisteredStatusCode,
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

With this instead:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: (_) => handleUnregisteredStatusCode(),
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

## 1.0.6

- docs: fixed contribution guidelines reference link.

## 1.0.5

- docs: changed screenshot to webp format.
- ci(github): added automatic pub.dev publishing workflow.

## 1.0.4

- docs: added screenshot to pub.dev, no code changes.

## 1.0.3

- refactor: small refactoring in generated functional enums extensions and dependencies update.

## 1.0.2

- docs: removing unnecessary information from the documentation.

## 1.0.1

- docs: update README documentation.

## 1.0.0

- initial version.
