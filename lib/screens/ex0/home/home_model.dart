import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  bool isLoading = false;
  String? username;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final data = snapshot.data();
    this.username = data?['username'];
    notifyListeners();
  }

}