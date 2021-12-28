import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sports_application/config/consts.dart';
import 'package:sports_application/data/models/basketball_models/basketball_teams_model.dart';

Future<List<BasketballTeamResponse>> getBasketballTeams(int leagueId) async {
  String spceficLeague = '?league=$leagueId';
  String url = 'https://v1.basketball.api-sports.io/teams$spceficLeague&season=2021-2022';
  final res = await http.get(Uri.parse(url),
      headers: {'x-apisports-key': sportsAPiKey} );
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(res.body);
    print('---------------');
    List data = body['response'];
    List<BasketballTeamResponse> allBasketballTeams = [];
    for (var a in data) {
      BasketballTeamResponse leagueModel = BasketballTeamResponse.fromJson(a);
      allBasketballTeams.add(leagueModel);
    }
    print('------Teams---------');
    print(allBasketballTeams);
    print('--------Teams-------');

    return allBasketballTeams;
  } else {
    throw Exception(body['error'].isEmpty? 'error':body['error']);
  }
}
