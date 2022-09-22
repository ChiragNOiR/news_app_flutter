import 'package:flutter/material.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/models/services/news_services.dart';

class MoreNewsProvider extends ChangeNotifier {
  late NewsService _newsService;

  MoreNewsProvider({required NewsService newsService}) {
    _newsService = newsService;
  }
  List<ArticleModel> _everything = [];
  List<ArticleModel> get headline => _everything;

  void getNews() async {
    _everything = await _newsService.getHeadlines();
    notifyListeners();
  }
}
