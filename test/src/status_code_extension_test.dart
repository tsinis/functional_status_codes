// ignore_for_file: deprecated_member_use_from_same_package, it's TODO!

import 'package:functional_status_codes/src/status_code.dart';
import 'package:functional_status_codes/src/status_code_extension.dart';
import 'package:test/test.dart';

void main() => group('StatusCodeExtension', () {
  const custom = StatusCode.custom(144);
  group('Basic properties', () {
    for (final statusCode in StatusCode.values) {
      test('$statusCode has correct reason phrase', () {
        expect(statusCode.reason, isNotEmpty);
        expect(statusCode.reason, isA<String>());
      });

      test('$statusCode has correct isOfficial flag', () {
        expect(statusCode.isOfficial, isA<bool>());
        expect(
          statusCode.isOfficial,
          equals(StatusCode.officialCodes.contains(statusCode)),
        );
      });

      test(
        '$statusCode isCustom returns false for all values',
        () => expect(statusCode.isCustom, isFalse),
      );

      test('$statusCode toStringShallow contains code and reason', () {
        final result = statusCode.toStringShallow();
        expect(result, contains('StatusCode'));
        expect(result, contains('reason:'));
        expect(result, contains('isOfficial:'));
        expect(result, contains(statusCode.toString()));
      });
    }

    test('custom status code has correct isCustom flag', () {
      const customCode = StatusCode.custom(150);
      expect(customCode.isCustom, isTrue);
      expect(customCode.isOfficial, isFalse);
      expect(customCode.reason, contains('Custom status code'));
    });
  });

  group('Deprecated getters', () {
    test('index returns correct position in values', () {
      const code = StatusCode.okHttp200;
      expect(code.index, equals(StatusCode.values.indexOf(code)));
    });

    test(
      'code returns the status code value',
      () => expect(StatusCode.okHttp200.code, equals(200)),
    );

    test('name returns toStringShallow', () {
      const code = StatusCode.okHttp200;
      expect(code.name, equals(code.toStringShallow()));
    });
  });

  group('Boolean getters for specific status codes', () {
    // ignore: prefer-typedefs-for-callbacks, it's just a test.
    final testCases = <StatusCode, bool Function(StatusCode ext)>{
      StatusCode.acceptedHttp202: (ext) => ext.isAcceptedHttp202,
      StatusCode.alreadyReportedHttp208: (ext) => ext.isAlreadyReportedHttp208,
      StatusCode.badGatewayHttp502: (ext) => ext.isBadGatewayHttp502,
      StatusCode.badRequestHttp400: (ext) => ext.isBadRequestHttp400,
      StatusCode.bandwidthLimitExceededHttp509: (ext) =>
          ext.isBandwidthLimitExceededHttp509,
      StatusCode.blockedByWindowsParentalControlsHttp450: (ext) =>
          ext.isBlockedByWindowsParentalControlsHttp450,
      StatusCode.clientClosedConnectionHttp460: (ext) =>
          ext.isClientClosedConnectionHttp460,
      StatusCode.conflictHttp409: (ext) => ext.isConflictHttp409,
      StatusCode.connectionTimedOutHttp522: (ext) =>
          ext.isConnectionTimedOutHttp522,
      StatusCode.continueHttp100: (ext) => ext.isContinueHttp100,
      StatusCode.createdHttp201: (ext) => ext.isCreatedHttp201,
      StatusCode.earlyHintsHttp103: (ext) => ext.isEarlyHintsHttp103,
      StatusCode.enhanceYourCalmHttp420: (ext) => ext.isEnhanceYourCalmHttp420,
      StatusCode.expectationFailedHttp417: (ext) =>
          ext.isExpectationFailedHttp417,
      StatusCode.failedDependencyHttp424: (ext) =>
          ext.isFailedDependencyHttp424,
      StatusCode.forbiddenHttp403: (ext) => ext.isForbiddenHttp403,
      StatusCode.foundHttp302: (ext) => ext.isFoundHttp302,
      StatusCode.gatewayTimeoutHttp504: (ext) => ext.isGatewayTimeoutHttp504,
      StatusCode.goneHttp410: (ext) => ext.isGoneHttp410,
      StatusCode.httpVersionNotSupportedHttp505: (ext) =>
          ext.isHttpVersionNotSupportedHttp505,
      StatusCode.iisLoginTimeoutHttp440: (ext) => ext.isIisLoginTimeoutHttp440,
      StatusCode.iisRetryWithHttp449: (ext) => ext.isIisRetryWithHttp449,
      StatusCode.imATeapotHttp418: (ext) => ext.isImATeapotHttp418,
      StatusCode.imUsedHttp226: (ext) => ext.isImUsedHttp226,
      StatusCode.incompatibleProtocolVersionsHttp464: (ext) =>
          ext.isIncompatibleProtocolVersionsHttp464,
      StatusCode.insufficientStorageHttp507: (ext) =>
          ext.isInsufficientStorageHttp507,
      StatusCode.internalServerErrorHttp500: (ext) =>
          ext.isInternalServerErrorHttp500,
      StatusCode.invalidSSLCertificateHttp526: (ext) =>
          ext.isInvalidSSLCertificateHttp526,
      StatusCode.lengthRequiredHttp411: (ext) => ext.isLengthRequiredHttp411,
      StatusCode.lockedHttp423: (ext) => ext.isLockedHttp423,
      StatusCode.loopDetectedHttp508: (ext) => ext.isLoopDetectedHttp508,
      StatusCode.methodNotAllowedHttp405: (ext) =>
          ext.isMethodNotAllowedHttp405,
      StatusCode.misdirectedRequestHttp421: (ext) =>
          ext.isMisdirectedRequestHttp421,
      StatusCode.movedPermanentlyHttp301: (ext) =>
          ext.isMovedPermanentlyHttp301,
      StatusCode.multiStatusHttp207: (ext) => ext.isMultiStatusHttp207,
      StatusCode.multipleChoicesHttp300: (ext) => ext.isMultipleChoicesHttp300,
      StatusCode.networkAuthenticationRequiredHttp511: (ext) =>
          ext.isNetworkAuthenticationRequiredHttp511,
      StatusCode.networkConnectTimeoutErrorHttp599: (ext) =>
          ext.isNetworkConnectTimeoutErrorHttp599,
      StatusCode.networkReadTimeoutErrorHttp598: (ext) =>
          ext.isNetworkReadTimeoutErrorHttp598,
      StatusCode.nginxClientClosedRequestHttp499: (ext) =>
          ext.isNginxClientClosedRequestHttp499,
      StatusCode.nginxHTTPToHTTPSHttp497: (ext) =>
          ext.isNginxHTTPToHTTPSHttp497,
      StatusCode.nginxNoResponseHttp444: (ext) => ext.isNginxNoResponseHttp444,
      StatusCode.nginxSSLCertificateErrorHttp495: (ext) =>
          ext.isNginxSSLCertificateErrorHttp495,
      StatusCode.nginxSSLCertificateRequiredHttp496: (ext) =>
          ext.isNginxSSLCertificateRequiredHttp496,
      StatusCode.noContentHttp204: (ext) => ext.isNoContentHttp204,
      StatusCode.nonAuthoritativeInformationHttp203: (ext) =>
          ext.isNonAuthoritativeInformationHttp203,
      StatusCode.notAcceptableHttp406: (ext) => ext.isNotAcceptableHttp406,
      StatusCode.notFoundHttp404: (ext) => ext.isNotFoundHttp404,
      StatusCode.notImplementedHttp501: (ext) => ext.isNotImplementedHttp501,
      StatusCode.notModifiedHttp304: (ext) => ext.isNotModifiedHttp304,
      StatusCode.okHttp200: (ext) => ext.isOkHttp200,
      StatusCode.originIsUnreachableHttp523: (ext) =>
          ext.isOriginIsUnreachableHttp523,
      StatusCode.otExtendedHttp510: (ext) => ext.isOtExtendedHttp510,
      StatusCode.pageExpiredHttp419: (ext) => ext.isPageExpiredHttp419,
      StatusCode.partialContentHttp206: (ext) => ext.isPartialContentHttp206,
      StatusCode.payloadTooLargeHttp413: (ext) => ext.isPayloadTooLargeHttp413,
      StatusCode.paymentRequiredHttp402: (ext) => ext.isPaymentRequiredHttp402,
      StatusCode.permanentRedirectHttp308: (ext) =>
          ext.isPermanentRedirectHttp308,
      StatusCode.preconditionFailedHttp412: (ext) =>
          ext.isPreconditionFailedHttp412,
      StatusCode.preconditionRequiredHttp428: (ext) =>
          ext.isPreconditionRequiredHttp428,
      StatusCode.processingHttp102: (ext) => ext.isProcessingHttp102,
      StatusCode.proxyAuthenticationRequiredHttp407: (ext) =>
          ext.isProxyAuthenticationRequiredHttp407,
      StatusCode.railgunErrorHttp527: (ext) => ext.isRailgunErrorHttp527,
      StatusCode.rangeNotSatisfiableHttp416: (ext) =>
          ext.isRangeNotSatisfiableHttp416,
      StatusCode.requestHeaderFieldsTooLargeHttp430: (ext) =>
          ext.isRequestHeaderFieldsTooLargeHttp430,
      StatusCode.requestHeaderFieldsTooLargeHttp431: (ext) =>
          ext.isRequestHeaderFieldsTooLargeHttp431,
      StatusCode.requestHeaderTooLargeHttp494: (ext) =>
          ext.isRequestHeaderTooLargeHttp494,
      StatusCode.requestTimeoutHttp408: (ext) => ext.isRequestTimeoutHttp408,
      StatusCode.resetContentHttp205: (ext) => ext.isResetContentHttp205,
      StatusCode.seeOtherHttp303: (ext) => ext.isSeeOtherHttp303,
      StatusCode.serviceUnavailableHttp503: (ext) =>
          ext.isServiceUnavailableHttp503,
      StatusCode.siteIsFrozenHttp530: (ext) => ext.isSiteIsFrozenHttp530,
      StatusCode.siteIsOverloadedHttp529: (ext) =>
          ext.isSiteIsOverloadedHttp529,
      StatusCode.sslHandshakeFailedHttp525: (ext) =>
          ext.isSslHandshakeFailedHttp525,
      StatusCode.switchingProtocolsHttp101: (ext) =>
          ext.isSwitchingProtocolsHttp101,
      StatusCode.temporaryRedirectHttp307: (ext) =>
          ext.isTemporaryRedirectHttp307,
      StatusCode.thisIsFineHttp218: (ext) => ext.isThisIsFineHttp218,
      StatusCode.timeoutOccurredHttp524: (ext) => ext.isTimeoutOccurredHttp524,
      StatusCode.tokenExpiredHttp498: (ext) => ext.isTokenExpiredHttp498,
      StatusCode.tooEarlyHttp425: (ext) => ext.isTooEarlyHttp425,
      StatusCode.tooManyIpAddressesHttp463: (ext) =>
          ext.isTooManyIpAddressesHttp463,
      StatusCode.tooManyRequestsHttp429: (ext) => ext.isTooManyRequestsHttp429,
      StatusCode.unauthorizedHttp401: (ext) => ext.isUnauthorizedHttp401,
      StatusCode.unauthorizedHttp561: (ext) => ext.isUnauthorizedHttp561,
      StatusCode.unavailableForLegalReasonsHttp451: (ext) =>
          ext.isUnavailableForLegalReasonsHttp451,
      StatusCode.unprocessableEntityHttp422: (ext) =>
          ext.isUnprocessableEntityHttp422,
      StatusCode.unsupportedMediaTypeHttp415: (ext) =>
          ext.isUnsupportedMediaTypeHttp415,
      StatusCode.upgradeRequiredHttp426: (ext) => ext.isUpgradeRequiredHttp426,
      StatusCode.uriTooLongHttp414: (ext) => ext.isUriTooLongHttp414,
      StatusCode.useProxyHttp305: (ext) => ext.isUseProxyHttp305,
      StatusCode.variantAlsoNegotiatesHttp506: (ext) =>
          ext.isVariantAlsoNegotiatesHttp506,
      StatusCode.webServerIsDownHttp521: (ext) => ext.isWebServerIsDownHttp521,
      StatusCode.webServerReturnedUnknownErrorHttp520: (ext) =>
          ext.isWebServerReturnedUnknownErrorHttp520,
    };

    for (final entry in testCases.entries) {
      test('${entry.key} boolean getter returns true only for itself', () {
        for (final code in StatusCode.values) {
          final shouldBeTrue = code == entry.key;
          final result = entry.value(code);
          expect(
            result,
            equals(shouldBeTrue),
            reason: 'Expected $code getter to be $shouldBeTrue',
          );
        }
      });
    }
  });

  group('map method', () {
    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.map<String>(
          continueHttp100: (_) => 'continue',
          switchingProtocolsHttp101: (_) => 'switching',
          processingHttp102: (_) => 'processing',
          earlyHintsHttp103: (_) => 'earlyHints',
          okHttp200: (_) => 'ok',
          createdHttp201: (_) => 'created',
          acceptedHttp202: (_) => 'accepted',
          nonAuthoritativeInformationHttp203: (_) => 'nonAuth',
          noContentHttp204: (_) => 'noContent',
          resetContentHttp205: (_) => 'resetContent',
          partialContentHttp206: (_) => 'partialContent',
          multiStatusHttp207: (_) => 'multiStatus',
          alreadyReportedHttp208: (_) => 'alreadyReported',
          imUsedHttp226: (_) => 'imUsed',
          multipleChoicesHttp300: (_) => 'multipleChoices',
          movedPermanentlyHttp301: (_) => 'movedPermanently',
          foundHttp302: (_) => 'found',
          seeOtherHttp303: (_) => 'seeOther',
          notModifiedHttp304: (_) => 'notModified',
          useProxyHttp305: (_) => 'useProxy',
          temporaryRedirectHttp307: (_) => 'temporaryRedirect',
          permanentRedirectHttp308: (_) => 'permanentRedirect',
          badRequestHttp400: (_) => 'badRequest',
          unauthorizedHttp401: (_) => 'unauthorized',
          paymentRequiredHttp402: (_) => 'paymentRequired',
          forbiddenHttp403: (_) => 'forbidden',
          notFoundHttp404: (_) => 'notFound',
          methodNotAllowedHttp405: (_) => 'methodNotAllowed',
          notAcceptableHttp406: (_) => 'notAcceptable',
          proxyAuthenticationRequiredHttp407: (_) => 'proxyAuth',
          requestTimeoutHttp408: (_) => 'requestTimeout',
          conflictHttp409: (_) => 'conflict',
          goneHttp410: (_) => 'gone',
          lengthRequiredHttp411: (_) => 'lengthRequired',
          preconditionFailedHttp412: (_) => 'preconditionFailed',
          payloadTooLargeHttp413: (_) => 'payloadTooLarge',
          uriTooLongHttp414: (_) => 'uriTooLong',
          unsupportedMediaTypeHttp415: (_) => 'unsupportedMedia',
          rangeNotSatisfiableHttp416: (_) => 'rangeNotSatisfiable',
          expectationFailedHttp417: (_) => 'expectationFailed',
          imATeapotHttp418: (_) => 'teapot',
          misdirectedRequestHttp421: (_) => 'misdirected',
          unprocessableEntityHttp422: (_) => 'unprocessableEntity',
          lockedHttp423: (_) => 'locked',
          failedDependencyHttp424: (_) => 'failedDependency',
          tooEarlyHttp425: (_) => 'tooEarly',
          upgradeRequiredHttp426: (_) => 'upgradeRequired',
          preconditionRequiredHttp428: (_) => 'preconditionRequired',
          tooManyRequestsHttp429: (_) => 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: (_) => 'headersTooLarge',
          iisLoginTimeoutHttp440: (_) => 'iisTimeout',
          nginxNoResponseHttp444: (_) => 'nginxNoResponse',
          iisRetryWithHttp449: (_) => 'iisRetry',
          blockedByWindowsParentalControlsHttp450: (_) => 'blocked',
          unavailableForLegalReasonsHttp451: (_) => 'legalReasons',
          nginxSSLCertificateErrorHttp495: (_) => 'sslError',
          nginxSSLCertificateRequiredHttp496: (_) => 'sslRequired',
          nginxHTTPToHTTPSHttp497: (_) => 'httpToHttps',
          tokenExpiredHttp498: (_) => 'tokenExpired',
          nginxClientClosedRequestHttp499: (_) => 'clientClosed',
          internalServerErrorHttp500: (_) => 'internalError',
          notImplementedHttp501: (_) => 'notImplemented',
          badGatewayHttp502: (_) => 'badGateway',
          serviceUnavailableHttp503: (_) => 'serviceUnavailable',
          gatewayTimeoutHttp504: (_) => 'gatewayTimeout',
          httpVersionNotSupportedHttp505: (_) => 'versionNotSupported',
          variantAlsoNegotiatesHttp506: (_) => 'variantNegotiates',
          insufficientStorageHttp507: (_) => 'insufficientStorage',
          loopDetectedHttp508: (_) => 'loopDetected',
          bandwidthLimitExceededHttp509: (_) => 'bandwidthExceeded',
          otExtendedHttp510: (_) => 'notExtended',
          networkAuthenticationRequiredHttp511: (_) => 'networkAuth',
          siteIsFrozenHttp530: (_) => 'siteFrozen',
          networkConnectTimeoutErrorHttp599: (_) => 'networkTimeout',
          thisIsFineHttp218: (_) => 'thisIsFine',
          pageExpiredHttp419: (_) => 'pageExpired',
          enhanceYourCalmHttp420: (_) => 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: (_) => 'headersTooLarge430',
          siteIsOverloadedHttp529: (_) => 'siteOverloaded',
          networkReadTimeoutErrorHttp598: (_) => 'readTimeout',
          requestHeaderTooLargeHttp494: (_) => 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: (_) => 'unknownError',
          webServerIsDownHttp521: (_) => 'serverDown',
          connectionTimedOutHttp522: (_) => 'connectionTimeout',
          originIsUnreachableHttp523: (_) => 'originUnreachable',
          timeoutOccurredHttp524: (_) => 'timeoutOccurred',
          sslHandshakeFailedHttp525: (_) => 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: (_) => 'invalidSSL',
          railgunErrorHttp527: (_) => 'railgunError',
          clientClosedConnectionHttp460: (_) => 'clientClosedConnection',
          tooManyIpAddressesHttp463: (_) => 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: (_) => 'incompatibleProtocol',
          unauthorizedHttp561: (_) => 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });

    test('passes correct status code to callback', () {
      const code = StatusCode.okHttp200;
      final result = code.map<int>(
        okHttp200: (status) => status,
        continueHttp100: (_) => 0,
        switchingProtocolsHttp101: (_) => 0,
        processingHttp102: (_) => 0,
        earlyHintsHttp103: (_) => 0,
        createdHttp201: (_) => 0,
        acceptedHttp202: (_) => 0,
        nonAuthoritativeInformationHttp203: (_) => 0,
        noContentHttp204: (_) => 0,
        resetContentHttp205: (_) => 0,
        partialContentHttp206: (_) => 0,
        multiStatusHttp207: (_) => 0,
        alreadyReportedHttp208: (_) => 0,
        imUsedHttp226: (_) => 0,
        multipleChoicesHttp300: (_) => 0,
        movedPermanentlyHttp301: (_) => 0,
        foundHttp302: (_) => 0,
        seeOtherHttp303: (_) => 0,
        notModifiedHttp304: (_) => 0,
        useProxyHttp305: (_) => 0,
        temporaryRedirectHttp307: (_) => 0,
        permanentRedirectHttp308: (_) => 0,
        badRequestHttp400: (_) => 0,
        unauthorizedHttp401: (_) => 0,
        paymentRequiredHttp402: (_) => 0,
        forbiddenHttp403: (_) => 0,
        notFoundHttp404: (_) => 0,
        methodNotAllowedHttp405: (_) => 0,
        notAcceptableHttp406: (_) => 0,
        proxyAuthenticationRequiredHttp407: (_) => 0,
        requestTimeoutHttp408: (_) => 0,
        conflictHttp409: (_) => 0,
        goneHttp410: (_) => 0,
        lengthRequiredHttp411: (_) => 0,
        preconditionFailedHttp412: (_) => 0,
        payloadTooLargeHttp413: (_) => 0,
        uriTooLongHttp414: (_) => 0,
        unsupportedMediaTypeHttp415: (_) => 0,
        rangeNotSatisfiableHttp416: (_) => 0,
        expectationFailedHttp417: (_) => 0,
        imATeapotHttp418: (_) => 0,
        misdirectedRequestHttp421: (_) => 0,
        unprocessableEntityHttp422: (_) => 0,
        lockedHttp423: (_) => 0,
        failedDependencyHttp424: (_) => 0,
        tooEarlyHttp425: (_) => 0,
        upgradeRequiredHttp426: (_) => 0,
        preconditionRequiredHttp428: (_) => 0,
        tooManyRequestsHttp429: (_) => 0,
        requestHeaderFieldsTooLargeHttp431: (_) => 0,
        iisLoginTimeoutHttp440: (_) => 0,
        nginxNoResponseHttp444: (_) => 0,
        iisRetryWithHttp449: (_) => 0,
        blockedByWindowsParentalControlsHttp450: (_) => 0,
        unavailableForLegalReasonsHttp451: (_) => 0,
        nginxSSLCertificateErrorHttp495: (_) => 0,
        nginxSSLCertificateRequiredHttp496: (_) => 0,
        nginxHTTPToHTTPSHttp497: (_) => 0,
        tokenExpiredHttp498: (_) => 0,
        nginxClientClosedRequestHttp499: (_) => 0,
        internalServerErrorHttp500: (_) => 0,
        notImplementedHttp501: (_) => 0,
        badGatewayHttp502: (_) => 0,
        serviceUnavailableHttp503: (_) => 0,
        gatewayTimeoutHttp504: (_) => 0,
        httpVersionNotSupportedHttp505: (_) => 0,
        variantAlsoNegotiatesHttp506: (_) => 0,
        insufficientStorageHttp507: (_) => 0,
        loopDetectedHttp508: (_) => 0,
        bandwidthLimitExceededHttp509: (_) => 0,
        otExtendedHttp510: (_) => 0,
        networkAuthenticationRequiredHttp511: (_) => 0,
        siteIsFrozenHttp530: (_) => 0,
        networkConnectTimeoutErrorHttp599: (_) => 0,
        thisIsFineHttp218: (_) => 0,
        pageExpiredHttp419: (_) => 0,
        enhanceYourCalmHttp420: (_) => 0,
        requestHeaderFieldsTooLargeHttp430: (_) => 0,
        siteIsOverloadedHttp529: (_) => 0,
        networkReadTimeoutErrorHttp598: (_) => 0,
        requestHeaderTooLargeHttp494: (_) => 0,
        webServerReturnedUnknownErrorHttp520: (_) => 0,
        webServerIsDownHttp521: (_) => 0,
        connectionTimedOutHttp522: (_) => 0,
        originIsUnreachableHttp523: (_) => 0,
        timeoutOccurredHttp524: (_) => 0,
        sslHandshakeFailedHttp525: (_) => 0,
        invalidSSLCertificateHttp526: (_) => 0,
        railgunErrorHttp527: (_) => 0,
        clientClosedConnectionHttp460: (_) => 0,
        tooManyIpAddressesHttp463: (_) => 0,
        incompatibleProtocolVersionsHttp464: (_) => 0,
        unauthorizedHttp561: (_) => 0,
      );

      expect(result, equals(200));
    });
  });

  group('maybeMap method', () {
    test('orElse', () {
      final result = custom.maybeMap(
        okHttp200: (_) => true,
        orElse: () => false,
      );
      expect(result, isFalse);
    });

    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.maybeMap<String>(
          orElse: () => '',
          continueHttp100: (_) => 'continue',
          switchingProtocolsHttp101: (_) => 'switching',
          processingHttp102: (_) => 'processing',
          earlyHintsHttp103: (_) => 'earlyHints',
          okHttp200: (_) => 'ok',
          createdHttp201: (_) => 'created',
          acceptedHttp202: (_) => 'accepted',
          nonAuthoritativeInformationHttp203: (_) => 'nonAuth',
          noContentHttp204: (_) => 'noContent',
          resetContentHttp205: (_) => 'resetContent',
          partialContentHttp206: (_) => 'partialContent',
          multiStatusHttp207: (_) => 'multiStatus',
          alreadyReportedHttp208: (_) => 'alreadyReported',
          imUsedHttp226: (_) => 'imUsed',
          multipleChoicesHttp300: (_) => 'multipleChoices',
          movedPermanentlyHttp301: (_) => 'movedPermanently',
          foundHttp302: (_) => 'found',
          seeOtherHttp303: (_) => 'seeOther',
          notModifiedHttp304: (_) => 'notModified',
          useProxyHttp305: (_) => 'useProxy',
          temporaryRedirectHttp307: (_) => 'temporaryRedirect',
          permanentRedirectHttp308: (_) => 'permanentRedirect',
          badRequestHttp400: (_) => 'badRequest',
          unauthorizedHttp401: (_) => 'unauthorized',
          paymentRequiredHttp402: (_) => 'paymentRequired',
          forbiddenHttp403: (_) => 'forbidden',
          notFoundHttp404: (_) => 'notFound',
          methodNotAllowedHttp405: (_) => 'methodNotAllowed',
          notAcceptableHttp406: (_) => 'notAcceptable',
          proxyAuthenticationRequiredHttp407: (_) => 'proxyAuth',
          requestTimeoutHttp408: (_) => 'requestTimeout',
          conflictHttp409: (_) => 'conflict',
          goneHttp410: (_) => 'gone',
          lengthRequiredHttp411: (_) => 'lengthRequired',
          preconditionFailedHttp412: (_) => 'preconditionFailed',
          payloadTooLargeHttp413: (_) => 'payloadTooLarge',
          uriTooLongHttp414: (_) => 'uriTooLong',
          unsupportedMediaTypeHttp415: (_) => 'unsupportedMedia',
          rangeNotSatisfiableHttp416: (_) => 'rangeNotSatisfiable',
          expectationFailedHttp417: (_) => 'expectationFailed',
          imATeapotHttp418: (_) => 'teapot',
          misdirectedRequestHttp421: (_) => 'misdirected',
          unprocessableEntityHttp422: (_) => 'unprocessableEntity',
          lockedHttp423: (_) => 'locked',
          failedDependencyHttp424: (_) => 'failedDependency',
          tooEarlyHttp425: (_) => 'tooEarly',
          upgradeRequiredHttp426: (_) => 'upgradeRequired',
          preconditionRequiredHttp428: (_) => 'preconditionRequired',
          tooManyRequestsHttp429: (_) => 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: (_) => 'headersTooLarge',
          iisLoginTimeoutHttp440: (_) => 'iisTimeout',
          nginxNoResponseHttp444: (_) => 'nginxNoResponse',
          iisRetryWithHttp449: (_) => 'iisRetry',
          blockedByWindowsParentalControlsHttp450: (_) => 'blocked',
          unavailableForLegalReasonsHttp451: (_) => 'legalReasons',
          nginxSSLCertificateErrorHttp495: (_) => 'sslError',
          nginxSSLCertificateRequiredHttp496: (_) => 'sslRequired',
          nginxHTTPToHTTPSHttp497: (_) => 'httpToHttps',
          tokenExpiredHttp498: (_) => 'tokenExpired',
          nginxClientClosedRequestHttp499: (_) => 'clientClosed',
          internalServerErrorHttp500: (_) => 'internalError',
          notImplementedHttp501: (_) => 'notImplemented',
          badGatewayHttp502: (_) => 'badGateway',
          serviceUnavailableHttp503: (_) => 'serviceUnavailable',
          gatewayTimeoutHttp504: (_) => 'gatewayTimeout',
          httpVersionNotSupportedHttp505: (_) => 'versionNotSupported',
          variantAlsoNegotiatesHttp506: (_) => 'variantNegotiates',
          insufficientStorageHttp507: (_) => 'insufficientStorage',
          loopDetectedHttp508: (_) => 'loopDetected',
          bandwidthLimitExceededHttp509: (_) => 'bandwidthExceeded',
          otExtendedHttp510: (_) => 'notExtended',
          networkAuthenticationRequiredHttp511: (_) => 'networkAuth',
          siteIsFrozenHttp530: (_) => 'siteFrozen',
          networkConnectTimeoutErrorHttp599: (_) => 'networkTimeout',
          thisIsFineHttp218: (_) => 'thisIsFine',
          pageExpiredHttp419: (_) => 'pageExpired',
          enhanceYourCalmHttp420: (_) => 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: (_) => 'headersTooLarge430',
          siteIsOverloadedHttp529: (_) => 'siteOverloaded',
          networkReadTimeoutErrorHttp598: (_) => 'readTimeout',
          requestHeaderTooLargeHttp494: (_) => 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: (_) => 'unknownError',
          webServerIsDownHttp521: (_) => 'serverDown',
          connectionTimedOutHttp522: (_) => 'connectionTimeout',
          originIsUnreachableHttp523: (_) => 'originUnreachable',
          timeoutOccurredHttp524: (_) => 'timeoutOccurred',
          sslHandshakeFailedHttp525: (_) => 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: (_) => 'invalidSSL',
          railgunErrorHttp527: (_) => 'railgunError',
          clientClosedConnectionHttp460: (_) => 'clientClosedConnection',
          tooManyIpAddressesHttp463: (_) => 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: (_) => 'incompatibleProtocol',
          unauthorizedHttp561: (_) => 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });

  group('when method', () {
    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.when<String>(
          continueHttp100: () => 'continue',
          switchingProtocolsHttp101: () => 'switching',
          processingHttp102: () => 'processing',
          earlyHintsHttp103: () => 'earlyHints',
          okHttp200: () => 'ok',
          createdHttp201: () => 'created',
          acceptedHttp202: () => 'accepted',
          nonAuthoritativeInformationHttp203: () => 'nonAuth',
          noContentHttp204: () => 'noContent',
          resetContentHttp205: () => 'resetContent',
          partialContentHttp206: () => 'partialContent',
          multiStatusHttp207: () => 'multiStatus',
          alreadyReportedHttp208: () => 'alreadyReported',
          imUsedHttp226: () => 'imUsed',
          multipleChoicesHttp300: () => 'multipleChoices',
          movedPermanentlyHttp301: () => 'movedPermanently',
          foundHttp302: () => 'found',
          seeOtherHttp303: () => 'seeOther',
          notModifiedHttp304: () => 'notModified',
          useProxyHttp305: () => 'useProxy',
          temporaryRedirectHttp307: () => 'temporaryRedirect',
          permanentRedirectHttp308: () => 'permanentRedirect',
          badRequestHttp400: () => 'badRequest',
          unauthorizedHttp401: () => 'unauthorized',
          paymentRequiredHttp402: () => 'paymentRequired',
          forbiddenHttp403: () => 'forbidden',
          notFoundHttp404: () => 'notFound',
          methodNotAllowedHttp405: () => 'methodNotAllowed',
          notAcceptableHttp406: () => 'notAcceptable',
          proxyAuthenticationRequiredHttp407: () => 'proxyAuth',
          requestTimeoutHttp408: () => 'requestTimeout',
          conflictHttp409: () => 'conflict',
          goneHttp410: () => 'gone',
          lengthRequiredHttp411: () => 'lengthRequired',
          preconditionFailedHttp412: () => 'preconditionFailed',
          payloadTooLargeHttp413: () => 'payloadTooLarge',
          uriTooLongHttp414: () => 'uriTooLong',
          unsupportedMediaTypeHttp415: () => 'unsupportedMedia',
          rangeNotSatisfiableHttp416: () => 'rangeNotSatisfiable',
          expectationFailedHttp417: () => 'expectationFailed',
          imATeapotHttp418: () => 'teapot',
          misdirectedRequestHttp421: () => 'misdirected',
          unprocessableEntityHttp422: () => 'unprocessableEntity',
          lockedHttp423: () => 'locked',
          failedDependencyHttp424: () => 'failedDependency',
          tooEarlyHttp425: () => 'tooEarly',
          upgradeRequiredHttp426: () => 'upgradeRequired',
          preconditionRequiredHttp428: () => 'preconditionRequired',
          tooManyRequestsHttp429: () => 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: () => 'headersTooLarge',
          iisLoginTimeoutHttp440: () => 'iisTimeout',
          nginxNoResponseHttp444: () => 'nginxNoResponse',
          iisRetryWithHttp449: () => 'iisRetry',
          blockedByWindowsParentalControlsHttp450: () => 'blocked',
          unavailableForLegalReasonsHttp451: () => 'legalReasons',
          nginxSSLCertificateErrorHttp495: () => 'sslError',
          nginxSSLCertificateRequiredHttp496: () => 'sslRequired',
          nginxHTTPToHTTPSHttp497: () => 'httpToHttps',
          tokenExpiredHttp498: () => 'tokenExpired',
          nginxClientClosedRequestHttp499: () => 'clientClosed',
          internalServerErrorHttp500: () => 'internalError',
          notImplementedHttp501: () => 'notImplemented',
          badGatewayHttp502: () => 'badGateway',
          serviceUnavailableHttp503: () => 'serviceUnavailable',
          gatewayTimeoutHttp504: () => 'gatewayTimeout',
          httpVersionNotSupportedHttp505: () => 'versionNotSupported',
          variantAlsoNegotiatesHttp506: () => 'variantNegotiates',
          insufficientStorageHttp507: () => 'insufficientStorage',
          loopDetectedHttp508: () => 'loopDetected',
          bandwidthLimitExceededHttp509: () => 'bandwidthExceeded',
          otExtendedHttp510: () => 'notExtended',
          networkAuthenticationRequiredHttp511: () => 'networkAuth',
          siteIsFrozenHttp530: () => 'siteFrozen',
          networkConnectTimeoutErrorHttp599: () => 'networkTimeout',
          thisIsFineHttp218: () => 'thisIsFine',
          pageExpiredHttp419: () => 'pageExpired',
          enhanceYourCalmHttp420: () => 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: () => 'headersTooLarge430',
          siteIsOverloadedHttp529: () => 'siteOverloaded',
          networkReadTimeoutErrorHttp598: () => 'readTimeout',
          requestHeaderTooLargeHttp494: () => 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: () => 'unknownError',
          webServerIsDownHttp521: () => 'serverDown',
          connectionTimedOutHttp522: () => 'connectionTimeout',
          originIsUnreachableHttp523: () => 'originUnreachable',
          timeoutOccurredHttp524: () => 'timeoutOccurred',
          sslHandshakeFailedHttp525: () => 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: () => 'invalidSSL',
          railgunErrorHttp527: () => 'railgunError',
          clientClosedConnectionHttp460: () => 'clientClosedConnection',
          tooManyIpAddressesHttp463: () => 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: () => 'incompatibleProtocol',
          unauthorizedHttp561: () => 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });

  group('maybeWhen method', () {
    test('orElse', () {
      final result = custom.maybeWhen(
        okHttp200: () => true,
        orElse: () => false,
      );
      expect(result, isFalse);
    });

    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.maybeWhen<String>(
          orElse: () => '',
          continueHttp100: () => 'continue',
          switchingProtocolsHttp101: () => 'switching',
          processingHttp102: () => 'processing',
          earlyHintsHttp103: () => 'earlyHints',
          okHttp200: () => 'ok',
          createdHttp201: () => 'created',
          acceptedHttp202: () => 'accepted',
          nonAuthoritativeInformationHttp203: () => 'nonAuth',
          noContentHttp204: () => 'noContent',
          resetContentHttp205: () => 'resetContent',
          partialContentHttp206: () => 'partialContent',
          multiStatusHttp207: () => 'multiStatus',
          alreadyReportedHttp208: () => 'alreadyReported',
          imUsedHttp226: () => 'imUsed',
          multipleChoicesHttp300: () => 'multipleChoices',
          movedPermanentlyHttp301: () => 'movedPermanently',
          foundHttp302: () => 'found',
          seeOtherHttp303: () => 'seeOther',
          notModifiedHttp304: () => 'notModified',
          useProxyHttp305: () => 'useProxy',
          temporaryRedirectHttp307: () => 'temporaryRedirect',
          permanentRedirectHttp308: () => 'permanentRedirect',
          badRequestHttp400: () => 'badRequest',
          unauthorizedHttp401: () => 'unauthorized',
          paymentRequiredHttp402: () => 'paymentRequired',
          forbiddenHttp403: () => 'forbidden',
          notFoundHttp404: () => 'notFound',
          methodNotAllowedHttp405: () => 'methodNotAllowed',
          notAcceptableHttp406: () => 'notAcceptable',
          proxyAuthenticationRequiredHttp407: () => 'proxyAuth',
          requestTimeoutHttp408: () => 'requestTimeout',
          conflictHttp409: () => 'conflict',
          goneHttp410: () => 'gone',
          lengthRequiredHttp411: () => 'lengthRequired',
          preconditionFailedHttp412: () => 'preconditionFailed',
          payloadTooLargeHttp413: () => 'payloadTooLarge',
          uriTooLongHttp414: () => 'uriTooLong',
          unsupportedMediaTypeHttp415: () => 'unsupportedMedia',
          rangeNotSatisfiableHttp416: () => 'rangeNotSatisfiable',
          expectationFailedHttp417: () => 'expectationFailed',
          imATeapotHttp418: () => 'teapot',
          misdirectedRequestHttp421: () => 'misdirected',
          unprocessableEntityHttp422: () => 'unprocessableEntity',
          lockedHttp423: () => 'locked',
          failedDependencyHttp424: () => 'failedDependency',
          tooEarlyHttp425: () => 'tooEarly',
          upgradeRequiredHttp426: () => 'upgradeRequired',
          preconditionRequiredHttp428: () => 'preconditionRequired',
          tooManyRequestsHttp429: () => 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: () => 'headersTooLarge',
          iisLoginTimeoutHttp440: () => 'iisTimeout',
          nginxNoResponseHttp444: () => 'nginxNoResponse',
          iisRetryWithHttp449: () => 'iisRetry',
          blockedByWindowsParentalControlsHttp450: () => 'blocked',
          unavailableForLegalReasonsHttp451: () => 'legalReasons',
          nginxSSLCertificateErrorHttp495: () => 'sslError',
          nginxSSLCertificateRequiredHttp496: () => 'sslRequired',
          nginxHTTPToHTTPSHttp497: () => 'httpToHttps',
          tokenExpiredHttp498: () => 'tokenExpired',
          nginxClientClosedRequestHttp499: () => 'clientClosed',
          internalServerErrorHttp500: () => 'internalError',
          notImplementedHttp501: () => 'notImplemented',
          badGatewayHttp502: () => 'badGateway',
          serviceUnavailableHttp503: () => 'serviceUnavailable',
          gatewayTimeoutHttp504: () => 'gatewayTimeout',
          httpVersionNotSupportedHttp505: () => 'versionNotSupported',
          variantAlsoNegotiatesHttp506: () => 'variantNegotiates',
          insufficientStorageHttp507: () => 'insufficientStorage',
          loopDetectedHttp508: () => 'loopDetected',
          bandwidthLimitExceededHttp509: () => 'bandwidthExceeded',
          otExtendedHttp510: () => 'notExtended',
          networkAuthenticationRequiredHttp511: () => 'networkAuth',
          siteIsFrozenHttp530: () => 'siteFrozen',
          networkConnectTimeoutErrorHttp599: () => 'networkTimeout',
          thisIsFineHttp218: () => 'thisIsFine',
          pageExpiredHttp419: () => 'pageExpired',
          enhanceYourCalmHttp420: () => 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: () => 'headersTooLarge430',
          siteIsOverloadedHttp529: () => 'siteOverloaded',
          networkReadTimeoutErrorHttp598: () => 'readTimeout',
          requestHeaderTooLargeHttp494: () => 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: () => 'unknownError',
          webServerIsDownHttp521: () => 'serverDown',
          connectionTimedOutHttp522: () => 'connectionTimeout',
          originIsUnreachableHttp523: () => 'originUnreachable',
          timeoutOccurredHttp524: () => 'timeoutOccurred',
          sslHandshakeFailedHttp525: () => 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: () => 'invalidSSL',
          railgunErrorHttp527: () => 'railgunError',
          clientClosedConnectionHttp460: () => 'clientClosedConnection',
          tooManyIpAddressesHttp463: () => 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: () => 'incompatibleProtocol',
          unauthorizedHttp561: () => 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });

  group('whenOrNull method', () {
    test('orElse', () {
      final result = custom.whenOrNull(
        okHttp200: () => true,
        orElse: () => false,
      );
      expect(result, isFalse);
    });

    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.whenOrNull<String>(
          orElse: () => '',
          continueHttp100: () => 'continue',
          switchingProtocolsHttp101: () => 'switching',
          processingHttp102: () => 'processing',
          earlyHintsHttp103: () => 'earlyHints',
          okHttp200: () => 'ok',
          createdHttp201: () => 'created',
          acceptedHttp202: () => 'accepted',
          nonAuthoritativeInformationHttp203: () => 'nonAuth',
          noContentHttp204: () => 'noContent',
          resetContentHttp205: () => 'resetContent',
          partialContentHttp206: () => 'partialContent',
          multiStatusHttp207: () => 'multiStatus',
          alreadyReportedHttp208: () => 'alreadyReported',
          imUsedHttp226: () => 'imUsed',
          multipleChoicesHttp300: () => 'multipleChoices',
          movedPermanentlyHttp301: () => 'movedPermanently',
          foundHttp302: () => 'found',
          seeOtherHttp303: () => 'seeOther',
          notModifiedHttp304: () => 'notModified',
          useProxyHttp305: () => 'useProxy',
          temporaryRedirectHttp307: () => 'temporaryRedirect',
          permanentRedirectHttp308: () => 'permanentRedirect',
          badRequestHttp400: () => 'badRequest',
          unauthorizedHttp401: () => 'unauthorized',
          paymentRequiredHttp402: () => 'paymentRequired',
          forbiddenHttp403: () => 'forbidden',
          notFoundHttp404: () => 'notFound',
          methodNotAllowedHttp405: () => 'methodNotAllowed',
          notAcceptableHttp406: () => 'notAcceptable',
          proxyAuthenticationRequiredHttp407: () => 'proxyAuth',
          requestTimeoutHttp408: () => 'requestTimeout',
          conflictHttp409: () => 'conflict',
          goneHttp410: () => 'gone',
          lengthRequiredHttp411: () => 'lengthRequired',
          preconditionFailedHttp412: () => 'preconditionFailed',
          payloadTooLargeHttp413: () => 'payloadTooLarge',
          uriTooLongHttp414: () => 'uriTooLong',
          unsupportedMediaTypeHttp415: () => 'unsupportedMedia',
          rangeNotSatisfiableHttp416: () => 'rangeNotSatisfiable',
          expectationFailedHttp417: () => 'expectationFailed',
          imATeapotHttp418: () => 'teapot',
          misdirectedRequestHttp421: () => 'misdirected',
          unprocessableEntityHttp422: () => 'unprocessableEntity',
          lockedHttp423: () => 'locked',
          failedDependencyHttp424: () => 'failedDependency',
          tooEarlyHttp425: () => 'tooEarly',
          upgradeRequiredHttp426: () => 'upgradeRequired',
          preconditionRequiredHttp428: () => 'preconditionRequired',
          tooManyRequestsHttp429: () => 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: () => 'headersTooLarge',
          iisLoginTimeoutHttp440: () => 'iisTimeout',
          nginxNoResponseHttp444: () => 'nginxNoResponse',
          iisRetryWithHttp449: () => 'iisRetry',
          blockedByWindowsParentalControlsHttp450: () => 'blocked',
          unavailableForLegalReasonsHttp451: () => 'legalReasons',
          nginxSSLCertificateErrorHttp495: () => 'sslError',
          nginxSSLCertificateRequiredHttp496: () => 'sslRequired',
          nginxHTTPToHTTPSHttp497: () => 'httpToHttps',
          tokenExpiredHttp498: () => 'tokenExpired',
          nginxClientClosedRequestHttp499: () => 'clientClosed',
          internalServerErrorHttp500: () => 'internalError',
          notImplementedHttp501: () => 'notImplemented',
          badGatewayHttp502: () => 'badGateway',
          serviceUnavailableHttp503: () => 'serviceUnavailable',
          gatewayTimeoutHttp504: () => 'gatewayTimeout',
          httpVersionNotSupportedHttp505: () => 'versionNotSupported',
          variantAlsoNegotiatesHttp506: () => 'variantNegotiates',
          insufficientStorageHttp507: () => 'insufficientStorage',
          loopDetectedHttp508: () => 'loopDetected',
          bandwidthLimitExceededHttp509: () => 'bandwidthExceeded',
          otExtendedHttp510: () => 'notExtended',
          networkAuthenticationRequiredHttp511: () => 'networkAuth',
          siteIsFrozenHttp530: () => 'siteFrozen',
          networkConnectTimeoutErrorHttp599: () => 'networkTimeout',
          thisIsFineHttp218: () => 'thisIsFine',
          pageExpiredHttp419: () => 'pageExpired',
          enhanceYourCalmHttp420: () => 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: () => 'headersTooLarge430',
          siteIsOverloadedHttp529: () => 'siteOverloaded',
          networkReadTimeoutErrorHttp598: () => 'readTimeout',
          requestHeaderTooLargeHttp494: () => 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: () => 'unknownError',
          webServerIsDownHttp521: () => 'serverDown',
          connectionTimedOutHttp522: () => 'connectionTimeout',
          originIsUnreachableHttp523: () => 'originUnreachable',
          timeoutOccurredHttp524: () => 'timeoutOccurred',
          sslHandshakeFailedHttp525: () => 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: () => 'invalidSSL',
          railgunErrorHttp527: () => 'railgunError',
          clientClosedConnectionHttp460: () => 'clientClosedConnection',
          tooManyIpAddressesHttp463: () => 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: () => 'incompatibleProtocol',
          unauthorizedHttp561: () => 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });

  group('whenConst method', () {
    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.whenConst<String>(
          continueHttp100: 'continue',
          switchingProtocolsHttp101: 'switching',
          processingHttp102: 'processing',
          earlyHintsHttp103: 'earlyHints',
          okHttp200: 'ok',
          createdHttp201: 'created',
          acceptedHttp202: 'accepted',
          nonAuthoritativeInformationHttp203: 'nonAuth',
          noContentHttp204: 'noContent',
          resetContentHttp205: 'resetContent',
          partialContentHttp206: 'partialContent',
          multiStatusHttp207: 'multiStatus',
          alreadyReportedHttp208: 'alreadyReported',
          imUsedHttp226: 'imUsed',
          multipleChoicesHttp300: 'multipleChoices',
          movedPermanentlyHttp301: 'movedPermanently',
          foundHttp302: 'found',
          seeOtherHttp303: 'seeOther',
          notModifiedHttp304: 'notModified',
          useProxyHttp305: 'useProxy',
          temporaryRedirectHttp307: 'temporaryRedirect',
          permanentRedirectHttp308: 'permanentRedirect',
          badRequestHttp400: 'badRequest',
          unauthorizedHttp401: 'unauthorized',
          paymentRequiredHttp402: 'paymentRequired',
          forbiddenHttp403: 'forbidden',
          notFoundHttp404: 'notFound',
          methodNotAllowedHttp405: 'methodNotAllowed',
          notAcceptableHttp406: 'notAcceptable',
          proxyAuthenticationRequiredHttp407: 'proxyAuth',
          requestTimeoutHttp408: 'requestTimeout',
          conflictHttp409: 'conflict',
          goneHttp410: 'gone',
          lengthRequiredHttp411: 'lengthRequired',
          preconditionFailedHttp412: 'preconditionFailed',
          payloadTooLargeHttp413: 'payloadTooLarge',
          uriTooLongHttp414: 'uriTooLong',
          unsupportedMediaTypeHttp415: 'unsupportedMedia',
          rangeNotSatisfiableHttp416: 'rangeNotSatisfiable',
          expectationFailedHttp417: 'expectationFailed',
          imATeapotHttp418: 'teapot',
          misdirectedRequestHttp421: 'misdirected',
          unprocessableEntityHttp422: 'unprocessableEntity',
          lockedHttp423: 'locked',
          failedDependencyHttp424: 'failedDependency',
          tooEarlyHttp425: 'tooEarly',
          upgradeRequiredHttp426: 'upgradeRequired',
          preconditionRequiredHttp428: 'preconditionRequired',
          tooManyRequestsHttp429: 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: 'headersTooLarge',
          iisLoginTimeoutHttp440: 'iisTimeout',
          nginxNoResponseHttp444: 'nginxNoResponse',
          iisRetryWithHttp449: 'iisRetry',
          blockedByWindowsParentalControlsHttp450: 'blocked',
          unavailableForLegalReasonsHttp451: 'legalReasons',
          nginxSSLCertificateErrorHttp495: 'sslError',
          nginxSSLCertificateRequiredHttp496: 'sslRequired',
          nginxHTTPToHTTPSHttp497: 'httpToHttps',
          tokenExpiredHttp498: 'tokenExpired',
          nginxClientClosedRequestHttp499: 'clientClosed',
          internalServerErrorHttp500: 'internalError',
          notImplementedHttp501: 'notImplemented',
          badGatewayHttp502: 'badGateway',
          serviceUnavailableHttp503: 'serviceUnavailable',
          gatewayTimeoutHttp504: 'gatewayTimeout',
          httpVersionNotSupportedHttp505: 'versionNotSupported',
          variantAlsoNegotiatesHttp506: 'variantNegotiates',
          insufficientStorageHttp507: 'insufficientStorage',
          loopDetectedHttp508: 'loopDetected',
          bandwidthLimitExceededHttp509: 'bandwidthExceeded',
          otExtendedHttp510: 'notExtended',
          networkAuthenticationRequiredHttp511: 'networkAuth',
          siteIsFrozenHttp530: 'siteFrozen',
          networkConnectTimeoutErrorHttp599: 'networkTimeout',
          thisIsFineHttp218: 'thisIsFine',
          pageExpiredHttp419: 'pageExpired',
          enhanceYourCalmHttp420: 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: 'headersTooLarge430',
          siteIsOverloadedHttp529: 'siteOverloaded',
          networkReadTimeoutErrorHttp598: 'readTimeout',
          requestHeaderTooLargeHttp494: 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: 'unknownError',
          webServerIsDownHttp521: 'serverDown',
          connectionTimedOutHttp522: 'connectionTimeout',
          originIsUnreachableHttp523: 'originUnreachable',
          timeoutOccurredHttp524: 'timeoutOccurred',
          sslHandshakeFailedHttp525: 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: 'invalidSSL',
          railgunErrorHttp527: 'railgunError',
          clientClosedConnectionHttp460: 'clientClosedConnection',
          tooManyIpAddressesHttp463: 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: 'incompatibleProtocol',
          unauthorizedHttp561: 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });

  group('whenConstOrNull method', () {
    test('calls correct callback for each status code', () {
      for (final code in StatusCode.values) {
        final result = code.whenConstOrNull<String>(
          continueHttp100: 'continue',
          switchingProtocolsHttp101: 'switching',
          processingHttp102: 'processing',
          earlyHintsHttp103: 'earlyHints',
          okHttp200: 'ok',
          createdHttp201: 'created',
          acceptedHttp202: 'accepted',
          nonAuthoritativeInformationHttp203: 'nonAuth',
          noContentHttp204: 'noContent',
          resetContentHttp205: 'resetContent',
          partialContentHttp206: 'partialContent',
          multiStatusHttp207: 'multiStatus',
          alreadyReportedHttp208: 'alreadyReported',
          imUsedHttp226: 'imUsed',
          multipleChoicesHttp300: 'multipleChoices',
          movedPermanentlyHttp301: 'movedPermanently',
          foundHttp302: 'found',
          seeOtherHttp303: 'seeOther',
          notModifiedHttp304: 'notModified',
          useProxyHttp305: 'useProxy',
          temporaryRedirectHttp307: 'temporaryRedirect',
          permanentRedirectHttp308: 'permanentRedirect',
          badRequestHttp400: 'badRequest',
          unauthorizedHttp401: 'unauthorized',
          paymentRequiredHttp402: 'paymentRequired',
          forbiddenHttp403: 'forbidden',
          notFoundHttp404: 'notFound',
          methodNotAllowedHttp405: 'methodNotAllowed',
          notAcceptableHttp406: 'notAcceptable',
          proxyAuthenticationRequiredHttp407: 'proxyAuth',
          requestTimeoutHttp408: 'requestTimeout',
          conflictHttp409: 'conflict',
          goneHttp410: 'gone',
          lengthRequiredHttp411: 'lengthRequired',
          preconditionFailedHttp412: 'preconditionFailed',
          payloadTooLargeHttp413: 'payloadTooLarge',
          uriTooLongHttp414: 'uriTooLong',
          unsupportedMediaTypeHttp415: 'unsupportedMedia',
          rangeNotSatisfiableHttp416: 'rangeNotSatisfiable',
          expectationFailedHttp417: 'expectationFailed',
          imATeapotHttp418: 'teapot',
          misdirectedRequestHttp421: 'misdirected',
          unprocessableEntityHttp422: 'unprocessableEntity',
          lockedHttp423: 'locked',
          failedDependencyHttp424: 'failedDependency',
          tooEarlyHttp425: 'tooEarly',
          upgradeRequiredHttp426: 'upgradeRequired',
          preconditionRequiredHttp428: 'preconditionRequired',
          tooManyRequestsHttp429: 'tooManyRequests',
          requestHeaderFieldsTooLargeHttp431: 'headersTooLarge',
          iisLoginTimeoutHttp440: 'iisTimeout',
          nginxNoResponseHttp444: 'nginxNoResponse',
          iisRetryWithHttp449: 'iisRetry',
          blockedByWindowsParentalControlsHttp450: 'blocked',
          unavailableForLegalReasonsHttp451: 'legalReasons',
          nginxSSLCertificateErrorHttp495: 'sslError',
          nginxSSLCertificateRequiredHttp496: 'sslRequired',
          nginxHTTPToHTTPSHttp497: 'httpToHttps',
          tokenExpiredHttp498: 'tokenExpired',
          nginxClientClosedRequestHttp499: 'clientClosed',
          internalServerErrorHttp500: 'internalError',
          notImplementedHttp501: 'notImplemented',
          badGatewayHttp502: 'badGateway',
          serviceUnavailableHttp503: 'serviceUnavailable',
          gatewayTimeoutHttp504: 'gatewayTimeout',
          httpVersionNotSupportedHttp505: 'versionNotSupported',
          variantAlsoNegotiatesHttp506: 'variantNegotiates',
          insufficientStorageHttp507: 'insufficientStorage',
          loopDetectedHttp508: 'loopDetected',
          bandwidthLimitExceededHttp509: 'bandwidthExceeded',
          otExtendedHttp510: 'notExtended',
          networkAuthenticationRequiredHttp511: 'networkAuth',
          siteIsFrozenHttp530: 'siteFrozen',
          networkConnectTimeoutErrorHttp599: 'networkTimeout',
          thisIsFineHttp218: 'thisIsFine',
          pageExpiredHttp419: 'pageExpired',
          enhanceYourCalmHttp420: 'enhanceCalm',
          requestHeaderFieldsTooLargeHttp430: 'headersTooLarge430',
          siteIsOverloadedHttp529: 'siteOverloaded',
          networkReadTimeoutErrorHttp598: 'readTimeout',
          requestHeaderTooLargeHttp494: 'headerTooLarge',
          webServerReturnedUnknownErrorHttp520: 'unknownError',
          webServerIsDownHttp521: 'serverDown',
          connectionTimedOutHttp522: 'connectionTimeout',
          originIsUnreachableHttp523: 'originUnreachable',
          timeoutOccurredHttp524: 'timeoutOccurred',
          sslHandshakeFailedHttp525: 'sslHandshakeFailed',
          invalidSSLCertificateHttp526: 'invalidSSL',
          railgunErrorHttp527: 'railgunError',
          clientClosedConnectionHttp460: 'clientClosedConnection',
          tooManyIpAddressesHttp463: 'tooManyIPs',
          incompatibleProtocolVersionsHttp464: 'incompatibleProtocol',
          unauthorizedHttp561: 'unauthorized561',
        );

        expect(result, isA<String>());
        expect(result, isNotEmpty);
      }
    });
  });
});
