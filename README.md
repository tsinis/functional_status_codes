[![Codecov](https://codecov.io/gh/tsinis/functional_status_codes/branch/main/graph/badge.svg?token=VkxPPVjoJ3)](https://codecov.io/gh/tsinis/functional_status_codes)
[![Tests](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml/badge.svg)](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml)
[![CodeFactor](https://www.codefactor.io/repository/github/tsinis/functional_status_codes/badge)](https://www.codefactor.io/repository/github/tsinis/functional_status_codes)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Pub package](https://img.shields.io/pub/v/functional_status_codes.svg)](https://pub.dev/packages/functional_status_codes)

This pure Dart and and dependency-free package provides functionality for working with HTTP status codes in a functional programming style.

## Features

* Extends `num?` types (so `int` included too) with helper functional methods (when, map, maybeWhen, etc.) and boolean getters for handling HTTP status codes.
* Provides `StatusCode` enum for easy handling of all [IANA registered HTTP status codes](https://www.iana.org/assignments/http-status-codes/http-status-codes.xml) and some common [unofficial status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes) (also in functional style (when, map, maybeWhen, etc.)).
* Provides methods for parsing HTTP status codes from `String` and `num` types, and much more.

## Usage

Use your favorite HTTP client libraries such as `http` or `dio` and take advantage of this package's functional API to easily handle HTTP status codes in your Dart project.

```dart
  /// Checks if status code is >=200 & <299.
  print(105.isSuccess); // Prints false.
  print(200.isSuccess); // Prints true.

  /// Prints true in all those cases.
  print(105.isInformational); // Prints true, when status code is >=100 & <199.
  print(300.isRedirection); // Prints true, when status code is >=300 & <399.
  print(404.isClientError); // Prints true, when status code is >=400 & <499.
  print(501.isServerError); // Prints true, when status code is >=500 & <599.

  /// Checks if status code is >=100 & <600.
  print(16.isStatusCode); // Prints false.
  print(160.isStatusCode); // Prints true.

  /// Also with functional style methods like:
  /// - `mapStatusCode`, `maybeMapStatusCode`, `mapToRegisteredStatusCode`,
  /// - `whenStatusCode`, `whenConstStatusCodeOrNull`, `whenConstStatusCode`.
  // Prints 'ok'.
  print(200.maybeMapStatusCode(orElse: (_) => '?', isSuccess: (_) => 'ok'));
  // Prints '?'.
  print(600.whenConstStatusCodeOrNull(isSuccess: () => 'ok') ?? '?');

  /// Any of those `num?` based codes it's possible additionally map to
  /// a registered status code (official and non-official ones).:
  var registeredCode = 160.toRegisteredStatusCode(); // Is null.
  registeredCode = 200.toRegisteredStatusCode(); // Is StatusCode.okHttp200.
  // Handle any type of registered status codes via functional methods:
  registeredCode?.whenOrNull(
    okHttp200: () => print('ok'),
    // Includes all official IAN codes.
    badRequestHttp400: () => print('oh no!'),
    // Includes common unofficial codes too.
    unauthorizedHttp561: () => print('refresh token'),
  );

  /// And much more in the [num?] based extensions and [StatusCode] enum.
  return StatusCode.tryParse(args.join())?.code;
```

## Getting started

To use this package, add `functional_status_codes` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  functional_status_codes: any
```

Then import the package in your Dart code:

```dart
import 'package:functional_status_codes/functional_status_codes.dart';
```

## Additional information

For more information on using this package, check out the API documentation and example.

If you have any issues or suggestions for the package, please file them in the GitHub repository.
