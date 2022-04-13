import 'package:app/model/blood.dart';
import 'package:app/screens/bloodgroup_detail.dart';
import 'package:flutter/material.dart';

class SingleBloodType extends StatelessWidget {
  final Blood blood;
  const SingleBloodType({Key? key, required this.blood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(BloodDetail.routeName, arguments: blood.id);
        },
        child: Card(
          color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                blood.title!,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
