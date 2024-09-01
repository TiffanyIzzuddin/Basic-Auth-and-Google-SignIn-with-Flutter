// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCK9p0l-AYN5jW2z9IeSNumSpEqWRBg6mM',
    appId: '1:805551205069:web:1e0a6258dd1bf2ad00d784',
    messagingSenderId: '805551205069',
    projectId: 'flutter-5b186',
    authDomain: 'flutter-5b186.firebaseapp.com',
    storageBucket: 'flutter-5b186.appspot.com',
    measurementId: 'G-49Z1NZ22P7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkU3aDXdFlxNbBis6Sb71dURXSFw5HlNI',
    appId: '1:805551205069:android:21654adf0a8ba3e700d784',
    messagingSenderId: '805551205069',
    projectId: 'flutter-5b186',
    storageBucket: 'flutter-5b186.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG4H15gVppSAc-r2DHySBvG8uHVfiA-Uc',
    appId: '1:805551205069:ios:e890663b8c16b16800d784',
    messagingSenderId: '805551205069',
    projectId: 'flutter-5b186',
    storageBucket: 'flutter-5b186.appspot.com',
    iosBundleId: 'com.example.ambulanceMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAG4H15gVppSAc-r2DHySBvG8uHVfiA-Uc',
    appId: '1:805551205069:ios:e890663b8c16b16800d784',
    messagingSenderId: '805551205069',
    projectId: 'flutter-5b186',
    storageBucket: 'flutter-5b186.appspot.com',
    iosBundleId: 'com.example.ambulanceMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCK9p0l-AYN5jW2z9IeSNumSpEqWRBg6mM',
    appId: '1:805551205069:web:340ec1afa79fa1b700d784',
    messagingSenderId: '805551205069',
    projectId: 'flutter-5b186',
    authDomain: 'flutter-5b186.firebaseapp.com',
    storageBucket: 'flutter-5b186.appspot.com',
    measurementId: 'G-9QB7DN25N5',
  );

}