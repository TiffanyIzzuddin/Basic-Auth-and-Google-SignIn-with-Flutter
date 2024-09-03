import 'package:ambulance_mobile/service/auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
                if (result == null) {
                  setState(() {
                    errorMessage = 'Could not sign in with those credentials';
                  });
                } else {
                  // pindah halaman
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 12),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
