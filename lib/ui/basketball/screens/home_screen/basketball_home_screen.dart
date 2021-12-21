import 'package:flutter/material.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/basketball_leagues_model.dart';
import 'package:sports_application/data/web_services/basketball_leagues_api.dart';
import 'package:sports_application/ui/basketball/basketball_widgets/basketball_league_card.dart';
import 'package:sports_application/ui/widgets/custom_appbar.dart';
import 'package:sports_application/ui/widgets/custom_drawer.dart';
import 'package:sports_application/ui/widgets/nba_news_displaying_list.dart';
import 'package:sports_application/ui/widgets/news_display_list.dart';

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
      appBar: const CustomAppBar(pageName: 'Basketball',color: Colors.amber,),
      drawer: CustomDrawer(),
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
                      Text(
                        'Newest Sport News',
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
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getBasketballResponseLeagues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('snapshoot data');
            print(snapshot.data);
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
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getSearchedBasketballLeagues(basketballLeagueName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('snapshoot data');
            print(snapshot.data);
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
