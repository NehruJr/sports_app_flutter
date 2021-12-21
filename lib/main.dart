import 'package:flutter/material.dart';
import 'package:sports_application/config/app_route.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/ui/basketball/screens/home_screen/basketball_home_screen.dart';
import 'package:sports_application/ui/football/screens/home_screen/football_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SportsTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.appTheme(),
      initialRoute: BasketHomeScreen.routeName,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
