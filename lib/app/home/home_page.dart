import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_app/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;
  Future<void> _signOut() async {
    try {
      FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
