import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/services/auth.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Something went worng'),
          content: Text('Do you want to exit now?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'OK');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await auth.signOut();
                Navigator.pop(context, 'OK');
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
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
            onPressed: () => _signOut(context),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
