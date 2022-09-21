import 'package:flutter/material.dart';
import 'package:news_app_tut/components/news_list_tile.dart';
import 'package:news_app_tut/components/slider.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/models/services/news_services.dart';
import 'package:news_app_tut/styles/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> listOfNews = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    listOfNews = await NewsService().getHeadlines();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fw",
              style: AppStyle.appBarTitleText,
            ),
            Text(
              "News",
              style: AppStyle.appBarTitle,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Top Headlines", style: AppStyle.h1Text),
              const SizedBox(
                height: 20,
              ),
              const NewsSlider(),
              const SizedBox(
                height: 40.0,
              ),
              Text("More News", style: AppStyle.h1Text),
              const SizedBox(
                height: 16.0,
              ),
              Column(
                children: listOfNews.map((e) => NewsListTile(e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
