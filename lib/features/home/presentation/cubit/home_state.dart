import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = $_Initial;

  const factory HomeState.loading() = $_Loading;
  const factory HomeState.error(String error) = $_Error;
  const factory HomeState.loaded(List? news) = $_Loaded;
}
