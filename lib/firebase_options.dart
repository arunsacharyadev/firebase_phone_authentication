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
        return macos;
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
    apiKey: 'AIzaSyDySH0fWsPuKy4_lTB25rax-TLi3zDDCew',
    appId: '1:659118004063:web:33fcfdb8bc6c4eb5e048ea',
    messagingSenderId: '659118004063',
    projectId: 'fir-phone-authentication-7e465',
    authDomain: 'fir-phone-authentication-7e465.firebaseapp.com',
    storageBucket: 'fir-phone-authentication-7e465.appspot.com',
    measurementId: 'G-V8ZLM5YCZY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvVn5i9u0ubMlTDAXmKiK2DT_bXSqIxNU',
    appId: '1:659118004063:android:b500d5d63e1cf6c2e048ea',
    messagingSenderId: '659118004063',
    projectId: 'fir-phone-authentication-7e465',
    storageBucket: 'fir-phone-authentication-7e465.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBouNoAFC38QIB6qaP3hTb-l0bx7k9AdoU',
    appId: '1:659118004063:ios:673f0382f918913ae048ea',
    messagingSenderId: '659118004063',
    projectId: 'fir-phone-authentication-7e465',
    storageBucket: 'fir-phone-authentication-7e465.appspot.com',
    iosBundleId: 'com.example.firebasePhoneAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBouNoAFC38QIB6qaP3hTb-l0bx7k9AdoU',
    appId: '1:659118004063:ios:80c9bc5e623aa281e048ea',
    messagingSenderId: '659118004063',
    projectId: 'fir-phone-authentication-7e465',
    storageBucket: 'fir-phone-authentication-7e465.appspot.com',
    iosBundleId: 'com.example.firebasePhoneAuthentication.RunnerTests',
  );
}
