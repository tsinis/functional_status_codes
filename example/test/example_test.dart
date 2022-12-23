import 'dart:convert';

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
      final client = MockClient((request) async {
        final mapJson = {'id': 123};

        return Response(jsonEncode(mapJson), 200);
      });
    });
  });
}
