import 'package:app/model/donation.dart';
import 'package:app/screens/donation_form.dart';
import 'package:app/state/donation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonateBlood extends StatefulWidget {
  static const routeName = '/donate-screen';

  const DonateBlood({Key? key}) : super(key: key);

  @override
  State<DonateBlood> createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  bool _init = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<DonationState>(context).getdonationlist();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DonationState>(context).donationlists;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate Blood List"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        // padding: EdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 20,
          ),
          itemCount: data!.length,
          itemBuilder: (context, i) => DonationList(
            bloodbankname: data[i].bloodbank!.title,
            location: data[i].location,
            date: data[i].date,
            time: data[i].time,
          ),
        ),
      ),
    );
  }
}

class DonationList extends StatelessWidget {
  final bloodbankname;
  final date;
  final location;
  final time;

  // final VoidCallback onPressed;

  const DonationList(
      {Key? key,
      this.bloodbankname,
      // required this.onPressed,
      this.date,
      this.location,
      this.time})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: 100,
      height: 200,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(DonationForm.routeName);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.red[400],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Beneficiary Blood: ${bloodbankname}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "Location: ${location}",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    "Date: ${date}",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    "Time: ${time}",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
