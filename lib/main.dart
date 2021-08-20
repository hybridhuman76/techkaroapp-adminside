import 'package:flutter/material.dart';
import 'admin/adminHome.dart';
import 'homepage.dart';
import 'gatekeeper/gateKeeperHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Check(),
    );
  }
}

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return CheckWhichUser();
    } else {
      return HomePage();
    }
  }
}

class CheckWhichUser extends StatefulWidget {
  @override
  _CheckWhichUserState createState() => _CheckWhichUserState();
}

class _CheckWhichUserState extends State<CheckWhichUser> {
  @override
  Widget build(BuildContext context) {
    if ("admin" == "admin") {
      return AdminHome();
    } else {
      return GateKeeperHome();
    }
  }
}
