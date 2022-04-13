import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/blood.dart';
import '../model/hospital_record.dart';

class BloodState with ChangeNotifier {
  List<HospitalRecordData> _hospitalList = [];
  List<Blood> _bloodgrps = [];
  Future<bool> loginNow(String username, String password) async {
    try {
      String url = 'http://10.0.2.2:8000/api/login/';
      http.Response response = await http.post(
        (Uri.parse(url)),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );
      var data = json.decode(response.body) as Map;
      print(data);
      if (data.containsKey('token')) {
        // print(data['token']);
        return false;
      }
      return true;
    } catch (e) {
      print("Error login");
      print(e);
      return true;
    }
  } //Login function

  Future<bool> registerNow(
      String username, String password, String address) async {
    try {
      String url = 'http://10.0.2.2:8000/api/register/';
      http.Response response = await http.post(
        (Uri.parse(url)),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
          'address': address,
        }),
      );
      var data = json.decode(response.body) as Map;
      if (data['error'] = false) {
        return false;
      }
      print(data);
      return true;
    } catch (e) {
      print("Error Register");
      print(e);
      return true;
    }
  }

  Future<bool> registerNowHospital(String username, String password,
      String hospitalName, String address) async {
    try {
      String url = 'http://10.0.2.2:8000/api/register_hospital/';
      http.Response response = await http.post(
        (Uri.parse(url)),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
          'hospital_name': hospitalName,
          'address': address,
        }),
      );
      var data = json.decode(response.body) as Map;
      // print(data);
      return data['error'];
    } catch (e) {
      print("Error in register");
      print(e);
      return true;
    }
  }

  Future<bool> addrecord(String bloodbankname, String bloodgroup,
      String location, String availablepints, String phone) async {
    try {
      String url = 'http://10.0.2.2:8000/api/addhospitalrecord/';
      http.Response response = await http.post(
        (Uri.parse(url)),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'bloodbankname': bloodbankname,
          'bloodgroup': bloodgroup,
          'location': location,
          'availablepints': availablepints,
          'phone': phone,
        }),
      );
      var data = json.decode(response.body) as Map;
      if (data['error'] = false) {
        return false;
      }
      print(data);
      return true;
    } catch (e) {
      print("Error in add record");
      print(e);
      return true;
    }
  }

  Future<bool> postapplication(
      String fullname, String bloodgroup, String email, String phone) async {
    try {
      String url = 'http://10.0.2.2:8000/api/blooddonationapplication/';
      http.Response response = await http.post(
        (Uri.parse(url)),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'fullname': fullname,
          'bloodgroup': bloodgroup,
          'email': email,
          'phone': phone,
        }),
      );
      var data = json.decode(response.body) as Map;
      if (data['error'] = false) {
        return false;
      }
      print(data);
      return true;
    } catch (e) {
      print("Error in add application for donation");
      print(e);
      return true;
    }
  }

  Future<bool> getallblood() async {
    String url = "http://10.0.2.2:8000/api/blood/";
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = json.decode(response.body) as List;
      List<Blood> blood = [];
      data.forEach((element) {
        Blood bloodgrp = Blood.fromJson(element);
        blood.add(bloodgrp);
      });
      _bloodgrps = blood;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      print("error in get blood groups");
      return false;
    }
  }

  Future<void> getHospitalRecordList() async {
    String url = 'http://10.0.2.2:8000/api/hospitalrecord/';

    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = json.decode(response.body) as Map;

      List<HospitalRecordData> temp = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          HospitalRecordData product = HospitalRecordData.fromJson(element);
          temp.add(product);
        });

        _hospitalList = temp;
        notifyListeners();
      }
    } catch (e) {
      print("Error in getProducts");
      print(e);
    }
  }

  List<HospitalRecordData>? get hospitalrecordlist {
    if (_hospitalList != null) {
      return [..._hospitalList];
    } else {
      return null;
    }
  }

  List<Blood>? get bloodgroups {
    if (_bloodgrps != null) {
      return [..._bloodgrps];
    } else {
      return null;
    }
  }

  List<HospitalRecordData> bloodtypelist(id) {
    return _hospitalList
        .where((element) => element.bloodgroup!.id == id)
        .toList();
  }
}
