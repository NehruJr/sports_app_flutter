import 'package:flutter/material.dart';
import 'package:sports_application/data/models/basketball_models/basketball_leagues_model.dart';
import 'package:sports_application/data/web_services/basketball_web_services/basketball_leagues_api.dart';
import 'package:sports_application/ui/screens/basketball/basketball_widgets/basketball_league_card.dart';

class BasketballLeaguesSearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getSearchedBasketballLeagues(query.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0 , top: 20 , bottom: 20),
                    child: BasketballLeagueCard(
                        basketballLeaguesResponse: snapshot.data![index]),
                  );
                });
          }
          if (snapshot.hasError) {
            return Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                'Something went wrong!',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'There is no data available',
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<BasketballLeaguesResponse>>(
        future: getSearchedBasketballLeagues(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BasketballLeagueCard(
                      basketballLeaguesResponse: snapshot.data![index]);
                });
          }
          if (snapshot.hasError) {
            return Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                'Something went wrong!',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'There is no data available',
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }
}
