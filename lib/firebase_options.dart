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
    apiKey: 'AIzaSyBrRaakJTOSlas32H-Vocv-_ZzU1WqQmqc',
    appId: '1:53451079021:web:0ab9f363b5e00e690f6e64',
    messagingSenderId: '53451079021',
    projectId: 'restaurante-571de',
    authDomain: 'restaurante-571de.firebaseapp.com',
    storageBucket: 'restaurante-571de.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnwpEZB24r_Ns0tX44cCe1HsMcKAZULqM',
    appId: '1:53451079021:android:865929a5871bbfd10f6e64',
    messagingSenderId: '53451079021',
    projectId: 'restaurante-571de',
    storageBucket: 'restaurante-571de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDllZ4aGOOI1C8RIjW6L54f8L_fhzFos9A',
    appId: '1:53451079021:ios:8859b335b24122730f6e64',
    messagingSenderId: '53451079021',
    projectId: 'restaurante-571de',
    storageBucket: 'restaurante-571de.appspot.com',
    iosBundleId: 'com.example.financeApp',
  );
}
