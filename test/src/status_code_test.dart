import 'dart:math';

import 'package:functional_status_codes/functional_status_codes.dart';
import 'package:test/test.dart';

void main() => group('$StatusCode', () {
      final maxCode = StatusCode.networkConnectTimeoutErrorHttp599.code + 1;
      final randomInt = maxCode + Random().nextInt(999 - maxCode);
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
            'should return $status from "${status.code}" statusCode',
            () => expect(StatusCode.maybeFromCode(status.code), status),
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
              '${StatusCode.okHttp200.reason}:${StatusCode.okHttp200.code}',
            ),
            StatusCode.okHttp200,
          ),
        );

        test(
          'should return null from random text with $randomInt number',
          () => expect(
            StatusCode.tryParse(
              'Random text with $randomInt.',
            ),
            isNull,
          ),
        );

        for (final status in StatusCode.values) {
          test(
            'should return $status from "${status.reason}: ${status.code}."',
            () => expect(
              StatusCode.tryParse(
                '${status.reason}: ${status.code}.',
              ),
              status,
            ),
          );
        }
      });
    });
