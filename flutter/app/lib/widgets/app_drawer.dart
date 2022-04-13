import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logoutnow() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
    }

    return Drawer(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        // Image.network(
        //   'https://images.unsplash.com/photo-1554290712-e640351074bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80',
        //   width: 300,
        // ),
        const Text('About'),
        const Text(
            'Hello User, This is a blood bank management app. After creating an account, you can donate or request for blood.'),
        const Spacer(),
        ListTile(
          onTap: () {
            _logoutnow();
          },
          trailing: Icon(Icons.logout),
          title: Text("Logout"),
        )
      ]),
    );
  }
}
