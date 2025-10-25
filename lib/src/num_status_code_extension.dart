// Copyright (c) 2025, Roman Cinis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: avoid-shadowing, avoid-if-with-many-branches

import 'status_code.dart';

/// Extension on [num?] types to provide additional functionality when working
/// with HTTP status codes.
extension NumStatusCodeExtension<T extends num> on T? {
  static const _outSideOfRangeMessage =
      'Value is outside of '
      '''${StatusCode.continueHttp100}-${StatusCode.networkConnectTimeoutErrorHttp599}'''
      ' range';

  /// Converts the value to an integer if it exists, or returns `0` if it is
  /// `null`.
  int get _maybeThisInt => this?.toInt() ?? 0;

  /// Checks if the numeric status code is within a specified range.
  ///
  /// This method allows you to specify a range (inclusive) and checks if the
  /// numeric value of the status code falls within this range. By default, the
  /// range is set to valid HTTP status codes (100-599).
  ///
  /// - [min]: The minimum value of the range. Defaults to 100.
  /// - [max]: The maximum value of the range. Defaults to 599.
  ///
  /// Returns `true` if the status code is within the specified range,
  /// `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// print(200.isStatusCodeWithinRange()); // true
  /// print(600.isStatusCodeWithinRange()); // false
  /// print(300.isStatusCodeWithinRange(min: 200, max: 400)); // true
  /// ```
  bool isStatusCodeWithinRange({
    int min = StatusCode.continueHttp100,
    int max = StatusCode.networkConnectTimeoutErrorHttp599,
  }) => _maybeThisInt >= min && _maybeThisInt <= max;

  /// Checks if the status code is within a specified range defined by
  /// [StatusCode] values.
  ///
  /// This method is similar to `isStatusCodeWithinRange` but uses [StatusCode]
  /// values to define the range. It is useful when working with specific HTTP
  /// status codes defined in the [StatusCode] enum.
  ///
  /// - [min]: The [StatusCode] representing the minimum value of the range.
  ///   Defaults to `StatusCode.continueHttp100`.
  /// - [max]: The [StatusCode] representing the maximum value of the range.
  ///   Defaults to `StatusCode.networkConnectTimeoutErrorHttp599`.
  ///
  /// Returns `true` if the status code is within the specified range,
  /// `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// print(200.isStatusWithinRange()); // true
  /// print(600.isStatusWithinRange()); // false
  /// print(150.isStatusWithinRange(min: StatusCode.continueHttp100,
  /// max: StatusCode.switchingProtocolsHttp101)); // false
  /// ```
  bool isStatusWithinRange({
    StatusCode min = StatusCode.continueHttp100,
    StatusCode max = StatusCode.networkConnectTimeoutErrorHttp599,
  }) => isStatusCodeWithinRange(min: min, max: max);

  /// Returns `true` if the value is within the range of valid HTTP status codes
  /// (100-599), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.isStatusCode); // true
  /// print(599.0.isStatusCode); // true
  /// print(600.isStatusCode); // false
  /// ```
  bool get isStatusCode => isStatusWithinRange();

  /// Returns `true` if the status code is cacheable by default according to
  /// RFC 7231.
  ///
  /// Responses with these status codes can be stored by caches and reused for
  /// subsequent requests without requiring explicit freshness information,
  /// unless cache-control headers indicate otherwise.
  ///
  /// Cacheable status codes include: 200, 203, 204, 206, 300, 301, 404, 405,
  /// 410, 414, and 501.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.isCacheable); // true
  /// print(404.isCacheable); // true
  /// print(201.isCacheable); // false
  /// print(500.isCacheable); // false
  /// ```
  ///
  /// Reference: https://www.rfc-editor.org/rfc/rfc7231#section-6.1
  bool get isCacheable => isOneOf(StatusCode.cacheableCodes);

  /// Returns `true` if the status code typically indicates a transient error
  /// that may succeed if retried.
  ///
  /// These status codes represent temporary conditions such as timeouts, rate
  /// limiting, or server unavailability. When implementing retry logic,
  /// consider using exponential backoff and respect Retry-After headers if
  /// present.
  ///
  /// Retryable status codes include: 408, 425, 429, 500, 502, 503, 504, 511,
  /// 598, and 599.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(503.isRetryable); // true
  /// print(429.isRetryable); // true
  /// print(404.isRetryable); // false
  /// print(200.isRetryable); // false
  /// ```
  ///
  /// See also:
  /// - [isCacheable], which identifies cacheable responses.
  bool get isRetryable => isOneOf(StatusCode.retryableCodes);

  /// Checks if the numeric value matches any of the provided [StatusCode]
  /// values.
  ///
  /// This method converts the numeric value to an integer and checks if it
  /// exists in the provided iterable of [StatusCode] values. Returns `false` if
  /// the numeric value is `null` or if the iterable is empty.
  ///
  /// The comparison is performed using the integer representation of both the
  /// numeric value and the [StatusCode] values for efficient lookup.
  ///
  /// Example:
  /// ```dart
  /// const codes = [StatusCode.okHttp200, StatusCode.createdHttp201];
  /// print(200.isOneOf(codes)); // true
  /// print(404.isOneOf(codes)); // false
  /// print(null.isOneOf(codes)); // false
  ///
  /// // Works with any Iterable<StatusCode>.
  /// const errors = {StatusCode.badRequestHttp400, StatusCode.notFoundHttp404};
  /// print(404.isOneOf(errors)); // true
  /// ```
  bool isOneOf(Iterable<StatusCode> codes) => codes.contains(_maybeThisInt);

  /// Returns `true` if the value is within the range of informational HTTP
  /// status codes (100-199), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(100.isInformational); // true
  /// print(200.isInformational); // false
  /// ```
  bool get isInformational =>
      isStatusCodeWithinRange(max: StatusCode.okHttp200 - 1);

  /// Returns `true` if the value is within the range of successful HTTP status
  /// codes (200-299), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.isSuccess); // true
  /// print(300.isSuccess); // false
  /// ```
  bool get isSuccess => isStatusCodeWithinRange(
    min: StatusCode.okHttp200,
    max: StatusCode.multipleChoicesHttp300 - 1,
  );

  /// Returns `true` if the value is within the range of redirection HTTP status
  /// codes (300-399), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(300.isRedirection); // true
  /// print(400.isRedirection); // false
  /// ```
  bool get isRedirection => isStatusCodeWithinRange(
    min: StatusCode.multipleChoicesHttp300,
    max: StatusCode.badRequestHttp400 - 1,
  );

  /// Returns `true` if the value is within the range of client error HTTP
  /// status codes (400-499), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(400.isClientError); // true
  /// print(500.isClientError); // false
  /// ```
  bool get isClientError => isStatusWithinRange(
    min: StatusCode.badRequestHttp400,
    max: StatusCode.nginxClientClosedRequestHttp499,
  );

  /// Returns `true` if the value is within the range of server error HTTP
  /// status codes (500-599), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(500.isServerError); // true
  /// print(600.isServerError); // false
  /// ```
  bool get isServerError =>
      isStatusWithinRange(min: StatusCode.internalServerErrorHttp500);

  /// Converts the [num?] value to a [StatusCode] if it exists within the range
  /// of valid HTTP status codes (100-599), or returns `null` if it is outside
  /// of that range or `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.toRegisteredStatusCode()); // 200
  /// print(299.toRegisteredStatusCode()); // null
  /// print(600.toRegisteredStatusCode()); // null
  /// ```
  StatusCode? toRegisteredStatusCode() => StatusCode.maybeFromCode(this);

  /// Maps the value to a new value based on its classification as an HTTP
  /// status code.
  ///
  /// If the value is `null`, or if the value is not within the range of valid
  /// HTTP status codes (100-599), a [FormatException] is thrown.
  ///
  /// If the value is within the range of informational HTTP status codes
  /// (100-599), the function is called according to that status and its result
  ///  is returned.
  ///
  /// Example:
  /// ```dart
  ///   final statusCode = 200;
  ///   final mappedStatus = statusCode.mapStatusCode(
  ///     isInformational: (code) => '$code is an Informational status',
  ///     isSuccess: (code) => '$code is a Success status',
  ///     isRedirection: (code) => '$code is a Redirection status',
  ///     isClientError: (code) => '$code is a Client Error status',
  ///     isServerError: (code) => '$code is a Server Error status',
  ///   );
  ///   print(mappedStatus); // '200 is a Success status'
  /// ```
  R mapStatusCode<R>({
    required R Function(T isInformational) isInformational,
    required R Function(T isSuccess) isSuccess,
    required R Function(T isRedirection) isRedirection,
    required R Function(T isClientError) isClientError,
    required R Function(T isServerError) isServerError,
  }) {
    assert(
      isStatusCode,
      '$_outSideOfRangeMessage. Consider using maybeMapStatusCode() instead',
    );
    final thisValue = this;
    if (thisValue == null) throw FormatException('Null value provided!', this);
    if (thisValue.isInformational) return isInformational(thisValue);
    if (thisValue.isSuccess) return isSuccess(thisValue);
    if (thisValue.isRedirection) return isRedirection(thisValue);
    if (thisValue.isClientError) return isClientError(thisValue);
    if (thisValue.isServerError) return isServerError(thisValue);
    throw FormatException(_outSideOfRangeMessage, thisValue);
  }

  /// If the [num?] value is a valid HTTP status code, maps it to a result using
  /// the provided functions. If the value is not a valid HTTP status code,
  /// returns the result of calling [orElse].
  ///
  /// Example:
  ///
  /// ```dart
  /// 200.maybeMapStatusCode(
  ///   orElse: (value) => 'unregistered code: $value',
  ///   isSuccess: (code) => 'success',
  /// ); // Returns 'success'
  ///
  /// 600.maybeMapStatusCode(
  ///   orElse: (value) => 'unregistered code: $value',
  ///   isSuccess: (code) => 'success',
  /// ); // Returns 'unregistered code: 600'
  /// ```
  R maybeMapStatusCode<R>({
    required R Function(T? number) orElse,
    R Function(T isStatusCode)? isStatusCode,
    R Function(T isInformational)? isInformational,
    R Function(T isSuccess)? isSuccess,
    R Function(T isRedirection)? isRedirection,
    R Function(T isClientError)? isClientError,
    R Function(T isServerError)? isServerError,
  }) {
    final thisValue = this;
    if (thisValue == null) return orElse(thisValue);

    if (thisValue.isStatusCode && isStatusCode != null) {
      return isStatusCode(thisValue);
    } else if (thisValue.isInformational && isInformational != null) {
      return isInformational(thisValue);
    } else if (thisValue.isSuccess && isSuccess != null) {
      return isSuccess(thisValue);
    } else if (thisValue.isRedirection && isRedirection != null) {
      return isRedirection(thisValue);
    } else if (thisValue.isClientError && isClientError != null) {
      return isClientError(thisValue);
    } else if (thisValue.isServerError && isServerError != null) {
      return isServerError(thisValue);
    }

    return orElse(thisValue);
  }

  /// If the value of [num?] is a valid HTTP status code, calls the
  /// corresponding function for the category of it (informational, success,
  /// redirection, client error, or server error). If the value is not a valid
  /// HTTP status code, returns the result of calling [orElse].
  ///
  /// Example:
  ///
  /// ```dart
  /// 200.maybeWhenStatusCode(
  ///   orElse: () => 'unknown',
  ///   isSuccess: () => 'success',
  /// ); // Returns 'success'
  ///
  /// 600.maybeWhenStatusCode(
  ///   orElse: () => 'unknown',
  ///   isSuccess: () => 'success',
  /// ); // Returns 'unknown'
  /// ```
  R maybeWhenStatusCode<R>({
    required R Function() orElse,
    R Function()? isStatusCode,
    R Function()? isInformational,
    R Function()? isSuccess,
    R Function()? isRedirection,
    R Function()? isClientError,
    R Function()? isServerError,
  }) {
    if (this.isStatusCode && isStatusCode != null) {
      return isStatusCode();
    } else if (this.isInformational && isInformational != null) {
      return isInformational();
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess();
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection();
    } else if (this.isClientError && isClientError != null) {
      return isClientError();
    } else if (this.isServerError && isServerError != null) {
      return isServerError();
    }

    return orElse();
  }

  /// If the value of [num?] is a valid HTTP status code, calls the
  /// corresponding function for the category of it (informational, success,
  /// redirection, client error, or server error).
  ///
  /// If the value is not a valid HTTP status code, throws a [FormatException]
  /// with the message 'Value is outside of 100-599 range'.
  ///
  /// Example:
  ///
  /// ```dart
  /// 200.whenStatusCode(
  ///   isSuccess: () => 'success',
  ///   isClientError: () => 'client error',
  /// ); // Returns 'success'
  ///
  /// 600.whenStatusCode(
  ///   isSuccess: () => 'success',
  ///   isClientError: () => 'client error',
  /// ); // Throws FormatException
  /// ```
  R whenStatusCode<R>({
    required R Function() isInformational,
    required R Function() isSuccess,
    required R Function() isRedirection,
    required R Function() isClientError,
    required R Function() isServerError,
  }) {
    assert(
      isStatusCode,
      '$_outSideOfRangeMessage. Consider using maybeWhenStatusCode() instead',
    );
    if (this.isInformational) return isInformational();
    if (this.isSuccess) return isSuccess();
    if (this.isRedirection) return isRedirection();
    if (this.isClientError) return isClientError();
    if (this.isServerError) return isServerError();
    throw FormatException(_outSideOfRangeMessage, this);
  }

  /// Evaluates the provided functions based on the HTTP status code represented
  /// by [num?] value. If the provided value is `null`, [orElse] will be called.
  /// If the provided value is not an HTTP status code, or the corresponding
  /// function is not provided, the method will return `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = 404;
  /// final statusCodeOrNull = null;
  ///
  /// statusCode.whenStatusCodeOrNull(
  ///   isStatusCode: () => 'This is an HTTP status code',
  ///   orElse: () => 'This is not an HTTP status code',
  /// ); // Returns: 'This is an HTTP status code'
  ///
  /// statusCodeOrNull.whenStatusCodeOrNull(
  ///   isStatusCode: () => 'This is an HTTP status code',
  ///   orElse: () => 'This is not an HTTP status code',
  /// ); // Returns: 'This is not an HTTP status code'
  /// ```
  R? whenStatusCodeOrNull<R>({
    R Function()? isStatusCode,
    R Function()? isInformational,
    R Function()? isSuccess,
    R Function()? isRedirection,
    R Function()? isClientError,
    R Function()? isServerError,
    R Function()? orElse,
  }) {
    if (this.isStatusCode && isStatusCode != null) {
      return isStatusCode();
    } else if (this.isInformational && isInformational != null) {
      return isInformational();
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess();
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection();
    } else if (this.isClientError && isClientError != null) {
      return isClientError();
    } else if (this.isServerError && isServerError != null) {
      return isServerError();
    }

    return orElse?.call();
  }

  /// A [Map<num, Object?>] like equivalent of [whenStatusCode] method.
  /// Should be only used with a immutable values (for example `final`/`const`).
  ///
  /// Example:
  ///
  /// ```dart
  /// const statusCode = 200;
  /// final result = statusCode.whenConstStatusCode(
  ///   okHttp200: 'Success',
  ///   ...
  ///   badRequestHttp400: 'Bad request',
  /// );
  /// print(result); // prints 'Success'
  /// ```
  R whenConstStatusCode<R>({
    required R isInformational,
    required R isSuccess,
    required R isRedirection,
    required R isClientError,
    required R isServerError,
  }) {
    assert(
      isStatusCode,
      '''$_outSideOfRangeMessage. Consider using whenConstStatusCodeOrNull() instead''',
    );
    if (this.isInformational) return isInformational;
    if (this.isSuccess) return isSuccess;
    if (this.isRedirection) return isRedirection;
    if (this.isClientError) return isClientError;
    if (this.isServerError) return isServerError;
    throw FormatException(_outSideOfRangeMessage, this);
  }

  /// A [Map<num, Object?>] like equivalent of [whenStatusCodeOrNull] method.
  /// Should be only used with a immutable values (for example `final`/`const`).
  ///
  /// Example:
  ///
  /// ```dart
  /// const statusCode = 200;
  /// final result = statusCode.whenConstStatusCodeOrNull(
  ///   okHttp200: 'Success',
  ///   ...
  ///   badRequestHttp400: 'Bad request',
  /// );
  /// print(result); // prints 'Success'
  /// ```
  R? whenConstStatusCodeOrNull<R>({
    R? isStatusCode,
    R? isInformational,
    R? isSuccess,
    R? isRedirection,
    R? isClientError,
    R? isServerError,
    R? orElse,
  }) {
    if (this.isStatusCode && isStatusCode != null) {
      return isStatusCode;
    } else if (this.isInformational && isInformational != null) {
      return isInformational;
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess;
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection;
    } else if (this.isClientError && isClientError != null) {
      return isClientError;
    } else if (this.isServerError && isServerError != null) {
      return isServerError;
    }

    return orElse;
  }

  /// Maps the value to a new value based on its classification as an HTTP
  /// status code.
  ///
  /// If the value is `null`, or if the value is not within the range of valid
  /// HTTP status codes (100-599), a [FormatException] is thrown.
  ///
  /// If the value is within the range of informational HTTP status codes
  /// (100-599), the function is called according to that registered status
  /// and its result is returned.
  ///
  /// Example:
  /// ```dart
  ///   final statusCode = 200;
  ///   final mappedStatus = statusCode.mapToRegisteredStatusCode(
  ///     isInformational: (code) => '$code',
  ///     isSuccess: (code) => '$code',
  ///     isRedirection: (code) => '$code',
  ///     isClientError: (code) => '$code',
  ///     isServerError: (code) => '$code',
  ///   );
  ///   print(mappedStatus); // 200'
  /// ```
  R mapToRegisteredStatusCode<R>({
    required R Function(StatusCode? informationalStatusCode) isInformational,
    required R Function(StatusCode? successStatusCode) isSuccess,
    required R Function(StatusCode? redirectionStatusCode) isRedirection,
    required R Function(StatusCode? clientErrorStatusCode) isClientError,
    required R Function(StatusCode? serverErrorStatusCode) isServerError,
  }) {
    assert(
      isStatusCode,
      '''$_outSideOfRangeMessage. Consider using maybeMapToRegisteredStatusCode() instead''',
    );
    final thisValue = this;
    if (thisValue == null) throw FormatException('Null value provided!', this);

    final registeredStatusCode = thisValue.toRegisteredStatusCode();
    if (thisValue.isInformational) return isInformational(registeredStatusCode);
    if (thisValue.isSuccess) return isSuccess(registeredStatusCode);
    if (thisValue.isRedirection) return isRedirection(registeredStatusCode);
    if (thisValue.isClientError) return isClientError(registeredStatusCode);
    if (thisValue.isServerError) return isServerError(registeredStatusCode);

    throw FormatException(_outSideOfRangeMessage, thisValue);
  }

  /// If the [num?] value is a valid HTTP status code, maps it to a result using
  /// the provided functions. If the value is not a valid HTTP status code,
  /// returns the result of calling [orElse].
  ///
  /// If the value is within the range of informational HTTP status codes
  /// (100-599), the function is called according to that registered status
  /// and its result is returned.
  ///
  /// Example:
  ///
  /// ```dart
  ///   final statusCode = 200;
  ///   final mappedStatus = statusCode.maybeMapToRegisteredStatusCode(
  ///     isInformational: (code) => '$code',
  ///     isSuccess: (code) => '$code',
  ///     isRedirection: (code) => '$code',
  ///     isClientError: (code) => '$code',
  ///     orElse: (code, _) => '$code',
  ///   );
  ///   print(mappedStatus); // 200
  /// ```
  R maybeMapToRegisteredStatusCode<R>({
    required R Function(StatusCode? elseStatusCode, T? number) orElse,
    R Function(StatusCode? statusCode)? isStatusCode,
    R Function(StatusCode? informationalStatusCode)? isInformational,
    R Function(StatusCode? successStatusCode)? isSuccess,
    R Function(StatusCode? redirectionStatusCode)? isRedirection,
    R Function(StatusCode? clientErrorStatusCode)? isClientError,
    R Function(StatusCode? serverErrorStatusCode)? isServerError,
  }) {
    final thisValue = this;
    final registeredStatusCode = thisValue.toRegisteredStatusCode();
    if (thisValue == null) return orElse(registeredStatusCode, thisValue);

    if (thisValue.isStatusCode && isStatusCode != null) {
      return isStatusCode(registeredStatusCode);
    } else if (thisValue.isInformational && isInformational != null) {
      return isInformational(registeredStatusCode);
    } else if (thisValue.isSuccess && isSuccess != null) {
      return isSuccess(registeredStatusCode);
    } else if (thisValue.isRedirection && isRedirection != null) {
      return isRedirection(registeredStatusCode);
    } else if (thisValue.isClientError && isClientError != null) {
      return isClientError(registeredStatusCode);
    } else if (thisValue.isServerError && isServerError != null) {
      return isServerError(registeredStatusCode);
    }

    return orElse(registeredStatusCode, thisValue);
  }

  /// Maps the status code to a result using optional handler functions that
  /// receive the registered [StatusCode] (or `null` if unregistered). Returns
  /// the result of [orElse] if no matching handler is provided, or `null` if
  /// [orElse] is also not provided.
  ///
  /// All handlers are optional. Each handler receives the [StatusCode] value
  /// for that category (or `null` for unregistered codes). This is similar to
  /// [maybeMapToRegisteredStatusCode] but with a simpler fallback that doesn't
  /// pass the original numeric value.
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = 200;
  /// final result = statusCode.mapToRegisteredStatusCodeOrNull(
  ///   isSuccess: (code) => 'Success: $code',
  ///   orElse: (code) => 'Other: $code',
  /// );
  /// print(result); // 'Success: 200'
  ///
  /// final unknownCode = 600;
  /// final result2 = unknownCode.mapToRegisteredStatusCodeOrNull(
  ///   isSuccess: (code) => 'Success',
  /// );
  /// print(result2); // null
  ///
  /// final unregisteredCode = 299;
  /// final result3 = unregisteredCode.mapToRegisteredStatusCodeOrNull(
  ///   isSuccess: (code) => 'Registered: $code',
  ///   orElse: (code) => 'Unregistered, code is: $code',
  /// );
  /// print(result3); // 'Unregistered, code is: null'
  /// ```
  R? mapToRegisteredStatusCodeOrNull<R>({
    R Function(StatusCode? informationalStatusCode)? isInformational,
    R Function(StatusCode? successStatusCode)? isSuccess,
    R Function(StatusCode? redirectionStatusCode)? isRedirection,
    R Function(StatusCode? clientErrorStatusCode)? isClientError,
    R Function(StatusCode? serverErrorStatusCode)? isServerError,
    R Function(StatusCode? statusCode)? orElse,
  }) {
    final registeredStatusCode = toRegisteredStatusCode();
    if (registeredStatusCode == null) return orElse?.call(null);

    if (this.isInformational && isInformational != null) {
      return isInformational(registeredStatusCode);
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess(registeredStatusCode);
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection(registeredStatusCode);
    } else if (this.isClientError && isClientError != null) {
      return isClientError(registeredStatusCode);
    } else if (this.isServerError && isServerError != null) {
      return isServerError(registeredStatusCode);
    }

    return orElse?.call(registeredStatusCode);
  }
}
