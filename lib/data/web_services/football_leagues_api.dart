import 'dart:convert';

import 'package:sports_application/config/consts.dart';
import 'package:sports_application/data/models/football_leagues_model.dart';
import 'package:http/http.dart' as http;

Future<List<FootballLeaguesResponse>> getFootballResponseLeagues() async {
  const url = 'https://v3.football.api-sports.io/leagues';
  final res = await http.get(Uri.parse(url),
      headers: {'x-apisports-key': sportsApiKey});
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(res.body);
    print('---------------');
    List data = body['response'];
    List<FootballLeaguesResponse> allLeagues = [];
    for (var a in data) {
      FootballLeaguesResponse leagueModel = FootballLeaguesResponse.fromJson(a);
      allLeagues.add(leagueModel);
    }
    print('---------------');
    print(allLeagues);
    print('---------------');

    return allLeagues;
  } else {
    throw Exception('Error');
  }
}
