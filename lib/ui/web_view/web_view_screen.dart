import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sports_application/data/models/news_models/news_articles_model.dart';
import 'package:sports_application/ui/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({Key? key, required this.articles}) : super(key: key);
  final Articles articles;

  static const String routeName = '/news_webview';

  static Route route(articles) {
    return MaterialPageRoute(
      builder: (_) => NewsWebView(articles: articles),
      settings: RouteSettings(name: routeName, arguments: articles),
    );
  }

  @override
  NewsWebViewState createState() => NewsWebViewState(articles: articles);
}

class NewsWebViewState extends State<NewsWebView> {
  NewsWebViewState({required this.articles});
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text(articles.title,style: Theme.of(context).textTheme.headline6,) ,backgroundColor: Colors.white,elevation: 0, ),
      body: SafeArea(
        child: WebView(
          initialUrl: articles.url,
        ),
      ),
    );
  }
}
