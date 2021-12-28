import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sports_application/data/models/football_models/football_leagues_model.dart';
import 'package:sports_application/data/web_services/football_web_services/football_leagues_api.dart';
import 'package:sports_application/ui/screens/football/football_screens/leagues_search_screen/leagues_search_screen.dart';
import 'package:sports_application/ui/screens/football/football_widgets/football_widgets.dart';
import 'package:sports_application/ui/widgets/widgets.dart';

class FootballHomeScreen extends StatefulWidget {
  const FootballHomeScreen({Key? key}) : super(key: key);

  static const routeName = '/football_home_screen';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const FootballHomeScreen(),
        settings: const RouteSettings(name: FootballHomeScreen.routeName));
  }

  @override
  _FootballHomeScreenState createState() => _FootballHomeScreenState();
}

class _FootballHomeScreenState extends State<FootballHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        screenName: 'Football',
        color: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: FootballLeaguesSearchScreen());
            },
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0),
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Leagues',
                      style: textTheme.headline2,
                    ),
                    const FootballLeaguesDisplayList(),
                    Text(
                      'Cups',
                      style: textTheme.headline2,
                    ),
                    const FootballCupsDisplayList(),
                    Text(
                      'News',
                      style: textTheme.headline2,
                    ),
                    const NewsDisplayingList(),
                  ],
                ))),
      ),
    );
  }
}

class FootballLeaguesDisplayList extends StatelessWidget {
  const FootballLeaguesDisplayList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * .9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: FutureBuilder<List<FootballLeaguesResponse>>(
        future: getFootballResponseLeagues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return snapshot.data![index].league.type.contains('Cup')
                      ? Container()
                      : FootballLeagueCard(
                          leagueResponse: snapshot.data![index]);
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

class FootballCupsDisplayList extends StatelessWidget {
  const FootballCupsDisplayList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * .9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: FutureBuilder<List<FootballLeaguesResponse>>(
        future: getFootballResponseLeagues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return snapshot.data![index].league.type.contains('League')
                      ? Container()
                      : FootballLeagueCard(
                          leagueResponse: snapshot.data![index]);
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
