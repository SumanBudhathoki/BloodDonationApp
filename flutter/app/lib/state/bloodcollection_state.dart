// import 'dart:convert';
// import 'package:app/model/bloodgroup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

// class BloodCollectionState with ChangeNotifier {
//   List<BloodCollections> _bloodcollection = [];

//   Future<bool> getallblooddetail() async {
//     String url = "http://10.0.2.2:8000/api/bloodcollection/";
//     try {
//       http.Response response = await http
//           .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
//       var data = json.decode(response.body) as Map;
//       List<BloodCollections> blood = [];
//       if (data['error'] == false) {
//         data['data'].forEach((element) {
//           BloodCollections bloodcollect = BloodCollections.fromJson(element);
//           blood.add(bloodcollect);
//         });
//         _bloodcollection = blood;
//         notifyListeners();
//       } else {
//         print(data['data']);
//       }

//       _bloodcollection = blood;
//       print(_bloodcollection);
//       return true;
//     } catch (e) {
//       print(e);
//       print("error in get blood groups details");
//       return false;
//     }
//   }

//   List<BloodCollections>? get bloodcollection {
//     if (_bloodcollection != null) {
//       return [..._bloodcollection];
//     } else {
//       return null;
//     }
//   }
// }
