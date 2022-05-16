import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/features/home/presentation/cubit/latest_news_state.dart';

class LatestNewsCubit extends Cubit<LatestNewsState> {
  LatestNewsCubit({
    required this.latestNewsUseCase,
  }) : super(const LatestNewsState.initial());

  final LatestNewsUseCase latestNewsUseCase;

  Future getLatestNews(
    BuildContext context,
  ) async {
    emit(const LatestNewsState.loading());
    final result = await latestNewsUseCase(const LatestNewsUseCaseParams());
    emit(
      result.fold(
        (failure) => LatestNewsState.error(ConvertFailureToString()(failure)),
        (news) {
          return LatestNewsState.loaded(news);
        },
      ),
    );
  }
}
