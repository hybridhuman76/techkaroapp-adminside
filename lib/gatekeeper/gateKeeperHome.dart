import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GateKeeperHome extends StatefulWidget {
  @override
  _GateKeeperHomeState createState() => _GateKeeperHomeState();
}

List<Map> visitorss = [
  {"name": "Aakash", "intime": "12:00", "totalmem": 5, "isvehicle": false},
  {"name": "AakashS", "intime": "2:00", "totalmem": 6, "isvehicle": true}
];

class _GateKeeperHomeState extends State<GateKeeperHome> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    visitors(w) {
      return ListView.builder(
          itemCount: visitors.toString().length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // color: Colors.orange,
                        width: w - 90,
                        child: Text(
                          "hehe",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser.uid)
                                .update({
                              'fam': FieldValue.arrayRemove([visitorss[index]])
                            }).then((_) => Navigator.pop(context));

                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ));
          });
    }

    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      Text("hello"),
      Container(
        height: 500,
        child: visitors(w),
      )
    ])));
  }
}
