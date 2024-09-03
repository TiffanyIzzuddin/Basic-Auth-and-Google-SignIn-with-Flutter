import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // return user;

      // Check if the email is verified
      if (user != null && user.emailVerified) {
        return user;
      } else {
        await _auth.signOut();
        return null; // Email not verified
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Send sign-in link to the email
  Future<void> sendSignInLinkToEmail(String email) async {
    try {
      ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: 'https://flutter-5b186.firebaseapp.com',
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'com.example.ambulance_mobile',
        androidInstallApp: true,
        androidMinimumVersion: '12',
      );

      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Sign in with the email link
  Future<User?> signInWithEmailLink(String email, String emailLink) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailLink(email: email, emailLink: emailLink);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Send email verification
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
