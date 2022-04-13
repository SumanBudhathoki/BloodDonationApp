import 'package:app/state/blood_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationForm extends StatefulWidget {
  static const routeName = "/donation-form";
  const DonationForm({Key? key}) : super(key: key);

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  late String _fullname;
  late String _bloodgroup;
  late String _phone;
  late String _email;
  final _form = GlobalKey<FormState>();

  void _saveapplication() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    final add = await Provider.of<BloodState>(context, listen: false)
        .postapplication(_fullname, _bloodgroup, _email, _phone);
    _form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donation Form")),
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
                      "Donate Blood",
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
                        hintText: "Full Name",
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
                          return "Enter your full name";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _fullname = v!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
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
                          return "Enter a email";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _email = v!;
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
                        _phone = v!;
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
                        _saveapplication();
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
