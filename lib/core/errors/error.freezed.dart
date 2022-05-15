// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsNowExceptionTearOff {
  const _$NewsNowExceptionTearOff();

  _$NewsNowServerException server(String message) {
    return _$NewsNowServerException(
      message,
    );
  }

  _$NewsNowNoInternetException noInternet() {
    return const _$NewsNowNoInternetException();
  }

  _$NewsNowAppException app(String? message) {
    return _$NewsNowAppException(
      message,
    );
  }

  _$NewsNowUnknownException unknown() {
    return const _$NewsNowUnknownException();
  }
}

/// @nodoc
const $NewsNowException = _$NewsNowExceptionTearOff();

/// @nodoc
mixin _$NewsNowException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) server,
    required TResult Function() noInternet,
    required TResult Function(String? message) app,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$NewsNowServerException value) server,
    required TResult Function(_$NewsNowNoInternetException value) noInternet,
    required TResult Function(_$NewsNowAppException value) app,
    required TResult Function(_$NewsNowUnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsNowExceptionCopyWith<$Res> {
  factory $NewsNowExceptionCopyWith(
          NewsNowException value, $Res Function(NewsNowException) then) =
      _$NewsNowExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsNowExceptionCopyWithImpl<$Res>
    implements $NewsNowExceptionCopyWith<$Res> {
  _$NewsNowExceptionCopyWithImpl(this._value, this._then);

  final NewsNowException _value;
  // ignore: unused_field
  final $Res Function(NewsNowException) _then;
}

/// @nodoc
abstract class _$$NewsNowServerExceptionCopyWith<$Res> {
  factory _$$NewsNowServerExceptionCopyWith(_$NewsNowServerException value,
          $Res Function(_$NewsNowServerException) then) =
      __$$NewsNowServerExceptionCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$NewsNowServerExceptionCopyWithImpl<$Res>
    extends _$NewsNowExceptionCopyWithImpl<$Res>
    implements _$$NewsNowServerExceptionCopyWith<$Res> {
  __$$NewsNowServerExceptionCopyWithImpl(_$NewsNowServerException _value,
      $Res Function(_$NewsNowServerException) _then)
      : super(_value, (v) => _then(v as _$NewsNowServerException));

  @override
  _$NewsNowServerException get _value =>
      super._value as _$NewsNowServerException;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NewsNowServerException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_$NewsNowServerException implements _$NewsNowServerException {
  const _$_$NewsNowServerException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NewsNowException.server(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsNowServerException &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NewsNowServerExceptionCopyWith<_$NewsNowServerException> get copyWith =>
      __$$NewsNowServerExceptionCopyWithImpl<_$NewsNowServerException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) server,
    required TResult Function() noInternet,
    required TResult Function(String? message) app,
    required TResult Function() unknown,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$NewsNowServerException value) server,
    required TResult Function(_$NewsNowNoInternetException value) noInternet,
    required TResult Function(_$NewsNowAppException value) app,
    required TResult Function(_$NewsNowUnknownException value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _$NewsNowServerException implements NewsNowException {
  const factory _$NewsNowServerException(String message) =
      _$_$NewsNowServerException;

  String get message;
  @JsonKey(ignore: true)
  _$$NewsNowServerExceptionCopyWith<_$NewsNowServerException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsNowNoInternetExceptionCopyWith<$Res> {
  factory _$$NewsNowNoInternetExceptionCopyWith(
          _$NewsNowNoInternetException value,
          $Res Function(_$NewsNowNoInternetException) then) =
      __$$NewsNowNoInternetExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsNowNoInternetExceptionCopyWithImpl<$Res>
    extends _$NewsNowExceptionCopyWithImpl<$Res>
    implements _$$NewsNowNoInternetExceptionCopyWith<$Res> {
  __$$NewsNowNoInternetExceptionCopyWithImpl(
      _$NewsNowNoInternetException _value,
      $Res Function(_$NewsNowNoInternetException) _then)
      : super(_value, (v) => _then(v as _$NewsNowNoInternetException));

  @override
  _$NewsNowNoInternetException get _value =>
      super._value as _$NewsNowNoInternetException;
}

/// @nodoc

class _$_$NewsNowNoInternetException implements _$NewsNowNoInternetException {
  const _$_$NewsNowNoInternetException();

  @override
  String toString() {
    return 'NewsNowException.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsNowNoInternetException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) server,
    required TResult Function() noInternet,
    required TResult Function(String? message) app,
    required TResult Function() unknown,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$NewsNowServerException value) server,
    required TResult Function(_$NewsNowNoInternetException value) noInternet,
    required TResult Function(_$NewsNowAppException value) app,
    required TResult Function(_$NewsNowUnknownException value) unknown,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _$NewsNowNoInternetException implements NewsNowException {
  const factory _$NewsNowNoInternetException() = _$_$NewsNowNoInternetException;
}

/// @nodoc
abstract class _$$NewsNowAppExceptionCopyWith<$Res> {
  factory _$$NewsNowAppExceptionCopyWith(_$NewsNowAppException value,
          $Res Function(_$NewsNowAppException) then) =
      __$$NewsNowAppExceptionCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$NewsNowAppExceptionCopyWithImpl<$Res>
    extends _$NewsNowExceptionCopyWithImpl<$Res>
    implements _$$NewsNowAppExceptionCopyWith<$Res> {
  __$$NewsNowAppExceptionCopyWithImpl(
      _$NewsNowAppException _value, $Res Function(_$NewsNowAppException) _then)
      : super(_value, (v) => _then(v as _$NewsNowAppException));

  @override
  _$NewsNowAppException get _value => super._value as _$NewsNowAppException;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NewsNowAppException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_$NewsNowAppException implements _$NewsNowAppException {
  const _$_$NewsNowAppException(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'NewsNowException.app(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsNowAppException &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NewsNowAppExceptionCopyWith<_$NewsNowAppException> get copyWith =>
      __$$NewsNowAppExceptionCopyWithImpl<_$NewsNowAppException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) server,
    required TResult Function() noInternet,
    required TResult Function(String? message) app,
    required TResult Function() unknown,
  }) {
    return app(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
  }) {
    return app?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (app != null) {
      return app(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$NewsNowServerException value) server,
    required TResult Function(_$NewsNowNoInternetException value) noInternet,
    required TResult Function(_$NewsNowAppException value) app,
    required TResult Function(_$NewsNowUnknownException value) unknown,
  }) {
    return app(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
  }) {
    return app?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (app != null) {
      return app(this);
    }
    return orElse();
  }
}

abstract class _$NewsNowAppException implements NewsNowException {
  const factory _$NewsNowAppException(String? message) =
      _$_$NewsNowAppException;

  String? get message;
  @JsonKey(ignore: true)
  _$$NewsNowAppExceptionCopyWith<_$NewsNowAppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsNowUnknownExceptionCopyWith<$Res> {
  factory _$$NewsNowUnknownExceptionCopyWith(_$NewsNowUnknownException value,
          $Res Function(_$NewsNowUnknownException) then) =
      __$$NewsNowUnknownExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsNowUnknownExceptionCopyWithImpl<$Res>
    extends _$NewsNowExceptionCopyWithImpl<$Res>
    implements _$$NewsNowUnknownExceptionCopyWith<$Res> {
  __$$NewsNowUnknownExceptionCopyWithImpl(_$NewsNowUnknownException _value,
      $Res Function(_$NewsNowUnknownException) _then)
      : super(_value, (v) => _then(v as _$NewsNowUnknownException));

  @override
  _$NewsNowUnknownException get _value =>
      super._value as _$NewsNowUnknownException;
}

/// @nodoc

class _$_$NewsNowUnknownException implements _$NewsNowUnknownException {
  const _$_$NewsNowUnknownException();

  @override
  String toString() {
    return 'NewsNowException.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsNowUnknownException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) server,
    required TResult Function() noInternet,
    required TResult Function(String? message) app,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? server,
    TResult Function()? noInternet,
    TResult Function(String? message)? app,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$NewsNowServerException value) server,
    required TResult Function(_$NewsNowNoInternetException value) noInternet,
    required TResult Function(_$NewsNowAppException value) app,
    required TResult Function(_$NewsNowUnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$NewsNowServerException value)? server,
    TResult Function(_$NewsNowNoInternetException value)? noInternet,
    TResult Function(_$NewsNowAppException value)? app,
    TResult Function(_$NewsNowUnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _$NewsNowUnknownException implements NewsNowException {
  const factory _$NewsNowUnknownException() = _$_$NewsNowUnknownException;
}
