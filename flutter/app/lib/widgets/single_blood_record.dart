import 'package:flutter/material.dart';

class SingleBloodGroup extends StatelessWidget {
  final String bloodgrp;
  final String title;
  final String pints;
  final String location;
  const SingleBloodGroup({
    Key? key,
    required this.bloodgrp,
    required this.title,
    required this.pints,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        bloodgrp,
        style: TextStyle(fontSize: 28, color: Colors.redAccent),
      ),
      title: Text(title, style: TextStyle(fontSize: 20)),
      dense: true,
      subtitle: Text(
        location,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {},
      trailing: Text("Pints: $pints"),
      isThreeLine: true,
    );
  }
}
