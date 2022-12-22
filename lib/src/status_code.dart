part 'status_code.g.dart';

/// Dart [enum] for easier handling of all IANA registered HTTP Status codes.
enum StatusCode {
  // --- Informational 1xx. ---

  /// Continue: 100
  ///
  /// Reference: [RFC7231, Section 6.2.1](http://www.iana.org/go/rfc7231#section-6.2.1)
  continue100(100, 'Continue'),

  /// Switching Protocols: 101
  ///
  /// Reference: [RFC7231, Section 6.2.2](http://www.iana.org/go/rfc7231#section-6.2.2)
  switchingProtocols101(101, 'Switching Protocols'),

  /// Processing: 102
  ///
  /// Reference: [RFC2518](http://www.iana.org/go/rfc2518)
  processing102(102, 'Processing'),

  /// Early Hints: 103
  ///
  /// Reference: [RFC8297](http://www.iana.org/go/rfc8297)
  earlyHints103(103, 'Early Hints'),

  // --- Success 2xx ---

  /// OK: 200
  ///
  /// Reference: [RFC7231, Section 6.3.1](http://www.iana.org/go/rfc7231#section-6.3.1)
  ok200(200, 'OK'),

  /// Created: 201
  ///
  /// Reference: [RFC7231, Section 6.3.2](http://www.iana.org/go/rfc7231#section-6.3.2)
  created201(201, 'Created'),

  /// Accepted: 202
  ///
  /// Reference: [RFC7231, Section 6.3.3](http://www.iana.org/go/rfc7231#section-6.3.3)
  accepted202(202, 'Accepted'),

  /// Non-Authoritative Information: 203
  ///
  /// Reference: [RFC7231, Section 6.3.4](http://www.iana.org/go/rfc7231#section-6.3.4)
  nonAuthoritativeInformation203(203, 'Non-Authoritative Information'),

  /// No Content: 204
  ///
  /// Reference: [RFC7231, Section 6.3.5](http://www.iana.org/go/rfc7231#section-6.3.5)
  noContent204(204, 'No Content'),

  /// Reset Content: 205
  ///
  /// Reference: [RFC7231, Section 6.3.6](http://www.iana.org/go/rfc7231#section-6.3.6)
  resetContent205(205, 'Reset Content'),

  /// Partial Content: 206
  ///
  /// Reference: [RFC7233, Section 4.1](http://www.iana.org/go/rfc7233#section-4.1)
  partialContent206(206, 'Partial Content'),

  /// Multi-Status: 207
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  multiStatus207(207, 'Multi-Status'),

  /// Already Reported: 208
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  alreadyReported208(208, 'Already Reported'),

  /// IM Used: 226
  ///
  /// Reference: [RFC3229](http://www.iana.org/go/rfc3229)
  imUsed226(226, 'IM Used'),

  // --- Redirection 3xx. ---

  /// Multiple Choices: 300
  ///
  /// Reference: [RFC7231, Section 6.4.1](http://www.iana.org/go/rfc7231#section-6.4.1)
  multipleChoices300(300, 'Multiple Choices'),

  /// Moved Permanently: 301
  ///
  /// Reference: [RFC7231, Section 6.4.2](http://www.iana.org/go/rfc7231#section-6.4.2)
  movedPermanently301(301, 'Moved Permanently'),

  /// Found: 302
  ///
  /// Reference: [RFC7231, Section 6.4.3](http://www.iana.org/go/rfc7231#section-6.4.3)
  found302(302, 'Found'),

  /// See Other: 303
  ///
  /// Reference: [RFC7231, Section 6.4.4](http://www.iana.org/go/rfc7231#section-6.4.4)
  seeOther303(303, 'See Other'),

  /// Not Modified: 304
  ///
  /// Reference: [RFC7232, Section 4.1](http://www.iana.org/go/rfc7232#section-4.1)
  notModified304(304, 'Not Modified'),

  /// Use Proxy: 305
  ///
  /// Reference: [RFC7231, Section 6.4.5](http://www.iana.org/go/rfc7231#section-6.4.5)
  useProxy305(305, 'Use Proxy'),

  /// Temporary Redirect: 307
  ///
  /// Reference: [RFC7231, Section 6.4.7](http://www.iana.org/go/rfc7231#section-6.4.7)
  temporaryRedirect307(307, 'Temporary Redirect'),

  /// Permanent Redirect: 308
  ///
  /// Reference: [RFC7538](http://www.iana.org/go/rfc7538)
  permanentRedirect308(308, 'Permanent Redirect'),

  // --- Client side errors 4xx. ---

  /// Bad Request: 400
  ///
  /// Reference: [RFC7231, Section 6.5.1](http://www.iana.org/go/rfc7231#section-6.5.1)
  badRequest400(400, 'Bad Request'),

  /// Unauthorized: 401
  ///
  /// Reference: [RFC7235, Section 3.1](http://www.iana.org/go/rfc7235#section-3.1)
  unauthorized401(401, 'Unauthorized'),

  /// Payment Required: 402
  ///
  /// Reference: [RFC7231, Section 6.5.2](http://www.iana.org/go/rfc7231#section-6.5.2)
  paymentRequired402(402, 'Payment Required'),

  /// Forbidden: 403
  ///
  /// Reference: [RFC7231, Section 6.5.3](http://www.iana.org/go/rfc7231#section-6.5.3)
  forbidden403(403, 'Forbidden'),

  /// Not Found: 404
  ///
  /// Reference: [RFC7231, Section 6.5.4](http://www.iana.org/go/rfc7231#section-6.5.4)
  notFound404(404, 'Not Found'),

  /// Method Not Allowed: 405
  ///
  /// Reference: [RFC7231, Section 6.5.5](http://www.iana.org/go/rfc7231#section-6.5.5)
  methodNotAllowed405(405, 'Method Not Allowed'),

  /// Not Acceptable: 406
  ///
  /// Reference: [RFC7231, Section 6.5.6](http://www.iana.org/go/rfc7231#section-6.5.6)
  notAcceptable406(406, 'Not Acceptable'),

  /// Proxy Authentication Required: 407
  ///
  /// Reference: [RFC7235, Section 3.2](http://www.iana.org/go/rfc7235#section-3.2)
  proxyAuthenticationRequired407(407, 'Proxy Authentication Required'),

  /// Request Timeout: 408
  ///
  /// Reference: [RFC7231, Section 6.5.7](http://www.iana.org/go/rfc7231#section-6.5.7)
  requestTimeout408(408, 'Request Timeout'),

  /// Conflict: 409
  ///
  /// Reference: [RFC7231, Section 6.5.8](http://www.iana.org/go/rfc7231#section-6.5.8)
  conflict409(409, 'Conflict'),

  /// Gone: 410
  ///
  /// Reference: [RFC7231, Section 6.5.9](http://www.iana.org/go/rfc7231#section-6.5.9)
  gone410(410, 'Gone'),

  /// Length Required: 411
  ///
  /// Reference: [RFC7231, Section 6.5.10](http://www.iana.org/go/rfc7231#section-6.5.10)
  lengthRequired411(411, 'Length Required'),

  /// Precondition Failed: 412
  ///
  /// Reference: [RFC7232, Section 4.2](http://www.iana.org/go/rfc7232#section-4.2)
  /// Reference: [RFC8144, Section 3.2](http://www.iana.org/go/rfc8144#section-3.2)
  preconditionFailed412(412, 'Precondition Failed'),

  /// Payload Too Large: 413
  ///
  /// Reference: [RFC7231, Section 6.5.11](http://www.iana.org/go/rfc7231#section-6.5.11)
  payloadTooLarge413(413, 'Payload Too Large'),

  /// URI Too Long: 414
  ///
  /// Reference: [RFC7231, Section 6.5.12](http://www.iana.org/go/rfc7231#section-6.5.12)
  uriTooLong414(414, 'URI Too Long'),

  /// Unsupported Media Type: 415
  ///
  /// Reference: [RFC7231, Section 6.5.13](http://www.iana.org/go/rfc7231#section-6.5.13)
  /// Reference: [RFC7694, Section 3](http://www.iana.org/go/rfc7694#section-3)
  unsupportedMediaType415(415, 'Unsupported Media Type'),

  /// Range Not Satisfiable: 416
  ///
  /// Reference: [RFC7233, Section 4.4](http://www.iana.org/go/rfc7233#section-4.4)
  rangeNotSatisfiable416(416, 'Range Not Satisfiable'),

  /// Expectation Failed: 417
  ///
  /// Reference: [RFC7231, Section 6.5.14](http://www.iana.org/go/rfc7231#section-6.5.14)
  expectationFailed417(417, 'Expectation Failed'),

  /// I'm A Teapot: 418
  ///
  /// Returned by tea pots requested to brew coffee
  ///
  /// Reference: [RFC 2324](http://www.iana.org/go/rfc2324)
  imATeapot418(418, "I'm A Teapot"),

  /// Misdirected Request: 421
  ///
  /// Reference: [RFC7540, Section 9.1.2](http://www.iana.org/go/rfc7540#section-9.1.2)
  misdirectedRequest421(421, 'Misdirected Request'),

  /// Unprocessable Entity: 422
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  unprocessableEntity422(422, 'Unprocessable Entity'),

  /// Locked: 423
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  locked423(423, 'Locked'),

  /// Failed Dependency: 424
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  failedDependency424(424, 'Failed Dependency'),

  /// Too Early: 425
  ///
  /// Reference: [RFC8470](http://www.iana.org/go/rfc8470)
  tooEarly425(425, 'Too Early'),

  /// Upgrade Required: 426
  ///
  /// Reference: [RFC7231, Section 6.5.15](http://www.iana.org/go/rfc7231#section-6.5.15)
  upgradeRequired426(426, 'Upgrade Required'),

  /// Precondition Required: 428
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  preconditionRequired428(428, 'Precondition Required'),

  /// Too Many Requests: 429
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  tooManyRequests429(429, 'Too Many Requests'),

  /// Request Header Fields Too Large: 431
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  requestHeaderFieldsTooLarge431(431, 'Request Header Fields Too Large'),

  /// IIS Login Timeout: 440
  ///
  /// The client's session has expired and must log in again.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [Error message when you try to log on to Exchange 2007 by using Outlook Web Access: "440 Login Timeout"](http://support.microsoft.com/kb/941201/en-us)
  iisLoginTimeout440(440, 'IIS Login Timeout'),

  /// nginx No Response: 444
  ///
  /// Used to indicate that the server has returned no information to the
  /// client and closed the connection.
  ///
  /// **Category**: nginx
  nginxNoResponse444(444, 'No Response'),

  /// IIS Retry With: 449
  ///
  /// The server cannot honour the request because the user has
  /// not provided the required information.
  ///
  /// **Category**: Internet Information Services
  ///
  /// Reference: [2.2.6 449 Retry With Status Code](https://msdn.microsoft.com/en-us/library/dd891478.aspx)
  iisRetryWith449(449, 'IIS Retry With'),

  /// Blocked by Windows Parental Controls: 450
  ///
  /// A Microsoft extension. This error is given when Windows Parental
  /// Controls are turned on and are blocking access to the given webpage.
  blockedByWindowsParentalControls450(
    450,
    'Blocked by Windows Parental Controls',
  ),

  /// Unavailable For Legal Reasons: 451
  ///
  /// Reference: [RFC7725](http://www.iana.org/go/rfc7725)
  unavailableForLegalReasons451(451, 'Unavailable For Legal Reasons'),

  /// nginx SSL Certificate Error: 495
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has provided an invalid client certificate.
  ///
  /// **Category**: nginx
  nginxSSLCertificateError495(495, 'SSL Certificate Error'),

  /// nginx SSL Certificate Required: 496
  ///
  /// An expansion of the 400 Bad Request response code, used when a client
  /// certificate is required but not provided.
  ///
  /// **Category**: nginx
  nginxSSLCertificateRequired496(496, 'SSL Certificate Required'),

  /// nginx HTTP To HTTPS: 497
  ///
  /// An expansion of the 400 Bad Request response code, used when the client
  /// has made a HTTP request to a port listening for HTTPS requests.
  ///
  /// **Category**: nginx
  nginxHTTPToHTTPS497(497, 'HTTP To HTTPS'),

  /// Token Expired: 498
  ///
  /// Returned by [ArcGIS for Server](https://en.wikipedia.org/wiki/ArcGIS_Server). A code of 498 indicates an expired or otherwise invalid token.
  ///
  /// Reference: [Using token-based authentication](http://help.arcgis.com/en/arcgisserver/10.0/apis/soap/index.htm#Using_token_authentication.htm)
  tokenExpired498(498, 'Token Expired'),

  /// nginx Client Closed Request: 499
  ///
  /// Used when the client has closed the request before the server
  /// could send a response.
  ///
  /// **Category**: nginx
  nginxClientClosedRequest499(499, 'Client Closed Request'),

  // --- Server side errors 5xx. ---

  /// Internal Server Error: 500
  ///
  /// Reference: [RFC7231, Section 6.6.1](http://www.iana.org/go/rfc7231#section-6.6.1)
  internalServerError500(500, 'Internal Server Error'),

  /// Not Implemented: 501
  ///
  /// Reference: [RFC7231, Section 6.6.2](http://www.iana.org/go/rfc7231#section-6.6.2)
  notImplemented501(501, 'Not Implemented'),

  /// Bad Gateway: 502
  ///
  /// Reference: [RFC7231, Section 6.6.3](http://www.iana.org/go/rfc7231#section-6.6.3)
  badGateway502(502, 'Bad Gateway'),

  /// Service Unavailable: 503
  ///
  /// Reference: [RFC7231, Section 6.6.4](http://www.iana.org/go/rfc7231#section-6.6.4)
  serviceUnavailable503(503, 'Service Unavailable'),

  /// Gateway Timeout: 504
  ///
  /// Reference: [RFC7231, Section 6.6.5](http://www.iana.org/go/rfc7231#section-6.6.5)
  gatewayTimeout504(504, 'Gateway Timeout'),

  /// HTTP Version Not Supported: 505
  ///
  /// Reference: [RFC7231, Section 6.6.6](http://www.iana.org/go/rfc7231#section-6.6.6)
  httpVersionNotSupported505(505, 'HTTP Version Not Supported'),

  /// Variant Also Negotiates: 506
  ///
  /// Reference: [RFC2295](http://www.iana.org/go/rfc2295)
  variantAlsoNegotiates506(506, 'Variant Also Negotiates'),

  /// Insufficient Storage: 507
  ///
  /// Reference: [RFC4918](http://www.iana.org/go/rfc4918)
  insufficientStorage507(507, 'Insufficient Storage'),

  /// Loop Detected: 508
  ///
  /// Reference: [RFC5842](http://www.iana.org/go/rfc5842)
  loopDetected508(508, 'Loop Detected'),

  /// Bandwidth Limit Exceeded: 509
  ///
  /// The server has exceeded the bandwidth specified by the server
  /// administrator; this is often used by shared hosting providers
  /// to limit the bandwidth of customers.
  ///
  /// Reference: <https://documentation.cpanel.net/display/CKB/HTTP+Error+Codes+and+Quick+Fixes#HTTPErrorCodesandQuickFixes-509BandwidthLimitExceeded>
  bandwidthLimitExceeded509(509, 'Bandwidth Limit Exceeded'),

  /// Not Extended: 510
  ///
  /// Reference: [RFC2774](http://www.iana.org/go/rfc2774)
  otExtended510(510, 'Not Extended'),

  /// Network Authentication Required: 511
  ///
  /// Reference: [RFC6585](http://www.iana.org/go/rfc6585)
  networkAuthenticationRequired511(511, 'Network Authentication Required'),

  /// Site is frozen: 530
  ///
  /// Used by the [Pantheon](https://en.wikipedia.org/wiki/Pantheon_(software))
  /// web platform to indicate a site that has been frozen due to inactivity.
  siteIsFrozen530(530, 'Site is frozen'),

  /// Network Connect Timeout Error: 599
  ///
  /// This status code is not specified in any RFCs, but is used by some HTTP
  /// proxies to signal a network connect timeout behind the proxy to a client
  /// in front of the proxy.
  networkConnectTimeoutError599(599, 'Network Connect Timeout Error');

  const StatusCode(this.code, this.reason);

  final int code;

  /// Status code corresponding Reason Phrase.
  final String reason;

  @override
  String toString() => 'StatusCode($code, reason: "$reason")';

  static StatusCode? maybeFromCode(num? statusCode) {
    if (statusCode != null) {
      final intStatusCode = statusCode.toInt();
      for (final status in values) {
        if (status.code == intStatusCode) {
          return status;
        }
      }
    }

    return null;
  }

  static StatusCode? tryParse(String? statusCode) {
    if (statusCode == null) {
      return null;
    }
    final maybeCode = RegExp(r'\d{3}').firstMatch(statusCode)?[0];

    return maybeCode == null ? null : maybeFromCode(num.parse(maybeCode));
  }
}
