[![Codecov](https://codecov.io/gh/tsinis/functional_status_codes/branch/main/graph/badge.svg?token=VkxPPVjoJ3)](https://codecov.io/gh/tsinis/functional_status_codes)
[![Tests](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml/badge.svg)](https://github.com/tsinis/functional_status_codes/actions/workflows/test.yaml)
[![Dart Code Metrics](https://img.shields.io/badge/passing-dcm?style=flat&logo=dart&logoColor=lightskyblue&label=dcm&color=dark-green)](https://dcm.dev)
[![CodeFactor](https://www.codefactor.io/repository/github/tsinis/functional_status_codes/badge)](https://www.codefactor.io/repository/github/tsinis/functional_status_codes)
[![Pub points](https://img.shields.io/pub/points/functional_status_codes)](https://pub.dev/packages/functional_status_codes/score)
[![Created](https://img.shields.io/github/created-at/tsinis/functional_status_codes)](https://github.com/tsinis/functional_status_codes/commit/23d35c4fc890d01b8dc93409738e4fc61712e94f)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Size](https://img.shields.io/github/languages/code-size/tsinis/functional_status_codes)](https://github.com/tsinis/functional_status_codes#why-should-i-use-this-package)
[![Pub package](https://img.shields.io/pub/v/functional_status_codes.svg)](https://pub.dev/packages/functional_status_codes)

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Usage](#usage)
- [FAQ](#faq)
- [Getting started](#getting-started)
- [Additional information](#additional-information)

### Introduction

This pure Dart, fully tested and dependency-free package provides functionality for working with HTTP status codes in a type-safe and functional programming style.

Built on Dart's modern **extension type** feature, `StatusCode` offers a zero-cost abstraction over integers with compile-time safety. Create custom status codes, use them as const values in constructors, and enjoy full IDE autocomplete—all without runtime overhead. Combined with functional methods (`when`, `map`, `maybeWhen`) on `num?` types, you get:

- **Performance**: Zero-cost abstraction - no boxing/unboxing overhead.
- **Flexibility**: Create custom status codes for internal APIs.
- **Convenience**: Use directly as integers in const contexts.
- **Compatibility**: Seamless integration with any HTTP client library.

### Features

- Extends `num?` types (so `int` included too) with helper functional methods (`when`, `map`, `maybeWhen`, etc.) and boolean getters for handling HTTP status codes.
- Provides `StatusCode` extension type (on `int`) for easy handling of all [IANA registered HTTP status codes](https://www.iana.org/assignments/http-status-codes/http-status-codes.xml) and some common [unofficial status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes) (also in functional style (`when`, `map`, `maybeWhen`, etc.)).
- Provides methods for parsing HTTP status codes from `String`, `Object?` and `num` types, and much more.

### Usage

Use your favorite HTTP client libraries such as `http` or `dio` and take advantage of this package's functional API to easily handle HTTP status codes in your Dart project.

```dart
/// Checks if status code is >=200 & <=299.
  print(105.isSuccess); // Prints false.
  print(200.isSuccess); // Prints true.

  /// Prints true in all those cases.
  print(105.isInformational); // Prints true, when status code is >=100 & <=199.
  print(300.isRedirection); // Prints true, when status code is >=300 & <=399.
  print(404.isClientError); // Prints true, when status code is >=400 & <=499.
  print(501.isServerError); // Prints true, when status code is >=500 & <=599.

  /// Checks if status code is >=100 & <=599.
  print(16.isStatusCode); // Prints false.
  print(160.isStatusCode); // Prints true.

  /// Range checks with [num?] based codes.
  print(140.isStatusCodeWithinRange(min: 101, max: 140)); // Prints true.
  print(
    104.isStatusWithinRange(
      min: StatusCode.switchingProtocolsHttp101, // Can be used as integer too.
      max: StatusCode.earlyHintsHttp103,
    ),
  ); // Prints false.

  /// Also with functional style methods like:
  /// - `mapStatusCode`, `maybeMapStatusCode`, `mapToRegisteredStatusCode`,
  /// - `whenStatusCode`, `whenConstStatusCodeOrNull`, `whenConstStatusCode`.
  // Prints 'ok'.
  print(200.maybeMapStatusCode(orElse: (_) => '?', isSuccess: (_) => 'ok'));
  // Prints '?'.
  print(600.whenConstStatusCodeOrNull(isSuccess: () => 'ok') ?? '?');

  /// Any of those [num?] based codes it's possible additionally map to
  /// a registered status code (official and non-official ones).:
  StatusCode? registeredCode = 160.toRegisteredStatusCode();
  print('registeredCode: $registeredCode'); // Prints registeredCode: null.
  registeredCode = 200.toRegisteredStatusCode(); // Is StatusCode.okHttp200.
  // Handle any type of registered status codes via functional methods:
  registeredCode?.whenOrNull(
    okHttp200: () => print('ok'),
    // Includes all official IAN codes.
    badRequestHttp400: () => print('oh no!'),
    // Includes common unofficial codes too.
    unauthorizedHttp561: () => print('refresh token'),
  );
```

### FAQ

#### Why should I use this package?

The use of `StatusCode` extension type and boolean getters (`isInformational`, `isSuccess`, `isClientError`, etc.) combined with functional methods (like `whenConstStatusCodeOrNull`, `whenConstStatusCodeOrNull`, `whenOrNull`, etc.) offers several advantages over using hardcoded integer status codes:

1. **Readability**: Extension types and boolean getters provide a clearer understanding of the code at a glance. `response.statusCode.isSuccess` is more readable and conveys intent better than `response.statusCode >=200 && response.statusCode <=299`.

2. **Maintainability**: Using extension types and methods abstracts the underlying integer values. If the standard changes or you want to update the way you handle status codes, you only have to change the implementation in one place.

3. **Error Prevention**: Hardcoded integers can lead to mistakes like typos (e.g., `200` vs. `20`). Extension types prevent this class of errors and ensure that only valid status codes are used.

4. **Consistency**: It's easy to be consistent across a codebase when using a defined set of extension types and methods. Different developers on the same team are less likely to use different codes for the same purposes.

5. **Functional Style**: The functional methods allow for more expressive code constructs. They enable chaining and passing functions as arguments, leading to more compact and declarative code.

6. **Safety**: By using extension types and helper methods, you can avoid comparing against undefined or unexpected status codes, which might lead to bugs.

7. **Discoverability**: Autocomplete features in IDEs work better with extension types and class methods, making it easier for developers to discover and use the functionality provided by the library without having to remember specific numeric codes.

8. **No 3rd-party dependencies**: This package has no third-party dependencies, ensuring that you won't have any issues or conflicts with other dependencies (no even `meta` here, because of that).

9. **High code coverage**: The code in this package has almost 100% code coverage, with more than 1000 tests, providing confidence in its reliability and stability.

10. **Industry adopted**: This package is actively used (since 2022) in production by numerous European companies, ensuring its efficacy and robustness in real-world scenarios.

11. **BSD-3-Clause License**: This package and sources are released under the BSD-3-Clause license, a permissive license that is also used by the Flutter SDK. It allows users to use, modify, and distribute the code with minimal restrictions.

12. **Comprehensive documentation**: This package provides full documentation for public member, usually with examples, ensuring clarity and ease of use.

13. **Lightweight**: This package keeps **under 135 KB**, ensuring it fits within the pub cache limit. This leads to quick, low-bandwidth downloads and faster caching, minimizing resource impact.

14. **Mirrored Repository**: The GitHub repository, including all package tags, is mirrored on [GitLab](https://gitlab.com/tsinis/functional_status_codes/), providing an alternative access point should GitHub become unavailable.

By using these features of the `functional_status_codes` package, you promote a more robust, readable, and maintainable approach to HTTP status code handling in your Dart projects.

### Getting started

To use this package, add `functional_status_codes` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  functional_status_codes: any
```

Then import the package in your Dart code:

```dart
import 'package:functional_status_codes/functional_status_codes.dart';
```

### Additional information

For more information on using this package, check out the API documentation and example.

If you like this package, please give it a star or like. For more information on using this package, check out the API documentation. **PRs or ideas are always welcome**.
If you have any issues or suggestions for the package, please file them in the GitHub repository.
