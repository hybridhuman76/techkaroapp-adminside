import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techkaro_admin/admin/bills.dart';
import 'package:techkaro_admin/admin/chat.dart';
import 'package:techkaro_admin/admin/complaints.dart';
import 'package:techkaro_admin/admin/details.dart';
import 'package:techkaro_admin/admin/services.dart';
import 'package:techkaro_admin/admin/visitors.dart';
import 'package:techkaro_admin/homepage.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

var whole;
String apt = "";
List<Map> complaints = [];
List<Map> members = [];
List<Map> services = [];
List<Map> visitors = [];
Map<String, String> details;

class _AdminHomeState extends State<AdminHome> {
  x() {
    FirebaseFirestore.instance
        .collection("admins")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    apt = "${value.data()['apt']}";
                    // print(apt);
                    // apt =
                  })
                }
            });
    // .then((_) => {
    //       FirebaseFirestore.instance
    //           .collection("apartments")
    //           .doc(apt)
    //           .get()
    //           .then((value) => {
    //                 if (value.exists)
    //                   {
    //                     setState(() {
    //                       complaints =
    //                           List.from(value.data()['complaints']);
    //                       members = List.from(value.data()['apt']);
    //                       services = List.from(value.data()['services']);
    //                       visitors = List.from(value.data()['visitors']);
    //                       details = Map.from(value.data()['details']);
    //                     })
    //                   }
    //               })
    //     });
  }

  y() {
    FirebaseFirestore.instance
        .collection("apartments")
        .doc(apt)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    whole = value.data();

                    // complaints = List.from(value.data()['complaints']);
                    // print(complaints);
                    // members = List.from(value.data()['apt']);
                    // services = List.from(value.data()['services']);
                    // visitors = List.from(value.data()['visitors']);
                    // details = Map.from(value.data()['details']);
                  }),
                  print(whole)
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    x();
    y();
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hey, welcome!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: cont(w, "  Service\nRequests", 232),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Services()));
                },
              ),
              InkWell(
                child: cont(w, "Chats", 232),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Chat()));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: cont(w, "Visitors", 232),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Visitors()));
                },
              ),
              InkWell(
                child: cont(w, "Complaints", 232),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Complaints()));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: cont(w, "Bills", 232),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bills()));
                },
              ),
              InkWell(
                child: cont(w, "Society\nDetails", 232),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
              ),
            ],
          ),
          InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.orange[500],
                          Colors.deepOrange[800],
                        ])),
                    width: w - 50,
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("LogOut",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ))),
        ],
      ),
    )));
  }
}

cont(w, text, num) {
  return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.orange[500],
              Colors.deepOrange[800],
            ])),
        width: w / 2 - 50,
        height: w / 2 - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text("$text",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "$num",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ));
}
