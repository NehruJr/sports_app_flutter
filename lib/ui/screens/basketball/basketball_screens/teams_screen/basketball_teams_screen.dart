import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sports_application/data/models/basketball_models/basketball_models.dart';
import 'package:sports_application/data/web_services/basketball_web_services/basketball_webservices.dart';
import 'package:sports_application/ui/screens/basketball/basketball_widgets/basketball_widgets.dart';
import 'package:sports_application/ui/widgets/widgets.dart';

class BasketballTeamsScreen extends StatelessWidget {
  const BasketballTeamsScreen({Key? key, required this.basketballLeaguesResponse}) : super(key: key);
  static const routeName = '/basket_teams_screen';
  final BasketballLeaguesResponse basketballLeaguesResponse;
  static Route route(basketballLeaguesResponse) {
    return MaterialPageRoute(
        builder: (_) => BasketballTeamsScreen(basketballLeaguesResponse:basketballLeaguesResponse ,),
        settings: const RouteSettings(name: BasketballTeamsScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(screenName:basketballLeaguesResponse.name , color: basketballLeaguesResponse.id == 12 ? Colors.amber : Colors.black,
          actions: const [Icon(Icons.search)]
      ),
      //drawer: CustomDrawer(),
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
                      BasketballTeamsDisplayList(basketballLeagueid: basketballLeaguesResponse.id,),
                    ],
                  ),
                ))),
      ),
    );
  }
}


class BasketballTeamsDisplayList extends StatelessWidget {
  const BasketballTeamsDisplayList({Key? key, required this.basketballLeagueid}) : super(key: key);
  final int basketballLeagueid ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.9,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: FutureBuilder<List<BasketballTeamResponse>>(
        future: getBasketballTeams(basketballLeagueid),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BasketballTeamCard(
                    teamResponse: snapshot.data![index],
                  );
                });
          }
          else if (snapshot.hasData && snapshot.data!.isEmpty ){
            return const Center(
              child: Text('There is no data available' ,),
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
