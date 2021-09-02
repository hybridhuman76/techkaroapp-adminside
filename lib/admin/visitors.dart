import 'package:flutter/material.dart';
import 'adminHome.dart';

class Visitors extends StatefulWidget {
  @override
  _VisitorsState createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;

    visitorslist(w) {
      if (whole['visitors'] == null) {
        return Center(child: Text("No pending requests"));
      } else {
        return ListView.builder(
            itemCount: whole['visitors'].length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListTile(
                    leading: Icon(Icons.book, size: 50, color: Colors.green),
                    title: Text(whole['visitors'][index]['visitmap']
                            ['isvehicle']
                        .toString()),
                  ));
            });
      }
      // return ListView.builder(
      //     itemCount: visitors.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Padding(
      //           padding: EdgeInsets.only(top: 20),
      //           child: ListTile(
      //             leading: Icon(Icons.book, size: 50, color: Colors.green),
      //             title: Text(members[index]['userid']),
      //           ));
      //     });
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: visitorslist(w),
      ),
    );
  }
}
