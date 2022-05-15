import 'package:equatable/equatable.dart';
import 'package:newsnow/features/features.dart';

class News extends Equatable {
  const News({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final SourceModel source;
  final String? author;
  final String title;
  final String description;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        urlToImage,
        publishedAt,
        content,
      ];
}
