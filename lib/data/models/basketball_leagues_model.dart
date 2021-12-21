class BasketBallLeaguesModel {
  BasketBallLeaguesModel({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });
  late final String get;
  late final List<dynamic> parameters;
  late final List<dynamic> errors;
  late final int results;
  late final List<BasketballLeaguesResponse> response;

  BasketBallLeaguesModel.fromJson(Map<String, dynamic> json){
    get = json['get'];
    parameters = List.castFrom<dynamic, dynamic>(json['parameters']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    response = List.from(json['response']).map((e)=>BasketballLeaguesResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['get'] = get;
    _data['parameters'] = parameters;
    _data['errors'] = errors;
    _data['results'] = results;
    _data['response'] = response.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BasketballLeaguesResponse {
  BasketballLeaguesResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
    //required this.country,
    //required this.seasons,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String logo;
  //late final BasketballLeaguesCountry country;
  //late final List<BasketballLeaguesSeasons> seasons;

  BasketballLeaguesResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
    //country = BasketballLeaguesCountry.fromJson(json['country']);
    //seasons = List.from(json['seasons']).map((e)=>BasketballLeaguesSeasons.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['logo'] = logo;
    //_data['country'] = country.toJson();
    //_data['seasons'] = seasons.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BasketballLeaguesCountry {
  BasketballLeaguesCountry({
    required this.id,
    required this.name,
    this.code,
    required this.flag,
  });
  late final int id;
  late final String name;
  late final String? code;
  late final String flag;

  BasketballLeaguesCountry.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    code = null;
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['flag'] = flag;
    return _data;
  }
}

class BasketballLeaguesSeasons {
  BasketballLeaguesSeasons({
    required this.season,
    required this.start,
    required this.end,
  });
  late final String? season;
  late final String start;
  late final String end;

  BasketballLeaguesSeasons.fromJson(Map<String, dynamic> json){
    season = json['season'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['season'] = season;
    _data['start'] = start;
    _data['end'] = end;
    return _data;
  }
}