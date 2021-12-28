import 'package:flutter/material.dart';

import 'package:sports_application/data/models/news_models/news_articles_model.dart';
import 'package:sports_application/ui/web_view/web_view_screen.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.articles}) : super(key: key);
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsWebView.routeName , arguments: articles);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                articles.urlToImage,
                height: 100,
                width: 100,
              ),
              title: Text(articles.title),
              subtitle: Text(articles.description),
            ),
          ],
        ),
      ),
    );
  }
}
