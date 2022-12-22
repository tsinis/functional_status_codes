// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_code.dart';

extension StatusCodeX on StatusCode {
  bool get isContinue100 => this == StatusCode.continue100;
  bool get isSwitchingProtocols101 => this == StatusCode.switchingProtocols101;
  bool get isProcessing102 => this == StatusCode.processing102;
  bool get isEarlyHints103 => this == StatusCode.earlyHints103;
  bool get isOk200 => this == StatusCode.ok200;
  bool get isCreated201 => this == StatusCode.created201;
  bool get isAccepted202 => this == StatusCode.accepted202;
  bool get isNonAuthoritativeInformation203 =>
      this == StatusCode.nonAuthoritativeInformation203;
  bool get isNoContent204 => this == StatusCode.noContent204;
  bool get isResetContent205 => this == StatusCode.resetContent205;
  bool get isPartialContent206 => this == StatusCode.partialContent206;
  bool get isMultiStatus207 => this == StatusCode.multiStatus207;
  bool get isAlreadyReported208 => this == StatusCode.alreadyReported208;
  bool get isImUsed226 => this == StatusCode.imUsed226;
  bool get isMultipleChoices300 => this == StatusCode.multipleChoices300;
  bool get isMovedPermanently301 => this == StatusCode.movedPermanently301;
  bool get isFound302 => this == StatusCode.found302;
  bool get isSeeOther303 => this == StatusCode.seeOther303;
  bool get isNotModified304 => this == StatusCode.notModified304;
  bool get isUseProxy305 => this == StatusCode.useProxy305;
  bool get isTemporaryRedirect307 => this == StatusCode.temporaryRedirect307;
  bool get isPermanentRedirect308 => this == StatusCode.permanentRedirect308;
  bool get isBadRequest400 => this == StatusCode.badRequest400;
  bool get isUnauthorized401 => this == StatusCode.unauthorized401;
  bool get isPaymentRequired402 => this == StatusCode.paymentRequired402;
  bool get isForbidden403 => this == StatusCode.forbidden403;
  bool get isNotFound404 => this == StatusCode.notFound404;
  bool get isMethodNotAllowed405 => this == StatusCode.methodNotAllowed405;
  bool get isNotAcceptable406 => this == StatusCode.notAcceptable406;
  bool get isProxyAuthenticationRequired407 =>
      this == StatusCode.proxyAuthenticationRequired407;
  bool get isRequestTimeout408 => this == StatusCode.requestTimeout408;
  bool get isConflict409 => this == StatusCode.conflict409;
  bool get isGone410 => this == StatusCode.gone410;
  bool get isLengthRequired411 => this == StatusCode.lengthRequired411;
  bool get isPreconditionFailed412 => this == StatusCode.preconditionFailed412;
  bool get isPayloadTooLarge413 => this == StatusCode.payloadTooLarge413;
  bool get isUriTooLong414 => this == StatusCode.uriTooLong414;
  bool get isUnsupportedMediaType415 =>
      this == StatusCode.unsupportedMediaType415;
  bool get isRangeNotSatisfiable416 =>
      this == StatusCode.rangeNotSatisfiable416;
  bool get isExpectationFailed417 => this == StatusCode.expectationFailed417;
  bool get isImATeapot418 => this == StatusCode.imATeapot418;
  bool get isMisdirectedRequest421 => this == StatusCode.misdirectedRequest421;
  bool get isUnprocessableEntity422 =>
      this == StatusCode.unprocessableEntity422;
  bool get isLocked423 => this == StatusCode.locked423;
  bool get isFailedDependency424 => this == StatusCode.failedDependency424;
  bool get isTooEarly425 => this == StatusCode.tooEarly425;
  bool get isUpgradeRequired426 => this == StatusCode.upgradeRequired426;
  bool get isPreconditionRequired428 =>
      this == StatusCode.preconditionRequired428;
  bool get isTooManyRequests429 => this == StatusCode.tooManyRequests429;
  bool get isRequestHeaderFieldsTooLarge431 =>
      this == StatusCode.requestHeaderFieldsTooLarge431;
  bool get isIisLoginTimeout440 => this == StatusCode.iisLoginTimeout440;
  bool get isNginxNoResponse444 => this == StatusCode.nginxNoResponse444;
  bool get isIisRetryWith449 => this == StatusCode.iisRetryWith449;
  bool get isBlockedByWindowsParentalControls450 =>
      this == StatusCode.blockedByWindowsParentalControls450;
  bool get isUnavailableForLegalReasons451 =>
      this == StatusCode.unavailableForLegalReasons451;
  bool get isNginxSSLCertificateError495 =>
      this == StatusCode.nginxSSLCertificateError495;
  bool get isNginxSSLCertificateRequired496 =>
      this == StatusCode.nginxSSLCertificateRequired496;
  bool get isNginxHTTPToHTTPS497 => this == StatusCode.nginxHTTPToHTTPS497;
  bool get isTokenExpired498 => this == StatusCode.tokenExpired498;
  bool get isNginxClientClosedRequest499 =>
      this == StatusCode.nginxClientClosedRequest499;
  bool get isInternalServerError500 =>
      this == StatusCode.internalServerError500;
  bool get isNotImplemented501 => this == StatusCode.notImplemented501;
  bool get isBadGateway502 => this == StatusCode.badGateway502;
  bool get isServiceUnavailable503 => this == StatusCode.serviceUnavailable503;
  bool get isGatewayTimeout504 => this == StatusCode.gatewayTimeout504;
  bool get isHttpVersionNotSupported505 =>
      this == StatusCode.httpVersionNotSupported505;
  bool get isVariantAlsoNegotiates506 =>
      this == StatusCode.variantAlsoNegotiates506;
  bool get isInsufficientStorage507 =>
      this == StatusCode.insufficientStorage507;
  bool get isLoopDetected508 => this == StatusCode.loopDetected508;
  bool get isBandwidthLimitExceeded509 =>
      this == StatusCode.bandwidthLimitExceeded509;
  bool get isOtExtended510 => this == StatusCode.otExtended510;
  bool get isNetworkAuthenticationRequired511 =>
      this == StatusCode.networkAuthenticationRequired511;
  bool get isSiteIsFrozen530 => this == StatusCode.siteIsFrozen530;
  bool get isNetworkConnectTimeoutError599 =>
      this == StatusCode.networkConnectTimeoutError599;
  R map<R>({
    required R Function(StatusCode continue100) continue100,
    required R Function(StatusCode switchingProtocols101) switchingProtocols101,
    required R Function(StatusCode processing102) processing102,
    required R Function(StatusCode earlyHints103) earlyHints103,
    required R Function(StatusCode ok200) ok200,
    required R Function(StatusCode created201) created201,
    required R Function(StatusCode accepted202) accepted202,
    required R Function(StatusCode nonAuthoritativeInformation203)
        nonAuthoritativeInformation203,
    required R Function(StatusCode noContent204) noContent204,
    required R Function(StatusCode resetContent205) resetContent205,
    required R Function(StatusCode partialContent206) partialContent206,
    required R Function(StatusCode multiStatus207) multiStatus207,
    required R Function(StatusCode alreadyReported208) alreadyReported208,
    required R Function(StatusCode imUsed226) imUsed226,
    required R Function(StatusCode multipleChoices300) multipleChoices300,
    required R Function(StatusCode movedPermanently301) movedPermanently301,
    required R Function(StatusCode found302) found302,
    required R Function(StatusCode seeOther303) seeOther303,
    required R Function(StatusCode notModified304) notModified304,
    required R Function(StatusCode useProxy305) useProxy305,
    required R Function(StatusCode temporaryRedirect307) temporaryRedirect307,
    required R Function(StatusCode permanentRedirect308) permanentRedirect308,
    required R Function(StatusCode badRequest400) badRequest400,
    required R Function(StatusCode unauthorized401) unauthorized401,
    required R Function(StatusCode paymentRequired402) paymentRequired402,
    required R Function(StatusCode forbidden403) forbidden403,
    required R Function(StatusCode notFound404) notFound404,
    required R Function(StatusCode methodNotAllowed405) methodNotAllowed405,
    required R Function(StatusCode notAcceptable406) notAcceptable406,
    required R Function(StatusCode proxyAuthenticationRequired407)
        proxyAuthenticationRequired407,
    required R Function(StatusCode requestTimeout408) requestTimeout408,
    required R Function(StatusCode conflict409) conflict409,
    required R Function(StatusCode gone410) gone410,
    required R Function(StatusCode lengthRequired411) lengthRequired411,
    required R Function(StatusCode preconditionFailed412) preconditionFailed412,
    required R Function(StatusCode payloadTooLarge413) payloadTooLarge413,
    required R Function(StatusCode uriTooLong414) uriTooLong414,
    required R Function(StatusCode unsupportedMediaType415)
        unsupportedMediaType415,
    required R Function(StatusCode rangeNotSatisfiable416)
        rangeNotSatisfiable416,
    required R Function(StatusCode expectationFailed417) expectationFailed417,
    required R Function(StatusCode imATeapot418) imATeapot418,
    required R Function(StatusCode misdirectedRequest421) misdirectedRequest421,
    required R Function(StatusCode unprocessableEntity422)
        unprocessableEntity422,
    required R Function(StatusCode locked423) locked423,
    required R Function(StatusCode failedDependency424) failedDependency424,
    required R Function(StatusCode tooEarly425) tooEarly425,
    required R Function(StatusCode upgradeRequired426) upgradeRequired426,
    required R Function(StatusCode preconditionRequired428)
        preconditionRequired428,
    required R Function(StatusCode tooManyRequests429) tooManyRequests429,
    required R Function(StatusCode requestHeaderFieldsTooLarge431)
        requestHeaderFieldsTooLarge431,
    required R Function(StatusCode iisLoginTimeout440) iisLoginTimeout440,
    required R Function(StatusCode nginxNoResponse444) nginxNoResponse444,
    required R Function(StatusCode iisRetryWith449) iisRetryWith449,
    required R Function(StatusCode blockedByWindowsParentalControls450)
        blockedByWindowsParentalControls450,
    required R Function(StatusCode unavailableForLegalReasons451)
        unavailableForLegalReasons451,
    required R Function(StatusCode nginxSSLCertificateError495)
        nginxSSLCertificateError495,
    required R Function(StatusCode nginxSSLCertificateRequired496)
        nginxSSLCertificateRequired496,
    required R Function(StatusCode nginxHTTPToHTTPS497) nginxHTTPToHTTPS497,
    required R Function(StatusCode tokenExpired498) tokenExpired498,
    required R Function(StatusCode nginxClientClosedRequest499)
        nginxClientClosedRequest499,
    required R Function(StatusCode internalServerError500)
        internalServerError500,
    required R Function(StatusCode notImplemented501) notImplemented501,
    required R Function(StatusCode badGateway502) badGateway502,
    required R Function(StatusCode serviceUnavailable503) serviceUnavailable503,
    required R Function(StatusCode gatewayTimeout504) gatewayTimeout504,
    required R Function(StatusCode httpVersionNotSupported505)
        httpVersionNotSupported505,
    required R Function(StatusCode variantAlsoNegotiates506)
        variantAlsoNegotiates506,
    required R Function(StatusCode insufficientStorage507)
        insufficientStorage507,
    required R Function(StatusCode loopDetected508) loopDetected508,
    required R Function(StatusCode bandwidthLimitExceeded509)
        bandwidthLimitExceeded509,
    required R Function(StatusCode otExtended510) otExtended510,
    required R Function(StatusCode networkAuthenticationRequired511)
        networkAuthenticationRequired511,
    required R Function(StatusCode siteIsFrozen530) siteIsFrozen530,
    required R Function(StatusCode networkConnectTimeoutError599)
        networkConnectTimeoutError599,
  }) {
    switch (this) {
      case StatusCode.continue100:
        return continue100(this);
      case StatusCode.switchingProtocols101:
        return switchingProtocols101(this);
      case StatusCode.processing102:
        return processing102(this);
      case StatusCode.earlyHints103:
        return earlyHints103(this);
      case StatusCode.ok200:
        return ok200(this);
      case StatusCode.created201:
        return created201(this);
      case StatusCode.accepted202:
        return accepted202(this);
      case StatusCode.nonAuthoritativeInformation203:
        return nonAuthoritativeInformation203(this);
      case StatusCode.noContent204:
        return noContent204(this);
      case StatusCode.resetContent205:
        return resetContent205(this);
      case StatusCode.partialContent206:
        return partialContent206(this);
      case StatusCode.multiStatus207:
        return multiStatus207(this);
      case StatusCode.alreadyReported208:
        return alreadyReported208(this);
      case StatusCode.imUsed226:
        return imUsed226(this);
      case StatusCode.multipleChoices300:
        return multipleChoices300(this);
      case StatusCode.movedPermanently301:
        return movedPermanently301(this);
      case StatusCode.found302:
        return found302(this);
      case StatusCode.seeOther303:
        return seeOther303(this);
      case StatusCode.notModified304:
        return notModified304(this);
      case StatusCode.useProxy305:
        return useProxy305(this);
      case StatusCode.temporaryRedirect307:
        return temporaryRedirect307(this);
      case StatusCode.permanentRedirect308:
        return permanentRedirect308(this);
      case StatusCode.badRequest400:
        return badRequest400(this);
      case StatusCode.unauthorized401:
        return unauthorized401(this);
      case StatusCode.paymentRequired402:
        return paymentRequired402(this);
      case StatusCode.forbidden403:
        return forbidden403(this);
      case StatusCode.notFound404:
        return notFound404(this);
      case StatusCode.methodNotAllowed405:
        return methodNotAllowed405(this);
      case StatusCode.notAcceptable406:
        return notAcceptable406(this);
      case StatusCode.proxyAuthenticationRequired407:
        return proxyAuthenticationRequired407(this);
      case StatusCode.requestTimeout408:
        return requestTimeout408(this);
      case StatusCode.conflict409:
        return conflict409(this);
      case StatusCode.gone410:
        return gone410(this);
      case StatusCode.lengthRequired411:
        return lengthRequired411(this);
      case StatusCode.preconditionFailed412:
        return preconditionFailed412(this);
      case StatusCode.payloadTooLarge413:
        return payloadTooLarge413(this);
      case StatusCode.uriTooLong414:
        return uriTooLong414(this);
      case StatusCode.unsupportedMediaType415:
        return unsupportedMediaType415(this);
      case StatusCode.rangeNotSatisfiable416:
        return rangeNotSatisfiable416(this);
      case StatusCode.expectationFailed417:
        return expectationFailed417(this);
      case StatusCode.imATeapot418:
        return imATeapot418(this);
      case StatusCode.misdirectedRequest421:
        return misdirectedRequest421(this);
      case StatusCode.unprocessableEntity422:
        return unprocessableEntity422(this);
      case StatusCode.locked423:
        return locked423(this);
      case StatusCode.failedDependency424:
        return failedDependency424(this);
      case StatusCode.tooEarly425:
        return tooEarly425(this);
      case StatusCode.upgradeRequired426:
        return upgradeRequired426(this);
      case StatusCode.preconditionRequired428:
        return preconditionRequired428(this);
      case StatusCode.tooManyRequests429:
        return tooManyRequests429(this);
      case StatusCode.requestHeaderFieldsTooLarge431:
        return requestHeaderFieldsTooLarge431(this);
      case StatusCode.iisLoginTimeout440:
        return iisLoginTimeout440(this);
      case StatusCode.nginxNoResponse444:
        return nginxNoResponse444(this);
      case StatusCode.iisRetryWith449:
        return iisRetryWith449(this);
      case StatusCode.blockedByWindowsParentalControls450:
        return blockedByWindowsParentalControls450(this);
      case StatusCode.unavailableForLegalReasons451:
        return unavailableForLegalReasons451(this);
      case StatusCode.nginxSSLCertificateError495:
        return nginxSSLCertificateError495(this);
      case StatusCode.nginxSSLCertificateRequired496:
        return nginxSSLCertificateRequired496(this);
      case StatusCode.nginxHTTPToHTTPS497:
        return nginxHTTPToHTTPS497(this);
      case StatusCode.tokenExpired498:
        return tokenExpired498(this);
      case StatusCode.nginxClientClosedRequest499:
        return nginxClientClosedRequest499(this);
      case StatusCode.internalServerError500:
        return internalServerError500(this);
      case StatusCode.notImplemented501:
        return notImplemented501(this);
      case StatusCode.badGateway502:
        return badGateway502(this);
      case StatusCode.serviceUnavailable503:
        return serviceUnavailable503(this);
      case StatusCode.gatewayTimeout504:
        return gatewayTimeout504(this);
      case StatusCode.httpVersionNotSupported505:
        return httpVersionNotSupported505(this);
      case StatusCode.variantAlsoNegotiates506:
        return variantAlsoNegotiates506(this);
      case StatusCode.insufficientStorage507:
        return insufficientStorage507(this);
      case StatusCode.loopDetected508:
        return loopDetected508(this);
      case StatusCode.bandwidthLimitExceeded509:
        return bandwidthLimitExceeded509(this);
      case StatusCode.otExtended510:
        return otExtended510(this);
      case StatusCode.networkAuthenticationRequired511:
        return networkAuthenticationRequired511(this);
      case StatusCode.siteIsFrozen530:
        return siteIsFrozen530(this);
      case StatusCode.networkConnectTimeoutError599:
        return networkConnectTimeoutError599(this);
    }
  }

  R maybeMap<R>({
    R Function(StatusCode continue100)? continue100,
    R Function(StatusCode switchingProtocols101)? switchingProtocols101,
    R Function(StatusCode processing102)? processing102,
    R Function(StatusCode earlyHints103)? earlyHints103,
    R Function(StatusCode ok200)? ok200,
    R Function(StatusCode created201)? created201,
    R Function(StatusCode accepted202)? accepted202,
    R Function(StatusCode nonAuthoritativeInformation203)?
        nonAuthoritativeInformation203,
    R Function(StatusCode noContent204)? noContent204,
    R Function(StatusCode resetContent205)? resetContent205,
    R Function(StatusCode partialContent206)? partialContent206,
    R Function(StatusCode multiStatus207)? multiStatus207,
    R Function(StatusCode alreadyReported208)? alreadyReported208,
    R Function(StatusCode imUsed226)? imUsed226,
    R Function(StatusCode multipleChoices300)? multipleChoices300,
    R Function(StatusCode movedPermanently301)? movedPermanently301,
    R Function(StatusCode found302)? found302,
    R Function(StatusCode seeOther303)? seeOther303,
    R Function(StatusCode notModified304)? notModified304,
    R Function(StatusCode useProxy305)? useProxy305,
    R Function(StatusCode temporaryRedirect307)? temporaryRedirect307,
    R Function(StatusCode permanentRedirect308)? permanentRedirect308,
    R Function(StatusCode badRequest400)? badRequest400,
    R Function(StatusCode unauthorized401)? unauthorized401,
    R Function(StatusCode paymentRequired402)? paymentRequired402,
    R Function(StatusCode forbidden403)? forbidden403,
    R Function(StatusCode notFound404)? notFound404,
    R Function(StatusCode methodNotAllowed405)? methodNotAllowed405,
    R Function(StatusCode notAcceptable406)? notAcceptable406,
    R Function(StatusCode proxyAuthenticationRequired407)?
        proxyAuthenticationRequired407,
    R Function(StatusCode requestTimeout408)? requestTimeout408,
    R Function(StatusCode conflict409)? conflict409,
    R Function(StatusCode gone410)? gone410,
    R Function(StatusCode lengthRequired411)? lengthRequired411,
    R Function(StatusCode preconditionFailed412)? preconditionFailed412,
    R Function(StatusCode payloadTooLarge413)? payloadTooLarge413,
    R Function(StatusCode uriTooLong414)? uriTooLong414,
    R Function(StatusCode unsupportedMediaType415)? unsupportedMediaType415,
    R Function(StatusCode rangeNotSatisfiable416)? rangeNotSatisfiable416,
    R Function(StatusCode expectationFailed417)? expectationFailed417,
    R Function(StatusCode imATeapot418)? imATeapot418,
    R Function(StatusCode misdirectedRequest421)? misdirectedRequest421,
    R Function(StatusCode unprocessableEntity422)? unprocessableEntity422,
    R Function(StatusCode locked423)? locked423,
    R Function(StatusCode failedDependency424)? failedDependency424,
    R Function(StatusCode tooEarly425)? tooEarly425,
    R Function(StatusCode upgradeRequired426)? upgradeRequired426,
    R Function(StatusCode preconditionRequired428)? preconditionRequired428,
    R Function(StatusCode tooManyRequests429)? tooManyRequests429,
    R Function(StatusCode requestHeaderFieldsTooLarge431)?
        requestHeaderFieldsTooLarge431,
    R Function(StatusCode iisLoginTimeout440)? iisLoginTimeout440,
    R Function(StatusCode nginxNoResponse444)? nginxNoResponse444,
    R Function(StatusCode iisRetryWith449)? iisRetryWith449,
    R Function(StatusCode blockedByWindowsParentalControls450)?
        blockedByWindowsParentalControls450,
    R Function(StatusCode unavailableForLegalReasons451)?
        unavailableForLegalReasons451,
    R Function(StatusCode nginxSSLCertificateError495)?
        nginxSSLCertificateError495,
    R Function(StatusCode nginxSSLCertificateRequired496)?
        nginxSSLCertificateRequired496,
    R Function(StatusCode nginxHTTPToHTTPS497)? nginxHTTPToHTTPS497,
    R Function(StatusCode tokenExpired498)? tokenExpired498,
    R Function(StatusCode nginxClientClosedRequest499)?
        nginxClientClosedRequest499,
    R Function(StatusCode internalServerError500)? internalServerError500,
    R Function(StatusCode notImplemented501)? notImplemented501,
    R Function(StatusCode badGateway502)? badGateway502,
    R Function(StatusCode serviceUnavailable503)? serviceUnavailable503,
    R Function(StatusCode gatewayTimeout504)? gatewayTimeout504,
    R Function(StatusCode httpVersionNotSupported505)?
        httpVersionNotSupported505,
    R Function(StatusCode variantAlsoNegotiates506)? variantAlsoNegotiates506,
    R Function(StatusCode insufficientStorage507)? insufficientStorage507,
    R Function(StatusCode loopDetected508)? loopDetected508,
    R Function(StatusCode bandwidthLimitExceeded509)? bandwidthLimitExceeded509,
    R Function(StatusCode otExtended510)? otExtended510,
    R Function(StatusCode networkAuthenticationRequired511)?
        networkAuthenticationRequired511,
    R Function(StatusCode siteIsFrozen530)? siteIsFrozen530,
    R Function(StatusCode networkConnectTimeoutError599)?
        networkConnectTimeoutError599,
    required R Function() orElse,
  }) {
    if (this == StatusCode.continue100 && continue100 != null) {
      return continue100(this);
    } else if (this == StatusCode.switchingProtocols101 &&
        switchingProtocols101 != null) {
      return switchingProtocols101(this);
    } else if (this == StatusCode.processing102 && processing102 != null) {
      return processing102(this);
    } else if (this == StatusCode.earlyHints103 && earlyHints103 != null) {
      return earlyHints103(this);
    } else if (this == StatusCode.ok200 && ok200 != null) {
      return ok200(this);
    } else if (this == StatusCode.created201 && created201 != null) {
      return created201(this);
    } else if (this == StatusCode.accepted202 && accepted202 != null) {
      return accepted202(this);
    } else if (this == StatusCode.nonAuthoritativeInformation203 &&
        nonAuthoritativeInformation203 != null) {
      return nonAuthoritativeInformation203(this);
    } else if (this == StatusCode.noContent204 && noContent204 != null) {
      return noContent204(this);
    } else if (this == StatusCode.resetContent205 && resetContent205 != null) {
      return resetContent205(this);
    } else if (this == StatusCode.partialContent206 &&
        partialContent206 != null) {
      return partialContent206(this);
    } else if (this == StatusCode.multiStatus207 && multiStatus207 != null) {
      return multiStatus207(this);
    } else if (this == StatusCode.alreadyReported208 &&
        alreadyReported208 != null) {
      return alreadyReported208(this);
    } else if (this == StatusCode.imUsed226 && imUsed226 != null) {
      return imUsed226(this);
    } else if (this == StatusCode.multipleChoices300 &&
        multipleChoices300 != null) {
      return multipleChoices300(this);
    } else if (this == StatusCode.movedPermanently301 &&
        movedPermanently301 != null) {
      return movedPermanently301(this);
    } else if (this == StatusCode.found302 && found302 != null) {
      return found302(this);
    } else if (this == StatusCode.seeOther303 && seeOther303 != null) {
      return seeOther303(this);
    } else if (this == StatusCode.notModified304 && notModified304 != null) {
      return notModified304(this);
    } else if (this == StatusCode.useProxy305 && useProxy305 != null) {
      return useProxy305(this);
    } else if (this == StatusCode.temporaryRedirect307 &&
        temporaryRedirect307 != null) {
      return temporaryRedirect307(this);
    } else if (this == StatusCode.permanentRedirect308 &&
        permanentRedirect308 != null) {
      return permanentRedirect308(this);
    } else if (this == StatusCode.badRequest400 && badRequest400 != null) {
      return badRequest400(this);
    } else if (this == StatusCode.unauthorized401 && unauthorized401 != null) {
      return unauthorized401(this);
    } else if (this == StatusCode.paymentRequired402 &&
        paymentRequired402 != null) {
      return paymentRequired402(this);
    } else if (this == StatusCode.forbidden403 && forbidden403 != null) {
      return forbidden403(this);
    } else if (this == StatusCode.notFound404 && notFound404 != null) {
      return notFound404(this);
    } else if (this == StatusCode.methodNotAllowed405 &&
        methodNotAllowed405 != null) {
      return methodNotAllowed405(this);
    } else if (this == StatusCode.notAcceptable406 &&
        notAcceptable406 != null) {
      return notAcceptable406(this);
    } else if (this == StatusCode.proxyAuthenticationRequired407 &&
        proxyAuthenticationRequired407 != null) {
      return proxyAuthenticationRequired407(this);
    } else if (this == StatusCode.requestTimeout408 &&
        requestTimeout408 != null) {
      return requestTimeout408(this);
    } else if (this == StatusCode.conflict409 && conflict409 != null) {
      return conflict409(this);
    } else if (this == StatusCode.gone410 && gone410 != null) {
      return gone410(this);
    } else if (this == StatusCode.lengthRequired411 &&
        lengthRequired411 != null) {
      return lengthRequired411(this);
    } else if (this == StatusCode.preconditionFailed412 &&
        preconditionFailed412 != null) {
      return preconditionFailed412(this);
    } else if (this == StatusCode.payloadTooLarge413 &&
        payloadTooLarge413 != null) {
      return payloadTooLarge413(this);
    } else if (this == StatusCode.uriTooLong414 && uriTooLong414 != null) {
      return uriTooLong414(this);
    } else if (this == StatusCode.unsupportedMediaType415 &&
        unsupportedMediaType415 != null) {
      return unsupportedMediaType415(this);
    } else if (this == StatusCode.rangeNotSatisfiable416 &&
        rangeNotSatisfiable416 != null) {
      return rangeNotSatisfiable416(this);
    } else if (this == StatusCode.expectationFailed417 &&
        expectationFailed417 != null) {
      return expectationFailed417(this);
    } else if (this == StatusCode.imATeapot418 && imATeapot418 != null) {
      return imATeapot418(this);
    } else if (this == StatusCode.misdirectedRequest421 &&
        misdirectedRequest421 != null) {
      return misdirectedRequest421(this);
    } else if (this == StatusCode.unprocessableEntity422 &&
        unprocessableEntity422 != null) {
      return unprocessableEntity422(this);
    } else if (this == StatusCode.locked423 && locked423 != null) {
      return locked423(this);
    } else if (this == StatusCode.failedDependency424 &&
        failedDependency424 != null) {
      return failedDependency424(this);
    } else if (this == StatusCode.tooEarly425 && tooEarly425 != null) {
      return tooEarly425(this);
    } else if (this == StatusCode.upgradeRequired426 &&
        upgradeRequired426 != null) {
      return upgradeRequired426(this);
    } else if (this == StatusCode.preconditionRequired428 &&
        preconditionRequired428 != null) {
      return preconditionRequired428(this);
    } else if (this == StatusCode.tooManyRequests429 &&
        tooManyRequests429 != null) {
      return tooManyRequests429(this);
    } else if (this == StatusCode.requestHeaderFieldsTooLarge431 &&
        requestHeaderFieldsTooLarge431 != null) {
      return requestHeaderFieldsTooLarge431(this);
    } else if (this == StatusCode.iisLoginTimeout440 &&
        iisLoginTimeout440 != null) {
      return iisLoginTimeout440(this);
    } else if (this == StatusCode.nginxNoResponse444 &&
        nginxNoResponse444 != null) {
      return nginxNoResponse444(this);
    } else if (this == StatusCode.iisRetryWith449 && iisRetryWith449 != null) {
      return iisRetryWith449(this);
    } else if (this == StatusCode.blockedByWindowsParentalControls450 &&
        blockedByWindowsParentalControls450 != null) {
      return blockedByWindowsParentalControls450(this);
    } else if (this == StatusCode.unavailableForLegalReasons451 &&
        unavailableForLegalReasons451 != null) {
      return unavailableForLegalReasons451(this);
    } else if (this == StatusCode.nginxSSLCertificateError495 &&
        nginxSSLCertificateError495 != null) {
      return nginxSSLCertificateError495(this);
    } else if (this == StatusCode.nginxSSLCertificateRequired496 &&
        nginxSSLCertificateRequired496 != null) {
      return nginxSSLCertificateRequired496(this);
    } else if (this == StatusCode.nginxHTTPToHTTPS497 &&
        nginxHTTPToHTTPS497 != null) {
      return nginxHTTPToHTTPS497(this);
    } else if (this == StatusCode.tokenExpired498 && tokenExpired498 != null) {
      return tokenExpired498(this);
    } else if (this == StatusCode.nginxClientClosedRequest499 &&
        nginxClientClosedRequest499 != null) {
      return nginxClientClosedRequest499(this);
    } else if (this == StatusCode.internalServerError500 &&
        internalServerError500 != null) {
      return internalServerError500(this);
    } else if (this == StatusCode.notImplemented501 &&
        notImplemented501 != null) {
      return notImplemented501(this);
    } else if (this == StatusCode.badGateway502 && badGateway502 != null) {
      return badGateway502(this);
    } else if (this == StatusCode.serviceUnavailable503 &&
        serviceUnavailable503 != null) {
      return serviceUnavailable503(this);
    } else if (this == StatusCode.gatewayTimeout504 &&
        gatewayTimeout504 != null) {
      return gatewayTimeout504(this);
    } else if (this == StatusCode.httpVersionNotSupported505 &&
        httpVersionNotSupported505 != null) {
      return httpVersionNotSupported505(this);
    } else if (this == StatusCode.variantAlsoNegotiates506 &&
        variantAlsoNegotiates506 != null) {
      return variantAlsoNegotiates506(this);
    } else if (this == StatusCode.insufficientStorage507 &&
        insufficientStorage507 != null) {
      return insufficientStorage507(this);
    } else if (this == StatusCode.loopDetected508 && loopDetected508 != null) {
      return loopDetected508(this);
    } else if (this == StatusCode.bandwidthLimitExceeded509 &&
        bandwidthLimitExceeded509 != null) {
      return bandwidthLimitExceeded509(this);
    } else if (this == StatusCode.otExtended510 && otExtended510 != null) {
      return otExtended510(this);
    } else if (this == StatusCode.networkAuthenticationRequired511 &&
        networkAuthenticationRequired511 != null) {
      return networkAuthenticationRequired511(this);
    } else if (this == StatusCode.siteIsFrozen530 && siteIsFrozen530 != null) {
      return siteIsFrozen530(this);
    } else if (this == StatusCode.networkConnectTimeoutError599 &&
        networkConnectTimeoutError599 != null) {
      return networkConnectTimeoutError599(this);
    } else {
      return orElse();
    }
  }

  R maybeWhen<R>({
    R Function()? continue100,
    R Function()? switchingProtocols101,
    R Function()? processing102,
    R Function()? earlyHints103,
    R Function()? ok200,
    R Function()? created201,
    R Function()? accepted202,
    R Function()? nonAuthoritativeInformation203,
    R Function()? noContent204,
    R Function()? resetContent205,
    R Function()? partialContent206,
    R Function()? multiStatus207,
    R Function()? alreadyReported208,
    R Function()? imUsed226,
    R Function()? multipleChoices300,
    R Function()? movedPermanently301,
    R Function()? found302,
    R Function()? seeOther303,
    R Function()? notModified304,
    R Function()? useProxy305,
    R Function()? temporaryRedirect307,
    R Function()? permanentRedirect308,
    R Function()? badRequest400,
    R Function()? unauthorized401,
    R Function()? paymentRequired402,
    R Function()? forbidden403,
    R Function()? notFound404,
    R Function()? methodNotAllowed405,
    R Function()? notAcceptable406,
    R Function()? proxyAuthenticationRequired407,
    R Function()? requestTimeout408,
    R Function()? conflict409,
    R Function()? gone410,
    R Function()? lengthRequired411,
    R Function()? preconditionFailed412,
    R Function()? payloadTooLarge413,
    R Function()? uriTooLong414,
    R Function()? unsupportedMediaType415,
    R Function()? rangeNotSatisfiable416,
    R Function()? expectationFailed417,
    R Function()? imATeapot418,
    R Function()? misdirectedRequest421,
    R Function()? unprocessableEntity422,
    R Function()? locked423,
    R Function()? failedDependency424,
    R Function()? tooEarly425,
    R Function()? upgradeRequired426,
    R Function()? preconditionRequired428,
    R Function()? tooManyRequests429,
    R Function()? requestHeaderFieldsTooLarge431,
    R Function()? iisLoginTimeout440,
    R Function()? nginxNoResponse444,
    R Function()? iisRetryWith449,
    R Function()? blockedByWindowsParentalControls450,
    R Function()? unavailableForLegalReasons451,
    R Function()? nginxSSLCertificateError495,
    R Function()? nginxSSLCertificateRequired496,
    R Function()? nginxHTTPToHTTPS497,
    R Function()? tokenExpired498,
    R Function()? nginxClientClosedRequest499,
    R Function()? internalServerError500,
    R Function()? notImplemented501,
    R Function()? badGateway502,
    R Function()? serviceUnavailable503,
    R Function()? gatewayTimeout504,
    R Function()? httpVersionNotSupported505,
    R Function()? variantAlsoNegotiates506,
    R Function()? insufficientStorage507,
    R Function()? loopDetected508,
    R Function()? bandwidthLimitExceeded509,
    R Function()? otExtended510,
    R Function()? networkAuthenticationRequired511,
    R Function()? siteIsFrozen530,
    R Function()? networkConnectTimeoutError599,
    required R Function() orElse,
  }) {
    if (this == StatusCode.continue100 && continue100 != null) {
      return continue100();
    } else if (this == StatusCode.switchingProtocols101 &&
        switchingProtocols101 != null) {
      return switchingProtocols101();
    } else if (this == StatusCode.processing102 && processing102 != null) {
      return processing102();
    } else if (this == StatusCode.earlyHints103 && earlyHints103 != null) {
      return earlyHints103();
    } else if (this == StatusCode.ok200 && ok200 != null) {
      return ok200();
    } else if (this == StatusCode.created201 && created201 != null) {
      return created201();
    } else if (this == StatusCode.accepted202 && accepted202 != null) {
      return accepted202();
    } else if (this == StatusCode.nonAuthoritativeInformation203 &&
        nonAuthoritativeInformation203 != null) {
      return nonAuthoritativeInformation203();
    } else if (this == StatusCode.noContent204 && noContent204 != null) {
      return noContent204();
    } else if (this == StatusCode.resetContent205 && resetContent205 != null) {
      return resetContent205();
    } else if (this == StatusCode.partialContent206 &&
        partialContent206 != null) {
      return partialContent206();
    } else if (this == StatusCode.multiStatus207 && multiStatus207 != null) {
      return multiStatus207();
    } else if (this == StatusCode.alreadyReported208 &&
        alreadyReported208 != null) {
      return alreadyReported208();
    } else if (this == StatusCode.imUsed226 && imUsed226 != null) {
      return imUsed226();
    } else if (this == StatusCode.multipleChoices300 &&
        multipleChoices300 != null) {
      return multipleChoices300();
    } else if (this == StatusCode.movedPermanently301 &&
        movedPermanently301 != null) {
      return movedPermanently301();
    } else if (this == StatusCode.found302 && found302 != null) {
      return found302();
    } else if (this == StatusCode.seeOther303 && seeOther303 != null) {
      return seeOther303();
    } else if (this == StatusCode.notModified304 && notModified304 != null) {
      return notModified304();
    } else if (this == StatusCode.useProxy305 && useProxy305 != null) {
      return useProxy305();
    } else if (this == StatusCode.temporaryRedirect307 &&
        temporaryRedirect307 != null) {
      return temporaryRedirect307();
    } else if (this == StatusCode.permanentRedirect308 &&
        permanentRedirect308 != null) {
      return permanentRedirect308();
    } else if (this == StatusCode.badRequest400 && badRequest400 != null) {
      return badRequest400();
    } else if (this == StatusCode.unauthorized401 && unauthorized401 != null) {
      return unauthorized401();
    } else if (this == StatusCode.paymentRequired402 &&
        paymentRequired402 != null) {
      return paymentRequired402();
    } else if (this == StatusCode.forbidden403 && forbidden403 != null) {
      return forbidden403();
    } else if (this == StatusCode.notFound404 && notFound404 != null) {
      return notFound404();
    } else if (this == StatusCode.methodNotAllowed405 &&
        methodNotAllowed405 != null) {
      return methodNotAllowed405();
    } else if (this == StatusCode.notAcceptable406 &&
        notAcceptable406 != null) {
      return notAcceptable406();
    } else if (this == StatusCode.proxyAuthenticationRequired407 &&
        proxyAuthenticationRequired407 != null) {
      return proxyAuthenticationRequired407();
    } else if (this == StatusCode.requestTimeout408 &&
        requestTimeout408 != null) {
      return requestTimeout408();
    } else if (this == StatusCode.conflict409 && conflict409 != null) {
      return conflict409();
    } else if (this == StatusCode.gone410 && gone410 != null) {
      return gone410();
    } else if (this == StatusCode.lengthRequired411 &&
        lengthRequired411 != null) {
      return lengthRequired411();
    } else if (this == StatusCode.preconditionFailed412 &&
        preconditionFailed412 != null) {
      return preconditionFailed412();
    } else if (this == StatusCode.payloadTooLarge413 &&
        payloadTooLarge413 != null) {
      return payloadTooLarge413();
    } else if (this == StatusCode.uriTooLong414 && uriTooLong414 != null) {
      return uriTooLong414();
    } else if (this == StatusCode.unsupportedMediaType415 &&
        unsupportedMediaType415 != null) {
      return unsupportedMediaType415();
    } else if (this == StatusCode.rangeNotSatisfiable416 &&
        rangeNotSatisfiable416 != null) {
      return rangeNotSatisfiable416();
    } else if (this == StatusCode.expectationFailed417 &&
        expectationFailed417 != null) {
      return expectationFailed417();
    } else if (this == StatusCode.imATeapot418 && imATeapot418 != null) {
      return imATeapot418();
    } else if (this == StatusCode.misdirectedRequest421 &&
        misdirectedRequest421 != null) {
      return misdirectedRequest421();
    } else if (this == StatusCode.unprocessableEntity422 &&
        unprocessableEntity422 != null) {
      return unprocessableEntity422();
    } else if (this == StatusCode.locked423 && locked423 != null) {
      return locked423();
    } else if (this == StatusCode.failedDependency424 &&
        failedDependency424 != null) {
      return failedDependency424();
    } else if (this == StatusCode.tooEarly425 && tooEarly425 != null) {
      return tooEarly425();
    } else if (this == StatusCode.upgradeRequired426 &&
        upgradeRequired426 != null) {
      return upgradeRequired426();
    } else if (this == StatusCode.preconditionRequired428 &&
        preconditionRequired428 != null) {
      return preconditionRequired428();
    } else if (this == StatusCode.tooManyRequests429 &&
        tooManyRequests429 != null) {
      return tooManyRequests429();
    } else if (this == StatusCode.requestHeaderFieldsTooLarge431 &&
        requestHeaderFieldsTooLarge431 != null) {
      return requestHeaderFieldsTooLarge431();
    } else if (this == StatusCode.iisLoginTimeout440 &&
        iisLoginTimeout440 != null) {
      return iisLoginTimeout440();
    } else if (this == StatusCode.nginxNoResponse444 &&
        nginxNoResponse444 != null) {
      return nginxNoResponse444();
    } else if (this == StatusCode.iisRetryWith449 && iisRetryWith449 != null) {
      return iisRetryWith449();
    } else if (this == StatusCode.blockedByWindowsParentalControls450 &&
        blockedByWindowsParentalControls450 != null) {
      return blockedByWindowsParentalControls450();
    } else if (this == StatusCode.unavailableForLegalReasons451 &&
        unavailableForLegalReasons451 != null) {
      return unavailableForLegalReasons451();
    } else if (this == StatusCode.nginxSSLCertificateError495 &&
        nginxSSLCertificateError495 != null) {
      return nginxSSLCertificateError495();
    } else if (this == StatusCode.nginxSSLCertificateRequired496 &&
        nginxSSLCertificateRequired496 != null) {
      return nginxSSLCertificateRequired496();
    } else if (this == StatusCode.nginxHTTPToHTTPS497 &&
        nginxHTTPToHTTPS497 != null) {
      return nginxHTTPToHTTPS497();
    } else if (this == StatusCode.tokenExpired498 && tokenExpired498 != null) {
      return tokenExpired498();
    } else if (this == StatusCode.nginxClientClosedRequest499 &&
        nginxClientClosedRequest499 != null) {
      return nginxClientClosedRequest499();
    } else if (this == StatusCode.internalServerError500 &&
        internalServerError500 != null) {
      return internalServerError500();
    } else if (this == StatusCode.notImplemented501 &&
        notImplemented501 != null) {
      return notImplemented501();
    } else if (this == StatusCode.badGateway502 && badGateway502 != null) {
      return badGateway502();
    } else if (this == StatusCode.serviceUnavailable503 &&
        serviceUnavailable503 != null) {
      return serviceUnavailable503();
    } else if (this == StatusCode.gatewayTimeout504 &&
        gatewayTimeout504 != null) {
      return gatewayTimeout504();
    } else if (this == StatusCode.httpVersionNotSupported505 &&
        httpVersionNotSupported505 != null) {
      return httpVersionNotSupported505();
    } else if (this == StatusCode.variantAlsoNegotiates506 &&
        variantAlsoNegotiates506 != null) {
      return variantAlsoNegotiates506();
    } else if (this == StatusCode.insufficientStorage507 &&
        insufficientStorage507 != null) {
      return insufficientStorage507();
    } else if (this == StatusCode.loopDetected508 && loopDetected508 != null) {
      return loopDetected508();
    } else if (this == StatusCode.bandwidthLimitExceeded509 &&
        bandwidthLimitExceeded509 != null) {
      return bandwidthLimitExceeded509();
    } else if (this == StatusCode.otExtended510 && otExtended510 != null) {
      return otExtended510();
    } else if (this == StatusCode.networkAuthenticationRequired511 &&
        networkAuthenticationRequired511 != null) {
      return networkAuthenticationRequired511();
    } else if (this == StatusCode.siteIsFrozen530 && siteIsFrozen530 != null) {
      return siteIsFrozen530();
    } else if (this == StatusCode.networkConnectTimeoutError599 &&
        networkConnectTimeoutError599 != null) {
      return networkConnectTimeoutError599();
    } else {
      return orElse();
    }
  }

  R when<R>({
    required R Function() continue100,
    required R Function() switchingProtocols101,
    required R Function() processing102,
    required R Function() earlyHints103,
    required R Function() ok200,
    required R Function() created201,
    required R Function() accepted202,
    required R Function() nonAuthoritativeInformation203,
    required R Function() noContent204,
    required R Function() resetContent205,
    required R Function() partialContent206,
    required R Function() multiStatus207,
    required R Function() alreadyReported208,
    required R Function() imUsed226,
    required R Function() multipleChoices300,
    required R Function() movedPermanently301,
    required R Function() found302,
    required R Function() seeOther303,
    required R Function() notModified304,
    required R Function() useProxy305,
    required R Function() temporaryRedirect307,
    required R Function() permanentRedirect308,
    required R Function() badRequest400,
    required R Function() unauthorized401,
    required R Function() paymentRequired402,
    required R Function() forbidden403,
    required R Function() notFound404,
    required R Function() methodNotAllowed405,
    required R Function() notAcceptable406,
    required R Function() proxyAuthenticationRequired407,
    required R Function() requestTimeout408,
    required R Function() conflict409,
    required R Function() gone410,
    required R Function() lengthRequired411,
    required R Function() preconditionFailed412,
    required R Function() payloadTooLarge413,
    required R Function() uriTooLong414,
    required R Function() unsupportedMediaType415,
    required R Function() rangeNotSatisfiable416,
    required R Function() expectationFailed417,
    required R Function() imATeapot418,
    required R Function() misdirectedRequest421,
    required R Function() unprocessableEntity422,
    required R Function() locked423,
    required R Function() failedDependency424,
    required R Function() tooEarly425,
    required R Function() upgradeRequired426,
    required R Function() preconditionRequired428,
    required R Function() tooManyRequests429,
    required R Function() requestHeaderFieldsTooLarge431,
    required R Function() iisLoginTimeout440,
    required R Function() nginxNoResponse444,
    required R Function() iisRetryWith449,
    required R Function() blockedByWindowsParentalControls450,
    required R Function() unavailableForLegalReasons451,
    required R Function() nginxSSLCertificateError495,
    required R Function() nginxSSLCertificateRequired496,
    required R Function() nginxHTTPToHTTPS497,
    required R Function() tokenExpired498,
    required R Function() nginxClientClosedRequest499,
    required R Function() internalServerError500,
    required R Function() notImplemented501,
    required R Function() badGateway502,
    required R Function() serviceUnavailable503,
    required R Function() gatewayTimeout504,
    required R Function() httpVersionNotSupported505,
    required R Function() variantAlsoNegotiates506,
    required R Function() insufficientStorage507,
    required R Function() loopDetected508,
    required R Function() bandwidthLimitExceeded509,
    required R Function() otExtended510,
    required R Function() networkAuthenticationRequired511,
    required R Function() siteIsFrozen530,
    required R Function() networkConnectTimeoutError599,
  }) {
    switch (this) {
      case StatusCode.continue100:
        return continue100();
      case StatusCode.switchingProtocols101:
        return switchingProtocols101();
      case StatusCode.processing102:
        return processing102();
      case StatusCode.earlyHints103:
        return earlyHints103();
      case StatusCode.ok200:
        return ok200();
      case StatusCode.created201:
        return created201();
      case StatusCode.accepted202:
        return accepted202();
      case StatusCode.nonAuthoritativeInformation203:
        return nonAuthoritativeInformation203();
      case StatusCode.noContent204:
        return noContent204();
      case StatusCode.resetContent205:
        return resetContent205();
      case StatusCode.partialContent206:
        return partialContent206();
      case StatusCode.multiStatus207:
        return multiStatus207();
      case StatusCode.alreadyReported208:
        return alreadyReported208();
      case StatusCode.imUsed226:
        return imUsed226();
      case StatusCode.multipleChoices300:
        return multipleChoices300();
      case StatusCode.movedPermanently301:
        return movedPermanently301();
      case StatusCode.found302:
        return found302();
      case StatusCode.seeOther303:
        return seeOther303();
      case StatusCode.notModified304:
        return notModified304();
      case StatusCode.useProxy305:
        return useProxy305();
      case StatusCode.temporaryRedirect307:
        return temporaryRedirect307();
      case StatusCode.permanentRedirect308:
        return permanentRedirect308();
      case StatusCode.badRequest400:
        return badRequest400();
      case StatusCode.unauthorized401:
        return unauthorized401();
      case StatusCode.paymentRequired402:
        return paymentRequired402();
      case StatusCode.forbidden403:
        return forbidden403();
      case StatusCode.notFound404:
        return notFound404();
      case StatusCode.methodNotAllowed405:
        return methodNotAllowed405();
      case StatusCode.notAcceptable406:
        return notAcceptable406();
      case StatusCode.proxyAuthenticationRequired407:
        return proxyAuthenticationRequired407();
      case StatusCode.requestTimeout408:
        return requestTimeout408();
      case StatusCode.conflict409:
        return conflict409();
      case StatusCode.gone410:
        return gone410();
      case StatusCode.lengthRequired411:
        return lengthRequired411();
      case StatusCode.preconditionFailed412:
        return preconditionFailed412();
      case StatusCode.payloadTooLarge413:
        return payloadTooLarge413();
      case StatusCode.uriTooLong414:
        return uriTooLong414();
      case StatusCode.unsupportedMediaType415:
        return unsupportedMediaType415();
      case StatusCode.rangeNotSatisfiable416:
        return rangeNotSatisfiable416();
      case StatusCode.expectationFailed417:
        return expectationFailed417();
      case StatusCode.imATeapot418:
        return imATeapot418();
      case StatusCode.misdirectedRequest421:
        return misdirectedRequest421();
      case StatusCode.unprocessableEntity422:
        return unprocessableEntity422();
      case StatusCode.locked423:
        return locked423();
      case StatusCode.failedDependency424:
        return failedDependency424();
      case StatusCode.tooEarly425:
        return tooEarly425();
      case StatusCode.upgradeRequired426:
        return upgradeRequired426();
      case StatusCode.preconditionRequired428:
        return preconditionRequired428();
      case StatusCode.tooManyRequests429:
        return tooManyRequests429();
      case StatusCode.requestHeaderFieldsTooLarge431:
        return requestHeaderFieldsTooLarge431();
      case StatusCode.iisLoginTimeout440:
        return iisLoginTimeout440();
      case StatusCode.nginxNoResponse444:
        return nginxNoResponse444();
      case StatusCode.iisRetryWith449:
        return iisRetryWith449();
      case StatusCode.blockedByWindowsParentalControls450:
        return blockedByWindowsParentalControls450();
      case StatusCode.unavailableForLegalReasons451:
        return unavailableForLegalReasons451();
      case StatusCode.nginxSSLCertificateError495:
        return nginxSSLCertificateError495();
      case StatusCode.nginxSSLCertificateRequired496:
        return nginxSSLCertificateRequired496();
      case StatusCode.nginxHTTPToHTTPS497:
        return nginxHTTPToHTTPS497();
      case StatusCode.tokenExpired498:
        return tokenExpired498();
      case StatusCode.nginxClientClosedRequest499:
        return nginxClientClosedRequest499();
      case StatusCode.internalServerError500:
        return internalServerError500();
      case StatusCode.notImplemented501:
        return notImplemented501();
      case StatusCode.badGateway502:
        return badGateway502();
      case StatusCode.serviceUnavailable503:
        return serviceUnavailable503();
      case StatusCode.gatewayTimeout504:
        return gatewayTimeout504();
      case StatusCode.httpVersionNotSupported505:
        return httpVersionNotSupported505();
      case StatusCode.variantAlsoNegotiates506:
        return variantAlsoNegotiates506();
      case StatusCode.insufficientStorage507:
        return insufficientStorage507();
      case StatusCode.loopDetected508:
        return loopDetected508();
      case StatusCode.bandwidthLimitExceeded509:
        return bandwidthLimitExceeded509();
      case StatusCode.otExtended510:
        return otExtended510();
      case StatusCode.networkAuthenticationRequired511:
        return networkAuthenticationRequired511();
      case StatusCode.siteIsFrozen530:
        return siteIsFrozen530();
      case StatusCode.networkConnectTimeoutError599:
        return networkConnectTimeoutError599();
    }
  }

  R? whenOrNull<R>({
    R Function()? continue100,
    R Function()? switchingProtocols101,
    R Function()? processing102,
    R Function()? earlyHints103,
    R Function()? ok200,
    R Function()? created201,
    R Function()? accepted202,
    R Function()? nonAuthoritativeInformation203,
    R Function()? noContent204,
    R Function()? resetContent205,
    R Function()? partialContent206,
    R Function()? multiStatus207,
    R Function()? alreadyReported208,
    R Function()? imUsed226,
    R Function()? multipleChoices300,
    R Function()? movedPermanently301,
    R Function()? found302,
    R Function()? seeOther303,
    R Function()? notModified304,
    R Function()? useProxy305,
    R Function()? temporaryRedirect307,
    R Function()? permanentRedirect308,
    R Function()? badRequest400,
    R Function()? unauthorized401,
    R Function()? paymentRequired402,
    R Function()? forbidden403,
    R Function()? notFound404,
    R Function()? methodNotAllowed405,
    R Function()? notAcceptable406,
    R Function()? proxyAuthenticationRequired407,
    R Function()? requestTimeout408,
    R Function()? conflict409,
    R Function()? gone410,
    R Function()? lengthRequired411,
    R Function()? preconditionFailed412,
    R Function()? payloadTooLarge413,
    R Function()? uriTooLong414,
    R Function()? unsupportedMediaType415,
    R Function()? rangeNotSatisfiable416,
    R Function()? expectationFailed417,
    R Function()? imATeapot418,
    R Function()? misdirectedRequest421,
    R Function()? unprocessableEntity422,
    R Function()? locked423,
    R Function()? failedDependency424,
    R Function()? tooEarly425,
    R Function()? upgradeRequired426,
    R Function()? preconditionRequired428,
    R Function()? tooManyRequests429,
    R Function()? requestHeaderFieldsTooLarge431,
    R Function()? iisLoginTimeout440,
    R Function()? nginxNoResponse444,
    R Function()? iisRetryWith449,
    R Function()? blockedByWindowsParentalControls450,
    R Function()? unavailableForLegalReasons451,
    R Function()? nginxSSLCertificateError495,
    R Function()? nginxSSLCertificateRequired496,
    R Function()? nginxHTTPToHTTPS497,
    R Function()? tokenExpired498,
    R Function()? nginxClientClosedRequest499,
    R Function()? internalServerError500,
    R Function()? notImplemented501,
    R Function()? badGateway502,
    R Function()? serviceUnavailable503,
    R Function()? gatewayTimeout504,
    R Function()? httpVersionNotSupported505,
    R Function()? variantAlsoNegotiates506,
    R Function()? insufficientStorage507,
    R Function()? loopDetected508,
    R Function()? bandwidthLimitExceeded509,
    R Function()? otExtended510,
    R Function()? networkAuthenticationRequired511,
    R Function()? siteIsFrozen530,
    R Function()? networkConnectTimeoutError599,
    R Function()? orElse,
  }) {
    if (this == StatusCode.continue100 && continue100 != null) {
      return continue100();
    } else if (this == StatusCode.switchingProtocols101 &&
        switchingProtocols101 != null) {
      return switchingProtocols101();
    } else if (this == StatusCode.processing102 && processing102 != null) {
      return processing102();
    } else if (this == StatusCode.earlyHints103 && earlyHints103 != null) {
      return earlyHints103();
    } else if (this == StatusCode.ok200 && ok200 != null) {
      return ok200();
    } else if (this == StatusCode.created201 && created201 != null) {
      return created201();
    } else if (this == StatusCode.accepted202 && accepted202 != null) {
      return accepted202();
    } else if (this == StatusCode.nonAuthoritativeInformation203 &&
        nonAuthoritativeInformation203 != null) {
      return nonAuthoritativeInformation203();
    } else if (this == StatusCode.noContent204 && noContent204 != null) {
      return noContent204();
    } else if (this == StatusCode.resetContent205 && resetContent205 != null) {
      return resetContent205();
    } else if (this == StatusCode.partialContent206 &&
        partialContent206 != null) {
      return partialContent206();
    } else if (this == StatusCode.multiStatus207 && multiStatus207 != null) {
      return multiStatus207();
    } else if (this == StatusCode.alreadyReported208 &&
        alreadyReported208 != null) {
      return alreadyReported208();
    } else if (this == StatusCode.imUsed226 && imUsed226 != null) {
      return imUsed226();
    } else if (this == StatusCode.multipleChoices300 &&
        multipleChoices300 != null) {
      return multipleChoices300();
    } else if (this == StatusCode.movedPermanently301 &&
        movedPermanently301 != null) {
      return movedPermanently301();
    } else if (this == StatusCode.found302 && found302 != null) {
      return found302();
    } else if (this == StatusCode.seeOther303 && seeOther303 != null) {
      return seeOther303();
    } else if (this == StatusCode.notModified304 && notModified304 != null) {
      return notModified304();
    } else if (this == StatusCode.useProxy305 && useProxy305 != null) {
      return useProxy305();
    } else if (this == StatusCode.temporaryRedirect307 &&
        temporaryRedirect307 != null) {
      return temporaryRedirect307();
    } else if (this == StatusCode.permanentRedirect308 &&
        permanentRedirect308 != null) {
      return permanentRedirect308();
    } else if (this == StatusCode.badRequest400 && badRequest400 != null) {
      return badRequest400();
    } else if (this == StatusCode.unauthorized401 && unauthorized401 != null) {
      return unauthorized401();
    } else if (this == StatusCode.paymentRequired402 &&
        paymentRequired402 != null) {
      return paymentRequired402();
    } else if (this == StatusCode.forbidden403 && forbidden403 != null) {
      return forbidden403();
    } else if (this == StatusCode.notFound404 && notFound404 != null) {
      return notFound404();
    } else if (this == StatusCode.methodNotAllowed405 &&
        methodNotAllowed405 != null) {
      return methodNotAllowed405();
    } else if (this == StatusCode.notAcceptable406 &&
        notAcceptable406 != null) {
      return notAcceptable406();
    } else if (this == StatusCode.proxyAuthenticationRequired407 &&
        proxyAuthenticationRequired407 != null) {
      return proxyAuthenticationRequired407();
    } else if (this == StatusCode.requestTimeout408 &&
        requestTimeout408 != null) {
      return requestTimeout408();
    } else if (this == StatusCode.conflict409 && conflict409 != null) {
      return conflict409();
    } else if (this == StatusCode.gone410 && gone410 != null) {
      return gone410();
    } else if (this == StatusCode.lengthRequired411 &&
        lengthRequired411 != null) {
      return lengthRequired411();
    } else if (this == StatusCode.preconditionFailed412 &&
        preconditionFailed412 != null) {
      return preconditionFailed412();
    } else if (this == StatusCode.payloadTooLarge413 &&
        payloadTooLarge413 != null) {
      return payloadTooLarge413();
    } else if (this == StatusCode.uriTooLong414 && uriTooLong414 != null) {
      return uriTooLong414();
    } else if (this == StatusCode.unsupportedMediaType415 &&
        unsupportedMediaType415 != null) {
      return unsupportedMediaType415();
    } else if (this == StatusCode.rangeNotSatisfiable416 &&
        rangeNotSatisfiable416 != null) {
      return rangeNotSatisfiable416();
    } else if (this == StatusCode.expectationFailed417 &&
        expectationFailed417 != null) {
      return expectationFailed417();
    } else if (this == StatusCode.imATeapot418 && imATeapot418 != null) {
      return imATeapot418();
    } else if (this == StatusCode.misdirectedRequest421 &&
        misdirectedRequest421 != null) {
      return misdirectedRequest421();
    } else if (this == StatusCode.unprocessableEntity422 &&
        unprocessableEntity422 != null) {
      return unprocessableEntity422();
    } else if (this == StatusCode.locked423 && locked423 != null) {
      return locked423();
    } else if (this == StatusCode.failedDependency424 &&
        failedDependency424 != null) {
      return failedDependency424();
    } else if (this == StatusCode.tooEarly425 && tooEarly425 != null) {
      return tooEarly425();
    } else if (this == StatusCode.upgradeRequired426 &&
        upgradeRequired426 != null) {
      return upgradeRequired426();
    } else if (this == StatusCode.preconditionRequired428 &&
        preconditionRequired428 != null) {
      return preconditionRequired428();
    } else if (this == StatusCode.tooManyRequests429 &&
        tooManyRequests429 != null) {
      return tooManyRequests429();
    } else if (this == StatusCode.requestHeaderFieldsTooLarge431 &&
        requestHeaderFieldsTooLarge431 != null) {
      return requestHeaderFieldsTooLarge431();
    } else if (this == StatusCode.iisLoginTimeout440 &&
        iisLoginTimeout440 != null) {
      return iisLoginTimeout440();
    } else if (this == StatusCode.nginxNoResponse444 &&
        nginxNoResponse444 != null) {
      return nginxNoResponse444();
    } else if (this == StatusCode.iisRetryWith449 && iisRetryWith449 != null) {
      return iisRetryWith449();
    } else if (this == StatusCode.blockedByWindowsParentalControls450 &&
        blockedByWindowsParentalControls450 != null) {
      return blockedByWindowsParentalControls450();
    } else if (this == StatusCode.unavailableForLegalReasons451 &&
        unavailableForLegalReasons451 != null) {
      return unavailableForLegalReasons451();
    } else if (this == StatusCode.nginxSSLCertificateError495 &&
        nginxSSLCertificateError495 != null) {
      return nginxSSLCertificateError495();
    } else if (this == StatusCode.nginxSSLCertificateRequired496 &&
        nginxSSLCertificateRequired496 != null) {
      return nginxSSLCertificateRequired496();
    } else if (this == StatusCode.nginxHTTPToHTTPS497 &&
        nginxHTTPToHTTPS497 != null) {
      return nginxHTTPToHTTPS497();
    } else if (this == StatusCode.tokenExpired498 && tokenExpired498 != null) {
      return tokenExpired498();
    } else if (this == StatusCode.nginxClientClosedRequest499 &&
        nginxClientClosedRequest499 != null) {
      return nginxClientClosedRequest499();
    } else if (this == StatusCode.internalServerError500 &&
        internalServerError500 != null) {
      return internalServerError500();
    } else if (this == StatusCode.notImplemented501 &&
        notImplemented501 != null) {
      return notImplemented501();
    } else if (this == StatusCode.badGateway502 && badGateway502 != null) {
      return badGateway502();
    } else if (this == StatusCode.serviceUnavailable503 &&
        serviceUnavailable503 != null) {
      return serviceUnavailable503();
    } else if (this == StatusCode.gatewayTimeout504 &&
        gatewayTimeout504 != null) {
      return gatewayTimeout504();
    } else if (this == StatusCode.httpVersionNotSupported505 &&
        httpVersionNotSupported505 != null) {
      return httpVersionNotSupported505();
    } else if (this == StatusCode.variantAlsoNegotiates506 &&
        variantAlsoNegotiates506 != null) {
      return variantAlsoNegotiates506();
    } else if (this == StatusCode.insufficientStorage507 &&
        insufficientStorage507 != null) {
      return insufficientStorage507();
    } else if (this == StatusCode.loopDetected508 && loopDetected508 != null) {
      return loopDetected508();
    } else if (this == StatusCode.bandwidthLimitExceeded509 &&
        bandwidthLimitExceeded509 != null) {
      return bandwidthLimitExceeded509();
    } else if (this == StatusCode.otExtended510 && otExtended510 != null) {
      return otExtended510();
    } else if (this == StatusCode.networkAuthenticationRequired511 &&
        networkAuthenticationRequired511 != null) {
      return networkAuthenticationRequired511();
    } else if (this == StatusCode.siteIsFrozen530 && siteIsFrozen530 != null) {
      return siteIsFrozen530();
    } else if (this == StatusCode.networkConnectTimeoutError599 &&
        networkConnectTimeoutError599 != null) {
      return networkConnectTimeoutError599();
    } else {
      return orElse?.call();
    }
  }
}
