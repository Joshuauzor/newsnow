import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

/// [NewsNowException] is thrown when there is a server error.
@freezed
class NewsNowException with _$NewsNowException implements Exception {
  /// [NewsNowException.server] is thrown when there is a server error.
  const factory NewsNowException.server(String message) =
      _$NewsNowServerException;

  /// [NewsNowException.noInternet] is thrown when there
  /// is no internet connection.
  const factory NewsNowException.noInternet() = _$NewsNowNoInternetException;

  /// [NewsNowException.app] is thrown when there
  /// is an errpr in the app.
  const factory NewsNowException.app(String? message) = _$NewsNowAppException;

  /// [NewsNowException.unknown] is thrown when there is an unknown error.
  const factory NewsNowException.unknown() = _$NewsNowUnknownException;
}
