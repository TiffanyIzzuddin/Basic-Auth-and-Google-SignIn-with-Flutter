import 'package:ambulance_mobile/form/home.dart';
import 'package:ambulance_mobile/form/register.dart';
import 'package:ambulance_mobile/form/signin.dart';
import 'package:ambulance_mobile/service/signin_link.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      // home: SignInPage2(),
      // home: SignInScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage2(),
        '/home': (context) => AppbarPage(),
        '/verify': (context) => VerifyEmailLinkScreen(),
        '/register': (context) => register(),
      },
    );
  }
}
