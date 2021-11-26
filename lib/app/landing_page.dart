import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/home/home_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_app/services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomUser>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          CustomUser? user = snapshot.data;
          if (user != null) {
            return HomePage(
              auth: auth,
            );
          }
          return SignInPage(
            auth: auth,
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
