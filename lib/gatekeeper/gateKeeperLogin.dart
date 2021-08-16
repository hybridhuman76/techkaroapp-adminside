import 'package:flutter/material.dart';

class GateKeeperLogin extends StatefulWidget {
  const GateKeeperLogin({Key? key}) : super(key: key);

  @override
  _GateKeeperLoginState createState() => _GateKeeperLoginState();
}

class _GateKeeperLoginState extends State<GateKeeperLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Login"),
            TextField(),
            TextField(),
            MaterialButton(
              onPressed: () {},
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
