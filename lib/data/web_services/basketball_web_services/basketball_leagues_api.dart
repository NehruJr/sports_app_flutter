import 'dart:convert';

import 'package:sports_application/config/consts.dart';
import 'package:sports_application/data/models/basketball_models/basketball_leagues_model.dart';
import 'package:http/http.dart' as http;
Future<List<BasketballLeaguesResponse>> getBasketballResponseLeagues() async {
  const url = 'https://v1.basketball.api-sports.io/leagues';
  final res = await http.get(Uri.parse(url),
      headers: {'x-apisports-key': sportsAPiKey} );
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    List data = body['response'];
    List<BasketballLeaguesResponse> allBasketballLeagues = [];
    for (var a in data) {
      BasketballLeaguesResponse leagueModel = BasketballLeaguesResponse.fromJson(a);
      allBasketballLeagues.add(leagueModel);
    }
    return allBasketballLeagues;
  } else {
    throw Exception(body['error'].isEmpty? 'error':body['error']);
  }
}

Future<List<BasketballLeaguesResponse>> getSearchedBasketballLeagues(String basketballLeagueName) async {
  String spceficLeague = '?name=$basketballLeagueName';
  String url = 'https://v1.basketball.api-sports.io/leagues$spceficLeague';
  final res = await http.get(Uri.parse(url),
      headers: {'x-apisports-key': sportsAPiKey} );
  dynamic body;
  if (res.statusCode == 200) {
    body = jsonDecode(res.body);
    print('---------------');
    print(res.body);
    print('---------------');
    List data = body['response'];
    List<BasketballLeaguesResponse> allBasketballLeagues = [];
    for (var a in data) {
      BasketballLeaguesResponse leagueModel = BasketballLeaguesResponse.fromJson(a);
      allBasketballLeagues.add(leagueModel);
    }
    print('---------------');
    print(allBasketballLeagues);
    print('---------------');

    return allBasketballLeagues;
  } else {
    throw Exception(body['error'].isEmpty? 'error':body['error']);
  }
}
