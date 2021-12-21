import 'package:flutter/material.dart';
import 'package:sports_application/ui/basketball/screens/home_screen/basketball_home_screen.dart';
import 'package:sports_application/ui/football/screens/home_screen/football_home_screen.dart';
import 'package:sports_application/ui/welcome_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case FootballHomeScreen.routeName:
        return FootballHomeScreen.route();
      case BasketHomeScreen.routeName:
        return BasketHomeScreen.route();
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
