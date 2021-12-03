import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/email_singIN/email_signin_page.dart';
import 'package:time_tracker_app/services/auth.dart';
import '../email_singIN/email_signin_page.dart';
import '../widgets/custom_buttons.dart';

class SignInPage extends StatelessWidget {
  SignInPage({required this.auth});
  final AuthBase auth;

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await auth.signInAnonymously();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await auth.signInWithFacebook();
    } on Exception catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              callback: () => _signInWithGoogle(context),
              backgroundColor: Colors.white,
              textColor: Colors.black87),
          const SizedBox(
            height: 10,
          ),
          SocialElevatedButton(
            buttonText: 'Sign in With Facebook',
            imgText: 'facebook-logo.png',
            callback: () => _signInWithFacebook(context),
            backgroundColor: Colors.indigo,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          NormalElevatedButton(
            buttonText: 'Sign in with Email',
            callback: () => _signInWithEmail(context),
            backgroundColor: const Color(0xFF016D60),
            textColor: Colors.white,
            isLoading: false,
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
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
