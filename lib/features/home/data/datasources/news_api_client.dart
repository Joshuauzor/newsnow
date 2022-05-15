import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_client.g.dart';

@RestApi()
abstract class NewsApiClient {
  factory NewsApiClient(
    Dio dio, {
    String baseUrl,
  }) = _NewsApiClient;

  @GET(
    '/everything?q=tesla&from=2022-04-15&sortBy=publishedAt&apiKey=31c13955384f491586487900a603cca2',
  )
  Future<HttpResponse> getNews();
}
