
import 'package:reading_application_app/models/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJason(json['source']),
      author: json['author'] == null ? "No Data" : json['author'] as String,
      title: json['title'] == null ? "No Data" : json['title'] as String,
      description: json['description'] == null
          ? "No Data"
          : json['description'] as String,
      url: json['url'] == null ? "No Data" : json['url'] as String,
      urlToImage:
          json['urlToImage'] == null ? "No Data" : json['urlToImage'] as String,
      publishedAt: json['publishedAt'] == null
          ? "No Data"
          : json['publishedAt'] as String,
      content: json['content'] == null ? "No Data" : json['content'] as String,
    );
  }
}
