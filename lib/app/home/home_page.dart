import 'package:flutter/material.dart';
import 'package:time_tracker_app/services/auth.dart';
import 'package:time_tracker_app/services/auth_provider.dart';

class HomePage extends StatelessWidget {
  
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      auth.signOut();
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          TextButton(
            onPressed: ()=>_signOut(context),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body:const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
