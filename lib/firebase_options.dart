// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBwBhw57V7mVJC7RriA6wMeSi09Eo04_RA',
    appId: '1:167633407726:web:cdad2a7126317c5f5c6dff',
    messagingSenderId: '167633407726',
    projectId: 'schooly-72888',
    authDomain: 'schooly-72888.firebaseapp.com',
    storageBucket: 'schooly-72888.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ1lFhZCjYsn0M9Gn6q3sv7lwGTkhadyM',
    appId: '1:167633407726:android:635316dc2f6a57df5c6dff',
    messagingSenderId: '167633407726',
    projectId: 'schooly-72888',
    storageBucket: 'schooly-72888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtAJPZmxghKVElSNcY4aIUGHSY16MwXUo',
    appId: '1:167633407726:ios:630b97d8176a057b5c6dff',
    messagingSenderId: '167633407726',
    projectId: 'schooly-72888',
    storageBucket: 'schooly-72888.appspot.com',
    iosBundleId: 'com.example.practice',
  );
}