import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/football_models/football_teams_model.dart';

class FootballTeamCard extends StatelessWidget {
  const FootballTeamCard({Key? key, required this.footballTeamResponse})
      : super(key: key);
  final FootballTeamResponse footballTeamResponse;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 20.0 , bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(footballTeamResponse.team.logo, height: 100),
            const SizedBox(width: 5,),
            Text(footballTeamResponse.team.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),
            const SizedBox(width: 5,),
            Text('Founded : ${footballTeamResponse.team.founded.toString()}' ,style: textTheme.bodyText1 ),
          ],
        ),
      ),
    );
  }
}
