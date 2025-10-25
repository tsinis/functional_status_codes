// ignore_for_file: avoid-misused-test-matchers
import 'dart:math';

import 'package:functional_status_codes/src/num_status_code_extension.dart';
import 'package:functional_status_codes/src/status_code.dart';
import 'package:functional_status_codes/src/status_code_extension.dart';
import 'package:test/test.dart';

void main() => group('$StatusCode', () {
  const maxCode = StatusCode.networkConnectTimeoutErrorHttp599 + 1;
  final randomInt = maxCode + Random().nextInt(999 - maxCode);

  group('custom', () {
    test('in valid range', () {
      expect(
        () => const StatusCode.custom(StatusCode.earlyHintsHttp103 + 1),
        isNotNull,
      );
    });

    group('asserts', () {
      test('greater than ${StatusCode.networkConnectTimeoutErrorHttp599}', () {
        expect(() => StatusCode.custom(999), throwsA(isA<AssertionError>()));
      });

      for (final code in StatusCode.values) {
        test('equal to existing code: $code', () {
          expect(() => StatusCode.custom(code), throwsA(isA<AssertionError>()));
        });
      }
    });
  });

  group('maybeFromCode', () {
    test(
      'should return null from "null" statusCode',
      () => expect(StatusCode.maybeFromCode(null), isNull),
    );

    test(
      'should return null from "0" statusCode',
      () => expect(StatusCode.maybeFromCode(0), isNull),
    );

    test(
      'should return null from "1.0" statusCode',
      () => expect(StatusCode.maybeFromCode(1.0), isNull),
    );

    test(
      'should return null from "$randomInt" statusCode',
      () => expect(StatusCode.maybeFromCode(randomInt), isNull),
    );

    for (final status in StatusCode.values) {
      test(
        'should return $status from "$status" statusCode',
        () => expect(StatusCode.maybeFromCode(status), status),
      );
    }
  });

  group('tryParse', () {
    test(
      'should return null from "null" statusCode',
      () => expect(StatusCode.tryParse(null), isNull),
    );

    test(
      'should return null from "0" statusCode',
      () => expect(StatusCode.tryParse('0'), isNull),
    );

    test(
      'should return null from "1.0" statusCode',
      () => expect(StatusCode.tryParse('1.0'), isNull),
    );

    test(
      'should return null from "$randomInt" statusCode',
      () => expect(StatusCode.tryParse('$randomInt'), isNull),
    );

    test(
      'should return null from full 200 text',
      () => expect(
        StatusCode.tryParse(
          '${StatusCode.okHttp200.reason}:${StatusCode.okHttp200}',
        ),
        StatusCode.okHttp200,
      ),
    );

    test(
      'should return null from random text with $randomInt number',
      () => expect(StatusCode.tryParse('Random text with $randomInt.'), isNull),
    );

    test(
      'should parse all kind of $Object-s',
      () => expect(StatusCode.tryParse(100), isNotNull),
    );

    for (final status in StatusCode.values) {
      test(
        'should return $status from "${status.reason}: $status."',
        () => expect(StatusCode.tryParse('${status.reason}: $status.'), status),
      );
    }
  });

  group('random', () {
    test('returns a $StatusCode from default values', () {
      final result = StatusCode.random();
      expect(result, isA<StatusCode>());
      expect(StatusCode.values, contains(result));
    });

    test('returns a $StatusCode from provided list', () {
      const codes = [
        StatusCode.okHttp200,
        StatusCode.createdHttp201,
        StatusCode.acceptedHttp202,
      ];
      final result = StatusCode.random(from: codes);
      expect(result, isA<StatusCode>());
      expect(codes, contains(result));
    });

    test('returns a $StatusCode from provided set', () {
      const codes = {
        StatusCode.badRequestHttp400,
        StatusCode.unauthorizedHttp401,
        StatusCode.forbiddenHttp403,
      };
      final result = StatusCode.random(from: codes);
      expect(result, isA<StatusCode>());
      expect(codes, contains(result));
    });

    test('works with single code', () {
      const codes = [StatusCode.notFoundHttp404];
      final result = StatusCode.random(from: codes);
      expect(result, StatusCode.notFoundHttp404);
    });

    test('works with official codes only', () {
      final result = StatusCode.random(from: StatusCode.officialCodes);
      expect(result, isA<StatusCode>());
      expect(StatusCode.officialCodes, contains(result));
    });

    test('works with cacheable codes', () {
      final result = StatusCode.random(from: StatusCode.cacheableCodes);
      expect(result, isA<StatusCode>());
      expect(StatusCode.cacheableCodes, contains(result));
    });

    test('works with retryable codes', () {
      final result = StatusCode.random(from: StatusCode.retryableCodes);
      expect(result, isA<StatusCode>());
      expect(StatusCode.retryableCodes, contains(result));
    });

    test('works with any iterable type', () {
      final listResult = StatusCode.random(
        from: const [StatusCode.okHttp200, StatusCode.createdHttp201],
      );
      expect(listResult.isSuccess, isTrue);

      final setResult = StatusCode.random(
        from: const {StatusCode.okHttp200, StatusCode.createdHttp201},
      );
      expect(setResult.isSuccess, isTrue);

      final iterableResult = StatusCode.random(
        from: StatusCode.values.where((code) => code.isOfficial).take(5),
      );
      expect(iterableResult.isOfficial, isTrue);
    });

    test('asserts on empty iterable in debug mode', () {
      const emptyCodes = <StatusCode>[];
      expect(
        () => StatusCode.random(from: emptyCodes),
        throwsA(isA<AssertionError>()),
      );
    });
  });
});
