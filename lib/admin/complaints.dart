import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'adminHome.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;

    complaintlist(w) {
      return ListView.builder(
          itemCount: whole['complaints'].length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListTile(
                    leading: Icon(Icons.book, size: 50, color: Colors.green),
                    title: Text(
                        whole['complaints'][index]['complaint'].toString()),
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
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(apt)
                                                  .update({
                                                    'complaints':
                                                        FieldValue.arrayRemove([
                                                      whole['complaints'][index]
                                                    ])
                                                  })
                                                  .then((value) => {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(whole['complaints']
                                                                        [index]
                                                                    ['userid']
                                                                .toString())
                                                            .update({
                                                          'complaints':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            whole['complaints']
                                                                [index]
                                                          ])
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
        child: complaintlist(w),
        // child: Center(
        // child: Text(whole['complaints'][0]['complaint'].toString()),
        // ),
      ),
    );
  }
}
