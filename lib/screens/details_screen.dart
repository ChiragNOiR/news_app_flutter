import 'package:flutter/material.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/styles/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data, {Key? key}) : super(key: key);
  ArticleModel data;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppStyle.textColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "${widget.data.title}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.0),
                  child: Image.network(widget.data.urlToImage),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.data.title!,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.data.date!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(widget.data.content!),
              const SizedBox(height: 100),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebView(
                                initialUrl: widget.data.url,
                                javascriptMode: JavascriptMode.unrestricted,
                              )),
                    );
                  },
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  splashColor: Colors.white54,
                  child: Text(
                    'Read More',
                    style: AppStyle.buttonText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
