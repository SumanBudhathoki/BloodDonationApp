import 'package:app/screens/register.dart';
import 'package:app/state/blood_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  late String _username;
  late String _password;

  void _loginNow() async {
    var isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();
    bool islogin = await Provider.of<BloodState>(context, listen: false)
        .loginNow(_username, _password);
    if (!islogin) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is Wrong! Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.redAccent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/appLogo.png'),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _username = value!;
                            },
                            decoration: const InputDecoration(
                                hintText: "Username",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value!;
                            },
                            decoration: const InputDecoration(
                                hintText: "Password",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ))),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: () {
                              _loginNow();
                            },
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            color: Colors.redAccent,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Doesn't have account yet??",
                            style: TextStyle(fontSize: 17),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed(
                                    RegisterScreen.routeName);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 17,
                                    decoration: TextDecoration.underline),
                              ))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
