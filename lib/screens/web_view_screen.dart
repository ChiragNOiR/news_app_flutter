import 'package:flutter/material.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/styles/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetails extends StatefulWidget {
  WebViewDetails({required this.data, super.key});
  ArticleModel data;

  @override
  State<WebViewDetails> createState() => _WebViewDetailsState();
}

class _WebViewDetailsState extends State<WebViewDetails> {
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
      body: WebView(
        initialUrl: widget.data.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
