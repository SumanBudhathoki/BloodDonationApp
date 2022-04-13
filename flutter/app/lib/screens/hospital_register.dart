// ignore_for_file: deprecated_member_use

import 'package:app/screens/login_screen.dart';
import 'package:app/state/blood_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospialRegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen-hospital';

  const HospialRegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<HospialRegisterScreen> {
  late String _username;
  late String _password;
  late String _confirmPassword;
  late String _email;
  late String _hospitalName;
  late String _address;
  final _form = GlobalKey<FormState>();

  void _registerNow() async {
    var isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();
    bool isRegister = await Provider.of<BloodState>(context, listen: false)
        .registerNowHospital(_username, _password, _hospitalName, _address);
    if (!isRegister) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is Wrong! Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back'),
                )
              ],
            );
          });
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
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
                        "Register As a Hospital",
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
                          hintText: "Username",
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
                            return "Enter a username";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          _username = v!;
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
                          hintText: "Hospital Nane",
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
                            return "Enter a hospital name";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          _hospitalName = v!;
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
                          _address = v!;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
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
                            return "Enter a password";
                          }
                          return null;
                        },
                        onChanged: (v) {
                          setState(() {
                            _password = v;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
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
                            return "Enter a confirmation password";
                          }
                          if (_password != v) {
                            return "Password doesnot match";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          setState(() {
                            _confirmPassword = v!;
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
                          _registerNow();
                        },
                        child: const Text(
                          "Register Now",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Already have an account??",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routName);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text("Or register with:"),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 160,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.grey,
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/google.png',
                                ),
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
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
      ),
    );
  }
}
