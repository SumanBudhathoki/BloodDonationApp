class BloodCollections {
  int? id;
  bool? available;
  int? pints;
  Bloodbank? bloodbank;
  List<Blood>? blood;

  BloodCollections(
      {this.id, this.available, this.pints, this.bloodbank, this.blood});

  BloodCollections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    available = json['available'];
    pints = json['pints'];
    bloodbank = json['bloodbank'] != null
        ? new Bloodbank.fromJson(json['bloodbank'])
        : null;
    if (json['blood'] != null) {
      blood = <Blood>[];
      json['blood'].forEach((v) {
        blood!.add(new Blood.fromJson(v));
      });
    }
  }

  get title => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['available'] = this.available;
    data['pints'] = this.pints;
    if (this.bloodbank != null) {
      data['bloodbank'] = this.bloodbank!.toJson();
    }
    if (this.blood != null) {
      data['blood'] = this.blood!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bloodbank {
  int? id;
  String? title;
  String? location;

  Bloodbank({this.id, this.title, this.location});

  Bloodbank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    return data;
  }
}

class Blood {
  int? id;
  String? title;

  Blood({this.id, this.title});

  Blood.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
