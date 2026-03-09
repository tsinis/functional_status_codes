Generate idiomatic Dart code to handle an HTTP response using the `functional_status_codes` package.

{{#http_client}}
The HTTP client in use is: **{{http_client}}**
{{/http_client}}
{{^http_client}}
Detect the HTTP client from the existing code (look for `http.Response`, `dio.Response`, `HttpClientResponse`, or a plain `int` status code field).
{{/http_client}}

{{#status_code}}
Focus specifically on handling status code **{{status_code}}** (in addition to general handling).
{{/status_code}}

Follow these steps:

1. **Extract the status code** as `int` or `num` from the response object:
   - `package:http` → `response.statusCode` (already `int`)
   - `package:dio` → `response.statusCode` (already `int?`)
   - `dart:io HttpClientResponse` → `response.statusCode` (already `int`)
   - Custom → use whatever field holds the integer status

2. **Apply category-level branching** using `maybeWhenStatusCode` or `maybeMapStatusCode`:
   - Use `maybeWhenStatusCode` when the callbacks do not need the code value passed in
   - Use `maybeMapStatusCode` when you need `(code) =>` in the callback
   - Provide `orElse` for codes outside 100-599 or unhandled categories
   - Do **not** provide `isStatusCode` alongside category handlers unless you intentionally want it to catch all valid codes first

3. **Drill into specific codes** when needed by converting first:

   ```dart
   final registered = rawCode.toRegisteredStatusCode();
   final result = registered?.maybeMap(
     orElse: (c) => defaultHandling(c),
     notFoundHttp404: (_) => handleNotFound(),
   );
   ```

4. **Emit null-safe, idiomatic Dart**:
   - Prefer `?.` and `??` over null-checks
   - Use `whenConstStatusCode` / `whenConstOrNull` when the return values are constants — these accept **direct values**, not closures (e.g. `isSuccess: 'ok'`, never `isSuccess: () => 'ok'`); they must be called on a `StatusCode` value after `toRegisteredStatusCode()` conversion
   - Avoid `if (code >= 200 && code < 300)` — use `.isSuccess` / `.isError` / `.isCacheable` etc.

5. **Handle the specific code** {{#status_code}}({{status_code}}){{/status_code}} with a dedicated branch inside `maybeMap` or `maybeWhen` on the `StatusCode`, using the constant name `<camelName>Http<NNN>`.

Produce a complete, runnable function or method — not just a snippet — with appropriate return type and error handling.
