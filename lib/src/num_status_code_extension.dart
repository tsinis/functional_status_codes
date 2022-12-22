// ignore_for_file: long-parameter-list
import '../functional_status_codes.dart';

extension NumStatusCodeExtension<T extends num> on T? {
  static const _outSideOfRangeMessage = 'Value is outside of 100-599 range';

  int get _maybeThisInt => this?.toInt() ?? 0;

  bool get isStatusCode =>
      _maybeThisInt >= StatusCode.values.first.code &&
      _maybeThisInt <= StatusCode.values.last.code;

  bool get isInformational =>
      _maybeThisInt >= StatusCode.continue100.code &&
      _maybeThisInt < StatusCode.ok200.code;

  bool get isSuccess =>
      _maybeThisInt >= StatusCode.ok200.code &&
      _maybeThisInt < StatusCode.multipleChoices300.code;

  bool get isRedirection =>
      _maybeThisInt >= StatusCode.multipleChoices300.code &&
      _maybeThisInt < StatusCode.badRequest400.code;

  bool get isClientError =>
      _maybeThisInt >= StatusCode.badRequest400.code &&
      _maybeThisInt < StatusCode.internalServerError500.code;

  bool get isServerError =>
      _maybeThisInt >= StatusCode.internalServerError500.code &&
      _maybeThisInt <= StatusCode.networkConnectTimeoutError599.code;

  R mapStatusCode<R>({
    required R Function(T isInformational) isInformational,
    required R Function(T isSuccess) isSuccess,
    required R Function(T isRedirection) isRedirection,
    required R Function(T isClientError) isClientError,
    required R Function(T isServerError) isServerError,
  }) {
    assert(
      isStatusCode,
      '$_outSideOfRangeMessage. Consider using maybeMapStatusCode() instead',
    );
    final thisValue = this;
    if (thisValue == null) {
      throw FormatException('Null value provided!', thisValue);
    }
    if (thisValue.isInformational) {
      return isInformational(thisValue);
    }
    if (thisValue.isSuccess) {
      return isSuccess(thisValue);
    }
    if (thisValue.isRedirection) {
      return isRedirection(thisValue);
    }
    if (thisValue.isClientError) {
      return isClientError(thisValue);
    }
    if (thisValue.isServerError) {
      return isServerError(thisValue);
    }

    throw FormatException(_outSideOfRangeMessage, thisValue);
  }

  R maybeMapStatusCode<R>({
    required R Function() orElse,
    R Function(T isStatusCode)? isStatusCode,
    R Function(T isInformational)? isInformational,
    R Function(T isSuccess)? isSuccess,
    R Function(T isRedirection)? isRedirection,
    R Function(T isClientError)? isClientError,
    R Function(T isServerError)? isServerError,
  }) {
    final thisValue = this;
    if (thisValue == null) {
      return orElse();
    }
    if (thisValue.isStatusCode && isStatusCode != null) {
      return isStatusCode(thisValue);
    } else if (thisValue.isInformational && isInformational != null) {
      return isInformational(thisValue);
    } else if (thisValue.isSuccess && isSuccess != null) {
      return isSuccess(thisValue);
    } else if (thisValue.isRedirection && isRedirection != null) {
      return isRedirection(thisValue);
    } else if (thisValue.isClientError && isClientError != null) {
      return isClientError(thisValue);
    } else if (thisValue.isServerError && isServerError != null) {
      return isServerError(thisValue);
    } else {
      return orElse();
    }
  }

  R maybeWhenStatusCode<R>({
    required R Function() orElse,
    R Function()? isStatusCode,
    R Function()? isInformational,
    R Function()? isSuccess,
    R Function()? isRedirection,
    R Function()? isClientError,
    R Function()? isServerError,
  }) {
    if (this.isStatusCode && isStatusCode != null) {
      return isStatusCode();
    } else if (this.isInformational && isInformational != null) {
      return isInformational();
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess();
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection();
    } else if (this.isClientError && isClientError != null) {
      return isClientError();
    } else if (this.isServerError && isServerError != null) {
      return isServerError();
    } else {
      return orElse();
    }
  }

  R whenStatusCode<R>({
    required R Function() isInformational,
    required R Function() isSuccess,
    required R Function() isRedirection,
    required R Function() isClientError,
    required R Function() isServerError,
  }) {
    assert(
      isStatusCode,
      '$_outSideOfRangeMessage. Consider using maybeWhenStatusCode() instead',
    );
    if (this.isInformational) {
      return isInformational();
    }
    if (this.isSuccess) {
      return isSuccess();
    }
    if (this.isRedirection) {
      return isRedirection();
    }
    if (this.isClientError) {
      return isClientError();
    }
    if (this.isServerError) {
      return isServerError();
    }

    throw FormatException(_outSideOfRangeMessage, this);
  }

  R? whenStatusCodeOrNull<R>({
    R Function()? isStatusCode,
    R Function()? isInformational,
    R Function()? isSuccess,
    R Function()? isRedirection,
    R Function()? isClientError,
    R Function()? isServerError,
    R Function()? orElse,
  }) {
    if (this.isStatusCode && isStatusCode != null) {
      return isStatusCode();
    } else if (this.isInformational && isInformational != null) {
      return isInformational();
    } else if (this.isSuccess && isSuccess != null) {
      return isSuccess();
    } else if (this.isRedirection && isRedirection != null) {
      return isRedirection();
    } else if (this.isClientError && isClientError != null) {
      return isClientError();
    } else if (this.isServerError && isServerError != null) {
      return isServerError();
    } else {
      return orElse?.call();
    }
  }
}
