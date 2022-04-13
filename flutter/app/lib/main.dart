import 'package:app/screens/bloodgroup_detail.dart';
import 'package:app/screens/donate_blood.dart';
import 'package:app/screens/donation_form.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/hospital_record.dart';
import 'package:app/screens/hospital_register.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/register.dart';
import 'package:app/screens/request_blood.dart';
import 'package:app/state/blood_state.dart';
import 'package:app/state/bloodcollection_state.dart';
import 'package:app/state/donation_state.dart';
import 'package:app/state/hospital.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BloodState(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => BloodCollectionState(),
          // ),
          ChangeNotifierProvider(
            create: (context) => DonationState(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => HospitalState(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.redAccent,
          ),
          home: const HomeScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            LoginScreen.routName: (context) => const LoginScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            HospialRegisterScreen.routeName: (context) =>
                const HospialRegisterScreen(),
            RequestBlood.routeName: (context) => const RequestBlood(),
            DonateBlood.routeName: (context) => const DonateBlood(),
            HospitalRecord.routeName: (context) => const HospitalRecord(),
            BloodDetail.routeName: (context) => const BloodDetail(),
            DonationForm.routeName: (context) => const DonationForm(),
          },
        ));
  }
}
