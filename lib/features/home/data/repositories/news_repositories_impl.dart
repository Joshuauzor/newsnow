import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:newsnow/core/errors/error.dart';
import 'package:newsnow/core/errors/failure.dart';
import 'package:newsnow/features/features.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this.newsRemoteDataSource);

  final NewsRemoteDataSource newsRemoteDataSource;

  @override
  Future<Either<Failure, List<NewsModel>>> getNews({
    required bool fromRemote,
  }) async {
    try {
      final response =
          await newsRemoteDataSource.getNews(fromRemote: fromRemote);
      return Right(response);
    } catch (e) {
      if (e is NewsNowException) {
        return Left(
          e.when(
            server: Failure.serverError,
            noInternet: Failure.noInternet,
            app: Failure.app,
            unknown: Failure.unknown,
          ),
        );
      } else if (e is DioError) {
        return Left(
          Failure.serverError(
            (e.response?.data
                    as Map<String, dynamic>?)?['responseDescription'] ??
                e.message,
          ),
        );
      }
      return const Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> getLatestNews({
    required bool fromRemote,
  }) async {
    try {
      final response =
          await newsRemoteDataSource.getLatestNews(fromRemote: fromRemote);
      return Right(response);
    } catch (e) {
      if (e is NewsNowException) {
        return Left(
          e.when(
            server: Failure.serverError,
            noInternet: Failure.noInternet,
            app: Failure.app,
            unknown: Failure.unknown,
          ),
        );
      } else if (e is DioError) {
        return Left(
          Failure.serverError(
            (e.response?.data
                    as Map<String, dynamic>?)?['responseDescription'] ??
                e.message,
          ),
        );
      }
      return const Left(Failure.unknown());
    }
  }
}
