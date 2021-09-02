import 'package:flutter/material.dart';
import 'adminHome.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;

    billslist(w) {
      return ListView.builder(
          itemCount: whole['members'].length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: Icon(Icons.book, size: 50, color: Colors.green),
                  // title: Text(members[index]['flatnum']),
                  subtitle: Text(
                      "outstanding bill: " + whole['members'][index]['bill']),
                ));
          });
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: billslist(w),
      ),
    );
  }
}
