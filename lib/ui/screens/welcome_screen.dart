import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sports_application/ui/screens/screens.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WelcomeScreen(),
      settings: const RouteSettings(name: WelcomeScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            StarterIcon(
              svgAsset: 'assets/images/svgIcons/football-svg.svg',
              newRouteName: FootballHomeScreen.routeName,
            ),
            StarterIcon(
                svgAsset: 'assets/images/svgIcons/basketball-svg.svg',
                newRouteName: BasketHomeScreen.routeName)
          ],
        ),
      ),
    );
  }
}

class StarterIcon extends StatelessWidget {
  const StarterIcon({
    Key? key,
    required this.svgAsset,
    required this.newRouteName,
  }) : super(key: key);
  final String newRouteName, svgAsset;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, newRouteName, (route) => false);
      },
      child: SvgPicture.asset(
        svgAsset,
        width: size.height * .2,
        height: size.height * .2,
      ),
    );
  }
}
