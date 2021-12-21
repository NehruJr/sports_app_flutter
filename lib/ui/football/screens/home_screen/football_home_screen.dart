import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_application/data/models/football_leagues_model.dart';
import 'package:sports_application/data/web_services/football_leagues_api.dart';
import 'package:sports_application/ui/football/football_widgets/football_league_card.dart';
import 'package:sports_application/ui/widgets/custom_appbar.dart';
import 'package:sports_application/ui/widgets/custom_drawer.dart';
import 'package:sports_application/ui/widgets/news_display_list.dart';

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
      appBar: const CustomAppBar(pageName: 'Football',color: Colors.black,),
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
                          Text('Leagues' , style: textTheme.headline2,),
                          const LeaguesDisplayList(),
                          Text('Cups' , style: textTheme.headline2,),
                         const CupDisplayList(),
                          Text('News', style: textTheme.headline2,),
                          FittedBox(child: NewsDisplayingList()),
                        ],
                      ),
                    ))),
          ),


    );
  }
}
/*Text('Cups' , style: textTheme.headline2,),
Text('Newest Sport News' , style: textTheme.headline2,),*/


class LeaguesDisplayList extends StatelessWidget {
  const LeaguesDisplayList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.1,
      width: size.width,
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
                return snapshot.data![index].league.type
                    .contains('Cup')
                    ? Container()
                    : LeagueCard(
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


class CupDisplayList extends StatelessWidget {
  const CupDisplayList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.1,
      width: size.width,
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
                  return snapshot.data![index].league.type
                      .contains('League')
                      ? Container()
                      : LeagueCard(
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
