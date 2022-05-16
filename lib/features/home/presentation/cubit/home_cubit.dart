import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/features/features.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.newsUseCase,
    required this.latestNewsUseCase,
  }) : super(const HomeState.initial());

  final NewsUseCase newsUseCase;
  final LatestNewsUseCase latestNewsUseCase;

  Future getNews(
    BuildContext context,
  ) async {
    emit(const HomeState.loading());
    final result = await newsUseCase(const NewsUseCaseParams());
    emit(
      result.fold(
        (failure) => HomeState.error(ConvertFailureToString()(failure)),
        (news) {
          return HomeState.loaded(news);
        },
      ),
    );
  }

  Future getLatestNews(
    BuildContext context,
  ) async {
    emit(const HomeState.loading());
    final result = await newsUseCase(const NewsUseCaseParams());
    emit(
      result.fold(
        (failure) => HomeState.error(ConvertFailureToString()(failure)),
        (news) {
          return HomeState.loaded(news);
        },
      ),
    );
  }
}
