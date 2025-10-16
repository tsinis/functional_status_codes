# Example Project

Here you will find two different examples:

1) Simple example, that you can run with `dart run lib/main.dart --simple` command from the example folder.

2) A modified [http package example](https://github.com/dart-lang/http/blob/master/pkgs/http/example/main.dart) that uses the `functional_status_codes` library to handle HTTP status codes in a functional way. It uses the Google Books API to search for books and parses the response from the API to print the number of books found.

First, it creates a URL for the API request and sends a GET request to the server. It then checks if the status code of the response is a valid HTTP status code. If it is, it checks if the status code is a success status code (in the range 200-299). If it is, it converts the status code to a `StatusCode` type from the [functional_status_codes](https://pub.dev/packages/functional_status_codes) library, and uses the `maybeMap` method to determine if the status code is a `201` (Created) or a `200` (OK). If it is a `201`, it prints a message and returns the status code. If it is a `200`, it decodes the JSON response, gets the total number of books found, and prints the number of books. If the status code is not a `201` or a `200`, it prints a message and returns the status code. If the status code is not a success status code, it prints an error message and returns the status code. If the status code is not a valid HTTP status code, it returns `null`.
