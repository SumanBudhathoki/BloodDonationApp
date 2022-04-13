import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/donation.dart';

class DonationState with ChangeNotifier {
  List<Donation> _donationList = [];

  Future<bool> getdonationlist() async {
    String url = "http://10.0.2.2:8000/api/donation/";
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = json.decode(response.body) as Map;
      List<Donation> donation = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          Donation donationlists = Donation.fromJson(element);
          donation.add(donationlists);
        });
        _donationList = donation;
        notifyListeners();
      } else {
        print(data['data']);
      }

      return true;
    } catch (e) {
      print(e);
      print("error in donation");
      return false;
    }
  }

  List<Donation>? get donationlists {
    if (_donationList != null) {
      return [..._donationList];
    } else {
      return null;
    }
  }
}
