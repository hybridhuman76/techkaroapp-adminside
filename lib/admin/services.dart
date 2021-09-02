import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'adminHome.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;

    servicelist(w) {
      return ListView.builder(
          itemCount: whole['services'].length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                    leading: Icon(Icons.book, size: 50, color: Colors.green),
                    title: Text(whole['services'][index]['req'].toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Center(
                                    child: Container(
                                  color: Colors.white,
                                  height: 200,
                                  width: w - 40,
                                  child: Column(
                                    children: <Widget>[
                                      Text("Mark as resolved?"),
                                      Row(
                                        children: <Widget>[
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("cancel"),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              String submit = whole["req"]
                                                      [index]
                                                  .toString()
                                                  .toLowerCase();
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(apt)
                                                  .update({
                                                    'services':
                                                        FieldValue.arrayRemove([
                                                      whole['req'][index]
                                                    ])
                                                  })
                                                  .then((value) => {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(whole['services']
                                                                        [index]
                                                                    ['userid']
                                                                .toString())
                                                            .update({
                                                          'services.$submit':
                                                              false
                                                        })
                                                      })
                                                  .then((value) =>
                                                      {Navigator.pop(context)});
                                            },
                                            child: Text("yes"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )));
                      },
                    )));
          });
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: servicelist(w),
        // child: Center(
        // child: Text(whole['complaints'][0]['complaint'].toString()),
        // ),
      ),
    );
  }
}
