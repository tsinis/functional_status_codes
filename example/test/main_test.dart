import 'package:functional_status_codes/functional_status_codes.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

// ignore: avoid_relative_lib_imports, to separate packages.
import '../lib/main.dart' as example;

void main() {
  group('simple example', () {
    test(
      'with no status code in args',
      () async => expect(await example.main(['simple']), isNull),
    );

    test(
      'with a status code in args',
      () async => expect(
        await example.main(['simple', StatusCode.values.first.toString()]),
        StatusCode.values.first.code,
      ),
    );
  });

  group('http example', () {
    test(
      'with real client',
      () async => expect(await example.main([]), isNotNull),
    );

    group('with mocked client', () {
      test('registered 300 status code', () async {
        final client = MockClient((_) async => Response('', 300));
        expect(await example.main([], client), 300);
      });

      test('status code outside 100-599 range', () async {
        final client = MockClient((_) async => Response('', 600));
        expect(await example.main([], client), isNull);
      });

      group('on success status codes:', () {
        test('registered 200 status code', () async {
          final client =
              MockClient((_) async => Response('{"totalItems": 0}', 200));
          expect(await example.main([], client), isZero);
        });

        test('registered 201 status code', () async {
          final client = MockClient((_) async => Response('', 201));
          expect(await example.main([], client), 201);
        });

        test('non-registered 299 status code', () async {
          final client = MockClient((_) async => Response('', 299));
          expect(await example.main([], client), 299);
        });
      });
    });
  });
}
