import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in with the credential and get the user
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      // If the sign-in was successful, navigate to /home
      Navigator.of(context).pushReplacementNamed('/home');
    }
  } catch (e) {
    print("Error during Google Sign-In: $e");
    // Optionally show an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed. Please try again.')));
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google if signed in with Google
    await GoogleSignIn().signOut();

    print("User signed out successfully.");

    // Navigate back to the login screen
    Navigator.of(context).pushReplacementNamed('/');
  } catch (e) {
    print("Error signing out: $e");
    // Optionally show an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed. Please try again.')));
  }
}
