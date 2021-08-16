import 'package:flutter/material.dart';
import 'admin/adminHome.dart';
import 'homepage.dart';
import 'gatekeeper/gateKeeperHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Check(),
    );
  }
}

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    if ("user" != null) {
      return CheckWhichUser();
    } else {
      return HomePage();
    }
  }
}

class CheckWhichUser extends StatefulWidget {
  const CheckWhichUser({Key? key}) : super(key: key);

  @override
  _CheckWhichUserState createState() => _CheckWhichUserState();
}

class _CheckWhichUserState extends State<CheckWhichUser> {
  @override
  Widget build(BuildContext context) {
    if ("user" == "admin") {
      return AdminHome();
    } else {
      return GateKeeperHome();
    }
  }
}
