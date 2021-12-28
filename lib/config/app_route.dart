import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_application/ui/screens/screens.dart';
import 'package:sports_application/ui/web_view/web_view_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case FootballHomeScreen.routeName:
        return FootballHomeScreen.route();
      case FootballTeamsScreen.routeName:
        return FootballTeamsScreen.route(settings.arguments);
      case BasketHomeScreen.routeName:
        return BasketHomeScreen.route();
      case BasketballTeamsScreen.routeName:
        return BasketballTeamsScreen.route(settings.arguments);
      case NewsWebView.routeName:
        return NewsWebView.route(settings.arguments);
      case SettingsScreen.routeName:
        return SettingsScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text("error")),
        ),
        settings: const RouteSettings(name: 'error'));
  }
}


getInitialRoute() async {
  SharedPreferences getPreferences = await SharedPreferences.getInstance();

  bool? footballIsMain = getPreferences.getBool('football');
  bool? basketballIsMain = getPreferences.getBool('basketball');
  if (footballIsMain == true) {
    return FootballHomeScreen.routeName;
  } else if (basketballIsMain == true) {
    return BasketHomeScreen.routeName;
  } else {
    return WelcomeScreen.routeName;
  }
}