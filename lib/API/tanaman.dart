class Tanaman {
  List<Data>? data;
  Links? links;
  Meta? meta;

  Tanaman({this.data, this.links, this.meta});

  Tanaman.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? commonName;
  String? slug;
  String? scientificName;
  int? year;
  String? bibliography;
  String? author;
  String? status;
  String? rank;
  String? familyCommonName;
  int? genusId;
  String? imageUrl;
  List<String>? synonyms;
  String? genus;
  String? family;
  Links? links;

  Data(
      {this.id,
      this.commonName,
      this.slug,
      this.scientificName,
      this.year,
      this.bibliography,
      this.author,
      this.status,
      this.rank,
      this.familyCommonName,
      this.genusId,
      this.imageUrl,
      this.synonyms,
      this.genus,
      this.family,
      this.links});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    slug = json['slug'];
    scientificName = json['scientific_name'];
    year = json['year'];
    bibliography = json['bibliography'];
    author = json['author'];
    status = json['status'];
    rank = json['rank'];
    familyCommonName = json['family_common_name'];
    genusId = json['genus_id'];
    imageUrl = json['image_url'];
    synonyms = json['synonyms'].cast<String>();
    genus = json['genus'];
    family = json['family'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['common_name'] = this.commonName;
    data['slug'] = this.slug;
    data['scientific_name'] = this.scientificName;
    data['year'] = this.year;
    data['bibliography'] = this.bibliography;
    data['author'] = this.author;
    data['status'] = this.status;
    data['rank'] = this.rank;
    data['family_common_name'] = this.familyCommonName;
    data['genus_id'] = this.genusId;
    data['image_url'] = this.imageUrl;
    data['synonyms'] = this.synonyms;
    data['genus'] = this.genus;
    data['family'] = this.family;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Links {
  String? self;
  String? plant;
  String? genus;

  Links({this.self, this.plant, this.genus});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    plant = json['plant'];
    genus = json['genus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['plant'] = this.plant;
    data['genus'] = this.genus;
    return data;
  }
}

class Linkss {
  String? self;
  String? first;
  String? next;
  String? last;

  Linkss({this.self, this.first, this.next, this.last});

  Linkss.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    next = json['next'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['first'] = this.first;
    data['next'] = this.next;
    data['last'] = this.last;
    return data;
  }
}

class Meta {
  int? total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
