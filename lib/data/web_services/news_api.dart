import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_application/data/models/news_articles_model.dart';

Future<List<Articles>> getFootballArticles() async {
  const url = 'https://newsapi.org/v2/everything?q=soccer&apiKey=YourAPIKey';
  final res = await http.get(Uri.parse(url),);
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(res.body);
    print('---------------');
    List data = body['articles'];
    List<Articles> allFootballArticles = [];
    for (var a in data) {
      Articles articles = Articles.fromJson(a);
      allFootballArticles.add(articles);
    }
    return allFootballArticles;
  } else {
    throw Exception('Error');
  }
}

Future<List<Articles>> getBasketArticles() async {
  const url = 'https://newsapi.org/v2/everything?q=nba&apiKey=YourAPIKey';
  final res = await http.get(Uri.parse(url),);
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(res.body);
    print('---------------');
    List data = body['articles'];
    List<Articles> allBasketArticles = [];
    for (var a in data) {
      Articles articles = Articles.fromJson(a);
      allBasketArticles.add(articles);
    }
    return allBasketArticles;
  } else {
    throw Exception('Error');
  }
}
