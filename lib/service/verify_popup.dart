import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'auth_service.dart';
import 'auth.dart';

class VerifyEmailLinkScreen extends StatefulWidget {
  @override
  _VerifyEmailLinkScreenState createState() => _VerifyEmailLinkScreenState();
}

class _VerifyEmailLinkScreenState extends State<VerifyEmailLinkScreen> {
  final AuthService _auth = AuthService();
  String infoMessage = '';

  @override
  void initState() {
    super.initState();
    _checkForEmailLink();
  }

  Future<void> _checkForEmailLink() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final Uri? emailLink = Uri.base;

    if (emailLink != null && auth.isSignInWithEmailLink(emailLink.toString())) {
      // Retrieve the email from storage
      String? email =
          'stored_user_email@example.com'; // Replace with actual retrieval

      try {
        User? user =
            await _auth.signInWithEmailLink(email, emailLink.toString());
        if (user != null) {
          setState(() {
            infoMessage = 'Successfully signed in!';
          });
          Navigator.pushReplacementNamed(context, '/home');
        }
      } catch (e) {
        setState(() {
          infoMessage = 'Error signing in: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email Link'),
      ),
      body: Center(
        child: Text(infoMessage),
      ),
    );
  }
}
