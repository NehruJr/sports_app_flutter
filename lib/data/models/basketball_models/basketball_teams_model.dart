class BasketballTeamsModel {
  BasketballTeamsModel({
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
  late final List<BasketballTeamResponse> response;

  BasketballTeamsModel.fromJson(Map<String, dynamic> json){
    get = json['get'];
    parameters = Parameters.fromJson(json['parameters']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    response = List.from(json['response']).map((e)=>BasketballTeamResponse.fromJson(e)).toList();
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

class BasketballTeamResponse {
  BasketballTeamResponse({
    required this.id,
    required this.name,
    required this.logo,
    required this.nationnal,
    required this.country,
  });
  late final int id;
  late final String name;
  late final String logo;
  late final bool nationnal;
  late final Country country;

  BasketballTeamResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    nationnal = json['nationnal'];
    country = Country.fromJson(json['country']);
  }

}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });
  late final int id;
  late final String name;
  late final String code;
  late final String flag;

  Country.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

}