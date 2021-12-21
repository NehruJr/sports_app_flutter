import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/football_leagues_model.dart';
import 'package:sports_application/data/models/news_articles_model.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({Key? key, required this.articles}) : super(key: key);
  Articles articles;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('pressed');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(articles.urlToImage , height: 100, width: 100,),
              title: Text(articles.title),
              subtitle: Text(articles.description),
            ),
          ],
        ),
      ),
    );
  }
}
