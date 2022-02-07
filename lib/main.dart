import 'package:fl03_lite/screens/ex0/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

