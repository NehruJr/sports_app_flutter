import 'package:flutter/material.dart';
import 'package:sports_application/data/models/news_articles_model.dart';
import 'package:sports_application/data/web_services/news_api.dart';

import 'article_card.dart';

class NbaDisplayingList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.5,
      width: size.width,
      child: FutureBuilder<List<Articles>>(
        future:getBasketArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ArticleCard(articles: snapshot.data![index]);
                });
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
