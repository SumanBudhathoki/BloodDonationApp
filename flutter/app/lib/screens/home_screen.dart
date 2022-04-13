import 'package:app/screens/donate_blood.dart';
import 'package:app/screens/hospital_record.dart';
import 'package:app/screens/request_blood.dart';
import 'package:app/state/blood_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screens';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        drawer: const AppDrawer(),
        body: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img14.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RequestBlood.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Request For Blood"),
                        Icon(Icons.add),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DonateBlood.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Donate Blood"),
                        Icon(Icons.bloodtype),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(HospitalRecord.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Hospital Blood Record"),
                        Icon(Icons.book),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
