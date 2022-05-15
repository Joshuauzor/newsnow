import 'package:newsnow/features/features.dart';

class NewsListModel {
  NewsListModel({
    required this.list,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        list: List<NewsModel>.from(
          (json['articles'] as List).map(
            (x) {
              return NewsModel.fromJson(x);
            },
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'articles': List<dynamic>.from(list.map((x) => x.toJson())),
      };

  final List<NewsModel> list;
}
