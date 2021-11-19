import 'package:flutter/material.dart';
import '../widgets/custom_buttons.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
      body: buildContent(),
    );
  }

  Widget buildContent() {
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
            callback: () {},
            backgroundColor: const Color(0xFFD7E26B),
            textColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
