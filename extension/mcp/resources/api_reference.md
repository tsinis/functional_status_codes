# functional_status_codes — API Reference

## Import

```dart
import 'package:functional_status_codes/functional_status_codes.dart';
```

## StatusCode Type

`StatusCode` is an **extension type** over `int` — zero-cost, no boxing at runtime.

```dart
// Use predefined constants — naming: <camelName>Http<NNN>
const ok = StatusCode.okHttp200;          // == 200
const notFound = StatusCode.notFoundHttp404; // == 404
const ise = StatusCode.internalServerErrorHttp500;

// Custom code for non-standard/internal use
const custom = StatusCode.custom(456);

// Interchangeable with int — no casting needed
void send(int code) {}
send(StatusCode.okHttp200); // valid

// Convert from int
final code = StatusCode.maybeFromCode(response.statusCode); // StatusCode?
// ...93 predefined codes covering 1xx-5xx including common unofficial codes
```

## Static Collections

```dart
StatusCode.values              // All 93 known codes (List<StatusCode>)
StatusCode.officialCodes       // IANA-registered subset
StatusCode.informationalCodes  // 1xx
StatusCode.successCodes        // 2xx
StatusCode.redirectionCodes    // 3xx
StatusCode.clientErrorCodes    // 4xx
StatusCode.serverErrorCodes    // 5xx
StatusCode.cacheableCodes      // RFC 7231: 200,203,204,206,300,301,404,405,410,414,501
StatusCode.retryableCodes      // Transient: 408,425,429,500,502,503,504,511,598,599
```

## Static Methods

```dart
StatusCode.random()                                  // random from all values
StatusCode.random(from: StatusCode.serverErrorCodes) // random from subset
StatusCode.tryParse('Response: 404 Not Found')       // → StatusCode? (first match)
StatusCode.maybeFromCode(200)                        // → StatusCode.okHttp200
StatusCode.maybeFromCode(999)                        // → null (unregistered)
StatusCode.maybeFromCode(null)                       // → null
```

## num? Extension — NumStatusCodeExtension

Applies to any `num?`, including raw `int` from HTTP clients.

### Range and Category Checks

```dart
200.isStatusCode       // true  — within 100-599
999.isStatusCode       // false
200.isInformational    // false
200.isSuccess          // true
301.isRedirection      // true
404.isClientError      // true
500.isServerError      // true
404.isError            // true  — isClientError || isServerError
200.isError            // false
```

### Semantic Checks

```dart
200.isCacheable        // true  (RFC 7231)
201.isCacheable        // false
503.isRetryable        // true
200.isRetryable        // false
200.isOneOf(StatusCode.cacheableCodes)  // true
200.isOneOf(const [StatusCode.okHttp200, StatusCode.custom(222)])  // true
```

### Range Helpers

```dart
// Custom numeric range
200.isStatusCodeWithinRange(min: 200, max: 299)  // true

// StatusCode-bounded range
200.isStatusWithinRange(
  min: StatusCode.okHttp200,
  max: StatusCode.imUsedHttp226,
)  // true
```

### Conversion

```dart
200.toRegisteredStatusCode()   // → StatusCode.okHttp200
299.toRegisteredStatusCode()   // → null (not a registered code)
null.toRegisteredStatusCode()  // → null
```

### Functional Methods on num?

```dart
// Exhaustive category dispatch — throws FormatException if out of range
response.statusCode.mapStatusCode(
  isInformational: (code) => ...,
  isSuccess: (code) => ...,
  isRedirection: (code) => ...,
  isClientError: (code) => ...,
  isServerError: (code) => ...,
)

// Optional category dispatch — fallback to orElse
response.statusCode.maybeMapStatusCode(
  orElse: (code) => handleUnknown(code),
  isSuccess: (code) => handleSuccess(code),
  isClientError: (code) => handleClientError(code),
  // unspecified categories fall to orElse
)
// NOTE: isStatusCode handler (if provided) fires before any category handler.

// Zero-arg variants (no value passed to callbacks)
response.statusCode.maybeWhenStatusCode(
  orElse: () => false,
  isSuccess: () => true,
)

// Const-value variant (no closures — direct values)
response.statusCode.whenConstStatusCode(
  isInformational: 'info',
  isSuccess: 'ok',
  isRedirection: 'redirect',
  isClientError: 'client error',
  isServerError: 'server error',
  orElse: 'unknown',
)

// Returns null instead of requiring orElse
response.statusCode.whenConstStatusCodeOrNull(
  isSuccess: 'ok',
  isClientError: 'client error',
)

// Convert then map in one step
response.statusCode.mapToRegisteredStatusCode(
  mapper: (statusCode) => statusCode.reason,
  orElse: (raw) => 'Unknown: $raw',
)
```

## StatusCode Extension — StatusCodeExtension

Applies to `StatusCode` values after conversion.

### Properties

```dart
StatusCode.okHttp200.reason      // "OK"
StatusCode.notFoundHttp404.reason // "Not Found"

StatusCode.okHttp200.isOfficial   // true  — IANA registered
StatusCode.custom(456).isOfficial // false
StatusCode.okHttp200.isCustom     // false
StatusCode.custom(456).isCustom   // true

StatusCode.okHttp200.toStringShallow()
// → 'StatusCode(200, reason: "OK", isOfficial: true)'
```

### Individual Code Checks

One `bool` getter per registered code:

```dart
code.isOkHttp200
code.isNotFoundHttp404
code.isInternalServerErrorHttp500
code.isUnauthorizedHttp401
// ...one per registered constant
```

### Functional Methods on StatusCode

```dart
// Exhaustive — must handle all 93 codes + wildcard fires for custom codes
statusCode.when(
  okHttp200: () => 'success',
  notFoundHttp404: () => 'missing',
  // ...all codes required
)

// Optional — return null for unhandled codes
statusCode.whenOrNull(
  okHttp200: () => 'success',
  notFoundHttp404: () => 'missing',
)

// Optional with fallback
statusCode.maybeWhen(
  orElse: () => 'other',
  okHttp200: () => 'success',
)

// map variants pass the StatusCode value to the callback
statusCode.maybeMap(
  orElse: (code) => 'other: ${code.reason}',
  okHttp200: (code) => 'success',
)

// Const-value variant (no closures)
statusCode.whenConst(
  okHttp200: 'success',
  notFoundHttp404: 'missing',
  // ...all codes required
)

// Const + nullable
statusCode.whenConstOrNull(
  okHttp200: 'success',
  notFoundHttp404: 'missing',
  // unspecified → null
)
```

## Dart 3.10 Dot-Shorthand

```dart
// Enum-like dot syntax on static constants
200.isOneOf(const [.okHttp200, .custom(222)])   // true
response.statusCode.toRegisteredStatusCode() == .notFoundHttp404
```
