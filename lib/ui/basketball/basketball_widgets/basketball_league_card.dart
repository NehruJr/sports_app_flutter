import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sports_application/config/theme.dart';
import 'package:sports_application/data/models/basketball_leagues_model.dart';
import 'package:sports_application/data/models/football_leagues_model.dart';

class BasketballLeagueCard extends StatelessWidget {
  BasketballLeagueCard({Key? key, required this.basketballLeaguesResponse}) : super(key: key);
  BasketballLeaguesResponse basketballLeaguesResponse;
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.network(basketballLeaguesResponse.logo, height: 50),
                  const SizedBox(width: 5,),
                  Text(basketballLeaguesResponse.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),

                ],
              ),
            /*  SizedBox(width: 20,),
              Row(
                children: [
                  SvgPicture.network(basketballLeaguesResponse.country.flag , width: 20 ,height: 20,),
                  Text(basketballLeaguesResponse.country.name ,style: textTheme.headline6!.copyWith(color: Colors.white), ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
