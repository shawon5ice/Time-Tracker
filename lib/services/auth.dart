import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomUser {
  CustomUser({required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<CustomUser> get onAuthStateChanged;
  Future<CustomUser> currentUser();
  Future<CustomUser> signInAnonymously();
  Future<CustomUser> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  CustomUser _userFromFirebase(User? user) {
    return CustomUser(uid: user!.uid);
  }

  @override
  Stream<CustomUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
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
  Future<CustomUser> signInWithGoogle() async {
    
    final googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      if (googleSignInAuthentication.idToken != null &&
          googleSignInAuthentication.accessToken != null) {
        final authResult = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        ));
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Authentication Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
