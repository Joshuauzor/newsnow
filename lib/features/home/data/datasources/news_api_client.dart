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
    '/everything?q=apple&from=2022-05-14&to=2022-05-14&sortBy=popularity&apiKey=31c13955384f491586487900a603cca2',
  )
  Future<HttpResponse> getNews();

  @GET(
    '/top-headlines?sources=techcrunch&apiKey=31c13955384f491586487900a603cca2',
  )
  Future<HttpResponse> getLatestNews();
}
