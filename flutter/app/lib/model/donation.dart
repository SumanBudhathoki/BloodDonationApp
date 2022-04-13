class Donation {
  int? id;
  String? location;
  String? date;
  String? time;
  Bloodbank? bloodbank;

  Donation({this.id, this.location, this.date, this.time, this.bloodbank});

  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    date = json['date'];
    time = json['time'];
    bloodbank = json['bloodbank'] != null
        ? new Bloodbank.fromJson(json['bloodbank'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    data['date'] = this.date;
    data['time'] = this.time;
    if (this.bloodbank != null) {
      data['bloodbank'] = this.bloodbank!.toJson();
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
