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
}

class BasketballLeaguesResponse {
  BasketballLeaguesResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String logo;

  BasketballLeaguesResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }
}
