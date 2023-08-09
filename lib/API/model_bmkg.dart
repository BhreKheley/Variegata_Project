class BmkgModel {
  Data? data;

  BmkgModel({this.data});

  BmkgModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Forecast? forecast;

  Data({this.forecast});

  Data.fromJson(Map<String, dynamic> json) {
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}

class Forecast {
  Issue? issue;
  List<Area>? area;

  Forecast({this.issue, this.area});

  Forecast.fromJson(Map<String, dynamic> json) {
    issue = json['issue'] != null ? new Issue.fromJson(json['issue']) : null;
    if (json['area'] != null) {
      area = <Area>[];
      json['area'].forEach((v) {
        area!.add(new Area.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.issue != null) {
      data['issue'] = this.issue!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Issue {
  int? timestamp;
  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? second;

  Issue(
      {this.timestamp,
      this.year,
      this.month,
      this.day,
      this.hour,
      this.minute,
      this.second});

  Issue.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    data['second'] = this.second;
    return data;
  }
}

class Area {
  List<String>? name;
  List<Parameter>? parameter;

  Area({this.name, this.parameter});

  Area.fromJson(Map<String, dynamic> json) {
    name = json['name'].cast<String>();
    if (json['parameter'] != null) {
      parameter = <Parameter>[];
      json['parameter'].forEach((v) {
        parameter!.add(new Parameter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.parameter != null) {
      data['parameter'] = this.parameter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameter {
  List<Timerange>? timerange;

  Parameter({this.timerange});

  Parameter.fromJson(Map<String, dynamic> json) {
    if (json['timerange'] != null) {
      timerange = <Timerange>[];
      json['timerange'].forEach((v) {
        timerange!.add(new Timerange.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timerange != null) {
      data['timerange'] = this.timerange!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timerange {
  int? value;

  Timerange({this.value});

  Timerange.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
