import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sports_application/data/models/basketball_models/basketball_models.dart';
import 'package:sports_application/data/web_services/basketball_web_services/basketball_webservices.dart';
import 'package:sports_application/ui/screens/basketball/basketball_screens/leagues_seach/basketleagues_search_screen.dart';
import 'package:sports_application/ui/screens/basketball/basketball_widgets/basketball_widgets.dart';
import 'package:sports_application/ui/widgets/widgets.dart';

class BasketHomeScreen extends StatefulWidget {
  const BasketHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/basket_home_screen';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketHomeScreen(),
        settings: const RouteSettings(name: BasketHomeScreen.routeName));
  }

  @override
  _BasketHomeScreenState createState() => _BasketHomeScreenState();
}

class _BasketHomeScreenState extends State<BasketHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(screenName: 'Basketball',color: Colors.amber,actions:  [IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: BasketballLeaguesSearchScreen());
        },
      )]
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Leagues',
                        style: textTheme.headline2!.copyWith(color: Colors.black),
                      ),
                      const BasketballLeaguesDisplayList(),
                      Text(
                        'Nba',
                        style: textTheme.headline2!.copyWith(color: Colors.amber),
                      ),
                     const BasketballSearchedLeaguesDisplayList(basketballLeagueName: 'nba',),
                     // const BasketballSearchedLeaguesDisplayList(basketballLeagueName: 'nba',),
                      Text(
                        'Newest NBA News',
                        style: textTheme.headline2,
                      ),
                      NbaDisplayingList(),
                    ],
                  ),
                ))),
      ),
    );
  }
}

class BasketballLeaguesDisplayList extends StatelessWidget {
  const BasketballLeaguesDisplayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getBasketballResponseLeagues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BasketballLeagueCard(
                    basketballLeaguesResponse: snapshot.data![index],
                  );
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

class BasketballSearchedLeaguesDisplayList extends StatelessWidget {
  const BasketballSearchedLeaguesDisplayList({Key? key, required this.basketballLeagueName}) : super(key: key);
  final String basketballLeagueName ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getSearchedBasketballLeagues(basketballLeagueName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BasketballLeagueCard(
                    basketballLeaguesResponse: snapshot.data![index],
                  );
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
