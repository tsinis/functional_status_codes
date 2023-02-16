[![Codecov](https://codecov.io/gh/tsinis/functional_status_codes/branch/main/graph/badge.svg?token=VkxPPVjoJ3)](https://codecov.io/gh/tsinis/functional_status_codes)
[![Tests](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml/badge.svg)](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml)
[![CodeFactor](https://www.codefactor.io/repository/github/tsinis/functional_status_codes/badge)](https://www.codefactor.io/repository/github/tsinis/functional_status_codes)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Pub package](https://img.shields.io/pub/v/functional_status_codes.svg)](https://pub.dev/packages/functional_status_codes)

This pure Dart and and dependency-free package provides functionality for working with HTTP status codes in a functional programming style.

## Features

* Extends `num` types with helper functional methods (when, map, maybeWhen, etc.) for handling HTTP status codes.
* Provides `StatusCode` enum for easy handling of all [IANA registered HTTP status codes](https://www.iana.org/assignments/http-status-codes/http-status-codes.xml) (also in functional style).
* Provides methods for parsing HTTP status codes from `String` and `num` types, and much more.

## Getting started

To use this package, add `functional_status_codes` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  functional_status_codes: ^1.0.6
```

Then import the package in your Dart code:

```dart
import 'package:functional_status_codes/functional_status_codes.dart';
```

## Usage

Use your favorite HTTP client libraries such as `http` or `dio` and take advantage of this package's functional API to easily handle HTTP status codes in your Dart project.

```dart
final statusCode = response.statusCode; // int status code of response.
if (!response.statusCode.isStatusCode) return null; // Checks if statusCode >=100 & <600.
  final registeredCode = response.statusCode.toRegisteredStatusCode();
  // Handle any type of registered status codes via functional `whenOrNull` method:
  return registeredCode?.whenOrNull(
    okHttp200: () => _parseResponse(response.body),
    badRequestHttp400: () => _showError(),
    orElse: () => _handleUnknownResponse(response),
  );
```

## Additional information

For more information on using this package, check out the API documentation.

If you have any issues or suggestions for the package, please file them in the GitHub repository.
