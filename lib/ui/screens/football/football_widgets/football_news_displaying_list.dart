import 'package:flutter/material.dart';
import 'package:sports_application/data/models/news_models/news_articles_model.dart';
import 'package:sports_application/data/web_services/news_web_services/news_api.dart';

import 'package:sports_application/ui/widgets/widgets.dart';

class NewsDisplayingList extends StatelessWidget {
  const NewsDisplayingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      width: size.width * .9,
      child: FutureBuilder<List<Articles>>(
        future: getFootballArticles(),
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
