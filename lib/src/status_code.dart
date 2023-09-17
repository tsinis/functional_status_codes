// Copyright (c) 2023, Roman Cinis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: format-comment, because of trailing dot at the end of URLs.

part 'status_code.g.dart';

/// Dart `enum` for easier handling of all IANA registered HTTP Status codes.
enum StatusCode {
  // --- Informational 1xx. ---

  /// Continue: 100
  ///
  /// Reference: [RFC7231, Section 6.2.1](http://www.iana.org/go/rfc7231#section-6.2.1)
  continueHttp100(100, 'Continue'),

  /// Switching Protocols: 101
  ///
  /// Reference: [RFC7231, Section 6.2.2](http://www.iana.org/go/rfc7231#section-6.2.2)
  switchingProtocolsHttp101(101, 'Switching Protocols'),

  /// Processing: 102
  ///
  /// Reference: [RFC2518](http://www.iana.org/go/rfc2518)
  processingHttp102(102, 'Processing'),

  /// Early Hints: 103
  ///
  /// Reference: [RFC8297](http://www.iana.org/go/rfc8297)
  earlyHintsHttp103(103, 'Early Hints'),

  // --- Success 2xx ---

  /// OK: 200
  ///
  /// Reference: [RFC7231, Section 6.3.1](http://www.iana.org/go/rfc7231#section-6.3.1)
  okHttp200(200, 'OK'),

  /// Created: 201
  ///
  /// Reference: [RFC7231, Section 6.3.2](http://www.iana.org/go/rfc7231#section-6.3.2)
  createdHttp201(201, 'Created'),

  /// Accepted: 202
  ///
  /// Reference: [RFC7231, Section 6.3.3](http://www.iana.org/go/rfc7231#section-6.3.3)
  acceptedHttp202(202, 'Accepted'),

  /// Non-Authoritative Information: 203
  ///
  /// Reference: [RFC7231, Section 6.3.4](http://www.iana.org/go/rfc7231#section-6.3.4)
  nonAuthoritativeInformationHttp203(203, 'Non-Authoritative Information'),

  /// No Content: 204
  ///
  /// Reference: [RFC7231, Section 6.3.5](http://www.iana.org/go/rfc7231#section-6.3.5)
  noContentHttp204(204, 'No Content'),

  /// Reset Content: 205
  ///
  /// Reference: [RFC7231, Section 6.3.6](http://www.iana.org/go/rfc7231#section-6.3.6)
  resetContentHttp205(205, 'Reset Content'),

  /// Partial Content: 206
  ///
  /// Reference: [RFC7233, Section 4.1](http://www.iana.org/go/rfc7233#section-4.1)
  partialContentHttp206(206, 'Partial Content'),

  /// Multi-Status: 207
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  multiStatusHttp207(207, 'Multi-Status'),

  /// Already Reported: 208
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  alreadyReportedHttp208(208, 'Already Reported'),

  /// IM Used: 226
  ///
  /// Reference: [RFC3229](http://www.iana.org/go/rfc3229)
  imUsedHttp226(226, 'IM Used'),

  // --- Redirection 3xx. ---

  /// Multiple Choices: 300
  ///
  /// Reference: [RFC7231, Section 6.4.1](http://www.iana.org/go/rfc7231#section-6.4.1)
  multipleChoicesHttp300(300, 'Multiple Choices'),

  /// Moved Permanently: 301
  ///
  /// Reference: [RFC7231, Section 6.4.2](http://www.iana.org/go/rfc7231#section-6.4.2)
  movedPermanentlyHttp301(301, 'Moved Permanently'),

  /// Found: 302
  ///
  /// Reference: [RFC7231, Section 6.4.3](http://www.iana.org/go/rfc7231#section-6.4.3)
  foundHttp302(302, 'Found'),

  /// See Other: 303
  ///
  /// Reference: [RFC7231, Section 6.4.4](http://www.iana.org/go/rfc7231#section-6.4.4)
  seeOtherHttp303(303, 'See Other'),

  /// Not Modified: 304
  ///
  /// Reference: [RFC7232, Section 4.1](http://www.iana.org/go/rfc7232#section-4.1)
  notModifiedHttp304(304, 'Not Modified'),

  /// Use Proxy: 305
  ///
  /// Reference: [RFC7231, Section 6.4.5](http://www.iana.org/go/rfc7231#section-6.4.5)
  useProxyHttp305(305, 'Use Proxy'),

  /// Temporary Redirect: 307
  ///
  /// Reference: [RFC7231, Section 6.4.7](http://www.iana.org/go/rfc7231#section-6.4.7)
  temporaryRedirectHttp307(307, 'Temporary Redirect'),

  /// Permanent Redirect: 308
  ///
  /// Reference: [RFC7538](http://www.iana.org/go/rfc7538)
  permanentRedirectHttp308(308, 'Permanent Redirect'),

  // --- Client side errors 4xx. ---

  /// Bad Request: 400
  ///
  /// Reference: [RFC7231, Section 6.5.1](http://www.iana.org/go/rfc7231#section-6.5.1)
  badRequestHttp400(400, 'Bad Request'),

  /// Unauthorized: 401
  ///
  /// Reference: [RFC7235, Section 3.1](http://www.iana.org/go/rfc7235#section-3.1)
  unauthorizedHttp401(401, 'Unauthorized'),

  /// Payment Required: 402
  ///
  /// Reference: [RFC7231, Section 6.5.2](http://www.iana.org/go/rfc7231#section-6.5.2)
  paymentRequiredHttp402(402, 'Payment Required'),

  /// Forbidden: 403
  ///
  /// Reference: [RFC7231, Section 6.5.3](http://www.iana.org/go/rfc7231#section-6.5.3)
  forbiddenHttp403(403, 'Forbidden'),

  /// Not Found: 404
  ///
  /// Reference: [RFC7231, Section 6.5.4](http://www.iana.org/go/rfc7231#section-6.5.4)
  notFoundHttp404(404, 'Not Found'),

  /// Method Not Allowed: 405
  ///
  /// Reference: [RFC7231, Section 6.5.5](http://www.iana.org/go/rfc7231#section-6.5.5)
  methodNotAllowedHttp405(405, 'Method Not Allowed'),

  /// Not Acceptable: 406
  ///
  /// Reference: [RFC7231, Section 6.5.6](http://www.iana.org/go/rfc7231#section-6.5.6)
  notAcceptableHttp406(406, 'Not Acceptable'),

  /// Proxy Authentication Required: 407
  ///
  /// Reference: [RFC7235, Section 3.2](http://www.iana.org/go/rfc7235#section-3.2)
  proxyAuthenticationRequiredHttp407(407, 'Proxy Authentication Required'),

  /// Request Timeout: 408
  ///
  /// Reference: [RFC7231, Section 6.5.7](http://www.iana.org/go/rfc7231#section-6.5.7)
  requestTimeoutHttp408(408, 'Request Timeout'),

  /// Conflict: 409
  ///
  /// Reference: [RFC7231, Section 6.5.8](http://www.iana.org/go/rfc7231#section-6.5.8)
  conflictHttp409(409, 'Conflict'),

  /// Gone: 410
  ///
  /// Reference: [RFC7231, Section 6.5.9](http://www.iana.org/go/rfc7231#section-6.5.9)
  goneHttp410(410, 'Gone'),

  /// Length Required: 411
  ///
  /// Reference: [RFC7231, Section 6.5.10](http://www.iana.org/go/rfc7231#section-6.5.10)
  lengthRequiredHttp411(411, 'Length Required'),

  /// Precondition Failed: 412
  ///
  /// Reference: [RFC7232, Section 4.2](http://www.iana.org/go/rfc7232#section-4.2)
  /// Reference: [RFC8144, Section 3.2](http://www.iana.org/go/rfc8144#section-3.2)
  preconditionFailedHttp412(412, 'Precondition Failed'),

  /// Payload Too Large: 413
  ///
  /// Reference: [RFC7231, Section 6.5.11](http://www.iana.org/go/rfc7231#section-6.5.11)
  payloadTooLargeHttp413(413, 'Payload Too Large'),

  /// URI Too Long: 414
  ///
  /// Reference: [RFC7231, Section 6.5.12](http://www.iana.org/go/rfc7231#section-6.5.12)
  uriTooLongHttp414(414, 'URI Too Long'),

  /// Unsupported Media Type: 415
  ///
  /// Reference: [RFC7231, Section 6.5.13](http://www.iana.org/go/rfc7231#section-6.5.13)
  /// Reference: [RFC7694, Section 3](http://www.iana.org/go/rfc7694#section-3)
  unsupportedMediaTypeHttp415(415, 'Unsupported Media Type'),

  /// Range Not Satisfiable: 416
  ///
  /// Reference: [RFC7233, Section 4.4](http://www.iana.org/go/rfc7233#section-4.4)
  rangeNotSatisfiableHttp416(416, 'Range Not Satisfiable'),

  /// Expectation Failed: 417
  ///
  /// Reference: [RFC7231, Section 6.5.14](http://www.iana.org/go/rfc7231#section-6.5.14)
  expectationFailedHttp417(417, 'Expectation Failed'),

  /// I'm A Teapot: 418
  ///
  /// Returned by tea pots requested to brew coffee
  ///
  /// Reference: [RFC 2324](http://www.iana.org/go/rfc2324)
  imATeapotHttp418(418, "I'm A Teapot"),

  /// Misdirected Request: 421
  ///
  /// Reference: [RFC7540, Section 9.1.2](http://www.iana.org/go/rfc7540#section-9.1.2)
  misdirectedRequestHttp421(421, 'Misdirected Request'),

  /// Unprocessable Entity: 422
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  unprocessableEntityHttp422(422, 'Unprocessable Entity'),

  /// Locked: 423
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  lockedHttp423(423, 'Locked'),

  /// Failed Dependency: 424
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  failedDependencyHttp424(424, 'Failed Dependency'),

  /// Too Early: 425
  ///
  /// Reference: [RFC8470](http://www.iana.org/go/rfc8470)
  tooEarlyHttp425(425, 'Too Early'),

  /// Upgrade Required: 426
  ///
  /// Reference: [RFC7231, Section 6.5.15](http://www.iana.org/go/rfc7231#section-6.5.15)
  upgradeRequiredHttp426(426, 'Upgrade Required'),

  /// Precondition Required: 428
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  preconditionRequiredHttp428(428, 'Precondition Required'),

  /// Too Many Requests: 429
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  tooManyRequestsHttp429(429, 'Too Many Requests'),

  /// Request Header Fields Too Large: 431
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  requestHeaderFieldsTooLargeHttp431(431, 'Request Header Fields Too Large'),

  /// IIS Login Timeout: 440
  ///
  /// The client's session has expired and must log in again.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [Error message when you try to log on to Exchange 2007 by using Outlook Web Access: "440 Login Timeout"](https://learn.microsoft.com/en-us/previous-versions/troubleshoot/dynamics/crm/incoming-status-failure-the-remote-server-returned-an-error-440-login-timeout)
  iisLoginTimeoutHttp440(440, 'IIS Login Timeout'),

  /// nginx No Response: 444
  ///
  /// Used to indicate that the server has returned no information to the
  /// client and closed the connection.
  ///
  /// **Category**: nginx
  nginxNoResponseHttp444(444, 'No Response'),

  /// IIS Retry With: 449
  ///
  /// The server cannot honour the request because the user has
  /// not provided the required information.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [2.2.6 449 Retry With Status Code](https://msdn.microsoft.com/en-us/library/dd891478.aspx)
  iisRetryWithHttp449(449, 'IIS Retry With'),

  /// Blocked by Windows Parental Controls: 450
  ///
  /// A Microsoft extension. This error is given when Windows Parental
  /// Controls are turned on and are blocking access to the given webpage.
  blockedByWindowsParentalControlsHttp450(
    450,
    'Blocked by Windows Parental Controls',
  ),

  /// Unavailable For Legal Reasons: 451
  ///
  /// Reference: [RFC7725](http://www.iana.org/go/rfc7725)
  unavailableForLegalReasonsHttp451(451, 'Unavailable For Legal Reasons'),

  /// nginx SSL Certificate Error: 495
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has provided an invalid client certificate.
  ///
  /// **Category**: nginx
  nginxSSLCertificateErrorHttp495(495, 'SSL Certificate Error'),

  /// nginx SSL Certificate Required: 496
  ///
  /// An expansion of the 400 Bad Request response code, used when a client
  /// certificate is required but not provided.
  ///
  /// **Category**: nginx
  nginxSSLCertificateRequiredHttp496(496, 'SSL Certificate Required'),

  /// nginx HTTP To HTTPS: 497
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has made a HTTP request to a port listening for HTTPS requests.
  ///
  /// **Category**: nginx
  nginxHTTPToHTTPSHttp497(497, 'HTTP To HTTPS'),

  /// Token Expired: 498
  ///
  /// Returned by [ArcGIS for Server](https://en.wikipedia.org/wiki/ArcGIS_Server). A code of 498 indicates an expired or otherwise invalid token.
  ///
  /// Reference: [Using token-based authentication](https://doc.arcgis.com/en/survey123/desktop/create-surveys/troubleshootcreatesurveys.htm)
  tokenExpiredHttp498(498, 'Token Expired'),

  /// nginx Client Closed Request: 499
  ///
  /// Used when the client has closed the request before the server
  /// could send a response.
  ///
  /// **Category**: nginx
  nginxClientClosedRequestHttp499(499, 'Client Closed Request'),

  // --- Server side errors 5xx. ---

  /// Internal Server Error: 500
  ///
  /// Reference: [RFC7231, Section 6.6.1](http://www.iana.org/go/rfc7231#section-6.6.1)
  internalServerErrorHttp500(500, 'Internal Server Error'),

  /// Not Implemented: 501
  ///
  /// Reference: [RFC7231, Section 6.6.2](http://www.iana.org/go/rfc7231#section-6.6.2)
  notImplementedHttp501(501, 'Not Implemented'),

  /// Bad Gateway: 502
  ///
  /// Reference: [RFC7231, Section 6.6.3](http://www.iana.org/go/rfc7231#section-6.6.3)
  badGatewayHttp502(502, 'Bad Gateway'),

  /// Service Unavailable: 503
  ///
  /// Reference: [RFC7231, Section 6.6.4](http://www.iana.org/go/rfc7231#section-6.6.4)
  serviceUnavailableHttp503(503, 'Service Unavailable'),

  /// Gateway Timeout: 504
  ///
  /// Reference: [RFC7231, Section 6.6.5](http://www.iana.org/go/rfc7231#section-6.6.5)
  gatewayTimeoutHttp504(504, 'Gateway Timeout'),

  /// HTTP Version Not Supported: 505
  ///
  /// Reference: [RFC7231, Section 6.6.6](http://www.iana.org/go/rfc7231#section-6.6.6)
  httpVersionNotSupportedHttp505(505, 'HTTP Version Not Supported'),

  /// Variant Also Negotiates: 506
  ///
  /// Reference: [RFC2295](http://www.iana.org/go/rfc2295)
  variantAlsoNegotiatesHttp506(506, 'Variant Also Negotiates'),

  /// Insufficient Storage: 507
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  insufficientStorageHttp507(507, 'Insufficient Storage'),

  /// Loop Detected: 508
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  loopDetectedHttp508(508, 'Loop Detected'),

  /// Bandwidth Limit Exceeded: 509
  ///
  /// The server has exceeded the bandwidth specified by the server
  /// administrator; this is often used by shared hosting providers
  /// to limit the bandwidth of customers.
  ///
  /// Reference: <https://documentation.cpanel.net/display/CKB/HTTP+Error+Codes+and+Quick+Fixes#HTTPErrorCodesandQuickFixes-509BandwidthLimitExceeded>
  bandwidthLimitExceededHttp509(509, 'Bandwidth Limit Exceeded'),

  /// Not Extended: 510
  ///
  /// Reference: [RFC2774](http://www.iana.org/go/rfc2774)
  otExtendedHttp510(510, 'Not Extended'),

  /// Network Authentication Required: 511
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  networkAuthenticationRequiredHttp511(511, 'Network Authentication Required'),

  /// Site is frozen: 530
  ///
  /// Used by the [Pantheon](https://en.wikipedia.org/wiki/Pantheon_(software))
  /// web platform to indicate a site that has been frozen due to inactivity.
  siteIsFrozenHttp530(530, 'Site is frozen'),

  // --- Unofficial HTTP status codes ---
  // https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#Unofficial_codes

  /// Unofficial status code. This is fine (Apache HTTP Server): 218
  ///
  /// Used by Apache servers. A catch-all error condition allowing the passage
  /// of message bodies through the server when the ProxyErrorOverride setting
  /// is enabled. It is displayed in this situation instead of a 4xx or 5xx
  /// error message.
  thisIsFineHttp218(
    218,
    'This is fine (Apache HTTP Server)',
    isOfficial: false,
  ),

  /// Unofficial status code. Page Expired (Laravel Framework): 419
  ///
  /// Used by the Laravel Framework when a CSRF Token is missing or expired.
  pageExpiredHttp419(
    419,
    'Page Expired (Laravel Framework)',
    isOfficial: false,
  ),

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
  enhanceYourCalmHttp420(420, 'Enhance Your Calm (Twitter)', isOfficial: false),

  /// Unofficial status code. Request Header Fields Too Large (Shopify): 430
  ///
  /// Used by Shopify, instead of the 429 Too Many Requests response code, when
  /// too many URLs are requested within a certain time frame.
  requestHeaderFieldsTooLargeHttp430(
    430,
    'Request Header Fields Too Large (Shopify)',
    isOfficial: false,
  ),

  /// Unofficial status code. Site is overloaded: 529
  ///
  /// Used by Qualys in the SSLLabs server testing API to signal that the site
  /// can't process the request.
  siteIsOverloadedHttp529(529, 'Site is overloaded', isOfficial: false),

  /// Unofficial status code. Network Connect Timeout Error: 598
  ///
  /// Used by some HTTP proxies to signal a network read timeout behind the
  /// proxy to a client in front of the proxy.
  networkReadTimeoutErrorHttp598(
    598,
    'Network read timeout error (Informal convention)',
    isOfficial: false,
  ),

  /// Unofficial status code. Request Header Too Large: 494
  ///
  /// The client sent too large of a request or too long of a header line.
  requestHeaderTooLargeHttp494(
    494,
    'Request Header Too Large',
    isOfficial: false,
  ),

  /// Unofficial status code. Web Server Returned an Unknown Error: 520
  ///
  /// The origin server returned an empty, unknown, or unexpected response to
  /// Cloudflare.
  webServerReturnedUnknownErrorHttp520(
    520,
    'Web Server Returned an Unknown Error',
    isOfficial: false,
  ),

  /// Unofficial status code. Web Server Is Down: 521
  ///
  /// The origin server refused connections from Cloudflare. Security solutions
  /// at the origin may be blocking legitimate connections from certain
  /// Cloudflare IP addresses.
  webServerIsDownHttp521(521, 'Web Server Is Down', isOfficial: false),

  /// Unofficial status code. Connection Timed Out: 522
  ///
  /// Cloudflare timed out contacting the origin server.
  connectionTimedOutHttp522(522, 'Connection Timed Out', isOfficial: false),

  /// Unofficial status code. Origin Is Unreachable: 523
  ///
  /// Cloudflare could not reach the origin server; for example, if the DNS
  /// records for the origin server are incorrect or missing.
  originIsUnreachableHttp523(523, 'Origin Is Unreachable', isOfficial: false),

  /// Unofficial status code. A Timeout Occurred: 524
  ///
  /// Cloudflare was able to complete a TCP connection to the origin server, but
  /// did not receive a timely HTTP response.
  timeoutOccurredHttp524(524, 'A Timeout Occurred', isOfficial: false),

  /// Unofficial status code. SSL Handshake Failed: 525
  ///
  /// Cloudflare could not negotiate a SSL/TLS handshake with the origin server.
  sslHandshakeFailedHttp525(525, 'SSL Handshake Failed', isOfficial: false),

  /// Unofficial status code. Invalid SSL Certificate: 526
  ///
  /// Cloudflare could not validate the SSL certificate on the origin web
  /// server.
  invalidSSLCertificateHttp526(
    526,
    'Invalid SSL Certificate',
    isOfficial: false,
  ),

  /// Unofficial status code. Railgun Error: 527
  ///
  /// Error 527 indicates an interrupted connection between Cloudflare and the
  /// origin server's Railgun server.
  railgunErrorHttp527(527, 'Railgun Error', isOfficial: false),

  /// Unofficial status code. Client Closed Connection: 460
  ///
  /// The client closed the connection with the load balancer before the idle
  /// timeout period elapsed. Typically occurs when the client timeout is sooner
  /// than the Elastic Load Balancer's timeout.
  clientClosedConnectionHttp460(
    460,
    'Client Closed Connection',
    isOfficial: false,
  ),

  /// Unofficial status code. Too Many IP Addresses: 463
  ///
  /// The load balancer received an X-Forwarded-For request header with more
  /// than 30 IP addresses.
  tooManyIpAddressesHttp463(463, 'Too Many IP Addresses', isOfficial: false),

  /// Unofficial status code. Incompatible Protocol Versions: 464
  ///
  /// There are incompatible protocol versions between the client and the origin
  /// server.
  incompatibleProtocolVersionsHttp464(
    464,
    'Incompatible Protocol Versions',
    isOfficial: false,
  ),

  /// Unofficial status code. Unauthorized: 561
  ///
  /// An error around authentication returned by a server registered with a load
  /// balancer. You configured a listener rule to

  /// Unauthorized (AWS Elastic Load Balancing): 561
  ///
  /// Used by AWS Elastic Load Balancing when authentication has failed or
  /// credentials are missing.
  unauthorizedHttp561(
    561,
    'Unauthorized (AWS Elastic Load Balancing)',
    isOfficial: false,
  ),

  /// Official status code. Network Connect Timeout Error: 599
  ///
  /// This status code is not specified in any RFCs, but is used by some HTTP
  /// proxies to signal a network connect timeout behind the proxy to a client
  /// in front of the proxy.
  networkConnectTimeoutErrorHttp599(599, 'Network Connect Timeout Error');

  /// Dart `enum` for easier handling of all IANA registered HTTP Status codes.
  const StatusCode(this.code, this.reason, {this.isOfficial = true});

  /// The IANA registered HTTP Status code.
  final int code;

  /// Status code corresponding Reason Phrase.
  final String reason;

  /// Specifies whether the HTTP status code is an official IANA registered
  /// code.
  ///
  /// By default, a status code is considered official if it is registered with
  /// the IANA. However, in some cases, custom or unofficial status codes may be
  /// used. This boolean indicates whether the status code is an official IANA
  /// code or not.
  final bool isOfficial;

  @override
  String toString() =>
      'StatusCode($code, reason: "$reason", isOfficial: $isOfficial)';

  /// Returns the [StatusCode] enum value for the given status code, if it
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
    if (statusCode != null) {
      final intStatusCode = statusCode.toInt();
      for (final status in values) {
        if (status.code == intStatusCode) return status;
      }
    }

    return null;
  }

  /// Tries to parse the given `String?` and return the corresponding
  /// [StatusCode] enum value, if it exists. Otherwise, returns `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// var status = StatusCode.tryParse("HTTP/1.1 200 OK");
  /// print(status); // Output: StatusCode(200, reason: "OK")
  /// status = StatusCode.tryParse("HTTP/1.1 OK");
  /// print(status); // Output: null
  /// ```
  static StatusCode? tryParse(String? statusCode) {
    if (statusCode == null) {
      return null;
    }
    final maybeCode = RegExp(r'\d{3}').firstMatch(statusCode)?[0];

    return maybeCode == null ? null : maybeFromCode(num.tryParse(maybeCode));
  }
}
