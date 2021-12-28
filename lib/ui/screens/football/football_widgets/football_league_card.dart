import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/football_models/football_leagues_model.dart';
import 'package:sports_application/ui/screens/football/football_screens/teams_screen/football_teams_screen.dart';

class FootballLeagueCard extends StatelessWidget {
  FootballLeagueCard({Key? key, required this.leagueResponse})
      : super(key: key);
  FootballLeaguesResponse leagueResponse;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FootballTeamsScreen.routeName,
            arguments: leagueResponse);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withAlpha(50),
                blurRadius: 6.0,
                spreadRadius: 5.0,
              ),
            ],
            color: kPrimaryColor,
          ),
          child: Row(
            children: [
              Image.network(leagueResponse.league.logo, height: 50),
              const SizedBox(
                width: 5,
              ),
              Text(
                leagueResponse.league.name,
                style: textTheme.headline6!.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
