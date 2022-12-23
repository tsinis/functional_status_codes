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

  // Check if the status code is a valid HTTP status code.
  if (response.statusCode.isStatusCode) {
    // If the status code is a success status code, check if it is a 201
    // (Created) or 200 (OK) code.
    return response.statusCode.maybeWhenStatusCode(
      isSuccess: () {
        // If the status code is success one, convert it to a registered
        // status code object.
        final registeredCode = response.statusCode.toRegisteredStatusCode();

        // Use the [StatusCode] object to determine the specific status code
        // type.
        return registeredCode?.maybeMap(
              createdHttp201: (status) {
                print(
                  'Response has registered success status but not 200 code',
                );

                // Return the status code.
                return status.code;
              },
              okHttp200: (_) {
                // Decode the JSON response.
                final jsonResponse =
                    convert.jsonDecode(response.body) as Map<String, dynamic>;
                // Get the total number of books in the response.
                final itemCount = jsonResponse['totalItems'] as int?;
                print('Number of books about http: $itemCount.');

                // Return the books count.
                return itemCount;
              },
              orElse: () {
                print('Response has success status but not 200 code');

                // Return the status code.
                return response.statusCode;
              },
            ) ??
            // If the status code is not a registered status code, return the
            // status code.
            response.statusCode;
      },
      orElse: () {
        // If the status code is not a success status code, print an error
        // message and return the status code.
        print('Request failed with status: ${response.statusCode}.');

        return response.statusCode;
      },
    );
  }

// If the status code is not a valid HTTP status code, return null.
  return null;
}
