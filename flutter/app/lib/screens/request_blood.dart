import 'package:app/screens/singleblood.dart';
import 'package:app/state/blood_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestBlood extends StatefulWidget {
  static const routeName = '/request-blood-screen';

  const RequestBlood({Key? key}) : super(key: key);

  @override
  State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  bool _init = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<BloodState>(context).getallblood();
      Provider.of<BloodState>(context).getHospitalRecordList();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<HospitalState>(context).hospitalrecordlist;
    final data = Provider.of<BloodState>(context).bloodgroups;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request for Blood"),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        // padding: EdgeInsets.all(20),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 20,
                ),
            itemCount: data!.length,
            itemBuilder: (context, i) => SingleBloodType(blood: data[i])),
      ),
    );
  }
}
