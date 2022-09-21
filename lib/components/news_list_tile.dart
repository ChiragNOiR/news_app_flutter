import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_tut/models/api_model/article_model.dart';
import 'package:news_app_tut/styles/app_styles.dart';

import '../screens/details_screen.dart';

// ignore: must_be_immutable
class NewsListTile extends StatefulWidget {
  NewsListTile(this.data, {Key? key}) : super(key: key);
  ArticleModel data;
  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(widget.data),
            ));
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.all(12.0),
          height: 130,
          decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Hero(
                  tag: "${widget.data.title}",
                  // child: Container(
                  //   height: 100.0,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     image: DecorationImage(
                  //       image: NetworkImage(widget.data.urlToImage),
                  //       fit: BoxFit.fitHeight,
                  //     ),
                  //   ),
                  // ),
                  child: SizedBox(
                    height: 100.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                        height: 200,
                        imageUrl: widget.data.urlToImage,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                  flex: 5,
                  child: Column(
                    children: [
                      Text(
                        widget.data.title!,
                        style: AppStyle.h2Text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
