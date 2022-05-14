import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = $_Initial;

  const factory OnboardingState.loading() = $_Loading;
  const factory OnboardingState.error(String error) = $_Error;
  const factory OnboardingState.loaded(List? news) = $_Loaded;
}
