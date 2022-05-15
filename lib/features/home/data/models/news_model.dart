import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsnow/features/features.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends News {
  const NewsModel({
    required SourceModel source,
    required String author,
    required String title,
    required String description,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
