import 'package:dartz/dartz.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/features/features.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>> getNews({required bool fromRemote});
  Future<Either<Failure, List<NewsModel>>> getLatestNews({
    required bool fromRemote,
  });
}
