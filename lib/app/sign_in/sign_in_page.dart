import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/home/home_page.dart';
import '../widgets/custom_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  final Function(User? ) onsingIn;
  SignInPage({required this.onsingIn});
  


  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      onsingIn(userCredential.user);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        title: const Text(
          'Time Tracker',
        ),
        elevation: 2,
      ),
      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          SocialElevatedButton(
              buttonText: 'Sign in With Google',
              imgText: 'google-logo.png',
              callback: () {
                print("Sign in with Google");
              },
              backgroundColor: Colors.white,
              textColor: Colors.black87),
          const SizedBox(
            height: 10,
          ),
          SocialElevatedButton(
            buttonText: 'Sign in With Facebook',
            imgText: 'facebook-logo.png',
            callback: () {
              print("Sign in with Facebook");
            },
            backgroundColor: Colors.indigo,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          NormalElevatedButton(
            buttonText: 'Sign in with Email',
            callback: () {},
            backgroundColor: const Color(0xFF016D60),
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'OR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          NormalElevatedButton(
            buttonText: 'Go Anonymous',
            callback: () => _signInAnonymously(context),
            backgroundColor: const Color(0xFFD7E26B),
            textColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
