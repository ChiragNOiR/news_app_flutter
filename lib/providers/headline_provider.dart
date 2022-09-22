import 'package:flutter/material.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/models/services/news_services.dart';

class HeadlineProvider extends ChangeNotifier {
  late NewsService _newsService;

  HeadlineProvider({required NewsService newsService}) {
    _newsService = newsService;
  }
  List<ArticleModel> _headlines = [];
  List<ArticleModel> get headline => _headlines;

  void getNews() async {
    _headlines = await _newsService.getNews();
    notifyListeners();
  }
}
