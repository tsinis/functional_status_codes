// Copyright (c) 2025, Roman Cinis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: format-comment, because of trailing dot at the end of URLs.

/// Dart `extension type` for easier handling of known unofficial, all IANA
/// registered and custom HTTP status codes.
extension type const StatusCode._(int _code) implements int {
  /// Creates a custom HTTP status code that is not part of the unofficial or
  ///  standard IANA registered codes.
  ///
  /// This constructor allows you to define custom status codes for specialized
  /// use cases, such as internal APIs or vendor-specific implementations. The
  /// custom code must not conflict with any existing standard status codes and
  /// must be within a valid range (greater than `103` and less than `599`).
  ///
  /// Example:
  /// ```dart
  /// // Create a custom status code for internal API rate limiting.
  /// const customRateLimit = StatusCode.custom(456);
  /// print(customRateLimit); // Output: `456`
  /// print(customRateLimit.isCustom); // Output: `true`
  /// print(customRateLimit.reason); // Output: Custom status code: `456`
  /// ```
  ///
  /// Throws an [AssertionError] if the provided code matches any standard
  /// status code or is outside the valid range.
  const StatusCode.custom(int code)
    : assert(code != continueHttp100, '$_assert$code'),
      assert(code != switchingProtocolsHttp101, '$_assert$code'),
      assert(code != processingHttp102, '$_assert$code'),
      assert(code != earlyHintsHttp103, '$_assert$code'),
      assert(code != okHttp200, '$_assert$code'),
      assert(code != createdHttp201, '$_assert$code'),
      assert(code != acceptedHttp202, '$_assert$code'),
      assert(code != nonAuthoritativeInformationHttp203, '$_assert$code'),
      assert(code != noContentHttp204, '$_assert$code'),
      assert(code != resetContentHttp205, '$_assert$code'),
      assert(code != partialContentHttp206, '$_assert$code'),
      assert(code != multiStatusHttp207, '$_assert$code'),
      assert(code != alreadyReportedHttp208, '$_assert$code'),
      assert(code != imUsedHttp226, '$_assert$code'),
      assert(code != multipleChoicesHttp300, '$_assert$code'),
      assert(code != movedPermanentlyHttp301, '$_assert$code'),
      assert(code != foundHttp302, '$_assert$code'),
      assert(code != seeOtherHttp303, '$_assert$code'),
      assert(code != notModifiedHttp304, '$_assert$code'),
      assert(code != useProxyHttp305, '$_assert$code'),
      assert(code != temporaryRedirectHttp307, '$_assert$code'),
      assert(code != permanentRedirectHttp308, '$_assert$code'),
      assert(code != badRequestHttp400, '$_assert$code'),
      assert(code != unauthorizedHttp401, '$_assert$code'),
      assert(code != paymentRequiredHttp402, '$_assert$code'),
      assert(code != forbiddenHttp403, '$_assert$code'),
      assert(code != notFoundHttp404, '$_assert$code'),
      assert(code != methodNotAllowedHttp405, '$_assert$code'),
      assert(code != notAcceptableHttp406, '$_assert$code'),
      assert(code != proxyAuthenticationRequiredHttp407, '$_assert$code'),
      assert(code != requestTimeoutHttp408, '$_assert$code'),
      assert(code != conflictHttp409, '$_assert$code'),
      assert(code != goneHttp410, '$_assert$code'),
      assert(code != lengthRequiredHttp411, '$_assert$code'),
      assert(code != preconditionFailedHttp412, '$_assert$code'),
      assert(code != payloadTooLargeHttp413, '$_assert$code'),
      assert(code != uriTooLongHttp414, '$_assert$code'),
      assert(code != unsupportedMediaTypeHttp415, '$_assert$code'),
      assert(code != rangeNotSatisfiableHttp416, '$_assert$code'),
      assert(code != expectationFailedHttp417, '$_assert$code'),
      assert(code != imATeapotHttp418, '$_assert$code'),
      assert(code != misdirectedRequestHttp421, '$_assert$code'),
      assert(code != unprocessableEntityHttp422, '$_assert$code'),
      assert(code != lockedHttp423, '$_assert$code'),
      assert(code != failedDependencyHttp424, '$_assert$code'),
      assert(code != tooEarlyHttp425, '$_assert$code'),
      assert(code != upgradeRequiredHttp426, '$_assert$code'),
      assert(code != preconditionRequiredHttp428, '$_assert$code'),
      assert(code != tooManyRequestsHttp429, '$_assert$code'),
      assert(code != requestHeaderFieldsTooLargeHttp431, '$_assert$code'),
      assert(code != iisLoginTimeoutHttp440, '$_assert$code'),
      assert(code != nginxNoResponseHttp444, '$_assert$code'),
      assert(code != iisRetryWithHttp449, '$_assert$code'),
      assert(code != blockedByWindowsParentalControlsHttp450, '$_assert$code'),
      assert(code != unavailableForLegalReasonsHttp451, '$_assert$code'),
      assert(code != nginxSSLCertificateErrorHttp495, '$_assert$code'),
      assert(code != nginxSSLCertificateRequiredHttp496, '$_assert$code'),
      assert(code != nginxHTTPToHTTPSHttp497, '$_assert$code'),
      assert(code != tokenExpiredHttp498, '$_assert$code'),
      assert(code != nginxClientClosedRequestHttp499, '$_assert$code'),
      assert(code != internalServerErrorHttp500, '$_assert$code'),
      assert(code != notImplementedHttp501, '$_assert$code'),
      assert(code != badGatewayHttp502, '$_assert$code'),
      assert(code != serviceUnavailableHttp503, '$_assert$code'),
      assert(code != gatewayTimeoutHttp504, '$_assert$code'),
      assert(code != httpVersionNotSupportedHttp505, '$_assert$code'),
      assert(code != variantAlsoNegotiatesHttp506, '$_assert$code'),
      assert(code != insufficientStorageHttp507, '$_assert$code'),
      assert(code != loopDetectedHttp508, '$_assert$code'),
      assert(code != bandwidthLimitExceededHttp509, '$_assert$code'),
      assert(code != notExtendedHttp510, '$_assert$code'),
      assert(code != networkAuthenticationRequiredHttp511, '$_assert$code'),
      assert(code != siteIsFrozenHttp530, '$_assert$code'),
      assert(code != thisIsFineHttp218, '$_assert$code'),
      assert(code != pageExpiredHttp419, '$_assert$code'),
      assert(code != enhanceYourCalmHttp420, '$_assert$code'),
      assert(code != requestHeaderFieldsTooLargeHttp430, '$_assert$code'),
      assert(code != siteIsOverloadedHttp529, '$_assert$code'),
      assert(code != networkReadTimeoutErrorHttp598, '$_assert$code'),
      assert(code != requestHeaderTooLargeHttp494, '$_assert$code'),
      assert(code != webServerReturnedUnknownErrorHttp520, '$_assert$code'),
      assert(code != webServerIsDownHttp521, '$_assert$code'),
      assert(code != connectionTimedOutHttp522, '$_assert$code'),
      assert(code != originIsUnreachableHttp523, '$_assert$code'),
      assert(code != timeoutOccurredHttp524, '$_assert$code'),
      assert(code != sslHandshakeFailedHttp525, '$_assert$code'),
      assert(code != invalidSSLCertificateHttp526, '$_assert$code'),
      assert(code != railgunErrorHttp527, '$_assert$code'),
      assert(code != clientClosedConnectionHttp460, '$_assert$code'),
      assert(code != tooManyIpAddressesHttp463, '$_assert$code'),
      assert(code != incompatibleProtocolVersionsHttp464, '$_assert$code'),
      assert(code != unauthorizedHttp561, '$_assert$code'),
      assert(code != networkConnectTimeoutErrorHttp599, '$_assert$code'),
      assert(
        code > StatusCode.earlyHintsHttp103,
        'Custom status code must be greater than $earlyHintsHttp103',
      ),
      assert(
        code < StatusCode.networkConnectTimeoutErrorHttp599,
        '''Custom status code must be less than $networkConnectTimeoutErrorHttp599''',
      ),
      _code = code;

  static const _assert = 'Custom status code cannot reuse code: ';

  // --- Informational 1xx. ---

  /// Continue: 100
  ///
  /// Reference: [RFC7231, Section 6.2.1](http://www.iana.org/go/rfc7231#section-6.2.1)
  static const continueHttp100 = StatusCode._(100);

  /// Switching Protocols: 101
  ///
  /// Reference: [RFC7231, Section 6.2.2](http://www.iana.org/go/rfc7231#section-6.2.2)
  static const switchingProtocolsHttp101 = StatusCode._(101);

  /// Processing: 102
  ///
  /// Reference: [RFC2518](http://www.iana.org/go/rfc2518)
  static const processingHttp102 = StatusCode._(102);

  /// Early Hints: 103
  ///
  /// Reference: [RFC8297](http://www.iana.org/go/rfc8297)
  static const earlyHintsHttp103 = StatusCode._(103);

  // --- Success 2xx ---

  /// OK: 200
  ///
  /// Reference: [RFC7231, Section 6.3.1](http://www.iana.org/go/rfc7231#section-6.3.1)
  static const okHttp200 = StatusCode._(200);

  /// Created: 201
  ///
  /// Reference: [RFC7231, Section 6.3.2](http://www.iana.org/go/rfc7231#section-6.3.2)
  static const createdHttp201 = StatusCode._(201);

  /// Accepted: 202
  ///
  /// Reference: [RFC7231, Section 6.3.3](http://www.iana.org/go/rfc7231#section-6.3.3)
  static const acceptedHttp202 = StatusCode._(202);

  /// Non-Authoritative Information: 203
  ///
  /// Reference: [RFC7231, Section 6.3.4](http://www.iana.org/go/rfc7231#section-6.3.4)
  static const nonAuthoritativeInformationHttp203 = StatusCode._(203);

  /// No Content: 204
  ///
  /// Reference: [RFC7231, Section 6.3.5](http://www.iana.org/go/rfc7231#section-6.3.5)
  static const noContentHttp204 = StatusCode._(204);

  /// Reset Content: 205
  ///
  /// Reference: [RFC7231, Section 6.3.6](http://www.iana.org/go/rfc7231#section-6.3.6)
  static const resetContentHttp205 = StatusCode._(205);

  /// Partial Content: 206
  ///
  /// Reference: [RFC7233, Section 4.1](http://www.iana.org/go/rfc7233#section-4.1)
  static const partialContentHttp206 = StatusCode._(206);

  /// Multi-Status: 207
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  static const multiStatusHttp207 = StatusCode._(207);

  /// Already Reported: 208
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  static const alreadyReportedHttp208 = StatusCode._(208);

  /// IM Used: 226
  ///
  /// Reference: [RFC3229](http://www.iana.org/go/rfc3229)
  static const imUsedHttp226 = StatusCode._(226);

  // --- Redirection 3xx. ---

  /// Multiple Choices: 300
  ///
  /// Reference: [RFC7231, Section 6.4.1](http://www.iana.org/go/rfc7231#section-6.4.1)
  static const multipleChoicesHttp300 = StatusCode._(300);

  /// Moved Permanently: 301
  ///
  /// Reference: [RFC7231, Section 6.4.2](http://www.iana.org/go/rfc7231#section-6.4.2)
  static const movedPermanentlyHttp301 = StatusCode._(301);

  /// Found: 302
  ///
  /// Reference: [RFC7231, Section 6.4.3](http://www.iana.org/go/rfc7231#section-6.4.3)
  static const foundHttp302 = StatusCode._(302);

  /// See Other: 303
  ///
  /// Reference: [RFC7231, Section 6.4.4](http://www.iana.org/go/rfc7231#section-6.4.4)
  static const seeOtherHttp303 = StatusCode._(303);

  /// Not Modified: 304
  ///
  /// Reference: [RFC7232, Section 4.1](http://www.iana.org/go/rfc7232#section-4.1)
  static const notModifiedHttp304 = StatusCode._(304);

  /// Use Proxy: 305
  ///
  /// Reference: [RFC7231, Section 6.4.5](http://www.iana.org/go/rfc7231#section-6.4.5)
  static const useProxyHttp305 = StatusCode._(305);

  /// Temporary Redirect: 307
  ///
  /// Reference: [RFC7231, Section 6.4.7](http://www.iana.org/go/rfc7231#section-6.4.7)
  static const temporaryRedirectHttp307 = StatusCode._(307);

  /// Permanent Redirect: 308
  ///
  /// Reference: [RFC7538](http://www.iana.org/go/rfc7538)
  static const permanentRedirectHttp308 = StatusCode._(308);

  // --- Client side errors 4xx. ---

  /// Bad Request: 400
  ///
  /// Reference: [RFC7231, Section 6.5.1](http://www.iana.org/go/rfc7231#section-6.5.1)
  static const badRequestHttp400 = StatusCode._(400);

  /// Unauthorized: 401
  ///
  /// Reference: [RFC7235, Section 3.1](http://www.iana.org/go/rfc7235#section-3.1)
  static const unauthorizedHttp401 = StatusCode._(401);

  /// Payment Required: 402
  ///
  /// Reference: [RFC7231, Section 6.5.2](http://www.iana.org/go/rfc7231#section-6.5.2)
  static const paymentRequiredHttp402 = StatusCode._(402);

  /// Forbidden: 403
  ///
  /// Reference: [RFC7231, Section 6.5.3](http://www.iana.org/go/rfc7231#section-6.5.3)
  static const forbiddenHttp403 = StatusCode._(403);

  /// Not Found: 404
  ///
  /// Reference: [RFC7231, Section 6.5.4](http://www.iana.org/go/rfc7231#section-6.5.4)
  static const notFoundHttp404 = StatusCode._(404);

  /// Method Not Allowed: 405
  ///
  /// Reference: [RFC7231, Section 6.5.5](http://www.iana.org/go/rfc7231#section-6.5.5)
  static const methodNotAllowedHttp405 = StatusCode._(405);

  /// Not Acceptable: 406
  ///
  /// Reference: [RFC7231, Section 6.5.6](http://www.iana.org/go/rfc7231#section-6.5.6)
  static const notAcceptableHttp406 = StatusCode._(406);

  /// Proxy Authentication Required: 407
  ///
  /// Reference: [RFC7235, Section 3.2](http://www.iana.org/go/rfc7235#section-3.2)
  static const proxyAuthenticationRequiredHttp407 = StatusCode._(407);

  /// Request Timeout: 408
  ///
  /// Reference: [RFC7231, Section 6.5.7](http://www.iana.org/go/rfc7231#section-6.5.7)
  static const requestTimeoutHttp408 = StatusCode._(408);

  /// Conflict: 409
  ///
  /// Reference: [RFC7231, Section 6.5.8](http://www.iana.org/go/rfc7231#section-6.5.8)
  static const conflictHttp409 = StatusCode._(409);

  /// Gone: 410
  ///
  /// Reference: [RFC7231, Section 6.5.9](http://www.iana.org/go/rfc7231#section-6.5.9)
  static const goneHttp410 = StatusCode._(410);

  /// Length Required: 411
  ///
  /// Reference: [RFC7231, Section 6.5.10](http://www.iana.org/go/rfc7231#section-6.5.10)
  static const lengthRequiredHttp411 = StatusCode._(411);

  /// Precondition Failed: 412
  ///
  /// Reference: [RFC7232, Section 4.2](http://www.iana.org/go/rfc7232#section-4.2)
  /// Reference: [RFC8144, Section 3.2](http://www.iana.org/go/rfc8144#section-3.2)
  static const preconditionFailedHttp412 = StatusCode._(412);

  /// Payload Too Large: 413
  ///
  /// Reference: [RFC7231, Section 6.5.11](http://www.iana.org/go/rfc7231#section-6.5.11)
  static const payloadTooLargeHttp413 = StatusCode._(413);

  /// URI Too Long: 414
  ///
  /// Reference: [RFC7231, Section 6.5.12](http://www.iana.org/go/rfc7231#section-6.5.12)
  static const uriTooLongHttp414 = StatusCode._(414);

  /// Unsupported Media Type: 415
  ///
  /// Reference: [RFC7231, Section 6.5.13](http://www.iana.org/go/rfc7231#section-6.5.13)
  /// Reference: [RFC7694, Section 3](http://www.iana.org/go/rfc7694#section-3)
  static const unsupportedMediaTypeHttp415 = StatusCode._(415);

  /// Range Not Satisfiable: 416
  ///
  /// Reference: [RFC7233, Section 4.4](http://www.iana.org/go/rfc7233#section-4.4)
  static const rangeNotSatisfiableHttp416 = StatusCode._(416);

  /// Expectation Failed: 417
  ///
  /// Reference: [RFC7231, Section 6.5.14](http://www.iana.org/go/rfc7231#section-6.5.14)
  static const expectationFailedHttp417 = StatusCode._(417);

  /// I'm A Teapot: 418
  ///
  /// Returned by tea pots requested to brew coffee
  ///
  /// Reference: [RFC 2324](http://www.iana.org/go/rfc2324)
  static const imATeapotHttp418 = StatusCode._(418);

  /// Misdirected Request: 421
  ///
  /// Reference: [RFC7540, Section 9.1.2](http://www.iana.org/go/rfc7540#section-9.1.2)
  static const misdirectedRequestHttp421 = StatusCode._(421);

  /// Unprocessable Entity: 422
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  static const unprocessableEntityHttp422 = StatusCode._(422);

  /// Locked: 423
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  static const lockedHttp423 = StatusCode._(423);

  /// Failed Dependency: 424
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  static const failedDependencyHttp424 = StatusCode._(424);

  /// Too Early: 425
  ///
  /// Reference: [RFC8470](http://www.iana.org/go/rfc8470)
  static const tooEarlyHttp425 = StatusCode._(425);

  /// Upgrade Required: 426
  ///
  /// Reference: [RFC7231, Section 6.5.15](http://www.iana.org/go/rfc7231#section-6.5.15)
  static const upgradeRequiredHttp426 = StatusCode._(426);

  /// Precondition Required: 428
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  static const preconditionRequiredHttp428 = StatusCode._(428);

  /// Too Many Requests: 429
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  static const tooManyRequestsHttp429 = StatusCode._(429);

  /// Request Header Fields Too Large: 431
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  static const requestHeaderFieldsTooLargeHttp431 = StatusCode._(431);

  /// IIS Login Timeout: 440
  ///
  /// The client's session has expired and must log in again.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [Error message when you try to log on to Exchange 2007 by using Outlook Web Access: "440 Login Timeout"](https://learn.microsoft.com/en-us/previous-versions/troubleshoot/dynamics/crm/incoming-status-failure-the-remote-server-returned-an-error-440-login-timeout)
  static const iisLoginTimeoutHttp440 = StatusCode._(440);

  /// nginx No Response: 444
  ///
  /// Used to indicate that the server has returned no information to the
  /// client and closed the connection.
  ///
  /// **Category**: nginx
  static const nginxNoResponseHttp444 = StatusCode._(444);

  /// IIS Retry With: 449
  ///
  /// The server cannot honour the request because the user has
  /// not provided the required information.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [2.2.6 449 Retry With Status Code](https://msdn.microsoft.com/en-us/library/dd891478.aspx)
  static const iisRetryWithHttp449 = StatusCode._(449);

  /// Blocked by Windows Parental Controls: 450
  ///
  /// A Microsoft extension. This error is given when Windows Parental
  /// Controls are turned on and are blocking access to the given webpage.
  static const blockedByWindowsParentalControlsHttp450 = StatusCode._(450);

  /// Unavailable For Legal Reasons: 451
  ///
  /// Reference: [RFC7725](http://www.iana.org/go/rfc7725)
  static const unavailableForLegalReasonsHttp451 = StatusCode._(451);

  /// nginx SSL Certificate Error: 495
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has provided an invalid client certificate.
  ///
  /// **Category**: nginx
  static const nginxSSLCertificateErrorHttp495 = StatusCode._(495);

  /// nginx SSL Certificate Required: 496
  ///
  /// An expansion of the 400 Bad Request response code, used when a client
  /// certificate is required but not provided.
  ///
  /// **Category**: nginx
  static const nginxSSLCertificateRequiredHttp496 = StatusCode._(496);

  /// nginx HTTP To HTTPS: 497
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has made a HTTP request to a port listening for HTTPS requests.
  ///
  /// **Category**: nginx
  static const nginxHTTPToHTTPSHttp497 = StatusCode._(497);

  /// Token Expired: 498
  ///
  /// Returned by [ArcGIS for Server](https://en.wikipedia.org/wiki/ArcGIS_Server). A code of 498 indicates an expired or otherwise invalid token.
  ///
  /// Reference: [Using token-based authentication](https://doc.arcgis.com/en/survey123/desktop/create-surveys/troubleshootcreatesurveys.htm)
  static const tokenExpiredHttp498 = StatusCode._(498);

  /// nginx Client Closed Request: 499
  ///
  /// Used when the client has closed the request before the server
  /// could send a response.
  ///
  /// **Category**: nginx
  static const nginxClientClosedRequestHttp499 = StatusCode._(499);

  // --- Server side errors 5xx. ---

  /// Internal Server Error: 500
  ///
  /// Reference: [RFC7231, Section 6.6.1](http://www.iana.org/go/rfc7231#section-6.6.1)
  static const internalServerErrorHttp500 = StatusCode._(500);

  /// Not Implemented: 501
  ///
  /// Reference: [RFC7231, Section 6.6.2](http://www.iana.org/go/rfc7231#section-6.6.2)
  static const notImplementedHttp501 = StatusCode._(501);

  /// Bad Gateway: 502
  ///
  /// Reference: [RFC7231, Section 6.6.3](http://www.iana.org/go/rfc7231#section-6.6.3)
  static const badGatewayHttp502 = StatusCode._(502);

  /// Service Unavailable: 503
  ///
  /// Reference: [RFC7231, Section 6.6.4](http://www.iana.org/go/rfc7231#section-6.6.4)
  static const serviceUnavailableHttp503 = StatusCode._(503);

  /// Gateway Timeout: 504
  ///
  /// Reference: [RFC7231, Section 6.6.5](http://www.iana.org/go/rfc7231#section-6.6.5)
  static const gatewayTimeoutHttp504 = StatusCode._(504);

  /// HTTP Version Not Supported: 505
  ///
  /// Reference: [RFC7231, Section 6.6.6](http://www.iana.org/go/rfc7231#section-6.6.6)
  static const httpVersionNotSupportedHttp505 = StatusCode._(505);

  /// Variant Also Negotiates: 506
  ///
  /// Reference: [RFC2295](http://www.iana.org/go/rfc2295)
  static const variantAlsoNegotiatesHttp506 = StatusCode._(506);

  /// Insufficient Storage: 507
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  static const insufficientStorageHttp507 = StatusCode._(507);

  /// Loop Detected: 508
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  static const loopDetectedHttp508 = StatusCode._(508);

  /// Bandwidth Limit Exceeded: 509
  ///
  /// The server has exceeded the bandwidth specified by the server
  /// administrator; this is often used by shared hosting providers
  /// to limit the bandwidth of customers.
  ///
  /// Reference: <https://documentation.cpanel.net/display/CKB/HTTP+Error+Codes+and+Quick+Fixes#HTTPErrorCodesandQuickFixes-509BandwidthLimitExceeded>
  static const bandwidthLimitExceededHttp509 = StatusCode._(509);

  /// Not Extended: 510
  ///
  /// Reference: [RFC2774](http://www.iana.org/go/rfc2774)
  static const notExtendedHttp510 = StatusCode._(510);

  /// Not Extended: 510
  ///
  /// Reference: [RFC2774](http://www.iana.org/go/rfc2774)
  @Deprecated('Use notExtendedHttp510 instead.')
  // ignore: avoid-explicit-type-declaration, not obvious in this case.
  static const StatusCode otExtendedHttp510 = notExtendedHttp510;

  /// Network Authentication Required: 511
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  static const networkAuthenticationRequiredHttp511 = StatusCode._(511);

  /// Site is frozen: 530
  ///
  /// Used by the [Pantheon](https://en.wikipedia.org/wiki/Pantheon_(software))
  /// web platform to indicate a site that has been frozen due to inactivity.
  static const siteIsFrozenHttp530 = StatusCode._(530);

  // --- Unofficial HTTP status codes ---
  // https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes

  /// Unofficial status code. This is fine (Apache HTTP Server): 218
  ///
  /// Used by Apache servers. A catch-all error condition allowing the passage
  /// of message bodies through the server when the ProxyErrorOverride setting
  /// is enabled. It is displayed in this situation instead of a 4xx or 5xx
  /// error message.
  static const thisIsFineHttp218 = StatusCode._(218);

  /// Unofficial status code. Page Expired (Laravel Framework): 419
  ///
  /// Used by the Laravel Framework when a CSRF Token is missing or expired.
  static const pageExpiredHttp419 = StatusCode._(419);

  /// Unofficial status code. Enhance Your Calm (Twitter): 420
  /// Deprecated: Method Failure (Spring Framework): 420
  ///
  /// Returned by version 1 of the Twitter Search and Trends API when the client
  /// is being rate limited; versions 1.1 and later use the 429 Too Many
  /// Requests response code instead. The phrase "Enhance your calm" comes from
  /// the 1993 movie Demolition Man, and its association with this number is
  /// likely a reference to cannabis.
  ///
  /// Also a deprecated response status code used by the Spring Framework when
  /// a method has failed.
  static const enhanceYourCalmHttp420 = StatusCode._(420);

  /// Unofficial status code. Request Header Fields Too Large (Shopify): 430
  ///
  /// Used by Shopify, instead of the 429 Too Many Requests response code, when
  /// too many URLs are requested within a certain time frame.
  static const requestHeaderFieldsTooLargeHttp430 = StatusCode._(430);

  /// Unofficial status code. Site is overloaded: 529
  ///
  /// Used by Qualys in the SSLLabs server testing API to signal that the site
  /// can't process the request.
  static const siteIsOverloadedHttp529 = StatusCode._(529);

  /// Unofficial status code. Network Connect Timeout Error: 598
  ///
  /// Used by some HTTP proxies to signal a network read timeout behind the
  /// proxy to a client in front of the proxy.
  static const networkReadTimeoutErrorHttp598 = StatusCode._(598);

  /// Unofficial status code. Request Header Too Large: 494
  ///
  /// The client sent too large of a request or too long of a header line.
  static const requestHeaderTooLargeHttp494 = StatusCode._(494);

  /// Unofficial status code. Web Server Returned an Unknown Error: 520
  ///
  /// The origin server returned an empty, unknown, or unexpected response to
  /// Cloudflare.
  static const webServerReturnedUnknownErrorHttp520 = StatusCode._(520);

  /// Unofficial status code. Web Server Is Down: 521
  ///
  /// The origin server refused connections from Cloudflare. Security solutions
  /// at the origin may be blocking legitimate connections from certain
  /// Cloudflare IP addresses.
  static const webServerIsDownHttp521 = StatusCode._(521);

  /// Unofficial status code. Connection Timed Out: 522
  ///
  /// Cloudflare timed out contacting the origin server.
  static const connectionTimedOutHttp522 = StatusCode._(522);

  /// Unofficial status code. Origin Is Unreachable: 523
  ///
  /// Cloudflare could not reach the origin server; for example, if the DNS
  /// records for the origin server are incorrect or missing.
  static const originIsUnreachableHttp523 = StatusCode._(523);

  /// Unofficial status code. A Timeout Occurred: 524
  ///
  /// Cloudflare was able to complete a TCP connection to the origin server, but
  /// did not receive a timely HTTP response.
  static const timeoutOccurredHttp524 = StatusCode._(524);

  /// Unofficial status code. SSL Handshake Failed: 525
  ///
  /// Cloudflare could not negotiate a SSL/TLS handshake with the origin server.
  static const sslHandshakeFailedHttp525 = StatusCode._(525);

  /// Unofficial status code. Invalid SSL Certificate: 526
  ///
  /// Cloudflare could not validate the SSL certificate on the origin web
  /// server.
  static const invalidSSLCertificateHttp526 = StatusCode._(526);

  /// Unofficial status code. Railgun Error: 527
  ///
  /// Error 527 indicates an interrupted connection between Cloudflare and the
  /// origin server's Railgun server.
  static const railgunErrorHttp527 = StatusCode._(527);

  /// Unofficial status code. Client Closed Connection: 460
  ///
  /// The client closed the connection with the load balancer before the idle
  /// timeout period elapsed. Typically occurs when the client timeout is sooner
  /// than the Elastic Load Balancer's timeout.
  static const clientClosedConnectionHttp460 = StatusCode._(460);

  /// Unofficial status code. Too Many IP Addresses: 463
  ///
  /// The load balancer received an X-Forwarded-For request header with more
  /// than 30 IP addresses.
  static const tooManyIpAddressesHttp463 = StatusCode._(463);

  /// Unofficial status code. Incompatible Protocol Versions: 464
  ///
  /// There are incompatible protocol versions between the client and the origin
  /// server.
  static const incompatibleProtocolVersionsHttp464 = StatusCode._(464);

  /// Unofficial status code. Unauthorized: 561
  ///
  /// An error around authentication returned by a server registered with a load
  /// balancer. You configured a listener rule to

  /// Unauthorized (AWS Elastic Load Balancing): 561
  ///
  /// Used by AWS Elastic Load Balancing when authentication has failed or
  /// credentials are missing.
  static const unauthorizedHttp561 = StatusCode._(561);

  /// Unofficial status code. Network Connect Timeout Error: 599
  ///
  /// This status code is not specified in any RFCs, but is used by some HTTP
  /// proxies to signal a network connect timeout behind the proxy to a client
  /// in front of the proxy.
  static const networkConnectTimeoutErrorHttp599 = StatusCode._(599);

  /// A regular expression pattern that matches three consecutive digits.
  ///
  /// This pattern is commonly used to identify HTTP status codes within a
  /// string. HTTP status codes are typically 3-digit integers ranging from 100
  /// to 599. The pattern is defined by the regular expression `\d{3}`, where
  /// `\d` stands for any digit, and `{3}` specifies exactly three occurrences
  /// of the digit.
  ///
  /// Examples of matching strings:
  /// - '200' for OK
  /// - '404' for Not Found
  /// - '500' for Internal Server Error
  ///
  /// Note that this pattern does not validate the range of the status code and
  /// will match any three-digit number. Additional checks should be implemented
  /// if validation of the status code's range is required.
  ///
  /// See also:
  /// - [RegExp], the class used to work with regular expressions in Dart.
  /// - [StatusCode], which contains standard HTTP status codes.
  static const pattern = r'\d{3}';

  /// A getter that returns a [RegExp] object configured with a pattern to match
  /// three consecutive digits, typically representing an HTTP status code.
  ///
  /// The matching is unanchored, meaning that this regular expression can find
  /// matches anywhere in the input string. This allows for the extraction of
  /// status codes from within larger bodies of text.
  ///
  /// The [pattern] is defined by the regular expression `\d{3}`, which matches
  /// any sequence of exactly three digits.
  ///
  /// Example usage:
  /// ```dart
  /// // Assuming `inputString` contains an HTTP status code.
  /// String? statusCode = regExp.firstMatch(inputString)?.group(0);
  /// // `statusCode` will contain the first sequence of three digits found in `inputString`.
  /// ```
  ///
  /// Note: While the regular expression matches any three-digit number, it does
  /// not ascertain that the number is a valid HTTP status code. For such
  /// validation, the matched number should be further checked against known
  /// HTTP status code ranges via the tools that this package provides.
  ///
  /// See also:
  /// - [pattern], the raw regular expression string this getter utilizes.
  /// - [StatusCode], which contains standard HTTP status codes.
  static RegExp get regExp => RegExp(pattern, caseSensitive: false);

  /// Returns the [StatusCode] type value for the given status code, if it
  /// exists. Otherwise, returns `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// var status = StatusCode.maybeFromCode(200);
  /// print(status); // Output: StatusCode(200, reason: "OK")
  /// status = StatusCode.maybeFromCode(600);
  /// print(status); // Output: null
  /// ```
  static StatusCode? maybeFromCode(num? statusCode) {
    if (statusCode == null) return null;

    final intStatusCode = statusCode.toInt();
    for (final status in values) {
      if (status == intStatusCode) return StatusCode._(status);
    }

    return null;
  }

  /// Tries to parse the given [String?] and return the corresponding
  /// [StatusCode] type value, if it exists. Otherwise, returns `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// var status = StatusCode.tryParse("HTTP/1.1 200 OK");
  /// print(status); // Output: `200`
  /// status = StatusCode.tryParse("HTTP/1.1 OK");
  /// print(status); // Output: `null`
  /// ```
  static StatusCode? tryParse(Object? statusCode) {
    if (statusCode == null) return null;
    final maybeCode = regExp.firstMatch(statusCode.toString())?[0];

    return maybeCode == null ? null : maybeFromCode(num.tryParse(maybeCode));
  }

  /// A complete list of all standard HTTP status codes defined in this package.
  ///
  /// This includes both official IANA registered codes and commonly used
  /// unofficial codes. The list contains 95 status codes covering informational
  /// (`1xx`), success (`2xx`), redirection (`3xx`), client error (`4xx`),
  /// and server error (`5xx`) categories.
  ///
  /// Use this list when you need to iterate over all known status codes or
  /// check if a code is recognized by the package.
  ///
  /// Example:
  /// ```dart
  /// print('Total status codes: ${StatusCode.values.length}');
  /// for (final code in StatusCode.values) {
  ///   print('${code}: ${code.reason}');
  /// }
  /// ```
  ///
  /// See also:
  /// - [officialCodes], which contains only IANA registered codes.
  static const values = <StatusCode>[
    ...informationalCodes,
    ...successCodes,
    ...redirectionCodes,
    ...clientErrorCodes,
    ...serverErrorCodes,
  ];

  /// A list of official IANA registered HTTP status codes.
  ///
  /// This list contains only status codes that are officially registered with
  /// the Internet Assigned Numbers Authority (IANA) and documented in RFCs. It
  /// excludes unofficial codes used by specific vendors or frameworks (like
  /// nginx, Cloudflare, AWS, or Laravel).
  ///
  /// Use this list when you need to distinguish between standard and
  /// vendor-specific status codes, or when implementing strict HTTP compliance.
  ///
  /// Example:
  /// ```dart
  /// final code = StatusCode.okHttp200;
  /// if (StatusCode.officialCodes.contains(code)) {
  ///   print('This is an official IANA registered code');
  /// }
  /// print('Official codes count: ${StatusCode.officialCodes.length}');
  /// ```
  ///
  /// See also:
  /// - [values], which includes both official and unofficial codes.
  static const officialCodes = <StatusCode>[
    // networkConnectTimeoutErrorHttp599, not official.
    siteIsFrozenHttp530,
    networkAuthenticationRequiredHttp511,
    notExtendedHttp510,
    bandwidthLimitExceededHttp509,
    loopDetectedHttp508,
    insufficientStorageHttp507,
    variantAlsoNegotiatesHttp506,
    httpVersionNotSupportedHttp505,
    gatewayTimeoutHttp504,
    serviceUnavailableHttp503,
    badGatewayHttp502,
    notImplementedHttp501,
    internalServerErrorHttp500,
    nginxClientClosedRequestHttp499,
    tokenExpiredHttp498,
    nginxHTTPToHTTPSHttp497,
    nginxSSLCertificateRequiredHttp496,
    nginxSSLCertificateErrorHttp495,
    unavailableForLegalReasonsHttp451,
    blockedByWindowsParentalControlsHttp450,
    iisRetryWithHttp449,
    nginxNoResponseHttp444,
    iisLoginTimeoutHttp440,
    requestHeaderFieldsTooLargeHttp431,
    tooManyRequestsHttp429,
    preconditionRequiredHttp428,
    upgradeRequiredHttp426,
    tooEarlyHttp425,
    failedDependencyHttp424,
    lockedHttp423,
    unprocessableEntityHttp422,
    misdirectedRequestHttp421,
    imATeapotHttp418,
    expectationFailedHttp417,
    rangeNotSatisfiableHttp416,
    unsupportedMediaTypeHttp415,
    uriTooLongHttp414,
    payloadTooLargeHttp413,
    preconditionFailedHttp412,
    lengthRequiredHttp411,
    goneHttp410,
    conflictHttp409,
    requestTimeoutHttp408,
    proxyAuthenticationRequiredHttp407,
    notAcceptableHttp406,
    methodNotAllowedHttp405,
    notFoundHttp404,
    forbiddenHttp403,
    paymentRequiredHttp402,
    unauthorizedHttp401,
    badRequestHttp400,
    permanentRedirectHttp308,
    temporaryRedirectHttp307,
    useProxyHttp305,
    notModifiedHttp304,
    seeOtherHttp303,
    foundHttp302,
    movedPermanentlyHttp301,
    multipleChoicesHttp300,
    imUsedHttp226,
    alreadyReportedHttp208,
    multiStatusHttp207,
    partialContentHttp206,
    resetContentHttp205,
    noContentHttp204,
    nonAuthoritativeInformationHttp203,
    acceptedHttp202,
    createdHttp201,
    okHttp200,
    earlyHintsHttp103,
    processingHttp102,
    switchingProtocolsHttp101,
    continueHttp100,
  ];

  /// A map of status codes to their corresponding human-readable reason phrases
  ///
  /// Each status code is mapped to its standard reason phrase as defined by
  /// IANA or commonly used by the vendor/framework that introduced it. These
  /// phrases provide a brief description of what the status code represents.
  ///
  /// The reason phrases follow HTTP specification conventions, such as:
  /// - "OK" for 200
  /// - "Not Found" for 404
  /// - "Internal Server Error" for 500
  ///
  /// Example:
  /// ```dart
  /// final reason = StatusCode.reasons[StatusCode.okHttp200];
  /// print(reason); // Output: OK
  ///
  /// // Access via extension property
  /// print(StatusCode.notFoundHttp404.reason); // Output: Not Found
  /// ```
  static const reasons = <StatusCode, String>{
    continueHttp100: 'Continue',
    switchingProtocolsHttp101: 'Switching Protocols',
    processingHttp102: 'Processing',
    earlyHintsHttp103: 'Early Hints',
    okHttp200: 'OK',
    createdHttp201: 'Created',
    acceptedHttp202: 'Accepted',
    nonAuthoritativeInformationHttp203: 'Non-Authoritative Information',
    noContentHttp204: 'No Content',
    resetContentHttp205: 'Reset Content',
    partialContentHttp206: 'Partial Content',
    multiStatusHttp207: 'Multi-Status',
    alreadyReportedHttp208: 'Already Reported',
    imUsedHttp226: 'IM Used',
    multipleChoicesHttp300: 'Multiple Choices',
    movedPermanentlyHttp301: 'Moved Permanently',
    foundHttp302: 'Found',
    seeOtherHttp303: 'See Other',
    notModifiedHttp304: 'Not Modified',
    useProxyHttp305: 'Use Proxy',
    temporaryRedirectHttp307: 'Temporary Redirect',
    permanentRedirectHttp308: 'Permanent Redirect',
    badRequestHttp400: 'Bad Request',
    unauthorizedHttp401: 'Unauthorized',
    paymentRequiredHttp402: 'Payment Required',
    forbiddenHttp403: 'Forbidden',
    notFoundHttp404: 'Not Found',
    methodNotAllowedHttp405: 'Method Not Allowed',
    notAcceptableHttp406: 'Not Acceptable',
    proxyAuthenticationRequiredHttp407: 'Proxy Authentication Required',
    requestTimeoutHttp408: 'Request Timeout',
    conflictHttp409: 'Conflict',
    goneHttp410: 'Gone',
    lengthRequiredHttp411: 'Length Required',
    preconditionFailedHttp412: 'Precondition Failed',
    payloadTooLargeHttp413: 'Payload Too Large',
    uriTooLongHttp414: 'URI Too Long',
    unsupportedMediaTypeHttp415: 'Unsupported Media Type',
    rangeNotSatisfiableHttp416: 'Range Not Satisfiable',
    expectationFailedHttp417: 'Expectation Failed',
    imATeapotHttp418: "I'm A Teapot",
    misdirectedRequestHttp421: 'Misdirected Request',
    unprocessableEntityHttp422: 'Unprocessable Entity',
    lockedHttp423: 'Locked',
    failedDependencyHttp424: 'Failed Dependency',
    tooEarlyHttp425: 'Too Early',
    upgradeRequiredHttp426: 'Upgrade Required',
    preconditionRequiredHttp428: 'Precondition Required',
    tooManyRequestsHttp429: 'Too Many Requests',
    requestHeaderFieldsTooLargeHttp431: 'Request Header Fields Too Large',
    iisLoginTimeoutHttp440: 'IIS Login Timeout',
    nginxNoResponseHttp444: 'No Response',
    iisRetryWithHttp449: 'IIS Retry With',
    blockedByWindowsParentalControlsHttp450:
        'Blocked by Windows Parental Controls',
    unavailableForLegalReasonsHttp451: 'Unavailable For Legal Reasons',
    nginxSSLCertificateErrorHttp495: 'SSL Certificate Error',
    nginxSSLCertificateRequiredHttp496: 'SSL Certificate Required',
    nginxHTTPToHTTPSHttp497: 'HTTP To HTTPS',
    tokenExpiredHttp498: 'Token Expired',
    nginxClientClosedRequestHttp499: 'Client Closed Request',
    internalServerErrorHttp500: 'Internal Server Error',
    notImplementedHttp501: 'Not Implemented',
    badGatewayHttp502: 'Bad Gateway',
    serviceUnavailableHttp503: 'Service Unavailable',
    gatewayTimeoutHttp504: 'Gateway Timeout',
    httpVersionNotSupportedHttp505: 'HTTP Version Not Supported',
    variantAlsoNegotiatesHttp506: 'Variant Also Negotiates',
    insufficientStorageHttp507: 'Insufficient Storage',
    loopDetectedHttp508: 'Loop Detected',
    bandwidthLimitExceededHttp509: 'Bandwidth Limit Exceeded',
    notExtendedHttp510: 'Not Extended',
    networkAuthenticationRequiredHttp511: 'Network Authentication Required',
    siteIsFrozenHttp530: 'Site is frozen',
    thisIsFineHttp218: 'This is fine (Apache HTTP Server)',
    pageExpiredHttp419: 'Page Expired (Laravel Framework)',
    enhanceYourCalmHttp420: 'Enhance Your Calm (Twitter)',
    requestHeaderFieldsTooLargeHttp430:
        'Request Header Fields Too Large (Shopify)',
    siteIsOverloadedHttp529: 'Site is overloaded',
    networkReadTimeoutErrorHttp598:
        'Network read timeout error (Informal convention)',
    requestHeaderTooLargeHttp494: 'Request Header Too Large',
    webServerReturnedUnknownErrorHttp520:
        'Web Server Returned an Unknown Error',
    webServerIsDownHttp521: 'Web Server Is Down',
    connectionTimedOutHttp522: 'Connection Timed Out',
    originIsUnreachableHttp523: 'Origin Is Unreachable',
    timeoutOccurredHttp524: 'A Timeout Occurred',
    sslHandshakeFailedHttp525: 'SSL Handshake Failed',
    invalidSSLCertificateHttp526: 'Invalid SSL Certificate',
    railgunErrorHttp527: 'Railgun Error',
    clientClosedConnectionHttp460: 'Client Closed Connection',
    tooManyIpAddressesHttp463: 'Too Many IP Addresses',
    incompatibleProtocolVersionsHttp464: 'Incompatible Protocol Versions',
    unauthorizedHttp561: 'Unauthorized (AWS Elastic Load Balancing)',
    networkConnectTimeoutErrorHttp599: 'Network Connect Timeout Error',
  };

  /// Pre-sorted set of registered informational status codes (1xx).
  ///
  /// Contains only officially registered status codes in the informational
  /// range. Used internally for specific matching scenarios.
  static const informationalCodes = <StatusCode>[
    continueHttp100,
    switchingProtocolsHttp101,
    processingHttp102,
    earlyHintsHttp103,
  ];

  /// Pre-sorted set of registered success status codes (2xx).
  ///
  /// Contains only officially registered status codes in the success range.
  /// Used internally for specific matching scenarios.
  static const successCodes = <StatusCode>[
    okHttp200,
    createdHttp201,
    acceptedHttp202,
    nonAuthoritativeInformationHttp203,
    noContentHttp204,
    resetContentHttp205,
    partialContentHttp206,
    multiStatusHttp207,
    alreadyReportedHttp208,
    thisIsFineHttp218,
    imUsedHttp226,
  ];

  /// Pre-sorted set of registered redirection status codes (3xx).
  ///
  /// Contains only officially registered status codes in the redirection
  /// range. Used internally for specific matching scenarios.
  static const redirectionCodes = <StatusCode>[
    multipleChoicesHttp300,
    movedPermanentlyHttp301,
    foundHttp302,
    seeOtherHttp303,
    notModifiedHttp304,
    useProxyHttp305,
    temporaryRedirectHttp307,
    permanentRedirectHttp308,
  ];

  /// Pre-sorted set of registered client error status codes (4xx).
  ///
  /// Contains only officially registered status codes in the client error
  /// range. Used internally for specific matching scenarios.
  static const clientErrorCodes = <StatusCode>[
    badRequestHttp400,
    unauthorizedHttp401,
    paymentRequiredHttp402,
    forbiddenHttp403,
    notFoundHttp404,
    methodNotAllowedHttp405,
    notAcceptableHttp406,
    proxyAuthenticationRequiredHttp407,
    requestTimeoutHttp408,
    conflictHttp409,
    goneHttp410,
    lengthRequiredHttp411,
    preconditionFailedHttp412,
    payloadTooLargeHttp413,
    uriTooLongHttp414,
    unsupportedMediaTypeHttp415,
    rangeNotSatisfiableHttp416,
    expectationFailedHttp417,
    imATeapotHttp418,
    pageExpiredHttp419,
    enhanceYourCalmHttp420,
    misdirectedRequestHttp421,
    unprocessableEntityHttp422,
    lockedHttp423,
    failedDependencyHttp424,
    tooEarlyHttp425,
    upgradeRequiredHttp426,
    preconditionRequiredHttp428,
    tooManyRequestsHttp429,
    requestHeaderFieldsTooLargeHttp430,
    requestHeaderFieldsTooLargeHttp431,
    iisLoginTimeoutHttp440,
    nginxNoResponseHttp444,
    iisRetryWithHttp449,
    blockedByWindowsParentalControlsHttp450,
    unavailableForLegalReasonsHttp451,
    clientClosedConnectionHttp460,
    tooManyIpAddressesHttp463,
    incompatibleProtocolVersionsHttp464,
    requestHeaderTooLargeHttp494,
    nginxSSLCertificateErrorHttp495,
    nginxSSLCertificateRequiredHttp496,
    nginxHTTPToHTTPSHttp497,
    tokenExpiredHttp498,
    nginxClientClosedRequestHttp499,
  ];

  /// Pre-sorted set of registered server error status codes (5xx).
  ///
  /// Contains only officially registered status codes in the server error
  /// range. Used internally for specific matching scenarios.
  static const serverErrorCodes = <StatusCode>[
    internalServerErrorHttp500,
    notImplementedHttp501,
    badGatewayHttp502,
    serviceUnavailableHttp503,
    gatewayTimeoutHttp504,
    httpVersionNotSupportedHttp505,
    variantAlsoNegotiatesHttp506,
    insufficientStorageHttp507,
    loopDetectedHttp508,
    bandwidthLimitExceededHttp509,
    notExtendedHttp510,
    networkAuthenticationRequiredHttp511,
    webServerReturnedUnknownErrorHttp520,
    webServerIsDownHttp521,
    connectionTimedOutHttp522,
    originIsUnreachableHttp523,
    timeoutOccurredHttp524,
    sslHandshakeFailedHttp525,
    invalidSSLCertificateHttp526,
    railgunErrorHttp527,
    siteIsOverloadedHttp529,
    siteIsFrozenHttp530,
    unauthorizedHttp561,
    networkReadTimeoutErrorHttp598,
    networkConnectTimeoutErrorHttp599,
  ];

  /// Set of status codes that are cacheable by default according to RFC 7231.
  ///
  /// These status codes can be stored by caches and reused for subsequent
  /// requests without explicit freshness information, unless otherwise
  /// indicated by cache-control headers.
  ///
  /// Includes:
  /// - 200 (OK)
  /// - 203 (Non-Authoritative Information)
  /// - 204 (No Content)
  /// - 206 (Partial Content)
  /// - 300 (Multiple Choices)
  /// - 301 (Moved Permanently)
  /// - 404 (Not Found)
  /// - 405 (Method Not Allowed)
  /// - 410 (Gone)
  /// - 414 (URI Too Long)
  /// - 501 (Not Implemented)
  ///
  /// Reference: https://www.rfc-editor.org/rfc/rfc7231#section-6.1.
  static const cacheableCodes = <StatusCode>{
    okHttp200,
    nonAuthoritativeInformationHttp203,
    noContentHttp204,
    partialContentHttp206,
    multipleChoicesHttp300,
    movedPermanentlyHttp301,
    notFoundHttp404,
    methodNotAllowedHttp405,
    goneHttp410,
    uriTooLongHttp414,
    notImplementedHttp501,
  };

  /// Set of status codes that typically indicate transient errors.
  ///
  /// These status codes often represent temporary conditions that may succeed
  /// if the request is retried, such as timeouts, rate limiting, or temporary
  /// server unavailability. Retry logic should implement exponential backoff
  /// and respect Retry-After headers when present.
  ///
  /// Includes:
  /// - 408 (Request Timeout)
  /// - 425 (Too Early)
  /// - 429 (Too Many Requests)
  /// - 500 (Internal Server Error)
  /// - 502 (Bad Gateway)
  /// - 503 (Service Unavailable)
  /// - 504 (Gateway Timeout)
  /// - 511 (Network Authentication Required)
  /// - 598 (Network Read Timeout Error)
  /// - 599 (Network Connect Timeout Error).
  static const retryableCodes = <StatusCode>{
    requestTimeoutHttp408,
    tooEarlyHttp425,
    tooManyRequestsHttp429,
    internalServerErrorHttp500,
    badGatewayHttp502,
    serviceUnavailableHttp503,
    gatewayTimeoutHttp504,
    networkAuthenticationRequiredHttp511,
    networkReadTimeoutErrorHttp598,
    networkConnectTimeoutErrorHttp599,
  };
}
