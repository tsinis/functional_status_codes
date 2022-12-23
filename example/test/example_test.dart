import 'package:functional_status_codes_example/example.dart' as example;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
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
