// import 'dart:convert';
// import 'package:app/model/hospital_record.dart';
// import 'package:app/screens/hospital_record.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../model/donation.dart';

// class HospitalState with ChangeNotifier {
//   List<HospitalRecordData> _hospitalList = [];

//   Future<bool> getHospitalRecordList() async {
//     String url = "http://10.0.2.2:8000/api/hospitalrecord/";
//     try {
//       http.Response response = await http.get(Uri.parse(url));
//       var data = json.decode(response.body) as Map;
//       List<HospitalRecordData> record = [];
//       if (data['error'] == false) {
//         data['data'].forEach((element) {
//           HospitalRecordData recordlists = HospitalRecordData.fromJson(element);
//           record.add(recordlists);
//         });
//         _hospitalList = record;
//         notifyListeners();
//       } else {
//         print(data['data']);
//       }

//       return true;
//     } catch (e) {
//       print(e);
//       print("error in donation");
//       return false;
//     }
//   }

//   List<HospitalRecordData>? get hospitalrecordlist {
//     if (_hospitalList != null) {
//       return [..._hospitalList];
//     } else {
//       return null;
//     }
//   }
// }
