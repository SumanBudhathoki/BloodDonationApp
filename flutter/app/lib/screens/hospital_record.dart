import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../state/blood_state.dart';

class HospitalRecord extends StatefulWidget {
  static const routeName = '/record-screen';
  const HospitalRecord({Key? key}) : super(key: key);

  @override
  State<HospitalRecord> createState() => _HospitalRecordState();
}

class _HospitalRecordState extends State<HospitalRecord> {
  late String _bloodbankname;
  late String _location;
  late String _bloodgroup;
  late String _availablepints;
  late String _phone;
  final _form = GlobalKey<FormState>();

  void _addPost() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    final add = await Provider.of<BloodState>(context, listen: false).addrecord(
        _bloodbankname, _bloodgroup, _location, _availablepints, _phone);
    Fluttertoast.showToast(
        msg: "Record added successfully!", gravity: ToastGravity.BOTTOM);
    _form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Blood Record"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Hospital Record Form",
                      style: TextStyle(
                          fontSize: 25,
                          // fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Bloodbank Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.redAccent,
                        )),
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter blood bank name";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _bloodbankname = v!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Address",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.redAccent,
                        )),
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter a address";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _location = v!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Blood Group",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.redAccent,
                        )),
                      ),
                      onSaved: (v) {
                        _bloodgroup = v!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Available Pints",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.redAccent,
                        )),
                      ),
                      onSaved: (v) {
                        _availablepints = v!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Contact Number",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.redAccent,
                        )),
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter your phone number";
                        }
                      },
                      onSaved: (v) {
                        setState(() {
                          _phone = v!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      // color: Colors.redAccent,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: const EdgeInsets.all(13),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),

                      onPressed: () {
                        _addPost();
                      },
                      child: const Text(
                        "Submit ",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
