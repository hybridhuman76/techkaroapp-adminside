import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Admin Login"),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(),
                  TextField(),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Login"),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Login as a gatekeeper instead"),
            ),
            MaterialButton(onPressed: () {
              launch("tel://214324234");
            })
          ],
        ),
      ),
    );
  }
}
