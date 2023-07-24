class CuacaModel {
  bool? success;
  // ignore: prefer_void_to_null, unnecessary_question_mark
  Null? message;
  Data? data;

  CuacaModel({this.success, this.message, this.data});

  CuacaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? latitude;
  String? longitude;
  String? coordinate;
  String? type;
  String? region;
  String? level;
  String? description;
  String? domain;
  String? tags;
  List<Params>? params;

  Data(
      {this.id,
      this.latitude,
      this.longitude,
      this.coordinate,
      this.type,
      this.region,
      this.level,
      this.description,
      this.domain,
      this.tags,
      this.params});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinate = json['coordinate'];
    type = json['type'];
    region = json['region'];
    level = json['level'];
    description = json['description'];
    domain = json['domain'];
    tags = json['tags'];
    if (json['params'] != null) {
      params = <Params>[];
      json['params'].forEach((v) {
        params!.add(new Params.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['coordinate'] = this.coordinate;
    data['type'] = this.type;
    data['region'] = this.region;
    data['level'] = this.level;
    data['description'] = this.description;
    data['domain'] = this.domain;
    data['tags'] = this.tags;
    if (this.params != null) {
      data['params'] = this.params!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Params {
  String? id;
  String? description;
  String? type;
  List<Times>? times;

  Params({this.id, this.description, this.type, this.times});

  Params.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    type = json['type'];
    if (json['times'] != null) {
      times = <Times>[];
      json['times'].forEach((v) {
        times!.add(new Times.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['type'] = this.type;
    if (this.times != null) {
      data['times'] = this.times!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Times {
  String? type;
  String? h;
  String? datetime;
  String? value;
  String? day;
  String? celcius;
  String? fahrenheit;
  String? code;
  String? name;
  String? deg;
  String? card;
  String? sexa;
  String? kt;
  String? mph;
  String? kph;
  String? ms;

  Times(
      {this.type,
      this.h,
      this.datetime,
      this.value,
      this.day,
      this.celcius,
      this.fahrenheit,
      this.code,
      this.name,
      this.deg,
      this.card,
      this.sexa,
      this.kt,
      this.mph,
      this.kph,
      this.ms});

  Times.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    h = json['h'];
    datetime = json['datetime'];
    value = json['value'];
    day = json['day'];
    celcius = json['celcius'];
    fahrenheit = json['fahrenheit'];
    code = json['code'];
    name = json['name'];
    deg = json['deg'];
    card = json['card'];
    sexa = json['sexa'];
    kt = json['kt'];
    mph = json['mph'];
    kph = json['kph'];
    ms = json['ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['h'] = this.h;
    data['datetime'] = this.datetime;
    data['value'] = this.value;
    data['day'] = this.day;
    data['celcius'] = this.celcius;
    data['fahrenheit'] = this.fahrenheit;
    data['code'] = this.code;
    data['name'] = this.name;
    data['deg'] = this.deg;
    data['card'] = this.card;
    data['sexa'] = this.sexa;
    data['kt'] = this.kt;
    data['mph'] = this.mph;
    data['kph'] = this.kph;
    data['ms'] = this.ms;
    return data;
  }
}
