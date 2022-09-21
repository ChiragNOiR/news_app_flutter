import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_tut/api_constants.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';

class NewsService {
  Future<List<ArticleModel>> getHeadlines() async {
    List<ArticleModel> news = [];
    try {
      Uri uri = Uri.parse(
          '${ApiCons.baseUrl}top-headlines?country=us&apiKey=${ApiCons.apiKey}&pageSize=10');
      final response = await http.get(uri);
      final apiDatas = jsonDecode(response.body);
      for (var apiData in apiDatas['articles']) {
        if (apiData['content'] != null || apiData['description'] != null) {
          ArticleModel article = ArticleModel.fromJson(apiData);
          news.add(article);
        }
      }
    } catch (e) {
      return news;
    }
    return news;
  }

  Future<List<ArticleModel>> getNews() async {
    List<ArticleModel> news = [];
    try {
      Uri uri = Uri.parse(
          '${ApiCons.baseUrl}everything?q=bitcoin&apiKey=${ApiCons.apiKey}&pageSize=10');
      final response = await http.get(uri);
      final apiDatas = jsonDecode(response.body);
      for (var apiData in apiDatas['articles']) {
        if (apiData['content'] != null || apiData['description'] != null) {
          ArticleModel article = ArticleModel.fromJson(apiData);
          news.add(article);
        }
      }
    } catch (e) {
      return news;
    }
    return news;
  }
}
