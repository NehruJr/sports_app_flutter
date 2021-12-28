import 'package:flutter/material.dart';
import 'package:sports_application/data/models/football_models/football_models.dart';
import 'package:sports_application/data/web_services/football_web_services/football_teams_api.dart';
import 'package:sports_application/ui/screens/football/football_widgets/football_widgets.dart';
import 'package:sports_application/ui/widgets/widgets.dart';

class FootballTeamsScreen extends StatelessWidget {
  const FootballTeamsScreen({Key? key, required this.leagueModel})
      : super(key: key);

  static const routeName = '/football_teams_screen';
  final FootballLeaguesResponse leagueModel;
  static Route route(leagueModel) {
    return MaterialPageRoute(
      builder: (_) => FootballTeamsScreen(
        leagueModel: leagueModel,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        screenName: leagueModel.league.name,
        color: Colors.black,
          actions: const [Icon(Icons.search)]
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0 , bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TeamsDisplayList(leagueId: leagueModel.league.id,),
                    ],
                  ),
                ))),
      ),
    );
  }
}

class TeamsDisplayList extends StatelessWidget {
  const TeamsDisplayList({Key? key, required this.leagueId}) : super(key: key);
  final int leagueId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: FutureBuilder<List<FootballTeamResponse>>(
        future: getFootballResponseTeams(leagueId: leagueId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FootballTeamCard(
                      footballTeamResponse: snapshot.data![index]);
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
