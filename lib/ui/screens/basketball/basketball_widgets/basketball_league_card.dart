import 'package:flutter/material.dart';

import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/basketball_models/basketball_models.dart';
import 'package:sports_application/ui/screens/basketball/basketball_screens/basketball_screens.dart';

class BasketballLeagueCard extends StatelessWidget {
  const BasketballLeagueCard({Key? key, required this.basketballLeaguesResponse}) : super(key: key);
  final BasketballLeaguesResponse basketballLeaguesResponse;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('league pressed');
        Navigator.pushNamed(context, BasketballTeamsScreen.routeName , arguments: basketballLeaguesResponse);
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.network(basketballLeaguesResponse.logo, height: 50),
                  const SizedBox(width: 5,),
                  Text(basketballLeaguesResponse.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
