import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/football_leagues_model.dart';

class LeagueCard extends StatelessWidget {
  LeagueCard({Key? key, required this.leagueResponse}) : super(key: key);
  FootballLeaguesResponse leagueResponse;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('pressed');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: defaultPrimaryColor.withAlpha(50),
                blurRadius: 6.0,
                spreadRadius: 5.0,
              ),
            ],
            color: defaultPrimaryColor,
          ),
          child: Row(
             children: [
              Image.network(leagueResponse.league.logo, height: 50),
              const SizedBox(width: 5,),
              Text(leagueResponse.league.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),
               const SizedBox(width: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
