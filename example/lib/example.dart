import 'dart:convert' as convert;

import 'package:functional_status_codes/functional_status_codes.dart';
import 'package:http/http.dart' as http;

Future<int?> main(List<String> arguments, [http.Client? client]) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  final response = await (client ?? http.Client()).get(url);

  if (response.statusCode.isStatusCode) {
    return response.statusCode.maybeWhenStatusCode(
      isSuccess: () {
        final registeredCode = response.statusCode.toRegisteredStatusCode();

        return registeredCode?.maybeMap(
          ok200: (code) {
            final jsonResponse =
                convert.jsonDecode(response.body) as Map<String, dynamic>;
            final itemCount = jsonResponse['totalItems'] as int?;
            print('Number of books about http: $itemCount.');

            return itemCount;
          },
          orElse: () {
            print('Response returned success status code but not 200');

            return null;
          },
        );
      },
      orElse: () {
        print('Request failed with status: ${response.statusCode}.');

        return null;
      },
    );
  }

  return null;
}