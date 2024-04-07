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
    apiKey: 'AIzaSyBc-dO_rEXOKSe4-yDifHvrWCZOZ-9BRqk',
    appId: '1:15871447023:web:7d205dc0d3e70fd13ef01a',
    messagingSenderId: '15871447023',
    projectId: 'totalx-e598f',
    authDomain: 'totalx-e598f.firebaseapp.com',
    storageBucket: 'totalx-e598f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAa7PfoGxT5oBvT0zaO4ryH9YO2TFKzfNs',
    appId: '1:15871447023:android:a2f17f7c73680b4e3ef01a',
    messagingSenderId: '15871447023',
    projectId: 'totalx-e598f',
    storageBucket: 'totalx-e598f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAC47ZNT_aBxI5r4lIx3DVUh9Wa0FbjsZA',
    appId: '1:15871447023:ios:00a3f53bea9001cc3ef01a',
    messagingSenderId: '15871447023',
    projectId: 'totalx-e598f',
    storageBucket: 'totalx-e598f.appspot.com',
    iosBundleId: 'com.example.totalxTask',
  );
}
