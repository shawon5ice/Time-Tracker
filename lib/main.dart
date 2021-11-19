import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: SignInPage()
    );
  }
}