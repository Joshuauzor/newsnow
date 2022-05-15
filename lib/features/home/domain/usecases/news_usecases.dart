import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/core/usecase/usecase.dart';
import 'package:newsnow/features/features.dart';

@lazySingleton
class NewsUseCase implements UseCase<List<NewsModel>, NewsUseCaseParams> {
  NewsUseCase(this.repository);

  final NewsRepository repository;

  @override
  Future<Either<Failure, List<NewsModel>>> call(
      NewsUseCaseParams params) async {
    return repository.getNews(fromRemote: params.fromRemote);
  }
}

class NewsUseCaseParams extends Equatable {
  const NewsUseCaseParams({this.fromRemote = true});
  final bool fromRemote;

  @override
  List<Object?> get props => [fromRemote];
}
