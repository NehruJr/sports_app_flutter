class FootballLeagueModel {
  FootballLeagueModel({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.leagueResponse,
  });
  late final String get;
  late final List<dynamic> parameters;
  late final List<dynamic> errors;
  late final int results;
  late final Paging paging;
  late final List<FootballLeaguesResponse> leagueResponse;

  FootballLeagueModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = List.castFrom<dynamic, dynamic>(json['parameters']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    paging = Paging.fromJson(json['paging']);
    leagueResponse = List.from(json['response'])
        .map((e) => FootballLeaguesResponse.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['get'] = get;
    _data['parameters'] = parameters;
    _data['errors'] = errors;
    _data['results'] = results;
    _data['paging'] = paging.toJson();
    _data['response'] = leagueResponse.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });
  late final int current;
  late final int total;

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current'] = current;
    _data['total'] = total;
    return _data;
  }
}

class FootballLeaguesResponse {
  FootballLeaguesResponse({
    required this.league,
    required this.country,
    required this.seasons,
  });
  late final FootballLeague league;
  late final FootballLeaguesCountry country;
  late final List<FootballLeaguesSeasons> seasons;

  FootballLeaguesResponse.fromJson(Map<String, dynamic> json) {
    league = FootballLeague.fromJson(json['league']);
    country = FootballLeaguesCountry.fromJson(json['country']);
    seasons =
        List.from(json['seasons']).map((e) => FootballLeaguesSeasons.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['league'] = league.toJson();
    _data['country'] = country.toJson();
    _data['seasons'] = seasons.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FootballLeague {
  FootballLeague({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String logo;

  FootballLeague.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['logo'] = logo;
    return _data;
  }
}

class FootballLeaguesCountry {
  FootballLeaguesCountry({
    required this.name,
    this.code,
    this.flag,
  });
  late final String name;
  late final String? code;
  late final String? flag;

  FootballLeaguesCountry.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = null;
    flag = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    _data['flag'] = flag;
    return _data;
  }
}

class FootballLeaguesSeasons {
  FootballLeaguesSeasons({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });
  late final int year;
  late final String start;
  late final String end;
  late final bool current;
  late final FootballLeaguesCoverage coverage;

  FootballLeaguesSeasons.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    start = json['start'];
    end = json['end'];
    current = json['current'];
    coverage = FootballLeaguesCoverage.fromJson(json['coverage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['year'] = year;
    _data['start'] = start;
    _data['end'] = end;
    _data['current'] = current;
    _data['coverage'] = coverage.toJson();
    return _data;
  }
}

class FootballLeaguesCoverage {
  FootballLeaguesCoverage({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.topScorers,
    required this.topAssists,
    required this.topCards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });
  late final FootballLeaguesFixtures fixtures;
  late final bool standings;
  late final bool players;
  late final bool topScorers;
  late final bool topAssists;
  late final bool topCards;
  late final bool injuries;
  late final bool predictions;
  late final bool odds;

  FootballLeaguesCoverage.fromJson(Map<String, dynamic> json) {
    fixtures = FootballLeaguesFixtures.fromJson(json['fixtures']);
    standings = json['standings'];
    players = json['players'];
    topScorers = json['top_scorers'];
    topAssists = json['top_assists'];
    topCards = json['top_cards'];
    injuries = json['injuries'];
    predictions = json['predictions'];
    odds = json['odds'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fixtures'] = fixtures.toJson();
    _data['standings'] = standings;
    _data['players'] = players;
    _data['top_scorers'] = topScorers;
    _data['top_assists'] = topAssists;
    _data['top_cards'] = topCards;
    _data['injuries'] = injuries;
    _data['predictions'] = predictions;
    _data['odds'] = odds;
    return _data;
  }
}

class FootballLeaguesFixtures {
  FootballLeaguesFixtures({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });
  late final bool events;
  late final bool lineups;
  late final bool statisticsFixtures;
  late final bool statisticsPlayers;

  FootballLeaguesFixtures.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    lineups = json['lineups'];
    statisticsFixtures = json['statistics_fixtures'];
    statisticsPlayers = json['statistics_players'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['events'] = events;
    _data['lineups'] = lineups;
    _data['statistics_fixtures'] = statisticsFixtures;
    _data['statistics_players'] = statisticsPlayers;
    return _data;
  }
}
