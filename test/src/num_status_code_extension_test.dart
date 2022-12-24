import 'package:functional_status_codes/src/num_status_code_extension.dart';
import 'package:functional_status_codes/src/status_code.dart';
import 'package:test/test.dart';

void main() => group('NumStatusCodeExtension', () {
      const basicCodes = {
        StatusCode.continueHttp100,
        StatusCode.okHttp200,
        StatusCode.multipleChoicesHttp300,
        StatusCode.badRequestHttp400,
        StatusCode.internalServerErrorHttp500,
      };
      const elseValue = -1;
      final testValue = basicCodes.first.code;
      final globalWrongCases = [
        null,
        elseValue,
        -1.0,
        0.0,
        0,
        1,
        StatusCode.values.first.code - 1,
        StatusCode.values.last.code + 1,
      ];

      group('isStatusCode', () {
        final codeErrorTrueCases = {
          StatusCode.continueHttp100.code,
          StatusCode.continueHttp100.code + 1,
          StatusCode.networkConnectTimeoutErrorHttp599.code - 1,
          StatusCode.networkConnectTimeoutErrorHttp599.code,
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
        final infoTrueCases = {
          StatusCode.continueHttp100.code,
          StatusCode.continueHttp100.code + 1,
          StatusCode.okHttp200.code - 1,
        };

        final infoFalseCases = {
          StatusCode.continueHttp100.code - 1,
          StatusCode.okHttp200.code,
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
        final successTrueCases = {
          StatusCode.okHttp200.code,
          StatusCode.okHttp200.code + 1,
          StatusCode.multipleChoicesHttp300.code - 1,
        };

        final successFalseCases = {
          StatusCode.okHttp200.code - 1,
          StatusCode.multipleChoicesHttp300.code,
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
        final redirectionTrueCases = {
          StatusCode.multipleChoicesHttp300.code,
          StatusCode.multipleChoicesHttp300.code + 1,
          StatusCode.badRequestHttp400.code - 1,
        };

        final redirectionFalseCases = {
          StatusCode.multipleChoicesHttp300.code - 1,
          StatusCode.badRequestHttp400.code,
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
        final clientErrorTrueCases = {
          StatusCode.badRequestHttp400.code,
          StatusCode.badRequestHttp400.code + 1,
          StatusCode.nginxClientClosedRequestHttp499.code,
        };

        final clientErrorFalseCases = {
          StatusCode.badRequestHttp400.code - 1,
          StatusCode.internalServerErrorHttp500.code,
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
        final serverErrorTrueCases = {
          StatusCode.internalServerErrorHttp500.code,
          StatusCode.internalServerErrorHttp500.code + 1,
          StatusCode.networkConnectTimeoutErrorHttp599.code,
        };

        final serverErrorFalseCases = {
          StatusCode.nginxClientClosedRequestHttp499.code,
          StatusCode.networkConnectTimeoutErrorHttp599.code + 1,
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
            () => expect(status.code.toRegisteredStatusCode(), status),
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
            () => expect(
              () => mapCode(number),
              throwsA(const TypeMatcher<AssertionError>()),
            ),
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
          test(
            'should return $int value of ${status.code} status code',
            () {
              final result = mapCode(status.code);
              expect(result, status.code);
              expect(result, isA<int>());
            },
          );
        }
      });

      group('maybeMapStatusCode', () {
        num maybeMapCode(num? number) => number.maybeMapStatusCode(
              isInformational: (value) => value,
              isSuccess: (value) => value,
              isRedirection: (value) => value,
              isClientError: (value) => value,
              isServerError: (value) => value,
              orElse: () => elseValue,
            );

        for (final number in globalWrongCases) {
          test(
            'should throw orElse value for $number',
            () => expect(maybeMapCode(number), elseValue),
          );
        }

        test(
          'should return proper value for $testValue status code',
          () => expect(
            testValue.maybeMapStatusCode(
              isStatusCode: (value) => value,
              orElse: () => null,
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
          test(
            'should return $int value of ${status.code} status code',
            () {
              final result = maybeMapCode(status.code);
              expect(result, status.code);
              expect(result, isA<int>());
            },
          );
        }
      });

      group('maybeWhenStatusCode', () {
        int maybeWhenCode(num? number) => number.maybeWhenStatusCode(
              isInformational: () => StatusCode.continueHttp100.code,
              isSuccess: () => StatusCode.okHttp200.code,
              isRedirection: () => StatusCode.multipleChoicesHttp300.code,
              isClientError: () => StatusCode.badRequestHttp400.code,
              isServerError: () => StatusCode.internalServerErrorHttp500.code,
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
            'should return proper value for ${status.code} status code',
            () => expect(maybeWhenCode(status.code), status.code),
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
        int whenWhenCode(num? number) => number.whenStatusCode(
              isInformational: () => StatusCode.continueHttp100.code,
              isSuccess: () => StatusCode.okHttp200.code,
              isRedirection: () => StatusCode.multipleChoicesHttp300.code,
              isClientError: () => StatusCode.badRequestHttp400.code,
              isServerError: () => StatusCode.internalServerErrorHttp500.code,
            );

        for (final number in globalWrongCases) {
          test(
            'should throw $FormatException for $number',
            () => expect(
              () => whenWhenCode(number),
              throwsA(const TypeMatcher<AssertionError>()),
            ),
          );
        }

        for (final status in basicCodes) {
          test(
            'should return proper value for ${status.code} status code',
            () => expect(whenWhenCode(status.code), status.code),
          );
        }
      });

      group('whenStatusCodeOrNull', () {
        int? maybeWhenCodeOrNull(num? number) => number.whenStatusCodeOrNull(
              isInformational: () => StatusCode.continueHttp100.code,
              isSuccess: () => StatusCode.okHttp200.code,
              isRedirection: () => StatusCode.multipleChoicesHttp300.code,
              isClientError: () => StatusCode.badRequestHttp400.code,
              isServerError: () => StatusCode.internalServerErrorHttp500.code,
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
            'should return proper value for ${status.code} status code',
            () => expect(maybeWhenCodeOrNull(status.code), status.code),
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
    });
