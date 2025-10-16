// Copyright (c) 2025, Roman Cinis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: avoid-long-parameter-list, avoid-high-cyclomatic-complexity

import 'status_code.dart';

/// Functional style extensions on [StatusCode].
extension StatusCodeExtension on StatusCode {
  bool get isCustom => !StatusCode.values.contains(this);

  String toStringShallow() => // TODO! Doc. breaking toString > toStringShallow.
      'StatusCode($this, reason: "$reason", isOfficial: $isOfficial)';

  @Deprecated('Use toString() or toStringShallow() instead')
  String get name => toStringShallow();

  /// The IANA registered HTTP Status code.
  @Deprecated('StatusCode is no longer an enum, so `index` is not applicable.')
  int get index => StatusCode.values.indexOf(this);

  /// The IANA registered HTTP Status code.
  @Deprecated('StatusCode is no longer an enum. You can simply remove `.code`')
  int get code => this;

  /// Status code corresponding Reason Phrase.
  String get reason => StatusCode.reasons[this] ?? 'Custom status code: $this';

  /// Specifies whether the HTTP status code is an official IANA registered
  /// code.
  ///
  /// By default, a status code is considered official if it is registered with
  /// the IANA. However, in some cases, custom or unofficial status codes may be
  /// used. This boolean indicates whether the status code is an official IANA
  /// code or not.
  bool get isOfficial => StatusCode.officialCodes.contains(this);

  /// Determines whether this StatusCode corresponds to an HTTP 100 status.
  bool get isContinueHttp100 => this == StatusCode.continueHttp100;

  /// Determines whether this StatusCode corresponds to an HTTP 101 status.
  bool get isSwitchingProtocolsHttp101 =>
      this == StatusCode.switchingProtocolsHttp101;

  /// Determines whether this StatusCode corresponds to an HTTP 102 status.
  bool get isProcessingHttp102 => this == StatusCode.processingHttp102;

  /// Determines whether this StatusCode corresponds to an HTTP 103 status.
  bool get isEarlyHintsHttp103 => this == StatusCode.earlyHintsHttp103;

  /// Determines whether this StatusCode corresponds to an HTTP 200 status.
  bool get isOkHttp200 => this == StatusCode.okHttp200;

  /// Determines whether this StatusCode corresponds to an HTTP 201 status.
  bool get isCreatedHttp201 => this == StatusCode.createdHttp201;

  /// Determines whether this StatusCode corresponds to an HTTP 202 status.
  bool get isAcceptedHttp202 => this == StatusCode.acceptedHttp202;

  /// Determines whether this StatusCode corresponds to an HTTP 203 status.
  bool get isNonAuthoritativeInformationHttp203 =>
      this == StatusCode.nonAuthoritativeInformationHttp203;

  /// Determines whether this StatusCode corresponds to an HTTP 204 status.
  bool get isNoContentHttp204 => this == StatusCode.noContentHttp204;

  /// Determines whether this StatusCode corresponds to an HTTP 205 status.
  bool get isResetContentHttp205 => this == StatusCode.resetContentHttp205;

  /// Determines whether this StatusCode corresponds to an HTTP 206 status.
  bool get isPartialContentHttp206 => this == StatusCode.partialContentHttp206;

  /// Determines whether this StatusCode corresponds to an HTTP 207 status.
  bool get isMultiStatusHttp207 => this == StatusCode.multiStatusHttp207;

  /// Determines whether this StatusCode corresponds to an HTTP 208 status.
  bool get isAlreadyReportedHttp208 =>
      this == StatusCode.alreadyReportedHttp208;

  /// Determines whether this StatusCode corresponds to an HTTP 226 status.
  bool get isImUsedHttp226 => this == StatusCode.imUsedHttp226;

  /// Determines whether this StatusCode corresponds to an HTTP 300 status.
  bool get isMultipleChoicesHttp300 =>
      this == StatusCode.multipleChoicesHttp300;

  /// Determines whether this StatusCode corresponds to an HTTP 301 status.
  bool get isMovedPermanentlyHttp301 =>
      this == StatusCode.movedPermanentlyHttp301;

  /// Determines whether this StatusCode corresponds to an HTTP 302 Found.
  bool get isFoundHttp302 => this == StatusCode.foundHttp302;

  /// Determines whether this StatusCode corresponds to an HTTP 303 status.
  bool get isSeeOtherHttp303 => this == StatusCode.seeOtherHttp303;

  /// Determines whether this StatusCode corresponds to an HTTP 304 status.
  bool get isNotModifiedHttp304 => this == StatusCode.notModifiedHttp304;

  /// Determines whether this StatusCode corresponds to an HTTP status.
  bool get isUseProxyHttp305 => this == StatusCode.useProxyHttp305;

  /// Determines whether this StatusCode corresponds to an HTTP 307 status.
  bool get isTemporaryRedirectHttp307 =>
      this == StatusCode.temporaryRedirectHttp307;

  /// Determines whether this StatusCode corresponds to an HTTP 308 status.
  bool get isPermanentRedirectHttp308 =>
      this == StatusCode.permanentRedirectHttp308;

  /// Determines whether this StatusCode corresponds to an HTTP 400 status.
  bool get isBadRequestHttp400 => this == StatusCode.badRequestHttp400;

  /// Determines whether this StatusCode corresponds to an HTTP 401 status.
  bool get isUnauthorizedHttp401 => this == StatusCode.unauthorizedHttp401;

  /// Determines whether this StatusCode corresponds to an HTTP 402 status.
  bool get isPaymentRequiredHttp402 =>
      this == StatusCode.paymentRequiredHttp402;

  /// Determines whether this StatusCode corresponds to an HTTP 403 status.
  bool get isForbiddenHttp403 => this == StatusCode.forbiddenHttp403;

  /// Determines whether this StatusCode corresponds to an HTTP 404 status.
  bool get isNotFoundHttp404 => this == StatusCode.notFoundHttp404;

  /// Determines whether this StatusCode corresponds to an HTTP 405 status.
  bool get isMethodNotAllowedHttp405 =>
      this == StatusCode.methodNotAllowedHttp405;

  /// Determines whether this StatusCode corresponds to an HTTP 406 status.
  bool get isNotAcceptableHttp406 => this == StatusCode.notAcceptableHttp406;

  /// Determines whether this StatusCode corresponds to an HTTP 407 status.
  bool get isProxyAuthenticationRequiredHttp407 =>
      this == StatusCode.proxyAuthenticationRequiredHttp407;

  /// Determines whether this StatusCode corresponds to an HTTP 408 status.
  bool get isRequestTimeoutHttp408 => this == StatusCode.requestTimeoutHttp408;

  /// Determines whether this StatusCode corresponds to an HTTP 409 status.
  bool get isConflictHttp409 => this == StatusCode.conflictHttp409;

  /// Determines whether this StatusCode corresponds to an HTTP 410 status.
  bool get isGoneHttp410 => this == StatusCode.goneHttp410;

  /// Determines whether this StatusCode corresponds to an HTTP 411 status.
  bool get isLengthRequiredHttp411 => this == StatusCode.lengthRequiredHttp411;

  /// Determines whether this StatusCode corresponds to an HTTP 412 status.
  bool get isPreconditionFailedHttp412 =>
      this == StatusCode.preconditionFailedHttp412;

  /// Determines whether this StatusCode corresponds to an HTTP 413 status.
  bool get isPayloadTooLargeHttp413 =>
      this == StatusCode.payloadTooLargeHttp413;

  /// Determines whether this StatusCode corresponds to an HTTP 414 status.
  bool get isUriTooLongHttp414 => this == StatusCode.uriTooLongHttp414;

  /// Determines whether this StatusCode corresponds to an HTTP 415 status.
  bool get isUnsupportedMediaTypeHttp415 =>
      this == StatusCode.unsupportedMediaTypeHttp415;

  /// Determines whether this StatusCode corresponds to an HTTP 416 status.
  bool get isRangeNotSatisfiableHttp416 =>
      this == StatusCode.rangeNotSatisfiableHttp416;

  /// Determines whether this StatusCode corresponds to an HTTP 417 status.
  bool get isExpectationFailedHttp417 =>
      this == StatusCode.expectationFailedHttp417;

  /// Determines whether this StatusCode corresponds to an HTTP 418 status.
  bool get isImATeapotHttp418 => this == StatusCode.imATeapotHttp418;

  /// Determines whether this StatusCode corresponds to an HTTP 421 status.
  bool get isMisdirectedRequestHttp421 =>
      this == StatusCode.misdirectedRequestHttp421;

  /// Determines whether this StatusCode corresponds to an HTTP 422 status.
  bool get isUnprocessableEntityHttp422 =>
      this == StatusCode.unprocessableEntityHttp422;

  /// Determines whether this StatusCode corresponds to an HTTP 423 status.
  bool get isLockedHttp423 => this == StatusCode.lockedHttp423;

  /// Determines whether this StatusCode corresponds to an HTTP 424 status.
  bool get isFailedDependencyHttp424 =>
      this == StatusCode.failedDependencyHttp424;

  /// Determines whether this StatusCode corresponds to an HTTP 425 status.
  bool get isTooEarlyHttp425 => this == StatusCode.tooEarlyHttp425;

  /// Determines whether this StatusCode corresponds to an HTTP 426 status.
  bool get isUpgradeRequiredHttp426 =>
      this == StatusCode.upgradeRequiredHttp426;

  /// Determines whether this StatusCode corresponds to an HTTP 428 status.
  bool get isPreconditionRequiredHttp428 =>
      this == StatusCode.preconditionRequiredHttp428;

  /// Determines whether this StatusCode corresponds to an HTTP 429 status.
  bool get isTooManyRequestsHttp429 =>
      this == StatusCode.tooManyRequestsHttp429;

  /// Determines whether this StatusCode corresponds to an HTTP 431 status.
  bool get isRequestHeaderFieldsTooLargeHttp431 =>
      this == StatusCode.requestHeaderFieldsTooLargeHttp431;

  /// Determines whether this StatusCode corresponds to an HTTP 440 status.
  bool get isIisLoginTimeoutHttp440 =>
      this == StatusCode.iisLoginTimeoutHttp440;

  /// Determines whether this StatusCode corresponds to an HTTP 444 status.
  bool get isNginxNoResponseHttp444 =>
      this == StatusCode.nginxNoResponseHttp444;

  /// Determines whether this StatusCode corresponds to an HTTP 449 status.
  bool get isIisRetryWithHttp449 => this == StatusCode.iisRetryWithHttp449;

  /// Determines whether this StatusCode corresponds to an HTTP 450 status.
  bool get isBlockedByWindowsParentalControlsHttp450 =>
      this == StatusCode.blockedByWindowsParentalControlsHttp450;

  /// Determines whether this StatusCode corresponds to an HTTP 451 status.
  bool get isUnavailableForLegalReasonsHttp451 =>
      this == StatusCode.unavailableForLegalReasonsHttp451;

  /// Determines whether this StatusCode corresponds to an HTTP 495 status.
  bool get isNginxSSLCertificateErrorHttp495 =>
      this == StatusCode.nginxSSLCertificateErrorHttp495;

  /// Determines whether this StatusCode corresponds to an HTTP 496 status.
  bool get isNginxSSLCertificateRequiredHttp496 =>
      this == StatusCode.nginxSSLCertificateRequiredHttp496;

  /// Determines whether this StatusCode corresponds to an HTTP 497 status.
  bool get isNginxHTTPToHTTPSHttp497 =>
      this == StatusCode.nginxHTTPToHTTPSHttp497;

  /// Determines whether this StatusCode corresponds to an HTTP 498 status.
  bool get isTokenExpiredHttp498 => this == StatusCode.tokenExpiredHttp498;

  /// Determines whether this StatusCode corresponds to an HTTP 499 status.
  bool get isNginxClientClosedRequestHttp499 =>
      this == StatusCode.nginxClientClosedRequestHttp499;

  /// Determines whether this StatusCode corresponds to an HTTP 500 status.
  bool get isInternalServerErrorHttp500 =>
      this == StatusCode.internalServerErrorHttp500;

  /// Determines whether this StatusCode corresponds to an HTTP 501 status.
  bool get isNotImplementedHttp501 => this == StatusCode.notImplementedHttp501;

  /// Determines whether this StatusCode corresponds to an HTTP 502 status.
  bool get isBadGatewayHttp502 => this == StatusCode.badGatewayHttp502;

  /// Determines whether this StatusCode corresponds to an HTTP 503 status.
  bool get isServiceUnavailableHttp503 =>
      this == StatusCode.serviceUnavailableHttp503;

  /// Determines whether this StatusCode corresponds to an HTTP 504 status.
  bool get isGatewayTimeoutHttp504 => this == StatusCode.gatewayTimeoutHttp504;

  /// Determines whether this StatusCode corresponds to an HTTP 505 status.
  bool get isHttpVersionNotSupportedHttp505 =>
      this == StatusCode.httpVersionNotSupportedHttp505;

  /// Determines whether this StatusCode corresponds to an HTTP 506 status.
  bool get isVariantAlsoNegotiatesHttp506 =>
      this == StatusCode.variantAlsoNegotiatesHttp506;

  /// Determines whether this StatusCode corresponds to an HTTP 507 status.
  bool get isInsufficientStorageHttp507 =>
      this == StatusCode.insufficientStorageHttp507;

  /// Determines whether this StatusCode corresponds to an HTTP 508 status.
  bool get isLoopDetectedHttp508 => this == StatusCode.loopDetectedHttp508;

  /// Determines whether this StatusCode corresponds to an HTTP 509 status.
  bool get isBandwidthLimitExceededHttp509 =>
      this == StatusCode.bandwidthLimitExceededHttp509;

  /// Determines whether this StatusCode corresponds to an HTTP 510 status.
  bool get isOtExtendedHttp510 => this == StatusCode.otExtendedHttp510;

  /// Determines whether this StatusCode corresponds to an HTTP 511 status.
  bool get isNetworkAuthenticationRequiredHttp511 =>
      this == StatusCode.networkAuthenticationRequiredHttp511;

  /// Determines whether this StatusCode corresponds to an HTTP 530 status.
  bool get isSiteIsFrozenHttp530 => this == StatusCode.siteIsFrozenHttp530;

  /// Determines whether this StatusCode corresponds to an HTTP 599 status.
  bool get isNetworkConnectTimeoutErrorHttp599 =>
      this == StatusCode.networkConnectTimeoutErrorHttp599;

  /// Determines whether this StatusCode corresponds to an HTTP 218 status.
  bool get isThisIsFineHttp218 => this == StatusCode.thisIsFineHttp218;

  /// Determines whether this StatusCode corresponds to an HTTP 419 status.
  bool get isPageExpiredHttp419 => this == StatusCode.pageExpiredHttp419;

  /// Determines whether this StatusCode corresponds to an HTTP 420 status.
  bool get isEnhanceYourCalmHttp420 =>
      this == StatusCode.enhanceYourCalmHttp420;

  /// Determines whether this StatusCode corresponds to an HTTP 430 status.
  bool get isRequestHeaderFieldsTooLargeHttp430 =>
      this == StatusCode.requestHeaderFieldsTooLargeHttp430;

  /// Determines whether this StatusCode corresponds to an HTTP 529 status.
  bool get isSiteIsOverloadedHttp529 =>
      this == StatusCode.siteIsOverloadedHttp529;

  /// Determines whether this StatusCode corresponds to an HTTP 598 status.
  bool get isNetworkReadTimeoutErrorHttp598 =>
      this == StatusCode.networkReadTimeoutErrorHttp598;

  /// Determines whether this StatusCode corresponds to an HTTP 494 status.
  bool get isRequestHeaderTooLargeHttp494 =>
      this == StatusCode.requestHeaderTooLargeHttp494;

  /// Determines whether this StatusCode corresponds to an HTTP 520 status.
  bool get isWebServerReturnedUnknownErrorHttp520 =>
      this == StatusCode.webServerReturnedUnknownErrorHttp520;

  /// Determines whether this StatusCode corresponds to an HTTP 521 status.
  bool get isWebServerIsDownHttp521 =>
      this == StatusCode.webServerIsDownHttp521;

  /// Determines whether this StatusCode corresponds to an HTTP 522 status.
  bool get isConnectionTimedOutHttp522 =>
      this == StatusCode.connectionTimedOutHttp522;

  /// Determines whether this StatusCode corresponds to an HTTP 523 status.
  bool get isOriginIsUnreachableHttp523 =>
      this == StatusCode.originIsUnreachableHttp523;

  /// Determines whether this StatusCode corresponds to an HTTP 524 status.
  bool get isTimeoutOccurredHttp524 =>
      this == StatusCode.timeoutOccurredHttp524;

  /// Determines whether this StatusCode corresponds to an HTTP 525 status.
  bool get isSslHandshakeFailedHttp525 =>
      this == StatusCode.sslHandshakeFailedHttp525;

  /// Determines whether this StatusCode corresponds to an HTTP 526 status.
  bool get isInvalidSSLCertificateHttp526 =>
      this == StatusCode.invalidSSLCertificateHttp526;

  /// Determines whether this StatusCode corresponds to an HTTP 527 status.
  bool get isRailgunErrorHttp527 => this == StatusCode.railgunErrorHttp527;

  /// Determines whether this StatusCode corresponds to an HTTP 460 status.
  bool get isClientClosedConnectionHttp460 =>
      this == StatusCode.clientClosedConnectionHttp460;

  /// Determines whether this StatusCode corresponds to an HTTP 463 status.
  bool get isTooManyIpAddressesHttp463 =>
      this == StatusCode.tooManyIpAddressesHttp463;

  /// Determines whether this StatusCode corresponds to an HTTP 464 status.
  bool get isIncompatibleProtocolVersionsHttp464 =>
      this == StatusCode.incompatibleProtocolVersionsHttp464;

  /// Determines whether this StatusCode corresponds to an HTTP 561 status.
  bool get isUnauthorizedHttp561 => this == StatusCode.unauthorizedHttp561;

  /// Maps the current [StatusCode] object to a value of result type by calling
  /// the corresponding callback function.
  ///
  /// Example:
  /// ```dart
  /// statusCode.map(okHttp200: (_) => 'Success', ...);
  /// ```
  R map<R>({
    required R Function(StatusCode continueHttp100) continueHttp100,
    required R Function(StatusCode switchingProtocolsHttp101)
    switchingProtocolsHttp101,
    required R Function(StatusCode processingHttp102) processingHttp102,
    required R Function(StatusCode earlyHintsHttp103) earlyHintsHttp103,
    required R Function(StatusCode okHttp200) okHttp200,
    required R Function(StatusCode createdHttp201) createdHttp201,
    required R Function(StatusCode acceptedHttp202) acceptedHttp202,
    required R Function(StatusCode nonAuthoritativeInformationHttp203)
    nonAuthoritativeInformationHttp203,
    required R Function(StatusCode noContentHttp204) noContentHttp204,
    required R Function(StatusCode resetContentHttp205) resetContentHttp205,
    required R Function(StatusCode partialContentHttp206) partialContentHttp206,
    required R Function(StatusCode multiStatusHttp207) multiStatusHttp207,
    required R Function(StatusCode alreadyReportedHttp208)
    alreadyReportedHttp208,
    required R Function(StatusCode imUsedHttp226) imUsedHttp226,
    required R Function(StatusCode multipleChoicesHttp300)
    multipleChoicesHttp300,
    required R Function(StatusCode movedPermanentlyHttp301)
    movedPermanentlyHttp301,
    required R Function(StatusCode foundHttp302) foundHttp302,
    required R Function(StatusCode seeOtherHttp303) seeOtherHttp303,
    required R Function(StatusCode notModifiedHttp304) notModifiedHttp304,
    required R Function(StatusCode useProxyHttp305) useProxyHttp305,
    required R Function(StatusCode temporaryRedirectHttp307)
    temporaryRedirectHttp307,
    required R Function(StatusCode permanentRedirectHttp308)
    permanentRedirectHttp308,
    required R Function(StatusCode badRequestHttp400) badRequestHttp400,
    required R Function(StatusCode unauthorizedHttp401) unauthorizedHttp401,
    required R Function(StatusCode paymentRequiredHttp402)
    paymentRequiredHttp402,
    required R Function(StatusCode forbiddenHttp403) forbiddenHttp403,
    required R Function(StatusCode notFoundHttp404) notFoundHttp404,
    required R Function(StatusCode methodNotAllowedHttp405)
    methodNotAllowedHttp405,
    required R Function(StatusCode notAcceptableHttp406) notAcceptableHttp406,
    required R Function(StatusCode proxyAuthenticationRequiredHttp407)
    proxyAuthenticationRequiredHttp407,
    required R Function(StatusCode requestTimeoutHttp408) requestTimeoutHttp408,
    required R Function(StatusCode conflictHttp409) conflictHttp409,
    required R Function(StatusCode goneHttp410) goneHttp410,
    required R Function(StatusCode lengthRequiredHttp411) lengthRequiredHttp411,
    required R Function(StatusCode preconditionFailedHttp412)
    preconditionFailedHttp412,
    required R Function(StatusCode payloadTooLargeHttp413)
    payloadTooLargeHttp413,
    required R Function(StatusCode uriTooLongHttp414) uriTooLongHttp414,
    required R Function(StatusCode unsupportedMediaTypeHttp415)
    unsupportedMediaTypeHttp415,
    required R Function(StatusCode rangeNotSatisfiableHttp416)
    rangeNotSatisfiableHttp416,
    required R Function(StatusCode expectationFailedHttp417)
    expectationFailedHttp417,
    required R Function(StatusCode imATeapotHttp418) imATeapotHttp418,
    required R Function(StatusCode misdirectedRequestHttp421)
    misdirectedRequestHttp421,
    required R Function(StatusCode unprocessableEntityHttp422)
    unprocessableEntityHttp422,
    required R Function(StatusCode lockedHttp423) lockedHttp423,
    required R Function(StatusCode failedDependencyHttp424)
    failedDependencyHttp424,
    required R Function(StatusCode tooEarlyHttp425) tooEarlyHttp425,
    required R Function(StatusCode upgradeRequiredHttp426)
    upgradeRequiredHttp426,
    required R Function(StatusCode preconditionRequiredHttp428)
    preconditionRequiredHttp428,
    required R Function(StatusCode tooManyRequestsHttp429)
    tooManyRequestsHttp429,
    required R Function(StatusCode requestHeaderFieldsTooLargeHttp431)
    requestHeaderFieldsTooLargeHttp431,
    required R Function(StatusCode iisLoginTimeoutHttp440)
    iisLoginTimeoutHttp440,
    required R Function(StatusCode nginxNoResponseHttp444)
    nginxNoResponseHttp444,
    required R Function(StatusCode iisRetryWithHttp449) iisRetryWithHttp449,
    required R Function(StatusCode blockedByWindowsParentalControlsHttp450)
    blockedByWindowsParentalControlsHttp450,
    required R Function(StatusCode unavailableForLegalReasonsHttp451)
    unavailableForLegalReasonsHttp451,
    required R Function(StatusCode nginxSSLCertificateErrorHttp495)
    nginxSSLCertificateErrorHttp495,
    required R Function(StatusCode nginxSSLCertificateRequiredHttp496)
    nginxSSLCertificateRequiredHttp496,
    required R Function(StatusCode nginxHTTPToHTTPSHttp497)
    nginxHTTPToHTTPSHttp497,
    required R Function(StatusCode tokenExpiredHttp498) tokenExpiredHttp498,
    required R Function(StatusCode nginxClientClosedRequestHttp499)
    nginxClientClosedRequestHttp499,
    required R Function(StatusCode internalServerErrorHttp500)
    internalServerErrorHttp500,
    required R Function(StatusCode notImplementedHttp501) notImplementedHttp501,
    required R Function(StatusCode badGatewayHttp502) badGatewayHttp502,
    required R Function(StatusCode serviceUnavailableHttp503)
    serviceUnavailableHttp503,
    required R Function(StatusCode gatewayTimeoutHttp504) gatewayTimeoutHttp504,
    required R Function(StatusCode httpVersionNotSupportedHttp505)
    httpVersionNotSupportedHttp505,
    required R Function(StatusCode variantAlsoNegotiatesHttp506)
    variantAlsoNegotiatesHttp506,
    required R Function(StatusCode insufficientStorageHttp507)
    insufficientStorageHttp507,
    required R Function(StatusCode loopDetectedHttp508) loopDetectedHttp508,
    required R Function(StatusCode bandwidthLimitExceededHttp509)
    bandwidthLimitExceededHttp509,
    required R Function(StatusCode otExtendedHttp510) otExtendedHttp510,
    required R Function(StatusCode networkAuthenticationRequiredHttp511)
    networkAuthenticationRequiredHttp511,
    required R Function(StatusCode siteIsFrozenHttp530) siteIsFrozenHttp530,
    required R Function(StatusCode networkConnectTimeoutErrorHttp599)
    networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    required R Function(StatusCode thisIsFineHttp218) thisIsFineHttp218,
    required R Function(StatusCode pageExpiredHttp419) pageExpiredHttp419,
    required R Function(StatusCode enhanceYourCalmHttp420)
    enhanceYourCalmHttp420,
    required R Function(StatusCode requestHeaderFieldsTooLargeHttp430)
    requestHeaderFieldsTooLargeHttp430,
    required R Function(StatusCode siteIsOverloadedHttp529)
    siteIsOverloadedHttp529,
    required R Function(StatusCode networkReadTimeoutErrorHttp598)
    networkReadTimeoutErrorHttp598,
    required R Function(StatusCode requestHeaderTooLargeHttp494)
    requestHeaderTooLargeHttp494,
    required R Function(StatusCode webServerReturnedUnknownErrorHttp520)
    webServerReturnedUnknownErrorHttp520,
    required R Function(StatusCode webServerIsDownHttp521)
    webServerIsDownHttp521,
    required R Function(StatusCode connectionTimedOutHttp522)
    connectionTimedOutHttp522,
    required R Function(StatusCode originIsUnreachableHttp523)
    originIsUnreachableHttp523,
    required R Function(StatusCode timeoutOccurredHttp524)
    timeoutOccurredHttp524,
    required R Function(StatusCode sslHandshakeFailedHttp525)
    sslHandshakeFailedHttp525,
    required R Function(StatusCode invalidSSLCertificateHttp526)
    invalidSSLCertificateHttp526,
    required R Function(StatusCode railgunErrorHttp527) railgunErrorHttp527,
    required R Function(StatusCode clientClosedConnectionHttp460)
    clientClosedConnectionHttp460,
    required R Function(StatusCode tooManyIpAddressesHttp463)
    tooManyIpAddressesHttp463,
    required R Function(StatusCode incompatibleProtocolVersionsHttp464)
    incompatibleProtocolVersionsHttp464,
    required R Function(StatusCode unauthorizedHttp561) unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100(this),
    StatusCode.switchingProtocolsHttp101 => switchingProtocolsHttp101(this),
    StatusCode.processingHttp102 => processingHttp102(this),
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103(this),
    StatusCode.okHttp200 => okHttp200(this),
    StatusCode.createdHttp201 => createdHttp201(this),
    StatusCode.acceptedHttp202 => acceptedHttp202(this),
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203(this),
    StatusCode.noContentHttp204 => noContentHttp204(this),
    StatusCode.resetContentHttp205 => resetContentHttp205(this),
    StatusCode.partialContentHttp206 => partialContentHttp206(this),
    StatusCode.multiStatusHttp207 => multiStatusHttp207(this),
    StatusCode.alreadyReportedHttp208 => alreadyReportedHttp208(this),
    StatusCode.imUsedHttp226 => imUsedHttp226(this),
    StatusCode.multipleChoicesHttp300 => multipleChoicesHttp300(this),
    StatusCode.movedPermanentlyHttp301 => movedPermanentlyHttp301(this),
    StatusCode.foundHttp302 => foundHttp302(this),
    StatusCode.seeOtherHttp303 => seeOtherHttp303(this),
    StatusCode.notModifiedHttp304 => notModifiedHttp304(this),
    StatusCode.useProxyHttp305 => useProxyHttp305(this),
    StatusCode.temporaryRedirectHttp307 => temporaryRedirectHttp307(this),
    StatusCode.permanentRedirectHttp308 => permanentRedirectHttp308(this),
    StatusCode.badRequestHttp400 => badRequestHttp400(this),
    StatusCode.unauthorizedHttp401 => unauthorizedHttp401(this),
    StatusCode.paymentRequiredHttp402 => paymentRequiredHttp402(this),
    StatusCode.forbiddenHttp403 => forbiddenHttp403(this),
    StatusCode.notFoundHttp404 => notFoundHttp404(this),
    StatusCode.methodNotAllowedHttp405 => methodNotAllowedHttp405(this),
    StatusCode.notAcceptableHttp406 => notAcceptableHttp406(this),
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407(this),
    StatusCode.requestTimeoutHttp408 => requestTimeoutHttp408(this),
    StatusCode.conflictHttp409 => conflictHttp409(this),
    StatusCode.goneHttp410 => goneHttp410(this),
    StatusCode.lengthRequiredHttp411 => lengthRequiredHttp411(this),
    StatusCode.preconditionFailedHttp412 => preconditionFailedHttp412(this),
    StatusCode.payloadTooLargeHttp413 => payloadTooLargeHttp413(this),
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414(this),
    StatusCode.unsupportedMediaTypeHttp415 => unsupportedMediaTypeHttp415(this),
    StatusCode.rangeNotSatisfiableHttp416 => rangeNotSatisfiableHttp416(this),
    StatusCode.expectationFailedHttp417 => expectationFailedHttp417(this),
    StatusCode.imATeapotHttp418 => imATeapotHttp418(this),
    StatusCode.misdirectedRequestHttp421 => misdirectedRequestHttp421(this),
    StatusCode.unprocessableEntityHttp422 => unprocessableEntityHttp422(this),
    StatusCode.lockedHttp423 => lockedHttp423(this),
    StatusCode.failedDependencyHttp424 => failedDependencyHttp424(this),
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425(this),
    StatusCode.upgradeRequiredHttp426 => upgradeRequiredHttp426(this),
    StatusCode.preconditionRequiredHttp428 => preconditionRequiredHttp428(this),
    StatusCode.tooManyRequestsHttp429 => tooManyRequestsHttp429(this),
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431(this),
    StatusCode.iisLoginTimeoutHttp440 => iisLoginTimeoutHttp440(this),
    StatusCode.nginxNoResponseHttp444 => nginxNoResponseHttp444(this),
    StatusCode.iisRetryWithHttp449 => iisRetryWithHttp449(this),
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450(this),
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451(this),
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495(this),
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496(this),
    StatusCode.nginxHTTPToHTTPSHttp497 => nginxHTTPToHTTPSHttp497(this),
    StatusCode.tokenExpiredHttp498 => tokenExpiredHttp498(this),
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499(this),
    StatusCode.internalServerErrorHttp500 => internalServerErrorHttp500(this),
    StatusCode.notImplementedHttp501 => notImplementedHttp501(this),
    StatusCode.badGatewayHttp502 => badGatewayHttp502(this),
    StatusCode.serviceUnavailableHttp503 => serviceUnavailableHttp503(this),
    StatusCode.gatewayTimeoutHttp504 => gatewayTimeoutHttp504(this),
    StatusCode.httpVersionNotSupportedHttp505 => httpVersionNotSupportedHttp505(
      this,
    ),
    StatusCode.variantAlsoNegotiatesHttp506 => variantAlsoNegotiatesHttp506(
      this,
    ),
    StatusCode.insufficientStorageHttp507 => insufficientStorageHttp507(this),
    StatusCode.loopDetectedHttp508 => loopDetectedHttp508(this),
    StatusCode.bandwidthLimitExceededHttp509 => bandwidthLimitExceededHttp509(
      this,
    ),
    StatusCode.otExtendedHttp510 => otExtendedHttp510(this),
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511(this),
    StatusCode.siteIsFrozenHttp530 => siteIsFrozenHttp530(this),
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599(this),
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218(this),
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419(this),
    StatusCode.enhanceYourCalmHttp420 => enhanceYourCalmHttp420(this),
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430(this),
    StatusCode.siteIsOverloadedHttp529 => siteIsOverloadedHttp529(this),
    StatusCode.networkReadTimeoutErrorHttp598 => networkReadTimeoutErrorHttp598(
      this,
    ),
    StatusCode.requestHeaderTooLargeHttp494 => requestHeaderTooLargeHttp494(
      this,
    ),
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520(this),
    StatusCode.webServerIsDownHttp521 => webServerIsDownHttp521(this),
    StatusCode.connectionTimedOutHttp522 => connectionTimedOutHttp522(this),
    StatusCode.originIsUnreachableHttp523 => originIsUnreachableHttp523(this),
    StatusCode.timeoutOccurredHttp524 => timeoutOccurredHttp524(this),
    StatusCode.sslHandshakeFailedHttp525 => sslHandshakeFailedHttp525(this),
    StatusCode.invalidSSLCertificateHttp526 => invalidSSLCertificateHttp526(
      this,
    ),
    StatusCode.railgunErrorHttp527 => railgunErrorHttp527(this),
    StatusCode.clientClosedConnectionHttp460 => clientClosedConnectionHttp460(
      this,
    ),
    StatusCode.tooManyIpAddressesHttp463 => tooManyIpAddressesHttp463(this),
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464(this),
    _ => unauthorizedHttp561(this),
  };

  /// Maps the status code to a value of return type using the provided
  /// functions. If the status code has no corresponding function, returns
  /// calls [orElse].
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = StatusCode.okHttp200;
  /// final value = statusCode.maybeMap(
  ///  okHttp200: (status) => 'OK',
  ///  orElse:  =>  'Not OK',
  /// );
  /// print(value); // Output: 'OK'
  /// ```
  R maybeMap<R>({
    required R Function() orElse,
    R Function(StatusCode continueHttp100)? continueHttp100,
    R Function(StatusCode switchingProtocolsHttp101)? switchingProtocolsHttp101,
    R Function(StatusCode processingHttp102)? processingHttp102,
    R Function(StatusCode earlyHintsHttp103)? earlyHintsHttp103,
    R Function(StatusCode okHttp200)? okHttp200,
    R Function(StatusCode createdHttp201)? createdHttp201,
    R Function(StatusCode acceptedHttp202)? acceptedHttp202,
    R Function(StatusCode nonAuthoritativeInformationHttp203)?
    nonAuthoritativeInformationHttp203,
    R Function(StatusCode noContentHttp204)? noContentHttp204,
    R Function(StatusCode resetContentHttp205)? resetContentHttp205,
    R Function(StatusCode partialContentHttp206)? partialContentHttp206,
    R Function(StatusCode multiStatusHttp207)? multiStatusHttp207,
    R Function(StatusCode alreadyReportedHttp208)? alreadyReportedHttp208,
    R Function(StatusCode imUsedHttp226)? imUsedHttp226,
    R Function(StatusCode multipleChoicesHttp300)? multipleChoicesHttp300,
    R Function(StatusCode movedPermanentlyHttp301)? movedPermanentlyHttp301,
    R Function(StatusCode foundHttp302)? foundHttp302,
    R Function(StatusCode seeOtherHttp303)? seeOtherHttp303,
    R Function(StatusCode notModifiedHttp304)? notModifiedHttp304,
    R Function(StatusCode useProxyHttp305)? useProxyHttp305,
    R Function(StatusCode temporaryRedirectHttp307)? temporaryRedirectHttp307,
    R Function(StatusCode permanentRedirectHttp308)? permanentRedirectHttp308,
    R Function(StatusCode badRequestHttp400)? badRequestHttp400,
    R Function(StatusCode unauthorizedHttp401)? unauthorizedHttp401,
    R Function(StatusCode paymentRequiredHttp402)? paymentRequiredHttp402,
    R Function(StatusCode forbiddenHttp403)? forbiddenHttp403,
    R Function(StatusCode notFoundHttp404)? notFoundHttp404,
    R Function(StatusCode methodNotAllowedHttp405)? methodNotAllowedHttp405,
    R Function(StatusCode notAcceptableHttp406)? notAcceptableHttp406,
    R Function(StatusCode proxyAuthenticationRequiredHttp407)?
    proxyAuthenticationRequiredHttp407,
    R Function(StatusCode requestTimeoutHttp408)? requestTimeoutHttp408,
    R Function(StatusCode conflictHttp409)? conflictHttp409,
    R Function(StatusCode goneHttp410)? goneHttp410,
    R Function(StatusCode lengthRequiredHttp411)? lengthRequiredHttp411,
    R Function(StatusCode preconditionFailedHttp412)? preconditionFailedHttp412,
    R Function(StatusCode payloadTooLargeHttp413)? payloadTooLargeHttp413,
    R Function(StatusCode uriTooLongHttp414)? uriTooLongHttp414,
    R Function(StatusCode unsupportedMediaTypeHttp415)?
    unsupportedMediaTypeHttp415,
    R Function(StatusCode rangeNotSatisfiableHttp416)?
    rangeNotSatisfiableHttp416,
    R Function(StatusCode expectationFailedHttp417)? expectationFailedHttp417,
    R Function(StatusCode imATeapotHttp418)? imATeapotHttp418,
    R Function(StatusCode misdirectedRequestHttp421)? misdirectedRequestHttp421,
    R Function(StatusCode unprocessableEntityHttp422)?
    unprocessableEntityHttp422,
    R Function(StatusCode lockedHttp423)? lockedHttp423,
    R Function(StatusCode failedDependencyHttp424)? failedDependencyHttp424,
    R Function(StatusCode tooEarlyHttp425)? tooEarlyHttp425,
    R Function(StatusCode upgradeRequiredHttp426)? upgradeRequiredHttp426,
    R Function(StatusCode preconditionRequiredHttp428)?
    preconditionRequiredHttp428,
    R Function(StatusCode tooManyRequestsHttp429)? tooManyRequestsHttp429,
    R Function(StatusCode requestHeaderFieldsTooLargeHttp431)?
    requestHeaderFieldsTooLargeHttp431,
    R Function(StatusCode iisLoginTimeoutHttp440)? iisLoginTimeoutHttp440,
    R Function(StatusCode nginxNoResponseHttp444)? nginxNoResponseHttp444,
    R Function(StatusCode iisRetryWithHttp449)? iisRetryWithHttp449,
    R Function(StatusCode blockedByWindowsParentalControlsHttp450)?
    blockedByWindowsParentalControlsHttp450,
    R Function(StatusCode unavailableForLegalReasonsHttp451)?
    unavailableForLegalReasonsHttp451,
    R Function(StatusCode nginxSSLCertificateErrorHttp495)?
    nginxSSLCertificateErrorHttp495,
    R Function(StatusCode nginxSSLCertificateRequiredHttp496)?
    nginxSSLCertificateRequiredHttp496,
    R Function(StatusCode nginxHTTPToHTTPSHttp497)? nginxHTTPToHTTPSHttp497,
    R Function(StatusCode tokenExpiredHttp498)? tokenExpiredHttp498,
    R Function(StatusCode nginxClientClosedRequestHttp499)?
    nginxClientClosedRequestHttp499,
    R Function(StatusCode internalServerErrorHttp500)?
    internalServerErrorHttp500,
    R Function(StatusCode notImplementedHttp501)? notImplementedHttp501,
    R Function(StatusCode badGatewayHttp502)? badGatewayHttp502,
    R Function(StatusCode serviceUnavailableHttp503)? serviceUnavailableHttp503,
    R Function(StatusCode gatewayTimeoutHttp504)? gatewayTimeoutHttp504,
    R Function(StatusCode httpVersionNotSupportedHttp505)?
    httpVersionNotSupportedHttp505,
    R Function(StatusCode variantAlsoNegotiatesHttp506)?
    variantAlsoNegotiatesHttp506,
    R Function(StatusCode insufficientStorageHttp507)?
    insufficientStorageHttp507,
    R Function(StatusCode loopDetectedHttp508)? loopDetectedHttp508,
    R Function(StatusCode bandwidthLimitExceededHttp509)?
    bandwidthLimitExceededHttp509,
    R Function(StatusCode otExtendedHttp510)? otExtendedHttp510,
    R Function(StatusCode networkAuthenticationRequiredHttp511)?
    networkAuthenticationRequiredHttp511,
    R Function(StatusCode siteIsFrozenHttp530)? siteIsFrozenHttp530,
    R Function(StatusCode networkConnectTimeoutErrorHttp599)?
    networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    R Function(StatusCode thisIsFineHttp218)? thisIsFineHttp218,
    R Function(StatusCode pageExpiredHttp419)? pageExpiredHttp419,
    R Function(StatusCode enhanceYourCalmHttp420)? enhanceYourCalmHttp420,
    R Function(StatusCode requestHeaderFieldsTooLargeHttp430)?
    requestHeaderFieldsTooLargeHttp430,
    R Function(StatusCode siteIsOverloadedHttp529)? siteIsOverloadedHttp529,
    R Function(StatusCode networkReadTimeoutErrorHttp598)?
    networkReadTimeoutErrorHttp598,
    R Function(StatusCode requestHeaderTooLargeHttp494)?
    requestHeaderTooLargeHttp494,
    R Function(StatusCode webServerReturnedUnknownErrorHttp520)?
    webServerReturnedUnknownErrorHttp520,
    R Function(StatusCode webServerIsDownHttp521)? webServerIsDownHttp521,
    R Function(StatusCode connectionTimedOutHttp522)? connectionTimedOutHttp522,
    R Function(StatusCode originIsUnreachableHttp523)?
    originIsUnreachableHttp523,
    R Function(StatusCode timeoutOccurredHttp524)? timeoutOccurredHttp524,
    R Function(StatusCode sslHandshakeFailedHttp525)? sslHandshakeFailedHttp525,
    R Function(StatusCode invalidSSLCertificateHttp526)?
    invalidSSLCertificateHttp526,
    R Function(StatusCode railgunErrorHttp527)? railgunErrorHttp527,
    R Function(StatusCode clientClosedConnectionHttp460)?
    clientClosedConnectionHttp460,
    R Function(StatusCode tooManyIpAddressesHttp463)? tooManyIpAddressesHttp463,
    R Function(StatusCode incompatibleProtocolVersionsHttp464)?
    incompatibleProtocolVersionsHttp464,
    R Function(StatusCode unauthorizedHttp561)? unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100?.call(this) ?? orElse(),
    StatusCode.switchingProtocolsHttp101 =>
      switchingProtocolsHttp101?.call(this) ?? orElse(),
    StatusCode.processingHttp102 => processingHttp102?.call(this) ?? orElse(),
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103?.call(this) ?? orElse(),
    StatusCode.okHttp200 => okHttp200?.call(this) ?? orElse(),
    StatusCode.createdHttp201 => createdHttp201?.call(this) ?? orElse(),
    StatusCode.acceptedHttp202 => acceptedHttp202?.call(this) ?? orElse(),
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203?.call(this) ?? orElse(),
    StatusCode.noContentHttp204 => noContentHttp204?.call(this) ?? orElse(),
    StatusCode.resetContentHttp205 =>
      resetContentHttp205?.call(this) ?? orElse(),
    StatusCode.partialContentHttp206 =>
      partialContentHttp206?.call(this) ?? orElse(),
    StatusCode.multiStatusHttp207 => multiStatusHttp207?.call(this) ?? orElse(),
    StatusCode.alreadyReportedHttp208 =>
      alreadyReportedHttp208?.call(this) ?? orElse(),
    StatusCode.imUsedHttp226 => imUsedHttp226?.call(this) ?? orElse(),
    StatusCode.multipleChoicesHttp300 =>
      multipleChoicesHttp300?.call(this) ?? orElse(),
    StatusCode.movedPermanentlyHttp301 =>
      movedPermanentlyHttp301?.call(this) ?? orElse(),
    StatusCode.foundHttp302 => foundHttp302?.call(this) ?? orElse(),
    StatusCode.seeOtherHttp303 => seeOtherHttp303?.call(this) ?? orElse(),
    StatusCode.notModifiedHttp304 => notModifiedHttp304?.call(this) ?? orElse(),
    StatusCode.useProxyHttp305 => useProxyHttp305?.call(this) ?? orElse(),
    StatusCode.temporaryRedirectHttp307 =>
      temporaryRedirectHttp307?.call(this) ?? orElse(),
    StatusCode.permanentRedirectHttp308 =>
      permanentRedirectHttp308?.call(this) ?? orElse(),
    StatusCode.badRequestHttp400 => badRequestHttp400?.call(this) ?? orElse(),
    StatusCode.unauthorizedHttp401 =>
      unauthorizedHttp401?.call(this) ?? orElse(),
    StatusCode.paymentRequiredHttp402 =>
      paymentRequiredHttp402?.call(this) ?? orElse(),
    StatusCode.forbiddenHttp403 => forbiddenHttp403?.call(this) ?? orElse(),
    StatusCode.notFoundHttp404 => notFoundHttp404?.call(this) ?? orElse(),
    StatusCode.methodNotAllowedHttp405 =>
      methodNotAllowedHttp405?.call(this) ?? orElse(),
    StatusCode.notAcceptableHttp406 =>
      notAcceptableHttp406?.call(this) ?? orElse(),
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407?.call(this) ?? orElse(),
    StatusCode.requestTimeoutHttp408 =>
      requestTimeoutHttp408?.call(this) ?? orElse(),
    StatusCode.conflictHttp409 => conflictHttp409?.call(this) ?? orElse(),
    StatusCode.goneHttp410 => goneHttp410?.call(this) ?? orElse(),
    StatusCode.lengthRequiredHttp411 =>
      lengthRequiredHttp411?.call(this) ?? orElse(),
    StatusCode.preconditionFailedHttp412 =>
      preconditionFailedHttp412?.call(this) ?? orElse(),
    StatusCode.payloadTooLargeHttp413 =>
      payloadTooLargeHttp413?.call(this) ?? orElse(),
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414?.call(this) ?? orElse(),
    StatusCode.unsupportedMediaTypeHttp415 =>
      unsupportedMediaTypeHttp415?.call(this) ?? orElse(),
    StatusCode.rangeNotSatisfiableHttp416 =>
      rangeNotSatisfiableHttp416?.call(this) ?? orElse(),
    StatusCode.expectationFailedHttp417 =>
      expectationFailedHttp417?.call(this) ?? orElse(),
    StatusCode.imATeapotHttp418 => imATeapotHttp418?.call(this) ?? orElse(),
    StatusCode.misdirectedRequestHttp421 =>
      misdirectedRequestHttp421?.call(this) ?? orElse(),
    StatusCode.unprocessableEntityHttp422 =>
      unprocessableEntityHttp422?.call(this) ?? orElse(),
    StatusCode.lockedHttp423 => lockedHttp423?.call(this) ?? orElse(),
    StatusCode.failedDependencyHttp424 =>
      failedDependencyHttp424?.call(this) ?? orElse(),
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425?.call(this) ?? orElse(),
    StatusCode.upgradeRequiredHttp426 =>
      upgradeRequiredHttp426?.call(this) ?? orElse(),
    StatusCode.preconditionRequiredHttp428 =>
      preconditionRequiredHttp428?.call(this) ?? orElse(),
    StatusCode.tooManyRequestsHttp429 =>
      tooManyRequestsHttp429?.call(this) ?? orElse(),
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431?.call(this) ?? orElse(),
    StatusCode.iisLoginTimeoutHttp440 =>
      iisLoginTimeoutHttp440?.call(this) ?? orElse(),
    StatusCode.nginxNoResponseHttp444 =>
      nginxNoResponseHttp444?.call(this) ?? orElse(),
    StatusCode.iisRetryWithHttp449 =>
      iisRetryWithHttp449?.call(this) ?? orElse(),
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450?.call(this) ?? orElse(),
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451?.call(this) ?? orElse(),
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495?.call(this) ?? orElse(),
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496?.call(this) ?? orElse(),
    StatusCode.nginxHTTPToHTTPSHttp497 =>
      nginxHTTPToHTTPSHttp497?.call(this) ?? orElse(),
    StatusCode.tokenExpiredHttp498 =>
      tokenExpiredHttp498?.call(this) ?? orElse(),
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499?.call(this) ?? orElse(),
    StatusCode.internalServerErrorHttp500 =>
      internalServerErrorHttp500?.call(this) ?? orElse(),
    StatusCode.notImplementedHttp501 =>
      notImplementedHttp501?.call(this) ?? orElse(),
    StatusCode.badGatewayHttp502 => badGatewayHttp502?.call(this) ?? orElse(),
    StatusCode.serviceUnavailableHttp503 =>
      serviceUnavailableHttp503?.call(this) ?? orElse(),
    StatusCode.gatewayTimeoutHttp504 =>
      gatewayTimeoutHttp504?.call(this) ?? orElse(),
    StatusCode.httpVersionNotSupportedHttp505 =>
      httpVersionNotSupportedHttp505?.call(this) ?? orElse(),
    StatusCode.variantAlsoNegotiatesHttp506 =>
      variantAlsoNegotiatesHttp506?.call(this) ?? orElse(),
    StatusCode.insufficientStorageHttp507 =>
      insufficientStorageHttp507?.call(this) ?? orElse(),
    StatusCode.loopDetectedHttp508 =>
      loopDetectedHttp508?.call(this) ?? orElse(),
    StatusCode.bandwidthLimitExceededHttp509 =>
      bandwidthLimitExceededHttp509?.call(this) ?? orElse(),
    StatusCode.otExtendedHttp510 => otExtendedHttp510?.call(this) ?? orElse(),
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511?.call(this) ?? orElse(),
    StatusCode.siteIsFrozenHttp530 =>
      siteIsFrozenHttp530?.call(this) ?? orElse(),
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599?.call(this) ?? orElse(),
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218?.call(this) ?? orElse(),
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419?.call(this) ?? orElse(),
    StatusCode.enhanceYourCalmHttp420 =>
      enhanceYourCalmHttp420?.call(this) ?? orElse(),
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430?.call(this) ?? orElse(),
    StatusCode.siteIsOverloadedHttp529 =>
      siteIsOverloadedHttp529?.call(this) ?? orElse(),
    StatusCode.networkReadTimeoutErrorHttp598 =>
      networkReadTimeoutErrorHttp598?.call(this) ?? orElse(),
    StatusCode.requestHeaderTooLargeHttp494 =>
      requestHeaderTooLargeHttp494?.call(this) ?? orElse(),
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520?.call(this) ?? orElse(),
    StatusCode.webServerIsDownHttp521 =>
      webServerIsDownHttp521?.call(this) ?? orElse(),
    StatusCode.connectionTimedOutHttp522 =>
      connectionTimedOutHttp522?.call(this) ?? orElse(),
    StatusCode.originIsUnreachableHttp523 =>
      originIsUnreachableHttp523?.call(this) ?? orElse(),
    StatusCode.timeoutOccurredHttp524 =>
      timeoutOccurredHttp524?.call(this) ?? orElse(),
    StatusCode.sslHandshakeFailedHttp525 =>
      sslHandshakeFailedHttp525?.call(this) ?? orElse(),
    StatusCode.invalidSSLCertificateHttp526 =>
      invalidSSLCertificateHttp526?.call(this) ?? orElse(),
    StatusCode.railgunErrorHttp527 =>
      railgunErrorHttp527?.call(this) ?? orElse(),
    StatusCode.clientClosedConnectionHttp460 =>
      clientClosedConnectionHttp460?.call(this) ?? orElse(),
    StatusCode.tooManyIpAddressesHttp463 =>
      tooManyIpAddressesHttp463?.call(this) ?? orElse(),
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464?.call(this) ?? orElse(),
    StatusCode.unauthorizedHttp561 =>
      unauthorizedHttp561?.call(this) ?? orElse(),
    _ => orElse(),
  };

  /// Returns the result of calling the appropriate callback based on the status
  /// code. If no matching callback is provided, returns the result of calling
  /// [orElse].
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = StatusCode.okHttp200;
  /// final result = statusCode.maybeWhen(
  ///   okHttp200:  =>  'Success!',
  ///   orElse:  =>  'Error',
  /// );
  /// print(result); // Output: 'Success!'
  /// ```
  R maybeWhen<R>({
    required R Function() orElse,
    R Function()? continueHttp100,
    R Function()? switchingProtocolsHttp101,
    R Function()? processingHttp102,
    R Function()? earlyHintsHttp103,
    R Function()? okHttp200,
    R Function()? createdHttp201,
    R Function()? acceptedHttp202,
    R Function()? nonAuthoritativeInformationHttp203,
    R Function()? noContentHttp204,
    R Function()? resetContentHttp205,
    R Function()? partialContentHttp206,
    R Function()? multiStatusHttp207,
    R Function()? alreadyReportedHttp208,
    R Function()? imUsedHttp226,
    R Function()? multipleChoicesHttp300,
    R Function()? movedPermanentlyHttp301,
    R Function()? foundHttp302,
    R Function()? seeOtherHttp303,
    R Function()? notModifiedHttp304,
    R Function()? useProxyHttp305,
    R Function()? temporaryRedirectHttp307,
    R Function()? permanentRedirectHttp308,
    R Function()? badRequestHttp400,
    R Function()? unauthorizedHttp401,
    R Function()? paymentRequiredHttp402,
    R Function()? forbiddenHttp403,
    R Function()? notFoundHttp404,
    R Function()? methodNotAllowedHttp405,
    R Function()? notAcceptableHttp406,
    R Function()? proxyAuthenticationRequiredHttp407,
    R Function()? requestTimeoutHttp408,
    R Function()? conflictHttp409,
    R Function()? goneHttp410,
    R Function()? lengthRequiredHttp411,
    R Function()? preconditionFailedHttp412,
    R Function()? payloadTooLargeHttp413,
    R Function()? uriTooLongHttp414,
    R Function()? unsupportedMediaTypeHttp415,
    R Function()? rangeNotSatisfiableHttp416,
    R Function()? expectationFailedHttp417,
    R Function()? imATeapotHttp418,
    R Function()? misdirectedRequestHttp421,
    R Function()? unprocessableEntityHttp422,
    R Function()? lockedHttp423,
    R Function()? failedDependencyHttp424,
    R Function()? tooEarlyHttp425,
    R Function()? upgradeRequiredHttp426,
    R Function()? preconditionRequiredHttp428,
    R Function()? tooManyRequestsHttp429,
    R Function()? requestHeaderFieldsTooLargeHttp431,
    R Function()? iisLoginTimeoutHttp440,
    R Function()? nginxNoResponseHttp444,
    R Function()? iisRetryWithHttp449,
    R Function()? blockedByWindowsParentalControlsHttp450,
    R Function()? unavailableForLegalReasonsHttp451,
    R Function()? nginxSSLCertificateErrorHttp495,
    R Function()? nginxSSLCertificateRequiredHttp496,
    R Function()? nginxHTTPToHTTPSHttp497,
    R Function()? tokenExpiredHttp498,
    R Function()? nginxClientClosedRequestHttp499,
    R Function()? internalServerErrorHttp500,
    R Function()? notImplementedHttp501,
    R Function()? badGatewayHttp502,
    R Function()? serviceUnavailableHttp503,
    R Function()? gatewayTimeoutHttp504,
    R Function()? httpVersionNotSupportedHttp505,
    R Function()? variantAlsoNegotiatesHttp506,
    R Function()? insufficientStorageHttp507,
    R Function()? loopDetectedHttp508,
    R Function()? bandwidthLimitExceededHttp509,
    R Function()? otExtendedHttp510,
    R Function()? networkAuthenticationRequiredHttp511,
    R Function()? siteIsFrozenHttp530,
    R Function()? networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    R Function()? thisIsFineHttp218,
    R Function()? pageExpiredHttp419,
    R Function()? enhanceYourCalmHttp420,
    R Function()? requestHeaderFieldsTooLargeHttp430,
    R Function()? siteIsOverloadedHttp529,
    R Function()? networkReadTimeoutErrorHttp598,
    R Function()? requestHeaderTooLargeHttp494,
    R Function()? webServerReturnedUnknownErrorHttp520,
    R Function()? webServerIsDownHttp521,
    R Function()? connectionTimedOutHttp522,
    R Function()? originIsUnreachableHttp523,
    R Function()? timeoutOccurredHttp524,
    R Function()? sslHandshakeFailedHttp525,
    R Function()? invalidSSLCertificateHttp526,
    R Function()? railgunErrorHttp527,
    R Function()? clientClosedConnectionHttp460,
    R Function()? tooManyIpAddressesHttp463,
    R Function()? incompatibleProtocolVersionsHttp464,
    R Function()? unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100?.call() ?? orElse(),
    StatusCode.switchingProtocolsHttp101 =>
      switchingProtocolsHttp101?.call() ?? orElse(),
    StatusCode.processingHttp102 => processingHttp102?.call() ?? orElse(),
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103?.call() ?? orElse(),
    StatusCode.okHttp200 => okHttp200?.call() ?? orElse(),
    StatusCode.createdHttp201 => createdHttp201?.call() ?? orElse(),
    StatusCode.acceptedHttp202 => acceptedHttp202?.call() ?? orElse(),
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203?.call() ?? orElse(),
    StatusCode.noContentHttp204 => noContentHttp204?.call() ?? orElse(),
    StatusCode.resetContentHttp205 => resetContentHttp205?.call() ?? orElse(),
    StatusCode.partialContentHttp206 =>
      partialContentHttp206?.call() ?? orElse(),
    StatusCode.multiStatusHttp207 => multiStatusHttp207?.call() ?? orElse(),
    StatusCode.alreadyReportedHttp208 =>
      alreadyReportedHttp208?.call() ?? orElse(),
    StatusCode.imUsedHttp226 => imUsedHttp226?.call() ?? orElse(),
    StatusCode.multipleChoicesHttp300 =>
      multipleChoicesHttp300?.call() ?? orElse(),
    StatusCode.movedPermanentlyHttp301 =>
      movedPermanentlyHttp301?.call() ?? orElse(),
    StatusCode.foundHttp302 => foundHttp302?.call() ?? orElse(),
    StatusCode.seeOtherHttp303 => seeOtherHttp303?.call() ?? orElse(),
    StatusCode.notModifiedHttp304 => notModifiedHttp304?.call() ?? orElse(),
    StatusCode.useProxyHttp305 => useProxyHttp305?.call() ?? orElse(),
    StatusCode.temporaryRedirectHttp307 =>
      temporaryRedirectHttp307?.call() ?? orElse(),
    StatusCode.permanentRedirectHttp308 =>
      permanentRedirectHttp308?.call() ?? orElse(),
    StatusCode.badRequestHttp400 => badRequestHttp400?.call() ?? orElse(),
    StatusCode.unauthorizedHttp401 => unauthorizedHttp401?.call() ?? orElse(),
    StatusCode.paymentRequiredHttp402 =>
      paymentRequiredHttp402?.call() ?? orElse(),
    StatusCode.forbiddenHttp403 => forbiddenHttp403?.call() ?? orElse(),
    StatusCode.notFoundHttp404 => notFoundHttp404?.call() ?? orElse(),
    StatusCode.methodNotAllowedHttp405 =>
      methodNotAllowedHttp405?.call() ?? orElse(),
    StatusCode.notAcceptableHttp406 => notAcceptableHttp406?.call() ?? orElse(),
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407?.call() ?? orElse(),
    StatusCode.requestTimeoutHttp408 =>
      requestTimeoutHttp408?.call() ?? orElse(),
    StatusCode.conflictHttp409 => conflictHttp409?.call() ?? orElse(),
    StatusCode.goneHttp410 => goneHttp410?.call() ?? orElse(),
    StatusCode.lengthRequiredHttp411 =>
      lengthRequiredHttp411?.call() ?? orElse(),
    StatusCode.preconditionFailedHttp412 =>
      preconditionFailedHttp412?.call() ?? orElse(),
    StatusCode.payloadTooLargeHttp413 =>
      payloadTooLargeHttp413?.call() ?? orElse(),
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414?.call() ?? orElse(),
    StatusCode.unsupportedMediaTypeHttp415 =>
      unsupportedMediaTypeHttp415?.call() ?? orElse(),
    StatusCode.rangeNotSatisfiableHttp416 =>
      rangeNotSatisfiableHttp416?.call() ?? orElse(),
    StatusCode.expectationFailedHttp417 =>
      expectationFailedHttp417?.call() ?? orElse(),
    StatusCode.imATeapotHttp418 => imATeapotHttp418?.call() ?? orElse(),
    StatusCode.misdirectedRequestHttp421 =>
      misdirectedRequestHttp421?.call() ?? orElse(),
    StatusCode.unprocessableEntityHttp422 =>
      unprocessableEntityHttp422?.call() ?? orElse(),
    StatusCode.lockedHttp423 => lockedHttp423?.call() ?? orElse(),
    StatusCode.failedDependencyHttp424 =>
      failedDependencyHttp424?.call() ?? orElse(),
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425?.call() ?? orElse(),
    StatusCode.upgradeRequiredHttp426 =>
      upgradeRequiredHttp426?.call() ?? orElse(),
    StatusCode.preconditionRequiredHttp428 =>
      preconditionRequiredHttp428?.call() ?? orElse(),
    StatusCode.tooManyRequestsHttp429 =>
      tooManyRequestsHttp429?.call() ?? orElse(),
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431?.call() ?? orElse(),
    StatusCode.iisLoginTimeoutHttp440 =>
      iisLoginTimeoutHttp440?.call() ?? orElse(),
    StatusCode.nginxNoResponseHttp444 =>
      nginxNoResponseHttp444?.call() ?? orElse(),
    StatusCode.iisRetryWithHttp449 => iisRetryWithHttp449?.call() ?? orElse(),
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450?.call() ?? orElse(),
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451?.call() ?? orElse(),
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495?.call() ?? orElse(),
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496?.call() ?? orElse(),
    StatusCode.nginxHTTPToHTTPSHttp497 =>
      nginxHTTPToHTTPSHttp497?.call() ?? orElse(),
    StatusCode.tokenExpiredHttp498 => tokenExpiredHttp498?.call() ?? orElse(),
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499?.call() ?? orElse(),
    StatusCode.internalServerErrorHttp500 =>
      internalServerErrorHttp500?.call() ?? orElse(),
    StatusCode.notImplementedHttp501 =>
      notImplementedHttp501?.call() ?? orElse(),
    StatusCode.badGatewayHttp502 => badGatewayHttp502?.call() ?? orElse(),
    StatusCode.serviceUnavailableHttp503 =>
      serviceUnavailableHttp503?.call() ?? orElse(),
    StatusCode.gatewayTimeoutHttp504 =>
      gatewayTimeoutHttp504?.call() ?? orElse(),
    StatusCode.httpVersionNotSupportedHttp505 =>
      httpVersionNotSupportedHttp505?.call() ?? orElse(),
    StatusCode.variantAlsoNegotiatesHttp506 =>
      variantAlsoNegotiatesHttp506?.call() ?? orElse(),
    StatusCode.insufficientStorageHttp507 =>
      insufficientStorageHttp507?.call() ?? orElse(),
    StatusCode.loopDetectedHttp508 => loopDetectedHttp508?.call() ?? orElse(),
    StatusCode.bandwidthLimitExceededHttp509 =>
      bandwidthLimitExceededHttp509?.call() ?? orElse(),
    StatusCode.otExtendedHttp510 => otExtendedHttp510?.call() ?? orElse(),
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511?.call() ?? orElse(),
    StatusCode.siteIsFrozenHttp530 => siteIsFrozenHttp530?.call() ?? orElse(),
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599?.call() ?? orElse(),
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218?.call() ?? orElse(),
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419?.call() ?? orElse(),
    StatusCode.enhanceYourCalmHttp420 =>
      enhanceYourCalmHttp420?.call() ?? orElse(),
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430?.call() ?? orElse(),
    StatusCode.siteIsOverloadedHttp529 =>
      siteIsOverloadedHttp529?.call() ?? orElse(),
    StatusCode.networkReadTimeoutErrorHttp598 =>
      networkReadTimeoutErrorHttp598?.call() ?? orElse(),
    StatusCode.requestHeaderTooLargeHttp494 =>
      requestHeaderTooLargeHttp494?.call() ?? orElse(),
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520?.call() ?? orElse(),
    StatusCode.webServerIsDownHttp521 =>
      webServerIsDownHttp521?.call() ?? orElse(),
    StatusCode.connectionTimedOutHttp522 =>
      connectionTimedOutHttp522?.call() ?? orElse(),
    StatusCode.originIsUnreachableHttp523 =>
      originIsUnreachableHttp523?.call() ?? orElse(),
    StatusCode.timeoutOccurredHttp524 =>
      timeoutOccurredHttp524?.call() ?? orElse(),
    StatusCode.sslHandshakeFailedHttp525 =>
      sslHandshakeFailedHttp525?.call() ?? orElse(),
    StatusCode.invalidSSLCertificateHttp526 =>
      invalidSSLCertificateHttp526?.call() ?? orElse(),
    StatusCode.railgunErrorHttp527 => railgunErrorHttp527?.call() ?? orElse(),
    StatusCode.clientClosedConnectionHttp460 =>
      clientClosedConnectionHttp460?.call() ?? orElse(),
    StatusCode.tooManyIpAddressesHttp463 =>
      tooManyIpAddressesHttp463?.call() ?? orElse(),
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464?.call() ?? orElse(),
    StatusCode.unauthorizedHttp561 => unauthorizedHttp561?.call() ?? orElse(),
    _ => orElse(),
  };

  /// A method that returns a result of it type, depending on the [StatusCode]
  /// value.
  ///
  /// The [when] method takes a series of required functions as arguments, each
  /// corresponding to a particular [StatusCode] value. If the [StatusCode]
  /// value of status code matches the [StatusCode] value of one of the function
  /// arguments, the corresponding function will be executed and its result
  /// returned.
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = StatusCode.okHttp200;
  /// final response = statusCode.when(
  ///   okHttp200:  =>  'Success',
  ///   badRequestHttp400:  =>  'Bad request',
  /// );
  /// print(response); // prints 'Success'
  /// ```
  R when<R>({
    required R Function() continueHttp100,
    required R Function() switchingProtocolsHttp101,
    required R Function() processingHttp102,
    required R Function() earlyHintsHttp103,
    required R Function() okHttp200,
    required R Function() createdHttp201,
    required R Function() acceptedHttp202,
    required R Function() nonAuthoritativeInformationHttp203,
    required R Function() noContentHttp204,
    required R Function() resetContentHttp205,
    required R Function() partialContentHttp206,
    required R Function() multiStatusHttp207,
    required R Function() alreadyReportedHttp208,
    required R Function() imUsedHttp226,
    required R Function() multipleChoicesHttp300,
    required R Function() movedPermanentlyHttp301,
    required R Function() foundHttp302,
    required R Function() seeOtherHttp303,
    required R Function() notModifiedHttp304,
    required R Function() useProxyHttp305,
    required R Function() temporaryRedirectHttp307,
    required R Function() permanentRedirectHttp308,
    required R Function() badRequestHttp400,
    required R Function() unauthorizedHttp401,
    required R Function() paymentRequiredHttp402,
    required R Function() forbiddenHttp403,
    required R Function() notFoundHttp404,
    required R Function() methodNotAllowedHttp405,
    required R Function() notAcceptableHttp406,
    required R Function() proxyAuthenticationRequiredHttp407,
    required R Function() requestTimeoutHttp408,
    required R Function() conflictHttp409,
    required R Function() goneHttp410,
    required R Function() lengthRequiredHttp411,
    required R Function() preconditionFailedHttp412,
    required R Function() payloadTooLargeHttp413,
    required R Function() uriTooLongHttp414,
    required R Function() unsupportedMediaTypeHttp415,
    required R Function() rangeNotSatisfiableHttp416,
    required R Function() expectationFailedHttp417,
    required R Function() imATeapotHttp418,
    required R Function() misdirectedRequestHttp421,
    required R Function() unprocessableEntityHttp422,
    required R Function() lockedHttp423,
    required R Function() failedDependencyHttp424,
    required R Function() tooEarlyHttp425,
    required R Function() upgradeRequiredHttp426,
    required R Function() preconditionRequiredHttp428,
    required R Function() tooManyRequestsHttp429,
    required R Function() requestHeaderFieldsTooLargeHttp431,
    required R Function() iisLoginTimeoutHttp440,
    required R Function() nginxNoResponseHttp444,
    required R Function() iisRetryWithHttp449,
    required R Function() blockedByWindowsParentalControlsHttp450,
    required R Function() unavailableForLegalReasonsHttp451,
    required R Function() nginxSSLCertificateErrorHttp495,
    required R Function() nginxSSLCertificateRequiredHttp496,
    required R Function() nginxHTTPToHTTPSHttp497,
    required R Function() tokenExpiredHttp498,
    required R Function() nginxClientClosedRequestHttp499,
    required R Function() internalServerErrorHttp500,
    required R Function() notImplementedHttp501,
    required R Function() badGatewayHttp502,
    required R Function() serviceUnavailableHttp503,
    required R Function() gatewayTimeoutHttp504,
    required R Function() httpVersionNotSupportedHttp505,
    required R Function() variantAlsoNegotiatesHttp506,
    required R Function() insufficientStorageHttp507,
    required R Function() loopDetectedHttp508,
    required R Function() bandwidthLimitExceededHttp509,
    required R Function() otExtendedHttp510,
    required R Function() networkAuthenticationRequiredHttp511,
    required R Function() siteIsFrozenHttp530,
    required R Function() networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    required R Function() thisIsFineHttp218,
    required R Function() pageExpiredHttp419,
    required R Function() enhanceYourCalmHttp420,
    required R Function() requestHeaderFieldsTooLargeHttp430,
    required R Function() siteIsOverloadedHttp529,
    required R Function() networkReadTimeoutErrorHttp598,
    required R Function() requestHeaderTooLargeHttp494,
    required R Function() webServerReturnedUnknownErrorHttp520,
    required R Function() webServerIsDownHttp521,
    required R Function() connectionTimedOutHttp522,
    required R Function() originIsUnreachableHttp523,
    required R Function() timeoutOccurredHttp524,
    required R Function() sslHandshakeFailedHttp525,
    required R Function() invalidSSLCertificateHttp526,
    required R Function() railgunErrorHttp527,
    required R Function() clientClosedConnectionHttp460,
    required R Function() tooManyIpAddressesHttp463,
    required R Function() incompatibleProtocolVersionsHttp464,
    required R Function() unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100(),
    StatusCode.switchingProtocolsHttp101 => switchingProtocolsHttp101(),
    StatusCode.processingHttp102 => processingHttp102(),
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103(),
    StatusCode.okHttp200 => okHttp200(),
    StatusCode.createdHttp201 => createdHttp201(),
    StatusCode.acceptedHttp202 => acceptedHttp202(),
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203(),
    StatusCode.noContentHttp204 => noContentHttp204(),
    StatusCode.resetContentHttp205 => resetContentHttp205(),
    StatusCode.partialContentHttp206 => partialContentHttp206(),
    StatusCode.multiStatusHttp207 => multiStatusHttp207(),
    StatusCode.alreadyReportedHttp208 => alreadyReportedHttp208(),
    StatusCode.imUsedHttp226 => imUsedHttp226(),
    StatusCode.multipleChoicesHttp300 => multipleChoicesHttp300(),
    StatusCode.movedPermanentlyHttp301 => movedPermanentlyHttp301(),
    StatusCode.foundHttp302 => foundHttp302(),
    StatusCode.seeOtherHttp303 => seeOtherHttp303(),
    StatusCode.notModifiedHttp304 => notModifiedHttp304(),
    StatusCode.useProxyHttp305 => useProxyHttp305(),
    StatusCode.temporaryRedirectHttp307 => temporaryRedirectHttp307(),
    StatusCode.permanentRedirectHttp308 => permanentRedirectHttp308(),
    StatusCode.badRequestHttp400 => badRequestHttp400(),
    StatusCode.unauthorizedHttp401 => unauthorizedHttp401(),
    StatusCode.paymentRequiredHttp402 => paymentRequiredHttp402(),
    StatusCode.forbiddenHttp403 => forbiddenHttp403(),
    StatusCode.notFoundHttp404 => notFoundHttp404(),
    StatusCode.methodNotAllowedHttp405 => methodNotAllowedHttp405(),
    StatusCode.notAcceptableHttp406 => notAcceptableHttp406(),
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407(),
    StatusCode.requestTimeoutHttp408 => requestTimeoutHttp408(),
    StatusCode.conflictHttp409 => conflictHttp409(),
    StatusCode.goneHttp410 => goneHttp410(),
    StatusCode.lengthRequiredHttp411 => lengthRequiredHttp411(),
    StatusCode.preconditionFailedHttp412 => preconditionFailedHttp412(),
    StatusCode.payloadTooLargeHttp413 => payloadTooLargeHttp413(),
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414(),
    StatusCode.unsupportedMediaTypeHttp415 => unsupportedMediaTypeHttp415(),
    StatusCode.rangeNotSatisfiableHttp416 => rangeNotSatisfiableHttp416(),
    StatusCode.expectationFailedHttp417 => expectationFailedHttp417(),
    StatusCode.imATeapotHttp418 => imATeapotHttp418(),
    StatusCode.misdirectedRequestHttp421 => misdirectedRequestHttp421(),
    StatusCode.unprocessableEntityHttp422 => unprocessableEntityHttp422(),
    StatusCode.lockedHttp423 => lockedHttp423(),
    StatusCode.failedDependencyHttp424 => failedDependencyHttp424(),
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425(),
    StatusCode.upgradeRequiredHttp426 => upgradeRequiredHttp426(),
    StatusCode.preconditionRequiredHttp428 => preconditionRequiredHttp428(),
    StatusCode.tooManyRequestsHttp429 => tooManyRequestsHttp429(),
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431(),
    StatusCode.iisLoginTimeoutHttp440 => iisLoginTimeoutHttp440(),
    StatusCode.nginxNoResponseHttp444 => nginxNoResponseHttp444(),
    StatusCode.iisRetryWithHttp449 => iisRetryWithHttp449(),
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450(),
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451(),
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495(),
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496(),
    StatusCode.nginxHTTPToHTTPSHttp497 => nginxHTTPToHTTPSHttp497(),
    StatusCode.tokenExpiredHttp498 => tokenExpiredHttp498(),
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499(),
    StatusCode.internalServerErrorHttp500 => internalServerErrorHttp500(),
    StatusCode.notImplementedHttp501 => notImplementedHttp501(),
    StatusCode.badGatewayHttp502 => badGatewayHttp502(),
    StatusCode.serviceUnavailableHttp503 => serviceUnavailableHttp503(),
    StatusCode.gatewayTimeoutHttp504 => gatewayTimeoutHttp504(),
    StatusCode.httpVersionNotSupportedHttp505 =>
      httpVersionNotSupportedHttp505(),
    StatusCode.variantAlsoNegotiatesHttp506 => variantAlsoNegotiatesHttp506(),
    StatusCode.insufficientStorageHttp507 => insufficientStorageHttp507(),
    StatusCode.loopDetectedHttp508 => loopDetectedHttp508(),
    StatusCode.bandwidthLimitExceededHttp509 => bandwidthLimitExceededHttp509(),
    StatusCode.otExtendedHttp510 => otExtendedHttp510(),
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511(),
    StatusCode.siteIsFrozenHttp530 => siteIsFrozenHttp530(),
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599(),
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218(),
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419(),
    StatusCode.enhanceYourCalmHttp420 => enhanceYourCalmHttp420(),
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430(),
    StatusCode.siteIsOverloadedHttp529 => siteIsOverloadedHttp529(),
    StatusCode.networkReadTimeoutErrorHttp598 =>
      networkReadTimeoutErrorHttp598(),
    StatusCode.requestHeaderTooLargeHttp494 => requestHeaderTooLargeHttp494(),
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520(),
    StatusCode.webServerIsDownHttp521 => webServerIsDownHttp521(),
    StatusCode.connectionTimedOutHttp522 => connectionTimedOutHttp522(),
    StatusCode.originIsUnreachableHttp523 => originIsUnreachableHttp523(),
    StatusCode.timeoutOccurredHttp524 => timeoutOccurredHttp524(),
    StatusCode.sslHandshakeFailedHttp525 => sslHandshakeFailedHttp525(),
    StatusCode.invalidSSLCertificateHttp526 => invalidSSLCertificateHttp526(),
    StatusCode.railgunErrorHttp527 => railgunErrorHttp527(),
    StatusCode.clientClosedConnectionHttp460 => clientClosedConnectionHttp460(),
    StatusCode.tooManyIpAddressesHttp463 => tooManyIpAddressesHttp463(),
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464(),
    _ => unauthorizedHttp561(),
  };

  /// Calls the function associated with the current [StatusCode] value and
  /// returns its result. If no matching callback is provided, returns the
  /// result of calling [orElse]. If there is no corresponding [orElse] provided
  /// returns `null`.
  ///
  /// Example:
  ///
  /// ```dart
  /// final statusCode = StatusCode.okHttp200;
  /// final result = statusCode.whenOrNull(
  ///   okHttp200:  =>  'Success',
  ///   orElse:  =>  'Other',
  /// );
  /// print(result); // prints 'Success'
  /// ```
  R? whenOrNull<R>({
    R Function()? continueHttp100,
    R Function()? switchingProtocolsHttp101,
    R Function()? processingHttp102,
    R Function()? earlyHintsHttp103,
    R Function()? okHttp200,
    R Function()? createdHttp201,
    R Function()? acceptedHttp202,
    R Function()? nonAuthoritativeInformationHttp203,
    R Function()? noContentHttp204,
    R Function()? resetContentHttp205,
    R Function()? partialContentHttp206,
    R Function()? multiStatusHttp207,
    R Function()? alreadyReportedHttp208,
    R Function()? imUsedHttp226,
    R Function()? multipleChoicesHttp300,
    R Function()? movedPermanentlyHttp301,
    R Function()? foundHttp302,
    R Function()? seeOtherHttp303,
    R Function()? notModifiedHttp304,
    R Function()? useProxyHttp305,
    R Function()? temporaryRedirectHttp307,
    R Function()? permanentRedirectHttp308,
    R Function()? badRequestHttp400,
    R Function()? unauthorizedHttp401,
    R Function()? paymentRequiredHttp402,
    R Function()? forbiddenHttp403,
    R Function()? notFoundHttp404,
    R Function()? methodNotAllowedHttp405,
    R Function()? notAcceptableHttp406,
    R Function()? proxyAuthenticationRequiredHttp407,
    R Function()? requestTimeoutHttp408,
    R Function()? conflictHttp409,
    R Function()? goneHttp410,
    R Function()? lengthRequiredHttp411,
    R Function()? preconditionFailedHttp412,
    R Function()? payloadTooLargeHttp413,
    R Function()? uriTooLongHttp414,
    R Function()? unsupportedMediaTypeHttp415,
    R Function()? rangeNotSatisfiableHttp416,
    R Function()? expectationFailedHttp417,
    R Function()? imATeapotHttp418,
    R Function()? misdirectedRequestHttp421,
    R Function()? unprocessableEntityHttp422,
    R Function()? lockedHttp423,
    R Function()? failedDependencyHttp424,
    R Function()? tooEarlyHttp425,
    R Function()? upgradeRequiredHttp426,
    R Function()? preconditionRequiredHttp428,
    R Function()? tooManyRequestsHttp429,
    R Function()? requestHeaderFieldsTooLargeHttp431,
    R Function()? iisLoginTimeoutHttp440,
    R Function()? nginxNoResponseHttp444,
    R Function()? iisRetryWithHttp449,
    R Function()? blockedByWindowsParentalControlsHttp450,
    R Function()? unavailableForLegalReasonsHttp451,
    R Function()? nginxSSLCertificateErrorHttp495,
    R Function()? nginxSSLCertificateRequiredHttp496,
    R Function()? nginxHTTPToHTTPSHttp497,
    R Function()? tokenExpiredHttp498,
    R Function()? nginxClientClosedRequestHttp499,
    R Function()? internalServerErrorHttp500,
    R Function()? notImplementedHttp501,
    R Function()? badGatewayHttp502,
    R Function()? serviceUnavailableHttp503,
    R Function()? gatewayTimeoutHttp504,
    R Function()? httpVersionNotSupportedHttp505,
    R Function()? variantAlsoNegotiatesHttp506,
    R Function()? insufficientStorageHttp507,
    R Function()? loopDetectedHttp508,
    R Function()? bandwidthLimitExceededHttp509,
    R Function()? otExtendedHttp510,
    R Function()? networkAuthenticationRequiredHttp511,
    R Function()? siteIsFrozenHttp530,
    R Function()? networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    R Function()? thisIsFineHttp218,
    R Function()? pageExpiredHttp419,
    R Function()? enhanceYourCalmHttp420,
    R Function()? requestHeaderFieldsTooLargeHttp430,
    R Function()? siteIsOverloadedHttp529,
    R Function()? networkReadTimeoutErrorHttp598,
    R Function()? requestHeaderTooLargeHttp494,
    R Function()? webServerReturnedUnknownErrorHttp520,
    R Function()? webServerIsDownHttp521,
    R Function()? connectionTimedOutHttp522,
    R Function()? originIsUnreachableHttp523,
    R Function()? timeoutOccurredHttp524,
    R Function()? sslHandshakeFailedHttp525,
    R Function()? invalidSSLCertificateHttp526,
    R Function()? railgunErrorHttp527,
    R Function()? clientClosedConnectionHttp460,
    R Function()? tooManyIpAddressesHttp463,
    R Function()? incompatibleProtocolVersionsHttp464,
    R Function()? unauthorizedHttp561,
    R Function()? orElse,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100?.call() ?? orElse?.call(),
    StatusCode.switchingProtocolsHttp101 =>
      switchingProtocolsHttp101?.call() ?? orElse?.call(),
    StatusCode.processingHttp102 => processingHttp102?.call() ?? orElse?.call(),
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103?.call() ?? orElse?.call(),
    StatusCode.okHttp200 => okHttp200?.call() ?? orElse?.call(),
    StatusCode.createdHttp201 => createdHttp201?.call() ?? orElse?.call(),
    StatusCode.acceptedHttp202 => acceptedHttp202?.call() ?? orElse?.call(),
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203?.call() ?? orElse?.call(),
    StatusCode.noContentHttp204 => noContentHttp204?.call() ?? orElse?.call(),
    StatusCode.resetContentHttp205 =>
      resetContentHttp205?.call() ?? orElse?.call(),
    StatusCode.partialContentHttp206 =>
      partialContentHttp206?.call() ?? orElse?.call(),
    StatusCode.multiStatusHttp207 =>
      multiStatusHttp207?.call() ?? orElse?.call(),
    StatusCode.alreadyReportedHttp208 =>
      alreadyReportedHttp208?.call() ?? orElse?.call(),
    StatusCode.imUsedHttp226 => imUsedHttp226?.call() ?? orElse?.call(),
    StatusCode.multipleChoicesHttp300 =>
      multipleChoicesHttp300?.call() ?? orElse?.call(),
    StatusCode.movedPermanentlyHttp301 =>
      movedPermanentlyHttp301?.call() ?? orElse?.call(),
    StatusCode.foundHttp302 => foundHttp302?.call() ?? orElse?.call(),
    StatusCode.seeOtherHttp303 => seeOtherHttp303?.call() ?? orElse?.call(),
    StatusCode.notModifiedHttp304 =>
      notModifiedHttp304?.call() ?? orElse?.call(),
    StatusCode.useProxyHttp305 => useProxyHttp305?.call() ?? orElse?.call(),
    StatusCode.temporaryRedirectHttp307 =>
      temporaryRedirectHttp307?.call() ?? orElse?.call(),
    StatusCode.permanentRedirectHttp308 =>
      permanentRedirectHttp308?.call() ?? orElse?.call(),
    StatusCode.badRequestHttp400 => badRequestHttp400?.call() ?? orElse?.call(),
    StatusCode.unauthorizedHttp401 =>
      unauthorizedHttp401?.call() ?? orElse?.call(),
    StatusCode.paymentRequiredHttp402 =>
      paymentRequiredHttp402?.call() ?? orElse?.call(),
    StatusCode.forbiddenHttp403 => forbiddenHttp403?.call() ?? orElse?.call(),
    StatusCode.notFoundHttp404 => notFoundHttp404?.call() ?? orElse?.call(),
    StatusCode.methodNotAllowedHttp405 =>
      methodNotAllowedHttp405?.call() ?? orElse?.call(),
    StatusCode.notAcceptableHttp406 =>
      notAcceptableHttp406?.call() ?? orElse?.call(),
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407?.call() ?? orElse?.call(),
    StatusCode.requestTimeoutHttp408 =>
      requestTimeoutHttp408?.call() ?? orElse?.call(),
    StatusCode.conflictHttp409 => conflictHttp409?.call() ?? orElse?.call(),
    StatusCode.goneHttp410 => goneHttp410?.call() ?? orElse?.call(),
    StatusCode.lengthRequiredHttp411 =>
      lengthRequiredHttp411?.call() ?? orElse?.call(),
    StatusCode.preconditionFailedHttp412 =>
      preconditionFailedHttp412?.call() ?? orElse?.call(),
    StatusCode.payloadTooLargeHttp413 =>
      payloadTooLargeHttp413?.call() ?? orElse?.call(),
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414?.call() ?? orElse?.call(),
    StatusCode.unsupportedMediaTypeHttp415 =>
      unsupportedMediaTypeHttp415?.call() ?? orElse?.call(),
    StatusCode.rangeNotSatisfiableHttp416 =>
      rangeNotSatisfiableHttp416?.call() ?? orElse?.call(),
    StatusCode.expectationFailedHttp417 =>
      expectationFailedHttp417?.call() ?? orElse?.call(),
    StatusCode.imATeapotHttp418 => imATeapotHttp418?.call() ?? orElse?.call(),
    StatusCode.misdirectedRequestHttp421 =>
      misdirectedRequestHttp421?.call() ?? orElse?.call(),
    StatusCode.unprocessableEntityHttp422 =>
      unprocessableEntityHttp422?.call() ?? orElse?.call(),
    StatusCode.lockedHttp423 => lockedHttp423?.call() ?? orElse?.call(),
    StatusCode.failedDependencyHttp424 =>
      failedDependencyHttp424?.call() ?? orElse?.call(),
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425?.call() ?? orElse?.call(),
    StatusCode.upgradeRequiredHttp426 =>
      upgradeRequiredHttp426?.call() ?? orElse?.call(),
    StatusCode.preconditionRequiredHttp428 =>
      preconditionRequiredHttp428?.call() ?? orElse?.call(),
    StatusCode.tooManyRequestsHttp429 =>
      tooManyRequestsHttp429?.call() ?? orElse?.call(),
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431?.call() ?? orElse?.call(),
    StatusCode.iisLoginTimeoutHttp440 =>
      iisLoginTimeoutHttp440?.call() ?? orElse?.call(),
    StatusCode.nginxNoResponseHttp444 =>
      nginxNoResponseHttp444?.call() ?? orElse?.call(),
    StatusCode.iisRetryWithHttp449 =>
      iisRetryWithHttp449?.call() ?? orElse?.call(),
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450?.call() ?? orElse?.call(),
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451?.call() ?? orElse?.call(),
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495?.call() ?? orElse?.call(),
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496?.call() ?? orElse?.call(),
    StatusCode.nginxHTTPToHTTPSHttp497 =>
      nginxHTTPToHTTPSHttp497?.call() ?? orElse?.call(),
    StatusCode.tokenExpiredHttp498 =>
      tokenExpiredHttp498?.call() ?? orElse?.call(),
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499?.call() ?? orElse?.call(),
    StatusCode.internalServerErrorHttp500 =>
      internalServerErrorHttp500?.call() ?? orElse?.call(),
    StatusCode.notImplementedHttp501 =>
      notImplementedHttp501?.call() ?? orElse?.call(),
    StatusCode.badGatewayHttp502 => badGatewayHttp502?.call() ?? orElse?.call(),
    StatusCode.serviceUnavailableHttp503 =>
      serviceUnavailableHttp503?.call() ?? orElse?.call(),
    StatusCode.gatewayTimeoutHttp504 =>
      gatewayTimeoutHttp504?.call() ?? orElse?.call(),
    StatusCode.httpVersionNotSupportedHttp505 =>
      httpVersionNotSupportedHttp505?.call() ?? orElse?.call(),
    StatusCode.variantAlsoNegotiatesHttp506 =>
      variantAlsoNegotiatesHttp506?.call() ?? orElse?.call(),
    StatusCode.insufficientStorageHttp507 =>
      insufficientStorageHttp507?.call() ?? orElse?.call(),
    StatusCode.loopDetectedHttp508 =>
      loopDetectedHttp508?.call() ?? orElse?.call(),
    StatusCode.bandwidthLimitExceededHttp509 =>
      bandwidthLimitExceededHttp509?.call() ?? orElse?.call(),
    StatusCode.otExtendedHttp510 => otExtendedHttp510?.call() ?? orElse?.call(),
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511?.call() ?? orElse?.call(),
    StatusCode.siteIsFrozenHttp530 =>
      siteIsFrozenHttp530?.call() ?? orElse?.call(),
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599?.call() ?? orElse?.call(),
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218?.call() ?? orElse?.call(),
    StatusCode.pageExpiredHttp419 =>
      pageExpiredHttp419?.call() ?? orElse?.call(),
    StatusCode.enhanceYourCalmHttp420 =>
      enhanceYourCalmHttp420?.call() ?? orElse?.call(),
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430?.call() ?? orElse?.call(),
    StatusCode.siteIsOverloadedHttp529 =>
      siteIsOverloadedHttp529?.call() ?? orElse?.call(),
    StatusCode.networkReadTimeoutErrorHttp598 =>
      networkReadTimeoutErrorHttp598?.call() ?? orElse?.call(),
    StatusCode.requestHeaderTooLargeHttp494 =>
      requestHeaderTooLargeHttp494?.call() ?? orElse?.call(),
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520?.call() ?? orElse?.call(),
    StatusCode.webServerIsDownHttp521 =>
      webServerIsDownHttp521?.call() ?? orElse?.call(),
    StatusCode.connectionTimedOutHttp522 =>
      connectionTimedOutHttp522?.call() ?? orElse?.call(),
    StatusCode.originIsUnreachableHttp523 =>
      originIsUnreachableHttp523?.call() ?? orElse?.call(),
    StatusCode.timeoutOccurredHttp524 =>
      timeoutOccurredHttp524?.call() ?? orElse?.call(),
    StatusCode.sslHandshakeFailedHttp525 =>
      sslHandshakeFailedHttp525?.call() ?? orElse?.call(),
    StatusCode.invalidSSLCertificateHttp526 =>
      invalidSSLCertificateHttp526?.call() ?? orElse?.call(),
    StatusCode.railgunErrorHttp527 =>
      railgunErrorHttp527?.call() ?? orElse?.call(),
    StatusCode.clientClosedConnectionHttp460 =>
      clientClosedConnectionHttp460?.call() ?? orElse?.call(),
    StatusCode.tooManyIpAddressesHttp463 =>
      tooManyIpAddressesHttp463?.call() ?? orElse?.call(),
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464?.call() ?? orElse?.call(),
    StatusCode.unauthorizedHttp561 =>
      unauthorizedHttp561?.call() ?? orElse?.call(),
    _ => orElse?.call(),
  };

  /// A [Map] like equivalent of [when] method. Should be only used with a
  /// constant values (i.e. `final`/`const`).
  ///
  /// Example:
  ///
  /// ```dart
  /// StatusCode = StatusCode.okHttp200;
  /// final response = statusCode.whenConst(
  ///   okHttp200: 'Success',
  ///   ...
  ///   badRequestHttp400: 'Bad request',
  ///   ...
  /// );
  /// print(response); // prints 'Success'
  /// ```
  R whenConst<R>({
    required R continueHttp100,
    required R switchingProtocolsHttp101,
    required R processingHttp102,
    required R earlyHintsHttp103,
    required R okHttp200,
    required R createdHttp201,
    required R acceptedHttp202,
    required R nonAuthoritativeInformationHttp203,
    required R noContentHttp204,
    required R resetContentHttp205,
    required R partialContentHttp206,
    required R multiStatusHttp207,
    required R alreadyReportedHttp208,
    required R imUsedHttp226,
    required R multipleChoicesHttp300,
    required R movedPermanentlyHttp301,
    required R foundHttp302,
    required R seeOtherHttp303,
    required R notModifiedHttp304,
    required R useProxyHttp305,
    required R temporaryRedirectHttp307,
    required R permanentRedirectHttp308,
    required R badRequestHttp400,
    required R unauthorizedHttp401,
    required R paymentRequiredHttp402,
    required R forbiddenHttp403,
    required R notFoundHttp404,
    required R methodNotAllowedHttp405,
    required R notAcceptableHttp406,
    required R proxyAuthenticationRequiredHttp407,
    required R requestTimeoutHttp408,
    required R conflictHttp409,
    required R goneHttp410,
    required R lengthRequiredHttp411,
    required R preconditionFailedHttp412,
    required R payloadTooLargeHttp413,
    required R uriTooLongHttp414,
    required R unsupportedMediaTypeHttp415,
    required R rangeNotSatisfiableHttp416,
    required R expectationFailedHttp417,
    required R imATeapotHttp418,
    required R misdirectedRequestHttp421,
    required R unprocessableEntityHttp422,
    required R lockedHttp423,
    required R failedDependencyHttp424,
    required R tooEarlyHttp425,
    required R upgradeRequiredHttp426,
    required R preconditionRequiredHttp428,
    required R tooManyRequestsHttp429,
    required R requestHeaderFieldsTooLargeHttp431,
    required R iisLoginTimeoutHttp440,
    required R nginxNoResponseHttp444,
    required R iisRetryWithHttp449,
    required R blockedByWindowsParentalControlsHttp450,
    required R unavailableForLegalReasonsHttp451,
    required R nginxSSLCertificateErrorHttp495,
    required R nginxSSLCertificateRequiredHttp496,
    required R nginxHTTPToHTTPSHttp497,
    required R tokenExpiredHttp498,
    required R nginxClientClosedRequestHttp499,
    required R internalServerErrorHttp500,
    required R notImplementedHttp501,
    required R badGatewayHttp502,
    required R serviceUnavailableHttp503,
    required R gatewayTimeoutHttp504,
    required R httpVersionNotSupportedHttp505,
    required R variantAlsoNegotiatesHttp506,
    required R insufficientStorageHttp507,
    required R loopDetectedHttp508,
    required R bandwidthLimitExceededHttp509,
    required R otExtendedHttp510,
    required R networkAuthenticationRequiredHttp511,
    required R siteIsFrozenHttp530,
    required R networkConnectTimeoutErrorHttp599,
    // Unofficial status codes:
    required R thisIsFineHttp218,
    required R pageExpiredHttp419,
    required R enhanceYourCalmHttp420,
    required R requestHeaderFieldsTooLargeHttp430,
    required R siteIsOverloadedHttp529,
    required R networkReadTimeoutErrorHttp598,
    required R requestHeaderTooLargeHttp494,
    required R webServerReturnedUnknownErrorHttp520,
    required R webServerIsDownHttp521,
    required R connectionTimedOutHttp522,
    required R originIsUnreachableHttp523,
    required R timeoutOccurredHttp524,
    required R sslHandshakeFailedHttp525,
    required R invalidSSLCertificateHttp526,
    required R railgunErrorHttp527,
    required R clientClosedConnectionHttp460,
    required R tooManyIpAddressesHttp463,
    required R incompatibleProtocolVersionsHttp464,
    required R unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100,
    StatusCode.switchingProtocolsHttp101 => switchingProtocolsHttp101,
    StatusCode.processingHttp102 => processingHttp102,
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103,
    StatusCode.okHttp200 => okHttp200,
    StatusCode.createdHttp201 => createdHttp201,
    StatusCode.acceptedHttp202 => acceptedHttp202,
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203,
    StatusCode.noContentHttp204 => noContentHttp204,
    StatusCode.resetContentHttp205 => resetContentHttp205,
    StatusCode.partialContentHttp206 => partialContentHttp206,
    StatusCode.multiStatusHttp207 => multiStatusHttp207,
    StatusCode.alreadyReportedHttp208 => alreadyReportedHttp208,
    StatusCode.imUsedHttp226 => imUsedHttp226,
    StatusCode.multipleChoicesHttp300 => multipleChoicesHttp300,
    StatusCode.movedPermanentlyHttp301 => movedPermanentlyHttp301,
    StatusCode.foundHttp302 => foundHttp302,
    StatusCode.seeOtherHttp303 => seeOtherHttp303,
    StatusCode.notModifiedHttp304 => notModifiedHttp304,
    StatusCode.useProxyHttp305 => useProxyHttp305,
    StatusCode.temporaryRedirectHttp307 => temporaryRedirectHttp307,
    StatusCode.permanentRedirectHttp308 => permanentRedirectHttp308,
    StatusCode.badRequestHttp400 => badRequestHttp400,
    StatusCode.unauthorizedHttp401 => unauthorizedHttp401,
    StatusCode.paymentRequiredHttp402 => paymentRequiredHttp402,
    StatusCode.forbiddenHttp403 => forbiddenHttp403,
    StatusCode.notFoundHttp404 => notFoundHttp404,
    StatusCode.methodNotAllowedHttp405 => methodNotAllowedHttp405,
    StatusCode.notAcceptableHttp406 => notAcceptableHttp406,
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407,
    StatusCode.requestTimeoutHttp408 => requestTimeoutHttp408,
    StatusCode.conflictHttp409 => conflictHttp409,
    StatusCode.goneHttp410 => goneHttp410,
    StatusCode.lengthRequiredHttp411 => lengthRequiredHttp411,
    StatusCode.preconditionFailedHttp412 => preconditionFailedHttp412,
    StatusCode.payloadTooLargeHttp413 => payloadTooLargeHttp413,
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414,
    StatusCode.unsupportedMediaTypeHttp415 => unsupportedMediaTypeHttp415,
    StatusCode.rangeNotSatisfiableHttp416 => rangeNotSatisfiableHttp416,
    StatusCode.expectationFailedHttp417 => expectationFailedHttp417,
    StatusCode.imATeapotHttp418 => imATeapotHttp418,
    StatusCode.misdirectedRequestHttp421 => misdirectedRequestHttp421,
    StatusCode.unprocessableEntityHttp422 => unprocessableEntityHttp422,
    StatusCode.lockedHttp423 => lockedHttp423,
    StatusCode.failedDependencyHttp424 => failedDependencyHttp424,
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425,
    StatusCode.upgradeRequiredHttp426 => upgradeRequiredHttp426,
    StatusCode.preconditionRequiredHttp428 => preconditionRequiredHttp428,
    StatusCode.tooManyRequestsHttp429 => tooManyRequestsHttp429,
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431,
    StatusCode.iisLoginTimeoutHttp440 => iisLoginTimeoutHttp440,
    StatusCode.nginxNoResponseHttp444 => nginxNoResponseHttp444,
    StatusCode.iisRetryWithHttp449 => iisRetryWithHttp449,
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450,
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451,
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495,
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496,
    StatusCode.nginxHTTPToHTTPSHttp497 => nginxHTTPToHTTPSHttp497,
    StatusCode.tokenExpiredHttp498 => tokenExpiredHttp498,
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499,
    StatusCode.internalServerErrorHttp500 => internalServerErrorHttp500,
    StatusCode.notImplementedHttp501 => notImplementedHttp501,
    StatusCode.badGatewayHttp502 => badGatewayHttp502,
    StatusCode.serviceUnavailableHttp503 => serviceUnavailableHttp503,
    StatusCode.gatewayTimeoutHttp504 => gatewayTimeoutHttp504,
    StatusCode.httpVersionNotSupportedHttp505 => httpVersionNotSupportedHttp505,
    StatusCode.variantAlsoNegotiatesHttp506 => variantAlsoNegotiatesHttp506,
    StatusCode.insufficientStorageHttp507 => insufficientStorageHttp507,
    StatusCode.loopDetectedHttp508 => loopDetectedHttp508,
    StatusCode.bandwidthLimitExceededHttp509 => bandwidthLimitExceededHttp509,
    StatusCode.otExtendedHttp510 => otExtendedHttp510,
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511,
    StatusCode.siteIsFrozenHttp530 => siteIsFrozenHttp530,
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599,
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218,
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419,
    StatusCode.enhanceYourCalmHttp420 => enhanceYourCalmHttp420,
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430,
    StatusCode.siteIsOverloadedHttp529 => siteIsOverloadedHttp529,
    StatusCode.networkReadTimeoutErrorHttp598 => networkReadTimeoutErrorHttp598,
    StatusCode.requestHeaderTooLargeHttp494 => requestHeaderTooLargeHttp494,
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520,
    StatusCode.webServerIsDownHttp521 => webServerIsDownHttp521,
    StatusCode.connectionTimedOutHttp522 => connectionTimedOutHttp522,
    StatusCode.originIsUnreachableHttp523 => originIsUnreachableHttp523,
    StatusCode.timeoutOccurredHttp524 => timeoutOccurredHttp524,
    StatusCode.sslHandshakeFailedHttp525 => sslHandshakeFailedHttp525,
    StatusCode.invalidSSLCertificateHttp526 => invalidSSLCertificateHttp526,
    StatusCode.railgunErrorHttp527 => railgunErrorHttp527,
    StatusCode.clientClosedConnectionHttp460 => clientClosedConnectionHttp460,
    StatusCode.tooManyIpAddressesHttp463 => tooManyIpAddressesHttp463,
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464,
    _ => unauthorizedHttp561,
  };

  /// A [Map] like equivalent of [whenOrNull] method. Should be only used with a
  /// constant values (i.e. `final`/`const`).
  ///
  /// Example:
  ///
  /// ```dart
  /// StatusCode = StatusCode.okHttp200;
  /// final response = statusCode.whenConstOrNull(
  ///   okHttp200: 'Success',
  ///   badRequestHttp400: 'Bad request',
  /// );
  /// print(response); // prints 'Success'
  /// ```
  R? whenConstOrNull<R>({
    R? continueHttp100,
    R? switchingProtocolsHttp101,
    R? processingHttp102,
    R? earlyHintsHttp103,
    R? okHttp200,
    R? createdHttp201,
    R? acceptedHttp202,
    R? nonAuthoritativeInformationHttp203,
    R? noContentHttp204,
    R? resetContentHttp205,
    R? partialContentHttp206,
    R? multiStatusHttp207,
    R? alreadyReportedHttp208,
    R? imUsedHttp226,
    R? multipleChoicesHttp300,
    R? movedPermanentlyHttp301,
    R? foundHttp302,
    R? seeOtherHttp303,
    R? notModifiedHttp304,
    R? useProxyHttp305,
    R? temporaryRedirectHttp307,
    R? permanentRedirectHttp308,
    R? badRequestHttp400,
    R? unauthorizedHttp401,
    R? paymentRequiredHttp402,
    R? forbiddenHttp403,
    R? notFoundHttp404,
    R? methodNotAllowedHttp405,
    R? notAcceptableHttp406,
    R? proxyAuthenticationRequiredHttp407,
    R? requestTimeoutHttp408,
    R? conflictHttp409,
    R? goneHttp410,
    R? lengthRequiredHttp411,
    R? preconditionFailedHttp412,
    R? payloadTooLargeHttp413,
    R? uriTooLongHttp414,
    R? unsupportedMediaTypeHttp415,
    R? rangeNotSatisfiableHttp416,
    R? expectationFailedHttp417,
    R? imATeapotHttp418,
    R? misdirectedRequestHttp421,
    R? unprocessableEntityHttp422,
    R? lockedHttp423,
    R? failedDependencyHttp424,
    R? tooEarlyHttp425,
    R? upgradeRequiredHttp426,
    R? preconditionRequiredHttp428,
    R? tooManyRequestsHttp429,
    R? requestHeaderFieldsTooLargeHttp431,
    R? iisLoginTimeoutHttp440,
    R? nginxNoResponseHttp444,
    R? iisRetryWithHttp449,
    R? blockedByWindowsParentalControlsHttp450,
    R? unavailableForLegalReasonsHttp451,
    R? nginxSSLCertificateErrorHttp495,
    R? nginxSSLCertificateRequiredHttp496,
    R? nginxHTTPToHTTPSHttp497,
    R? tokenExpiredHttp498,
    R? nginxClientClosedRequestHttp499,
    R? internalServerErrorHttp500,
    R? notImplementedHttp501,
    R? badGatewayHttp502,
    R? serviceUnavailableHttp503,
    R? gatewayTimeoutHttp504,
    R? httpVersionNotSupportedHttp505,
    R? variantAlsoNegotiatesHttp506,
    R? insufficientStorageHttp507,
    R? loopDetectedHttp508,
    R? bandwidthLimitExceededHttp509,
    R? otExtendedHttp510,
    R? networkAuthenticationRequiredHttp511,
    R? siteIsFrozenHttp530,
    R? networkConnectTimeoutErrorHttp599,
    // Unofficial codes:
    R? thisIsFineHttp218,
    R? pageExpiredHttp419,
    R? enhanceYourCalmHttp420,
    R? requestHeaderFieldsTooLargeHttp430,
    R? siteIsOverloadedHttp529,
    R? networkReadTimeoutErrorHttp598,
    R? requestHeaderTooLargeHttp494,
    R? webServerReturnedUnknownErrorHttp520,
    R? webServerIsDownHttp521,
    R? connectionTimedOutHttp522,
    R? originIsUnreachableHttp523,
    R? timeoutOccurredHttp524,
    R? sslHandshakeFailedHttp525,
    R? invalidSSLCertificateHttp526,
    R? railgunErrorHttp527,
    R? clientClosedConnectionHttp460,
    R? tooManyIpAddressesHttp463,
    R? incompatibleProtocolVersionsHttp464,
    R? unauthorizedHttp561,
  }) => switch (this) {
    StatusCode.continueHttp100 => continueHttp100,
    StatusCode.switchingProtocolsHttp101 => switchingProtocolsHttp101,
    StatusCode.processingHttp102 => processingHttp102,
    StatusCode.earlyHintsHttp103 => earlyHintsHttp103,
    StatusCode.okHttp200 => okHttp200,
    StatusCode.createdHttp201 => createdHttp201,
    StatusCode.acceptedHttp202 => acceptedHttp202,
    StatusCode.nonAuthoritativeInformationHttp203 =>
      nonAuthoritativeInformationHttp203,
    StatusCode.noContentHttp204 => noContentHttp204,
    StatusCode.resetContentHttp205 => resetContentHttp205,
    StatusCode.partialContentHttp206 => partialContentHttp206,
    StatusCode.multiStatusHttp207 => multiStatusHttp207,
    StatusCode.alreadyReportedHttp208 => alreadyReportedHttp208,
    StatusCode.imUsedHttp226 => imUsedHttp226,
    StatusCode.multipleChoicesHttp300 => multipleChoicesHttp300,
    StatusCode.movedPermanentlyHttp301 => movedPermanentlyHttp301,
    StatusCode.foundHttp302 => foundHttp302,
    StatusCode.seeOtherHttp303 => seeOtherHttp303,
    StatusCode.notModifiedHttp304 => notModifiedHttp304,
    StatusCode.useProxyHttp305 => useProxyHttp305,
    StatusCode.temporaryRedirectHttp307 => temporaryRedirectHttp307,
    StatusCode.permanentRedirectHttp308 => permanentRedirectHttp308,
    StatusCode.badRequestHttp400 => badRequestHttp400,
    StatusCode.unauthorizedHttp401 => unauthorizedHttp401,
    StatusCode.paymentRequiredHttp402 => paymentRequiredHttp402,
    StatusCode.forbiddenHttp403 => forbiddenHttp403,
    StatusCode.notFoundHttp404 => notFoundHttp404,
    StatusCode.methodNotAllowedHttp405 => methodNotAllowedHttp405,
    StatusCode.notAcceptableHttp406 => notAcceptableHttp406,
    StatusCode.proxyAuthenticationRequiredHttp407 =>
      proxyAuthenticationRequiredHttp407,
    StatusCode.requestTimeoutHttp408 => requestTimeoutHttp408,
    StatusCode.conflictHttp409 => conflictHttp409,
    StatusCode.goneHttp410 => goneHttp410,
    StatusCode.lengthRequiredHttp411 => lengthRequiredHttp411,
    StatusCode.preconditionFailedHttp412 => preconditionFailedHttp412,
    StatusCode.payloadTooLargeHttp413 => payloadTooLargeHttp413,
    StatusCode.uriTooLongHttp414 => uriTooLongHttp414,
    StatusCode.unsupportedMediaTypeHttp415 => unsupportedMediaTypeHttp415,
    StatusCode.rangeNotSatisfiableHttp416 => rangeNotSatisfiableHttp416,
    StatusCode.expectationFailedHttp417 => expectationFailedHttp417,
    StatusCode.imATeapotHttp418 => imATeapotHttp418,
    StatusCode.misdirectedRequestHttp421 => misdirectedRequestHttp421,
    StatusCode.unprocessableEntityHttp422 => unprocessableEntityHttp422,
    StatusCode.lockedHttp423 => lockedHttp423,
    StatusCode.failedDependencyHttp424 => failedDependencyHttp424,
    StatusCode.tooEarlyHttp425 => tooEarlyHttp425,
    StatusCode.upgradeRequiredHttp426 => upgradeRequiredHttp426,
    StatusCode.preconditionRequiredHttp428 => preconditionRequiredHttp428,
    StatusCode.tooManyRequestsHttp429 => tooManyRequestsHttp429,
    StatusCode.requestHeaderFieldsTooLargeHttp431 =>
      requestHeaderFieldsTooLargeHttp431,
    StatusCode.iisLoginTimeoutHttp440 => iisLoginTimeoutHttp440,
    StatusCode.nginxNoResponseHttp444 => nginxNoResponseHttp444,
    StatusCode.iisRetryWithHttp449 => iisRetryWithHttp449,
    StatusCode.blockedByWindowsParentalControlsHttp450 =>
      blockedByWindowsParentalControlsHttp450,
    StatusCode.unavailableForLegalReasonsHttp451 =>
      unavailableForLegalReasonsHttp451,
    StatusCode.nginxSSLCertificateErrorHttp495 =>
      nginxSSLCertificateErrorHttp495,
    StatusCode.nginxSSLCertificateRequiredHttp496 =>
      nginxSSLCertificateRequiredHttp496,
    StatusCode.nginxHTTPToHTTPSHttp497 => nginxHTTPToHTTPSHttp497,
    StatusCode.tokenExpiredHttp498 => tokenExpiredHttp498,
    StatusCode.nginxClientClosedRequestHttp499 =>
      nginxClientClosedRequestHttp499,
    StatusCode.internalServerErrorHttp500 => internalServerErrorHttp500,
    StatusCode.notImplementedHttp501 => notImplementedHttp501,
    StatusCode.badGatewayHttp502 => badGatewayHttp502,
    StatusCode.serviceUnavailableHttp503 => serviceUnavailableHttp503,
    StatusCode.gatewayTimeoutHttp504 => gatewayTimeoutHttp504,
    StatusCode.httpVersionNotSupportedHttp505 => httpVersionNotSupportedHttp505,
    StatusCode.variantAlsoNegotiatesHttp506 => variantAlsoNegotiatesHttp506,
    StatusCode.insufficientStorageHttp507 => insufficientStorageHttp507,
    StatusCode.loopDetectedHttp508 => loopDetectedHttp508,
    StatusCode.bandwidthLimitExceededHttp509 => bandwidthLimitExceededHttp509,
    StatusCode.otExtendedHttp510 => otExtendedHttp510,
    StatusCode.networkAuthenticationRequiredHttp511 =>
      networkAuthenticationRequiredHttp511,
    StatusCode.siteIsFrozenHttp530 => siteIsFrozenHttp530,
    StatusCode.networkConnectTimeoutErrorHttp599 =>
      networkConnectTimeoutErrorHttp599,
    StatusCode.thisIsFineHttp218 => thisIsFineHttp218,
    StatusCode.pageExpiredHttp419 => pageExpiredHttp419,
    StatusCode.enhanceYourCalmHttp420 => enhanceYourCalmHttp420,
    StatusCode.requestHeaderFieldsTooLargeHttp430 =>
      requestHeaderFieldsTooLargeHttp430,
    StatusCode.siteIsOverloadedHttp529 => siteIsOverloadedHttp529,
    StatusCode.networkReadTimeoutErrorHttp598 => networkReadTimeoutErrorHttp598,
    StatusCode.requestHeaderTooLargeHttp494 => requestHeaderTooLargeHttp494,
    StatusCode.webServerReturnedUnknownErrorHttp520 =>
      webServerReturnedUnknownErrorHttp520,
    StatusCode.webServerIsDownHttp521 => webServerIsDownHttp521,
    StatusCode.connectionTimedOutHttp522 => connectionTimedOutHttp522,
    StatusCode.originIsUnreachableHttp523 => originIsUnreachableHttp523,
    StatusCode.timeoutOccurredHttp524 => timeoutOccurredHttp524,
    StatusCode.sslHandshakeFailedHttp525 => sslHandshakeFailedHttp525,
    StatusCode.invalidSSLCertificateHttp526 => invalidSSLCertificateHttp526,
    StatusCode.railgunErrorHttp527 => railgunErrorHttp527,
    StatusCode.clientClosedConnectionHttp460 => clientClosedConnectionHttp460,
    StatusCode.tooManyIpAddressesHttp463 => tooManyIpAddressesHttp463,
    StatusCode.incompatibleProtocolVersionsHttp464 =>
      incompatibleProtocolVersionsHttp464,
    StatusCode.unauthorizedHttp561 => unauthorizedHttp561,
    _ => null,
  };
}
