import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/core/usecase/usecase.dart';
import 'package:newsnow/features/features.dart';

@lazySingleton
class LatestNewsUseCase
    implements UseCase<List<NewsModel>, LatestNewsUseCaseParams> {
  LatestNewsUseCase(this.repository);

  final NewsRepository repository;

  @override
  Future<Either<Failure, List<NewsModel>>> call(
    LatestNewsUseCaseParams params,
  ) async {
    return repository.getLatestNews(fromRemote: params.fromRemote);
  }
}

class LatestNewsUseCaseParams extends Equatable {
  const LatestNewsUseCaseParams({this.fromRemote = true});
  final bool fromRemote;

  @override
  List<Object?> get props => [fromRemote];
}
