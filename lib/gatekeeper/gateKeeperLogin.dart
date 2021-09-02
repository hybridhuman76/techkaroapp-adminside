import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techkaro_admin/gatekeeper/gateKeeperHome.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class GateKeeperLogin extends StatefulWidget {
  @override
  _GateKeeperLoginState createState() => _GateKeeperLoginState();
}

class _GateKeeperLoginState extends State<GateKeeperLogin> {
  List<String> apartments = [];
  String msg = "";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    String dropdownValue = 'One';
    String pin = "";
    String apt = "";
    TextEditingController aptcon;
    TextEditingController pincon;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Gatekeeper Login",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Container(
              width: w - 50,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextField(
                    controller: aptcon,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: 'Select Apartment',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: pincon,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: 'Security Pin',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                height: 50,
                width: w - 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(colors: [
                      Colors.amberAccent[700],
                      Colors.deepOrange[500]
                    ])),
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () async {
                print(aptcon.text);
                await FirebaseFirestore.instance
                    .collection("apartments")
                    .doc(apt)
                    .get()
                    .then((value) => {
                          if (value.exists)
                            {
                              if (pin == value.data()['pin'].toString())
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GateKeeperHome()))
                                }
                              else
                                {
                                  setState(() {
                                    msg = "Wrong Pin";
                                  })
                                }
                            }
                          else
                            {
                              setState(() {
                                msg = "something went wrong";
                              })
                            }
                        });
                // await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => GateKeeperHome()));

                // final directory = await getApplicationDocumentsDirectory();
                // final file = File('${directory}checkgatekeeper.txt');
                // final text = 'Hello';
                // file.openWrite();
                // // await file.writeAsString(text);
                // await file.writeAsString("gatekeeper");
                // print('saved');
              },
            ),
            Text("$msg"),
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Login as an "),
                    Text(
                      "admin",
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    Text(" instead"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
