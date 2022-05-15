import 'package:equatable/equatable.dart';

class News extends Equatable {
  News({
    required this.sources,
    required this.author,
    required this.title,
    required this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final List<String> sources;
  final String author;
  final String title;
  final String description;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
}
