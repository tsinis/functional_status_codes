## 2.2.0

This release provides extended README documentation with a link to Zapp playground where you can play with a package in a DartPad like environment.

- docs: improve and provide zapp link in the readme
- chore(deps): update ci dependencies

## 2.1.0

NEW FEATURE: Added new methods: a `Map<num, Object?>` like equivalent of `whenStatusCode` + `whenStatusCodeOrNull` methods - `whenConstStatusCode` and `whenConstStatusCodeOrNull`. Should be only used with a constant values (i.e. final, const). And `mapToRegisteredStatusCode` + `maybeMapToRegisteredStatusCode` - alternatives for a `mapStatusCode` that are trying to return a `StatusCode` object instead of `num` for further mapping with a specific registered status code. `StatusCode` now also exposes `RegExp regExp` static getter and `static const pattern` for your needs, also `tryParse` method now allow any `Object?` inputs (not limited to `String?` only anymore).

- feat: added whenConstStatusCode
- feat: added whenConstStatusCodeOrNull
- feat: added mapToRegisteredStatusCode
- feat: added maybeMapToRegisteredStatusCode
- refactor: status code enum now exposes reg-exp and it's pattern
- refactor: status code try-parse method allow any nullable object inputs

## 2.0.0

NEW FEATURE: added 19 new common [unofficial status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes)

- feat: added 19 common unofficial status codes

## 1.2.1

- fix(docs): remove hardcoded reference to version in readme

## 1.2.0

NEW FEATURE: added two new methods for a `Map` like equivalent of `when` and `whenOrNull` methods - `whenConst` and `whenConstOrNull`. Should be only used with a constant values (i.e. final, const).

- feat: added when const and when const or null methods

## 1.1.0

Contains **breaking changes** in `maybeMapStatusCode` method on `num`. Please follow migration guide below.

- refactor!: orElse parameter in maybeMapStatusCode now returns input value in order to handle this unregistered status code.

- docs: updated documentation of breaking update.
- docs: added topics to pubspec.yaml.
- chore: updated SDK upper-bound to 4.0.0.
- refactor: replaced deprecated fields in analysis_options.yaml with new ones.

Since `maybeMapStatusCode` now returns input value, you will have to adjust your existing code, for example:

Replace from:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: () => handleUnregisteredStatusCode(statusCode),
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

Use this instead:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: handleUnregisteredStatusCode,
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

Or if you are using tear-off syntax, replace:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: handleUnregisteredStatusCode,
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

With this instead:

```dart
...
final statusCode = response.statusCode;
...
statusCode.maybeMapStatusCode(
    orElse: (_) => handleUnregisteredStatusCode(),
    isSuccess: handleSuccessStatusCode,
    ...
);
...
```

## 1.0.6

- docs: fixed contribution guidelines reference link.

## 1.0.5

- docs: changed screenshot to webp format.
- ci(github): added automatic pub.dev publishing workflow.

## 1.0.4

- docs: added screenshot to pub.dev, no code changes.

## 1.0.3

- refactor: small refactoring in generated functional enums extensions and dependencies update.

## 1.0.2

- docs: removing unnecessary information from the documentation.

## 1.0.1

- docs: update README documentation.

## 1.0.0

- initial version.
