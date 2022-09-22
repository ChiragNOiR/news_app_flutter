import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_tut/models/services/news_services.dart';
import 'package:news_app_tut/providers/headline_provider.dart';
import 'package:news_app_tut/providers/more_news_provider.dart';
import 'package:news_app_tut/screens/home_screen.dart';
import 'package:news_app_tut/styles/app_styles.dart';
import 'package:provider/provider.dart';

void main() {
  final NewsService newsService = NewsService();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => HeadlineProvider(newsService: newsService)),
      ChangeNotifierProvider(
          create: (context) => MoreNewsProvider(newsService: newsService))
    ],
    child: MyApp(
      newsService: newsService,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final NewsService newsService;
  const MyApp({Key? key, required this.newsService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: AppStyle.primaryColor,
      ),
      home: const HomeScreen(),
    );
  }
}
