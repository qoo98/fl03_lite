import 'package:fl03_lite/screens/ex0/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl03_lite/screens/ex0/home/home_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override


  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel()..fetchUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Login'),
          centerTitle: true,
          leading: ElevatedButton(
            onPressed: () => _signOut(),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Consumer<HomeModel>(
            builder: (context, model, child) {
              String text;
              if(model.username == null) {
                text = 'Welcome';
              } else {
                text = 'Welcome,' + model.username!;
              }
              return Text(
                text,
                style: TextStyle(fontSize: 40, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }

  _signOut() async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Sign Out"),
              content: Text("Do you want to sign out?"),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text("Sign Out", style: TextStyle(
                    color: Colors.red,
                  ),),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ],
            ));
  }
}
