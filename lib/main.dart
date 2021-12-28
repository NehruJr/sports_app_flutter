import 'package:flutter/material.dart';
import 'package:sports_application/config/app_route.dart';
import 'package:sports_application/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String mainInitialRoute;
  getInitialRoute().then((value) {
    mainInitialRoute = value;

    runApp(MyApp(mainInitialRoute: mainInitialRoute));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.mainInitialRoute}) : super(key: key);
  final String mainInitialRoute;

  @override
  Widget build(BuildContext context) {
    final theme = SportsTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.appTheme(),
      initialRoute: mainInitialRoute,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
