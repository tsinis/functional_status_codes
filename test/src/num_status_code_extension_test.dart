// ignore_for_file: avoid-local-functions, avoid-misused-test-matchers

import 'package:functional_status_codes/src/num_status_code_extension.dart';
import 'package:functional_status_codes/src/status_code.dart';
import 'package:test/test.dart';

// ignore: avoid-high-cyclomatic-complexity, it's a test.
void main() => group('NumStatusCodeExtension', () {
  const basicCodes = {
    StatusCode.continueHttp100,
    StatusCode.okHttp200,
    StatusCode.multipleChoicesHttp300,
    StatusCode.badRequestHttp400,
    StatusCode.internalServerErrorHttp500,
  };

  const elseValue = -1;
  final testValue = basicCodes.first;
  final globalWrongCases = [
    null,
    elseValue,
    -1.0,
    0.0,
    0,
    1,
    StatusCode.values.first - 1,
    StatusCode.values.last + 1,
  ];

  group('isStatusCodeWithinRange', () {
    test('should return true for status code within default range', () {
      expect(200.isStatusCodeWithinRange(), isTrue);
      for (final status in basicCodes) {
        expect(status.isStatusCodeWithinRange(), isTrue);
      }
    });

    test('should return false for status code outside default range', () {
      expect(150.isStatusCodeWithinRange(min: 200, max: 300), isFalse);
      expect(350.isStatusCodeWithinRange(min: 200, max: 300), isFalse);
      for (final statusCode in globalWrongCases) {
        expect(statusCode.isStatusCodeWithinRange(), isFalse);
      }
    });

    test(
      'should handle custom ranges correctly',
      () => expect(250.isStatusCodeWithinRange(min: 200, max: 300), isTrue),
    );
  });

  group('isStatusWithinRange', () {
    test('should return true for status code within range', () {
      expect(150.isStatusWithinRange(max: StatusCode.okHttp200), isTrue);
      for (final status in basicCodes) {
        expect(status.isStatusWithinRange(), isTrue);
      }
    });

    test('should return false for status code outside range', () {
      expect(99.isStatusWithinRange(max: StatusCode.okHttp200), isFalse);
      expect(201.isStatusWithinRange(max: StatusCode.okHttp200), isFalse);
      for (final statusCode in globalWrongCases) {
        expect(statusCode.isStatusWithinRange(), isFalse);
      }
    });

    test('Edge cases - min and max of range', () {
      expect(100.isStatusWithinRange(max: StatusCode.okHttp200), isTrue);
      expect(200.isStatusWithinRange(max: StatusCode.okHttp200), isTrue);
    });
  });

  group('isStatusCode', () {
    const codeErrorTrueCases = {
      StatusCode.continueHttp100,
      StatusCode.continueHttp100 + 1,
      StatusCode.networkConnectTimeoutErrorHttp599 - 1,
      StatusCode.networkConnectTimeoutErrorHttp599,
    };

    for (final number in globalWrongCases) {
      test(
        'should return false for $number',
        () => expect(number.isStatusCode, isFalse),
      );
    }

    for (final number in codeErrorTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isStatusCode, isTrue),
      );
    }
  });

  group('isInformational', () {
    const infoTrueCases = {
      StatusCode.continueHttp100,
      StatusCode.continueHttp100 + 1,
      StatusCode.okHttp200 - 1,
    };

    const infoFalseCases = {
      StatusCode.continueHttp100 - 1,
      StatusCode.okHttp200,
    };

    for (final number in [...globalWrongCases, ...infoFalseCases]) {
      test(
        'should return false for $number',
        () => expect(number.isInformational, isFalse),
      );
    }

    for (final number in infoTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isInformational, isTrue),
      );
    }
  });

  group('isSuccess', () {
    const successTrueCases = {
      StatusCode.okHttp200,
      StatusCode.okHttp200 + 1,
      StatusCode.multipleChoicesHttp300 - 1,
    };

    const successFalseCases = {
      StatusCode.okHttp200 - 1,
      StatusCode.multipleChoicesHttp300,
    };

    for (final number in [...globalWrongCases, ...successFalseCases]) {
      test(
        'should return false for $number',
        () => expect(number.isSuccess, isFalse),
      );
    }

    for (final number in successTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isSuccess, isTrue),
      );
    }
  });

  group('isRedirection', () {
    const redirectionTrueCases = {
      StatusCode.multipleChoicesHttp300,
      StatusCode.multipleChoicesHttp300 + 1,
      StatusCode.badRequestHttp400 - 1,
    };

    const redirectionFalseCases = {
      StatusCode.multipleChoicesHttp300 - 1,
      StatusCode.badRequestHttp400,
    };

    for (final number in [...globalWrongCases, ...redirectionFalseCases]) {
      test(
        'should return false for $number',
        () => expect(number.isRedirection, isFalse),
      );
    }

    for (final number in redirectionTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isRedirection, isTrue),
      );
    }
  });

  group('isClientError', () {
    const clientErrorTrueCases = {
      StatusCode.badRequestHttp400,
      StatusCode.badRequestHttp400 + 1,
      StatusCode.nginxClientClosedRequestHttp499,
    };

    const clientErrorFalseCases = {
      StatusCode.badRequestHttp400 - 1,
      StatusCode.internalServerErrorHttp500,
    };

    for (final number in [...globalWrongCases, ...clientErrorFalseCases]) {
      test(
        'should return false for $number',
        () => expect(number.isClientError, isFalse),
      );
    }

    for (final number in clientErrorTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isClientError, isTrue),
      );
    }
  });

  group('isServerError', () {
    const serverErrorTrueCases = {
      StatusCode.internalServerErrorHttp500,
      StatusCode.internalServerErrorHttp500 + 1,
      StatusCode.networkConnectTimeoutErrorHttp599,
    };

    const serverErrorFalseCases = {
      StatusCode.nginxClientClosedRequestHttp499,
      StatusCode.networkConnectTimeoutErrorHttp599 + 1,
    };

    for (final number in [...globalWrongCases, ...serverErrorFalseCases]) {
      test(
        'should return false for $number',
        () => expect(number.isServerError, isFalse),
      );
    }

    for (final number in serverErrorTrueCases) {
      test(
        'should return true for $number',
        () => expect(number.isServerError, isTrue),
      );
    }
  });

  group('toRegisteredStatusCode', () {
    for (final number in globalWrongCases) {
      test(
        'should return null for $number',
        () => expect(number.toRegisteredStatusCode(), isNull),
      );
    }

    test(
      'should return null for unregistered status code',
      () => expect(144.toRegisteredStatusCode(), isNull),
    );

    for (final status in basicCodes) {
      test(
        'should return proper status code enum from $status',
        () => expect(status.toRegisteredStatusCode(), status),
      );
    }
  });

  group('mapStatusCode', () {
    num mapCode(num? number) => number.mapStatusCode(
      isInformational: (value) => value,
      isSuccess: (value) => value,
      isRedirection: (value) => value,
      isClientError: (value) => value,
      isServerError: (value) => value,
    );

    for (final number in globalWrongCases) {
      test(
        'should throw $FormatException for $number',
        () => expect(() => mapCode(number), throwsA(isA<AssertionError>())),
      );
    }

    test(
      'should return $double value of status code if provided as $double',
      () {
        final doubleCode = testValue.toDouble();
        final result = mapCode(doubleCode);
        expect(result, doubleCode);
        expect(result, isA<double>());
      },
    );

    for (final status in basicCodes) {
      test('should return $int value of $status status code', () {
        final result = mapCode(status);
        expect(result, status);
        expect(result, isA<int>());
      });
    }
  });

  group('maybeMapStatusCode', () {
    num maybeMapCode(num? number) => number.maybeMapStatusCode(
      isInformational: (value) => value,
      isSuccess: (value) => value,
      isRedirection: (value) => value,
      isClientError: (value) => value,
      isServerError: (value) => value,
      orElse: (_) => elseValue,
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(maybeMapCode(number), elseValue),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.maybeMapStatusCode(
          isStatusCode: (value) => value,
          orElse: (value) => value,
        ),
        testValue,
      ),
    );

    test(
      'should return $double value of status code if provided as $double',
      () {
        final doubleCode = testValue.toDouble();
        final result = maybeMapCode(doubleCode);
        expect(result, doubleCode);
        expect(result, isA<double>());
      },
    );

    for (final status in basicCodes) {
      test('should return $int value of $status status code', () {
        final result = maybeMapCode(status);
        expect(result, status);
        expect(result, isA<int>());
      });
    }
  });

  group('maybeWhenStatusCode', () {
    int maybeWhenCode(num? number) => number.maybeWhenStatusCode(
      isInformational: () => StatusCode.continueHttp100,
      isSuccess: () => StatusCode.okHttp200,
      isRedirection: () => StatusCode.multipleChoicesHttp300,
      isClientError: () => StatusCode.badRequestHttp400,
      isServerError: () => StatusCode.internalServerErrorHttp500,
      orElse: () => elseValue,
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(maybeWhenCode(number), elseValue),
      );
    }

    for (final status in basicCodes) {
      test(
        'should return proper value for $status status code',
        () => expect(maybeWhenCode(status), status),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.maybeWhenStatusCode(
          isStatusCode: () => testValue,
          orElse: () => null,
        ),
        testValue,
      ),
    );
  });

  group('whenStatusCode', () {
    int whenCode(num? number) => number.whenStatusCode(
      isInformational: () => StatusCode.continueHttp100,
      isSuccess: () => StatusCode.okHttp200,
      isRedirection: () => StatusCode.multipleChoicesHttp300,
      isClientError: () => StatusCode.badRequestHttp400,
      isServerError: () => StatusCode.internalServerErrorHttp500,
    );

    for (final number in globalWrongCases) {
      test(
        'should throw $FormatException for $number',
        () => expect(() => whenCode(number), throwsA(isA<AssertionError>())),
      );
    }

    for (final status in basicCodes) {
      test(
        'should return proper value for $status status code',
        () => expect(whenCode(status), status),
      );
    }
  });

  group('whenStatusCodeOrNull', () {
    int? maybeWhenCodeOrNull(num? number) => number.whenStatusCodeOrNull(
      isInformational: () => StatusCode.continueHttp100,
      isSuccess: () => StatusCode.okHttp200,
      isRedirection: () => StatusCode.multipleChoicesHttp300,
      isClientError: () => StatusCode.badRequestHttp400,
      isServerError: () => StatusCode.internalServerErrorHttp500,
      orElse: () => elseValue,
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(maybeWhenCodeOrNull(number), elseValue),
      );
    }

    for (final status in basicCodes) {
      test(
        'should return proper value for $status status code',
        () => expect(maybeWhenCodeOrNull(status), status),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.whenStatusCodeOrNull(isStatusCode: () => testValue),
        testValue,
      ),
    );
  });

  group('whenConstStatusCodeOrNull', () {
    int? whenConstCodeOrNull(num? numb) => numb.whenConstStatusCodeOrNull(
      isInformational: StatusCode.continueHttp100,
      isSuccess: StatusCode.okHttp200,
      isRedirection: StatusCode.multipleChoicesHttp300,
      isClientError: StatusCode.badRequestHttp400,
      isServerError: StatusCode.internalServerErrorHttp500,
      orElse: elseValue,
    );

    test(
      'common test for null',
      () => expect(200.whenConstStatusCodeOrNull<Object?>(), isNull),
    );

    test(
      'common test for out of range',
      () => expect(
        1.whenConstStatusCodeOrNull(isStatusCode: false, orElse: true),
        isTrue,
      ),
    );

    test(
      'common test for orElse',
      () => expect(200.whenConstStatusCodeOrNull(orElse: true), isTrue),
    );

    test(
      'common test for orElse and value',
      () => expect(
        200.whenConstStatusCodeOrNull(isSuccess: true, orElse: false),
        isTrue,
      ),
    );

    test(
      'common test for orElse and isStatusCode',
      () => expect(
        200.whenConstStatusCodeOrNull(isStatusCode: true, orElse: false),
        isTrue,
      ),
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(whenConstCodeOrNull(number), elseValue),
      );
    }

    for (final status in basicCodes) {
      test(
        'should return proper value for $status status code',
        () => expect(whenConstCodeOrNull(status), status),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.whenConstStatusCodeOrNull(isStatusCode: testValue),
        testValue,
      ),
    );
  });

  group('whenConstStatusCode', () {
    int whenConstCode(num? number) => number.whenConstStatusCode(
      isInformational: StatusCode.continueHttp100,
      isSuccess: StatusCode.okHttp200,
      isRedirection: StatusCode.multipleChoicesHttp300,
      isClientError: StatusCode.badRequestHttp400,
      isServerError: StatusCode.internalServerErrorHttp500,
    );

    for (final number in globalWrongCases) {
      test(
        'should throw $FormatException for $number',
        () =>
            expect(() => whenConstCode(number), throwsA(isA<AssertionError>())),
      );
    }

    for (final status in basicCodes) {
      test(
        'should return proper value for $status status code',
        () => expect(whenConstCode(status), status),
      );
    }
  });

  group('mapToRegisteredStatusCode', () {
    StatusCode? mapRegisteredCode(num? number) =>
        number.mapToRegisteredStatusCode(
          isInformational: (value) => value,
          isSuccess: (value) => value,
          isRedirection: (value) => value,
          isClientError: (value) => value,
          isServerError: (value) => value,
        );

    for (final number in globalWrongCases) {
      test(
        'should throw $FormatException for $number',
        () => expect(
          () => mapRegisteredCode(number),
          throwsA(isA<AssertionError>()),
        ),
      );
    }

    test(
      'should return $double value of status code if provided as $double',
      () {
        final doubleCode = testValue.toDouble();
        final result = mapRegisteredCode(doubleCode);
        expect(result, basicCodes.first);
        expect(result, isA<StatusCode>());
      },
    );

    for (final status in basicCodes) {
      test('should return $int value of $status status code', () {
        final result = mapRegisteredCode(status);
        expect(result, status);
        expect(result, isA<StatusCode>());
      });
    }
  });

  group('maybeMapToRegisteredStatusCode', () {
    StatusCode? maybeMapToRegisteredCode(num? numb) =>
        numb.maybeMapToRegisteredStatusCode(
          isInformational: (value) => value,
          isSuccess: (value) => value,
          isRedirection: (value) => value,
          isClientError: (value) => value,
          isServerError: (value) => value,
          orElse: (value, _) => value,
        );

    test(
      'common test for null',
      () => expect(
        200.maybeMapToRegisteredStatusCode(orElse: (_, _) => true),
        isTrue,
      ),
    );

    test(
      'common test for out of range',
      () => expect(
        1.maybeMapToRegisteredStatusCode(
          orElse: (_, _) => true,
          isStatusCode: (_) => false,
        ),
        isTrue,
      ),
    );

    test(
      'common test for orElse and value',
      () => expect(
        200.maybeMapToRegisteredStatusCode(
          orElse: (_, _) => false,
          isSuccess: (_) => true,
        ),
        isTrue,
      ),
    );

    test(
      'common test for orElse and isStatusCode',
      () => expect(
        200.maybeMapToRegisteredStatusCode(
          orElse: (_, _) => false,
          isStatusCode: (_) => true,
        ),
        isTrue,
      ),
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(maybeMapToRegisteredCode(number), isNull),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.maybeMapToRegisteredStatusCode(
          isStatusCode: (value) => value,
          orElse: (value, _) => value,
        ),
        basicCodes.first,
      ),
    );

    test(
      'should return $double value of status code if provided as $double',
      () {
        final doubleCode = testValue.toDouble();
        final result = maybeMapToRegisteredCode(doubleCode);
        expect(result, basicCodes.first);
        expect(result, isA<StatusCode>());
      },
    );

    for (final status in basicCodes) {
      test('should return $int value of $status status code', () {
        final result = maybeMapToRegisteredCode(status);
        expect(result, status);
        expect(result, isA<StatusCode>());
      });
    }
  });

  group('mapToRegisteredStatusCodeOrNull', () {
    const fallback = StatusCode.custom(289);
    StatusCode? mapToRegisteredCodeOrNull(num? numb) =>
        numb.mapToRegisteredStatusCodeOrNull(
          isInformational: (value) => value ?? fallback,
          isSuccess: (value) => value ?? fallback,
          isRedirection: (value) => value ?? fallback,
          isClientError: (value) => value ?? fallback,
          isServerError: (value) => value ?? fallback,
        );

    test(
      'common test for no matching handler',
      () => expect(
        200.mapToRegisteredStatusCodeOrNull(
          isInformational: (_) => 100,
          orElse: (_) => 999,
        ),
        999,
      ),
    );

    test(
      'common test for out of range',
      () => expect(
        1.mapToRegisteredStatusCodeOrNull(
          orElse: (_) => const StatusCode.custom(290),
          isInformational: (_) => const StatusCode.custom(144),
        ),
        const StatusCode.custom(290),
      ),
    );

    test(
      'common test for orElse and value',
      () => expect(
        200.mapToRegisteredStatusCodeOrNull(isSuccess: (code) => code),
        StatusCode.okHttp200,
      ),
    );

    test(
      'common test for orElse and isInformational',
      () => expect(
        100.mapToRegisteredStatusCodeOrNull(isInformational: (code) => code),
        StatusCode.continueHttp100,
      ),
    );

    test(
      'should return null when no handlers provided',
      () => expect(200.mapToRegisteredStatusCodeOrNull<int>(), isNull),
    );

    for (final number in globalWrongCases) {
      test(
        'should return orElse value for $number',
        () => expect(mapToRegisteredCodeOrNull(number), isNull),
      );
    }

    test(
      'should return proper value for $testValue status code',
      () => expect(
        testValue.mapToRegisteredStatusCodeOrNull(
          isInformational: (value) => value,
          orElse: (value) => value,
        ),
        basicCodes.first,
      ),
    );

    test('should return registered StatusCode for double value', () {
      final doubleCode = testValue.toDouble();
      final result = mapToRegisteredCodeOrNull(doubleCode);
      expect(result, basicCodes.first);
      expect(result, isA<StatusCode>());
    });

    for (final status in basicCodes) {
      test('should return $status for registered status code', () {
        final result = mapToRegisteredCodeOrNull(status);
        expect(result, status);
        expect(result, isA<StatusCode>());
      });
    }

    test('should handle unregistered code with orElse', () {
      final result = 290.mapToRegisteredStatusCodeOrNull(
        isSuccess: (code) => code,
        orElse: (code) => const StatusCode.custom(290),
      );
      expect(result, const StatusCode.custom(290));
    });

    test('should pass null to orElse for unregistered code', () {
      StatusCode? receivedCode;
      final result = 144.mapToRegisteredStatusCodeOrNull(
        // ignore: prefer-extracting-function-callbacks, just a test.
        orElse: (code) {
          receivedCode = code;

          return const StatusCode.custom(144);
        },
      );
      expect(receivedCode, isNull);
      expect(result, const StatusCode.custom(144));
    });

    test('should pass registered code to handler', () {
      StatusCode? receivedCode;
      final result = StatusCode.okHttp200.mapToRegisteredStatusCodeOrNull(
        // ignore: prefer-extracting-function-callbacks, just a test.
        isSuccess: (code) {
          receivedCode = code;

          return code;
        },
      );
      expect(receivedCode, StatusCode.okHttp200);
      expect(result, StatusCode.okHttp200);
    });
  });

  group('isOneOf', () {
    const successCodes = [
      StatusCode.okHttp200,
      StatusCode.createdHttp201,
      StatusCode.acceptedHttp202,
    ];

    const errorCodes = [
      StatusCode.badRequestHttp400,
      StatusCode.unauthorizedHttp401,
      StatusCode.notFoundHttp404,
      StatusCode.internalServerErrorHttp500,
    ];

    test('should return true when value matches one of the status codes', () {
      expect(200.isOneOf(successCodes), isTrue);
      expect(201.isOneOf(successCodes), isTrue);
      expect(202.isOneOf(successCodes), isTrue);
      expect(404.isOneOf(errorCodes), isTrue);
      expect(500.isOneOf(errorCodes), isTrue);
    });

    test('should return false when value does not match any status codes', () {
      expect(300.isOneOf(successCodes), isFalse);
      expect(404.isOneOf(successCodes), isFalse);
      expect(200.isOneOf(errorCodes), isFalse);
      expect(600.isOneOf(errorCodes), isFalse);
    });

    test('should return false for null values', () {
      // ignore: avoid-explicit-type-declaration, it's a test.
      const num? nullValue = null;
      expect(nullValue.isOneOf(successCodes), isFalse);
      expect(nullValue.isOneOf(errorCodes), isFalse);
    });

    test('should return false for empty iterable', () {
      const emptyCodes = <StatusCode>[];
      expect(200.isOneOf(emptyCodes), isFalse);
      expect(404.isOneOf(emptyCodes), isFalse);
      expect(null.isOneOf(emptyCodes), isFalse);
    });

    test('should work with $Set<$StatusCode>', () {
      final codeSet = {StatusCode.okHttp200, StatusCode.notFoundHttp404};
      expect(200.isOneOf(codeSet), isTrue);
      expect(404.isOneOf(codeSet), isTrue);
      expect(500.isOneOf(codeSet), isFalse);
    });

    test('should work with single status code in iterable', () {
      const singleCode = [StatusCode.okHttp200];
      expect(200.isOneOf(singleCode), isTrue);
      expect(201.isOneOf(singleCode), isFalse);
    });

    test('should work with all basic codes', () {
      expect(100.isOneOf(basicCodes), isTrue);
      expect(200.isOneOf(basicCodes), isTrue);
      expect(300.isOneOf(basicCodes), isTrue);
      expect(400.isOneOf(basicCodes), isTrue);
      expect(500.isOneOf(basicCodes), isTrue);
    });

    test('should work with wrong cases', () {
      for (final number in globalWrongCases) {
        expect(number.isOneOf(successCodes), isFalse);
        expect(number.isOneOf(errorCodes), isFalse);
      }
    });

    test('should handle large iterable efficiently', () {
      const custom = StatusCode.custom(105);
      expect(200.isOneOf([custom]), isFalse);
      expect(105.isOneOf([custom]), isTrue);
    });
  });

  group('isCacheable', () {
    const cacheableCodes = {
      StatusCode.okHttp200,
      StatusCode.nonAuthoritativeInformationHttp203,
      StatusCode.noContentHttp204,
      StatusCode.partialContentHttp206,
      StatusCode.multipleChoicesHttp300,
      StatusCode.movedPermanentlyHttp301,
      StatusCode.notFoundHttp404,
      StatusCode.methodNotAllowedHttp405,
      StatusCode.goneHttp410,
      StatusCode.uriTooLongHttp414,
      StatusCode.notImplementedHttp501,
    };

    test('should return true for cacheable status codes', () {
      for (final code in cacheableCodes) {
        expect(code.isCacheable, isTrue, reason: '$code should be cacheable');
      }
    });

    test('should return true for double cacheable status codes', () {
      expect(200.0.isCacheable, isTrue);
      expect(404.0.isCacheable, isTrue);
      expect(301.0.isCacheable, isTrue);
    });

    test('should return false for non-cacheable status codes', () {
      const nonCacheables = {
        StatusCode.createdHttp201,
        StatusCode.acceptedHttp202,
        StatusCode.badRequestHttp400,
        StatusCode.unauthorizedHttp401,
        StatusCode.forbiddenHttp403,
        StatusCode.internalServerErrorHttp500,
        StatusCode.badGatewayHttp502,
        StatusCode.serviceUnavailableHttp503,
      };

      for (final code in nonCacheables) {
        expect(
          code.isCacheable,
          isFalse,
          reason: '$code should not be cacheable',
        );
      }
    });

    test('should return false for null and invalid values', () {
      for (final number in globalWrongCases) {
        expect(number.isCacheable, isFalse);
      }
    });

    test('should return false for unregistered codes in cacheable range', () {
      expect(299.isCacheable, isFalse);
      expect(399.isCacheable, isFalse);
    });
  });

  group('isRetryable', () {
    const retryableCodes = {
      StatusCode.requestTimeoutHttp408,
      StatusCode.tooEarlyHttp425,
      StatusCode.tooManyRequestsHttp429,
      StatusCode.internalServerErrorHttp500,
      StatusCode.badGatewayHttp502,
      StatusCode.serviceUnavailableHttp503,
      StatusCode.gatewayTimeoutHttp504,
      StatusCode.networkAuthenticationRequiredHttp511,
      StatusCode.networkReadTimeoutErrorHttp598,
      StatusCode.networkConnectTimeoutErrorHttp599,
    };

    test('should return true for retryable status codes', () {
      for (final code in retryableCodes) {
        expect(code.isRetryable, isTrue, reason: '$code should be retryable');
      }
    });

    test('should return true for double retryable status codes', () {
      expect(503.0.isRetryable, isTrue);
      expect(429.0.isRetryable, isTrue);
      expect(504.0.isRetryable, isTrue);
    });

    test('should return false for non-retryable status codes', () {
      const nonRetryables = {
        StatusCode.okHttp200,
        StatusCode.createdHttp201,
        StatusCode.noContentHttp204,
        StatusCode.badRequestHttp400,
        StatusCode.unauthorizedHttp401,
        StatusCode.forbiddenHttp403,
        StatusCode.notFoundHttp404,
        StatusCode.methodNotAllowedHttp405,
        StatusCode.conflictHttp409,
        StatusCode.goneHttp410,
        StatusCode.notImplementedHttp501,
        StatusCode.httpVersionNotSupportedHttp505,
      };

      for (final code in nonRetryables) {
        expect(
          code.isRetryable,
          isFalse,
          reason: '$code should not be retryable',
        );
      }
    });

    test('should return false for null and invalid values', () {
      for (final number in globalWrongCases) {
        expect(number.isRetryable, isFalse);
      }
    });

    test('should return false for unregistered codes in retryable range', () {
      expect(499.isRetryable, isFalse);
      expect(505.isRetryable, isFalse);
      expect(520.isRetryable, isFalse);
    });
  });
});
