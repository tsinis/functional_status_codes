// Copyright (c) 2024, Roman Cinis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: long-parameter-list
import '../functional_status_codes.dart';

// ignore: prefer-static-class, for every extension here.
const _outSideOfRangeMessage = 'Value is outside of 100-599 range';

/// Extension on `num?` types to provide additional functionality when working
/// with HTTP status codes.
extension NumStatusCodeExtension<T extends num> on T? {
  /// Converts the value to an integer if it exists, or returns `0` if it is
  /// `null`.
  int get _maybeThisInt => this?.toInt() ?? 0;

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
  bool get isStatusCode =>
      _maybeThisInt >= StatusCode.values.first.code &&
      _maybeThisInt <= StatusCode.values.last.code;

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
      _maybeThisInt >= StatusCode.continueHttp100.code &&
      _maybeThisInt < StatusCode.okHttp200.code;

  /// Returns `true` if the value is within the range of successful HTTP status
  /// codes (200-299), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.isSuccess); // true
  /// print(300.isSuccess); // false
  /// ```
  bool get isSuccess =>
      _maybeThisInt >= StatusCode.okHttp200.code &&
      _maybeThisInt < StatusCode.multipleChoicesHttp300.code;

  /// Returns `true` if the value is within the range of redirection HTTP status
  /// codes (300-399), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(300.isRedirection); // true
  /// print(400.isRedirection); // false
  /// ```
  bool get isRedirection =>
      _maybeThisInt >= StatusCode.multipleChoicesHttp300.code &&
      _maybeThisInt < StatusCode.badRequestHttp400.code;

  /// Returns `true` if the value is within the range of client error HTTP
  /// status codes (400-499), `false` otherwise.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(400.isClientError); // true
  /// print(500.isClientError); // false
  /// ```
  bool get isClientError =>
      _maybeThisInt >= StatusCode.badRequestHttp400.code &&
      _maybeThisInt < StatusCode.internalServerErrorHttp500.code;

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
      _maybeThisInt >= StatusCode.internalServerErrorHttp500.code &&
      _maybeThisInt <= StatusCode.networkConnectTimeoutErrorHttp599.code;

  /// Converts the `num?` value to a `StatusCode` if it exists within the range
  /// of valid HTTP status codes (100-599), or returns `null` if it is outside
  /// of that range or `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// print(200.toRegisteredStatusCode()); // StatusCode(200, reason: "OK")
  /// print(299.toRegisteredStatusCode()); // null
  /// print(600.toRegisteredStatusCode()); // null
  /// ```
  StatusCode? toRegisteredStatusCode() => StatusCode.maybeFromCode(this);

  /// Maps the value to a new value based on its classification as an HTTP
  /// status code.
  ///
  /// If the value is `null`, or if the value is not within the range of valid
  /// HTTP status codes (100-599), a `FormatException` is thrown.
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
    if (thisValue == null) {
      throw FormatException('Null value provided!', thisValue);
    }
    if (thisValue.isInformational) return isInformational(thisValue);
    if (thisValue.isSuccess) return isSuccess(thisValue);
    if (thisValue.isRedirection) return isRedirection(thisValue);
    if (thisValue.isClientError) return isClientError(thisValue);
    if (thisValue.isServerError) return isServerError(thisValue);
    throw FormatException(_outSideOfRangeMessage, thisValue);
  }

  /// If the `num?` value is a valid HTTP status code, maps it to a result using
  /// the provided functions. If the value is not a valid HTTP status code,
  /// returns the result of calling `orElse`.
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
    } else {
      return orElse(thisValue);
    }
  }

  /// If the value of `num?` is a valid HTTP status code, calls the
  /// corresponding function for the category of it (informational, success,
  /// redirection, client error, or server error). If the value is not a valid
  /// HTTP status code, returns the result of calling `orElse`.
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
    } else {
      return orElse();
    }
  }

  /// If the value of `num?` is a valid HTTP status code, calls the
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
  /// by `num?` value. If the provided value is `null`, `orElse` will be called.
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
    } else {
      return orElse?.call();
    }
  }
}

/// Extension on `num?` types to provide additional immutable functionality when
/// working with HTTP status codes.
extension NumStatusCodeConstExtension<T extends num> on T? {
  /// A [Map<num, Object?>] like equivalent of `whenStatusCode` method.
  /// Should be only used with a immutable values (for example `final` `const`).
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

  /// A [Map<num, Object?>] like equivalent of `whenStatusCodeOrNull` method.
  /// Should be only used with a immutable values (for example `final` `const`).
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
    } else {
      return orElse;
    }
  }
}

/// Extension on `num?` types to provide additional immutable functionality when
/// working with HTTP status codes.
extension NumStatusCodeMapExtension<T extends num> on T? {
  /// Maps the value to a new value based on its classification as an HTTP
  /// status code.
  ///
  /// If the value is `null`, or if the value is not within the range of valid
  /// HTTP status codes (100-599), a `FormatException` is thrown.
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
  ///   print(mappedStatus); //'StatusCode(200, reason: "OK", isOfficial: true)'
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
    if (thisValue == null) {
      throw FormatException('Null value provided!', thisValue);
    }
    final registeredStatusCode = thisValue.toRegisteredStatusCode();
    if (thisValue.isInformational) return isInformational(registeredStatusCode);
    if (thisValue.isSuccess) return isSuccess(registeredStatusCode);
    if (thisValue.isRedirection) return isRedirection(registeredStatusCode);
    if (thisValue.isClientError) return isClientError(registeredStatusCode);
    if (thisValue.isServerError) return isServerError(registeredStatusCode);

    throw FormatException(_outSideOfRangeMessage, thisValue);
  }

  /// If the `num?` value is a valid HTTP status code, maps it to a result using
  /// the provided functions. If the value is not a valid HTTP status code,
  /// returns the result of calling `orElse`.
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
  ///   print(mappedStatus); //'StatusCode(200, reason: "OK", isOfficial: true)'
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
    } else {
      return orElse(registeredStatusCode, thisValue);
    }
  }
}
