import 'package:app/state/blood_state.dart';
import 'package:app/widgets/single_blood_record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodDetail extends StatefulWidget {
  static const routeName = "/blood_group_details";
  const BloodDetail({Key? key}) : super(key: key);

  @override
  State<BloodDetail> createState() => _BloodDetailState();
}

class _BloodDetailState extends State<BloodDetail> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final blooddetail = Provider.of<BloodState>(context).bloodtypelist(id);
    final bloodtype = Provider.of<BloodState>(context).bloodgroups;
    var length = blooddetail.length;
    if (length >= 1) {
      return Scaffold(
        appBar: AppBar(title: const Text("Blood Detail")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 25,
            ),
            itemCount: blooddetail.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleBloodGroup(
                title: blooddetail[index].bloodbankname!,
                bloodgrp: blooddetail[index].bloodgroup!.title!,
                location: blooddetail[index].location!,
                pints: blooddetail[index].availablepints!,
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Blood Detail"),
        ),
        body: const Center(
          child: Text("No blood available of this type"),
        ),
      );
    }
  }
}
