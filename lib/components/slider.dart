import 'package:flutter/material.dart';
import 'package:news_app_tut/components/breaking_news_card.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/models/services/news_services.dart';

class NewsSlider extends StatefulWidget {
  const NewsSlider({super.key});
  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  List<ArticleModel> listOfNews = [];
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    listOfNews = await NewsService().getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 280,
            child: ListView.builder(
              itemBuilder: (context, index) {
                ArticleModel article = listOfNews[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BreakingNewsCard(article)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: BreakingNewsCard(article),
                  ),
                );
              },
              itemCount: listOfNews.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
