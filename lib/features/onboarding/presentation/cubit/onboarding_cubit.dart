import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:newsnow/features/features.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial());

  Future<void> getNews(
    BuildContext context,
  ) async {
    print('hello bro');
    Logger().d('man work nah');
  }
}
