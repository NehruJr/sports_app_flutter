class FootballTeamsModel {
  FootballTeamsModel({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });
  late final String get;
  late final Parameters parameters;
  late final List<dynamic> errors;
  late final int results;
  late final List<FootballTeamResponse> response;

  FootballTeamsModel.fromJson(Map<String, dynamic> json){
    get = json['get'];
    parameters = Parameters.fromJson(json['parameters']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    response = List.from(json['response']).map((e)=>FootballTeamResponse.fromJson(e)).toList();
  }

}

class Parameters {
  Parameters({
    required this.league,
    required this.season,
  });
  late final String league;
  late final String season;

  Parameters.fromJson(Map<String, dynamic> json){
    league = json['league'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['league'] = league;
    _data['season'] = season;
    return _data;
  }
}


class FootballTeamResponse {
  FootballTeamResponse({
    required this.team,
    required this.venue,
  });
  late final Team team;
  late final Venue venue;

  FootballTeamResponse.fromJson(Map<String, dynamic> json){
    team = Team.fromJson(json['team']);
    venue = Venue.fromJson(json['venue']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team'] = team.toJson();
    _data['venue'] = venue.toJson();
    return _data;
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String country;
  late final int founded;
  late final bool national;
  late final String logo;

  Team.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    country = json['country'];
    founded = json['founded'];
    national = json['national'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    _data['founded'] = founded;
    _data['national'] = national;
    _data['logo'] = logo;
    return _data;
  }
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String address;
  late final String city;
  late final int capacity;
  late final String surface;
  late final String image;

  Venue.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    capacity = json['capacity'];
    surface = json['surface'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['city'] = city;
    _data['capacity'] = capacity;
    _data['surface'] = surface;
    _data['image'] = image;
    return _data;
  }
}