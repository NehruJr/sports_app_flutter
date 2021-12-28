import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/basketball_models/basketball_teams_model.dart';

class BasketballTeamCard extends StatelessWidget {
  const BasketballTeamCard({Key? key, required this.teamResponse}) : super(key: key);
  final BasketballTeamResponse teamResponse;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        print('team pressed');
      },
      child: Padding(
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
              Image.network(teamResponse.logo, height: 100),
              const SizedBox(width: 5,),
              Text(teamResponse.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),
            ],
          ),
        ),
      ),
    );
  }
}
