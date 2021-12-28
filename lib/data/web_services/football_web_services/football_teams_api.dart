import 'dart:convert';

import 'package:sports_application/config/consts.dart';
import 'package:sports_application/data/models/football_models/football_teams_model.dart';
import 'package:http/http.dart' as http;

Future<List<FootballTeamResponse>> getFootballResponseTeams({required int leagueId}) async {
  leagueId;
  var url = 'https://v3.football.api-sports.io/teams?league=$leagueId&season=2021';
  final res = await http.get(Uri.parse(url),
      headers: {'x-apisports-key': sportsAPiKey});
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(body.toString());
    List data = body['response'];
    List<FootballTeamResponse> allTeams = [];
    for (var a in data) {
      FootballTeamResponse teamModel = FootballTeamResponse.fromJson(a);
      allTeams.add(teamModel);
    }
    print('-------all--------');
    print(allTeams);
    return allTeams;
  } else {
    throw Exception('Error');
  }
}
