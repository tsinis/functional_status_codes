import 'package:functional_status_codes/functional_status_codes.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

// ignore: avoid_relative_lib_imports, to separate packages.
import '../lib/main.dart' as example;

void main() {
  const simple = 'simple';

  group('$simple example', () {
    test(
      'with no status code in args',
      () async => expect(await example.main(const [simple]), isNull),
    );

    test(
      'with a status code in args',
      () async => expect(
        await example.main([simple, StatusCode.values.first.toString()]),
        StatusCode.values.first,
      ),
    );
  });

  group('http example', () {
    test(
      'with real client',
      () async => expect(await example.main(), isNotNull),
    );

    group('with mocked client', () {
      const empty = '';

      test('registered 300 status code', () async {
        final client = MockClient(
          (_) async => Response(empty, StatusCode.multipleChoicesHttp300),
        );
        expect(
          await example.main(const [], client),
          StatusCode.multipleChoicesHttp300,
        );
      });

      test('status code outside 100-599 range', () async {
        final client = MockClient(
          (_) async =>
              Response(empty, StatusCode.networkConnectTimeoutErrorHttp599 + 1),
        );
        expect(await example.main(const [], client), isNull);
      });

      group('on success status codes:', () {
        test('registered 200 status code', () async {
          final client = MockClient(
            (_) async => Response('{"totalItems": 0}', StatusCode.okHttp200),
          );
          expect(await example.main(const [], client), isZero);
        });

        test('registered 201 status code', () async {
          final client = MockClient(
            (_) async => Response(empty, StatusCode.createdHttp201),
          );
          expect(
            await example.main(const [], client),
            StatusCode.createdHttp201,
          );
        });

        test('non-registered 299 status code', () async {
          final client = MockClient(
            (_) async => Response(empty, StatusCode.multipleChoicesHttp300 - 1),
          );
          expect(
            await example.main(const [], client),
            StatusCode.multipleChoicesHttp300 - 1,
          );
        });
      });
    });
  });
}
