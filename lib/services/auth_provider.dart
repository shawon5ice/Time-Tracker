import 'package:flutter/material.dart';
import 'package:time_tracker_app/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({required this.auth, Key? key, required Widget child})
      : super(key: key, child: child);
  final AuthBase auth;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AuthBase of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }
}
