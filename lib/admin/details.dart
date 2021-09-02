import 'package:flutter/material.dart';
import 'adminHome.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("total accounts: " + whole['members'].length.toString()),
              Text("Apartment name: ${whole['details']['name']}"),
              Text("Address: ${whole['details']['address']}"),
              Text("Admin Mobile Number: ${whole['details']['adminmob']}"),
              Text(
                  "Apartment Gate Mobile Number: ${whole['details']['gatemob']}"),
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
