// ignore_for_file: avoid_print, avoid-unused-parameters, prefer-static-class,
// ignore_for_file: prefer-extracting-function-callbacks

import 'dart:convert' as convert;

import 'package:functional_status_codes/functional_status_codes.dart';
import 'package:http/http.dart' as http;

Future<int?> main([List<String> args = const [], http.Client? client]) =>
    args.any((argument) => argument.toLowerCase().contains('simple'))
    ? _simple(args)
    : _realClient(args, client);

/// Run with `dart run lib/main.dart --simple` command from the `example` folder.
// ignore: avoid-unnecessary-futures, just an example.
Future<int?> _simple(List<String> args) async {
  /// Checks if status code is >=200 & <=299.
  print(105.isSuccess); // Prints false.
  print(200.isSuccess); // Prints true.

  /// Prints true in all those cases.
  print(105.isInformational); // Prints true, when status code is >=100 & <=199.
  print(300.isRedirection); // Prints true, when status code is >=300 & <=399.
  print(404.isClientError); // Prints true, when status code is >=400 & <=499.
  print(501.isServerError); // Prints true, when status code is >=500 & <=599.

  /// Checks if status code is >=100 & <=599.
  print(16.isStatusCode); // Prints false.
  print(160.isStatusCode); // Prints true.

  /// Range checks with [num?] based codes.
  print(140.isStatusCodeWithinRange(min: 101, max: 140)); // Prints true.
  print(
    104.isStatusWithinRange(
      min: StatusCode.switchingProtocolsHttp101, // Can be used as integer too.
      max: StatusCode.earlyHintsHttp103,
    ),
  ); // Prints false.

  /// Also with functional style methods like:
  /// - `mapStatusCode`, `maybeMapStatusCode`, `mapToRegisteredStatusCode`,
  /// - `whenStatusCode`, `whenConstStatusCodeOrNull`, `whenConstStatusCode`.
  // Prints 'ok'.
  print(200.maybeMapStatusCode(orElse: (_) => '?', isSuccess: (_) => 'ok'));
  // Prints '?'.
  print(600.whenConstStatusCodeOrNull(isSuccess: () => 'ok') ?? '?');

  /// Any of those [num?] based codes it's possible additionally map to
  /// a registered status code (official and non-official ones).:
  StatusCode? registeredCode = 160.toRegisteredStatusCode();
  print('registeredCode: $registeredCode'); // Prints registeredCode: null.
  registeredCode = 200.toRegisteredStatusCode(); // Is StatusCode.okHttp200.
  // Handle any type of registered status codes via functional methods:
  registeredCode?.whenOrNull(
    okHttp200: () => print('ok'),
    // Includes all official IAN codes.
    badRequestHttp400: () => print('oh no!'),
    // Includes common unofficial codes too.
    unauthorizedHttp561: () => print('refresh token'),
  );

  /// And much more in the [num?] based extensions + [StatusCode] extension type
  return StatusCode.tryParse(args.join());
}

Future<int?> _realClient(List<String> arguments, [http.Client? client]) async {
  /// This example uses the Google Books API to search for books about `http`:
  /// https://developers.google.com/books/docs/overview
  final url = Uri.https('www.googleapis.com', '/books/v1/volumes', const {
    'q': '{http}',
  });

  final httpClient = client ?? http.Client();
  // Await the http get response, then decode the json-formatted response.
  final response = await httpClient.get(url);
  httpClient.close(); // Close the client to release resources.

  // Check if the status code is a valid HTTP status code.
  // If the status code is not a valid HTTP status code, early return null.
  if (!response.statusCode.isStatusCode) return null;

  // If the status code is a success status code, check if it is a 201
  // (Created) or 200 (OK) code.
  return response.statusCode.maybeWhenStatusCode(
    isSuccess: () {
      // If the status code is success one, convert it to a registered
      // status code object.
      final registeredCode = response.statusCode.toRegisteredStatusCode();

      // Use the [StatusCode] type to determine the specific status code
      // type.
      return registeredCode?.maybeMap(
            createdHttp201: (status) {
              print('Response has registered success status but not 200 code');

              return status; // Return the status code.
            },
            okHttp200: (_) {
              // Decode the JSON response.
              final jsonResponse = convert.jsonDecode(response.body);
              // Get the total number of books in the response.
              // ignore: avoid_dynamic_calls, it's a nature of jsonDecode.
              final itemCount = jsonResponse['totalItems'];
              if (itemCount is! num) return null;
              print('Number of books about http: $itemCount.');

              return itemCount.toInt(); // Return the books count.
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
      print('Request failed with status: ${response.statusCode}!');

      return response.statusCode;
    },
  );
}
