import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/email_singIN/email_sign_in_form.dart';
import 'package:time_tracker_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        title: const Text(
          'Sign In',
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(),
          ),
        ),
      ),
    );
  }
}
