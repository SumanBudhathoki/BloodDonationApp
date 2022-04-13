class HospitalRecordData {
  int? id;
  String? bloodbankname;
  String? location;
  String? availablepints;
  String? phone;
  Bloodgroup? bloodgroup;

  HospitalRecordData(key, value,
      {this.id,
      this.bloodbankname,
      this.location,
      this.availablepints,
      this.phone,
      this.bloodgroup});

  HospitalRecordData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodbankname = json['bloodbankname'];
    location = json['location'];
    availablepints = json['availablepints'];
    phone = json['phone'];
    bloodgroup = json['bloodgroup'] != null
        ? new Bloodgroup.fromJson(json['bloodgroup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bloodbankname'] = this.bloodbankname;
    data['location'] = this.location;
    data['availablepints'] = this.availablepints;
    data['phone'] = this.phone;
    if (this.bloodgroup != null) {
      data['bloodgroup'] = this.bloodgroup!.toJson();
    }
    return data;
  }
}

class Bloodgroup {
  int? id;
  String? title;

  Bloodgroup({this.id, this.title});

  Bloodgroup.fromJson(Map<String, dynamic> json) {
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
