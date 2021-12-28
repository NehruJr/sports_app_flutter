import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:sports_application/ui/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/images/svgIcons/football-svg.svg',
                  ),
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Roshdy Nehru',
                    style: textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
          DrawerListTitle(
              routeName: FootballHomeScreen.routeName,
              title: 'Football',
              icon: 'assets/images/svgIcons/football.svg',
              textTheme: textTheme),
          DrawerListTitle(
              routeName: BasketHomeScreen.routeName,
              title: 'Basketball',
              icon: 'assets/images/svgIcons/basketball-svg.svg',
              textTheme: textTheme),
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/svgIcons/settings.svg',
              width: 20,
              height: 20,
            ),
            title: Text('User Settings', style: textTheme.headline5),
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
              ),
        ],
      ),
    );
  }
}

class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle({
    Key? key,
    required this.textTheme,
    required this.title,
    required this.routeName,
    required this.icon,
  }) : super(key: key);

  final TextTheme textTheme;
  final String title;
  final String routeName;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
      ),
      title: Text(title, style: textTheme.headline5),
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
      },
    );
  }
}
