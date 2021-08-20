import 'package:flutter/material.dart';
import 'package:techkaro_admin/gatekeeper/gateKeeperHome.dart';

class GateKeeperLogin extends StatefulWidget {
  @override
  _GateKeeperLoginState createState() => _GateKeeperLoginState();
}

class _GateKeeperLoginState extends State<GateKeeperLogin> {
  List<String> apartments = [];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    String dropdownValue = 'One';
    String pin;
    String apt;
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
                    onChanged: (value) {
                      apt = value;
                    },
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
                    onChanged: (value) {
                      pin = value;
                    },
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
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GateKeeperHome()));
              },
            ),
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
