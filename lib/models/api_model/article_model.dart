import 'package:flutter/material.dart';

class ArticleModel with ChangeNotifier {
  String? title;
  String? description;
  String urlToImage;
  String? date;
  String? content;
  String? url;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.date,
      required this.urlToImage,
      required this.url,
      required this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['publishedAt'] as String,
      urlToImage: json['urlToImage'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
    );
  }
}
