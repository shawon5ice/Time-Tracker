import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  CustomUser({required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<CustomUser> currentUser();
  Future<CustomUser> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  CustomUser _userFromFirebase(User? user) {
    return CustomUser(uid: user!.uid);
  }

  @override
  Future<CustomUser> currentUser() async {
    final user = await _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<CustomUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
