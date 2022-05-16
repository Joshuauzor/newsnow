import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:newsnow/core/constant/constant.dart';
import 'package:newsnow/core/errors/error.dart';
import 'package:newsnow/core/network/network_info.dart';
import 'package:newsnow/features/features.dart';
import 'package:newsnow/features/home/data/models/news_list_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews({required bool fromRemote});
  Future<List<NewsModel>> getLatestNews({required bool fromRemote});
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({
    required this.networkInfo,
    required this.dio,
  }) : super() {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // retry count (optional)
        retryDelays: const [
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );
    client = NewsApiClient(dio, baseUrl: dotenv.env[EnvConstants.baseUrl]!);
  }

  final NetworkInfo networkInfo;
  final Dio dio;
  late final NewsApiClient client;

  @override
  Future<List<NewsModel>> getNews({
    required bool fromRemote,
  }) async {
    if (fromRemote) {
      if (await networkInfo.isConnected) {
        final response = await client.getNews();
        return NewsListModel.fromJson(
          response.response.data as Map<String, dynamic>,
        ).list;
      } else {
        throw const NewsNowException.noInternet();
      }
    }
    throw const NewsNowException.noInternet();
  }

  @override
  Future<List<NewsModel>> getLatestNews({
    required bool fromRemote,
  }) async {
    if (fromRemote) {
      if (await networkInfo.isConnected) {
        final response = await client.getLatestNews();
        return NewsListModel.fromJson(
          response.response.data as Map<String, dynamic>,
        ).list;
      } else {
        throw const NewsNowException.noInternet();
      }
    }
    throw const NewsNowException.noInternet();
  }
}
