import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsnow/features/features.dart';

part 'latest_news_state.freezed.dart';

@freezed
class LatestNewsState with _$LatestNewsState {
  const factory LatestNewsState.initial() = $_Initial;

  const factory LatestNewsState.loading() = $_Loading;
  const factory LatestNewsState.error(String error) = $_Error;
  const factory LatestNewsState.loaded(List<News> news) = $_Loaded;
}
