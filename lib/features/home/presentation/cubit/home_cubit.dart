import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:newsnow/features/features.dart';

class OnboardingCubit extends Cubit<HomeState> {
  OnboardingCubit(
      //   {
      //   required this.newsUseCase,
      // }
      )
      : super(const HomeState.initial());

  // final NewsUseCase newsUseCase;

  String? test = 'test man';
  Future<void> getNews(
    BuildContext context,
  ) async {
    emit(const HomeState.loading());

    Logger().d('man work nah');
  }
}
