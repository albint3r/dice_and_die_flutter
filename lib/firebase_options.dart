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
    apiKey: 'AIzaSyA0wI2OfxQFZuCZvv29qLxS2IuFVjvze8w',
    appId: '1:1057166474255:web:805ef4e81f26905713777a',
    messagingSenderId: '1057166474255',
    projectId: 'dice-n-die',
    authDomain: 'dice-n-die.firebaseapp.com',
    storageBucket: 'dice-n-die.appspot.com',
    measurementId: 'G-KTNH91DZJE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1DPmuWRzWpZa9AxB7JtYzP2YJkN1Q2Z8',
    appId: '1:1057166474255:android:40577e9469e13c9513777a',
    messagingSenderId: '1057166474255',
    projectId: 'dice-n-die',
    storageBucket: 'dice-n-die.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhp5s00n_298p9RxNeLzH8EiTbtybyF4c',
    appId: '1:1057166474255:ios:9ed5affc4e503c7613777a',
    messagingSenderId: '1057166474255',
    projectId: 'dice-n-die',
    storageBucket: 'dice-n-die.appspot.com',
    androidClientId:
        '1057166474255-esqlnbm84236kcvo722jq6ht48pk2tu4.apps.googleusercontent.com',
    iosClientId:
        '1057166474255-cuql44mqi4qk6rrvidoitc49lchlgan5.apps.googleusercontent.com',
    iosBundleId: 'com.example.diceAndDieFlutter',
  );
}
